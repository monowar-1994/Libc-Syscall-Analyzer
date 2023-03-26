; ModuleID = 'src/complex/cacoshf.c'
source_filename = "src/complex/cacoshf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define <2 x float> @cacoshf(<2 x float> noundef %0) local_unnamed_addr #0 {
  %2 = bitcast <2 x float> %0 to <2 x i32>
  %3 = extractelement <2 x i32> %2, i64 1
  %4 = tail call <2 x float> @cacosf(<2 x float> noundef %0) #2
  %5 = extractelement <2 x float> %4, i64 1
  %6 = icmp sgt i32 %3, -1
  br i1 %6, label %12, label %7

7:                                                ; preds = %1
  %8 = extractelement <2 x float> %4, i64 0
  %9 = fneg float %8
  %10 = insertelement <2 x float> undef, float %5, i64 0
  %11 = insertelement <2 x float> %10, float %9, i64 1
  br label %16

12:                                               ; preds = %1
  %13 = fneg float %5
  %14 = insertelement <2 x float> undef, float %13, i64 0
  %15 = shufflevector <2 x float> %14, <2 x float> %4, <2 x i32> <i32 0, i32 2>
  br label %16

16:                                               ; preds = %12, %7
  %17 = phi <2 x float> [ %11, %7 ], [ %15, %12 ]
  ret <2 x float> %17
}

; Function Attrs: optsize
declare <2 x float> @cacosf(<2 x float> noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="64" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
