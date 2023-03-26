; ModuleID = 'src/math/expm1f.c'
source_filename = "src/math/expm1f.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nounwind optsize strictfp
define float @expm1f(float noundef %0) local_unnamed_addr #0 {
  %2 = alloca float, align 4
  %3 = bitcast float %0 to i32
  %4 = and i32 %3, 2147483647
  %5 = icmp ugt i32 %4, 1100331075
  br i1 %5, label %6, label %16

6:                                                ; preds = %1
  %7 = icmp ugt i32 %4, 2139095040
  br i1 %7, label %119, label %8

8:                                                ; preds = %6
  %9 = icmp sgt i32 %3, -1
  br i1 %9, label %12, label %10

10:                                               ; preds = %8
  %11 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 -1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %119

12:                                               ; preds = %8
  %13 = icmp ugt i32 %4, 1118925335
  br i1 %13, label %14, label %26

14:                                               ; preds = %12
  %15 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float 0x47E0000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %119

16:                                               ; preds = %1
  %17 = icmp ugt i32 %4, 1051816472
  br i1 %17, label %18, label %41

18:                                               ; preds = %16
  %19 = icmp ult i32 %4, 1065686418
  br i1 %19, label %20, label %26

20:                                               ; preds = %18
  %21 = icmp sgt i32 %3, -1
  br i1 %21, label %22, label %24

