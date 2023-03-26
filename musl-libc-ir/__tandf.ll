; ModuleID = 'src/math/__tandf.c'
source_filename = "src/math/__tandf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define hidden float @__tandf(double noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %4 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %3, double 0x3F8362B9BF971BCD, double 0x3F685DADFCECF44E, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %5 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %3, double 0x3F991DF3908C33CE, double 0x3FAB54C91D865AFE, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %6 = tail call double @llvm.experimental.constrained.fmul.f64(double %3, double %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %7 = tail call double @llvm.experimental.constrained.fmul.f64(double %3, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %8 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %3, double 0x3FC112FD38999F72, double 0x3FD5554D3418C99F, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %9 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %7, double %8, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %10 = tail call double @llvm.experimental.constrained.fmul.f64(double %7, double %6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %11 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %6, double %4, double %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %12 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %10, double %11, double %9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %13 = icmp eq i32 %1, 0
  br i1 %13, label %16, label %14

14:                                               ; preds = %2
  %15 = tail call double @llvm.experimental.constrained.fdiv.f64(double -1.000000e+00, double %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %16

16:                                               ; preds = %2, %14
  %17 = phi double [ %15, %14 ], [ %12, %2 ]
  %18 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %17, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  ret float %18
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #1

attributes #0 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
