; ModuleID = 'src/complex/catan.c'
source_filename = "src/complex/catan.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define { double, double } @catan(double noundef %0, double noundef %1) local_unnamed_addr #0 {
  %3 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %4 = tail call double @llvm.experimental.constrained.fsub.f64(double 1.000000e+00, double %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %5 = fneg double %1
  %6 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %5, double %1, double %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %7 = tail call double @llvm.experimental.constrained.fmul.f64(double 2.000000e+00, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %8 = tail call double @atan2(double noundef %7, double noundef %6) #4
  %9 = tail call double @llvm.experimental.constrained.fmul.f64(double 5.000000e-01, double %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %10 = tail call double @llvm.experimental.constrained.fdiv.f64(double %9, double 0x400921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %11 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %10, double 0.000000e+00, metadata !"oge", metadata !"fpexcept.ignore") #5
  br i1 %11, label %12, label %14

12:                                               ; preds = %2
  %13 = tail call double @llvm.experimental.constrained.fadd.f64(double %10, double 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %16

14:                                               ; preds = %2
  %15 = tail call double @llvm.experimental.constrained.fsub.f64(double %10, double 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %16

16:                                               ; preds = %12, %14
  %17 = phi double [ %13, %12 ], [ %15, %14 ]
  %18 = tail call i64 @llvm.experimental.constrained.fptosi.i64.f64(double %17, metadata !"fpexcept.ignore") #5
  %19 = tail call double @llvm.experimental.constrained.sitofp.f64.i64(i64 %18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %20 = fneg double %19
  %21 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %20, double 0x400921FB54000000, double %9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %22 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %20, double 0x3E210B4610000000, double %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %23 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %20, double 0x3C6A62633145C06E, double %22, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %24 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %25 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %24, double %24, double %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %26 = tail call double @llvm.experimental.constrained.fadd.f64(double %1, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %27 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %26, double %26, double %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = tail call double @llvm.experimental.constrained.fdiv.f64(double %27, double %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %29 = tail call double @log(double noundef %28) #4
  %30 = tail call double @llvm.experimental.constrained.fmul.f64(double 2.500000e-01, double %29, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %31 = insertvalue { double, double } poison, double %23, 0
  %32 = insertvalue { double, double } %31, double %30, 1
  ret { double, double } %32
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #1

; Function Attrs: optsize
declare double @atan2(double noundef, double noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #1

; Function Attrs: optsize
declare double @log(double noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i64 @llvm.experimental.constrained.fptosi.i64.f64(double, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i64(i64, metadata, metadata) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
