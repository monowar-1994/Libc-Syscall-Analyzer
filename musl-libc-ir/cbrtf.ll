; ModuleID = 'src/math/cbrtf.c'
source_filename = "src/math/cbrtf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define float @cbrtf(float noundef %0) local_unnamed_addr #0 {
  %2 = bitcast float %0 to i32
  %3 = and i32 %2, 2147483647
  %4 = icmp ugt i32 %3, 2139095039
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = tail call float @llvm.experimental.constrained.fadd.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %48

7:                                                ; preds = %1
  %8 = icmp ult i32 %3, 8388608
  br i1 %8, label %9, label %15

9:                                                ; preds = %7
  %10 = icmp eq i32 %3, 0
  br i1 %10, label %48, label %11

11:                                               ; preds = %9
  %12 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float 0x4170000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %13 = bitcast float %12 to i32
  %14 = and i32 %13, 2147483647
  br label %15

15:                                               ; preds = %7, %11
  %16 = phi i32 [ %14, %11 ], [ %3, %7 ]
  %17 = phi i32 [ 642849266, %11 ], [ 709958130, %7 ]
  %18 = phi i32 [ %13, %11 ], [ %2, %7 ]
  %19 = udiv i32 %16, 3
  %20 = add nuw nsw i32 %19, %17
  %21 = and i32 %18, -2147483648
  %22 = or i32 %21, %20
  %23 = bitcast i32 %22 to float
  %24 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %23, metadata !"fpexcept.ignore") #2
  %25 = tail call double @llvm.experimental.constrained.fmul.f64(double %24, double %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %26 = tail call double @llvm.experimental.constrained.fmul.f64(double %25, double %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %27 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #2
  %28 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #2
  %29 = tail call double @llvm.experimental.constrained.fadd.f64(double %27, double %28, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %30 = tail call double @llvm.experimental.constrained.fadd.f64(double %29, double %26, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %31 = tail call double @llvm.experimental.constrained.fmul.f64(double %24, double %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %32 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #2
  %33 = tail call double @llvm.experimental.constrained.fadd.f64(double %32, double %26, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %34 = tail call double @llvm.experimental.constrained.fadd.f64(double %33, double %26, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %35 = tail call double @llvm.experimental.constrained.fdiv.f64(double %31, double %34, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %36 = tail call double @llvm.experimental.constrained.fmul.f64(double %35, double %35, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %37 = tail call double @llvm.experimental.constrained.fmul.f64(double %36, double %35, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %38 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #2
  %39 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #2
  %40 = tail call double @llvm.experimental.constrained.fadd.f64(double %38, double %39, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %41 = tail call double @llvm.experimental.constrained.fadd.f64(double %40, double %37, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %42 = tail call double @llvm.experimental.constrained.fmul.f64(double %35, double %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %43 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #2
  %44 = tail call double @llvm.experimental.constrained.fadd.f64(double %43, double %37, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %45 = tail call double @llvm.experimental.constrained.fadd.f64(double %44, double %37, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %46 = tail call double @llvm.experimental.constrained.fdiv.f64(double %42, double %45, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %47 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %46, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %48

48:                                               ; preds = %9, %15, %5
  %49 = phi float [ %6, %5 ], [ %47, %15 ], [ %0, %9 ]
  ret float %49
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #1

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
