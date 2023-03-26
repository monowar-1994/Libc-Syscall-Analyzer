; ModuleID = 'src/math/__tan.c'
source_filename = "src/math/__tan.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define hidden double @__tan(double noundef %0, double noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = bitcast double %0 to i64
  %5 = lshr i64 %4, 32
  %6 = trunc i64 %5 to i32
  %7 = and i32 %6, 2147483640
  %8 = icmp ugt i32 %7, 1072010279
  br i1 %8, label %9, label %19

9:                                                ; preds = %3
  %10 = lshr i32 %6, 31
  %11 = icmp sgt i64 %4, -1
  %12 = fneg double %0
  %13 = fneg double %1
  %14 = select i1 %11, double %1, double %13
  %15 = select i1 %11, double %0, double %12
  %16 = tail call double @llvm.experimental.constrained.fsub.f64(double 0x3FE921FB54442D18, double %15, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %17 = tail call double @llvm.experimental.constrained.fsub.f64(double 0x3C81A62633145C07, double %14, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %18 = tail call double @llvm.experimental.constrained.fadd.f64(double %16, double %17, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %19

19:                                               ; preds = %9, %3
  %20 = phi i32 [ %10, %9 ], [ undef, %3 ]
  %21 = phi double [ 0.000000e+00, %9 ], [ %1, %3 ]
  %22 = phi double [ %18, %9 ], [ %0, %3 ]
  %23 = tail call double @llvm.experimental.constrained.fmul.f64(double %22, double %22, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %24 = tail call double @llvm.experimental.constrained.fmul.f64(double %23, double %23, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %25 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %24, double 0xBEF375CBDB605373, double 0x3F147E88A03792A6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %26 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %24, double %25, double 0x3F4344D8F2F26501, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %27 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %24, double %26, double 0x3F6D6D22C9560328, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %28 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %24, double %27, double 0x3F9664F48406D637, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %29 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %24, double %28, double 0x3FC111111110FE7A, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %30 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %24, double 0x3EFB2A7074BF7AD4, double 0x3F12B80F32F0A7E9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %31 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %24, double %30, double 0x3F3026F71A8D1068, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %32 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %24, double %31, double 0x3F57DBC8FEE08315, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %33 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %24, double %32, double 0x3F8226E3E96E8493, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %34 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %24, double %33, double 0x3FABA1BA1BB341FE, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %35 = tail call double @llvm.experimental.constrained.fmul.f64(double %23, double %34, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %36 = tail call double @llvm.experimental.constrained.fmul.f64(double %23, double %22, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %37 = tail call double @llvm.experimental.constrained.fadd.f64(double %29, double %35, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %38 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %36, double %37, double %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %39 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %23, double %38, double %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %40 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %36, double 0x3FD5555555555563, double %39, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %41 = tail call double @llvm.experimental.constrained.fadd.f64(double %22, double %40, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br i1 %8, label %42, label %55

42:                                               ; preds = %19
  %43 = mul i32 %2, -2
  %44 = or i32 %43, 1
  %45 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %44, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %46 = tail call double @llvm.experimental.constrained.fmul.f64(double %41, double %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %47 = tail call double @llvm.experimental.constrained.fadd.f64(double %41, double %45, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %48 = tail call double @llvm.experimental.constrained.fdiv.f64(double %46, double %47, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %49 = tail call double @llvm.experimental.constrained.fsub.f64(double %40, double %48, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %50 = tail call double @llvm.experimental.constrained.fadd.f64(double %22, double %49, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %51 = tail call double @llvm.experimental.constrained.fmuladd.f64(double -2.000000e+00, double %50, double %45, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %52 = icmp eq i32 %20, 0
  %53 = fneg double %51
  %54 = select i1 %52, double %51, double %53
  br label %70

55:                                               ; preds = %19
  %56 = icmp eq i32 %2, 0
  br i1 %56, label %70, label %57

57:                                               ; preds = %55
  %58 = bitcast double %41 to i64
  %59 = and i64 %58, -4294967296
  %60 = bitcast i64 %59 to double
  %61 = tail call double @llvm.experimental.constrained.fsub.f64(double %60, double %22, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %62 = tail call double @llvm.experimental.constrained.fsub.f64(double %40, double %61, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %63 = tail call double @llvm.experimental.constrained.fdiv.f64(double -1.000000e+00, double %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %64 = bitcast double %63 to i64
  %65 = and i64 %64, -4294967296
  %66 = bitcast i64 %65 to double
  %67 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %66, double %60, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %68 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %66, double %62, double %67, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %69 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %63, double %68, double %66, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %70

70:                                               ; preds = %55, %57, %42
  %71 = phi double [ %54, %42 ], [ %69, %57 ], [ %41, %55 ]
  ret double %71
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #1

attributes #0 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
