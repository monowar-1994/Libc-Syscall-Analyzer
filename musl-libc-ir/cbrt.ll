; ModuleID = 'src/math/cbrt.c'
source_filename = "src/math/cbrt.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define double @cbrt(double noundef %0) local_unnamed_addr #0 {
  %2 = bitcast double %0 to i64
  %3 = lshr i64 %2, 32
  %4 = trunc i64 %3 to i32
  %5 = and i32 %4, 2147483647
  %6 = icmp ugt i32 %5, 2146435071
  br i1 %6, label %7, label %9

7:                                                ; preds = %1
  %8 = tail call double @llvm.experimental.constrained.fadd.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %50

9:                                                ; preds = %1
  %10 = icmp ult i32 %5, 1048576
  br i1 %10, label %11, label %18

11:                                               ; preds = %9
  %12 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double 0x4350000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %13 = bitcast double %12 to i64
  %14 = lshr i64 %13, 32
  %15 = trunc i64 %14 to i32
  %16 = and i32 %15, 2147483647
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %50, label %18

18:                                               ; preds = %9, %11
  %19 = phi i32 [ %16, %11 ], [ %5, %9 ]
  %20 = phi i32 [ 696219795, %11 ], [ 715094163, %9 ]
  %21 = phi i64 [ %13, %11 ], [ %2, %9 ]
  %22 = udiv i32 %19, 3
  %23 = add nuw nsw i32 %22, %20
  %24 = and i64 %21, -9223372036854775808
  %25 = zext i32 %23 to i64
  %26 = shl nuw nsw i64 %25, 32
  %27 = or i64 %26, %24
  %28 = bitcast i64 %27 to double
  %29 = tail call double @llvm.experimental.constrained.fmul.f64(double %28, double %28, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %30 = tail call double @llvm.experimental.constrained.fdiv.f64(double %28, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %31 = tail call double @llvm.experimental.constrained.fmul.f64(double %29, double %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %32 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %31, double 0x3FF9F1604A49D6C2, double 0xBFFE28E092F02420, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %33 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %31, double %32, double 0x3FFE03E60F61E692, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %34 = tail call double @llvm.experimental.constrained.fmul.f64(double %31, double %31, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %35 = tail call double @llvm.experimental.constrained.fmul.f64(double %34, double %31, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %36 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %31, double 0x3FC2B000D4E4EDD7, double 0xBFE844CBBEE751D9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %37 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %35, double %36, double %33, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %38 = tail call double @llvm.experimental.constrained.fmul.f64(double %28, double %37, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %39 = bitcast double %38 to i64
  %40 = add i64 %39, 2147483648
  %41 = and i64 %40, -1073741824
  %42 = bitcast i64 %41 to double
  %43 = tail call double @llvm.experimental.constrained.fmul.f64(double %42, double %42, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %44 = tail call double @llvm.experimental.constrained.fdiv.f64(double %0, double %43, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %45 = tail call double @llvm.experimental.constrained.fadd.f64(double %42, double %42, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %46 = tail call double @llvm.experimental.constrained.fsub.f64(double %44, double %42, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %47 = tail call double @llvm.experimental.constrained.fadd.f64(double %45, double %44, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %48 = tail call double @llvm.experimental.constrained.fdiv.f64(double %46, double %47, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %49 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %42, double %48, double %42, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %50

50:                                               ; preds = %11, %18, %7
  %51 = phi double [ %8, %7 ], [ %49, %18 ], [ %0, %11 ]
  ret double %51
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

attributes #0 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
