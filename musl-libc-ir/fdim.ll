; ModuleID = 'src/math/fdim.c'
source_filename = "src/math/fdim.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define double @fdim(double noundef %0, double noundef %1) local_unnamed_addr #0 {
  %3 = bitcast double %0 to i64
  %4 = and i64 %3, 9223372036854775807
  %5 = icmp ugt i64 %4, 9218868437227405312
  br i1 %5, label %16, label %6

6:                                                ; preds = %2
  %7 = bitcast double %1 to i64
  %8 = and i64 %7, 9223372036854775807
  %9 = icmp ugt i64 %8, 9218868437227405312
  br i1 %9, label %16, label %10

10:                                               ; preds = %6
  %11 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %0, double %1, metadata !"ogt", metadata !"fpexcept.ignore") #2
  br i1 %11, label %12, label %14

12:                                               ; preds = %10
  %13 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %16

14:                                               ; preds = %10
  %15 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %16

16:                                               ; preds = %12, %14, %6, %2
  %17 = phi double [ %0, %2 ], [ %1, %6 ], [ %13, %12 ], [ %15, %14 ]
  ret double %17
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #1

attributes #0 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
