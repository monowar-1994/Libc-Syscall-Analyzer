; ModuleID = 'src/search/hsearch.c'
source_filename = "src/search/hsearch.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.hsearch_data = type { %struct.__tab*, i32, i32 }
%struct.__tab = type { %struct.entry*, i64, i64 }
%struct.entry = type { i8*, i8* }

@htab = internal global %struct.hsearch_data zeroinitializer, align 8

@hcreate_r = weak alias i32 (i64, %struct.hsearch_data*), i32 (i64, %struct.hsearch_data*)* @__hcreate_r
@hdestroy_r = weak alias void (%struct.hsearch_data*), void (%struct.hsearch_data*)* @__hdestroy_r
@hsearch_r = weak alias i32 (i8*, i8*, i32, %struct.entry**, %struct.hsearch_data*), i32 (i8*, i8*, i32, %struct.entry**, %struct.hsearch_data*)* @__hsearch_r

; Function Attrs: nounwind optsize strictfp
define i32 @hcreate(i64 noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @__hcreate_r(i64 noundef %0, %struct.hsearch_data* noundef nonnull @htab) #4
  ret i32 %2
}

; Function Attrs: nounwind optsize strictfp
define internal i32 @__hcreate_r(i64 noundef %0, %struct.hsearch_data* nocapture noundef %1) #0 {
  %3 = tail call i8* @calloc(i64 noundef 1, i64 noundef 24) #5
  %4 = getelementptr inbounds %struct.hsearch_data, %struct.hsearch_data* %1, i64 0, i32 0
  %5 = bitcast %struct.hsearch_data* %1 to i8**
  store i8* %3, i8** %5, align 8, !tbaa !3
  %6 = icmp eq i8* %3, null
  br i1 %6, label %12, label %7

7:                                                ; preds = %2
  %8 = tail call fastcc i32 @resize(i64 noundef %0, %struct.hsearch_data* noundef nonnull %1) #4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %7
  %11 = load i8*, i8** %5, align 8, !tbaa !3
  tail call void @free(i8* noundef %11) #5
  store %struct.__tab* null, %struct.__tab** %4, align 8, !tbaa !3
  br label %12

12:                                               ; preds = %7, %10, %2
  %13 = phi i32 [ 0, %2 ], [ 0, %10 ], [ %8, %7 ]
  ret i32 %13
}

; Function Attrs: nounwind optsize strictfp
define void @hdestroy() local_unnamed_addr #0 {
  tail call void @__hdestroy_r(%struct.hsearch_data* noundef nonnull @htab) #4
  ret void
}

; Function Attrs: nounwind optsize strictfp
define internal void @__hdestroy_r(%struct.hsearch_data* nocapture noundef %0) #0 {
  %2 = getelementptr inbounds %struct.hsearch_data, %struct.hsearch_data* %0, i64 0, i32 0
  %3 = load %struct.__tab*, %struct.__tab** %2, align 8, !tbaa !3
  %4 = icmp eq %struct.__tab* %3, null
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = bitcast %struct.__tab* %3 to i8*
  br label %12

7:                                                ; preds = %1
  %8 = bitcast %struct.__tab* %3 to i8**
  %9 = load i8*, i8** %8, align 8, !tbaa !9
  tail call void @free(i8* noundef %9) #5
  %10 = bitcast %struct.hsearch_data* %0 to i8**
  %11 = load i8*, i8** %10, align 8, !tbaa !3
  br label %12

12:                                               ; preds = %5, %7
  %13 = phi i8* [ %11, %7 ], [ %6, %5 ]
  tail call void @free(i8* noundef %13) #5
  store %struct.__tab* null, %struct.__tab** %2, align 8, !tbaa !3
  ret void
}

; Function Attrs: nounwind optsize strictfp
define %struct.entry* @hsearch(i8* %0, i8* %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = alloca %struct.entry*, align 8
  %5 = bitcast %struct.entry** %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %5) #6
  %6 = call i32 @__hsearch_r(i8* %0, i8* %1, i32 noundef %2, %struct.entry** noundef nonnull %4, %struct.hsearch_data* noundef nonnull @htab) #4
  %7 = load %struct.entry*, %struct.entry** %4, align 8, !tbaa !12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %5) #6
  ret %struct.entry* %7
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define internal i32 @__hsearch_r(i8* %0, i8* %1, i32 noundef %2, %struct.entry** nocapture noundef writeonly %3, %struct.hsearch_data* nocapture noundef readonly %4) #0 {
  %6 = load i8, i8* %0, align 1, !tbaa !13
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %18, label %8

