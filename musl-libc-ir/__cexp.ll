; ModuleID = 'src/complex/__cexp.c'
source_filename = "src/complex/__cexp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define hidden { double, double } @__ldexp_cexp(double noundef %0, double noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double 0x40937BE319BA0DA4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %5 = tail call double @exp(double noundef %4) #4
  %6 = bitcast double %5 to i64
  %7 = lshr i64 %6, 52
  %8 = trunc i64 %7 to i32
  %9 = and i64 %6, 4503599627370495
  %10 = or i64 %9, 9214364837600034816
  %11 = bitcast i64 %10 to double
  %12 = add i32 %2, -247
  %13 = add i32 %12, %8
  %14 = sdiv i32 %13, 2
  %15 = shl i32 %14, 20
  %16 = add i32 %15, 1072693248
  %17 = zext i32 %16 to i64
  %18 = shl nuw i64 %17, 32
  %19 = bitcast i64 %18 to double
  %20 = sub nsw i32 %13, %14
  %21 = shl i32 %20, 20
  %22 = add i32 %21, 1072693248
  %23 = zext i32 %22 to i64
  %24 = shl nuw i64 %23, 32
  %25 = bitcast i64 %24 to double
  %26 = tail call double @cos(double noundef %1) #4
  %27 = tail call double @llvm.experimental.constrained.fmul.f64(double %26, double %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %28 = tail call double @llvm.experimental.constrained.fmul.f64(double %27, double %19, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %29 = tail call double @llvm.experimental.constrained.fmul.f64(double %28, double %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %30 = tail call double @sin(double noundef %1) #4
  %31 = tail call double @llvm.experimental.constrained.fmul.f64(double %30, double %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %32 = tail call double @llvm.experimental.constrained.fmul.f64(double %31, double %19, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %33 = tail call double @llvm.experimental.constrained.fmul.f64(double %32, double %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %34 = insertvalue { double, double } poison, double %29, 0
  %35 = insertvalue { double, double } %34, double %33, 1
  ret { double, double } %35
}

; Function Attrs: optsize
declare double @cos(double noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

; Function Attrs: optsize
declare double @sin(double noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare double @exp(double noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
