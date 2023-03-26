; ModuleID = 'src/math/log10f.c'
source_filename = "src/math/log10f.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define float @log10f(float noundef %0) local_unnamed_addr #0 {
  %2 = bitcast float %0 to i32
  %3 = icmp sgt i32 %2, -1
  %4 = icmp sgt i32 %2, 8388607
  br i1 %4, label %19, label %5

5:                                                ; preds = %1
  %6 = and i32 %2, 2147483647
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %12

8:                                                ; preds = %5
  %9 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 -1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %10 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %11 = tail call float @llvm.experimental.constrained.fdiv.f32(float %9, float %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %61

12:                                               ; preds = %5
  br i1 %3, label %16, label %13

13:                                               ; preds = %12
  %14 = tail call float @llvm.experimental.constrained.fsub.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %15 = tail call float @llvm.experimental.constrained.fdiv.f32(float %14, float 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %61

16:                                               ; preds = %12
  %17 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float 0x4180000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %18 = bitcast float %17 to i32
  br label %25

19:                                               ; preds = %1
  %20 = icmp ugt i32 %2, 2139095039
  br i1 %20, label %61, label %21

21:                                               ; preds = %19
  %22 = icmp eq i32 %2, 1065353216
  br i1 %22, label %23, label %25

23:                                               ; preds = %21
  %24 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %61

25:                                               ; preds = %21, %16
  %26 = phi i32 [ %18, %16 ], [ %2, %21 ]
  %27 = phi i32 [ -152, %16 ], [ -127, %21 ]
  %28 = add i32 %26, 4913933
  %29 = lshr i32 %28, 23
  %30 = add nsw i32 %27, %29
  %31 = and i32 %28, 8388607
  %32 = add nuw nsw i32 %31, 1060439283
  %33 = bitcast i32 %32 to float
  %34 = tail call float @llvm.experimental.constrained.fsub.f32(float %33, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %35 = tail call float @llvm.experimental.constrained.fadd.f32(float 2.000000e+00, float %34, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %36 = tail call float @llvm.experimental.constrained.fdiv.f32(float %34, float %35, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %37 = tail call float @llvm.experimental.constrained.fmul.f32(float %36, float %36, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %38 = tail call float @llvm.experimental.constrained.fmul.f32(float %37, float %37, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %39 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %38, float 0x3FCF13C4C0000000, float 0x3FD999C260000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %40 = tail call float @llvm.experimental.constrained.fmul.f32(float %38, float %39, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %41 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %38, float 0x3FD23D3DC0000000, float 0x3FE5555540000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %42 = tail call float @llvm.experimental.constrained.fmul.f32(float %37, float %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %43 = tail call float @llvm.experimental.constrained.fadd.f32(float %42, float %40, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %44 = tail call float @llvm.experimental.constrained.fmul.f32(float 5.000000e-01, float %34, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %45 = tail call float @llvm.experimental.constrained.fmul.f32(float %44, float %34, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %46 = tail call float @llvm.experimental.constrained.fsub.f32(float %34, float %45, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %47 = bitcast float %46 to i32
  %48 = and i32 %47, -4096
  %49 = bitcast i32 %48 to float
  %50 = tail call float @llvm.experimental.constrained.fsub.f32(float %34, float %49, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %51 = tail call float @llvm.experimental.constrained.fsub.f32(float %50, float %45, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %52 = tail call float @llvm.experimental.constrained.fadd.f32(float %45, float %43, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %53 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %36, float %52, float %51, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %54 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %55 = tail call float @llvm.experimental.constrained.fadd.f32(float %53, float %49, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %56 = tail call float @llvm.experimental.constrained.fmul.f32(float %55, float 0xBF009D5B20000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %57 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %54, float 0x3EAA84FB60000000, float %56, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %58 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %53, float 0x3FDBCC0000000000, float %57, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %59 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %49, float 0x3FDBCC0000000000, float %58, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %60 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %54, float 0x3FD3441000000000, float %59, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %61

61:                                               ; preds = %19, %25, %23, %13, %8
  %62 = phi float [ %11, %8 ], [ %15, %13 ], [ %60, %25 ], [ %24, %23 ], [ %0, %19 ]
  ret float %62
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmuladd.f32(float, float, float, metadata, metadata) #1

attributes #0 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
