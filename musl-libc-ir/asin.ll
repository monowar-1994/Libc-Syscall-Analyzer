; ModuleID = 'src/math/asin.c'
source_filename = "src/math/asin.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define double @asin(double noundef %0) local_unnamed_addr #0 {
  %2 = bitcast double %0 to i64
  %3 = lshr i64 %2, 32
  %4 = trunc i64 %3 to i32
  %5 = and i32 %4, 2147483647
  %6 = icmp ugt i32 %5, 1072693247
  br i1 %6, label %7, label %19

7:                                                ; preds = %1
  %8 = trunc i64 %2 to i32
  %9 = add nsw i32 %5, -1072693248
  %10 = or i32 %9, %8
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %15

12:                                               ; preds = %7
  %13 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x3870000000000000, metadata !"fpexcept.ignore") #3
  %14 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %0, double 0x3FF921FB54442D18, double %13, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %88

15:                                               ; preds = %7
  %16 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %17 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %18 = tail call double @llvm.experimental.constrained.fdiv.f64(double %16, double %17, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %88

19:                                               ; preds = %1
  %20 = icmp ult i32 %5, 1071644672
  br i1 %20, label %21, label %38

21:                                               ; preds = %19
  %22 = add nsw i32 %5, -1048576
  %23 = icmp ult i32 %22, 1044381696
  br i1 %23, label %88, label %24

24:                                               ; preds = %21
  %25 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %26 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %25, double 0x3F023DE10DFDF709, double 0x3F49EFE07501B288, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %27 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %25, double %26, double 0xBFA48228B5688F3B, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %28 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %25, double %27, double 0x3FC9C1550E884455, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %29 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %25, double %28, double 0xBFD4D61203EB6F7D, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %30 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %25, double %29, double 0x3FC5555555555555, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %31 = tail call double @llvm.experimental.constrained.fmul.f64(double %25, double %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %32 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %25, double 0x3FB3B8C5B12E9282, double 0xBFE6066C1B8D0159, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %33 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %25, double %32, double 0x40002AE59C598AC8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %34 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %25, double %33, double 0xC0033A271C8A2D4B, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %35 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %25, double %34, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %36 = tail call double @llvm.experimental.constrained.fdiv.f64(double %31, double %35, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %37 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %0, double %36, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %88

38:                                               ; preds = %19
  %39 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %40 = tail call double @fabs(double noundef %0) #5
  %41 = tail call double @llvm.experimental.constrained.fsub.f64(double %39, double %40, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %42 = tail call double @llvm.experimental.constrained.fmul.f64(double %41, double 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %43 = tail call double @sqrt(double noundef %42) #5
  %44 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %42, double 0x3F023DE10DFDF709, double 0x3F49EFE07501B288, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %45 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %42, double %44, double 0xBFA48228B5688F3B, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %46 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %42, double %45, double 0x3FC9C1550E884455, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %47 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %42, double %46, double 0xBFD4D61203EB6F7D, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %48 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %42, double %47, double 0x3FC5555555555555, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %49 = tail call double @llvm.experimental.constrained.fmul.f64(double %42, double %48, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %50 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %42, double 0x3FB3B8C5B12E9282, double 0xBFE6066C1B8D0159, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %51 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %42, double %50, double 0x40002AE59C598AC8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %52 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %42, double %51, double 0xC0033A271C8A2D4B, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %53 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %42, double %52, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %54 = tail call double @llvm.experimental.constrained.fdiv.f64(double %49, double %53, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %55 = icmp ugt i32 %5, 1072640818
  br i1 %55, label %56, label %61

56:                                               ; preds = %38
  %57 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %58 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %43, double %54, double %43, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %59 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %57, double %58, double 0xBC91A62633145C07, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %60 = tail call double @llvm.experimental.constrained.fsub.f64(double 0x3FF921FB54442D18, double %59, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %83

61:                                               ; preds = %38
  %62 = bitcast double %43 to i64
  %63 = and i64 %62, -4294967296
  %64 = bitcast i64 %63 to double
  %65 = fneg double %64
  %66 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %65, double %64, double %42, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %67 = tail call double @llvm.experimental.constrained.fadd.f64(double %43, double %64, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %68 = tail call double @llvm.experimental.constrained.fdiv.f64(double %66, double %67, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %69 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %70 = tail call double @llvm.experimental.constrained.fmul.f64(double %69, double %43, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %71 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %72 = fneg double %71
  %73 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %72, double %68, double 0x3C91A62633145C07, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %74 = fneg double %73
  %75 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %70, double %54, double %74, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %76 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %77 = tail call double @llvm.experimental.constrained.fmul.f64(double %76, double %64, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %78 = fneg double %77
  %79 = tail call double @llvm.experimental.constrained.fmuladd.f64(double 5.000000e-01, double 0x3FF921FB54442D18, double %78, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %80 = tail call double @llvm.experimental.constrained.fsub.f64(double %75, double %79, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %81 = fneg double %80
  %82 = tail call double @llvm.experimental.constrained.fmuladd.f64(double 5.000000e-01, double 0x3FF921FB54442D18, double %81, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %83

83:                                               ; preds = %61, %56
  %84 = phi double [ %60, %56 ], [ %82, %61 ]
  %85 = fneg double %84
  %86 = icmp slt i64 %2, 0
  %87 = select i1 %86, double %85, double %84
  br label %88

88:                                               ; preds = %83, %21, %12, %15, %24
  %89 = phi double [ %37, %24 ], [ %14, %12 ], [ %18, %15 ], [ %0, %21 ], [ %87, %83 ]
  ret double %89
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #1

; Function Attrs: optsize
declare double @fabs(double noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare double @sqrt(double noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { strictfp }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
