; ModuleID = 'src/thread/pthread_condattr_setpshared.c'
source_filename = "src/thread/pthread_condattr_setpshared.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_condattr_t = type { i32 }

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define i32 @pthread_condattr_setpshared(%struct.pthread_condattr_t* nocapture noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp ugt i32 %1, 1
  br i1 %3, label %10, label %4

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct.pthread_condattr_t, %struct.pthread_condattr_t* %0, i64 0, i32 0
  %6 = load i32, i32* %5, align 4, !tbaa !3
  %7 = and i32 %6, 2147483647
  %8 = shl nuw i32 %1, 31
  %9 = or i32 %7, %8
  store i32 %9, i32* %5, align 4, !tbaa !3
  br label %10

10:                                               ; preds = %2, %4
  %11 = phi i32 [ 0, %4 ], [ 22, %2 ]
  ret i32 %11
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
