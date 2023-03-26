; ModuleID = 'src/complex/cexp.c'
source_filename = "src/complex/cexp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define { double, double } @cexp(double noundef %0, double noundef %1) local_unnamed_addr #0 {
  %3 = bitcast double %1 to i64
  %4 = lshr i64 %3, 32
  %5 = trunc i64 %4 to i32
  %6 = trunc i64 %3 to i32
  %7 = and i32 %5, 2147483647
  %8 = or i32 %7, %6
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %2
  %11 = tail call double @exp(double noundef %0) #3
  br label %49

12:                                               ; preds = %2
  %13 = bitcast double %0 to i64
  %14 = lshr i64 %13, 32
  %15 = trunc i64 %14 to i32
  %16 = trunc i64 %13 to i32
  %17 = and i32 %15, 2147483647
  %18 = or i32 %17, %16
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %23

20:                                               ; preds = %12
  %21 = tail call double @cos(double noundef %1) #3
  %22 = tail call double @sin(double noundef %1) #3
  br label %49

23:                                               ; preds = %12
  %24 = icmp ugt i32 %7, 2146435071
  br i1 %24, label %25, label %36

25:                                               ; preds = %23
  %26 = icmp eq i32 %16, 0
  %27 = icmp eq i32 %17, 2146435072
  %28 = and i1 %26, %27
  br i1 %28, label %32, label %29

29:                                               ; preds = %25
  %30 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %31 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %49

32:                                               ; preds = %25
  %33 = icmp sgt i64 %13, -1
  br i1 %33, label %34, label %49

34:                                               ; preds = %32
  %35 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %49

36:                                               ; preds = %23
  %37 = add i32 %15, -1082535490
  %38 = icmp ult i32 %37, 1084067
  br i1 %38, label %39, label %43

39:                                               ; preds = %36
  %40 = tail call { double, double } @__ldexp_cexp(double noundef %0, double noundef %1, i32 noundef 0) #3
  %41 = extractvalue { double, double } %40, 0
  %42 = extractvalue { double, double } %40, 1
  br label %49

43:                                               ; preds = %36
  %44 = tail call double @exp(double noundef %0) #3
  %45 = tail call double @cos(double noundef %1) #3
  %46 = tail call double @llvm.experimental.constrained.fmul.f64(double %44, double %45, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %47 = tail call double @sin(double noundef %1) #3
  %48 = tail call double @llvm.experimental.constrained.fmul.f64(double %44, double %47, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %49

49:                                               ; preds = %32, %43, %39, %34, %29, %20, %10
  %50 = phi double [ %11, %10 ], [ %21, %20 ], [ %30, %29 ], [ %0, %34 ], [ %41, %39 ], [ %46, %43 ], [ 0.000000e+00, %32 ]
  %51 = phi double [ %1, %10 ], [ %22, %20 ], [ %31, %29 ], [ %35, %34 ], [ %42, %39 ], [ %48, %43 ], [ 0.000000e+00, %32 ]
  %52 = insertvalue { double, double } poison, double %50, 0
  %53 = insertvalue { double, double } %52, double %51, 1
  ret { double, double } %53
}

; Function Attrs: optsize
declare double @exp(double noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare double @cos(double noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare double @sin(double noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: optsize
declare hidden { double, double } @__ldexp_cexp(double noundef, double noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
