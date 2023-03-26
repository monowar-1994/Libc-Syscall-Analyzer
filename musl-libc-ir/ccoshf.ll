; ModuleID = 'src/complex/ccoshf.c'
source_filename = "src/complex/ccoshf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define <2 x float> @ccoshf(<2 x float> noundef %0) local_unnamed_addr #0 {
  %2 = extractelement <2 x float> %0, i64 0
  %3 = extractelement <2 x float> %0, i64 1
  %4 = bitcast float %2 to i32
  %5 = bitcast float %3 to i32
  %6 = and i32 %4, 2147483647
  %7 = and i32 %5, 2147483647
  %8 = icmp ult i32 %6, 2139095040
  %9 = icmp ult i32 %7, 2139095040
  %10 = and i1 %8, %9
  br i1 %10, label %11, label %62

11:                                               ; preds = %1
  %12 = icmp eq i32 %7, 0
  br i1 %12, label %13, label %18

13:                                               ; preds = %11
  %14 = tail call float @coshf(float noundef %2) #3
  %15 = tail call float @llvm.experimental.constrained.fmul.f32(float %2, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %16 = insertelement <2 x float> undef, float %14, i64 0
  %17 = insertelement <2 x float> %16, float %15, i64 1
  br label %128

18:                                               ; preds = %11
  %19 = icmp ult i32 %6, 1091567616
  br i1 %19, label %20, label %29

20:                                               ; preds = %18
  %21 = tail call float @coshf(float noundef %2) #3
  %22 = tail call float @cosf(float noundef %3) #3
  %23 = tail call float @llvm.experimental.constrained.fmul.f32(float %21, float %22, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %24 = tail call float @sinhf(float noundef %2) #3
  %25 = tail call float @sinf(float noundef %3) #3
  %26 = tail call float @llvm.experimental.constrained.fmul.f32(float %24, float %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %27 = insertelement <2 x float> undef, float %23, i64 0
  %28 = insertelement <2 x float> %27, float %26, i64 1
  br label %128

29:                                               ; preds = %18
  %30 = icmp ult i32 %6, 1118925336
  br i1 %30, label %31, label %42

31:                                               ; preds = %29
  %32 = tail call float @fabsf(float noundef %2) #3
  %33 = tail call float @expf(float noundef %32) #3
  %34 = tail call float @llvm.experimental.constrained.fmul.f32(float %33, float 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %35 = tail call float @cosf(float noundef %3) #3
  %36 = tail call float @llvm.experimental.constrained.fmul.f32(float %34, float %35, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %37 = tail call float @copysignf(float noundef %34, float noundef %2) #3
  %38 = tail call float @sinf(float noundef %3) #3
  %39 = tail call float @llvm.experimental.constrained.fmul.f32(float %37, float %38, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %40 = insertelement <2 x float> undef, float %36, i64 0
  %41 = insertelement <2 x float> %40, float %39, i64 1
  br label %128

42:                                               ; preds = %29
  %43 = icmp ult i32 %6, 1128313319
  br i1 %43, label %44, label %53

44:                                               ; preds = %42
  %45 = tail call float @fabsf(float noundef %2) #3
  %46 = insertelement <2 x float> %0, float %45, i64 0
  %47 = tail call <2 x float> @__ldexp_cexpf(<2 x float> noundef %46, i32 noundef -1) #3
  %48 = extractelement <2 x float> %47, i64 1
  %49 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %50 = tail call float @copysignf(float noundef %49, float noundef %2) #3
  %51 = tail call float @llvm.experimental.constrained.fmul.f32(float %48, float %50, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %52 = insertelement <2 x float> %47, float %51, i64 1
  br label %128

53:                                               ; preds = %42
  %54 = tail call float @llvm.experimental.constrained.fmul.f32(float 0x47E0000000000000, float %2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %55 = tail call float @llvm.experimental.constrained.fmul.f32(float %54, float %54, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %56 = tail call float @cosf(float noundef %3) #3
  %57 = tail call float @llvm.experimental.constrained.fmul.f32(float %55, float %56, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %58 = tail call float @sinf(float noundef %3) #3
  %59 = tail call float @llvm.experimental.constrained.fmul.f32(float %54, float %58, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %60 = insertelement <2 x float> undef, float %57, i64 0
  %61 = insertelement <2 x float> %60, float %59, i64 1
  br label %128

62:                                               ; preds = %1
  %63 = icmp eq i32 %6, 0
  %64 = icmp ugt i32 %7, 2139095039
  %65 = and i1 %63, %64
  br i1 %65, label %66, label %74

66:                                               ; preds = %62
  %67 = tail call float @llvm.experimental.constrained.fsub.f32(float %3, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %68 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %69 = tail call float @llvm.experimental.constrained.fsub.f32(float %3, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %70 = tail call float @llvm.experimental.constrained.fmul.f32(float %2, float %69, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %71 = tail call float @copysignf(float noundef %68, float noundef %70) #3
  %72 = insertelement <2 x float> undef, float %67, i64 0
  %73 = insertelement <2 x float> %72, float %71, i64 1
  br label %128

74:                                               ; preds = %62
  %75 = icmp eq i32 %7, 0
  %76 = icmp ugt i32 %6, 2139095039
  %77 = and i1 %75, %76
  br i1 %77, label %78, label %94

78:                                               ; preds = %74
  %79 = and i32 %4, 8388607
  %80 = icmp eq i32 %79, 0
  %81 = tail call float @llvm.experimental.constrained.fmul.f32(float %2, float %2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %82 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br i1 %80, label %83, label %88

83:                                               ; preds = %78
  %84 = tail call float @copysignf(float noundef %82, float noundef %2) #3
  %85 = tail call float @llvm.experimental.constrained.fmul.f32(float %84, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %86 = insertelement <2 x float> undef, float %81, i64 0
  %87 = insertelement <2 x float> %86, float %85, i64 1
  br label %128

88:                                               ; preds = %78
  %89 = tail call float @llvm.experimental.constrained.fadd.f32(float %2, float %2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %90 = tail call float @llvm.experimental.constrained.fmul.f32(float %89, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %91 = tail call float @copysignf(float noundef %82, float noundef %90) #3
  %92 = insertelement <2 x float> undef, float %81, i64 0
  %93 = insertelement <2 x float> %92, float %91, i64 1
  br label %128

94:                                               ; preds = %74
  %95 = and i1 %8, %64
  br i1 %95, label %96, label %102

96:                                               ; preds = %94
  %97 = tail call float @llvm.experimental.constrained.fsub.f32(float %3, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %98 = tail call float @llvm.experimental.constrained.fsub.f32(float %3, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %99 = tail call float @llvm.experimental.constrained.fmul.f32(float %2, float %98, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %100 = insertelement <2 x float> undef, float %97, i64 0
  %101 = insertelement <2 x float> %100, float %99, i64 1
  br label %128

102:                                              ; preds = %94
  %103 = and i32 %4, 8388607
  %104 = icmp eq i32 %103, 0
  %105 = and i1 %76, %104
  %106 = tail call float @llvm.experimental.constrained.fmul.f32(float %2, float %2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br i1 %105, label %107, label %120

107:                                              ; preds = %102
  br i1 %64, label %108, label %113

108:                                              ; preds = %107
  %109 = tail call float @llvm.experimental.constrained.fsub.f32(float %3, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %110 = tail call float @llvm.experimental.constrained.fmul.f32(float %2, float %109, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %111 = insertelement <2 x float> undef, float %106, i64 0
  %112 = insertelement <2 x float> %111, float %110, i64 1
  br label %128

113:                                              ; preds = %107
  %114 = tail call float @cosf(float noundef %3) #3
  %115 = tail call float @llvm.experimental.constrained.fmul.f32(float %106, float %114, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %116 = tail call float @sinf(float noundef %3) #3
  %117 = tail call float @llvm.experimental.constrained.fmul.f32(float %2, float %116, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %118 = insertelement <2 x float> undef, float %115, i64 0
  %119 = insertelement <2 x float> %118, float %117, i64 1
  br label %128

120:                                              ; preds = %102
  %121 = tail call float @llvm.experimental.constrained.fsub.f32(float %3, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %122 = tail call float @llvm.experimental.constrained.fmul.f32(float %106, float %121, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %123 = tail call float @llvm.experimental.constrained.fadd.f32(float %2, float %2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %124 = tail call float @llvm.experimental.constrained.fsub.f32(float %3, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %125 = tail call float @llvm.experimental.constrained.fmul.f32(float %123, float %124, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %126 = insertelement <2 x float> undef, float %122, i64 0
  %127 = insertelement <2 x float> %126, float %125, i64 1
  br label %128

128:                                              ; preds = %120, %113, %108, %96, %88, %83, %66, %53, %44, %31, %20, %13
  %129 = phi <2 x float> [ %17, %13 ], [ %28, %20 ], [ %41, %31 ], [ %52, %44 ], [ %61, %53 ], [ %73, %66 ], [ %87, %83 ], [ %93, %88 ], [ %101, %96 ], [ %112, %108 ], [ %119, %113 ], [ %127, %120 ]
  ret <2 x float> %129
}

; Function Attrs: optsize
declare float @coshf(float noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #2

; Function Attrs: optsize
declare float @cosf(float noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare float @sinhf(float noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare float @sinf(float noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare float @expf(float noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare float @fabsf(float noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare float @copysignf(float noundef, float noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden <2 x float> @__ldexp_cexpf(<2 x float> noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #2

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
