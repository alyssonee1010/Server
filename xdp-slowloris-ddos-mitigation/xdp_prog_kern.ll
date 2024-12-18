; ModuleID = 'xdp_prog_kern.c'
source_filename = "xdp_prog_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.bpf_map_def = type { i32, i32, i32, i32, i32 }
%struct.anon.1 = type { ptr, ptr, ptr, ptr }
%struct.profile = type { i64, i64, i64, i64, i64, i64, i32 }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { i32, i32 }
%struct.tcphdr = type { i16, i16, i32, i32, i16, i16, i16, i16 }
%struct.datarec = type { i64, i64 }

@xdp_stats_map = dso_local global %struct.bpf_map_def { i32 6, i32 4, i32 16, i32 5, i32 0 }, section "maps", align 4, !dbg !0
@xdp_icmp_suspect_map = dso_local global %struct.bpf_map_def { i32 1, i32 4, i32 56, i32 4096, i32 0 }, section "maps", align 4, !dbg !59
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !70
@xdp_slowloris_suspect_map = dso_local global %struct.anon.1 zeroinitializer, section ".maps", align 8, !dbg !76
@llvm.compiler.used = appending global [5 x ptr] [ptr @_license, ptr @xdp_icmp_suspect_map, ptr @xdp_slowloris_mitigation_func, ptr @xdp_slowloris_suspect_map, ptr @xdp_stats_map], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_slowloris_mitigation_func(ptr nocapture noundef readonly %0) #0 section "xdp_slowloris_mitigation" !dbg !132 {
  %2 = alloca i32, align 4, !DIAssignID !225
  %3 = alloca i32, align 4, !DIAssignID !226
  %4 = alloca %struct.profile, align 8, !DIAssignID !227
  tail call void @llvm.dbg.value(metadata ptr %0, metadata !145, metadata !DIExpression()), !dbg !228
  tail call void @llvm.dbg.value(metadata i32 2, metadata !146, metadata !DIExpression()), !dbg !228
  %5 = load i32, ptr %0, align 4, !dbg !229, !tbaa !230
  %6 = zext i32 %5 to i64, !dbg !235
  %7 = inttoptr i64 %6 to ptr, !dbg !236
  tail call void @llvm.dbg.value(metadata ptr %7, metadata !147, metadata !DIExpression()), !dbg !228
  %8 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 1, !dbg !237
  %9 = load i32, ptr %8, align 4, !dbg !237, !tbaa !238
  %10 = zext i32 %9 to i64, !dbg !239
  %11 = inttoptr i64 %10 to ptr, !dbg !240
  tail call void @llvm.dbg.value(metadata ptr %11, metadata !148, metadata !DIExpression()), !dbg !228
  tail call void @llvm.dbg.value(metadata ptr %7, metadata !149, metadata !DIExpression()), !dbg !228
  %12 = tail call i64 inttoptr (i64 5 to ptr)() #6, !dbg !241
  tail call void @llvm.dbg.value(metadata i64 %12, metadata !221, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.value(metadata ptr undef, metadata !242, metadata !DIExpression()), !dbg !251
  call void @llvm.dbg.value(metadata ptr %11, metadata !249, metadata !DIExpression()), !dbg !251
  call void @llvm.dbg.value(metadata ptr undef, metadata !250, metadata !DIExpression()), !dbg !251
  call void @llvm.dbg.value(metadata ptr undef, metadata !253, metadata !DIExpression()), !dbg !278
  call void @llvm.dbg.value(metadata ptr %11, metadata !265, metadata !DIExpression()), !dbg !278
  call void @llvm.dbg.value(metadata ptr undef, metadata !266, metadata !DIExpression()), !dbg !278
  call void @llvm.dbg.value(metadata ptr null, metadata !267, metadata !DIExpression()), !dbg !278
  call void @llvm.dbg.value(metadata ptr %7, metadata !268, metadata !DIExpression()), !dbg !278
  call void @llvm.dbg.value(metadata i32 14, metadata !269, metadata !DIExpression()), !dbg !278
  %13 = getelementptr inbounds i8, ptr %7, i64 14, !dbg !280
  %14 = icmp ugt ptr %13, %11, !dbg !282
  br i1 %14, label %15, label %17, !dbg !283

15:                                               ; preds = %1
  tail call void @llvm.dbg.value(metadata ptr poison, metadata !149, metadata !DIExpression()), !dbg !228
  tail call void @llvm.dbg.value(metadata i32 -1, metadata !154, metadata !DIExpression()), !dbg !228
  %16 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 true)
  br label %123, !dbg !284

17:                                               ; preds = %1
  tail call void @llvm.dbg.value(metadata ptr %13, metadata !149, metadata !DIExpression()), !dbg !228
  tail call void @llvm.dbg.value(metadata ptr %7, metadata !155, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.value(metadata ptr %13, metadata !270, metadata !DIExpression()), !dbg !278
  %18 = getelementptr inbounds %struct.ethhdr, ptr %7, i64 0, i32 2, !dbg !286
  call void @llvm.dbg.value(metadata i16 poison, metadata !276, metadata !DIExpression()), !dbg !278
  call void @llvm.dbg.value(metadata i32 0, metadata !277, metadata !DIExpression()), !dbg !278
  %19 = load i16, ptr %18, align 1, !dbg !278, !tbaa !287
  call void @llvm.dbg.value(metadata i16 %19, metadata !276, metadata !DIExpression()), !dbg !278
  call void @llvm.dbg.value(metadata ptr %13, metadata !270, metadata !DIExpression()), !dbg !278
  call void @llvm.dbg.value(metadata i32 0, metadata !277, metadata !DIExpression()), !dbg !278
  call void @llvm.dbg.value(metadata ptr %13, metadata !270, metadata !DIExpression()), !dbg !278
  call void @llvm.dbg.value(metadata i16 %19, metadata !289, metadata !DIExpression()), !dbg !294
  %20 = icmp eq i16 %19, 129, !dbg !300
  %21 = icmp eq i16 %19, -22392, !dbg !301
  %22 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 1, i1 %20)
  %23 = or i1 %21, %22, !dbg !301
  br i1 %23, label %24, label %40, !dbg !302

24:                                               ; preds = %17
  %25 = getelementptr inbounds i8, ptr %7, i64 18, !dbg !303
  %26 = icmp ugt ptr %25, %11, !dbg !305
  br i1 %26, label %40, label %27, !dbg !306

27:                                               ; preds = %24
  call void @llvm.dbg.value(metadata i16 poison, metadata !276, metadata !DIExpression()), !dbg !278
  %28 = getelementptr inbounds i8, ptr %7, i64 16, !dbg !307
  call void @llvm.dbg.value(metadata ptr %25, metadata !270, metadata !DIExpression()), !dbg !278
  call void @llvm.dbg.value(metadata i32 1, metadata !277, metadata !DIExpression()), !dbg !278
  %29 = load i16, ptr %28, align 1, !dbg !278, !tbaa !287
  call void @llvm.dbg.value(metadata i16 %29, metadata !276, metadata !DIExpression()), !dbg !278
  call void @llvm.dbg.value(metadata i32 1, metadata !277, metadata !DIExpression()), !dbg !278
  call void @llvm.dbg.value(metadata ptr %25, metadata !270, metadata !DIExpression()), !dbg !278
  call void @llvm.dbg.value(metadata i16 %29, metadata !289, metadata !DIExpression()), !dbg !294
  %30 = icmp eq i16 %29, 129, !dbg !300
  %31 = icmp eq i16 %29, -22392, !dbg !301
  %32 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 1, i1 %30)
  %33 = or i1 %31, %32, !dbg !301
  br i1 %33, label %34, label %40, !dbg !302

