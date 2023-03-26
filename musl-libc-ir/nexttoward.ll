; ModuleID = 'src/math/nexttoward.c'
source_filename = "src/math/nexttoward.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define double @nexttoward(double noundef %0, x86_fp80 noundef %1) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = bitcast double %0 to i64
  %6 = and i64 %5, 9223372036854775807
  %7 = icmp ugt i64 %6, 9218868437227405312
  br i1 %7, label %11, label %8

8:                                                ; preds = %2
  %9 = tail call i32 @__fpclassifyl(x86_fp80 noundef %1) #4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %15

11:                                               ; preds = %8, %2
  %12 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %0, metadata !"fpexcept.ignore") #5
  %13 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %12, x86_fp80 %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %14 = tail call double @llvm.experimental.constrained.fptrunc.f64.f80(x86_fp80 %13, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %58

15:                                               ; preds = %8
  %16 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %0, metadata !"fpexcept.ignore") #5
  %17 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %16, x86_fp80 %1, metadata !"oeq", metadata !"fpexcept.ignore") #5
  br i1 %17, label %18, label %20

18:                                               ; preds = %15
  %19 = tail call double @llvm.experimental.constrained.fptrunc.f64.f80(x86_fp80 %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %58

20:                                               ; preds = %15
  %21 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %22 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %0, double %21, metadata !"oeq", metadata !"fpexcept.ignore") #5
  br i1 %22, label %23, label %27

23:                                               ; preds = %20
  %24 = tail call i32 @__signbitl(x86_fp80 noundef %1) #4
  %25 = icmp eq i32 %24, 0
  %26 = select i1 %25, double 4.940660e-324, double -4.940660e-324
  br label %45

27:                                               ; preds = %20
  %28 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %0, metadata !"fpexcept.ignore") #5
  %29 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %28, x86_fp80 %1, metadata !"olt", metadata !"fpexcept.ignore") #5
  %30 = icmp sgt i64 %5, -1
  br i1 %29, label %31, label %38

31:                                               ; preds = %27
  br i1 %30, label %35, label %32

32:                                               ; preds = %31
  %33 = add i64 %5, -1
  %34 = bitcast i64 %33 to double
  br label %45

35:                                               ; preds = %31
  %36 = add nuw i64 %5, 1
  %37 = bitcast i64 %36 to double
  br label %45

38:                                               ; preds = %27
  br i1 %30, label %42, label %39

39:                                               ; preds = %38
  %40 = add nsw i64 %5, 1
  %41 = bitcast i64 %40 to double
  br label %45

42:                                               ; preds = %38
  %43 = add nsw i64 %5, -1
  %44 = bitcast i64 %43 to double
  br label %45

45:                                               ; preds = %23, %35, %32, %42, %39
  %46 = phi double [ %34, %32 ], [ %37, %35 ], [ %41, %39 ], [ %44, %42 ], [ %26, %23 ]
  %47 = bitcast double %46 to i64
  %48 = lshr i64 %47, 52
  %49 = trunc i64 %48 to i32
  %50 = and i32 %49, 2047
  switch i32 %50, label %58 [
    i32 2047, label %51
    i32 0, label %54
  ]

51:                                               ; preds = %45
  %52 = tail call double @llvm.experimental.constrained.fadd.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %53 = bitcast double* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %53)
  store volatile double %52, double* %4, align 8, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %53)
  br label %58

54:                                               ; preds = %45
  %55 = tail call double @llvm.experimental.constrained.fmul.f64(double %46, double %46, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %56 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %0, double %0, double %55, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %57 = bitcast double* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %57)
  store volatile double %56, double* %3, align 8, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %57)
  br label %58

58:                                               ; preds = %51, %54, %45, %18, %11
  %59 = phi double [ %14, %11 ], [ %19, %18 ], [ %46, %45 ], [ %46, %54 ], [ %46, %51 ]
  ret double %59
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @__fpclassifyl(x86_fp80 noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fptrunc.f64.f80(x86_fp80, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80, x86_fp80, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f64(double, double, metadata, metadata) #3

; Function Attrs: optsize
declare i32 @__signbitl(x86_fp80 noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80, x86_fp80, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
