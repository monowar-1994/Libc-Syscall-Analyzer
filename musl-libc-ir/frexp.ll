; ModuleID = 'src/math/frexp.c'
source_filename = "src/math/frexp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nosync nounwind optsize strictfp
define double @frexp(double noundef %0, i32* nocapture noundef %1) local_unnamed_addr #0 {
  %3 = bitcast double %0 to i64
  %4 = lshr i64 %3, 52
  %5 = trunc i64 %4 to i32
  %6 = and i32 %5, 2047
  switch i32 %6, label %17 [
    i32 0, label %7
    i32 2047, label %22
  ]

7:                                                ; preds = %2
  %8 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %0, double 0.000000e+00, metadata !"une", metadata !"fpexcept.ignore") #2
  br i1 %8, label %9, label %14

9:                                                ; preds = %7
  %10 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double 0x43F0000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %11 = tail call double @frexp(double noundef %10, i32* noundef %1) #3
  %12 = load i32, i32* %1, align 4, !tbaa !3
  %13 = add nsw i32 %12, -64
  br label %14

14:                                               ; preds = %7, %9
  %15 = phi i32 [ %13, %9 ], [ 0, %7 ]
  %16 = phi double [ %11, %9 ], [ %0, %7 ]
  store i32 %15, i32* %1, align 4, !tbaa !3
  br label %22

17:                                               ; preds = %2
  %18 = add nsw i32 %6, -1022
  store i32 %18, i32* %1, align 4, !tbaa !3
  %19 = and i64 %3, -9218868437227405313
  %20 = or i64 %19, 4602678819172646912
  %21 = bitcast i64 %20 to double
  br label %22

22:                                               ; preds = %2, %17, %14
  %23 = phi double [ %21, %17 ], [ %16, %14 ], [ %0, %2 ]
  ret double %23
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

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
