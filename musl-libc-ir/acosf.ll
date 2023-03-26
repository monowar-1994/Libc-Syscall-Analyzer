; ModuleID = 'src/math/acosf.c'
source_filename = "src/math/acosf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define float @acosf(float noundef %0) local_unnamed_addr #0 {
  %2 = bitcast float %0 to i32
  %3 = and i32 %2, 2147483647
  %4 = icmp ugt i32 %3, 1065353215
  br i1 %4, label %5, label %18

5:                                                ; preds = %1
  %6 = icmp eq i32 %3, 1065353216
  br i1 %6, label %7, label %14

7:                                                ; preds = %5
  %8 = icmp sgt i32 %2, -1
  br i1 %8, label %12, label %9

9:                                                ; preds = %7
  %10 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %11 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %10, float 0x3FF921FB40000000, float 0x3870000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %72

12:                                               ; preds = %7
  %13 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %72

14:                                               ; preds = %5
  %15 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %16 = tail call float @llvm.experimental.constrained.fsub.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %17 = tail call float @llvm.experimental.constrained.fdiv.f32(float %15, float %16, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %72

18:                                               ; preds = %1
  %19 = icmp ult i32 %3, 1056964608
  br i1 %19, label %20, label %35

20:                                               ; preds = %18
  %21 = icmp ult i32 %3, 847249409
  br i1 %21, label %22, label %24

22:                                               ; preds = %20
  %23 = tail call float @llvm.experimental.constrained.fadd.f32(float 0x3FF921FB40000000, float 0x3870000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %72

24:                                               ; preds = %20
  %25 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %26 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %25, float 0xBF81BA6D60000000, float 0xBFA5E27740000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %27 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %25, float %26, float 0x3FC5554EA0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %28 = tail call float @llvm.experimental.constrained.fmul.f32(float %25, float %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %29 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %25, float 0xBFE69CB5C0000000, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %30 = tail call float @llvm.experimental.constrained.fdiv.f32(float %28, float %29, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %31 = fneg float %0
  %32 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %31, float %30, float 0x3E74442D00000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = tail call float @llvm.experimental.constrained.fsub.f32(float %0, float %32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %34 = tail call float @llvm.experimental.constrained.fsub.f32(float 0x3FF921FB40000000, float %33, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %72

35:                                               ; preds = %18
  %36 = icmp sgt i32 %2, -1
  %37 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br i1 %36, label %52, label %38

38:                                               ; preds = %35
  %39 = tail call float @llvm.experimental.constrained.fadd.f32(float %37, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %40 = tail call float @llvm.experimental.constrained.fmul.f32(float %39, float 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %41 = tail call float @sqrtf(float noundef %40) #5
  %42 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %40, float 0xBF81BA6D60000000, float 0xBFA5E27740000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %43 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %40, float %42, float 0x3FC5554EA0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %44 = tail call float @llvm.experimental.constrained.fmul.f32(float %40, float %43, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %45 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %40, float 0xBFE69CB5C0000000, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %46 = tail call float @llvm.experimental.constrained.fdiv.f32(float %44, float %45, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %47 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %46, float %41, float 0xBE74442D00000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %48 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %49 = tail call float @llvm.experimental.constrained.fadd.f32(float %41, float %47, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %50 = tail call float @llvm.experimental.constrained.fsub.f32(float 0x3FF921FB40000000, float %49, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %51 = tail call float @llvm.experimental.constrained.fmul.f32(float %48, float %50, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %72

52:                                               ; preds = %35
  %53 = tail call float @llvm.experimental.constrained.fsub.f32(float %37, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %54 = tail call float @llvm.experimental.constrained.fmul.f32(float %53, float 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %55 = tail call float @sqrtf(float noundef %54) #5
  %56 = bitcast float %55 to i32
  %57 = and i32 %56, -4096
  %58 = bitcast i32 %57 to float
  %59 = fneg float %58
  %60 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %59, float %58, float %54, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %61 = tail call float @llvm.experimental.constrained.fadd.f32(float %55, float %58, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %62 = tail call float @llvm.experimental.constrained.fdiv.f32(float %60, float %61, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %63 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %54, float 0xBF81BA6D60000000, float 0xBFA5E27740000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %64 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %54, float %63, float 0x3FC5554EA0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %65 = tail call float @llvm.experimental.constrained.fmul.f32(float %54, float %64, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %66 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %54, float 0xBFE69CB5C0000000, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %67 = tail call float @llvm.experimental.constrained.fdiv.f32(float %65, float %66, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %68 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %67, float %55, float %62, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %69 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %70 = tail call float @llvm.experimental.constrained.fadd.f32(float %58, float %68, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %71 = tail call float @llvm.experimental.constrained.fmul.f32(float %69, float %70, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %72

72:                                               ; preds = %52, %38, %24, %22, %14, %12, %9
  %73 = phi float [ %11, %9 ], [ %13, %12 ], [ %17, %14 ], [ %23, %22 ], [ %34, %24 ], [ %51, %38 ], [ %71, %52 ]
  ret float %73
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmuladd.f32(float, float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #1

; Function Attrs: optsize
declare float @sqrtf(float noundef) local_unnamed_addr #2

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
