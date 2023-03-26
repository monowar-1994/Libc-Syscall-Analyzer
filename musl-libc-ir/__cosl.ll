; ModuleID = 'src/math/__cosl.c'
source_filename = "src/math/__cosl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define hidden x86_fp80 @__cosl(x86_fp80 noundef %0, x86_fp80 noundef %1) local_unnamed_addr #0 {
  %3 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %0, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %4 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0xBF56C16C16C16C10, metadata !"fpexcept.ignore") #2
  %5 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x3EFA01A01A018E22, metadata !"fpexcept.ignore") #2
  %6 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0xBE927E4FB7602F22, metadata !"fpexcept.ignore") #2
  %7 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x3E21EED8CAAECCF1, metadata !"fpexcept.ignore") #2
  %8 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0xBDA9393412BD1529, metadata !"fpexcept.ignore") #2
  %9 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x3D2AAC9D9AF5C43E, metadata !"fpexcept.ignore") #2
  %10 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %3, x86_fp80 %9, x86_fp80 %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %11 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %3, x86_fp80 %10, x86_fp80 %7, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %12 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %3, x86_fp80 %11, x86_fp80 %6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %13 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %3, x86_fp80 %12, x86_fp80 %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %14 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %3, x86_fp80 %13, x86_fp80 %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %15 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %3, x86_fp80 %14, x86_fp80 0xK3FFAAAAAAAAAAAAAAA9B, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %16 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %3, x86_fp80 %15, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %17 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #2
  %18 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %17, x86_fp80 %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %19 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #2
  %20 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %19, x86_fp80 %18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %21 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #2
  %22 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %21, x86_fp80 %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %23 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %22, x86_fp80 %18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %24 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %0, x86_fp80 %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %25 = fneg x86_fp80 %24
  %26 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %3, x86_fp80 %16, x86_fp80 %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %27 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %23, x86_fp80 %26, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %28 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %20, x86_fp80 %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  ret x86_fp80 %28
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #1

attributes #0 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
