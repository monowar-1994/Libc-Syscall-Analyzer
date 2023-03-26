; ModuleID = 'src/string/wcscmp.c'
source_filename = "src/string/wcscmp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind readonly strictfp
define i32 @wcscmp(i32* nocapture noundef readonly %0, i32* nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = load i32, i32* %0, align 4, !tbaa !3
  %4 = load i32, i32* %1, align 4, !tbaa !3
  %5 = icmp ne i32 %3, %4
  %6 = icmp eq i32 %3, 0
  %7 = or i1 %6, %5
  %8 = icmp eq i32 %4, 0
  %9 = or i1 %8, %7
  br i1 %9, label %22, label %10

10:                                               ; preds = %2, %10
  %11 = phi i32* [ %14, %10 ], [ %1, %2 ]
  %12 = phi i32* [ %13, %10 ], [ %0, %2 ]
  %13 = getelementptr inbounds i32, i32* %12, i64 1
  %14 = getelementptr inbounds i32, i32* %11, i64 1
  %15 = load i32, i32* %13, align 4, !tbaa !3
  %16 = load i32, i32* %14, align 4, !tbaa !3
  %17 = icmp ne i32 %15, %16
  %18 = icmp eq i32 %15, 0
  %19 = or i1 %18, %17
  %20 = icmp eq i32 %16, 0
  %21 = or i1 %20, %19
  br i1 %21, label %22, label %10

22:                                               ; preds = %10, %2
  %23 = phi i32 [ %3, %2 ], [ %15, %10 ]
  %24 = phi i32 [ %4, %2 ], [ %16, %10 ]
  %25 = sub nsw i32 %23, %24
  ret i32 %25
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