34:                                               ; preds = %27
  %35 = getelementptr inbounds i8, ptr %7, i64 22, !dbg !303
  %36 = icmp ugt ptr %35, %11, !dbg !305
  br i1 %36, label %40, label %37, !dbg !306

37:                                               ; preds = %34
  call void @llvm.dbg.value(metadata i16 poison, metadata !276, metadata !DIExpression()), !dbg !278
  %38 = getelementptr inbounds i8, ptr %7, i64 20, !dbg !307
  call void @llvm.dbg.value(metadata ptr %35, metadata !270, metadata !DIExpression()), !dbg !278
  call void @llvm.dbg.value(metadata i32 2, metadata !277, metadata !DIExpression()), !dbg !278
  %39 = load i16, ptr %38, align 1, !dbg !278, !tbaa !287
  call void @llvm.dbg.value(metadata i16 %39, metadata !276, metadata !DIExpression()), !dbg !278
  br label %40

40:                                               ; preds = %37, %34, %27, %17, %24
  %41 = phi ptr [ %13, %17 ], [ %13, %24 ], [ %25, %27 ], [ %25, %34 ], [ %35, %37 ], !dbg !278
  %42 = phi i16 [ %19, %17 ], [ %19, %24 ], [ %29, %27 ], [ %29, %34 ], [ %39, %37 ], !dbg !278
  tail call void @llvm.dbg.value(metadata ptr %41, metadata !149, metadata !DIExpression()), !dbg !228
  tail call void @llvm.dbg.value(metadata i16 %42, metadata !154, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !228
  %43 = icmp ne i16 %42, 8
  %44 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 false)
  %45 = select i1 %44, i1 true, i1 %43, !dbg !284
  tail call void @llvm.dbg.value(metadata ptr undef, metadata !308, metadata !DIExpression()), !dbg !318
  tail call void @llvm.dbg.value(metadata ptr %11, metadata !314, metadata !DIExpression()), !dbg !318
  tail call void @llvm.dbg.value(metadata ptr undef, metadata !315, metadata !DIExpression()), !dbg !318
  tail call void @llvm.dbg.value(metadata ptr %41, metadata !316, metadata !DIExpression()), !dbg !318
  %46 = getelementptr inbounds %struct.iphdr, ptr %41, i64 1
  %47 = icmp ugt ptr %46, %11
  %48 = select i1 %45, i1 true, i1 %47, !dbg !284
  br i1 %48, label %123, label %49, !dbg !284

49:                                               ; preds = %40
  %50 = load i8, ptr %41, align 4, !dbg !321
  %51 = shl i8 %50, 2, !dbg !322
  %52 = and i8 %51, 60, !dbg !322
  tail call void @llvm.dbg.value(metadata i8 %52, metadata !317, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !318
  %53 = icmp ult i8 %52, 20, !dbg !323
  br i1 %53, label %123, label %54, !dbg !325

54:                                               ; preds = %49
  %55 = zext nneg i8 %52 to i64
  tail call void @llvm.dbg.value(metadata i64 %55, metadata !317, metadata !DIExpression()), !dbg !318
  %56 = getelementptr inbounds i8, ptr %41, i64 %55, !dbg !326
  %57 = icmp ugt ptr %56, %11, !dbg !328
  br i1 %57, label %123, label %58, !dbg !329

58:                                               ; preds = %54
  tail call void @llvm.dbg.value(metadata ptr %56, metadata !149, metadata !DIExpression()), !dbg !228
  tail call void @llvm.dbg.value(metadata ptr %41, metadata !169, metadata !DIExpression()), !dbg !228
  %59 = getelementptr inbounds %struct.iphdr, ptr %41, i64 0, i32 6, !dbg !330
  %60 = load i8, ptr %59, align 1, !dbg !330, !tbaa !331
  %61 = icmp eq i8 %60, 6, !dbg !333
  br i1 %61, label %62, label %123, !dbg !334

62:                                               ; preds = %58
  tail call void @llvm.dbg.value(metadata ptr undef, metadata !335, metadata !DIExpression()), !dbg !345
  tail call void @llvm.dbg.value(metadata ptr %11, metadata !341, metadata !DIExpression()), !dbg !345
  tail call void @llvm.dbg.value(metadata ptr undef, metadata !342, metadata !DIExpression()), !dbg !345
  tail call void @llvm.dbg.value(metadata ptr %56, metadata !344, metadata !DIExpression()), !dbg !345
  %63 = getelementptr inbounds %struct.tcphdr, ptr %56, i64 1, !dbg !348
  %64 = icmp ugt ptr %63, %11, !dbg !350
  br i1 %64, label %123, label %65, !dbg !351

65:                                               ; preds = %62
  %66 = getelementptr inbounds %struct.tcphdr, ptr %56, i64 0, i32 4, !dbg !352
  %67 = load i16, ptr %66, align 4, !dbg !352
  %68 = lshr i16 %67, 2, !dbg !353
  %69 = and i16 %68, 60, !dbg !353
  tail call void @llvm.dbg.value(metadata i16 %69, metadata !343, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !345
  %70 = icmp ult i16 %69, 20, !dbg !354
  br i1 %70, label %123, label %71, !dbg !356

71:                                               ; preds = %65
  %72 = zext nneg i16 %69 to i64
  %73 = getelementptr inbounds i8, ptr %56, i64 %72, !dbg !357
  %74 = icmp ugt ptr %73, %11, !dbg !359
  br i1 %74, label %123, label %75, !dbg !360

75:                                               ; preds = %71
  tail call void @llvm.dbg.value(metadata ptr %73, metadata !149, metadata !DIExpression()), !dbg !228
  tail call void @llvm.dbg.value(metadata ptr %56, metadata !199, metadata !DIExpression()), !dbg !228
  %76 = and i16 %67, 512, !dbg !361
  %77 = icmp eq i16 %76, 0, !dbg !361
  br i1 %77, label %123, label %78, !dbg !363

78:                                               ; preds = %75
  %79 = getelementptr inbounds %struct.iphdr, ptr %41, i64 0, i32 8, !dbg !364
  %80 = load i32, ptr %79, align 4, !dbg !364, !tbaa !365
  %81 = trunc i32 %80 to i16
  %82 = tail call i16 @llvm.bswap.i16(i16 %81)
  %83 = zext i16 %82 to i32, !dbg !364
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3)
  call void @llvm.dbg.assign(metadata i1 undef, metadata !366, metadata !DIExpression(), metadata !226, metadata ptr %3, metadata !DIExpression()), !dbg !375
  call void @llvm.dbg.assign(metadata i1 undef, metadata !374, metadata !DIExpression(), metadata !227, metadata ptr %4, metadata !DIExpression()), !dbg !375
  call void @llvm.dbg.value(metadata ptr %0, metadata !371, metadata !DIExpression()), !dbg !375
  store i32 %83, ptr %3, align 4, !tbaa !377, !DIAssignID !378
  call void @llvm.dbg.assign(metadata i32 %83, metadata !366, metadata !DIExpression(), metadata !378, metadata ptr %3, metadata !DIExpression()), !dbg !375
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %4) #6, !dbg !379
  %84 = getelementptr inbounds i8, ptr %4, i64 8, !dbg !380
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(56) %84, i8 0, i64 48, i1 false), !dbg !380, !DIAssignID !381
  call void @llvm.dbg.assign(metadata i8 0, metadata !374, metadata !DIExpression(), metadata !381, metadata ptr %4, metadata !DIExpression()), !dbg !375
  call void @llvm.dbg.assign(metadata i8 0, metadata !374, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 64), metadata !382, metadata ptr undef, metadata !DIExpression()), !dbg !375
  %85 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @xdp_slowloris_suspect_map, ptr noundef nonnull %3) #6, !dbg !383
  call void @llvm.dbg.value(metadata ptr %85, metadata !373, metadata !DIExpression()), !dbg !375
  %86 = icmp eq ptr %85, null, !dbg !384
  br i1 %86, label %87, label %99, !dbg !386

