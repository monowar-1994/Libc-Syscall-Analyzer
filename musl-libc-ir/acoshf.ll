; ModuleID = 'src/math/acoshf.c'
source_filename = "src/math/acoshf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define float @acoshf(float noundef %0) local_unnamed_addr #0 {
  %2 = bitcast float %0 to i32
  %3 = and i32 %2, 1073741824
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %20

5:                                                ; preds = %1
  %6 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %7 = tail call float @llvm.experimental.constrained.fsub.f32(float %0, float %6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %8 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %9 = tail call float @llvm.experimental.constrained.fsub.f32(float %0, float %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %10 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %11 = tail call float @llvm.experimental.constrained.fsub.f32(float %0, float %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %12 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %13 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %14 = tail call float @llvm.experimental.constrained.fsub.f32(float %0, float %13, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %15 = tail call float @llvm.experimental.constrained.fmul.f32(float %12, float %14, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %16 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %9, float %11, float %15, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %17 = tail call float @sqrtf(float noundef %16) #4
  %18 = tail call float @llvm.experimental.constrained.fadd.f32(float %7, float %17, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %19 = tail call float @log1pf(float noundef %18) #4
  br label %37

20:                                               ; preds = %1
  %21 = icmp ult i32 %2, 1166016512
  br i1 %21, label %22, label %34

22:                                               ; preds = %20
  %23 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %24 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %25 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %26 = fneg float %25
  %27 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %0, float %0, float %26, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = tail call float @sqrtf(float noundef %27) #4
  %29 = tail call float @llvm.experimental.constrained.fadd.f32(float %0, float %28, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %30 = tail call float @llvm.experimental.constrained.fdiv.f32(float %24, float %29, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %31 = fneg float %30
  %32 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %23, float %0, float %31, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = tail call float @logf(float noundef %32) #4
  br label %37

34:                                               ; preds = %20
  %35 = tail call float @logf(float noundef %0) #4
  %36 = tail call float @llvm.experimental.constrained.fadd.f32(float %35, float 0x3FE62E4300000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %37

37:                                               ; preds = %34, %22, %5
  %38 = phi float [ %19, %5 ], [ %33, %22 ], [ %36, %34 ]
  ret float %38
}

; Function Attrs: optsize
declare float @log1pf(float noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #2

; Function Attrs: optsize
declare float @sqrtf(float noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmuladd.f32(float, float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #2

; Function Attrs: optsize
declare float @logf(float noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
