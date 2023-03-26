; ModuleID = 'src/math/log2.c'
source_filename = "src/math/log2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.log2_data = type { double, double, [6 x double], [10 x double], [64 x %struct.anon], [64 x %struct.anon.6] }
%struct.anon = type { double, double }
%struct.anon.6 = type { double, double }

@__log2_data = external hidden local_unnamed_addr constant %struct.log2_data, align 8

; Function Attrs: nounwind optsize strictfp
define double @log2(double noundef %0) local_unnamed_addr #0 {
  %2 = bitcast double %0 to i64
  %3 = lshr i64 %2, 48
  %4 = trunc i64 %3 to i32
  %5 = add i64 %2, -4606800540372828160
  %6 = icmp ult i64 %5, 581272283906048
  br i1 %6, label %7, label %49, !prof !3

7:                                                ; preds = %1
  %8 = icmp eq i64 %2, 4607182418800017408
  br i1 %8, label %9, label %11, !prof !3

9:                                                ; preds = %7
  %10 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %124

11:                                               ; preds = %7
  %12 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %13 = bitcast double %12 to i64
  %14 = and i64 %13, -4294967296
  %15 = bitcast i64 %14 to double
  %16 = tail call double @llvm.experimental.constrained.fsub.f64(double %12, double %15, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %17 = load double, double* getelementptr inbounds (%struct.log2_data, %struct.log2_data* @__log2_data, i64 0, i32 0), align 8, !tbaa !4
  %18 = tail call double @llvm.experimental.constrained.fmul.f64(double %15, double %17, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %19 = load double, double* getelementptr inbounds (%struct.log2_data, %struct.log2_data* @__log2_data, i64 0, i32 1), align 8, !tbaa !9
  %20 = tail call double @llvm.experimental.constrained.fmul.f64(double %12, double %19, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %21 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %16, double %17, double %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %22 = tail call double @llvm.experimental.constrained.fmul.f64(double %12, double %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %23 = tail call double @llvm.experimental.constrained.fmul.f64(double %22, double %22, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %24 = load double, double* getelementptr inbounds (%struct.log2_data, %struct.log2_data* @__log2_data, i64 0, i32 3, i64 0), align 8, !tbaa !10
  %25 = load double, double* getelementptr inbounds (%struct.log2_data, %struct.log2_data* @__log2_data, i64 0, i32 3, i64 1), align 8, !tbaa !10
  %26 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %12, double %25, double %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %27 = tail call double @llvm.experimental.constrained.fmul.f64(double %22, double %26, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = tail call double @llvm.experimental.constrained.fadd.f64(double %18, double %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %29 = tail call double @llvm.experimental.constrained.fsub.f64(double %18, double %28, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %30 = tail call double @llvm.experimental.constrained.fadd.f64(double %29, double %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %31 = tail call double @llvm.experimental.constrained.fadd.f64(double %21, double %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %32 = load double, double* getelementptr inbounds (%struct.log2_data, %struct.log2_data* @__log2_data, i64 0, i32 3, i64 2), align 8, !tbaa !10
  %33 = load double, double* getelementptr inbounds (%struct.log2_data, %struct.log2_data* @__log2_data, i64 0, i32 3, i64 3), align 8, !tbaa !10
  %34 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %12, double %33, double %32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %35 = load double, double* getelementptr inbounds (%struct.log2_data, %struct.log2_data* @__log2_data, i64 0, i32 3, i64 4), align 8, !tbaa !10
  %36 = load double, double* getelementptr inbounds (%struct.log2_data, %struct.log2_data* @__log2_data, i64 0, i32 3, i64 5), align 8, !tbaa !10
  %37 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %12, double %36, double %35, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %38 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %22, double %37, double %34, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %39 = load double, double* getelementptr inbounds (%struct.log2_data, %struct.log2_data* @__log2_data, i64 0, i32 3, i64 6), align 8, !tbaa !10
  %40 = load double, double* getelementptr inbounds (%struct.log2_data, %struct.log2_data* @__log2_data, i64 0, i32 3, i64 7), align 8, !tbaa !10
  %41 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %12, double %40, double %39, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %42 = load double, double* getelementptr inbounds (%struct.log2_data, %struct.log2_data* @__log2_data, i64 0, i32 3, i64 8), align 8, !tbaa !10
  %43 = load double, double* getelementptr inbounds (%struct.log2_data, %struct.log2_data* @__log2_data, i64 0, i32 3, i64 9), align 8, !tbaa !10
  %44 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %12, double %43, double %42, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %45 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %22, double %44, double %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %46 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %23, double %45, double %38, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %47 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %23, double %46, double %31, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %48 = tail call double @llvm.experimental.constrained.fadd.f64(double %28, double %47, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %124

49:                                               ; preds = %1
  %50 = add nsw i32 %4, -32752
  %51 = icmp ult i32 %50, -32736
  br i1 %51, label %52, label %73, !prof !3

52:                                               ; preds = %49
  %53 = and i64 %2, 9223372036854775807
  %54 = icmp eq i64 %53, 0
  br i1 %54, label %55, label %57

55:                                               ; preds = %52
  %56 = tail call double @__math_divzero(i32 noundef 1) #4
  br label %124

57:                                               ; preds = %52
  %58 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x7FF0000000000000, metadata !"fpexcept.ignore") #3
  %59 = bitcast double %58 to i64
  %60 = icmp eq i64 %2, %59
  br i1 %60, label %124, label %61

61:                                               ; preds = %57
  %62 = and i32 %4, 32768
  %63 = icmp ne i32 %62, 0
  %64 = and i32 %4, 32752
  %65 = icmp eq i32 %64, 32752
  %66 = or i1 %63, %65
  br i1 %66, label %67, label %69

67:                                               ; preds = %61
  %68 = tail call double @__math_invalid(double noundef %0) #4
  br label %124

69:                                               ; preds = %61
  %70 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double 0x4330000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %71 = bitcast double %70 to i64
  %72 = add i64 %71, -234187180623265792
  br label %73

73:                                               ; preds = %69, %49
  %74 = phi i64 [ %72, %69 ], [ %2, %49 ]
  %75 = add i64 %74, -4604367669032910848
  %76 = lshr i64 %75, 46
  %77 = and i64 %76, 63
  %78 = ashr i64 %75, 52
  %79 = trunc i64 %78 to i32
  %80 = and i64 %75, -4503599627370496
  %81 = sub i64 %74, %80
  %82 = getelementptr inbounds %struct.log2_data, %struct.log2_data* @__log2_data, i64 0, i32 4, i64 %77, i32 0
  %83 = load double, double* %82, align 8, !tbaa !11
  %84 = getelementptr inbounds %struct.log2_data, %struct.log2_data* @__log2_data, i64 0, i32 4, i64 %77, i32 1
  %85 = load double, double* %84, align 8, !tbaa !13
  %86 = bitcast i64 %81 to double
  %87 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %79, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %88 = getelementptr inbounds %struct.log2_data, %struct.log2_data* @__log2_data, i64 0, i32 5, i64 %77, i32 0
  %89 = load double, double* %88, align 8, !tbaa !11
  %90 = tail call double @llvm.experimental.constrained.fsub.f64(double %86, double %89, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %91 = getelementptr inbounds %struct.log2_data, %struct.log2_data* @__log2_data, i64 0, i32 5, i64 %77, i32 1
  %92 = load double, double* %91, align 8, !tbaa !13
  %93 = tail call double @llvm.experimental.constrained.fsub.f64(double %90, double %92, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %94 = tail call double @llvm.experimental.constrained.fmul.f64(double %93, double %83, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %95 = bitcast double %94 to i64
  %96 = and i64 %95, -4294967296
  %97 = bitcast i64 %96 to double
  %98 = tail call double @llvm.experimental.constrained.fsub.f64(double %94, double %97, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %99 = load double, double* getelementptr inbounds (%struct.log2_data, %struct.log2_data* @__log2_data, i64 0, i32 0), align 8, !tbaa !4
  %100 = tail call double @llvm.experimental.constrained.fmul.f64(double %97, double %99, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %101 = load double, double* getelementptr inbounds (%struct.log2_data, %struct.log2_data* @__log2_data, i64 0, i32 1), align 8, !tbaa !9
  %102 = tail call double @llvm.experimental.constrained.fmul.f64(double %94, double %101, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %103 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %98, double %99, double %102, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %104 = tail call double @llvm.experimental.constrained.fadd.f64(double %87, double %85, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %105 = tail call double @llvm.experimental.constrained.fadd.f64(double %104, double %100, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %106 = tail call double @llvm.experimental.constrained.fsub.f64(double %104, double %105, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %107 = tail call double @llvm.experimental.constrained.fadd.f64(double %106, double %100, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %108 = tail call double @llvm.experimental.constrained.fadd.f64(double %107, double %103, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %109 = tail call double @llvm.experimental.constrained.fmul.f64(double %94, double %94, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %110 = tail call double @llvm.experimental.constrained.fmul.f64(double %109, double %109, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %111 = load double, double* getelementptr inbounds (%struct.log2_data, %struct.log2_data* @__log2_data, i64 0, i32 2, i64 0), align 8, !tbaa !10
  %112 = load double, double* getelementptr inbounds (%struct.log2_data, %struct.log2_data* @__log2_data, i64 0, i32 2, i64 1), align 8, !tbaa !10
  %113 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %94, double %112, double %111, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %114 = load double, double* getelementptr inbounds (%struct.log2_data, %struct.log2_data* @__log2_data, i64 0, i32 2, i64 2), align 8, !tbaa !10
  %115 = load double, double* getelementptr inbounds (%struct.log2_data, %struct.log2_data* @__log2_data, i64 0, i32 2, i64 3), align 8, !tbaa !10
  %116 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %94, double %115, double %114, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %117 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %109, double %116, double %113, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %118 = load double, double* getelementptr inbounds (%struct.log2_data, %struct.log2_data* @__log2_data, i64 0, i32 2, i64 4), align 8, !tbaa !10
  %119 = load double, double* getelementptr inbounds (%struct.log2_data, %struct.log2_data* @__log2_data, i64 0, i32 2, i64 5), align 8, !tbaa !10
  %120 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %94, double %119, double %118, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %121 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %110, double %120, double %117, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %122 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %109, double %121, double %108, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %123 = tail call double @llvm.experimental.constrained.fadd.f64(double %122, double %105, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %124

124:                                              ; preds = %57, %73, %67, %55, %11, %9
  %125 = phi double [ %10, %9 ], [ %48, %11 ], [ %56, %55 ], [ %68, %67 ], [ %123, %73 ], [ %0, %57 ]
  ret double %125
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
!4 = !{!5, !6, i64 0}
!5 = !{!"log2_data", !6, i64 0, !6, i64 8, !7, i64 16, !7, i64 64, !7, i64 144, !7, i64 1168}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!5, !6, i64 8}
!10 = !{!6, !6, i64 0}
!11 = !{!12, !6, i64 0}
!12 = !{!"", !6, i64 0, !6, i64 8}
!13 = !{!12, !6, i64 8}
