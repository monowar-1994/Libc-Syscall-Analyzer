; ModuleID = 'src/math/logf.c'
source_filename = "src/math/logf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.logf_data = type { [16 x %struct.anon], double, [3 x double] }
%struct.anon = type { double, double }

@__logf_data = external hidden local_unnamed_addr constant %struct.logf_data, align 8

; Function Attrs: nounwind optsize strictfp
define float @logf(float noundef %0) local_unnamed_addr #0 {
  %2 = bitcast float %0 to i32
  %3 = icmp eq i32 %2, 1065353216
  br i1 %3, label %4, label %6, !prof !3

4:                                                ; preds = %1
  %5 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %56

6:                                                ; preds = %1
  %7 = add i32 %2, -2139095040
  %8 = icmp ult i32 %7, -2130706432
  br i1 %8, label %9, label %26, !prof !3

9:                                                ; preds = %6
  %10 = shl i32 %2, 1
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

12:                                               ; preds = %9
  %13 = tail call float @__math_divzerof(i32 noundef 1) #4
  br label %56

14:                                               ; preds = %9
  %15 = icmp eq i32 %2, 2139095040
  br i1 %15, label %56, label %16

16:                                               ; preds = %14
  %17 = icmp slt i32 %2, 0
  %18 = icmp ugt i32 %10, -16777217
  %19 = or i1 %17, %18
  br i1 %19, label %20, label %22

20:                                               ; preds = %16
  %21 = tail call float @__math_invalidf(float noundef %0) #4
  br label %56

22:                                               ; preds = %16
  %23 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float 0x4160000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %24 = bitcast float %23 to i32
  %25 = add i32 %24, -192937984
  br label %26

26:                                               ; preds = %22, %6
  %27 = phi i32 [ %25, %22 ], [ %2, %6 ]
  %28 = add i32 %27, -1060306944
  %29 = lshr i32 %28, 19
  %30 = and i32 %29, 15
  %31 = ashr i32 %28, 23
  %32 = and i32 %28, -8388608
  %33 = sub i32 %27, %32
  %34 = zext i32 %30 to i64
  %35 = getelementptr inbounds %struct.logf_data, %struct.logf_data* @__logf_data, i64 0, i32 0, i64 %34, i32 0
  %36 = load double, double* %35, align 8, !tbaa !4
  %37 = getelementptr inbounds %struct.logf_data, %struct.logf_data* @__logf_data, i64 0, i32 0, i64 %34, i32 1
  %38 = load double, double* %37, align 8, !tbaa !9
  %39 = bitcast i32 %33 to float
  %40 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %39, metadata !"fpexcept.ignore") #3
  %41 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %42 = fneg double %41
  %43 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %40, double %36, double %42, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %44 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %31, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %45 = load double, double* getelementptr inbounds (%struct.logf_data, %struct.logf_data* @__logf_data, i64 0, i32 1), align 8, !tbaa !10
  %46 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %44, double %45, double %38, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %47 = tail call double @llvm.experimental.constrained.fmul.f64(double %43, double %43, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %48 = load double, double* getelementptr inbounds (%struct.logf_data, %struct.logf_data* @__logf_data, i64 0, i32 2, i64 1), align 8, !tbaa !12
  %49 = load double, double* getelementptr inbounds (%struct.logf_data, %struct.logf_data* @__logf_data, i64 0, i32 2, i64 2), align 8, !tbaa !12
  %50 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %48, double %43, double %49, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %51 = load double, double* getelementptr inbounds (%struct.logf_data, %struct.logf_data* @__logf_data, i64 0, i32 2, i64 0), align 8, !tbaa !12
  %52 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %51, double %47, double %50, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %53 = tail call double @llvm.experimental.constrained.fadd.f64(double %46, double %43, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %54 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %52, double %47, double %53, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %55 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %54, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %56

56:                                               ; preds = %14, %26, %20, %12, %4
  %57 = phi float [ %5, %4 ], [ %13, %12 ], [ %21, %20 ], [ %55, %26 ], [ %0, %14 ]
  ret float %57
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #1

; Function Attrs: optsize
declare hidden float @__math_divzerof(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden float @__math_invalidf(float noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #1

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
!3 = !{!"branch_weights", i32 1, i32 2000}
!4 = !{!5, !6, i64 0}
!5 = !{!"", !6, i64 0, !6, i64 8}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!5, !6, i64 8}
!10 = !{!11, !6, i64 256}
!11 = !{!"logf_data", !7, i64 0, !6, i64 256, !7, i64 264}
!12 = !{!6, !6, i64 0}
