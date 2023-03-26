; ModuleID = 'src/thread/pthread_setattr_default_np.c'
source_filename = "src/thread/pthread_setattr_default_np.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_attr_t = type { %union.anon }
%union.anon = type { [7 x i64] }

@__default_stacksize = external hidden local_unnamed_addr global i32, align 4
@__default_guardsize = external hidden local_unnamed_addr global i32, align 4

; Function Attrs: nounwind optsize strictfp
define i32 @pthread_setattr_default_np(%struct.pthread_attr_t* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = alloca %struct.pthread_attr_t, align 16
  %3 = alloca %struct.pthread_attr_t, align 8
  %4 = bitcast %struct.pthread_attr_t* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %4) #5
  %5 = bitcast %struct.pthread_attr_t* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(56) %4, i8* noundef nonnull align 8 dereferenceable(56) %5, i64 56, i1 false) #6, !tbaa.struct !3
  %6 = bitcast %struct.pthread_attr_t* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %6) #5
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(56) %6, i8 0, i64 56, i1 false) #6
  %7 = bitcast %struct.pthread_attr_t* %2 to <2 x i64>*
  store <2 x i64> zeroinitializer, <2 x i64>* %7, align 16, !tbaa !4
  %8 = call i32 @memcmp(i8* noundef nonnull %4, i8* noundef nonnull %6, i64 noundef 56) #7
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %27

10:                                               ; preds = %1
  %11 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %0, i64 0, i32 0, i32 0, i64 0
  %12 = load i64, i64* %11, align 8, !tbaa !4
  %13 = icmp ult i64 %12, 8388608
  %14 = select i1 %13, i64 %12, i64 8388608
  %15 = trunc i64 %14 to i32
  %16 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %0, i64 0, i32 0, i32 0, i64 1
  %17 = load i64, i64* %16, align 8, !tbaa !4
  %18 = icmp ult i64 %17, 1048576
  %19 = select i1 %18, i64 %17, i64 1048576
  %20 = trunc i64 %19 to i32
  call void @__inhibit_ptc() #7
  %21 = load i32, i32* @__default_stacksize, align 4, !tbaa !7
  %22 = icmp ugt i32 %21, %15
  %23 = select i1 %22, i32 %21, i32 %15
  store i32 %23, i32* @__default_stacksize, align 4, !tbaa !7
  %24 = load i32, i32* @__default_guardsize, align 4, !tbaa !7
  %25 = icmp ugt i32 %24, %20
  %26 = select i1 %25, i32 %24, i32 %20
  store i32 %26, i32* @__default_guardsize, align 4, !tbaa !7
  call void @__release_ptc() #7
  br label %27

27:                                               ; preds = %1, %10
  %28 = phi i32 [ 0, %10 ], [ 22, %1 ]
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %6) #5
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %4) #5
  ret i32 %28
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: optsize
declare i32 @memcmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare hidden void @__inhibit_ptc() local_unnamed_addr #4

; Function Attrs: optsize
declare hidden void @__release_ptc() local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define i32 @pthread_getattr_default_np(%struct.pthread_attr_t* noundef writeonly %0) local_unnamed_addr #0 {
  %2 = alloca %struct.pthread_attr_t, align 8
  tail call void @__acquire_ptc() #7
  %3 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %2, i64 0, i32 0, i32 0, i64 0
  %4 = load i32, i32* @__default_stacksize, align 4, !tbaa !7
  %5 = zext i32 %4 to i64
  store i64 %5, i64* %3, align 8, !tbaa !9
  %6 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %2, i64 0, i32 0, i32 0, i64 1
  %7 = load i32, i32* @__default_guardsize, align 4, !tbaa !7
  %8 = zext i32 %7 to i64
  store i64 %8, i64* %6, align 8, !tbaa !9
  %9 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %2, i64 0, i32 0, i32 0, i64 2
  %10 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %2, i64 0, i32 0, i32 0, i64 7
  br label %11

11:                                               ; preds = %11, %1
  %12 = phi i64* [ %9, %1 ], [ %13, %11 ]
  store i64 0, i64* %12, align 8, !tbaa !9
  %13 = getelementptr inbounds i64, i64* %12, i64 1
  %14 = icmp eq i64* %13, %10
  br i1 %14, label %15, label %11

15:                                               ; preds = %11
  %16 = bitcast %struct.pthread_attr_t* %0 to i8*
  %17 = bitcast %struct.pthread_attr_t* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %16, i8* nonnull align 8 %17, i64 56, i1 true) #6, !tbaa.struct !3
  call void @__release_ptc() #7
  ret i32 0
}

; Function Attrs: optsize
declare hidden void @__acquire_ptc() local_unnamed_addr #4

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #4 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind strictfp }
attributes #6 = { strictfp }
attributes #7 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 0, i64 56, !4, i64 0, i64 56, !4, i64 0, i64 56, !4}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
!9 = !{!10, !10, i64 0}
!10 = !{!"long", !5, i64 0}
