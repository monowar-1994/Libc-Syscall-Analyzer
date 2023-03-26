; ModuleID = 'src/math/exp2.c'
source_filename = "src/math/exp2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.exp_data = type { double, double, double, double, [4 x double], double, [5 x double], [256 x i64] }

@__exp_data = external hidden local_unnamed_addr constant %struct.exp_data, align 8

; Function Attrs: nounwind optsize strictfp
define double @exp2(double noundef %0) local_unnamed_addr #0 {
  %2 = bitcast double %0 to i64
  %3 = lshr i64 %2, 52
  %4 = trunc i64 %3 to i32
  %5 = and i32 %4, 2047
  %6 = add nsw i32 %5, -969
  %7 = icmp ult i32 %6, 63
  br i1 %7, label %38, label %8, !prof !3

8:                                                ; preds = %1
  %9 = icmp ult i32 %5, 969
  br i1 %9, label %10, label %12

10:                                               ; preds = %8
  %11 = tail call double @llvm.experimental.constrained.fadd.f64(double 1.000000e+00, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %73

12:                                               ; preds = %8
  %13 = icmp ult i32 %5, 1033
  br i1 %13, label %34, label %14

14:                                               ; preds = %12
  %15 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0xFFF0000000000000, metadata !"fpexcept.ignore") #5
  %16 = bitcast double %15 to i64
  %17 = icmp eq i64 %2, %16
  br i1 %17, label %73, label %18

18:                                               ; preds = %14
  %19 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x7FF0000000000000, metadata !"fpexcept.ignore") #5
  %20 = bitcast double %19 to i64
  %21 = lshr i64 %20, 52
  %22 = trunc i64 %21 to i32
  %23 = icmp ult i32 %5, %22
  br i1 %23, label %26, label %24

