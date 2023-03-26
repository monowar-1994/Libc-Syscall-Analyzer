; ModuleID = 'src/math/sinh.c'
source_filename = "src/math/sinh.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define double @sinh(double noundef %0) local_unnamed_addr #0 {
  %2 = bitcast double %0 to i64
  %3 = tail call double @llvm.copysign.f64(double 5.000000e-01, double %0)
  %4 = and i64 %2, 9223372036854775807
  %5 = bitcast i64 %4 to double
  %6 = lshr i64 %4, 32
  %7 = trunc i64 %6 to i32
  %8 = icmp ult i32 %7, 1082535490
  br i1 %8, label %9, label %29

9:                                                ; preds = %1
  %10 = tail call double @expm1(double noundef %5) #4
  %11 = icmp ult i32 %7, 1072693248
  br i1 %11, label %12, label %23

12:                                               ; preds = %9
  %13 = icmp ult i32 %7, 1045430272
  br i1 %13, label %33, label %14

14:                                               ; preds = %12
  %15 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %16 = tail call double @llvm.experimental.constrained.fmul.f64(double %10, double %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %17 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %18 = tail call double @llvm.experimental.constrained.fadd.f64(double %10, double %17, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %19 = tail call double @llvm.experimental.constrained.fdiv.f64(double %16, double %18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %20 = fneg double %19
  %21 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %15, double %10, double %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %22 = tail call double @llvm.experimental.constrained.fmul.f64(double %3, double %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %33

23:                                               ; preds = %9
  %24 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %25 = tail call double @llvm.experimental.constrained.fadd.f64(double %10, double %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %26 = tail call double @llvm.experimental.constrained.fdiv.f64(double %10, double %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %27 = tail call double @llvm.experimental.constrained.fadd.f64(double %10, double %26, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %28 = tail call double @llvm.experimental.constrained.fmul.f64(double %3, double %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %33

29:                                               ; preds = %1
  %30 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %31 = tail call double @llvm.experimental.constrained.fmul.f64(double %30, double %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %32 = tail call double @__expo2(double noundef %5, double noundef %31) #4
  br label %33

33:                                               ; preds = %12, %29, %23, %14
  %34 = phi double [ %22, %14 ], [ %28, %23 ], [ %32, %29 ], [ %0, %12 ]
  ret double %34
}

; Function Attrs: optsize
declare double @expm1(double noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #2

; Function Attrs: optsize
declare hidden double @__expo2(double noundef, double noundef) local_unnamed_addr #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #3

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
