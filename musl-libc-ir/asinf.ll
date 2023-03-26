; ModuleID = 'src/math/asinf.c'
source_filename = "src/math/asinf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define float @asinf(float noundef %0) local_unnamed_addr #0 {
  %2 = bitcast float %0 to i32
  %3 = and i32 %2, 2147483647
  %4 = icmp ugt i32 %3, 1065353215
  br i1 %4, label %5, label %16

5:                                                ; preds = %1
  %6 = icmp eq i32 %3, 1065353216
  br i1 %6, label %7, label %12

7:                                                ; preds = %5
  %8 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #3
  %9 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x3870000000000000, metadata !"fpexcept.ignore") #3
  %10 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %8, double 0x3FF921FB54442D18, double %9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %11 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %50

12:                                               ; preds = %5
  %13 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %14 = tail call float @llvm.experimental.constrained.fsub.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %15 = tail call float @llvm.experimental.constrained.fdiv.f32(float %13, float %14, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %50

16:                                               ; preds = %1
  %17 = icmp ult i32 %3, 1056964608
  br i1 %17, label %18, label %29

18:                                               ; preds = %16
  %19 = add nsw i32 %3, -8388608
  %20 = icmp ult i32 %19, 956301312
  br i1 %20, label %50, label %21

21:                                               ; preds = %18
  %22 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %23 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %22, float 0xBF81BA6D60000000, float 0xBFA5E27740000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %24 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %22, float %23, float 0x3FC5554EA0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %25 = tail call float @llvm.experimental.constrained.fmul.f32(float %22, float %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %26 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %22, float 0xBFE69CB5C0000000, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %27 = tail call float @llvm.experimental.constrained.fdiv.f32(float %25, float %26, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %28 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %0, float %27, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %50

29:                                               ; preds = %16
  %30 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %31 = tail call float @fabsf(float noundef %0) #5
  %32 = tail call float @llvm.experimental.constrained.fsub.f32(float %30, float %31, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = tail call float @llvm.experimental.constrained.fmul.f32(float %32, float 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %34 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %33, metadata !"fpexcept.ignore") #3
  %35 = tail call double @sqrt(double noundef %34) #5
  %36 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %37 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %33, float 0xBF81BA6D60000000, float 0xBFA5E27740000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %38 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %33, float %37, float 0x3FC5554EA0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %39 = tail call float @llvm.experimental.constrained.fmul.f32(float %33, float %38, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %40 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %33, float 0xBFE69CB5C0000000, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %41 = tail call float @llvm.experimental.constrained.fdiv.f32(float %39, float %40, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %42 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %41, metadata !"fpexcept.ignore") #3
  %43 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %35, double %42, double %35, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %44 = fneg double %36
  %45 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %44, double %43, double 0x3FF921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %46 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %45, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %47 = fneg float %46
  %48 = icmp slt i32 %2, 0
  %49 = select i1 %48, float %47, float %46
  br label %50

50:                                               ; preds = %29, %18, %21, %12, %7
  %51 = phi float [ %11, %7 ], [ %15, %12 ], [ %28, %21 ], [ %0, %18 ], [ %49, %29 ]
  ret float %51
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmuladd.f32(float, float, float, metadata, metadata) #1

; Function Attrs: optsize
declare float @fabsf(float noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare double @sqrt(double noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { strictfp }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
