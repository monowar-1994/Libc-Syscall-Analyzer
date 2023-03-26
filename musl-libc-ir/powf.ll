; ModuleID = 'src/math/powf.c'
source_filename = "src/math/powf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.powf_log2_data = type { [16 x %struct.anon], [5 x double] }
%struct.anon = type { double, double }
%struct.exp2f_data = type { [32 x i64], double, [3 x double], double, double, [3 x double] }

@__powf_log2_data = external hidden local_unnamed_addr constant %struct.powf_log2_data, align 8
@__exp2f_data = external hidden local_unnamed_addr constant %struct.exp2f_data, align 8

; Function Attrs: nounwind optsize strictfp
define float @powf(float noundef %0, float noundef %1) local_unnamed_addr #0 {
  %3 = alloca float, align 4
  %4 = bitcast float %0 to i32
  %5 = bitcast float %1 to i32
  %6 = add i32 %4, -2139095040
  %7 = icmp ult i32 %6, -2130706432
  %8 = shl i32 %5, 1
  %9 = add i32 %8, 16777216
  %10 = icmp ult i32 %9, 16777217
  %11 = or i1 %7, %10
  br i1 %11, label %12, label %99, !prof !3

12:                                               ; preds = %2
  %13 = add i32 %8, -1
  %14 = icmp ult i32 %13, -16777217
  br i1 %14, label %36, label %15, !prof !4

15:                                               ; preds = %12
  %16 = icmp eq i32 %8, 0
  %17 = icmp eq i32 %4, 1065353216
  %18 = or i1 %17, %16
  br i1 %18, label %178, label %19

19:                                               ; preds = %15
  %20 = shl i32 %4, 1
  %21 = icmp ugt i32 %20, -16777216
  %22 = icmp ugt i32 %8, -16777216
  %23 = or i1 %21, %22
  br i1 %23, label %24, label %26

