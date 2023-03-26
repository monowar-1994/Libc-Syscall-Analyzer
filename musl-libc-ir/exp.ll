; ModuleID = 'src/math/exp.c'
source_filename = "src/math/exp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.exp_data = type { double, double, double, double, [4 x double], double, [5 x double], [256 x i64] }

@__exp_data = external hidden local_unnamed_addr constant %struct.exp_data, align 8

; Function Attrs: nounwind optsize strictfp
define double @exp(double noundef %0) local_unnamed_addr #0 {
  %2 = bitcast double %0 to i64
  %3 = lshr i64 %2, 52
  %4 = trunc i64 %3 to i32
  %5 = and i32 %4, 2047
  %6 = add nsw i32 %5, -969
  %7 = icmp ult i32 %6, 63
  br i1 %7, label %32, label %8, !prof !3

8:                                                ; preds = %1
  %9 = icmp ult i32 %5, 969
  br i1 %9, label %10, label %12

10:                                               ; preds = %8
  %11 = tail call double @llvm.experimental.constrained.fadd.f64(double 1.000000e+00, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %71

12:                                               ; preds = %8
  %13 = icmp ult i32 %5, 1033
  br i1 %13, label %32, label %14

14:                                               ; preds = %12
  %15 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0xFFF0000000000000, metadata !"fpexcept.ignore") #5
  %16 = bitcast double %15 to i64
  %17 = icmp eq i64 %2, %16
  br i1 %17, label %71, label %18

18:                                               ; preds = %14
  %19 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x7FF0000000000000, metadata !"fpexcept.ignore") #5
  %20 = bitcast double %19 to i64
  %21 = lshr i64 %20, 52
  %22 = trunc i64 %21 to i32
  %23 = icmp ult i32 %5, %22
  br i1 %23, label %26, label %24