8:                                                ; preds = %5, %8
  %9 = phi i8 [ %16, %8 ], [ %6, %5 ]
  %10 = phi i64 [ %15, %8 ], [ 0, %5 ]
  %11 = phi i8* [ %13, %8 ], [ %0, %5 ]
  %12 = mul i64 %10, 31
  %13 = getelementptr inbounds i8, i8* %11, i64 1
  %14 = zext i8 %9 to i64
  %15 = add i64 %12, %14
  %16 = load i8, i8* %13, align 1, !tbaa !13
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %18, label %8

18:                                               ; preds = %8, %5
  %19 = phi i64 [ 0, %5 ], [ %15, %8 ]
  %20 = tail call fastcc %struct.entry* @lookup(i8* noundef nonnull %0, i64 noundef %19, %struct.hsearch_data* noundef %4) #4
  %21 = getelementptr inbounds %struct.entry, %struct.entry* %20, i64 0, i32 0
  %22 = load i8*, i8** %21, align 8, !tbaa !14
  %23 = icmp eq i8* %22, null
  br i1 %23, label %24, label %49

24:                                               ; preds = %18
  %25 = icmp eq i32 %2, 0
  br i1 %25, label %49, label %26

26:                                               ; preds = %24
  store i8* %0, i8** %21, align 8, !tbaa.struct !16
  %27 = getelementptr inbounds %struct.entry, %struct.entry* %20, i64 0, i32 1
  store i8* %1, i8** %27, align 8, !tbaa.struct !17
  %28 = getelementptr inbounds %struct.hsearch_data, %struct.hsearch_data* %4, i64 0, i32 0
  %29 = load %struct.__tab*, %struct.__tab** %28, align 8, !tbaa !3
  %30 = getelementptr inbounds %struct.__tab, %struct.__tab* %29, i64 0, i32 2
  %31 = load i64, i64* %30, align 8, !tbaa !18
  %32 = add i64 %31, 1
  store i64 %32, i64* %30, align 8, !tbaa !18
  %33 = getelementptr inbounds %struct.__tab, %struct.__tab* %29, i64 0, i32 1
  %34 = load i64, i64* %33, align 8, !tbaa !19
  %35 = lshr i64 %34, 2
  %36 = sub i64 %34, %35
  %37 = icmp ugt i64 %32, %36
  br i1 %37, label %38, label %49

38:                                               ; preds = %26
  %39 = shl i64 %32, 1
  %40 = tail call fastcc i32 @resize(i64 noundef %39, %struct.hsearch_data* noundef nonnull %4) #4
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %47

42:                                               ; preds = %38
  %43 = load %struct.__tab*, %struct.__tab** %28, align 8, !tbaa !3
  %44 = getelementptr inbounds %struct.__tab, %struct.__tab* %43, i64 0, i32 2
  %45 = load i64, i64* %44, align 8, !tbaa !18
  %46 = add i64 %45, -1
  store i64 %46, i64* %44, align 8, !tbaa !18
  store i8* null, i8** %21, align 8, !tbaa !14
  br label %49

47:                                               ; preds = %38
  %48 = tail call fastcc %struct.entry* @lookup(i8* noundef nonnull %0, i64 noundef %19, %struct.hsearch_data* noundef nonnull %4) #4
  br label %49

49:                                               ; preds = %26, %47, %24, %18, %42
  %50 = phi %struct.entry* [ null, %42 ], [ %20, %18 ], [ null, %24 ], [ %48, %47 ], [ %20, %26 ]
  %51 = phi i32 [ 0, %42 ], [ 1, %18 ], [ 0, %24 ], [ 1, %47 ], [ 1, %26 ]
  store %struct.entry* %50, %struct.entry** %3, align 8, !tbaa !12
  ret i32 %51
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @resize(i64 noundef %0, %struct.hsearch_data* nocapture noundef readonly %1) unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.hsearch_data, %struct.hsearch_data* %1, i64 0, i32 0
  %4 = load %struct.__tab*, %struct.__tab** %3, align 8, !tbaa !3
  %5 = getelementptr inbounds %struct.__tab, %struct.__tab* %4, i64 0, i32 0
  %6 = load %struct.entry*, %struct.entry** %5, align 8, !tbaa !9
  %7 = getelementptr inbounds %struct.__tab, %struct.__tab* %4, i64 0, i32 1
  %8 = load i64, i64* %7, align 8, !tbaa !19
  %9 = getelementptr inbounds %struct.entry, %struct.entry* %6, i64 %8
  %10 = icmp ult i64 %0, -9223372036854775808
  %11 = select i1 %10, i64 %0, i64 -9223372036854775808
  br label %12

