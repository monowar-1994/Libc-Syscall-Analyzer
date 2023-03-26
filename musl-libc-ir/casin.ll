; ModuleID = 'src/complex/casin.c'
source_filename = "src/complex/casin.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define { double, double } @casin(double noundef %0, double noundef %1) local_unnamed_addr #0 {
  %3 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %4 = tail call double @llvm.experimental.constrained.fadd.f64(double %0, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %5 = fneg double %3
  %6 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %5, double %4, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %7 = tail call double @llvm.experimental.constrained.fmul.f64(double -2.000000e+00, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %8 = tail call double @llvm.experimental.constrained.fmul.f64(double %7, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %9 = fneg double %1
  %10 = tail call { double, double } @csqrt(double noundef %6, double noundef %8) #4
  %11 = extractvalue { double, double } %10, 0
  %12 = extractvalue { double, double } %10, 1
  %13 = tail call double @llvm.experimental.constrained.fadd.f64(double %9, double %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %14 = tail call double @llvm.experimental.constrained.fadd.f64(double %0, double %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %15 = tail call { double, double } @clog(double noundef %13, double noundef %14) #4
  %16 = extractvalue { double, double } %15, 0
  %17 = extractvalue { double, double } %15, 1
  %18 = fneg double %16
  %19 = insertvalue { double, double } poison, double %17, 0
  %20 = insertvalue { double, double } %19, double %18, 1
  ret { double, double } %20
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #1

; Function Attrs: optsize
declare { double, double } @clog(double noundef, double noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare { double, double } @csqrt(double noundef, double noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
