; ModuleID = 'src/thread/pthread_attr_setschedparam.c'
source_filename = "src/thread/pthread_attr_setschedparam.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_attr_t = type { %union.anon }
%union.anon = type { [7 x i64] }
%struct.sched_param = type { i32, i32, [2 x %struct.anon], i32 }
%struct.anon = type { i64, i64 }

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define i32 @pthread_attr_setschedparam(%struct.pthread_attr_t* noalias nocapture noundef writeonly %0, %struct.sched_param* noalias nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.sched_param, %struct.sched_param* %1, i64 0, i32 0
  %4 = load i32, i32* %3, align 8, !tbaa !3
  %5 = bitcast %struct.pthread_attr_t* %0 to [14 x i32]*
  %6 = getelementptr inbounds [14 x i32], [14 x i32]* %5, i64 0, i64 9
  store i32 %4, i32* %6, align 4, !tbaa !8
  ret i32 0
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"sched_param", !5, i64 0, !5, i64 4, !6, i64 8, !5, i64 40}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!6, !6, i64 0}