22:                                               ; preds = %20
  %23 = tail call float @llvm.experimental.constrained.fsub.f32(float %0, float 0x3FE62E3000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %34

24:                                               ; preds = %20
  %25 = tail call float @llvm.experimental.constrained.fadd.f32(float %0, float 0x3FE62E3000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %34

26:                                               ; preds = %12, %18
  %27 = tail call float @llvm.copysign.f32(float 5.000000e-01, float %0)
  %28 = tail call float @llvm.experimental.constrained.fmuladd.f32(float 0x3FF7154760000000, float %0, float %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %29 = tail call i32 @llvm.experimental.constrained.fptosi.i32.f32(float %28, metadata !"fpexcept.ignore") #4
  %30 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 %29, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %31 = fneg float %30
  %32 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %31, float 0x3FE62E3000000000, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %33 = tail call float @llvm.experimental.constrained.fmul.f32(float %30, float 0x3EE2FEFA20000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %34

34:                                               ; preds = %22, %24, %26
  %35 = phi float [ 0xBEE2FEFA20000000, %24 ], [ 0x3EE2FEFA20000000, %22 ], [ %33, %26 ]
  %36 = phi float [ %25, %24 ], [ %23, %22 ], [ %32, %26 ]
  %37 = phi i32 [ -1, %24 ], [ 1, %22 ], [ %29, %26 ]
  %38 = tail call float @llvm.experimental.constrained.fsub.f32(float %36, float %35, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %39 = tail call float @llvm.experimental.constrained.fsub.f32(float %36, float %38, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %40 = tail call float @llvm.experimental.constrained.fsub.f32(float %39, float %35, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %48

41:                                               ; preds = %16
  %42 = icmp ult i32 %4, 855638016
  br i1 %42, label %43, label %48

43:                                               ; preds = %41
  %44 = icmp ult i32 %4, 8388608
  br i1 %44, label %45, label %119

45:                                               ; preds = %43
  %46 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %47 = bitcast float* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %47)
  store volatile float %46, float* %2, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %47)
  br label %119

48:                                               ; preds = %41, %34
  %49 = phi float [ %40, %34 ], [ undef, %41 ]
  %50 = phi float [ %38, %34 ], [ %0, %41 ]
  %51 = phi i32 [ %37, %34 ], [ 0, %41 ]
  %52 = tail call float @llvm.experimental.constrained.fmul.f32(float 5.000000e-01, float %50, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %53 = tail call float @llvm.experimental.constrained.fmul.f32(float %50, float %52, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %54 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %53, float 0x3F59E60200000000, float 0xBFA1110D00000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %55 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %53, float %54, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %56 = fneg float %55
  %57 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %56, float %52, float 3.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %58 = tail call float @llvm.experimental.constrained.fsub.f32(float %55, float %57, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %59 = fneg float %50
  %60 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %59, float %57, float 6.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %61 = tail call float @llvm.experimental.constrained.fdiv.f32(float %58, float %60, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %62 = tail call float @llvm.experimental.constrained.fmul.f32(float %53, float %61, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %63 = icmp eq i32 %51, 0
  br i1 %63, label %64, label %68

64:                                               ; preds = %48
  %65 = fneg float %53
  %66 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %50, float %62, float %65, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %67 = tail call float @llvm.experimental.constrained.fsub.f32(float %50, float %66, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %119

68:                                               ; preds = %48
  %69 = tail call float @llvm.experimental.constrained.fsub.f32(float %62, float %49, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %70 = fneg float %49
  %71 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %50, float %69, float %70, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %72 = tail call float @llvm.experimental.constrained.fsub.f32(float %71, float %53, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  switch i32 %51, label %85 [
    i32 -1, label %73
    i32 1, label %76
  ]

73:                                               ; preds = %68
  %74 = tail call float @llvm.experimental.constrained.fsub.f32(float %50, float %72, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %75 = tail call float @llvm.experimental.constrained.fmuladd.f32(float 5.000000e-01, float %74, float -5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %119

76:                                               ; preds = %68
  %77 = tail call i1 @llvm.experimental.constrained.fcmps.f32(float %50, float -2.500000e-01, metadata !"olt", metadata !"fpexcept.ignore") #4
  br i1 %77, label %78, label %82

78:                                               ; preds = %76
  %79 = tail call float @llvm.experimental.constrained.fadd.f32(float %50, float 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %80 = tail call float @llvm.experimental.constrained.fsub.f32(float %72, float %79, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %81 = tail call float @llvm.experimental.constrained.fmul.f32(float -2.000000e+00, float %80, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %119

82:                                               ; preds = %76
  %83 = tail call float @llvm.experimental.constrained.fsub.f32(float %50, float %72, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %84 = tail call float @llvm.experimental.constrained.fmuladd.f32(float 2.000000e+00, float %83, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %119

85:                                               ; preds = %68
  %86 = shl i32 %51, 23
  %87 = add i32 %86, 1065353216
  %88 = bitcast i32 %87 to float
  %89 = icmp ugt i32 %51, 56
  br i1 %89, label %90, label %102

90:                                               ; preds = %85
  %91 = tail call float @llvm.experimental.constrained.fsub.f32(float %50, float %72, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %92 = tail call float @llvm.experimental.constrained.fadd.f32(float %91, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %93 = icmp eq i32 %51, 128
  br i1 %93, label %94, label %97

94:                                               ; preds = %90
  %95 = tail call float @llvm.experimental.constrained.fmul.f32(float %92, float 2.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %96 = tail call float @llvm.experimental.constrained.fmul.f32(float %95, float 0x47E0000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %99

97:                                               ; preds = %90
  %98 = tail call float @llvm.experimental.constrained.fmul.f32(float %92, float %88, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %99

99:                                               ; preds = %97, %94
  %100 = phi float [ %96, %94 ], [ %98, %97 ]
  %101 = tail call float @llvm.experimental.constrained.fsub.f32(float %100, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %119

102:                                              ; preds = %85
  %103 = mul nsw i32 %51, -8388608
  %104 = add nsw i32 %103, 1065353216
  %105 = bitcast i32 %104 to float
  %106 = icmp ult i32 %51, 23
  br i1 %106, label %107, label %113

107:                                              ; preds = %102
  %108 = tail call float @llvm.experimental.constrained.fsub.f32(float %50, float %72, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %109 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %110 = tail call float @llvm.experimental.constrained.fsub.f32(float %109, float %105, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %111 = tail call float @llvm.experimental.constrained.fadd.f32(float %108, float %110, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %112 = tail call float @llvm.experimental.constrained.fmul.f32(float %111, float %88, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %119

113:                                              ; preds = %102
  %114 = tail call float @llvm.experimental.constrained.fadd.f32(float %72, float %105, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %115 = tail call float @llvm.experimental.constrained.fsub.f32(float %50, float %114, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %116 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %117 = tail call float @llvm.experimental.constrained.fadd.f32(float %115, float %116, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %118 = tail call float @llvm.experimental.constrained.fmul.f32(float %117, float %88, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %119

119:                                              ; preds = %107, %113, %43, %45, %6, %99, %82, %78, %73, %64, %14, %10
  %120 = phi float [ %11, %10 ], [ %15, %14 ], [ %67, %64 ], [ %75, %73 ], [ %81, %78 ], [ %84, %82 ], [ %101, %99 ], [ %0, %6 ], [ %0, %45 ], [ %0, %43 ], [ %112, %107 ], [ %118, %113 ]
  ret float %120
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmuladd.f32(float, float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i32 @llvm.experimental.constrained.fptosi.i32.f32(float, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f32(float, float, metadata, metadata) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #3

attributes #0 = { nofree nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"float", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
