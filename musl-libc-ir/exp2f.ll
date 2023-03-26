; ModuleID = 'src/math/exp2f.c'
source_filename = "src/math/exp2f.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.exp2f_data = type { [32 x i64], double, [3 x double], double, double, [3 x double] }

@__exp2f_data = external hidden local_unnamed_addr constant %struct.exp2f_data, align 8

; Function Attrs: nounwind optsize strictfp
define float @exp2f(float noundef %0) local_unnamed_addr #0 {
  %2 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #3
  %3 = bitcast float %0 to i32
  %4 = lshr i32 %3, 20
  %5 = and i32 %4, 2047
  %6 = icmp ult i32 %5, 1072
  br i1 %6, label %21, label %7, !prof !3

7:                                                ; preds = %1
  %8 = icmp eq i32 %3, -8388608
  br i1 %8, label %43, label %9

9:                                                ; preds = %7
  %10 = icmp ult i32 %5, 2040
  br i1 %10, label %13, label %11

11:                                               ; preds = %9
  %12 = tail call float @llvm.experimental.constrained.fadd.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %43

13:                                               ; preds = %9
  %14 = tail call i1 @llvm.experimental.constrained.fcmps.f32(float %0, float 0.000000e+00, metadata !"ogt", metadata !"fpexcept.ignore") #3
  br i1 %14, label %15, label %17

15:                                               ; preds = %13
  %16 = tail call float @__math_oflowf(i32 noundef 0) #4
  br label %43

17:                                               ; preds = %13
  %18 = tail call i1 @llvm.experimental.constrained.fcmps.f32(float %0, float -1.500000e+02, metadata !"ole", metadata !"fpexcept.ignore") #3
  br i1 %18, label %19, label %21

19:                                               ; preds = %17
  %20 = tail call float @__math_uflowf(i32 noundef 0) #4
  br label %43

21:                                               ; preds = %17, %1
  %22 = load double, double* getelementptr inbounds (%struct.exp2f_data, %struct.exp2f_data* @__exp2f_data, i64 0, i32 1), align 8, !tbaa !4
  %23 = tail call double @llvm.experimental.constrained.fadd.f64(double %2, double %22, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %24 = bitcast double %23 to i64
  %25 = tail call double @llvm.experimental.constrained.fsub.f64(double %23, double %22, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %26 = tail call double @llvm.experimental.constrained.fsub.f64(double %2, double %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %27 = and i64 %24, 31
  %28 = getelementptr inbounds %struct.exp2f_data, %struct.exp2f_data* @__exp2f_data, i64 0, i32 0, i64 %27
  %29 = load i64, i64* %28, align 8, !tbaa !9
  %30 = shl i64 %24, 47
  %31 = add i64 %29, %30
  %32 = bitcast i64 %31 to double
  %33 = load double, double* getelementptr inbounds (%struct.exp2f_data, %struct.exp2f_data* @__exp2f_data, i64 0, i32 2, i64 0), align 8, !tbaa !11
  %34 = load double, double* getelementptr inbounds (%struct.exp2f_data, %struct.exp2f_data* @__exp2f_data, i64 0, i32 2, i64 1), align 8, !tbaa !11
  %35 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %33, double %26, double %34, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %36 = tail call double @llvm.experimental.constrained.fmul.f64(double %26, double %26, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %37 = load double, double* getelementptr inbounds (%struct.exp2f_data, %struct.exp2f_data* @__exp2f_data, i64 0, i32 2, i64 2), align 8, !tbaa !11
  %38 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %39 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %37, double %26, double %38, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %40 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %35, double %36, double %39, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %41 = tail call double @llvm.experimental.constrained.fmul.f64(double %40, double %32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %42 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %43

43:                                               ; preds = %7, %21, %19, %15, %11
  %44 = phi float [ %12, %11 ], [ %16, %15 ], [ %20, %19 ], [ %42, %21 ], [ 0.000000e+00, %7 ]
  ret float %44
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f32(float, float, metadata, metadata) #1

; Function Attrs: optsize
declare hidden float @__math_oflowf(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden float @__math_uflowf(i32 noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #1

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
!3 = !{!"branch_weights", i32 2000, i32 1}
!4 = !{!5, !8, i64 256}
!5 = !{!"exp2f_data", !6, i64 0, !8, i64 256, !6, i64 264, !8, i64 288, !8, i64 296, !6, i64 304}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"double", !6, i64 0}
!9 = !{!10, !10, i64 0}
!10 = !{!"long", !6, i64 0}
!11 = !{!8, !8, i64 0}
