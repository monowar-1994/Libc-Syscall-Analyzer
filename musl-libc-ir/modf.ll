; ModuleID = 'src/math/modf.c'
source_filename = "src/math/modf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define double @modf(double noundef %0, double* nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = bitcast double %0 to i64
  %4 = lshr i64 %3, 52
  %5 = trunc i64 %4 to i32
  %6 = and i32 %5, 2047
  %7 = add nsw i32 %6, -1023
  %8 = icmp ugt i32 %6, 1074
  br i1 %8, label %9, label %17

9:                                                ; preds = %2
  store double %0, double* %1, align 8, !tbaa !3
  %10 = icmp ne i32 %7, 1024
  %11 = and i64 %3, 4503599627370495
  %12 = icmp eq i64 %11, 0
  %13 = or i1 %12, %10
  br i1 %13, label %14, label %36

14:                                               ; preds = %9
  %15 = and i64 %3, -9223372036854775808
  %16 = bitcast i64 %15 to double
  br label %36

17:                                               ; preds = %2
  %18 = icmp ult i32 %6, 1023
  br i1 %18, label %19, label %22

19:                                               ; preds = %17
  %20 = and i64 %3, -9223372036854775808
  %21 = bitcast double* %1 to i64*
  store i64 %20, i64* %21, align 8, !tbaa !3
  br label %36

22:                                               ; preds = %17
  %23 = zext i32 %7 to i64
  %24 = lshr i64 4503599627370495, %23
  %25 = and i64 %24, %3
  %26 = icmp eq i64 %25, 0
  br i1 %26, label %27, label %30

27:                                               ; preds = %22
  store double %0, double* %1, align 8, !tbaa !3
  %28 = and i64 %3, -9223372036854775808
  %29 = bitcast i64 %28 to double
  br label %36

30:                                               ; preds = %22
  %31 = ashr i64 -4503599627370496, %23
  %32 = and i64 %31, %3
  %33 = bitcast i64 %32 to double
  %34 = bitcast double* %1 to i64*
  store i64 %32, i64* %34, align 8, !tbaa !3
  %35 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double %33, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %36

36:                                               ; preds = %9, %30, %27, %19, %14
  %37 = phi double [ %16, %14 ], [ %0, %19 ], [ %29, %27 ], [ %35, %30 ], [ %0, %9 ]
  ret double %37
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

attributes #0 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
