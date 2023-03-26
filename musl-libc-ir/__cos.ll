; ModuleID = 'src/math/__cos.c'
source_filename = "src/math/__cos.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define hidden double @__cos(double noundef %0, double noundef %1) local_unnamed_addr #0 {
  %3 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %4 = tail call double @llvm.experimental.constrained.fmul.f64(double %3, double %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %5 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %3, double 0x3EFA01A019CB1590, double 0xBF56C16C16C15177, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %6 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %3, double %5, double 0x3FA555555555554C, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %7 = tail call double @llvm.experimental.constrained.fmul.f64(double %4, double %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %8 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %3, double 0xBDA8FAE9BE8838D4, double 0x3E21EE9EBDB4B1C4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %9 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %3, double %8, double 0xBE927E4F809C52AD, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %10 = tail call double @llvm.experimental.constrained.fmul.f64(double %7, double %9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %11 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %3, double %6, double %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %12 = tail call double @llvm.experimental.constrained.fmul.f64(double 5.000000e-01, double %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %13 = tail call double @llvm.experimental.constrained.fsub.f64(double 1.000000e+00, double %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %14 = tail call double @llvm.experimental.constrained.fsub.f64(double 1.000000e+00, double %13, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %15 = tail call double @llvm.experimental.constrained.fsub.f64(double %14, double %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %16 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %17 = fneg double %16
  %18 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %3, double %11, double %17, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %19 = tail call double @llvm.experimental.constrained.fadd.f64(double %15, double %18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %20 = tail call double @llvm.experimental.constrained.fadd.f64(double %13, double %19, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  ret double %20
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #1

attributes #0 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
