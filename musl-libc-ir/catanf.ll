; ModuleID = 'src/complex/catanf.c'
source_filename = "src/complex/catanf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define <2 x float> @catanf(<2 x float> noundef %0) local_unnamed_addr #0 {
  %2 = extractelement <2 x float> %0, i64 0
  %3 = extractelement <2 x float> %0, i64 1
  %4 = tail call float @llvm.experimental.constrained.fmul.f32(float %2, float %2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %5 = tail call float @llvm.experimental.constrained.fsub.f32(float 1.000000e+00, float %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %6 = fneg float %3
  %7 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %6, float %3, float %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %8 = tail call float @llvm.experimental.constrained.fmul.f32(float 2.000000e+00, float %2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %9 = tail call float @atan2f(float noundef %8, float noundef %7) #4
  %10 = tail call float @llvm.experimental.constrained.fmul.f32(float 5.000000e-01, float %9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %11 = tail call float @llvm.experimental.constrained.fdiv.f32(float %10, float 0x400921FB60000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %12 = tail call i1 @llvm.experimental.constrained.fcmps.f32(float %11, float 0.000000e+00, metadata !"oge", metadata !"fpexcept.ignore") #5
  br i1 %12, label %13, label %15

13:                                               ; preds = %1
  %14 = tail call float @llvm.experimental.constrained.fadd.f32(float %11, float 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %17

15:                                               ; preds = %1
  %16 = tail call float @llvm.experimental.constrained.fsub.f32(float %11, float 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %17

17:                                               ; preds = %13, %15
  %18 = phi float [ %14, %13 ], [ %16, %15 ]
  %19 = tail call i64 @llvm.experimental.constrained.fptosi.i64.f32(float %18, metadata !"fpexcept.ignore") #5
  %20 = tail call float @llvm.experimental.constrained.sitofp.f32.i64(i64 %19, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %21 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %10, metadata !"fpexcept.ignore") #5
  %22 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %20, metadata !"fpexcept.ignore") #5
  %23 = fneg double %22
  %24 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %23, double 0x4009200000000000, double %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %25 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %20, metadata !"fpexcept.ignore") #5
  %26 = fneg double %25
  %27 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %26, double 0x3F4FB40000000000, double %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %28 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %20, metadata !"fpexcept.ignore") #5
  %29 = fneg double %28
  %30 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %29, double 0x3E84442D18469899, double %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %31 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %32 = tail call float @llvm.experimental.constrained.fsub.f32(float %3, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %32, float %32, float %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %34 = tail call float @llvm.experimental.constrained.fadd.f32(float %3, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %35 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %34, float %34, float %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %36 = tail call float @llvm.experimental.constrained.fdiv.f32(float %35, float %33, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %37 = tail call float @logf(float noundef %36) #4
  %38 = tail call float @llvm.experimental.constrained.fmul.f32(float 2.500000e-01, float %37, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %39 = insertelement <2 x float> undef, float %31, i64 0
  %40 = insertelement <2 x float> %39, float %38, i64 1
  ret <2 x float> %40
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmuladd.f32(float, float, float, metadata, metadata) #1

; Function Attrs: optsize
declare float @atan2f(float noundef, float noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #1

; Function Attrs: optsize
declare float @logf(float noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i64 @llvm.experimental.constrained.fptosi.i64.f32(float, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i64(i64, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="64" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
