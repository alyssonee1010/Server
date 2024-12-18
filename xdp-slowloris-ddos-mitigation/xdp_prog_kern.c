#include <linux/in.h>
#include <linux/bpf.h>
#include <linux/if_ether.h>
#include <linux/ip.h>
#include <linux/tcp.h>
#include <bpf/bpf_endian.h>
#include <bpf/bpf_helpers.h>
#include "common/parsing_helpers.h"
#include "common/rewrite_helpers.h"
#include "common/xdp_stats_kern_user.h"
#include "common/xdp_stats_kern.h"

#define MAX_HALF_OPEN_CONNECTIONS 50
#define CONNECTION_WINDOW_NS 1000000000 // 1 second window
#define NANO 1000000000

struct {
    __uint(type, BPF_MAP_TYPE_LRU_HASH);
    __uint(max_entries, 10240);
    __type(key, __u32);   // Source IP
    __type(value, struct profile);
} xdp_slowloris_suspect_map SEC(".maps");

SEC("xdp_slowloris_mitigation")
int xdp_slowloris_mitigation_func(struct xdp_md *ctx)
{
    /* Default response */
    int action = XDP_PASS;
    
    /* Setup the parsing header */
    void *data = (void *)(long)ctx->data;
    void *data_end = (void *)(long)ctx->data_end;
    struct hdr_cursor nh = { .pos = data };
    
    /* Layer2 (Link) */
    int eth_type;
    struct ethhdr *eth;
    
    /* Layer3 (Network) */
    struct iphdr *iphdr;
    
    /* Layer4 (Transport) */
    struct tcphdr *tcphdr;
    
    /* Slowloris Mitigation */
    __u64 current_time = bpf_ktime_get_ns();
    struct profile *target_profile;
    
    /* Layer2 Parsing */
    eth_type = parse_ethhdr(&nh, data_end, &eth);
    if (eth_type < 0 || eth_type != bpf_htons(ETH_P_IP)) {
        action = XDP_PASS;
        goto out;
    }
    
    /* Layer3 Parsing (IPv4 only) */
    if (parse_iphdr(&nh, data_end, &iphdr) != IPPROTO_TCP) {
        action = XDP_PASS;
        goto out;
    }
    
    /* Layer4 Parsing (TCP) */
    if (parse_tcphdr(&nh, data_end, &tcphdr) < 0) {
        action = XDP_ABORTED;
        goto out;
    }
    
    /* Only track SYN packets for half-open connection tracking */
    if (!tcphdr->syn) {
        action = XDP_PASS;
        goto out;
    }
    
    /* Update or create profile for this source IP */
    target_profile = xdp_slowloris_suspect_record(ctx, bpf_ntohs(iphdr->saddr));
    if (!target_profile) {
        action = XDP_ABORTED;
        goto out;
    }
    
    /* Slowloris Mitigation Logic */
    __u64 elapsed_time = (current_time - target_profile->last_seen) / NANO;
    
    /* Reset connection count if outside time window */
    if (elapsed_time > 1) {
        target_profile->cur_half_open_connections = 1;
        target_profile->last_seen = current_time;
        action = XDP_PASS;
    } else {
        /* Increment half-open connection count */
        target_profile->cur_half_open_connections++;
        
        /* Apply mitigation if max connections exceeded */
        if (target_profile->cur_half_open_connections > MAX_HALF_OPEN_CONNECTIONS) {
            target_profile->action = XDP_DROP;
            action = XDP_DROP;
        }
    }
    
out:
    /* Record the action into the stats map and return the action value */
    return xdp_stats_record_action(ctx, action);
}

char _license[] SEC("license") = "GPL";

/* Helper function for tracking Slowloris suspects - similar to original, adapted for TCP */
/* Modify the implementation to exactly match the prototype */
static __always_inline
struct profile *xdp_slowloris_suspect_record(struct xdp_md *ctx, __u32 suspect)
{
    int ret;
    struct profile *profile;
    struct profile new_profile = { 0 };
    
    /* Existing implementation remains the same */
    profile = bpf_map_lookup_elem(&xdp_slowloris_suspect_map, &suspect);
    if (!profile) {
        /* Create an element for this suspect */
        new_profile.cur_half_open_connections = 1;
        new_profile.cur_rx_bytes = (ctx->data_end - ctx->data);
        new_profile.last_seen = bpf_ktime_get_ns();
        new_profile.action = XDP_PASS;
        
        ret = bpf_map_update_elem(&xdp_slowloris_suspect_map, &suspect, &new_profile, BPF_NOEXIST);
        if (ret < 0) {
            return NULL;
        } else {
            return bpf_map_lookup_elem(&xdp_slowloris_suspect_map, &suspect);
        }
    } else {
        profile->cur_rx_bytes += (ctx->data_end - ctx->data);
        return profile;
    }
}
