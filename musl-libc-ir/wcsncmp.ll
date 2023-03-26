; ModuleID = 'src/string/wcsncmp.c'
source_filename = "src/string/wcsncmp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind readonly strictfp
define i32 @wcsncmp(i32* nocapture noundef readonly %0, i32* nocapture noundef readonly %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = icmp eq i64 %2, 0
  br i1 %4, label %23, label %5

5:                                                ; preds = %3, %16
  %6 = phi i64 [ %17, %16 ], [ %2, %3 ]
  %7 = phi i32* [ %19, %16 ], [ %1, %3 ]
  %8 = phi i32* [ %18, %16 ], [ %0, %3 ]
  %9 = load i32, i32* %8, align 4, !tbaa !3
  %10 = load i32, i32* %7, align 4, !tbaa !3
  %11 = icmp ne i32 %9, %10
  %12 = icmp eq i32 %9, 0
  %13 = or i1 %12, %11
  %14 = icmp eq i32 %10, 0
  %15 = or i1 %14, %13
  br i1 %15, label %21, label %16

16:                                               ; preds = %5
  %17 = add i64 %6, -1
  %18 = getelementptr inbounds i32, i32* %8, i64 1
  %19 = getelementptr inbounds i32, i32* %7, i64 1
  %20 = icmp eq i64 %17, 0
  br i1 %20, label %23, label %5

21:                                               ; preds = %5
  %22 = sub nsw i32 %9, %10
  br label %23

23:                                               ; preds = %16, %3, %21
  %24 = phi i32 [ %22, %21 ], [ 0, %3 ], [ 0, %16 ]
  ret i32 %24
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
