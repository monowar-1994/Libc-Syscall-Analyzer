; ModuleID = 'src/thread/pthread_rwlockattr_init.c'
source_filename = "src/thread/pthread_rwlockattr_init.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_rwlockattr_t = type { [2 x i32] }

; Function Attrs: nofree norecurse nosync nounwind optsize strictfp writeonly
define i32 @pthread_rwlockattr_init(%struct.pthread_rwlockattr_t* nocapture noundef writeonly %0) local_unnamed_addr #0 {
  %2 = bitcast %struct.pthread_rwlockattr_t* %0 to i64*
  store i64 0, i64* %2, align 4, !tbaa !3
  ret i32 0
}

attributes #0 = { nofree norecurse nosync nounwind optsize strictfp writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
