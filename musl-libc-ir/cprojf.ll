; ModuleID = 'src/complex/cprojf.c'
source_filename = "src/complex/cprojf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define <2 x float> @cprojf(<2 x float> noundef %0) local_unnamed_addr #0 {
  %2 = bitcast <2 x float> %0 to <2 x i32>
  %3 = and <2 x i32> %2, <i32 2147483647, i32 2147483647>
  %4 = icmp eq <2 x i32> %3, <i32 2139095040, i32 2139095040>
  %5 = shufflevector <2 x i1> %4, <2 x i1> poison, <2 x i32> <i32 1, i32 undef>
  %6 = or <2 x i1> %4, %5
  %7 = extractelement <2 x i1> %6, i64 0
  br i1 %7, label %8, label %13

8:                                                ; preds = %1
  %9 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %10 = extractelement <2 x float> %0, i64 1
  %11 = tail call float @copysignf(float noundef %9, float noundef %10) #4
  %12 = insertelement <2 x float> <float 0x7FF0000000000000, float poison>, float %11, i64 1
  br label %13

13:                                               ; preds = %1, %8
  %14 = phi <2 x float> [ %12, %8 ], [ %0, %1 ]
  ret <2 x float> %14
}

; Function Attrs: optsize
declare float @copysignf(float noundef, float noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="64" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