24:                                               ; preds = %18
  %25 = tail call double @llvm.experimental.constrained.fadd.f64(double 1.000000e+00, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %71

26:                                               ; preds = %18
  %27 = icmp sgt i64 %2, -1
  br i1 %27, label %30, label %28

28:                                               ; preds = %26
  %29 = tail call double @__math_uflow(i32 noundef 0) #6
  br label %71

30:                                               ; preds = %26
  %31 = tail call double @__math_oflow(i32 noundef 0) #6
  br label %71

32:                                               ; preds = %12, %1
  %33 = phi i32 [ %5, %1 ], [ 0, %12 ]
  %34 = load double, double* getelementptr inbounds (%struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 0), align 8, !tbaa !4
  %35 = tail call double @llvm.experimental.constrained.fmul.f64(double %34, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %36 = load double, double* getelementptr inbounds (%struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 1), align 8, !tbaa !9
  %37 = tail call double @llvm.experimental.constrained.fadd.f64(double %35, double %36, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %38 = bitcast double %37 to i64
  %39 = tail call double @llvm.experimental.constrained.fsub.f64(double %37, double %36, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %40 = load double, double* getelementptr inbounds (%struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 2), align 8, !tbaa !10
  %41 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %39, double %40, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %42 = load double, double* getelementptr inbounds (%struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 3), align 8, !tbaa !11
  %43 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %39, double %42, double %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %44 = shl i64 %38, 1
  %45 = and i64 %44, 254
  %46 = shl i64 %38, 45
  %47 = getelementptr inbounds %struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 7, i64 %45
  %48 = bitcast i64* %47 to double*
  %49 = load double, double* %48, align 8, !tbaa !12
  %50 = or i64 %45, 1
  %51 = getelementptr inbounds %struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 7, i64 %50
  %52 = load i64, i64* %51, align 8, !tbaa !12
  %53 = add i64 %52, %46
  %54 = tail call double @llvm.experimental.constrained.fmul.f64(double %43, double %43, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %55 = tail call double @llvm.experimental.constrained.fadd.f64(double %49, double %43, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %56 = load double, double* getelementptr inbounds (%struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 4, i64 0), align 8, !tbaa !14
  %57 = load double, double* getelementptr inbounds (%struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 4, i64 1), align 8, !tbaa !14
  %58 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %43, double %57, double %56, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %59 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %54, double %58, double %55, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %60 = tail call double @llvm.experimental.constrained.fmul.f64(double %54, double %54, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %61 = load double, double* getelementptr inbounds (%struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 4, i64 2), align 8, !tbaa !14
  %62 = load double, double* getelementptr inbounds (%struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 4, i64 3), align 8, !tbaa !14
  %63 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %43, double %62, double %61, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %64 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %60, double %63, double %59, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %65 = icmp eq i32 %33, 0
  br i1 %65, label %66, label %68, !prof !15

66:                                               ; preds = %32
  %67 = tail call fastcc double @specialcase(double noundef %64, i64 noundef %53, i64 noundef %38) #7
  br label %71

68:                                               ; preds = %32
  %69 = bitcast i64 %53 to double
  %70 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %69, double %64, double %69, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %71

71:                                               ; preds = %14, %68, %66, %30, %28, %24, %10
  %72 = phi double [ %11, %10 ], [ %25, %24 ], [ %29, %28 ], [ %31, %30 ], [ %67, %66 ], [ %70, %68 ], [ 0.000000e+00, %14 ]
  ret double %72
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #2

; Function Attrs: optsize
declare hidden double @__math_uflow(i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden double @__math_oflow(i32 noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #2

; Function Attrs: inlinehint nofree nounwind optsize strictfp
define internal fastcc double @specialcase(double noundef %0, i64 noundef %1, i64 noundef %2) unnamed_addr #4 {
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = and i64 %2, 2147483648
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %13

8:                                                ; preds = %3
  %9 = add i64 %1, -4544132024016830464
  %10 = bitcast i64 %9 to double
  %11 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %10, double %0, double %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %12 = tail call double @llvm.experimental.constrained.fmul.f64(double 0x7F00000000000000, double %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %36

13:                                               ; preds = %3
  %14 = add i64 %1, 4602678819172646912
  %15 = bitcast i64 %14 to double
  %16 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %15, double %0, double %15, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %17 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %16, double 1.000000e+00, metadata !"olt", metadata !"fpexcept.ignore") #5
  br i1 %17, label %18, label %33

18:                                               ; preds = %13
  %19 = tail call double @llvm.experimental.constrained.fsub.f64(double %15, double %16, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %20 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %15, double %0, double %19, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %21 = tail call double @llvm.experimental.constrained.fadd.f64(double 1.000000e+00, double %16, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %22 = tail call double @llvm.experimental.constrained.fsub.f64(double 1.000000e+00, double %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %23 = tail call double @llvm.experimental.constrained.fadd.f64(double %22, double %16, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %24 = tail call double @llvm.experimental.constrained.fadd.f64(double %23, double %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %25 = tail call double @llvm.experimental.constrained.fadd.f64(double %21, double %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %26 = tail call double @llvm.experimental.constrained.fsub.f64(double %25, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %27 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %26, double 0.000000e+00, metadata !"oeq", metadata !"fpexcept.ignore") #5
  %28 = select i1 %27, double 0.000000e+00, double %26
  %29 = bitcast double* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %29)
  store volatile double 0x10000000000000, double* %5, align 8, !tbaa !14
  %30 = load volatile double, double* %5, align 8, !tbaa !14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %29)
  %31 = tail call double @llvm.experimental.constrained.fmul.f64(double %30, double 0x10000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %32 = bitcast double* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %32)
  store volatile double %31, double* %4, align 8, !tbaa !14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %32)
  br label %33

33:                                               ; preds = %18, %13
  %34 = phi double [ %28, %18 ], [ %16, %13 ]
  %35 = tail call double @llvm.experimental.constrained.fmul.f64(double 0x10000000000000, double %34, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %36

36:                                               ; preds = %33, %8
  %37 = phi double [ %12, %8 ], [ %35, %33 ]
  ret double %37
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

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
!4 = !{!5, !6, i64 0}
!5 = !{!"exp_data", !6, i64 0, !6, i64 8, !6, i64 16, !6, i64 24, !7, i64 32, !6, i64 64, !7, i64 72, !7, i64 112}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!5, !6, i64 8}
!10 = !{!5, !6, i64 16}
!11 = !{!5, !6, i64 24}
!12 = !{!13, !13, i64 0}
!13 = !{!"long", !7, i64 0}
!14 = !{!6, !6, i64 0}
!15 = !{!"branch_weights", i32 1, i32 2000}