87:                                               ; preds = %78
  store i64 1, ptr %4, align 8, !dbg !387, !tbaa !389, !DIAssignID !392
  call void @llvm.dbg.assign(metadata i64 1, metadata !374, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 64), metadata !392, metadata ptr %4, metadata !DIExpression()), !dbg !375
  %88 = load i32, ptr %8, align 4, !dbg !393, !tbaa !238
  %89 = load i32, ptr %0, align 4, !dbg !394, !tbaa !230
  %90 = sub i32 %88, %89, !dbg !395
  %91 = zext i32 %90 to i64, !dbg !396
  %92 = getelementptr inbounds %struct.profile, ptr %4, i64 0, i32 3, !dbg !397
  store i64 %91, ptr %92, align 8, !dbg !398, !tbaa !399, !DIAssignID !400
  call void @llvm.dbg.assign(metadata i64 %91, metadata !374, metadata !DIExpression(DW_OP_LLVM_fragment, 192, 64), metadata !400, metadata ptr %92, metadata !DIExpression()), !dbg !375
  %93 = call i64 inttoptr (i64 5 to ptr)() #6, !dbg !401
  %94 = getelementptr inbounds %struct.profile, ptr %4, i64 0, i32 5, !dbg !402
  store i64 %93, ptr %94, align 8, !dbg !403, !tbaa !404, !DIAssignID !405
  call void @llvm.dbg.assign(metadata i64 %93, metadata !374, metadata !DIExpression(DW_OP_LLVM_fragment, 320, 64), metadata !405, metadata ptr %94, metadata !DIExpression()), !dbg !375
  %95 = getelementptr inbounds %struct.profile, ptr %4, i64 0, i32 6, !dbg !406
  store i32 2, ptr %95, align 8, !dbg !407, !tbaa !408, !DIAssignID !409
  call void @llvm.dbg.assign(metadata i32 2, metadata !374, metadata !DIExpression(DW_OP_LLVM_fragment, 384, 32), metadata !409, metadata ptr %95, metadata !DIExpression()), !dbg !375
  %96 = call i32 inttoptr (i64 2 to ptr)(ptr noundef nonnull @xdp_slowloris_suspect_map, ptr noundef nonnull %3, ptr noundef nonnull %4, i64 noundef 1) #6, !dbg !410
  call void @llvm.dbg.value(metadata i32 %96, metadata !372, metadata !DIExpression()), !dbg !375
  %97 = icmp slt i32 %96, 0, !dbg !411
  br i1 %97, label %98, label %107, !dbg !413

98:                                               ; preds = %87
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %4) #6, !dbg !414
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3), !dbg !414
  tail call void @llvm.dbg.value(metadata ptr null, metadata !222, metadata !DIExpression()), !dbg !228
  br label %123, !dbg !415

99:                                               ; preds = %78
  %100 = load i32, ptr %8, align 4, !dbg !416, !tbaa !238
  %101 = load i32, ptr %0, align 4, !dbg !418, !tbaa !230
  %102 = sub i32 %100, %101, !dbg !419
  %103 = zext i32 %102 to i64, !dbg !420
  %104 = getelementptr inbounds %struct.profile, ptr %85, i64 0, i32 3, !dbg !421
  %105 = load i64, ptr %104, align 8, !dbg !422, !tbaa !399
  %106 = add i64 %105, %103, !dbg !422
  store i64 %106, ptr %104, align 8, !dbg !422, !tbaa !399
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %4) #6, !dbg !414
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3), !dbg !414
  tail call void @llvm.dbg.value(metadata ptr %85, metadata !222, metadata !DIExpression()), !dbg !228
  br label %110, !dbg !415

107:                                              ; preds = %87
  %108 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @xdp_slowloris_suspect_map, ptr noundef nonnull %3) #6, !dbg !423
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %4) #6, !dbg !414
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3), !dbg !414
  tail call void @llvm.dbg.value(metadata ptr %108, metadata !222, metadata !DIExpression()), !dbg !228
  %109 = icmp eq ptr %108, null, !dbg !425
  br i1 %109, label %123, label %110, !dbg !415

110:                                              ; preds = %99, %107
  %111 = phi ptr [ %85, %99 ], [ %108, %107 ]
  %112 = getelementptr inbounds %struct.profile, ptr %111, i64 0, i32 5, !dbg !427
  %113 = load i64, ptr %112, align 8, !dbg !427, !tbaa !404
  %114 = sub i64 %12, %113, !dbg !428
  tail call void @llvm.dbg.value(metadata i64 poison, metadata !223, metadata !DIExpression()), !dbg !228
  %115 = icmp ugt i64 %114, 1999999999, !dbg !429
  br i1 %115, label %116, label %117, !dbg !431

116:                                              ; preds = %110
  store i64 1, ptr %111, align 8, !dbg !432, !tbaa !389
  store i64 %12, ptr %112, align 8, !dbg !434, !tbaa !404
  tail call void @llvm.dbg.value(metadata i32 2, metadata !146, metadata !DIExpression()), !dbg !228
  br label %123, !dbg !435

117:                                              ; preds = %110
  %118 = load i64, ptr %111, align 8, !dbg !436, !tbaa !389
  %119 = add i64 %118, 1, !dbg !436
  store i64 %119, ptr %111, align 8, !dbg !436, !tbaa !389
  %120 = icmp ugt i64 %119, 50, !dbg !438
  br i1 %120, label %121, label %123, !dbg !440

121:                                              ; preds = %117
  %122 = getelementptr inbounds %struct.profile, ptr %111, i64 0, i32 6, !dbg !441
  store i32 1, ptr %122, align 8, !dbg !443, !tbaa !408
  tail call void @llvm.dbg.value(metadata i32 1, metadata !146, metadata !DIExpression()), !dbg !228
  br label %123, !dbg !444

123:                                              ; preds = %71, %65, %62, %54, %49, %98, %15, %107, %75, %58, %40, %116, %121, %117
  %124 = phi i32 [ 2, %116 ], [ 1, %121 ], [ 2, %117 ], [ 2, %40 ], [ 2, %58 ], [ 2, %75 ], [ 0, %107 ], [ 2, %15 ], [ 0, %98 ], [ 2, %49 ], [ 2, %54 ], [ 0, %62 ], [ 0, %65 ], [ 0, %71 ], !dbg !228
  tail call void @llvm.dbg.value(metadata i32 %124, metadata !146, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.label(metadata !224), !dbg !445
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2)
  call void @llvm.dbg.assign(metadata i1 undef, metadata !446, metadata !DIExpression(), metadata !225, metadata ptr %2, metadata !DIExpression()), !dbg !458
  call void @llvm.dbg.value(metadata ptr %0, metadata !451, metadata !DIExpression()), !dbg !458
  store i32 %124, ptr %2, align 4, !tbaa !377, !DIAssignID !460
  call void @llvm.dbg.assign(metadata i32 %124, metadata !446, metadata !DIExpression(), metadata !460, metadata ptr %2, metadata !DIExpression()), !dbg !458
  %125 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @xdp_stats_map, ptr noundef nonnull %2) #6, !dbg !461
  call void @llvm.dbg.value(metadata ptr %125, metadata !452, metadata !DIExpression()), !dbg !458
  %126 = icmp eq ptr %125, null, !dbg !462
  br i1 %126, label %138, label %127, !dbg !464