12:                                               ; preds = %12, %2
  %13 = phi i64 [ 8, %2 ], [ %15, %12 ]
  %14 = icmp ult i64 %13, %11
  %15 = shl i64 %13, 1
  br i1 %14, label %12, label %16

16:                                               ; preds = %12
  %17 = getelementptr inbounds %struct.entry, %struct.entry* %9, i64 1
  %18 = tail call i8* @calloc(i64 noundef %13, i64 noundef 16) #5
  %19 = bitcast %struct.hsearch_data* %1 to i8***
  %20 = load i8**, i8*** %19, align 8, !tbaa !3
  store i8* %18, i8** %20, align 8, !tbaa !9
  %21 = icmp eq i8* %18, null
  br i1 %21, label %22, label %24

22:                                               ; preds = %16
  %23 = bitcast i8** %20 to %struct.entry**
  store %struct.entry* %6, %struct.entry** %23, align 8, !tbaa !9
  br label %80

24:                                               ; preds = %16
  %25 = add i64 %13, -1
  %26 = getelementptr inbounds i8*, i8** %20, i64 1
  %27 = bitcast i8** %26 to i64*
  store i64 %25, i64* %27, align 8, !tbaa !19
  %28 = icmp eq %struct.entry* %6, null
  br i1 %28, label %80, label %29

29:                                               ; preds = %24
  %30 = icmp ult %struct.entry* %6, %17
  br i1 %30, label %31, label %78

31:                                               ; preds = %29, %75
  %32 = phi %struct.entry* [ %76, %75 ], [ %6, %29 ]
  %33 = getelementptr inbounds %struct.entry, %struct.entry* %32, i64 0, i32 0
  %34 = load i8*, i8** %33, align 8, !tbaa !14
  %35 = icmp eq i8* %34, null
  br i1 %35, label %75, label %36

36:                                               ; preds = %31
  %37 = load i8, i8* %34, align 1, !tbaa !13
  %38 = icmp eq i8 %37, 0
  br i1 %38, label %49, label %39

39:                                               ; preds = %36, %39
  %40 = phi i8 [ %47, %39 ], [ %37, %36 ]
  %41 = phi i64 [ %46, %39 ], [ 0, %36 ]
  %42 = phi i8* [ %44, %39 ], [ %34, %36 ]
  %43 = mul i64 %41, 31
  %44 = getelementptr inbounds i8, i8* %42, i64 1
  %45 = zext i8 %40 to i64
  %46 = add i64 %43, %45
  %47 = load i8, i8* %44, align 1, !tbaa !13
  %48 = icmp eq i8 %47, 0
  br i1 %48, label %49, label %39

49:                                               ; preds = %39, %36
  %50 = phi i64 [ 0, %36 ], [ %46, %39 ]
  %51 = load %struct.__tab*, %struct.__tab** %3, align 8, !tbaa !3
  %52 = getelementptr inbounds %struct.__tab, %struct.__tab* %51, i64 0, i32 0
  %53 = load %struct.entry*, %struct.entry** %52, align 8, !tbaa !9
  %54 = getelementptr inbounds %struct.__tab, %struct.__tab* %51, i64 0, i32 1
  %55 = load i64, i64* %54, align 8, !tbaa !19
  %56 = and i64 %55, %50
  %57 = getelementptr inbounds %struct.entry, %struct.entry* %53, i64 %56
  %58 = getelementptr inbounds %struct.entry, %struct.entry* %57, i64 0, i32 0
  %59 = load i8*, i8** %58, align 8, !tbaa !14
  %60 = icmp eq i8* %59, null
  br i1 %60, label %71, label %61

61:                                               ; preds = %49, %61
  %62 = phi i64 [ %64, %61 ], [ 1, %49 ]
  %63 = phi i64 [ %65, %61 ], [ %50, %49 ]
  %64 = add i64 %62, 1
  %65 = add i64 %62, %63
  %66 = and i64 %55, %65
  %67 = getelementptr inbounds %struct.entry, %struct.entry* %53, i64 %66
  %68 = getelementptr inbounds %struct.entry, %struct.entry* %67, i64 0, i32 0
  %69 = load i8*, i8** %68, align 8, !tbaa !14
  %70 = icmp eq i8* %69, null
  br i1 %70, label %71, label %61

