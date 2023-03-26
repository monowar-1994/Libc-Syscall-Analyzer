; ModuleID = 'src/math/acos.c'
source_filename = "src/math/acos.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define double @acos(double noundef %0) local_unnamed_addr #0 {
  %2 = bitcast double %0 to i64
  %3 = lshr i64 %2, 32
  %4 = trunc i64 %3 to i32
  %5 = and i32 %4, 2147483647
  %6 = icmp ugt i32 %5, 1072693247
  br i1 %6, label %7, label %24

7:                                                ; preds = %1
  %8 = trunc i64 %2 to i32
  %9 = add nsw i32 %5, -1072693248
  %10 = or i32 %9, %8
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %20

12:                                               ; preds = %7
  %13 = icmp sgt i64 %2, -1
  br i1 %13, label %18, label %14

14:                                               ; preds = %12
  %15 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %16 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x3870000000000000, metadata !"fpexcept.ignore") #3
  %17 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %15, double 0x3FF921FB54442D18, double %16, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %96

18:                                               ; preds = %12
  %19 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %96

20:                                               ; preds = %7
  %21 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %22 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %23 = tail call double @llvm.experimental.constrained.fdiv.f64(double %21, double %22, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %96

24:                                               ; preds = %1
  %25 = icmp ult i32 %5, 1071644672
  br i1 %25, label %26, label %48

26:                                               ; preds = %24
  %27 = icmp ult i32 %5, 1012924417
  br i1 %27, label %28, label %31

28:                                               ; preds = %26
  %29 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x3870000000000000, metadata !"fpexcept.ignore") #3
  %30 = tail call double @llvm.experimental.constrained.fadd.f64(double 0x3FF921FB54442D18, double %29, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %96

31:                                               ; preds = %26
  %32 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %32, double 0x3F023DE10DFDF709, double 0x3F49EFE07501B288, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %34 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %32, double %33, double 0xBFA48228B5688F3B, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %35 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %32, double %34, double 0x3FC9C1550E884455, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %36 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %32, double %35, double 0xBFD4D61203EB6F7D, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %37 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %32, double %36, double 0x3FC5555555555555, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %38 = tail call double @llvm.experimental.constrained.fmul.f64(double %32, double %37, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %39 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %32, double 0x3FB3B8C5B12E9282, double 0xBFE6066C1B8D0159, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %40 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %32, double %39, double 0x40002AE59C598AC8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %41 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %32, double %40, double 0xC0033A271C8A2D4B, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %42 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %32, double %41, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %43 = tail call double @llvm.experimental.constrained.fdiv.f64(double %38, double %42, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %44 = fneg double %0
  %45 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %44, double %43, double 0x3C91A62633145C07, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %46 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double %45, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %47 = tail call double @llvm.experimental.constrained.fsub.f64(double 0x3FF921FB54442D18, double %46, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %96

48:                                               ; preds = %24
  %49 = icmp sgt i64 %2, -1
  br i1 %49, label %70, label %50

50:                                               ; preds = %48
  %51 = tail call double @llvm.experimental.constrained.fadd.f64(double 1.000000e+00, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %52 = tail call double @llvm.experimental.constrained.fmul.f64(double %51, double 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %53 = tail call double @sqrt(double noundef %52) #5
  %54 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %52, double 0x3F023DE10DFDF709, double 0x3F49EFE07501B288, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %55 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %52, double %54, double 0xBFA48228B5688F3B, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %56 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %52, double %55, double 0x3FC9C1550E884455, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %57 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %52, double %56, double 0xBFD4D61203EB6F7D, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %58 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %52, double %57, double 0x3FC5555555555555, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %59 = tail call double @llvm.experimental.constrained.fmul.f64(double %52, double %58, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %60 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %52, double 0x3FB3B8C5B12E9282, double 0xBFE6066C1B8D0159, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %61 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %52, double %60, double 0x40002AE59C598AC8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %62 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %52, double %61, double 0xC0033A271C8A2D4B, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %63 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %52, double %62, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %64 = tail call double @llvm.experimental.constrained.fdiv.f64(double %59, double %63, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %65 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %64, double %53, double 0xBC91A62633145C07, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %66 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %67 = tail call double @llvm.experimental.constrained.fadd.f64(double %53, double %65, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %68 = tail call double @llvm.experimental.constrained.fsub.f64(double 0x3FF921FB54442D18, double %67, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %69 = tail call double @llvm.experimental.constrained.fmul.f64(double %66, double %68, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %96

70:                                               ; preds = %48
  %71 = tail call double @llvm.experimental.constrained.fsub.f64(double 1.000000e+00, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %72 = tail call double @llvm.experimental.constrained.fmul.f64(double %71, double 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %73 = tail call double @sqrt(double noundef %72) #5
  %74 = bitcast double %73 to i64
  %75 = and i64 %74, -4294967296
  %76 = bitcast i64 %75 to double
  %77 = fneg double %76
  %78 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %77, double %76, double %72, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %79 = tail call double @llvm.experimental.constrained.fadd.f64(double %73, double %76, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %80 = tail call double @llvm.experimental.constrained.fdiv.f64(double %78, double %79, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %81 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %72, double 0x3F023DE10DFDF709, double 0x3F49EFE07501B288, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %82 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %72, double %81, double 0xBFA48228B5688F3B, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %83 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %72, double %82, double 0x3FC9C1550E884455, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %84 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %72, double %83, double 0xBFD4D61203EB6F7D, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %85 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %72, double %84, double 0x3FC5555555555555, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %86 = tail call double @llvm.experimental.constrained.fmul.f64(double %72, double %85, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %87 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %72, double 0x3FB3B8C5B12E9282, double 0xBFE6066C1B8D0159, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %88 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %72, double %87, double 0x40002AE59C598AC8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %89 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %72, double %88, double 0xC0033A271C8A2D4B, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %90 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %72, double %89, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %91 = tail call double @llvm.experimental.constrained.fdiv.f64(double %86, double %90, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %92 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %91, double %73, double %80, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %93 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %94 = tail call double @llvm.experimental.constrained.fadd.f64(double %76, double %92, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %95 = tail call double @llvm.experimental.constrained.fmul.f64(double %93, double %94, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %96

96:                                               ; preds = %14, %18, %20, %70, %50, %31, %28
  %97 = phi double [ %30, %28 ], [ %47, %31 ], [ %69, %50 ], [ %95, %70 ], [ %17, %14 ], [ %19, %18 ], [ %23, %20 ]
  ret double %97
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #1

; Function Attrs: optsize
declare double @sqrt(double noundef) local_unnamed_addr #2

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
