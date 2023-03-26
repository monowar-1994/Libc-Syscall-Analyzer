; ModuleID = 'src/math/acosh.c'
source_filename = "src/math/acosh.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define double @acosh(double noundef %0) local_unnamed_addr #0 {
  %2 = bitcast double %0 to i64
  %3 = lshr i64 %2, 52
  %4 = trunc i64 %3 to i32
  %5 = and i32 %4, 2047
  %6 = icmp ult i32 %5, 1024
  br i1 %6, label %7, label %22

7:                                                ; preds = %1
  %8 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %9 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %10 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %11 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %12 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %13 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %14 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %15 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %16 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double %15, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %17 = tail call double @llvm.experimental.constrained.fmul.f64(double %14, double %16, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %18 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %11, double %13, double %17, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %19 = tail call double @sqrt(double noundef %18) #4
  %20 = tail call double @llvm.experimental.constrained.fadd.f64(double %9, double %19, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %21 = tail call double @log1p(double noundef %20) #4
  br label %39

22:                                               ; preds = %1
  %23 = icmp ult i32 %5, 1049
  br i1 %23, label %24, label %36

24:                                               ; preds = %22
  %25 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %26 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %27 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = fneg double %27
  %29 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %0, double %0, double %28, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %30 = tail call double @sqrt(double noundef %29) #4
  %31 = tail call double @llvm.experimental.constrained.fadd.f64(double %0, double %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %32 = tail call double @llvm.experimental.constrained.fdiv.f64(double %26, double %31, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = fneg double %32
  %34 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %25, double %0, double %33, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %35 = tail call double @log(double noundef %34) #4
  br label %39

36:                                               ; preds = %22
  %37 = tail call double @log(double noundef %0) #4
  %38 = tail call double @llvm.experimental.constrained.fadd.f64(double %37, double 0x3FE62E42FEFA39EF, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %39

39:                                               ; preds = %36, %24, %7
  %40 = phi double [ %21, %7 ], [ %35, %24 ], [ %38, %36 ]
  ret double %40
}

; Function Attrs: optsize
declare double @log1p(double noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: optsize
declare double @sqrt(double noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

; Function Attrs: optsize
declare double @log(double noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
