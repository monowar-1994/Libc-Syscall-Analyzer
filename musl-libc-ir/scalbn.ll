; ModuleID = 'src/math/scalbn.c'
source_filename = "src/math/scalbn.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define double @scalbn(double noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %1, 1023
  br i1 %3, label %4, label %13

4:                                                ; preds = %2
  %5 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double 0x7FE0000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %6 = add nsw i32 %1, -1023
  %7 = icmp ugt i32 %1, 2046
  br i1 %7, label %8, label %24

8:                                                ; preds = %4
  %9 = tail call double @llvm.experimental.constrained.fmul.f64(double %5, double 0x7FE0000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %10 = icmp ult i32 %1, 3069
  %11 = select i1 %10, i32 %1, i32 3069
  %12 = add nsw i32 %11, -2046
  br label %24

13:                                               ; preds = %2
  %14 = icmp slt i32 %1, -1022
  br i1 %14, label %15, label %24

15:                                               ; preds = %13
  %16 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double 0x360000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %17 = add nuw nsw i32 %1, 969
  %18 = icmp ult i32 %1, -1991
  br i1 %18, label %19, label %24

19:                                               ; preds = %15
  %20 = tail call double @llvm.experimental.constrained.fmul.f64(double %16, double 0x360000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %21 = icmp ugt i32 %1, -2960
  %22 = select i1 %21, i32 %1, i32 -2960
  %23 = add nuw nsw i32 %22, 1938
  br label %24

24:                                               ; preds = %13, %19, %15, %4, %8
  %25 = phi i32 [ %12, %8 ], [ %6, %4 ], [ %23, %19 ], [ %17, %15 ], [ %1, %13 ]
  %26 = phi double [ %9, %8 ], [ %5, %4 ], [ %20, %19 ], [ %16, %15 ], [ %0, %13 ]
  %27 = add nsw i32 %25, 1023
  %28 = zext i32 %27 to i64
  %29 = shl nuw nsw i64 %28, 52
  %30 = bitcast i64 %29 to double
  %31 = tail call double @llvm.experimental.constrained.fmul.f64(double %26, double %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  ret double %31
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

attributes #0 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
