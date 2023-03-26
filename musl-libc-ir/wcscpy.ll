; ModuleID = 'src/string/wcscpy.c'
source_filename = "src/string/wcscpy.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind strictfp
define i32* @wcscpy(i32* noalias noundef returned writeonly %0, i32* noalias nocapture noundef readonly %1) local_unnamed_addr #0 {
  br label %3

3:                                                ; preds = %3, %2
  %4 = phi i32* [ %1, %2 ], [ %6, %3 ]
  %5 = phi i32* [ %0, %2 ], [ %8, %3 ]
  %6 = getelementptr inbounds i32, i32* %4, i64 1
  %7 = load i32, i32* %4, align 4, !tbaa !3
  %8 = getelementptr inbounds i32, i32* %5, i64 1
  store i32 %7, i32* %5, align 4, !tbaa !3
  %9 = icmp eq i32 %7, 0
  br i1 %9, label %10, label %3

10:                                               ; preds = %3
  ret i32* %0
}

attributes #0 = { nofree norecurse nosync nounwind strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
