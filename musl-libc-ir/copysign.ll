; ModuleID = 'src/math/copysign.c'
source_filename = "src/math/copysign.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define double @copysign(double noundef %0, double noundef %1) local_unnamed_addr #0 {
  %3 = bitcast double %0 to i64
  %4 = and i64 %3, 9223372036854775807
  %5 = bitcast double %1 to i64
  %6 = and i64 %5, -9223372036854775808
  %7 = or i64 %6, %4
  %8 = bitcast i64 %7 to double
  ret double %8
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
