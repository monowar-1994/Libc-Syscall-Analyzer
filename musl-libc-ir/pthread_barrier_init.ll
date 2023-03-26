; ModuleID = 'src/thread/pthread_barrier_init.c'
source_filename = "src/thread/pthread_barrier_init.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_barrier_t = type { %union.anon }
%union.anon = type { [4 x i8*] }
%struct.pthread_barrierattr_t = type { i32 }

; Function Attrs: nofree nounwind optsize strictfp
define i32 @pthread_barrier_init(%struct.pthread_barrier_t* noalias noundef %0, %struct.pthread_barrierattr_t* noalias noundef readonly %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 8
  %6 = alloca [20 x i8], align 4
  %7 = add i32 %2, -1
  %8 = icmp slt i32 %2, 1
  br i1 %8, label %25, label %9

9:                                                ; preds = %3
  store i8* null, i8** %4, align 8
  %10 = getelementptr inbounds [20 x i8], [20 x i8]* %6, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(20) %10, i8 0, i64 20, i1 false)
  %11 = icmp eq %struct.pthread_barrierattr_t* %1, null
  br i1 %11, label %15, label %12

12:                                               ; preds = %9
  %13 = getelementptr inbounds %struct.pthread_barrierattr_t, %struct.pthread_barrierattr_t* %1, i64 0, i32 0
  %14 = load i32, i32* %13, align 4, !tbaa !3
  br label %15

15:                                               ; preds = %9, %12
  %16 = phi i32 [ %14, %12 ], [ 0, %9 ]
  %17 = or i32 %16, %7
  store i32 %17, i32* %5, align 8, !tbaa !8
  %18 = getelementptr inbounds %struct.pthread_barrier_t, %struct.pthread_barrier_t* %0, i64 0, i32 0, i32 0, i64 0
  %19 = load volatile i8*, i8** %4, align 8, !tbaa.struct !9
  store volatile i8* %19, i8** %18, align 8, !tbaa.struct !9
  %20 = getelementptr inbounds %struct.pthread_barrier_t, %struct.pthread_barrier_t* %0, i64 0, i32 0, i32 0, i64 1
  %21 = bitcast i8** %20 to i32*
  %22 = load volatile i32, i32* %5, align 8, !tbaa.struct !11
  store volatile i32 %22, i32* %21, align 8, !tbaa.struct !11
  %23 = bitcast %struct.pthread_barrier_t* %0 to i8*
  %24 = getelementptr inbounds i8, i8* %23, i64 12
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 %24, i8* nonnull align 4 %10, i64 20, i1 true), !tbaa.struct !12
  br label %25

25:                                               ; preds = %3, %15
  %26 = phi i32 [ 0, %15 ], [ 22, %3 ]
  ret i32 %26
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { nofree nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"", !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!5, !5, i64 0}
!9 = !{i64 0, i64 32, !10, i64 0, i64 32, !10, i64 0, i64 32, !10}
!10 = !{!6, !6, i64 0}
!11 = !{i64 0, i64 24, !10, i64 0, i64 24, !10, i64 0, i64 24, !10}
!12 = !{i64 0, i64 20, !10, i64 0, i64 20, !10, i64 0, i64 20, !10}
