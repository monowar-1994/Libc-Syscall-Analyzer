; ModuleID = 'src/math/frexpf.c'
source_filename = "src/math/frexpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nosync nounwind optsize strictfp
define float @frexpf(float noundef %0, i32* nocapture noundef %1) local_unnamed_addr #0 {
  %3 = bitcast float %0 to i32
  %4 = lshr i32 %3, 23
  %5 = trunc i32 %4 to i8
  switch i8 %5, label %18 [
    i8 0, label %6
    i8 -1, label %24
  ]

6:                                                ; preds = %2
  %7 = tail call i1 @llvm.experimental.constrained.fcmp.f32(float %0, float 0.000000e+00, metadata !"une", metadata !"fpexcept.ignore") #2
  br i1 %7, label %8, label %15

8:                                                ; preds = %6
  %9 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #2
  %10 = tail call double @llvm.experimental.constrained.fmul.f64(double %9, double 0x43F0000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %11 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %12 = tail call float @frexpf(float noundef %11, i32* noundef %1) #3
  %13 = load i32, i32* %1, align 4, !tbaa !3
  %14 = add nsw i32 %13, -64
  br label %15

15:                                               ; preds = %6, %8
  %16 = phi i32 [ %14, %8 ], [ 0, %6 ]
  %17 = phi float [ %12, %8 ], [ %0, %6 ]
  store i32 %16, i32* %1, align 4, !tbaa !3
  br label %24

18:                                               ; preds = %2
  %19 = and i32 %4, 255
  %20 = add nsw i32 %19, -126
  store i32 %20, i32* %1, align 4, !tbaa !3
  %21 = and i32 %3, -2139095041
  %22 = or i32 %21, 1056964608
  %23 = bitcast i32 %22 to float
  br label %24

24:                                               ; preds = %2, %18, %15
  %25 = phi float [ %23, %18 ], [ %17, %15 ], [ %0, %2 ]
  ret float %25
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #1

attributes #0 = { nofree nosync nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }
attributes #3 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
