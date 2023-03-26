; ModuleID = 'src/math/__fpclassifyl.c'
source_filename = "src/math/__fpclassifyl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define i32 @__fpclassifyl(x86_fp80 noundef %0) local_unnamed_addr #0 {
  %2 = bitcast x86_fp80 %0 to i80
  %3 = lshr i80 %2, 64
  %4 = trunc i80 %3 to i32
  %5 = and i32 %4, 32767
  %6 = trunc i80 %2 to i64
  %7 = icmp ne i32 %5, 0
  %8 = icmp slt i64 %6, 0
  %9 = or i1 %8, %7
  br i1 %9, label %13, label %10

10:                                               ; preds = %1
  %11 = icmp eq i64 %6, 0
  %12 = select i1 %11, i32 2, i32 3
  br label %24

13:                                               ; preds = %1
  %14 = icmp eq i32 %5, 32767
  br i1 %14, label %15, label %20

15:                                               ; preds = %13
  br i1 %8, label %16, label %24

16:                                               ; preds = %15
  %17 = and i64 %6, 9223372036854775807
  %18 = icmp eq i64 %17, 0
  %19 = zext i1 %18 to i32
  br label %24

20:                                               ; preds = %13
  %21 = lshr i80 %2, 61
  %22 = trunc i80 %21 to i32
  %23 = and i32 %22, 4
  br label %24

24:                                               ; preds = %20, %15, %16, %10
  %25 = phi i32 [ %19, %16 ], [ %12, %10 ], [ 0, %15 ], [ %23, %20 ]
  ret i32 %25
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
