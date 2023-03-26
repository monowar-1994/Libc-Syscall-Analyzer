; ModuleID = 'src/math/__fpclassifyf.c'
source_filename = "src/math/__fpclassifyf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define i32 @__fpclassifyf(float noundef %0) local_unnamed_addr #0 {
  %2 = bitcast float %0 to i32
  %3 = lshr i32 %2, 23
  %4 = trunc i32 %3 to i8
  switch i8 %4, label %13 [
    i8 0, label %5
    i8 -1, label %9
  ]

5:                                                ; preds = %1
  %6 = and i32 %2, 2147483647
  %7 = icmp eq i32 %6, 0
  %8 = select i1 %7, i32 2, i32 3
  br label %13

9:                                                ; preds = %1
  %10 = and i32 %2, 8388607
  %11 = icmp eq i32 %10, 0
  %12 = zext i1 %11 to i32
  br label %13

13:                                               ; preds = %1, %9, %5
  %14 = phi i32 [ %12, %9 ], [ %8, %5 ], [ 4, %1 ]
  ret i32 %14
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