127:                                              ; preds = %123
  %128 = load i64, ptr %125, align 8, !dbg !465, !tbaa !466
  %129 = add i64 %128, 1, !dbg !465
  store i64 %129, ptr %125, align 8, !dbg !465, !tbaa !466
  %130 = load i32, ptr %8, align 4, !dbg !468, !tbaa !238
  %131 = load i32, ptr %0, align 4, !dbg !469, !tbaa !230
  %132 = sub i32 %130, %131, !dbg !470
  %133 = zext i32 %132 to i64, !dbg !471
  %134 = getelementptr inbounds %struct.datarec, ptr %125, i64 0, i32 1, !dbg !472
  %135 = load i64, ptr %134, align 8, !dbg !473, !tbaa !474
  %136 = add i64 %135, %133, !dbg !473
  store i64 %136, ptr %134, align 8, !dbg !473, !tbaa !474
  %137 = load i32, ptr %2, align 4, !dbg !475, !tbaa !377
  br label %138, !dbg !476

138:                                              ; preds = %123, %127
  %139 = phi i32 [ %137, %127 ], [ 0, %123 ], !dbg !458
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2), !dbg !477
  ret i32 %139, !dbg !478
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.bswap.i16(i16) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.assign(metadata, metadata, metadata, metadata, metadata, metadata) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #4