24:                                               ; preds = %18
  %25 = tail call double @llvm.experimental.constrained.fadd.f64(double 1.000000e+00, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %73

26:                                               ; preds = %18
  %27 = icmp sgt i64 %2, -1
  br i1 %27, label %28, label %30

28:                                               ; preds = %26
  %29 = tail call double @__math_oflow(i32 noundef 0) #6
  br label %73

30:                                               ; preds = %26
  %31 = icmp ugt i64 %2, -4570929321408987137
  br i1 %31, label %32, label %34

32:                                               ; preds = %30
  %33 = tail call double @__math_uflow(i32 noundef 0) #6
  br label %73

34:                                               ; preds = %30, %12
  %35 = shl i64 %2, 1
  %36 = icmp ugt i64 %35, -9143996093422370816
  %37 = select i1 %36, i32 0, i32 %5
  br label %38

38:                                               ; preds = %34, %1
  %39 = phi i32 [ %5, %1 ], [ %37, %34 ]
  %40 = load double, double* getelementptr inbounds (%struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 5), align 8, !tbaa !4
  %41 = tail call double @llvm.experimental.constrained.fadd.f64(double %0, double %40, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %42 = bitcast double %41 to i64
  %43 = tail call double @llvm.experimental.constrained.fsub.f64(double %41, double %40, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %44 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double %43, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %45 = shl i64 %42, 1
  %46 = and i64 %45, 254
  %47 = shl i64 %42, 45
  %48 = getelementptr inbounds %struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 7, i64 %46
  %49 = bitcast i64* %48 to double*
  %50 = load double, double* %49, align 8, !tbaa !9
  %51 = or i64 %46, 1
  %52 = getelementptr inbounds %struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 7, i64 %51
  %53 = load i64, i64* %52, align 8, !tbaa !9
  %54 = add i64 %53, %47
  %55 = tail call double @llvm.experimental.constrained.fmul.f64(double %44, double %44, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %56 = load double, double* getelementptr inbounds (%struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 6, i64 0), align 8, !tbaa !11
  %57 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %44, double %56, double %50, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %58 = load double, double* getelementptr inbounds (%struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 6, i64 1), align 8, !tbaa !11
  %59 = load double, double* getelementptr inbounds (%struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 6, i64 2), align 8, !tbaa !11
  %60 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %44, double %59, double %58, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %61 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %55, double %60, double %57, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %62 = tail call double @llvm.experimental.constrained.fmul.f64(double %55, double %55, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %63 = load double, double* getelementptr inbounds (%struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 6, i64 3), align 8, !tbaa !11
  %64 = load double, double* getelementptr inbounds (%struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 6, i64 4), align 8, !tbaa !11
  %65 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %44, double %64, double %63, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %66 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %62, double %65, double %61, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %67 = icmp eq i32 %39, 0
  br i1 %67, label %68, label %70, !prof !12

68:                                               ; preds = %38
  %69 = tail call fastcc double @specialcase(double noundef %66, i64 noundef %54, i64 noundef %42) #7
  br label %73

70:                                               ; preds = %38
  %71 = bitcast i64 %54 to double
  %72 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %71, double %66, double %71, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %73

73:                                               ; preds = %14, %70, %68, %32, %28, %24, %10
  %74 = phi double [ %11, %10 ], [ %25, %24 ], [ %33, %32 ], [ %69, %68 ], [ %72, %70 ], [ %29, %28 ], [ 0.000000e+00, %14 ]
  ret double %74
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #2

; Function Attrs: optsize
declare hidden double @__math_oflow(i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden double @__math_uflow(i32 noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #2

; Function Attrs: inlinehint nofree nounwind optsize strictfp
define internal fastcc double @specialcase(double noundef %0, i64 noundef %1, i64 noundef %2) unnamed_addr #4 {
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = and i64 %2, 2147483648
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %14

8:                                                ; preds = %3
  %9 = add i64 %1, -4503599627370496
  %10 = bitcast i64 %9 to double
  %11 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %12 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %10, double %0, double %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %13 = tail call double @llvm.experimental.constrained.fmul.f64(double %11, double %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %37

14:                                               ; preds = %3
  %15 = add i64 %1, 4602678819172646912
  %16 = bitcast i64 %15 to double
  %17 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %16, double %0, double %16, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %18 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %17, double 1.000000e+00, metadata !"olt", metadata !"fpexcept.ignore") #5
  br i1 %18, label %19, label %34

19:                                               ; preds = %14
  %20 = tail call double @llvm.experimental.constrained.fsub.f64(double %16, double %17, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %21 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %16, double %0, double %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %22 = tail call double @llvm.experimental.constrained.fadd.f64(double 1.000000e+00, double %17, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %23 = tail call double @llvm.experimental.constrained.fsub.f64(double 1.000000e+00, double %22, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %24 = tail call double @llvm.experimental.constrained.fadd.f64(double %23, double %17, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %25 = tail call double @llvm.experimental.constrained.fadd.f64(double %24, double %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %26 = tail call double @llvm.experimental.constrained.fadd.f64(double %22, double %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %27 = tail call double @llvm.experimental.constrained.fsub.f64(double %26, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %28 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %27, double 0.000000e+00, metadata !"oeq", metadata !"fpexcept.ignore") #5
  %29 = select i1 %28, double 0.000000e+00, double %27
  %30 = bitcast double* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %30)
  store volatile double 0x10000000000000, double* %5, align 8, !tbaa !11
  %31 = load volatile double, double* %5, align 8, !tbaa !11
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %30)
  %32 = tail call double @llvm.experimental.constrained.fmul.f64(double %31, double 0x10000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %33 = bitcast double* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %33)
  store volatile double %32, double* %4, align 8, !tbaa !11
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %33)
  br label %34

34:                                               ; preds = %19, %14
  %35 = phi double [ %29, %19 ], [ %17, %14 ]
  %36 = tail call double @llvm.experimental.constrained.fmul.f64(double 0x10000000000000, double %35, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %37

37:                                               ; preds = %34, %8
  %38 = phi double [ %13, %8 ], [ %36, %34 ]
  ret double %38
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f64(double, double, metadata, metadata) #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { inlinehint nofree nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #7 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!"branch_weights", i32 2000, i32 1}
!4 = !{!5, !6, i64 64}
!5 = !{!"exp_data", !6, i64 0, !6, i64 8, !6, i64 16, !6, i64 24, !7, i64 32, !6, i64 64, !7, i64 72, !7, i64 112}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!6, !6, i64 0}
!12 = !{!"branch_weights", i32 1, i32 2000}
