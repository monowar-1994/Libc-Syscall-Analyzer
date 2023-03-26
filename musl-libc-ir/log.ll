; ModuleID = 'src/math/log.c'
source_filename = "src/math/log.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.log_data = type { double, double, [5 x double], [11 x double], [128 x %struct.anon], [128 x %struct.anon.4] }
%struct.anon = type { double, double }
%struct.anon.4 = type { double, double }

@__log_data = external hidden local_unnamed_addr constant %struct.log_data, align 8

; Function Attrs: nounwind optsize strictfp
define double @log(double noundef %0) local_unnamed_addr #0 {
  %2 = bitcast double %0 to i64
  %3 = lshr i64 %2, 48
  %4 = trunc i64 %3 to i32
  %5 = add i64 %2, -4606619468846596096
  %6 = icmp ult i64 %5, 854320534781952
  br i1 %6, label %7, label %50, !prof !3

7:                                                ; preds = %1
  %8 = icmp eq i64 %2, 4607182418800017408
  br i1 %8, label %9, label %11, !prof !3

9:                                                ; preds = %7
  %10 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %116

11:                                               ; preds = %7
  %12 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %13 = tail call double @llvm.experimental.constrained.fmul.f64(double %12, double %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %14 = tail call double @llvm.experimental.constrained.fmul.f64(double %12, double %13, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %15 = load double, double* getelementptr inbounds (%struct.log_data, %struct.log_data* @__log_data, i64 0, i32 3, i64 1), align 8, !tbaa !4
  %16 = load double, double* getelementptr inbounds (%struct.log_data, %struct.log_data* @__log_data, i64 0, i32 3, i64 2), align 8, !tbaa !4
  %17 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %12, double %16, double %15, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %18 = load double, double* getelementptr inbounds (%struct.log_data, %struct.log_data* @__log_data, i64 0, i32 3, i64 3), align 8, !tbaa !4
  %19 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %13, double %18, double %17, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %20 = load double, double* getelementptr inbounds (%struct.log_data, %struct.log_data* @__log_data, i64 0, i32 3, i64 4), align 8, !tbaa !4
  %21 = load double, double* getelementptr inbounds (%struct.log_data, %struct.log_data* @__log_data, i64 0, i32 3, i64 5), align 8, !tbaa !4
  %22 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %12, double %21, double %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %23 = load double, double* getelementptr inbounds (%struct.log_data, %struct.log_data* @__log_data, i64 0, i32 3, i64 6), align 8, !tbaa !4
  %24 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %13, double %23, double %22, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %25 = load double, double* getelementptr inbounds (%struct.log_data, %struct.log_data* @__log_data, i64 0, i32 3, i64 7), align 8, !tbaa !4
  %26 = load double, double* getelementptr inbounds (%struct.log_data, %struct.log_data* @__log_data, i64 0, i32 3, i64 8), align 8, !tbaa !4
  %27 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %12, double %26, double %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = load double, double* getelementptr inbounds (%struct.log_data, %struct.log_data* @__log_data, i64 0, i32 3, i64 9), align 8, !tbaa !4
  %29 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %13, double %28, double %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %30 = load double, double* getelementptr inbounds (%struct.log_data, %struct.log_data* @__log_data, i64 0, i32 3, i64 10), align 8, !tbaa !4
  %31 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %14, double %30, double %29, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %32 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %14, double %31, double %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %14, double %32, double %19, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %34 = tail call double @llvm.experimental.constrained.fmul.f64(double %14, double %33, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %35 = tail call double @llvm.experimental.constrained.fmul.f64(double %12, double 0x41A0000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %36 = tail call double @llvm.experimental.constrained.fadd.f64(double %12, double %35, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %37 = tail call double @llvm.experimental.constrained.fsub.f64(double %36, double %35, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %38 = tail call double @llvm.experimental.constrained.fsub.f64(double %12, double %37, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %39 = tail call double @llvm.experimental.constrained.fmul.f64(double %37, double %37, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %40 = load double, double* getelementptr inbounds (%struct.log_data, %struct.log_data* @__log_data, i64 0, i32 3, i64 0), align 8, !tbaa !4
  %41 = tail call double @llvm.experimental.constrained.fmul.f64(double %39, double %40, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %42 = tail call double @llvm.experimental.constrained.fadd.f64(double %12, double %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %43 = tail call double @llvm.experimental.constrained.fsub.f64(double %12, double %42, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %44 = tail call double @llvm.experimental.constrained.fadd.f64(double %43, double %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %45 = tail call double @llvm.experimental.constrained.fmul.f64(double %40, double %38, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %46 = tail call double @llvm.experimental.constrained.fadd.f64(double %37, double %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %47 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %45, double %46, double %44, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %48 = tail call double @llvm.experimental.constrained.fadd.f64(double %34, double %47, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %49 = tail call double @llvm.experimental.constrained.fadd.f64(double %48, double %42, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %116

50:                                               ; preds = %1
  %51 = add nsw i32 %4, -32752
  %52 = icmp ult i32 %51, -32736
  br i1 %52, label %53, label %74, !prof !3

53:                                               ; preds = %50
  %54 = and i64 %2, 9223372036854775807
  %55 = icmp eq i64 %54, 0
  br i1 %55, label %56, label %58

56:                                               ; preds = %53
  %57 = tail call double @__math_divzero(i32 noundef 1) #4
  br label %116

58:                                               ; preds = %53
  %59 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x7FF0000000000000, metadata !"fpexcept.ignore") #3
  %60 = bitcast double %59 to i64
  %61 = icmp eq i64 %2, %60
  br i1 %61, label %116, label %62

62:                                               ; preds = %58
  %63 = and i32 %4, 32768
  %64 = icmp ne i32 %63, 0
  %65 = and i32 %4, 32752
  %66 = icmp eq i32 %65, 32752
  %67 = or i1 %64, %66
  br i1 %67, label %68, label %70

68:                                               ; preds = %62
  %69 = tail call double @__math_invalid(double noundef %0) #4
  br label %116

70:                                               ; preds = %62
  %71 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double 0x4330000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %72 = bitcast double %71 to i64
  %73 = add i64 %72, -234187180623265792
  br label %74

74:                                               ; preds = %70, %50
  %75 = phi i64 [ %73, %70 ], [ %2, %50 ]
  %76 = add i64 %75, -4604367669032910848
  %77 = lshr i64 %76, 45
  %78 = and i64 %77, 127
  %79 = ashr i64 %76, 52
  %80 = trunc i64 %79 to i32
  %81 = and i64 %76, -4503599627370496
  %82 = sub i64 %75, %81
  %83 = getelementptr inbounds %struct.log_data, %struct.log_data* @__log_data, i64 0, i32 4, i64 %78, i32 0
  %84 = load double, double* %83, align 8, !tbaa !8
  %85 = getelementptr inbounds %struct.log_data, %struct.log_data* @__log_data, i64 0, i32 4, i64 %78, i32 1
  %86 = load double, double* %85, align 8, !tbaa !10
  %87 = bitcast i64 %82 to double
  %88 = getelementptr inbounds %struct.log_data, %struct.log_data* @__log_data, i64 0, i32 5, i64 %78, i32 0
  %89 = load double, double* %88, align 8, !tbaa !8
  %90 = tail call double @llvm.experimental.constrained.fsub.f64(double %87, double %89, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %91 = getelementptr inbounds %struct.log_data, %struct.log_data* @__log_data, i64 0, i32 5, i64 %78, i32 1
  %92 = load double, double* %91, align 8, !tbaa !10
  %93 = tail call double @llvm.experimental.constrained.fsub.f64(double %90, double %92, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %94 = tail call double @llvm.experimental.constrained.fmul.f64(double %93, double %84, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %95 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %80, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %96 = load double, double* getelementptr inbounds (%struct.log_data, %struct.log_data* @__log_data, i64 0, i32 0), align 8, !tbaa !11
  %97 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %95, double %96, double %86, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %98 = tail call double @llvm.experimental.constrained.fadd.f64(double %97, double %94, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %99 = tail call double @llvm.experimental.constrained.fsub.f64(double %97, double %98, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %100 = tail call double @llvm.experimental.constrained.fadd.f64(double %99, double %94, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %101 = load double, double* getelementptr inbounds (%struct.log_data, %struct.log_data* @__log_data, i64 0, i32 1), align 8, !tbaa !13
  %102 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %95, double %101, double %100, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %103 = tail call double @llvm.experimental.constrained.fmul.f64(double %94, double %94, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %104 = load double, double* getelementptr inbounds (%struct.log_data, %struct.log_data* @__log_data, i64 0, i32 2, i64 0), align 8, !tbaa !4
  %105 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %103, double %104, double %102, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %106 = tail call double @llvm.experimental.constrained.fmul.f64(double %94, double %103, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %107 = load double, double* getelementptr inbounds (%struct.log_data, %struct.log_data* @__log_data, i64 0, i32 2, i64 1), align 8, !tbaa !4
  %108 = load double, double* getelementptr inbounds (%struct.log_data, %struct.log_data* @__log_data, i64 0, i32 2, i64 2), align 8, !tbaa !4
  %109 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %94, double %108, double %107, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %110 = load double, double* getelementptr inbounds (%struct.log_data, %struct.log_data* @__log_data, i64 0, i32 2, i64 3), align 8, !tbaa !4
  %111 = load double, double* getelementptr inbounds (%struct.log_data, %struct.log_data* @__log_data, i64 0, i32 2, i64 4), align 8, !tbaa !4
  %112 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %94, double %111, double %110, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %113 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %103, double %112, double %109, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %114 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %106, double %113, double %105, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %115 = tail call double @llvm.experimental.constrained.fadd.f64(double %114, double %98, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %116

116:                                              ; preds = %58, %74, %68, %56, %11, %9
  %117 = phi double [ %10, %9 ], [ %49, %11 ], [ %57, %56 ], [ %69, %68 ], [ %115, %74 ], [ %0, %58 ]
  ret double %117
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #1

; Function Attrs: optsize
declare hidden double @__math_divzero(i32 noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #1

; Function Attrs: optsize
declare hidden double @__math_invalid(double noundef) local_unnamed_addr #2

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
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9, !5, i64 0}
!9 = !{!"", !5, i64 0, !5, i64 8}
!10 = !{!9, !5, i64 8}
!11 = !{!12, !5, i64 0}
!12 = !{!"log_data", !5, i64 0, !5, i64 8, !6, i64 16, !6, i64 56, !6, i64 144, !6, i64 2192}
!13 = !{!12, !5, i64 8}
