; ModuleID = 'src/math/hypot.c'
source_filename = "src/math/hypot.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define double @hypot(double noundef %0, double noundef %1) local_unnamed_addr #0 {
  %3 = bitcast double %0 to i64
  %4 = and i64 %3, 9223372036854775807
  %5 = bitcast double %1 to i64
  %6 = and i64 %5, 9223372036854775807
  %7 = icmp ult i64 %4, %6
  %8 = icmp ugt i64 %4, %6
  %9 = select i1 %8, i64 %4, i64 %6
  %10 = bitcast i64 %9 to double
  %11 = select i1 %7, i64 %4, i64 %6
  %12 = bitcast i64 %11 to double
  %13 = lshr i64 %9, 52
  %14 = trunc i64 %13 to i32
  %15 = lshr i64 %11, 52
  %16 = trunc i64 %15 to i32
  %17 = icmp eq i32 %16, 2047
  br i1 %17, label %73, label %18

18:                                               ; preds = %2
  %19 = icmp eq i32 %14, 2047
  %20 = icmp eq i64 %11, 0
  %21 = or i1 %20, %19
  br i1 %21, label %73, label %22

22:                                               ; preds = %18
  %23 = sub nsw i32 %14, %16
  %24 = icmp sgt i32 %23, 64
  br i1 %24, label %25, label %27

25:                                               ; preds = %22
  %26 = tail call double @llvm.experimental.constrained.fadd.f64(double %10, double %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %73

27:                                               ; preds = %22
  %28 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %29 = icmp ugt i32 %14, 1533
  br i1 %29, label %30, label %33

30:                                               ; preds = %27
  %31 = tail call double @llvm.experimental.constrained.fmul.f64(double %10, double 0x1430000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %32 = tail call double @llvm.experimental.constrained.fmul.f64(double %12, double 0x1430000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %38

33:                                               ; preds = %27
  %34 = icmp ult i32 %16, 573
  br i1 %34, label %35, label %38

35:                                               ; preds = %33
  %36 = tail call double @llvm.experimental.constrained.fmul.f64(double %10, double 0x6BB0000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %37 = tail call double @llvm.experimental.constrained.fmul.f64(double %12, double 0x6BB0000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %38

38:                                               ; preds = %33, %35, %30
  %39 = phi double [ %32, %30 ], [ %37, %35 ], [ %12, %33 ]
  %40 = phi double [ %31, %30 ], [ %36, %35 ], [ %10, %33 ]
  %41 = phi double [ 0x6BB0000000000000, %30 ], [ 0x1430000000000000, %35 ], [ %28, %33 ]
  %42 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %43 = tail call double @llvm.experimental.constrained.fadd.f64(double 0x41A0000000000000, double %42, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %44 = tail call double @llvm.experimental.constrained.fmul.f64(double %40, double %43, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %45 = tail call double @llvm.experimental.constrained.fsub.f64(double %40, double %44, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %46 = tail call double @llvm.experimental.constrained.fadd.f64(double %45, double %44, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %47 = tail call double @llvm.experimental.constrained.fsub.f64(double %40, double %46, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %48 = tail call double @llvm.experimental.constrained.fmul.f64(double %40, double %40, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %49 = fneg double %48
  %50 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %46, double %46, double %49, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %51 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %52 = tail call double @llvm.experimental.constrained.fmul.f64(double %51, double %46, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %53 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %52, double %47, double %50, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %54 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %47, double %47, double %53, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %55 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %56 = tail call double @llvm.experimental.constrained.fadd.f64(double 0x41A0000000000000, double %55, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %57 = tail call double @llvm.experimental.constrained.fmul.f64(double %39, double %56, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %58 = tail call double @llvm.experimental.constrained.fsub.f64(double %39, double %57, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %59 = tail call double @llvm.experimental.constrained.fadd.f64(double %58, double %57, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %60 = tail call double @llvm.experimental.constrained.fsub.f64(double %39, double %59, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %61 = tail call double @llvm.experimental.constrained.fmul.f64(double %39, double %39, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %62 = fneg double %61
  %63 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %59, double %59, double %62, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %64 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %65 = tail call double @llvm.experimental.constrained.fmul.f64(double %64, double %59, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %66 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %65, double %60, double %63, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %67 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %60, double %60, double %66, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %68 = tail call double @llvm.experimental.constrained.fadd.f64(double %67, double %54, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %69 = tail call double @llvm.experimental.constrained.fadd.f64(double %68, double %61, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %70 = tail call double @llvm.experimental.constrained.fadd.f64(double %69, double %48, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %71 = tail call double @sqrt(double noundef %70) #5
  %72 = tail call double @llvm.experimental.constrained.fmul.f64(double %41, double %71, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %73

73:                                               ; preds = %18, %2, %38, %25
  %74 = phi double [ %26, %25 ], [ %72, %38 ], [ %12, %2 ], [ %10, %18 ]
  ret double %74
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: optsize
declare double @sqrt(double noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #1

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
