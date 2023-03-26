; ModuleID = 'src/complex/cacosh.c'
source_filename = "src/complex/cacosh.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define { double, double } @cacosh(double noundef %0, double noundef %1) local_unnamed_addr #0 {
  %3 = bitcast double %1 to i64
  %4 = tail call { double, double } @cacos(double noundef %0, double noundef %1) #2
  %5 = extractvalue { double, double } %4, 0
  %6 = extractvalue { double, double } %4, 1
  %7 = icmp sgt i64 %3, -1
  %8 = fneg double %5
  %9 = fneg double %6
  %10 = select i1 %7, double %9, double %6
  %11 = select i1 %7, double %5, double %8
  %12 = insertvalue { double, double } poison, double %10, 0
  %13 = insertvalue { double, double } %12, double %11, 1
  ret { double, double } %13
}

; Function Attrs: optsize
declare { double, double } @cacos(double noundef, double noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
