; ModuleID = 'src/math/__sin.c'
source_filename = "src/math/__sin.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define hidden double @__sin(double noundef %0, double noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %5 = tail call double @llvm.experimental.constrained.fmul.f64(double %4, double %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %6 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %4, double 0x3EC71DE357B1FE7D, double 0xBF2A01A019C161D5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %7 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %4, double %6, double 0x3F8111111110F8A6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %8 = tail call double @llvm.experimental.constrained.fmul.f64(double %4, double %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %9 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %4, double 0x3DE5D93A5ACFD57C, double 0xBE5AE5E68A2B9CEB, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %10 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %8, double %9, double %7, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %11 = tail call double @llvm.experimental.constrained.fmul.f64(double %4, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %12 = icmp eq i32 %2, 0
  br i1 %12, label %13, label %16

13:                                               ; preds = %3
  %14 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %4, double %10, double 0xBFC5555555555549, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %15 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %11, double %14, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %25

16:                                               ; preds = %3
  %17 = tail call double @llvm.experimental.constrained.fmul.f64(double %11, double %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %18 = fneg double %17
  %19 = tail call double @llvm.experimental.constrained.fmuladd.f64(double 5.000000e-01, double %1, double %18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %20 = fneg double %1
  %21 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %4, double %19, double %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %22 = fneg double %11
  %23 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %22, double 0xBFC5555555555549, double %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %24 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double %23, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %25

25:                                               ; preds = %16, %13
  %26 = phi double [ %15, %13 ], [ %24, %16 ]
  ret double %26
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

attributes #0 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
