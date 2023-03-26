; ModuleID = 'src/signal/sigismember.c'
source_filename = "src/signal/sigismember.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__sigset_t = type { [16 x i64] }

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn
define i32 @sigismember(%struct.__sigset_t* nocapture noundef readonly %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = add nsw i32 %1, -1
  %4 = icmp ugt i32 %3, 63
  br i1 %4, label %13, label %5

5:                                                ; preds = %2
  %6 = getelementptr inbounds %struct.__sigset_t, %struct.__sigset_t* %0, i64 0, i32 0, i64 0
  %7 = load i64, i64* %6, align 8, !tbaa !3
  %8 = zext i32 %3 to i64
  %9 = shl nuw i64 1, %8
  %10 = and i64 %7, %9
  %11 = icmp ne i64 %10, 0
  %12 = zext i1 %11 to i32
  br label %13

13:                                               ; preds = %2, %5
  %14 = phi i32 [ %12, %5 ], [ 0, %2 ]
  ret i32 %14
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"long", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
