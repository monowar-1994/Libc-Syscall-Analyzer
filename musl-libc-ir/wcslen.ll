; ModuleID = 'src/string/wcslen.c'
source_filename = "src/string/wcslen.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind readonly strictfp
define i64 @wcslen(i32* noundef %0) local_unnamed_addr #0 {
  br label %2

2:                                                ; preds = %2, %1
  %3 = phi i32* [ %0, %1 ], [ %6, %2 ]
  %4 = load i32, i32* %3, align 4, !tbaa !3
  %5 = icmp eq i32 %4, 0
  %6 = getelementptr inbounds i32, i32* %3, i64 1
  br i1 %5, label %7, label %2

7:                                                ; preds = %2
  %8 = ptrtoint i32* %3 to i64
  %9 = ptrtoint i32* %0 to i64
  %10 = sub i64 %8, %9
  %11 = ashr exact i64 %10, 2
  ret i64 %11
}

attributes #0 = { nofree norecurse nosync nounwind readonly strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
