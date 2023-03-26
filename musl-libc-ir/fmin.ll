; ModuleID = 'src/math/fmin.c'
source_filename = "src/math/fmin.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define double @fmin(double noundef %0, double noundef %1) local_unnamed_addr #0 {
  %3 = bitcast double %0 to i64
  %4 = and i64 %3, 9223372036854775807
  %5 = icmp ugt i64 %4, 9218868437227405312
  br i1 %5, label %22, label %6

6:                                                ; preds = %2
  %7 = bitcast double %1 to i64
  %8 = and i64 %7, 9223372036854775807
  %9 = icmp ugt i64 %8, 9218868437227405312
  br i1 %9, label %22, label %10

10:                                               ; preds = %6
  %11 = lshr i64 %3, 63
  %12 = trunc i64 %11 to i32
  %13 = lshr i64 %7, 63
  %14 = trunc i64 %13 to i32
  %15 = icmp eq i32 %12, %14
  br i1 %15, label %19, label %16

16:                                               ; preds = %10
  %17 = icmp slt i64 %3, 0
  %18 = select i1 %17, double %0, double %1
  br label %22

19:                                               ; preds = %10
  %20 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %0, double %1, metadata !"olt", metadata !"fpexcept.ignore") #2
  %21 = select i1 %20, double %0, double %1
  br label %22

22:                                               ; preds = %6, %2, %19, %16
  %23 = phi double [ %18, %16 ], [ %21, %19 ], [ %1, %2 ], [ %0, %6 ]
  ret double %23
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f64(double, double, metadata, metadata) #1

attributes #0 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
