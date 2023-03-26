; ModuleID = 'src/math/scalb.c'
source_filename = "src/math/scalb.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define double @scalb(double noundef %0, double noundef %1) local_unnamed_addr #0 {
  %3 = bitcast double %0 to i64
  %4 = and i64 %3, 9223372036854775807
  %5 = icmp ugt i64 %4, 9218868437227405312
  br i1 %5, label %10, label %6

6:                                                ; preds = %2
  %7 = bitcast double %1 to i64
  %8 = and i64 %7, 9223372036854775807
  %9 = icmp ugt i64 %8, 9218868437227405312
  br i1 %9, label %10, label %12

10:                                               ; preds = %6, %2
  %11 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %41

12:                                               ; preds = %6
  %13 = and i64 %7, 9218868437227405312
  %14 = icmp eq i64 %13, 9218868437227405312
  br i1 %14, label %15, label %22

15:                                               ; preds = %12
  %16 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %1, double 0.000000e+00, metadata !"ogt", metadata !"fpexcept.ignore") #3
  br i1 %16, label %17, label %19

17:                                               ; preds = %15
  %18 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %41

19:                                               ; preds = %15
  %20 = fneg double %1
  %21 = tail call double @llvm.experimental.constrained.fdiv.f64(double %0, double %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %41

22:                                               ; preds = %12
  %23 = tail call double @rint(double noundef %1) #4
  %24 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %23, double %1, metadata !"une", metadata !"fpexcept.ignore") #3
  br i1 %24, label %25, label %29

25:                                               ; preds = %22
  %26 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %27 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = tail call double @llvm.experimental.constrained.fdiv.f64(double %26, double %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %41

29:                                               ; preds = %22
  %30 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %1, double 6.500000e+04, metadata !"ogt", metadata !"fpexcept.ignore") #3
  br i1 %30, label %31, label %33

31:                                               ; preds = %29
  %32 = tail call double @scalbn(double noundef %0, i32 noundef 65000) #4
  br label %41

33:                                               ; preds = %29
  %34 = fneg double %1
  %35 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %34, double 6.500000e+04, metadata !"ogt", metadata !"fpexcept.ignore") #3
  br i1 %35, label %36, label %38

36:                                               ; preds = %33
  %37 = tail call double @scalbn(double noundef %0, i32 noundef -65000) #4
  br label %41

38:                                               ; preds = %33
  %39 = tail call i32 @llvm.experimental.constrained.fptosi.i32.f64(double %1, metadata !"fpexcept.ignore") #3
  %40 = tail call double @scalbn(double noundef %0, i32 noundef %39) #4
  br label %41

41:                                               ; preds = %38, %36, %31, %25, %19, %17, %10
  %42 = phi double [ %11, %10 ], [ %28, %25 ], [ %32, %31 ], [ %37, %36 ], [ %40, %38 ], [ %18, %17 ], [ %21, %19 ]
  ret double %42
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #1

; Function Attrs: optsize
declare double @rint(double noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

; Function Attrs: optsize
declare double @scalbn(double noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i32 @llvm.experimental.constrained.fptosi.i32.f64(double, metadata) #1

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
