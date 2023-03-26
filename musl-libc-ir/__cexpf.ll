; ModuleID = 'src/complex/__cexpf.c'
source_filename = "src/complex/__cexpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define hidden <2 x float> @__ldexp_cexpf(<2 x float> noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = extractelement <2 x float> %0, i64 0
  %4 = extractelement <2 x float> %0, i64 1
  %5 = tail call float @llvm.experimental.constrained.fsub.f32(float %3, float 0x40645C7780000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %6 = tail call float @expf(float noundef %5) #4
  %7 = bitcast float %6 to i32
  %8 = lshr i32 %7, 23
  %9 = and i32 %7, 8388607
  %10 = or i32 %9, 2130706432
  %11 = bitcast i32 %10 to float
  %12 = add i32 %1, -19
  %13 = add i32 %12, %8
  %14 = sdiv i32 %13, 2
  %15 = shl i32 %14, 23
  %16 = add i32 %15, 1065353216
  %17 = bitcast i32 %16 to float
  %18 = sub nsw i32 %13, %14
  %19 = shl i32 %18, 23
  %20 = add i32 %19, 1065353216
  %21 = bitcast i32 %20 to float
  %22 = tail call float @cosf(float noundef %4) #4
  %23 = tail call float @llvm.experimental.constrained.fmul.f32(float %22, float %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %24 = tail call float @llvm.experimental.constrained.fmul.f32(float %23, float %17, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %25 = tail call float @llvm.experimental.constrained.fmul.f32(float %24, float %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %26 = tail call float @sinf(float noundef %4) #4
  %27 = tail call float @llvm.experimental.constrained.fmul.f32(float %26, float %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %28 = tail call float @llvm.experimental.constrained.fmul.f32(float %27, float %17, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %29 = tail call float @llvm.experimental.constrained.fmul.f32(float %28, float %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %30 = insertelement <2 x float> undef, float %25, i64 0
  %31 = insertelement <2 x float> %30, float %29, i64 1
  ret <2 x float> %31
}

; Function Attrs: optsize
declare float @cosf(float noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #2

; Function Attrs: optsize
declare float @sinf(float noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare float @expf(float noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="64" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
