; ModuleID = 'src/complex/cpowf.c'
source_filename = "src/complex/cpowf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define <2 x float> @cpowf(<2 x float> noundef %0, <2 x float> noundef %1) local_unnamed_addr #0 {
  %3 = extractelement <2 x float> %1, i64 0
  %4 = extractelement <2 x float> %1, i64 1
  %5 = tail call <2 x float> @clogf(<2 x float> noundef %0) #3
  %6 = extractelement <2 x float> %5, i64 0
  %7 = extractelement <2 x float> %5, i64 1
  %8 = tail call float @llvm.experimental.constrained.fmul.f32(float %3, float %6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %9 = tail call float @llvm.experimental.constrained.fmul.f32(float %4, float %7, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %10 = tail call float @llvm.experimental.constrained.fmul.f32(float %3, float %7, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %11 = tail call float @llvm.experimental.constrained.fmul.f32(float %4, float %6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %12 = tail call float @llvm.experimental.constrained.fsub.f32(float %8, float %9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %13 = tail call float @llvm.experimental.constrained.fadd.f32(float %10, float %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %14 = tail call i1 @llvm.experimental.constrained.fcmp.f32(float %12, float %12, metadata !"uno", metadata !"fpexcept.ignore") #4
  %15 = insertelement <2 x float> poison, float %12, i64 0
  %16 = insertelement <2 x float> %15, float %13, i64 1
  br i1 %14, label %17, label %21, !prof !3

17:                                               ; preds = %2
  %18 = tail call i1 @llvm.experimental.constrained.fcmp.f32(float %13, float %13, metadata !"uno", metadata !"fpexcept.ignore") #4
  br i1 %18, label %19, label %21, !prof !3

19:                                               ; preds = %17
  %20 = tail call <2 x float> @__mulsc3(float noundef %3, float noundef %4, float noundef %6, float noundef %7) #3
  br label %21

21:                                               ; preds = %19, %17, %2
  %22 = phi <2 x float> [ %16, %2 ], [ %16, %17 ], [ %20, %19 ]
  %23 = tail call <2 x float> @cexpf(<2 x float> noundef %22) #3
  ret <2 x float> %23
}

; Function Attrs: optsize
declare <2 x float> @cexpf(<2 x float> noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare <2 x float> @clogf(<2 x float> noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f32(float, float, metadata, metadata) #2

declare <2 x float> @__mulsc3(float, float, float, float) local_unnamed_addr

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
!3 = !{!"branch_weights", i32 1, i32 1048575}
