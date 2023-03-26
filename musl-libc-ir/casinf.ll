; ModuleID = 'src/complex/casinf.c'
source_filename = "src/complex/casinf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define <2 x float> @casinf(<2 x float> noundef %0) local_unnamed_addr #0 {
  %2 = extractelement <2 x float> %0, i64 0
  %3 = extractelement <2 x float> %0, i64 1
  %4 = tail call float @llvm.experimental.constrained.fsub.f32(float %2, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %5 = tail call float @llvm.experimental.constrained.fadd.f32(float %2, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %6 = tail call float @llvm.experimental.constrained.fmul.f32(float %4, float %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %7 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %6, metadata !"fpexcept.ignore") #3
  %8 = tail call double @llvm.experimental.constrained.fsub.f64(double 1.000000e+00, double %7, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %9 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %10 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %2, metadata !"fpexcept.ignore") #3
  %11 = tail call double @llvm.experimental.constrained.fmul.f64(double -2.000000e+00, double %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %12 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %3, metadata !"fpexcept.ignore") #3
  %13 = tail call double @llvm.experimental.constrained.fmul.f64(double %11, double %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %14 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %13, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %15 = fneg float %3
  %16 = insertelement <2 x float> undef, float %9, i64 0
  %17 = insertelement <2 x float> %16, float %14, i64 1
  %18 = tail call <2 x float> @csqrtf(<2 x float> noundef %17) #4
  %19 = extractelement <2 x float> %18, i64 0
  %20 = extractelement <2 x float> %18, i64 1
  %21 = tail call float @llvm.experimental.constrained.fadd.f32(float %15, float %19, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %22 = tail call float @llvm.experimental.constrained.fadd.f32(float %2, float %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %23 = insertelement <2 x float> undef, float %21, i64 0
  %24 = insertelement <2 x float> %23, float %22, i64 1
  %25 = tail call <2 x float> @clogf(<2 x float> noundef %24) #4
  %26 = extractelement <2 x float> %25, i64 0
  %27 = extractelement <2 x float> %25, i64 1
  %28 = fneg float %26
  %29 = insertelement <2 x float> undef, float %27, i64 0
  %30 = insertelement <2 x float> %29, float %28, i64 1
  ret <2 x float> %30
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: optsize
declare <2 x float> @clogf(<2 x float> noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare <2 x float> @csqrtf(<2 x float> noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="64" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