71:                                               ; preds = %61, %49
  %72 = phi %struct.entry* [ %57, %49 ], [ %67, %61 ]
  %73 = bitcast %struct.entry* %72 to i8*
  %74 = bitcast %struct.entry* %32 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %73, i8* noundef nonnull align 8 dereferenceable(16) %74, i64 16, i1 false) #7, !tbaa.struct !16
  br label %75

75:                                               ; preds = %31, %71
  %76 = getelementptr inbounds %struct.entry, %struct.entry* %32, i64 1
  %77 = icmp ult %struct.entry* %32, %9
  br i1 %77, label %31, label %78

78:                                               ; preds = %75, %29
  %79 = bitcast %struct.entry* %6 to i8*
  tail call void @free(i8* noundef nonnull %79) #5
  br label %80

80:                                               ; preds = %24, %78, %22
  %81 = phi i32 [ 1, %78 ], [ 0, %22 ], [ 1, %24 ]
  ret i32 %81
}

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind optsize strictfp
define internal fastcc %struct.entry* @lookup(i8* noundef %0, i64 noundef %1, %struct.hsearch_data* nocapture noundef readonly %2) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.hsearch_data, %struct.hsearch_data* %2, i64 0, i32 0
  %5 = load %struct.__tab*, %struct.__tab** %4, align 8, !tbaa !3
  %6 = getelementptr inbounds %struct.__tab, %struct.__tab* %5, i64 0, i32 0
  %7 = load %struct.entry*, %struct.entry** %6, align 8, !tbaa !9
  %8 = getelementptr inbounds %struct.__tab, %struct.__tab* %5, i64 0, i32 1
  %9 = load i64, i64* %8, align 8, !tbaa !19
  %10 = and i64 %9, %1
  %11 = getelementptr inbounds %struct.entry, %struct.entry* %7, i64 %10
  %12 = getelementptr inbounds %struct.entry, %struct.entry* %11, i64 0, i32 0
  %13 = load i8*, i8** %12, align 8, !tbaa !14
  %14 = icmp eq i8* %13, null
  br i1 %14, label %36, label %15

15:                                               ; preds = %3
  %16 = tail call i32 @strcmp(i8* noundef nonnull %13, i8* noundef %0) #5
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %36, label %22

18:                                               ; preds = %22
  %19 = add i64 %23, 1
  %20 = tail call i32 @strcmp(i8* noundef nonnull %34, i8* noundef %0) #5
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %36, label %22

22:                                               ; preds = %15, %18
  %23 = phi i64 [ %19, %18 ], [ 1, %15 ]
  %24 = phi i64 [ %25, %18 ], [ %1, %15 ]
  %25 = add i64 %24, %23
  %26 = load %struct.__tab*, %struct.__tab** %4, align 8, !tbaa !3
  %27 = getelementptr inbounds %struct.__tab, %struct.__tab* %26, i64 0, i32 0
  %28 = load %struct.entry*, %struct.entry** %27, align 8, !tbaa !9
  %29 = getelementptr inbounds %struct.__tab, %struct.__tab* %26, i64 0, i32 1
  %30 = load i64, i64* %29, align 8, !tbaa !19
  %31 = and i64 %30, %25
  %32 = getelementptr inbounds %struct.entry, %struct.entry* %28, i64 %31
  %33 = getelementptr inbounds %struct.entry, %struct.entry* %32, i64 0, i32 0
  %34 = load i8*, i8** %33, align 8, !tbaa !14
  %35 = icmp eq i8* %34, null
  br i1 %35, label %36, label %18

36:                                               ; preds = %22, %18, %15, %3
  %37 = phi %struct.entry* [ %11, %3 ], [ %11, %15 ], [ %32, %18 ], [ %32, %22 ]
  ret %struct.entry* %37
}

; Function Attrs: optsize
declare i32 @strcmp(i8* noundef, i8* noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #4 = { nobuiltin optsize strictfp "no-builtins" }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nounwind strictfp }
attributes #7 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"hsearch_data", !5, i64 0, !8, i64 8, !8, i64 12}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"int", !6, i64 0}
!9 = !{!10, !5, i64 0}
!10 = !{!"__tab", !5, i64 0, !11, i64 8, !11, i64 16}
!11 = !{!"long", !6, i64 0}
!12 = !{!5, !5, i64 0}
!13 = !{!6, !6, i64 0}
!14 = !{!15, !5, i64 0}
!15 = !{!"entry", !5, i64 0, !5, i64 8}
!16 = !{i64 0, i64 8, !12, i64 8, i64 8, !12}
!17 = !{i64 0, i64 8, !12}
!18 = !{!10, !11, i64 16}
!19 = !{!10, !11, i64 8}
