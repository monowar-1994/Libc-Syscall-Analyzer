; ModuleID = 'src/complex/ctanhf.c'
source_filename = "src/complex/ctanhf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define <2 x float> @ctanhf(<2 x float> noundef %0) local_unnamed_addr #0 {
  %2 = extractelement <2 x float> %0, i64 0
  %3 = extractelement <2 x float> %0, i64 1
  %4 = bitcast float %2 to i32
  %5 = and i32 %4, 2147483647
  %6 = icmp ugt i32 %5, 2139095039
  br i1 %6, label %7, label %34

7:                                                ; preds = %1
  %8 = and i32 %4, 8388607
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %18, label %10

10:                                               ; preds = %7
  %11 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %12 = tail call i1 @llvm.experimental.constrained.fcmp.f32(float %3, float %11, metadata !"oeq", metadata !"fpexcept.ignore") #3
  br i1 %12, label %15, label %13

13:                                               ; preds = %10
  %14 = tail call float @llvm.experimental.constrained.fmul.f32(float %2, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %15

15:                                               ; preds = %10, %13
  %16 = phi float [ %14, %13 ], [ %3, %10 ]
  %17 = insertelement <2 x float> %0, float %16, i64 1
  br label %83

18:                                               ; preds = %7
  %19 = add i32 %4, -1073741824
  %20 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %21 = bitcast float %3 to i32
  %22 = and i32 %21, 2147483647
  %23 = icmp eq i32 %22, 2139095040
  br i1 %23, label %28, label %24

24:                                               ; preds = %18
  %25 = tail call float @sinf(float noundef %3) #4
  %26 = tail call float @cosf(float noundef %3) #4
  %27 = tail call float @llvm.experimental.constrained.fmul.f32(float %25, float %26, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %28

28:                                               ; preds = %18, %24
  %29 = phi float [ %27, %24 ], [ %3, %18 ]
  %30 = tail call float @copysignf(float noundef %20, float noundef %29) #4
  %31 = insertelement <2 x i32> undef, i32 %19, i64 0
  %32 = bitcast <2 x i32> %31 to <2 x float>
  %33 = insertelement <2 x float> %32, float %30, i64 1
  br label %83

34:                                               ; preds = %1
  %35 = bitcast float %3 to i32
  %36 = and i32 %35, 2139095040
  %37 = icmp eq i32 %36, 2139095040
  br i1 %37, label %38, label %47

38:                                               ; preds = %34
  %39 = icmp eq i32 %5, 0
  br i1 %39, label %42, label %40

40:                                               ; preds = %38
  %41 = tail call float @llvm.experimental.constrained.fsub.f32(float %3, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %42

42:                                               ; preds = %38, %40
  %43 = phi float [ %41, %40 ], [ %2, %38 ]
  %44 = tail call float @llvm.experimental.constrained.fsub.f32(float %3, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %45 = insertelement <2 x float> undef, float %43, i64 0
  %46 = insertelement <2 x float> %45, float %44, i64 1
  br label %83

47:                                               ; preds = %34
  %48 = icmp ugt i32 %5, 1093664767
  br i1 %48, label %49, label %64

49:                                               ; preds = %47
  %50 = tail call float @fabsf(float noundef %2) #4
  %51 = fneg float %50
  %52 = tail call float @expf(float noundef %51) #4
  %53 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %54 = tail call float @copysignf(float noundef %53, float noundef %2) #4
  %55 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %56 = tail call float @sinf(float noundef %3) #4
  %57 = tail call float @llvm.experimental.constrained.fmul.f32(float %55, float %56, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %58 = tail call float @cosf(float noundef %3) #4
  %59 = tail call float @llvm.experimental.constrained.fmul.f32(float %57, float %58, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %60 = tail call float @llvm.experimental.constrained.fmul.f32(float %59, float %52, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %61 = tail call float @llvm.experimental.constrained.fmul.f32(float %60, float %52, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %62 = insertelement <2 x float> undef, float %54, i64 0
  %63 = insertelement <2 x float> %62, float %61, i64 1
  br label %83

64:                                               ; preds = %47
  %65 = tail call float @tanf(float noundef %3) #4
  %66 = tail call float @llvm.experimental.constrained.fmul.f32(float %65, float %65, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %67 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %66, metadata !"fpexcept.ignore") #3
  %68 = tail call double @llvm.experimental.constrained.fadd.f64(double 1.000000e+00, double %67, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %69 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %68, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %70 = tail call float @sinhf(float noundef %2) #4
  %71 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %72 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %70, float %70, float %71, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %73 = tail call float @sqrtf(float noundef %72) #4
  %74 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %75 = tail call float @llvm.experimental.constrained.fmul.f32(float %69, float %70, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %76 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %75, float %70, float %74, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %77 = tail call float @llvm.experimental.constrained.fmul.f32(float %69, float %73, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %78 = tail call float @llvm.experimental.constrained.fmul.f32(float %77, float %70, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %79 = tail call float @llvm.experimental.constrained.fdiv.f32(float %78, float %76, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %80 = tail call float @llvm.experimental.constrained.fdiv.f32(float %65, float %76, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %81 = insertelement <2 x float> undef, float %79, i64 0
  %82 = insertelement <2 x float> %81, float %80, i64 1
  br label %83

83:                                               ; preds = %64, %49, %42, %28, %15
  %84 = phi <2 x float> [ %17, %15 ], [ %33, %28 ], [ %63, %49 ], [ %82, %64 ], [ %46, %42 ]
  ret <2 x float> %84
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #1

; Function Attrs: optsize
declare float @copysignf(float noundef, float noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #1

; Function Attrs: optsize
declare float @sinf(float noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare float @cosf(float noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #1

; Function Attrs: optsize
declare float @expf(float noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare float @fabsf(float noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare float @tanf(float noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #1

; Function Attrs: optsize
declare float @sinhf(float noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare float @sqrtf(float noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmuladd.f32(float, float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #1

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
