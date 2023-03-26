; ModuleID = 'src/complex/csqrtf.c'
source_filename = "src/complex/csqrtf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define <2 x float> @csqrtf(<2 x float> noundef %0) local_unnamed_addr #0 {
  %2 = extractelement <2 x float> %0, i64 0
  %3 = extractelement <2 x float> %0, i64 1
  %4 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %5 = tail call i1 @llvm.experimental.constrained.fcmp.f32(float %2, float %4, metadata !"oeq", metadata !"fpexcept.ignore") #3
  %6 = tail call i1 @llvm.experimental.constrained.fcmp.f32(float %3, float 0.000000e+00, metadata !"oeq", metadata !"fpexcept.ignore") #3
  %7 = and i1 %5, %6
  br i1 %7, label %8, label %11

8:                                                ; preds = %1
  %9 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %10 = insertelement <2 x float> %0, float %9, i64 0
  br label %77

11:                                               ; preds = %1
  %12 = bitcast float %3 to i32
  %13 = and i32 %12, 2147483647
  %14 = icmp eq i32 %13, 2139095040
  br i1 %14, label %15, label %17

15:                                               ; preds = %11
  %16 = insertelement <2 x float> %0, float 0x7FF0000000000000, i64 0
  br label %77

17:                                               ; preds = %11
  %18 = bitcast float %2 to i32
  %19 = and i32 %18, 2147483647
  %20 = icmp ugt i32 %19, 2139095040
  br i1 %20, label %21, label %28

21:                                               ; preds = %17
  %22 = tail call float @llvm.experimental.constrained.fsub.f32(float %3, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %23 = tail call float @llvm.experimental.constrained.fsub.f32(float %3, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %24 = tail call float @llvm.experimental.constrained.fdiv.f32(float %22, float %23, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %25 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %24, metadata !"fpexcept.ignore") #3
  %26 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %27 = insertelement <2 x float> %0, float %26, i64 1
  br label %77

28:                                               ; preds = %17
  %29 = icmp eq i32 %19, 2139095040
  br i1 %29, label %30, label %41

30:                                               ; preds = %28
  %31 = icmp sgt i32 %18, -1
  %32 = tail call float @llvm.experimental.constrained.fsub.f32(float %3, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br i1 %31, label %38, label %33

33:                                               ; preds = %30
  %34 = tail call float @fabsf(float noundef %32) #4
  %35 = tail call float @copysignf(float noundef %2, float noundef %3) #4
  %36 = insertelement <2 x float> undef, float %34, i64 0
  %37 = insertelement <2 x float> %36, float %35, i64 1
  br label %77

38:                                               ; preds = %30
  %39 = tail call float @copysignf(float noundef %32, float noundef %3) #4
  %40 = insertelement <2 x float> %0, float %39, i64 1
  br label %77

41:                                               ; preds = %28
  %42 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %43 = tail call i1 @llvm.experimental.constrained.fcmps.f32(float %2, float %42, metadata !"oge", metadata !"fpexcept.ignore") #3
  br i1 %43, label %44, label %59

44:                                               ; preds = %41
  %45 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %2, metadata !"fpexcept.ignore") #3
  %46 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %2, metadata !"fpexcept.ignore") #3
  %47 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %3, metadata !"fpexcept.ignore") #3
  %48 = tail call double @hypot(double noundef %46, double noundef %47) #4
  %49 = tail call double @llvm.experimental.constrained.fadd.f64(double %45, double %48, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %50 = tail call double @llvm.experimental.constrained.fmul.f64(double %49, double 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %51 = tail call double @sqrt(double noundef %50) #4
  %52 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %51, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %53 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %3, metadata !"fpexcept.ignore") #3
  %54 = tail call double @llvm.experimental.constrained.fmul.f64(double 2.000000e+00, double %51, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %55 = tail call double @llvm.experimental.constrained.fdiv.f64(double %53, double %54, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %56 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %55, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %57 = insertelement <2 x float> undef, float %52, i64 0
  %58 = insertelement <2 x float> %57, float %56, i64 1
  br label %77

59:                                               ; preds = %41
  %60 = fneg float %2
  %61 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %60, metadata !"fpexcept.ignore") #3
  %62 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %2, metadata !"fpexcept.ignore") #3
  %63 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %3, metadata !"fpexcept.ignore") #3
  %64 = tail call double @hypot(double noundef %62, double noundef %63) #4
  %65 = tail call double @llvm.experimental.constrained.fadd.f64(double %61, double %64, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %66 = tail call double @llvm.experimental.constrained.fmul.f64(double %65, double 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %67 = tail call double @sqrt(double noundef %66) #4
  %68 = tail call float @fabsf(float noundef %3) #4
  %69 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %68, metadata !"fpexcept.ignore") #3
  %70 = tail call double @llvm.experimental.constrained.fmul.f64(double 2.000000e+00, double %67, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %71 = tail call double @llvm.experimental.constrained.fdiv.f64(double %69, double %70, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %72 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %71, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %73 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %67, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %74 = tail call float @copysignf(float noundef %73, float noundef %3) #4
  %75 = insertelement <2 x float> undef, float %72, i64 0
  %76 = insertelement <2 x float> %75, float %74, i64 1
  br label %77

77:                                               ; preds = %59, %44, %38, %33, %21, %15, %8
  %78 = phi <2 x float> [ %10, %8 ], [ %16, %15 ], [ %27, %21 ], [ %37, %33 ], [ %40, %38 ], [ %58, %44 ], [ %76, %59 ]
  ret <2 x float> %78
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #1

; Function Attrs: optsize
declare float @fabsf(float noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare float @copysignf(float noundef, float noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f32(float, float, metadata, metadata) #1

; Function Attrs: optsize
declare double @sqrt(double noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare double @hypot(double noundef, double noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #1

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
