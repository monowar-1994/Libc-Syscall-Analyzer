; ModuleID = 'src/math/nextafter.c'
source_filename = "src/math/nextafter.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nounwind optsize strictfp
define double @nextafter(double noundef %0, double noundef %1) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = bitcast double %0 to i64
  %6 = and i64 %5, 9223372036854775807
  %7 = icmp ugt i64 %6, 9218868437227405312
  br i1 %7, label %12, label %8

8:                                                ; preds = %2
  %9 = bitcast double %1 to i64
  %10 = and i64 %9, 9223372036854775807
  %11 = icmp ugt i64 %10, 9218868437227405312
  br i1 %11, label %12, label %14

12:                                               ; preds = %8, %2
  %13 = tail call double @llvm.experimental.constrained.fadd.f64(double %0, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %45

14:                                               ; preds = %8
  %15 = icmp eq i64 %5, %9
  br i1 %15, label %45, label %16

16:                                               ; preds = %14
  %17 = icmp eq i64 %6, 0
  br i1 %17, label %18, label %23

18:                                               ; preds = %16
  %19 = icmp eq i64 %10, 0
  br i1 %19, label %45, label %20

20:                                               ; preds = %18
  %21 = and i64 %9, -9223372036854775808
  %22 = or i64 %21, 1
  br label %32

23:                                               ; preds = %16
  %24 = icmp ule i64 %6, %10
  %25 = xor i64 %9, %5
  %26 = icmp sgt i64 %25, -1
  %27 = and i1 %24, %26
  br i1 %27, label %30, label %28

28:                                               ; preds = %23
  %29 = add i64 %5, -1
  br label %32

30:                                               ; preds = %23
  %31 = add i64 %5, 1
  br label %32

32:                                               ; preds = %28, %30, %20
  %33 = phi i64 [ %22, %20 ], [ %29, %28 ], [ %31, %30 ]
  %34 = bitcast i64 %33 to double
  %35 = lshr i64 %33, 52
  %36 = trunc i64 %35 to i32
  %37 = and i32 %36, 2047
  switch i32 %37, label %45 [
    i32 2047, label %38
    i32 0, label %41
  ]

38:                                               ; preds = %32
  %39 = tail call double @llvm.experimental.constrained.fadd.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %40 = bitcast double* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %40)
  store volatile double %39, double* %4, align 8, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %40)
  br label %45

41:                                               ; preds = %32
  %42 = tail call double @llvm.experimental.constrained.fmul.f64(double %34, double %34, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %43 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %0, double %0, double %42, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %44 = bitcast double* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %44)
  store volatile double %43, double* %3, align 8, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %44)
  br label %45

45:                                               ; preds = %38, %41, %32, %18, %14, %12
  %46 = phi double [ %13, %12 ], [ %1, %14 ], [ %1, %18 ], [ %34, %32 ], [ %34, %41 ], [ %34, %38 ]
  ret double %46
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nofree nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
