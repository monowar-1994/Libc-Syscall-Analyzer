; ModuleID = 'src/complex/csinhf.c'
source_filename = "src/complex/csinhf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define <2 x float> @csinhf(<2 x float> noundef %0) local_unnamed_addr #0 {
  %2 = extractelement <2 x float> %0, i64 0
  %3 = extractelement <2 x float> %0, i64 1
  %4 = bitcast float %2 to i32
  %5 = bitcast float %3 to i32
  %6 = and i32 %4, 2147483647
  %7 = and i32 %5, 2147483647
  %8 = icmp ult i32 %6, 2139095040
  %9 = icmp ult i32 %7, 2139095040
  %10 = and i1 %8, %9
  br i1 %10, label %11, label %60

11:                                               ; preds = %1
  %12 = icmp eq i32 %7, 0
  br i1 %12, label %13, label %16

13:                                               ; preds = %11
  %14 = tail call float @sinhf(float noundef %2) #3
  %15 = insertelement <2 x float> %0, float %14, i64 0
  br label %118

16:                                               ; preds = %11
  %17 = icmp ult i32 %6, 1091567616
  br i1 %17, label %18, label %27

18:                                               ; preds = %16
  %19 = tail call float @sinhf(float noundef %2) #3
  %20 = tail call float @cosf(float noundef %3) #3
  %21 = tail call float @llvm.experimental.constrained.fmul.f32(float %19, float %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %22 = tail call float @coshf(float noundef %2) #3
  %23 = tail call float @sinf(float noundef %3) #3
  %24 = tail call float @llvm.experimental.constrained.fmul.f32(float %22, float %23, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %25 = insertelement <2 x float> undef, float %21, i64 0
  %26 = insertelement <2 x float> %25, float %24, i64 1
  br label %118

27:                                               ; preds = %16
  %28 = icmp ult i32 %6, 1118925336
  br i1 %28, label %29, label %40

29:                                               ; preds = %27
  %30 = tail call float @fabsf(float noundef %2) #3
  %31 = tail call float @expf(float noundef %30) #3
  %32 = tail call float @llvm.experimental.constrained.fmul.f32(float %31, float 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %33 = tail call float @copysignf(float noundef %32, float noundef %2) #3
  %34 = tail call float @cosf(float noundef %3) #3
  %35 = tail call float @llvm.experimental.constrained.fmul.f32(float %33, float %34, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %36 = tail call float @sinf(float noundef %3) #3
  %37 = tail call float @llvm.experimental.constrained.fmul.f32(float %32, float %36, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %38 = insertelement <2 x float> undef, float %35, i64 0
  %39 = insertelement <2 x float> %38, float %37, i64 1
  br label %118

40:                                               ; preds = %27
  %41 = icmp ult i32 %6, 1128313319
  br i1 %41, label %42, label %51

42:                                               ; preds = %40
  %43 = tail call float @fabsf(float noundef %2) #3
  %44 = insertelement <2 x float> %0, float %43, i64 0
  %45 = tail call <2 x float> @__ldexp_cexpf(<2 x float> noundef %44, i32 noundef -1) #3
  %46 = extractelement <2 x float> %45, i64 0
  %47 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %48 = tail call float @copysignf(float noundef %47, float noundef %2) #3
  %49 = tail call float @llvm.experimental.constrained.fmul.f32(float %46, float %48, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %50 = insertelement <2 x float> %45, float %49, i64 0
  br label %118

51:                                               ; preds = %40
  %52 = tail call float @llvm.experimental.constrained.fmul.f32(float 0x47E0000000000000, float %2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %53 = tail call float @cosf(float noundef %3) #3
  %54 = tail call float @llvm.experimental.constrained.fmul.f32(float %52, float %53, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %55 = tail call float @llvm.experimental.constrained.fmul.f32(float %52, float %52, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %56 = tail call float @sinf(float noundef %3) #3
  %57 = tail call float @llvm.experimental.constrained.fmul.f32(float %55, float %56, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %58 = insertelement <2 x float> undef, float %54, i64 0
  %59 = insertelement <2 x float> %58, float %57, i64 1
  br label %118

60:                                               ; preds = %1
  %61 = icmp eq i32 %6, 0
  %62 = icmp ugt i32 %7, 2139095039
  %63 = and i1 %61, %62
  br i1 %63, label %64, label %72

64:                                               ; preds = %60
  %65 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %66 = tail call float @llvm.experimental.constrained.fsub.f32(float %3, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %67 = tail call float @llvm.experimental.constrained.fmul.f32(float %2, float %66, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %68 = tail call float @copysignf(float noundef %65, float noundef %67) #3
  %69 = tail call float @llvm.experimental.constrained.fsub.f32(float %3, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %70 = insertelement <2 x float> undef, float %68, i64 0
  %71 = insertelement <2 x float> %70, float %69, i64 1
  br label %118

72:                                               ; preds = %60
  %73 = icmp eq i32 %7, 0
  %74 = icmp ugt i32 %6, 2139095039
  %75 = and i1 %73, %74
  br i1 %75, label %76, label %83

76:                                               ; preds = %72
  %77 = and i32 %4, 8388607
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %118, label %79

79:                                               ; preds = %76
  %80 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %81 = tail call float @copysignf(float noundef %80, float noundef %3) #3
  %82 = insertelement <2 x float> %0, float %81, i64 1
  br label %118

83:                                               ; preds = %72
  %84 = and i1 %8, %62
  br i1 %84, label %85, label %91

85:                                               ; preds = %83
  %86 = tail call float @llvm.experimental.constrained.fsub.f32(float %3, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %87 = tail call float @llvm.experimental.constrained.fsub.f32(float %3, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %88 = tail call float @llvm.experimental.constrained.fmul.f32(float %2, float %87, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %89 = insertelement <2 x float> undef, float %86, i64 0
  %90 = insertelement <2 x float> %89, float %88, i64 1
  br label %118

91:                                               ; preds = %83
  %92 = and i32 %4, 8388607
  %93 = icmp eq i32 %92, 0
  %94 = and i1 %74, %93
  br i1 %94, label %95, label %109

95:                                               ; preds = %91
  br i1 %62, label %96, label %102

96:                                               ; preds = %95
  %97 = tail call float @llvm.experimental.constrained.fmul.f32(float %2, float %2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %98 = tail call float @llvm.experimental.constrained.fsub.f32(float %3, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %99 = tail call float @llvm.experimental.constrained.fmul.f32(float %2, float %98, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %100 = insertelement <2 x float> undef, float %97, i64 0
  %101 = insertelement <2 x float> %100, float %99, i64 1
  br label %118

102:                                              ; preds = %95
  %103 = tail call float @cosf(float noundef %3) #3
  %104 = tail call float @llvm.experimental.constrained.fmul.f32(float %2, float %103, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %105 = tail call float @sinf(float noundef %3) #3
  %106 = tail call float @llvm.experimental.constrained.fmul.f32(float 0x7FF0000000000000, float %105, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %107 = insertelement <2 x float> undef, float %104, i64 0
  %108 = insertelement <2 x float> %107, float %106, i64 1
  br label %118

109:                                              ; preds = %91
  %110 = tail call float @llvm.experimental.constrained.fmul.f32(float %2, float %2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %111 = tail call float @llvm.experimental.constrained.fsub.f32(float %3, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %112 = tail call float @llvm.experimental.constrained.fmul.f32(float %110, float %111, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %113 = tail call float @llvm.experimental.constrained.fadd.f32(float %2, float %2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %114 = tail call float @llvm.experimental.constrained.fsub.f32(float %3, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %115 = tail call float @llvm.experimental.constrained.fmul.f32(float %113, float %114, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %116 = insertelement <2 x float> undef, float %112, i64 0
  %117 = insertelement <2 x float> %116, float %115, i64 1
  br label %118

118:                                              ; preds = %76, %109, %102, %96, %85, %79, %64, %51, %42, %29, %18, %13
  %119 = phi <2 x float> [ %15, %13 ], [ %26, %18 ], [ %39, %29 ], [ %50, %42 ], [ %59, %51 ], [ %71, %64 ], [ %82, %79 ], [ %90, %85 ], [ %101, %96 ], [ %108, %102 ], [ %117, %109 ], [ %0, %76 ]
  ret <2 x float> %119
}

; Function Attrs: optsize
declare float @sinhf(float noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare float @cosf(float noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #2

; Function Attrs: optsize
declare float @coshf(float noundef) local_unnamed_addr #1

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
