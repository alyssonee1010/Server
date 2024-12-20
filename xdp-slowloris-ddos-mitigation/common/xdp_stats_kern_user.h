/* SPDX-License-Identifier: GPL-2.0 */

/* Used by BPF-prog kernel side BPF-progs and userspace programs,
 * for sharing xdp_stats common struct and DEFINEs.
 */
#ifndef __XDP_STATS_KERN_USER_H
#define __XDP_STATS_KERN_USER_H

/* This is the data record stored in the map */
struct datarec {
	__u64 rx_packets;
	__u64 rx_bytes;
};

#ifndef XDP_ACTION_MAX
#define XDP_ACTION_MAX (XDP_REDIRECT + 1)
#endif

struct profile {
    __u64 cur_half_open_connections;  // New field
    __u64 cur_rx_packets;
    __u64 pre_rx_packets;
    __u64 cur_rx_bytes;
    __u64 pre_rx_bytes;
    __u64 last_seen;
    int action;
};

#ifndef XDP_SUSPECT_MAX
#define XDP_SUSPECT_MAX 4096
#endif

#endif /* __XDP_STATS_KERN_USER_H */
