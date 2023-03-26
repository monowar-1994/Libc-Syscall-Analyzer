; ModuleID = 'src/math/hypotf.c'
source_filename = "src/math/hypotf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define float @hypotf(float noundef %0, float noundef %1) local_unnamed_addr #0 {
  %3 = bitcast float %0 to i32
  %4 = and i32 %3, 2147483647
  %5 = bitcast float %1 to i32
  %6 = and i32 %5, 2147483647
  %7 = icmp ult i32 %4, %6
  %8 = icmp ugt i32 %4, %6
  %9 = select i1 %8, i32 %4, i32 %6
  %10 = bitcast i32 %9 to float
  %11 = select i1 %7, i32 %4, i32 %6
  %12 = bitcast i32 %11 to float
  %13 = icmp eq i32 %11, 2139095040
  br i1 %13, label %47, label %14

14:                                               ; preds = %2
  %15 = icmp ugt i32 %9, 2139095039
  %16 = icmp eq i32 %11, 0
  %17 = or i1 %15, %16
  %18 = sub nsw i32 %9, %11
  %19 = icmp ugt i32 %18, 209715199
  %20 = or i1 %17, %19
  br i1 %20, label %21, label %23

21:                                               ; preds = %14
  %22 = tail call float @llvm.experimental.constrained.fadd.f32(float %10, float %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %47

23:                                               ; preds = %14
  %24 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %25 = icmp ugt i32 %9, 1568669695
  br i1 %25, label %26, label %29

26:                                               ; preds = %23
  %27 = tail call float @llvm.experimental.constrained.fmul.f32(float %10, float 0x3A50000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = tail call float @llvm.experimental.constrained.fmul.f32(float %12, float 0x3A50000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %34

29:                                               ; preds = %23
  %30 = icmp ult i32 %11, 562036736
  br i1 %30, label %31, label %34

31:                                               ; preds = %29
  %32 = tail call float @llvm.experimental.constrained.fmul.f32(float %10, float 0x4590000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = tail call float @llvm.experimental.constrained.fmul.f32(float %12, float 0x4590000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %34

34:                                               ; preds = %29, %31, %26
  %35 = phi float [ %27, %26 ], [ %32, %31 ], [ %10, %29 ]
  %36 = phi float [ %28, %26 ], [ %33, %31 ], [ %12, %29 ]
  %37 = phi float [ 0x4590000000000000, %26 ], [ 0x3A50000000000000, %31 ], [ %24, %29 ]
  %38 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %35, metadata !"fpexcept.ignore") #3
  %39 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %35, metadata !"fpexcept.ignore") #3
  %40 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %36, metadata !"fpexcept.ignore") #3
  %41 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %36, metadata !"fpexcept.ignore") #3
  %42 = tail call double @llvm.experimental.constrained.fmul.f64(double %40, double %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %43 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %38, double %39, double %42, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %44 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %43, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %45 = tail call float @sqrtf(float noundef %44) #4
  %46 = tail call float @llvm.experimental.constrained.fmul.f32(float %37, float %45, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %47

47:                                               ; preds = %2, %34, %21
  %48 = phi float [ %22, %21 ], [ %46, %34 ], [ %12, %2 ]
  ret float %48
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #1

; Function Attrs: optsize
declare float @sqrtf(float noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #1

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
