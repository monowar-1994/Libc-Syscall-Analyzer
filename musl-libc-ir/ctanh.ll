; ModuleID = 'src/complex/ctanh.c'
source_filename = "src/complex/ctanh.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define { double, double } @ctanh(double noundef %0, double noundef %1) local_unnamed_addr #0 {
  %3 = bitcast double %0 to i64
  %4 = lshr i64 %3, 32
  %5 = trunc i64 %4 to i32
  %6 = and i32 %5, 2147483647
  %7 = icmp ugt i32 %6, 2146435071
  br i1 %7, label %8, label %32

8:                                                ; preds = %2
  %9 = trunc i64 %3 to i32
  %10 = and i32 %5, 1048575
  %11 = or i32 %10, %9
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %18, label %13

13:                                               ; preds = %8
  %14 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %15 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %1, double %14, metadata !"oeq", metadata !"fpexcept.ignore") #3
  br i1 %15, label %72, label %16

16:                                               ; preds = %13
  %17 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %72

18:                                               ; preds = %8
  %19 = add i64 %3, -4611686018427387904
  %20 = bitcast i64 %19 to double
  %21 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %22 = bitcast double %1 to i64
  %23 = and i64 %22, 9223372036854775807
  %24 = icmp eq i64 %23, 9218868437227405312
  br i1 %24, label %29, label %25

25:                                               ; preds = %18
  %26 = tail call double @sin(double noundef %1) #4
  %27 = tail call double @cos(double noundef %1) #4
  %28 = tail call double @llvm.experimental.constrained.fmul.f64(double %26, double %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %29

29:                                               ; preds = %18, %25
  %30 = phi double [ %28, %25 ], [ %1, %18 ]
  %31 = tail call double @copysign(double noundef %21, double noundef %30) #4
  br label %72

32:                                               ; preds = %2
  %33 = bitcast double %1 to i64
  %34 = and i64 %33, 9218868437227405312
  %35 = icmp eq i64 %34, 9218868437227405312
  br i1 %35, label %36, label %43

36:                                               ; preds = %32
  %37 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %0, double 0.000000e+00, metadata !"une", metadata !"fpexcept.ignore") #3
  br i1 %37, label %38, label %40

38:                                               ; preds = %36
  %39 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %40

40:                                               ; preds = %36, %38
  %41 = phi double [ %39, %38 ], [ %0, %36 ]
  %42 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %72

43:                                               ; preds = %32
  %44 = icmp ugt i32 %6, 1077280767
  br i1 %44, label %45, label %58

45:                                               ; preds = %43
  %46 = tail call double @fabs(double noundef %0) #4
  %47 = fneg double %46
  %48 = tail call double @exp(double noundef %47) #4
  %49 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %50 = tail call double @copysign(double noundef %49, double noundef %0) #4
  %51 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %52 = tail call double @sin(double noundef %1) #4
  %53 = tail call double @llvm.experimental.constrained.fmul.f64(double %51, double %52, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %54 = tail call double @cos(double noundef %1) #4
  %55 = tail call double @llvm.experimental.constrained.fmul.f64(double %53, double %54, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %56 = tail call double @llvm.experimental.constrained.fmul.f64(double %55, double %48, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %57 = tail call double @llvm.experimental.constrained.fmul.f64(double %56, double %48, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %72

58:                                               ; preds = %43
  %59 = tail call double @tan(double noundef %1) #4
  %60 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %59, double %59, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %61 = tail call double @sinh(double noundef %0) #4
  %62 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %63 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %61, double %61, double %62, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %64 = tail call double @sqrt(double noundef %63) #4
  %65 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %66 = tail call double @llvm.experimental.constrained.fmul.f64(double %60, double %61, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %67 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %66, double %61, double %65, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %68 = tail call double @llvm.experimental.constrained.fmul.f64(double %60, double %64, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %69 = tail call double @llvm.experimental.constrained.fmul.f64(double %68, double %61, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %70 = tail call double @llvm.experimental.constrained.fdiv.f64(double %69, double %67, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %71 = tail call double @llvm.experimental.constrained.fdiv.f64(double %59, double %67, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %72

72:                                               ; preds = %16, %13, %58, %45, %40, %29
  %73 = phi double [ %20, %29 ], [ %50, %45 ], [ %70, %58 ], [ %41, %40 ], [ %0, %13 ], [ %0, %16 ]
  %74 = phi double [ %31, %29 ], [ %57, %45 ], [ %71, %58 ], [ %42, %40 ], [ %1, %13 ], [ %17, %16 ]
  %75 = insertvalue { double, double } poison, double %73, 0
  %76 = insertvalue { double, double } %75, double %74, 1
  ret { double, double } %76
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: optsize
declare double @copysign(double noundef, double noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare double @sin(double noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare double @cos(double noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

; Function Attrs: optsize
declare double @exp(double noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare double @fabs(double noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare double @tan(double noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #1

; Function Attrs: optsize
declare double @sinh(double noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare double @sqrt(double noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
