; ModuleID = 'src/math/__cosdf.c'
source_filename = "src/math/__cosdf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define hidden float @__cosdf(double noundef %0) local_unnamed_addr #0 {
  %2 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %3 = tail call double @llvm.experimental.constrained.fmul.f64(double %2, double %2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %4 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %2, double 0x3EF99342E0EE5069, double 0xBF56C087E80F1E27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %5 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %2, double 0xBFDFFFFFFD0C5E81, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %6 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %3, double 0x3FA55553E1053A42, double %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %7 = tail call double @llvm.experimental.constrained.fmul.f64(double %3, double %2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %8 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %7, double %4, double %6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %9 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  ret float %9
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #1

attributes #0 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
