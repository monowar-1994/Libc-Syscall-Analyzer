; ModuleID = 'src/math/__fpclassify.c'
source_filename = "src/math/__fpclassify.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define i32 @__fpclassify(double noundef %0) local_unnamed_addr #0 {
  %2 = bitcast double %0 to i64
  %3 = lshr i64 %2, 52
  %4 = trunc i64 %3 to i32
  %5 = and i32 %4, 2047
  switch i32 %5, label %14 [
    i32 0, label %6
    i32 2047, label %10
  ]

6:                                                ; preds = %1
  %7 = and i64 %2, 9223372036854775807
  %8 = icmp eq i64 %7, 0
  %9 = select i1 %8, i32 2, i32 3
  br label %14

10:                                               ; preds = %1
  %11 = and i64 %2, 4503599627370495
  %12 = icmp eq i64 %11, 0
  %13 = zext i1 %12 to i32
  br label %14

14:                                               ; preds = %1, %10, %6
  %15 = phi i32 [ %13, %10 ], [ %9, %6 ], [ 4, %1 ]
  ret i32 %15
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