; Function Attrs: nounwind memory(none)
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #5

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nounwind memory(none) }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!126, !127, !128, !129, !130}
!llvm.ident = !{!131}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "xdp_stats_map", scope: !2, file: !61, line: 16, type: !62, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !52, globals: !58, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_prog_kern.c", directory: "/home/itsicherheit/xdp-icmp-ddos-mitigation", checksumkind: CSK_MD5, checksum: "f5e4c5b9fd5c96e521f9d3ca4482ad0e")
!4 = !{!5, !14, !46}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 6337, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/linux/bpf.h", directory: "", checksumkind: CSK_MD5, checksum: "138cb73eb42942499c5a2382b1dd0dc0")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2)
!12 = !DIEnumerator(name: "XDP_TX", value: 3)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!14 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !15, line: 29, baseType: !7, size: 32, elements: !16)
!15 = !DIFile(filename: "/usr/include/linux/in.h", directory: "", checksumkind: CSK_MD5, checksum: "fcee415bb19db8acb968eeda6f02fa29")
!16 = !{!17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45}
!17 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!18 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!19 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!20 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!21 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!22 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!23 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!24 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!25 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!26 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!27 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!28 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!29 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!30 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!31 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!32 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!33 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!34 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!35 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!36 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!37 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!38 = !DIEnumerator(name: "IPPROTO_L2TP", value: 115)
!39 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!40 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!41 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!42 = !DIEnumerator(name: "IPPROTO_ETHERNET", value: 143)
!43 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!44 = !DIEnumerator(name: "IPPROTO_MPTCP", value: 262)
!45 = !DIEnumerator(name: "IPPROTO_MAX", value: 263)
!46 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 1299, baseType: !7, size: 32, elements: !47)
!47 = !{!48, !49, !50, !51}
!48 = !DIEnumerator(name: "BPF_ANY", value: 0)
!49 = !DIEnumerator(name: "BPF_NOEXIST", value: 1)
!50 = !DIEnumerator(name: "BPF_EXIST", value: 2)
!51 = !DIEnumerator(name: "BPF_F_LOCK", value: 4)
!52 = !{!53, !54, !55}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!54 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !56, line: 24, baseType: !57)
!56 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!57 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!58 = !{!0, !59, !70, !76, !108, !114, !121}
!59 = !DIGlobalVariableExpression(var: !60, expr: !DIExpression())
!60 = distinct !DIGlobalVariable(name: "xdp_icmp_suspect_map", scope: !2, file: !61, line: 23, type: !62, isLocal: false, isDefinition: true)
!61 = !DIFile(filename: "./common/xdp_stats_kern.h", directory: "/home/itsicherheit/xdp-icmp-ddos-mitigation", checksumkind: CSK_MD5, checksum: "053483f05054768ccc0393f2c1da542b")
!62 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map_def", file: !63, line: 33, size: 160, elements: !64)
!63 = !DIFile(filename: "libbpf/src//build/usr/include/bpf/bpf_helpers.h", directory: "/home/itsicherheit/xdp-icmp-ddos-mitigation", checksumkind: CSK_MD5, checksum: "9e37b5f46a8fb7f5ed35ab69309bf15d")
!64 = !{!65, !66, !67, !68, !69}
!65 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !62, file: !63, line: 34, baseType: !7, size: 32)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !62, file: !63, line: 35, baseType: !7, size: 32, offset: 32)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !62, file: !63, line: 36, baseType: !7, size: 32, offset: 64)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !62, file: !63, line: 37, baseType: !7, size: 32, offset: 96)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !62, file: !63, line: 38, baseType: !7, size: 32, offset: 128)
!70 = !DIGlobalVariableExpression(var: !71, expr: !DIExpression())
!71 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 105, type: !72, isLocal: false, isDefinition: true)
!72 = !DICompositeType(tag: DW_TAG_array_type, baseType: !73, size: 32, elements: !74)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !{!75}
!75 = !DISubrange(count: 4)
!76 = !DIGlobalVariableExpression(var: !77, expr: !DIExpression())
!77 = distinct !DIGlobalVariable(name: "xdp_slowloris_suspect_map", scope: !2, file: !3, line: 22, type: !78, isLocal: false, isDefinition: true)
!78 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 17, size: 256, elements: !79)
!79 = !{!80, !86, !91, !94}
!80 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !78, file: !3, line: 18, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DICompositeType(tag: DW_TAG_array_type, baseType: !83, size: 288, elements: !84)
!83 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!84 = !{!85}
!85 = !DISubrange(count: 9)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !78, file: !3, line: 19, baseType: !87, size: 64, offset: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DICompositeType(tag: DW_TAG_array_type, baseType: !83, size: 327680, elements: !89)
!89 = !{!90}
!90 = !DISubrange(count: 10240)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !78, file: !3, line: 20, baseType: !92, size: 64, offset: 128)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !56, line: 27, baseType: !7)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !78, file: !3, line: 21, baseType: !95, size: 64, offset: 192)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "profile", file: !97, line: 19, size: 448, elements: !98)
!97 = !DIFile(filename: "./common/xdp_stats_kern_user.h", directory: "/home/itsicherheit/xdp-icmp-ddos-mitigation", checksumkind: CSK_MD5, checksum: "33165b419ee954b16d32a4b8babd36d0")
!98 = !{!99, !102, !103, !104, !105, !106, !107}
!99 = !DIDerivedType(tag: DW_TAG_member, name: "cur_half_open_connections", scope: !96, file: !97, line: 20, baseType: !100, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !56, line: 31, baseType: !101)
!101 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "cur_rx_packets", scope: !96, file: !97, line: 21, baseType: !100, size: 64, offset: 64)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "pre_rx_packets", scope: !96, file: !97, line: 22, baseType: !100, size: 64, offset: 128)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "cur_rx_bytes", scope: !96, file: !97, line: 23, baseType: !100, size: 64, offset: 192)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "pre_rx_bytes", scope: !96, file: !97, line: 24, baseType: !100, size: 64, offset: 256)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "last_seen", scope: !96, file: !97, line: 25, baseType: !100, size: 64, offset: 320)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "action", scope: !96, file: !97, line: 26, baseType: !83, size: 32, offset: 384)
!108 = !DIGlobalVariableExpression(var: !109, expr: !DIExpression(DW_OP_constu, 5, DW_OP_stack_value))
!109 = distinct !DIGlobalVariable(name: "bpf_ktime_get_ns", scope: !2, file: !110, line: 89, type: !111, isLocal: true, isDefinition: true)
!110 = !DIFile(filename: "libbpf/src//build/usr/include/bpf/bpf_helper_defs.h", directory: "/home/itsicherheit/xdp-icmp-ddos-mitigation", checksumkind: CSK_MD5, checksum: "2601bcf9d7985cb46bfbd904b60f5aaf")
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 64)
!112 = !DISubroutineType(types: !113)
!113 = !{!100}
!114 = !DIGlobalVariableExpression(var: !115, expr: !DIExpression(DW_OP_constu, 1, DW_OP_stack_value))
!115 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !110, line: 33, type: !116, isLocal: true, isDefinition: true)
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !117, size: 64)
!117 = !DISubroutineType(types: !118)
!118 = !{!53, !53, !119}
!119 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !120, size: 64)
!120 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!121 = !DIGlobalVariableExpression(var: !122, expr: !DIExpression(DW_OP_constu, 2, DW_OP_stack_value))
!122 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !2, file: !110, line: 55, type: !123, isLocal: true, isDefinition: true)
!123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !124, size: 64)
!124 = !DISubroutineType(types: !125)
!125 = !{!83, !53, !119, !119, !100}
!126 = !{i32 7, !"Dwarf Version", i32 5}
!127 = !{i32 2, !"Debug Info Version", i32 3}
!128 = !{i32 1, !"wchar_size", i32 4}
!129 = !{i32 7, !"frame-pointer", i32 2}
!130 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!131 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!132 = distinct !DISubprogram(name: "xdp_slowloris_mitigation_func", scope: !3, file: !3, line: 25, type: !133, scopeLine: 26, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !144)
!133 = !DISubroutineType(types: !134)
!134 = !{!83, !135}
!135 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !136, size: 64)
!136 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 6348, size: 192, elements: !137)
!137 = !{!138, !139, !140, !141, !142, !143}
!138 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !136, file: !6, line: 6349, baseType: !93, size: 32)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !136, file: !6, line: 6350, baseType: !93, size: 32, offset: 32)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !136, file: !6, line: 6351, baseType: !93, size: 32, offset: 64)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !136, file: !6, line: 6353, baseType: !93, size: 32, offset: 96)
!142 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !136, file: !6, line: 6354, baseType: !93, size: 32, offset: 128)
!143 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !136, file: !6, line: 6356, baseType: !93, size: 32, offset: 160)
!144 = !{!145, !146, !147, !148, !149, !154, !155, !169, !199, !221, !222, !223, !224}
!145 = !DILocalVariable(name: "ctx", arg: 1, scope: !132, file: !3, line: 25, type: !135)
!146 = !DILocalVariable(name: "action", scope: !132, file: !3, line: 28, type: !83)
!147 = !DILocalVariable(name: "data", scope: !132, file: !3, line: 31, type: !53)
!148 = !DILocalVariable(name: "data_end", scope: !132, file: !3, line: 32, type: !53)
!149 = !DILocalVariable(name: "nh", scope: !132, file: !3, line: 33, type: !150)
!150 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !151, line: 33, size: 64, elements: !152)
!151 = !DIFile(filename: "./common/parsing_helpers.h", directory: "/home/itsicherheit/xdp-icmp-ddos-mitigation", checksumkind: CSK_MD5, checksum: "172efdd203783aed49c0ce78645261a8")
!152 = !{!153}
!153 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !150, file: !151, line: 34, baseType: !53, size: 64)
!154 = !DILocalVariable(name: "eth_type", scope: !132, file: !3, line: 36, type: !83)
!155 = !DILocalVariable(name: "eth", scope: !132, file: !3, line: 37, type: !156)
!156 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !157, size: 64)
!157 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !158, line: 173, size: 112, elements: !159)
!158 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "163f54fb1af2e21fea410f14eb18fa76")
!159 = !{!160, !165, !166}
!160 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !157, file: !158, line: 174, baseType: !161, size: 48)
!161 = !DICompositeType(tag: DW_TAG_array_type, baseType: !162, size: 48, elements: !163)
!162 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!163 = !{!164}
!164 = !DISubrange(count: 6)
!165 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !157, file: !158, line: 175, baseType: !161, size: 48, offset: 48)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !157, file: !158, line: 176, baseType: !167, size: 16, offset: 96)
!167 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !168, line: 32, baseType: !55)
!168 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "bf9fbc0e8f60927fef9d8917535375a6")
!169 = !DILocalVariable(name: "iphdr", scope: !132, file: !3, line: 40, type: !170)
!170 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !171, size: 64)
!171 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !172, line: 87, size: 160, elements: !173)
!172 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "149778ace30a1ff208adc8783fd04b29")
!173 = !{!174, !176, !177, !178, !179, !180, !181, !182, !183, !185}
!174 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !171, file: !172, line: 89, baseType: !175, size: 4, flags: DIFlagBitField, extraData: i64 0)
!175 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !56, line: 21, baseType: !162)
!176 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !171, file: !172, line: 90, baseType: !175, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!177 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !171, file: !172, line: 97, baseType: !175, size: 8, offset: 8)
!178 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !171, file: !172, line: 98, baseType: !167, size: 16, offset: 16)
!179 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !171, file: !172, line: 99, baseType: !167, size: 16, offset: 32)
!180 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !171, file: !172, line: 100, baseType: !167, size: 16, offset: 48)
!181 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !171, file: !172, line: 101, baseType: !175, size: 8, offset: 64)
!182 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !171, file: !172, line: 102, baseType: !175, size: 8, offset: 72)
!183 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !171, file: !172, line: 103, baseType: !184, size: 16, offset: 80)
!184 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !168, line: 38, baseType: !55)
!185 = !DIDerivedType(tag: DW_TAG_member, scope: !171, file: !172, line: 104, baseType: !186, size: 64, offset: 96)
!186 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !171, file: !172, line: 104, size: 64, elements: !187)
!187 = !{!188, !194}
!188 = !DIDerivedType(tag: DW_TAG_member, scope: !186, file: !172, line: 104, baseType: !189, size: 64)
!189 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !186, file: !172, line: 104, size: 64, elements: !190)
!190 = !{!191, !193}
!191 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !189, file: !172, line: 104, baseType: !192, size: 32)
!192 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !168, line: 34, baseType: !93)
!193 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !189, file: !172, line: 104, baseType: !192, size: 32, offset: 32)
!194 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !186, file: !172, line: 104, baseType: !195, size: 64)
!195 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !186, file: !172, line: 104, size: 64, elements: !196)
!196 = !{!197, !198}
!197 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !195, file: !172, line: 104, baseType: !192, size: 32)
!198 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !195, file: !172, line: 104, baseType: !192, size: 32, offset: 32)
!199 = !DILocalVariable(name: "tcphdr", scope: !132, file: !3, line: 43, type: !200)
!200 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !201, size: 64)
!201 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tcphdr", file: !202, line: 25, size: 160, elements: !203)
!202 = !DIFile(filename: "/usr/include/linux/tcp.h", directory: "", checksumkind: CSK_MD5, checksum: "bd53e42c49642a86fd7da9761b6f86eb")
!203 = !{!204, !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !218, !219, !220}
!204 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !201, file: !202, line: 26, baseType: !167, size: 16)
!205 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !201, file: !202, line: 27, baseType: !167, size: 16, offset: 16)
!206 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !201, file: !202, line: 28, baseType: !192, size: 32, offset: 32)
!207 = !DIDerivedType(tag: DW_TAG_member, name: "ack_seq", scope: !201, file: !202, line: 29, baseType: !192, size: 32, offset: 64)
!208 = !DIDerivedType(tag: DW_TAG_member, name: "res1", scope: !201, file: !202, line: 31, baseType: !55, size: 4, offset: 96, flags: DIFlagBitField, extraData: i64 96)
!209 = !DIDerivedType(tag: DW_TAG_member, name: "doff", scope: !201, file: !202, line: 32, baseType: !55, size: 4, offset: 100, flags: DIFlagBitField, extraData: i64 96)
!210 = !DIDerivedType(tag: DW_TAG_member, name: "fin", scope: !201, file: !202, line: 33, baseType: !55, size: 1, offset: 104, flags: DIFlagBitField, extraData: i64 96)
!211 = !DIDerivedType(tag: DW_TAG_member, name: "syn", scope: !201, file: !202, line: 34, baseType: !55, size: 1, offset: 105, flags: DIFlagBitField, extraData: i64 96)
!212 = !DIDerivedType(tag: DW_TAG_member, name: "rst", scope: !201, file: !202, line: 35, baseType: !55, size: 1, offset: 106, flags: DIFlagBitField, extraData: i64 96)
!213 = !DIDerivedType(tag: DW_TAG_member, name: "psh", scope: !201, file: !202, line: 36, baseType: !55, size: 1, offset: 107, flags: DIFlagBitField, extraData: i64 96)
!214 = !DIDerivedType(tag: DW_TAG_member, name: "ack", scope: !201, file: !202, line: 37, baseType: !55, size: 1, offset: 108, flags: DIFlagBitField, extraData: i64 96)
!215 = !DIDerivedType(tag: DW_TAG_member, name: "urg", scope: !201, file: !202, line: 38, baseType: !55, size: 1, offset: 109, flags: DIFlagBitField, extraData: i64 96)
!216 = !DIDerivedType(tag: DW_TAG_member, name: "ece", scope: !201, file: !202, line: 39, baseType: !55, size: 1, offset: 110, flags: DIFlagBitField, extraData: i64 96)
!217 = !DIDerivedType(tag: DW_TAG_member, name: "cwr", scope: !201, file: !202, line: 40, baseType: !55, size: 1, offset: 111, flags: DIFlagBitField, extraData: i64 96)
!218 = !DIDerivedType(tag: DW_TAG_member, name: "window", scope: !201, file: !202, line: 55, baseType: !167, size: 16, offset: 112)
!219 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !201, file: !202, line: 56, baseType: !184, size: 16, offset: 128)
!220 = !DIDerivedType(tag: DW_TAG_member, name: "urg_ptr", scope: !201, file: !202, line: 57, baseType: !167, size: 16, offset: 144)
!221 = !DILocalVariable(name: "current_time", scope: !132, file: !3, line: 46, type: !100)
!222 = !DILocalVariable(name: "target_profile", scope: !132, file: !3, line: 47, type: !95)
!223 = !DILocalVariable(name: "elapsed_time", scope: !132, file: !3, line: 82, type: !100)
!224 = !DILabel(scope: !132, name: "out", file: !3, line: 100)
!225 = distinct !DIAssignID()
!226 = distinct !DIAssignID()
!227 = distinct !DIAssignID()
!228 = !DILocation(line: 0, scope: !132)
!229 = !DILocation(line: 31, column: 37, scope: !132)
!230 = !{!231, !232, i64 0}
!231 = !{!"xdp_md", !232, i64 0, !232, i64 4, !232, i64 8, !232, i64 12, !232, i64 16, !232, i64 20}
!232 = !{!"int", !233, i64 0}
!233 = !{!"omnipotent char", !234, i64 0}
!234 = !{!"Simple C/C++ TBAA"}
!235 = !DILocation(line: 31, column: 26, scope: !132)
!236 = !DILocation(line: 31, column: 18, scope: !132)
!237 = !DILocation(line: 32, column: 41, scope: !132)
!238 = !{!231, !232, i64 4}
!239 = !DILocation(line: 32, column: 30, scope: !132)
!240 = !DILocation(line: 32, column: 22, scope: !132)
!241 = !DILocation(line: 46, column: 26, scope: !132)
!242 = !DILocalVariable(name: "nh", arg: 1, scope: !243, file: !151, line: 124, type: !246)
!243 = distinct !DISubprogram(name: "parse_ethhdr", scope: !151, file: !151, line: 124, type: !244, scopeLine: 127, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !248)
!244 = !DISubroutineType(types: !245)
!245 = !{!83, !246, !53, !247}
!246 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !150, size: 64)
!247 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !156, size: 64)
!248 = !{!242, !249, !250}
!249 = !DILocalVariable(name: "data_end", arg: 2, scope: !243, file: !151, line: 125, type: !53)
!250 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !243, file: !151, line: 126, type: !247)
!251 = !DILocation(line: 0, scope: !243, inlinedAt: !252)
!252 = distinct !DILocation(line: 50, column: 16, scope: !132)
!253 = !DILocalVariable(name: "nh", arg: 1, scope: !254, file: !151, line: 79, type: !246)
!254 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !151, file: !151, line: 79, type: !255, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !264)
!255 = !DISubroutineType(types: !256)
!256 = !{!83, !246, !53, !247, !257}
!257 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !258, size: 64)
!258 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !151, line: 64, size: 32, elements: !259)
!259 = !{!260}
!260 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !258, file: !151, line: 65, baseType: !261, size: 32)
!261 = !DICompositeType(tag: DW_TAG_array_type, baseType: !55, size: 32, elements: !262)
!262 = !{!263}
!263 = !DISubrange(count: 2)
!264 = !{!253, !265, !266, !267, !268, !269, !270, !276, !277}
!265 = !DILocalVariable(name: "data_end", arg: 2, scope: !254, file: !151, line: 80, type: !53)
!266 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !254, file: !151, line: 81, type: !247)
!267 = !DILocalVariable(name: "vlans", arg: 4, scope: !254, file: !151, line: 82, type: !257)
!268 = !DILocalVariable(name: "eth", scope: !254, file: !151, line: 84, type: !156)
!269 = !DILocalVariable(name: "hdrsize", scope: !254, file: !151, line: 85, type: !83)
!270 = !DILocalVariable(name: "vlh", scope: !254, file: !151, line: 86, type: !271)
!271 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !272, size: 64)
!272 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !151, line: 42, size: 32, elements: !273)
!273 = !{!274, !275}
!274 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !272, file: !151, line: 43, baseType: !167, size: 16)
!275 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !272, file: !151, line: 44, baseType: !167, size: 16, offset: 16)
!276 = !DILocalVariable(name: "h_proto", scope: !254, file: !151, line: 87, type: !55)
!277 = !DILocalVariable(name: "i", scope: !254, file: !151, line: 88, type: !83)
!278 = !DILocation(line: 0, scope: !254, inlinedAt: !279)
!279 = distinct !DILocation(line: 129, column: 9, scope: !243, inlinedAt: !252)
!280 = !DILocation(line: 93, column: 14, scope: !281, inlinedAt: !279)
!281 = distinct !DILexicalBlock(scope: !254, file: !151, line: 93, column: 6)
!282 = !DILocation(line: 93, column: 24, scope: !281, inlinedAt: !279)
!283 = !DILocation(line: 93, column: 6, scope: !254, inlinedAt: !279)
!284 = !DILocation(line: 51, column: 22, scope: !285)
!285 = distinct !DILexicalBlock(scope: !132, file: !3, line: 51, column: 9)
!286 = !DILocation(line: 99, column: 17, scope: !254, inlinedAt: !279)
!287 = !{!288, !288, i64 0}
!288 = !{!"short", !233, i64 0}
!289 = !DILocalVariable(name: "h_proto", arg: 1, scope: !290, file: !151, line: 68, type: !55)
!290 = distinct !DISubprogram(name: "proto_is_vlan", scope: !151, file: !151, line: 68, type: !291, scopeLine: 69, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !293)
!291 = !DISubroutineType(types: !292)
!292 = !{!83, !55}
!293 = !{!289}
!294 = !DILocation(line: 0, scope: !290, inlinedAt: !295)
!295 = distinct !DILocation(line: 106, column: 8, scope: !296, inlinedAt: !279)
!296 = distinct !DILexicalBlock(scope: !297, file: !151, line: 106, column: 7)
!297 = distinct !DILexicalBlock(scope: !298, file: !151, line: 105, column: 39)
!298 = distinct !DILexicalBlock(scope: !299, file: !151, line: 105, column: 2)
!299 = distinct !DILexicalBlock(scope: !254, file: !151, line: 105, column: 2)
!300 = !DILocation(line: 70, column: 20, scope: !290, inlinedAt: !295)
!301 = !DILocation(line: 70, column: 46, scope: !290, inlinedAt: !295)
!302 = !DILocation(line: 106, column: 7, scope: !297, inlinedAt: !279)
!303 = !DILocation(line: 109, column: 11, scope: !304, inlinedAt: !279)
!304 = distinct !DILexicalBlock(scope: !297, file: !151, line: 109, column: 7)
!305 = !DILocation(line: 109, column: 15, scope: !304, inlinedAt: !279)
!306 = !DILocation(line: 109, column: 7, scope: !297, inlinedAt: !279)
!307 = !DILocation(line: 112, column: 18, scope: !297, inlinedAt: !279)
!308 = !DILocalVariable(name: "nh", arg: 1, scope: !309, file: !151, line: 151, type: !246)
!309 = distinct !DISubprogram(name: "parse_iphdr", scope: !151, file: !151, line: 151, type: !310, scopeLine: 154, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !313)
!310 = !DISubroutineType(types: !311)
!311 = !{!83, !246, !53, !312}
!312 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !170, size: 64)
!313 = !{!308, !314, !315, !316, !317}
!314 = !DILocalVariable(name: "data_end", arg: 2, scope: !309, file: !151, line: 152, type: !53)
!315 = !DILocalVariable(name: "iphdr", arg: 3, scope: !309, file: !151, line: 153, type: !312)
!316 = !DILocalVariable(name: "iph", scope: !309, file: !151, line: 155, type: !170)
!317 = !DILocalVariable(name: "hdrsize", scope: !309, file: !151, line: 156, type: !83)
!318 = !DILocation(line: 0, scope: !309, inlinedAt: !319)
!319 = distinct !DILocation(line: 57, column: 9, scope: !320)
!320 = distinct !DILexicalBlock(scope: !132, file: !3, line: 57, column: 9)
!321 = !DILocation(line: 161, column: 17, scope: !309, inlinedAt: !319)
!322 = !DILocation(line: 161, column: 21, scope: !309, inlinedAt: !319)
!323 = !DILocation(line: 163, column: 13, scope: !324, inlinedAt: !319)
!324 = distinct !DILexicalBlock(scope: !309, file: !151, line: 163, column: 5)
!325 = !DILocation(line: 163, column: 5, scope: !309, inlinedAt: !319)
!326 = !DILocation(line: 167, column: 14, scope: !327, inlinedAt: !319)
!327 = distinct !DILexicalBlock(scope: !309, file: !151, line: 167, column: 6)
!328 = !DILocation(line: 167, column: 24, scope: !327, inlinedAt: !319)
!329 = !DILocation(line: 167, column: 6, scope: !309, inlinedAt: !319)
!330 = !DILocation(line: 173, column: 14, scope: !309, inlinedAt: !319)
!331 = !{!332, !233, i64 9}
!332 = !{!"iphdr", !233, i64 0, !233, i64 0, !233, i64 1, !288, i64 2, !288, i64 4, !288, i64 6, !233, i64 8, !233, i64 9, !288, i64 10, !233, i64 12}
!333 = !DILocation(line: 57, column: 44, scope: !320)
!334 = !DILocation(line: 57, column: 9, scope: !132)
!335 = !DILocalVariable(name: "nh", arg: 1, scope: !336, file: !151, line: 247, type: !246)
!336 = distinct !DISubprogram(name: "parse_tcphdr", scope: !151, file: !151, line: 247, type: !337, scopeLine: 250, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !340)
!337 = !DISubroutineType(types: !338)
!338 = !{!83, !246, !53, !339}
!339 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !200, size: 64)
!340 = !{!335, !341, !342, !343, !344}
!341 = !DILocalVariable(name: "data_end", arg: 2, scope: !336, file: !151, line: 248, type: !53)
!342 = !DILocalVariable(name: "tcphdr", arg: 3, scope: !336, file: !151, line: 249, type: !339)
!343 = !DILocalVariable(name: "len", scope: !336, file: !151, line: 251, type: !83)
!344 = !DILocalVariable(name: "h", scope: !336, file: !151, line: 252, type: !200)
!345 = !DILocation(line: 0, scope: !336, inlinedAt: !346)
!346 = distinct !DILocation(line: 63, column: 9, scope: !347)
!347 = distinct !DILexicalBlock(scope: !132, file: !3, line: 63, column: 9)
!348 = !DILocation(line: 254, column: 8, scope: !349, inlinedAt: !346)
!349 = distinct !DILexicalBlock(scope: !336, file: !151, line: 254, column: 6)
!350 = !DILocation(line: 254, column: 12, scope: !349, inlinedAt: !346)
!351 = !DILocation(line: 254, column: 6, scope: !336, inlinedAt: !346)
!352 = !DILocation(line: 257, column: 11, scope: !336, inlinedAt: !346)
!353 = !DILocation(line: 257, column: 16, scope: !336, inlinedAt: !346)
!354 = !DILocation(line: 259, column: 9, scope: !355, inlinedAt: !346)
!355 = distinct !DILexicalBlock(scope: !336, file: !151, line: 259, column: 5)
!356 = !DILocation(line: 259, column: 5, scope: !336, inlinedAt: !346)
!357 = !DILocation(line: 263, column: 14, scope: !358, inlinedAt: !346)
!358 = distinct !DILexicalBlock(scope: !336, file: !151, line: 263, column: 6)
!359 = !DILocation(line: 263, column: 20, scope: !358, inlinedAt: !346)
!360 = !DILocation(line: 263, column: 6, scope: !336, inlinedAt: !346)
!361 = !DILocation(line: 69, column: 10, scope: !362)
!362 = distinct !DILexicalBlock(scope: !132, file: !3, line: 69, column: 9)
!363 = !DILocation(line: 69, column: 9, scope: !132)
!364 = !DILocation(line: 75, column: 56, scope: !132)
!365 = !{!233, !233, i64 0}
!366 = !DILocalVariable(name: "suspect", arg: 2, scope: !367, file: !3, line: 110, type: !93)
!367 = distinct !DISubprogram(name: "xdp_slowloris_suspect_record", scope: !3, file: !3, line: 110, type: !368, scopeLine: 111, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !370)
!368 = !DISubroutineType(types: !369)
!369 = !{!95, !135, !93}
!370 = !{!371, !366, !372, !373, !374}
!371 = !DILocalVariable(name: "ctx", arg: 1, scope: !367, file: !3, line: 110, type: !135)
!372 = !DILocalVariable(name: "ret", scope: !367, file: !3, line: 112, type: !83)
!373 = !DILocalVariable(name: "profile", scope: !367, file: !3, line: 113, type: !95)
!374 = !DILocalVariable(name: "new_profile", scope: !367, file: !3, line: 114, type: !96)
!375 = !DILocation(line: 0, scope: !367, inlinedAt: !376)
!376 = distinct !DILocation(line: 75, column: 22, scope: !132)
!377 = !{!232, !232, i64 0}
!378 = distinct !DIAssignID()
!379 = !DILocation(line: 114, column: 5, scope: !367, inlinedAt: !376)
!380 = !DILocation(line: 114, column: 20, scope: !367, inlinedAt: !376)
!381 = distinct !DIAssignID()
!382 = distinct !DIAssignID()
!383 = !DILocation(line: 117, column: 15, scope: !367, inlinedAt: !376)
!384 = !DILocation(line: 118, column: 10, scope: !385, inlinedAt: !376)
!385 = distinct !DILexicalBlock(scope: !367, file: !3, line: 118, column: 9)
!386 = !DILocation(line: 118, column: 9, scope: !367, inlinedAt: !376)
!387 = !DILocation(line: 120, column: 47, scope: !388, inlinedAt: !376)
!388 = distinct !DILexicalBlock(scope: !385, file: !3, line: 118, column: 19)
!389 = !{!390, !391, i64 0}
!390 = !{!"profile", !391, i64 0, !391, i64 8, !391, i64 16, !391, i64 24, !391, i64 32, !391, i64 40, !232, i64 48}
!391 = !{!"long long", !233, i64 0}
!392 = distinct !DIAssignID()
!393 = !DILocation(line: 121, column: 42, scope: !388, inlinedAt: !376)
!394 = !DILocation(line: 121, column: 58, scope: !388, inlinedAt: !376)
!395 = !DILocation(line: 121, column: 51, scope: !388, inlinedAt: !376)
!396 = !DILocation(line: 121, column: 36, scope: !388, inlinedAt: !376)
!397 = !DILocation(line: 121, column: 21, scope: !388, inlinedAt: !376)
!398 = !DILocation(line: 121, column: 34, scope: !388, inlinedAt: !376)
!399 = !{!390, !391, i64 24}
!400 = distinct !DIAssignID()
!401 = !DILocation(line: 122, column: 33, scope: !388, inlinedAt: !376)
!402 = !DILocation(line: 122, column: 21, scope: !388, inlinedAt: !376)
!403 = !DILocation(line: 122, column: 31, scope: !388, inlinedAt: !376)
!404 = !{!390, !391, i64 40}
!405 = distinct !DIAssignID()
!406 = !DILocation(line: 123, column: 21, scope: !388, inlinedAt: !376)
!407 = !DILocation(line: 123, column: 28, scope: !388, inlinedAt: !376)
!408 = !{!390, !232, i64 48}
!409 = distinct !DIAssignID()
!410 = !DILocation(line: 125, column: 15, scope: !388, inlinedAt: !376)
!411 = !DILocation(line: 126, column: 17, scope: !412, inlinedAt: !376)
!412 = distinct !DILexicalBlock(scope: !388, file: !3, line: 126, column: 13)
!413 = !DILocation(line: 126, column: 13, scope: !388, inlinedAt: !376)
!414 = !DILocation(line: 135, column: 1, scope: !367, inlinedAt: !376)
!415 = !DILocation(line: 76, column: 9, scope: !132)
!416 = !DILocation(line: 132, column: 40, scope: !417, inlinedAt: !376)
!417 = distinct !DILexicalBlock(scope: !385, file: !3, line: 131, column: 12)
!418 = !DILocation(line: 132, column: 56, scope: !417, inlinedAt: !376)
!419 = !DILocation(line: 132, column: 49, scope: !417, inlinedAt: !376)
!420 = !DILocation(line: 132, column: 34, scope: !417, inlinedAt: !376)
!421 = !DILocation(line: 132, column: 18, scope: !417, inlinedAt: !376)
!422 = !DILocation(line: 132, column: 31, scope: !417, inlinedAt: !376)
!423 = !DILocation(line: 129, column: 20, scope: !424, inlinedAt: !376)
!424 = distinct !DILexicalBlock(scope: !412, file: !3, line: 128, column: 16)
!425 = !DILocation(line: 76, column: 10, scope: !426)
!426 = distinct !DILexicalBlock(scope: !132, file: !3, line: 76, column: 9)
!427 = !DILocation(line: 82, column: 58, scope: !132)
!428 = !DILocation(line: 82, column: 40, scope: !132)
!429 = !DILocation(line: 85, column: 22, scope: !430)
!430 = distinct !DILexicalBlock(scope: !132, file: !3, line: 85, column: 9)
!431 = !DILocation(line: 85, column: 9, scope: !132)
!432 = !DILocation(line: 86, column: 51, scope: !433)
!433 = distinct !DILexicalBlock(scope: !430, file: !3, line: 85, column: 27)
!434 = !DILocation(line: 87, column: 35, scope: !433)
!435 = !DILocation(line: 89, column: 5, scope: !433)
!436 = !DILocation(line: 91, column: 50, scope: !437)
!437 = distinct !DILexicalBlock(scope: !430, file: !3, line: 89, column: 12)
!438 = !DILocation(line: 94, column: 55, scope: !439)
!439 = distinct !DILexicalBlock(scope: !437, file: !3, line: 94, column: 13)
!440 = !DILocation(line: 94, column: 13, scope: !437)
!441 = !DILocation(line: 95, column: 29, scope: !442)
!442 = distinct !DILexicalBlock(scope: !439, file: !3, line: 94, column: 84)
!443 = !DILocation(line: 95, column: 36, scope: !442)
!444 = !DILocation(line: 97, column: 9, scope: !442)
!445 = !DILocation(line: 100, column: 1, scope: !132)
!446 = !DILocalVariable(name: "action", arg: 2, scope: !447, file: !61, line: 34, type: !93)
!447 = distinct !DISubprogram(name: "xdp_stats_record_action", scope: !61, file: !61, line: 34, type: !448, scopeLine: 35, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !450)
!448 = !DISubroutineType(types: !449)
!449 = !{!93, !135, !93}
!450 = !{!451, !446, !452}
!451 = !DILocalVariable(name: "ctx", arg: 1, scope: !447, file: !61, line: 34, type: !135)
!452 = !DILocalVariable(name: "rec", scope: !447, file: !61, line: 40, type: !453)
!453 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !454, size: 64)
!454 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "datarec", file: !97, line: 10, size: 128, elements: !455)
!455 = !{!456, !457}
!456 = !DIDerivedType(tag: DW_TAG_member, name: "rx_packets", scope: !454, file: !97, line: 11, baseType: !100, size: 64)
!457 = !DIDerivedType(tag: DW_TAG_member, name: "rx_bytes", scope: !454, file: !97, line: 12, baseType: !100, size: 64, offset: 64)
!458 = !DILocation(line: 0, scope: !447, inlinedAt: !459)
!459 = distinct !DILocation(line: 102, column: 12, scope: !132)
!460 = distinct !DIAssignID()
!461 = !DILocation(line: 40, column: 24, scope: !447, inlinedAt: !459)
!462 = !DILocation(line: 41, column: 7, scope: !463, inlinedAt: !459)
!463 = distinct !DILexicalBlock(scope: !447, file: !61, line: 41, column: 6)
!464 = !DILocation(line: 41, column: 6, scope: !447, inlinedAt: !459)
!465 = !DILocation(line: 48, column: 17, scope: !447, inlinedAt: !459)
!466 = !{!467, !391, i64 0}
!467 = !{!"datarec", !391, i64 0, !391, i64 8}
!468 = !DILocation(line: 49, column: 25, scope: !447, inlinedAt: !459)
!469 = !DILocation(line: 49, column: 41, scope: !447, inlinedAt: !459)
!470 = !DILocation(line: 49, column: 34, scope: !447, inlinedAt: !459)
!471 = !DILocation(line: 49, column: 19, scope: !447, inlinedAt: !459)
!472 = !DILocation(line: 49, column: 7, scope: !447, inlinedAt: !459)
!473 = !DILocation(line: 49, column: 16, scope: !447, inlinedAt: !459)
!474 = !{!467, !391, i64 8}
!475 = !DILocation(line: 51, column: 9, scope: !447, inlinedAt: !459)
!476 = !DILocation(line: 51, column: 2, scope: !447, inlinedAt: !459)
!477 = !DILocation(line: 52, column: 1, scope: !447, inlinedAt: !459)
!478 = !DILocation(line: 102, column: 5, scope: !132)
