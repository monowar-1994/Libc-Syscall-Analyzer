; ModuleID = 'src/thread/pthread_attr_get.c'
source_filename = "src/thread/pthread_attr_get.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_attr_t = type { %union.anon }
%union.anon = type { [7 x i64] }
%struct.sched_param = type { i32, i32, [2 x %struct.anon], i32 }
%struct.anon = type { i64, i64 }
%struct.pthread_barrierattr_t = type { i32 }
%struct.pthread_condattr_t = type { i32 }
%struct.pthread_mutexattr_t = type { i32 }
%struct.pthread_rwlockattr_t = type { [2 x i32] }

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define i32 @pthread_attr_getdetachstate(%struct.pthread_attr_t* nocapture noundef readonly %0, i32* nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %0, i64 0, i32 0, i32 0, i64 3
  %4 = bitcast i64* %3 to i32*
  %5 = load i32, i32* %4, align 8, !tbaa !3
  store i32 %5, i32* %1, align 4, !tbaa !6
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define i32 @pthread_attr_getguardsize(%struct.pthread_attr_t* noalias nocapture noundef readonly %0, i64* noalias nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %0, i64 0, i32 0, i32 0, i64 1
  %4 = load i64, i64* %3, align 8, !tbaa !3
  store i64 %4, i64* %1, align 8, !tbaa !8
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define i32 @pthread_attr_getinheritsched(%struct.pthread_attr_t* noalias nocapture noundef readonly %0, i32* noalias nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = bitcast %struct.pthread_attr_t* %0 to [14 x i32]*
  %4 = getelementptr inbounds [14 x i32], [14 x i32]* %3, i64 0, i64 7
  %5 = load i32, i32* %4, align 4, !tbaa !3
  store i32 %5, i32* %1, align 4, !tbaa !6
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define i32 @pthread_attr_getschedparam(%struct.pthread_attr_t* noalias nocapture noundef readonly %0, %struct.sched_param* noalias nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = bitcast %struct.pthread_attr_t* %0 to [14 x i32]*
  %4 = getelementptr inbounds [14 x i32], [14 x i32]* %3, i64 0, i64 9
  %5 = load i32, i32* %4, align 4, !tbaa !3
  %6 = getelementptr inbounds %struct.sched_param, %struct.sched_param* %1, i64 0, i32 0
  store i32 %5, i32* %6, align 8, !tbaa !10
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define i32 @pthread_attr_getschedpolicy(%struct.pthread_attr_t* noalias nocapture noundef readonly %0, i32* noalias nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %0, i64 0, i32 0, i32 0, i64 4
  %4 = bitcast i64* %3 to i32*
  %5 = load i32, i32* %4, align 8, !tbaa !3
  store i32 %5, i32* %1, align 4, !tbaa !6
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn writeonly
define i32 @pthread_attr_getscope(%struct.pthread_attr_t* noalias nocapture noundef readnone %0, i32* noalias nocapture noundef writeonly %1) local_unnamed_addr #1 {
  store i32 0, i32* %1, align 4, !tbaa !6
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define i32 @pthread_attr_getstack(%struct.pthread_attr_t* noalias nocapture noundef readonly %0, i8** noalias nocapture noundef writeonly %1, i64* noalias nocapture noundef writeonly %2) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %0, i64 0, i32 0, i32 0, i64 2
  %5 = load i64, i64* %4, align 8, !tbaa !3
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %12, label %7

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %0, i64 0, i32 0, i32 0, i64 0
  %9 = load i64, i64* %8, align 8, !tbaa !3
  store i64 %9, i64* %2, align 8, !tbaa !8
  %10 = sub i64 %5, %9
  %11 = inttoptr i64 %10 to i8*
  store i8* %11, i8** %1, align 8, !tbaa !12
  br label %12

12:                                               ; preds = %3, %7
  %13 = phi i32 [ 0, %7 ], [ 22, %3 ]
  ret i32 %13
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define i32 @pthread_attr_getstacksize(%struct.pthread_attr_t* noalias nocapture noundef readonly %0, i64* noalias nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %0, i64 0, i32 0, i32 0, i64 0
  %4 = load i64, i64* %3, align 8, !tbaa !3
  store i64 %4, i64* %1, align 8, !tbaa !8
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define i32 @pthread_barrierattr_getpshared(%struct.pthread_barrierattr_t* noalias nocapture noundef readonly %0, i32* noalias nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.pthread_barrierattr_t, %struct.pthread_barrierattr_t* %0, i64 0, i32 0
  %4 = load i32, i32* %3, align 4, !tbaa !14
  %5 = icmp ne i32 %4, 0
  %6 = zext i1 %5 to i32
  store i32 %6, i32* %1, align 4, !tbaa !6
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define i32 @pthread_condattr_getclock(%struct.pthread_condattr_t* noalias nocapture noundef readonly %0, i32* noalias nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.pthread_condattr_t, %struct.pthread_condattr_t* %0, i64 0, i32 0
  %4 = load i32, i32* %3, align 4, !tbaa !14
  %5 = and i32 %4, 2147483647
  store i32 %5, i32* %1, align 4, !tbaa !6
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define i32 @pthread_condattr_getpshared(%struct.pthread_condattr_t* noalias nocapture noundef readonly %0, i32* noalias nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.pthread_condattr_t, %struct.pthread_condattr_t* %0, i64 0, i32 0
  %4 = load i32, i32* %3, align 4, !tbaa !14
  %5 = lshr i32 %4, 31
  store i32 %5, i32* %1, align 4, !tbaa !6
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define i32 @pthread_mutexattr_getprotocol(%struct.pthread_mutexattr_t* noalias nocapture noundef readonly %0, i32* noalias nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.pthread_mutexattr_t, %struct.pthread_mutexattr_t* %0, i64 0, i32 0
  %4 = load i32, i32* %3, align 4, !tbaa !14
  %5 = lshr i32 %4, 3
  %6 = and i32 %5, 1
  store i32 %6, i32* %1, align 4, !tbaa !6
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define i32 @pthread_mutexattr_getpshared(%struct.pthread_mutexattr_t* noalias nocapture noundef readonly %0, i32* noalias nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.pthread_mutexattr_t, %struct.pthread_mutexattr_t* %0, i64 0, i32 0
  %4 = load i32, i32* %3, align 4, !tbaa !14
  %5 = lshr i32 %4, 7
  %6 = and i32 %5, 1
  store i32 %6, i32* %1, align 4, !tbaa !6
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define i32 @pthread_mutexattr_getrobust(%struct.pthread_mutexattr_t* noalias nocapture noundef readonly %0, i32* noalias nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.pthread_mutexattr_t, %struct.pthread_mutexattr_t* %0, i64 0, i32 0
  %4 = load i32, i32* %3, align 4, !tbaa !14
  %5 = lshr i32 %4, 2
  %6 = and i32 %5, 1
  store i32 %6, i32* %1, align 4, !tbaa !6
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define i32 @pthread_mutexattr_gettype(%struct.pthread_mutexattr_t* noalias nocapture noundef readonly %0, i32* noalias nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.pthread_mutexattr_t, %struct.pthread_mutexattr_t* %0, i64 0, i32 0
  %4 = load i32, i32* %3, align 4, !tbaa !14
  %5 = and i32 %4, 3
  store i32 %5, i32* %1, align 4, !tbaa !6
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define i32 @pthread_rwlockattr_getpshared(%struct.pthread_rwlockattr_t* noalias nocapture noundef readonly %0, i32* noalias nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.pthread_rwlockattr_t, %struct.pthread_rwlockattr_t* %0, i64 0, i32 0, i64 0
  %4 = load i32, i32* %3, align 4, !tbaa !6
  store i32 %4, i32* %1, align 4, !tbaa !6
  ret i32 0
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
!8 = !{!9, !9, i64 0}
!9 = !{!"long", !4, i64 0}
!10 = !{!11, !7, i64 0}
!11 = !{!"sched_param", !7, i64 0, !7, i64 4, !4, i64 8, !7, i64 40}
!12 = !{!13, !13, i64 0}
!13 = !{!"any pointer", !4, i64 0}
!14 = !{!15, !7, i64 0}
!15 = !{!"", !7, i64 0}