24:                                               ; preds = %19
  %25 = tail call float @llvm.experimental.constrained.fadd.f32(float %0, float %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %178

26:                                               ; preds = %19
  %27 = icmp eq i32 %20, 2130706432
  br i1 %27, label %178, label %28

28:                                               ; preds = %26
  %29 = icmp ult i32 %20, 2130706432
  %30 = zext i1 %29 to i32
  %31 = xor i32 %5, -1
  %32 = lshr i32 %31, 31
  %33 = icmp eq i32 %32, %30
  br i1 %33, label %178, label %34

34:                                               ; preds = %28
  %35 = tail call float @llvm.experimental.constrained.fmul.f32(float %1, float %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %178

36:                                               ; preds = %12
  %37 = shl i32 %4, 1
  %38 = add i32 %37, -1
  %39 = icmp ult i32 %38, -16777217
  br i1 %39, label %67, label %40, !prof !4

40:                                               ; preds = %36
  %41 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %42 = icmp sgt i32 %4, -1
  br i1 %42, label %59, label %43

43:                                               ; preds = %40
  %44 = lshr i32 %5, 23
  %45 = and i32 %44, 255
  %46 = add nsw i32 %45, -151
  %47 = icmp ult i32 %46, -24
  br i1 %47, label %59, label %48

48:                                               ; preds = %43
  %49 = sub nuw nsw i32 150, %45
  %50 = shl nuw nsw i32 1, %49
  %51 = add nsw i32 %50, -1
  %52 = and i32 %51, %5
  %53 = icmp ne i32 %52, 0
  %54 = and i32 %50, %5
  %55 = icmp eq i32 %54, 0
  %56 = select i1 %53, i1 true, i1 %55
  %57 = fneg float %41
  %58 = select i1 %56, float %41, float %57
  br label %59

59:                                               ; preds = %48, %43, %40
  %60 = phi float [ %41, %40 ], [ %41, %43 ], [ %58, %48 ]
  %61 = icmp sgt i32 %5, -1
  br i1 %61, label %178, label %62

62:                                               ; preds = %59
  %63 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %64 = tail call float @llvm.experimental.constrained.fdiv.f32(float %63, float %60, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %65 = bitcast float* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %65)
  store volatile float %64, float* %3, align 4, !tbaa !5
  %66 = load volatile float, float* %3, align 4, !tbaa !5
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %65)
  br label %178

67:                                               ; preds = %36
  %68 = icmp sgt i32 %4, -1
  br i1 %68, label %90, label %69

69:                                               ; preds = %67
  %70 = lshr i32 %5, 23
  %71 = and i32 %70, 255
  %72 = icmp ult i32 %71, 127
  br i1 %72, label %84, label %73

73:                                               ; preds = %69
  %74 = icmp ugt i32 %71, 150
  br i1 %74, label %86, label %75

75:                                               ; preds = %73
  %76 = sub nuw nsw i32 150, %71
  %77 = shl nuw nsw i32 1, %76
  %78 = add nsw i32 %77, -1
  %79 = and i32 %78, %5
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %81, label %84

81:                                               ; preds = %75
  %82 = and i32 %77, %5
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %86, label %87

84:                                               ; preds = %75, %69
  %85 = tail call float @__math_invalidf(float noundef %0) #5
  br label %178

86:                                               ; preds = %73, %81
  br label %87

87:                                               ; preds = %86, %81
  %88 = phi i32 [ 0, %86 ], [ 65536, %81 ]
  %89 = and i32 %4, 2147483647
  br label %90

90:                                               ; preds = %87, %67
  %91 = phi i32 [ %89, %87 ], [ %4, %67 ]
  %92 = phi i32 [ %88, %87 ], [ 0, %67 ]
  %93 = icmp ult i32 %91, 8388608
  br i1 %93, label %94, label %99

94:                                               ; preds = %90
  %95 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float 0x4160000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %96 = bitcast float %95 to i32
  %97 = and i32 %96, 2147483647
  %98 = add nsw i32 %97, -192937984
  br label %99

99:                                               ; preds = %2, %90, %94
  %100 = phi i32 [ %98, %94 ], [ %91, %90 ], [ %4, %2 ]
  %101 = phi i32 [ %92, %94 ], [ %92, %90 ], [ 0, %2 ]
  %102 = add nsw i32 %100, -1060306944
  %103 = lshr i32 %102, 19
  %104 = and i32 %103, 15
  %105 = and i32 %102, -8388608
  %106 = sub i32 %100, %105
  %107 = ashr i32 %102, 23
  %108 = zext i32 %104 to i64
  %109 = getelementptr inbounds %struct.powf_log2_data, %struct.powf_log2_data* @__powf_log2_data, i64 0, i32 0, i64 %108, i32 0
  %110 = load double, double* %109, align 8, !tbaa !9
  %111 = getelementptr inbounds %struct.powf_log2_data, %struct.powf_log2_data* @__powf_log2_data, i64 0, i32 0, i64 %108, i32 1
  %112 = load double, double* %111, align 8, !tbaa !12
  %113 = bitcast i32 %106 to float
  %114 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %113, metadata !"fpexcept.ignore") #6
  %115 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %116 = fneg double %115
  %117 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %114, double %110, double %116, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %118 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %107, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %119 = tail call double @llvm.experimental.constrained.fadd.f64(double %112, double %118, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %120 = tail call double @llvm.experimental.constrained.fmul.f64(double %117, double %117, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %121 = load double, double* getelementptr inbounds (%struct.powf_log2_data, %struct.powf_log2_data* @__powf_log2_data, i64 0, i32 1, i64 0), align 8, !tbaa !13
  %122 = load double, double* getelementptr inbounds (%struct.powf_log2_data, %struct.powf_log2_data* @__powf_log2_data, i64 0, i32 1, i64 1), align 8, !tbaa !13
  %123 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %121, double %117, double %122, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %124 = load double, double* getelementptr inbounds (%struct.powf_log2_data, %struct.powf_log2_data* @__powf_log2_data, i64 0, i32 1, i64 2), align 8, !tbaa !13
  %125 = load double, double* getelementptr inbounds (%struct.powf_log2_data, %struct.powf_log2_data* @__powf_log2_data, i64 0, i32 1, i64 3), align 8, !tbaa !13
  %126 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %124, double %117, double %125, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %127 = tail call double @llvm.experimental.constrained.fmul.f64(double %120, double %120, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %128 = load double, double* getelementptr inbounds (%struct.powf_log2_data, %struct.powf_log2_data* @__powf_log2_data, i64 0, i32 1, i64 4), align 8, !tbaa !13
  %129 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %128, double %117, double %119, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %130 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %126, double %120, double %129, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %131 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %123, double %127, double %130, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %132 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %1, metadata !"fpexcept.ignore") #4
  %133 = tail call double @llvm.experimental.constrained.fmul.f64(double %132, double %131, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %134 = bitcast double %133 to i64
  %135 = lshr i64 %134, 47
  %136 = and i64 %135, 65535
  %137 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %138 = tail call double @llvm.experimental.constrained.fmul.f64(double 1.260000e+02, double %137, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %139 = bitcast double %138 to i64
  %140 = lshr i64 %139, 47
  %141 = icmp ult i64 %136, %140
  br i1 %141, label %154, label %142, !prof !4

142:                                              ; preds = %99
  %143 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %144 = tail call double @llvm.experimental.constrained.fmul.f64(double 0x405FFFFFFFD1D571, double %143, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %145 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %133, double %144, metadata !"ogt", metadata !"fpexcept.ignore") #4
  br i1 %145, label %146, label %148

146:                                              ; preds = %142
  %147 = tail call float @__math_oflowf(i32 noundef %101) #5
  br label %178

148:                                              ; preds = %142
  %149 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %150 = tail call double @llvm.experimental.constrained.fmul.f64(double -1.500000e+02, double %149, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %151 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %133, double %150, metadata !"ole", metadata !"fpexcept.ignore") #4
  br i1 %151, label %152, label %154

152:                                              ; preds = %148
  %153 = tail call float @__math_uflowf(i32 noundef %101) #5
  br label %178

154:                                              ; preds = %148, %99
  %155 = load double, double* getelementptr inbounds (%struct.exp2f_data, %struct.exp2f_data* @__exp2f_data, i64 0, i32 1), align 8, !tbaa !14
  %156 = tail call double @llvm.experimental.constrained.fadd.f64(double %133, double %155, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %157 = bitcast double %156 to i64
  %158 = tail call double @llvm.experimental.constrained.fsub.f64(double %156, double %155, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %159 = tail call double @llvm.experimental.constrained.fsub.f64(double %133, double %158, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %160 = and i64 %157, 31
  %161 = getelementptr inbounds %struct.exp2f_data, %struct.exp2f_data* @__exp2f_data, i64 0, i32 0, i64 %160
  %162 = load i64, i64* %161, align 8, !tbaa !16
  %163 = zext i32 %101 to i64
  %164 = add i64 %157, %163
  %165 = shl i64 %164, 47
  %166 = add i64 %162, %165
  %167 = bitcast i64 %166 to double
  %168 = load double, double* getelementptr inbounds (%struct.exp2f_data, %struct.exp2f_data* @__exp2f_data, i64 0, i32 2, i64 0), align 8, !tbaa !13
  %169 = load double, double* getelementptr inbounds (%struct.exp2f_data, %struct.exp2f_data* @__exp2f_data, i64 0, i32 2, i64 1), align 8, !tbaa !13
  %170 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %168, double %159, double %169, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %171 = tail call double @llvm.experimental.constrained.fmul.f64(double %159, double %159, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %172 = load double, double* getelementptr inbounds (%struct.exp2f_data, %struct.exp2f_data* @__exp2f_data, i64 0, i32 2, i64 2), align 8, !tbaa !13
  %173 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %174 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %172, double %159, double %173, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %175 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %170, double %171, double %174, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %176 = tail call double @llvm.experimental.constrained.fmul.f64(double %175, double %167, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %177 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %176, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %178

178:                                              ; preds = %84, %146, %152, %154, %62, %59, %28, %26, %15, %34, %24
  %179 = phi float [ %25, %24 ], [ %35, %34 ], [ 1.000000e+00, %15 ], [ 1.000000e+00, %26 ], [ 0.000000e+00, %28 ], [ %66, %62 ], [ %60, %59 ], [ %147, %146 ], [ %153, %152 ], [ %177, %154 ], [ %85, %84 ]
  ret float %179
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden float @__math_invalidf(float noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f64(double, double, metadata, metadata) #2

; Function Attrs: optsize
declare hidden float @__math_oflowf(i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden float @__math_uflowf(i32 noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!"branch_weights", i32 4001, i32 4000000}
!4 = !{!"branch_weights", i32 2000, i32 1}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !11, i64 0}
!10 = !{!"", !11, i64 0, !11, i64 8}
!11 = !{!"double", !7, i64 0}
!12 = !{!10, !11, i64 8}
!13 = !{!11, !11, i64 0}
!14 = !{!15, !11, i64 256}
!15 = !{!"exp2f_data", !7, i64 0, !11, i64 256, !7, i64 264, !11, i64 288, !11, i64 296, !7, i64 304}
!16 = !{!17, !17, i64 0}
!17 = !{!"long", !7, i64 0}
