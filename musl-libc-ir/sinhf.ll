; ModuleID = 'src/math/sinhf.c'
source_filename = "src/math/sinhf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define float @sinhf(float noundef %0) local_unnamed_addr #0 {
  %2 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %3 = bitcast float %0 to i32
  %4 = fneg float %2
  %5 = icmp slt i32 %3, 0
  %6 = select i1 %5, float %4, float %2
  %7 = and i32 %3, 2147483647
  %8 = bitcast i32 %7 to float
  %9 = icmp ult i32 %7, 1118925335
  br i1 %9, label %10, label %30

10:                                               ; preds = %1
  %11 = tail call float @expm1f(float noundef %8) #4
  %12 = icmp ult i32 %7, 1065353216
  br i1 %12, label %13, label %24

13:                                               ; preds = %10
  %14 = icmp ult i32 %7, 964689920
  br i1 %14, label %34, label %15

15:                                               ; preds = %13
  %16 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %17 = tail call float @llvm.experimental.constrained.fmul.f32(float %11, float %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %18 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %19 = tail call float @llvm.experimental.constrained.fadd.f32(float %11, float %18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %20 = tail call float @llvm.experimental.constrained.fdiv.f32(float %17, float %19, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %21 = fneg float %20
  %22 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %16, float %11, float %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %23 = tail call float @llvm.experimental.constrained.fmul.f32(float %6, float %22, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %34

24:                                               ; preds = %10
  %25 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %26 = tail call float @llvm.experimental.constrained.fadd.f32(float %11, float %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %27 = tail call float @llvm.experimental.constrained.fdiv.f32(float %11, float %26, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = tail call float @llvm.experimental.constrained.fadd.f32(float %11, float %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %29 = tail call float @llvm.experimental.constrained.fmul.f32(float %6, float %28, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %34

30:                                               ; preds = %1
  %31 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %32 = tail call float @llvm.experimental.constrained.fmul.f32(float %31, float %6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = tail call float @__expo2f(float noundef %8, float noundef %32) #4
  br label %34

34:                                               ; preds = %13, %30, %24, %15
  %35 = phi float [ %23, %15 ], [ %29, %24 ], [ %33, %30 ], [ %0, %13 ]
  ret float %35
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #1

; Function Attrs: optsize
declare float @expm1f(float noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmuladd.f32(float, float, float, metadata, metadata) #1

; Function Attrs: optsize
declare hidden float @__expo2f(float noundef, float noundef) local_unnamed_addr #2

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
