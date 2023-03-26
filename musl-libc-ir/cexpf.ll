; ModuleID = 'src/complex/cexpf.c'
source_filename = "src/complex/cexpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define <2 x float> @cexpf(<2 x float> noundef %0) local_unnamed_addr #0 {
  %2 = extractelement <2 x float> %0, i64 0
  %3 = extractelement <2 x float> %0, i64 1
  %4 = bitcast float %3 to i32
  %5 = and i32 %4, 2147483647
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %10

7:                                                ; preds = %1
  %8 = tail call float @expf(float noundef %2) #3
  %9 = insertelement <2 x float> %0, float %8, i64 0
  br label %51

10:                                               ; preds = %1
  %11 = bitcast float %2 to i32
  %12 = and i32 %11, 2147483647
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %19

14:                                               ; preds = %10
  %15 = tail call float @cosf(float noundef %3) #3
  %16 = tail call float @sinf(float noundef %3) #3
  %17 = insertelement <2 x float> undef, float %15, i64 0
  %18 = insertelement <2 x float> %17, float %16, i64 1
  br label %51

19:                                               ; preds = %10
  %20 = icmp ugt i32 %5, 2139095039
  br i1 %20, label %21, label %38

21:                                               ; preds = %19
  %22 = icmp eq i32 %12, 2139095040
  br i1 %22, label %28, label %23

23:                                               ; preds = %21
  %24 = tail call float @llvm.experimental.constrained.fsub.f32(float %3, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %25 = tail call float @llvm.experimental.constrained.fsub.f32(float %3, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %26 = insertelement <2 x float> undef, float %24, i64 0
  %27 = insertelement <2 x float> %26, float %25, i64 1
  br label %51

28:                                               ; preds = %21
  %29 = icmp sgt i32 %11, -1
  br i1 %29, label %35, label %30

30:                                               ; preds = %28
  %31 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %32 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %33 = insertelement <2 x float> undef, float %31, i64 0
  %34 = insertelement <2 x float> %33, float %32, i64 1
  br label %51

35:                                               ; preds = %28
  %36 = tail call float @llvm.experimental.constrained.fsub.f32(float %3, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %37 = insertelement <2 x float> %0, float %36, i64 1
  br label %51

38:                                               ; preds = %19
  %39 = add i32 %11, -1118925336
  %40 = icmp ult i32 %39, 9342557
  br i1 %40, label %41, label %43

41:                                               ; preds = %38
  %42 = tail call <2 x float> @__ldexp_cexpf(<2 x float> noundef %0, i32 noundef 0) #3
  br label %51

43:                                               ; preds = %38
  %44 = tail call float @expf(float noundef %2) #3
  %45 = tail call float @cosf(float noundef %3) #3
  %46 = tail call float @llvm.experimental.constrained.fmul.f32(float %44, float %45, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %47 = tail call float @sinf(float noundef %3) #3
  %48 = tail call float @llvm.experimental.constrained.fmul.f32(float %44, float %47, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %49 = insertelement <2 x float> undef, float %46, i64 0
  %50 = insertelement <2 x float> %49, float %48, i64 1
  br label %51

51:                                               ; preds = %43, %41, %35, %30, %23, %14, %7
  %52 = phi <2 x float> [ %9, %7 ], [ %18, %14 ], [ %27, %23 ], [ %34, %30 ], [ %37, %35 ], [ %42, %41 ], [ %50, %43 ]
  ret <2 x float> %52
}

; Function Attrs: optsize
declare float @expf(float noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare float @cosf(float noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare float @sinf(float noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #2

; Function Attrs: optsize
declare hidden <2 x float> @__ldexp_cexpf(<2 x float> noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="64" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
