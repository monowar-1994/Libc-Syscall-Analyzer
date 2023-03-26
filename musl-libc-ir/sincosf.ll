; ModuleID = 'src/math/sincosf.c'
source_filename = "src/math/sincosf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define void @sincosf(float noundef %0, float* nocapture noundef writeonly %1, float* nocapture noundef writeonly %2) local_unnamed_addr #0 {
  %4 = alloca float, align 4
  %5 = alloca double, align 8
  %6 = bitcast double* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %6) #4
  %7 = bitcast float %0 to i32
  %8 = and i32 %7, 2147483647
  %9 = icmp ult i32 %8, 1061752795
  br i1 %9, label %10, label %26

10:                                               ; preds = %3
  %11 = icmp ult i32 %8, 964689920
  br i1 %11, label %12, label %21

12:                                               ; preds = %10
  %13 = icmp ult i32 %8, 1048576
  br i1 %13, label %14, label %16

14:                                               ; preds = %12
  %15 = tail call float @llvm.experimental.constrained.fdiv.f32(float %0, float 0x4770000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %18

16:                                               ; preds = %12
  %17 = tail call float @llvm.experimental.constrained.fadd.f32(float %0, float 0x4770000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %18

18:                                               ; preds = %16, %14
  %19 = phi float [ %15, %14 ], [ %17, %16 ]
  %20 = bitcast float* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %20)
  store volatile float %19, float* %4, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %20)
  store float %0, float* %1, align 4, !tbaa !3
  store float 1.000000e+00, float* %2, align 4, !tbaa !3
  br label %121

21:                                               ; preds = %10
  %22 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  %23 = tail call float @__sindf(double noundef %22) #6
  store float %23, float* %1, align 4, !tbaa !3
  %24 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  %25 = tail call float @__cosdf(double noundef %24) #6
  store float %25, float* %2, align 4, !tbaa !3
  br label %121

26:                                               ; preds = %3
  %27 = icmp ult i32 %8, 1081824210
  br i1 %27, label %28, label %64

28:                                               ; preds = %26
  %29 = icmp ult i32 %8, 1075235812
  %30 = icmp sgt i32 %7, -1
  %31 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  br i1 %29, label %32, label %47

32:                                               ; preds = %28
  br i1 %30, label %39, label %33

33:                                               ; preds = %32
  %34 = tail call double @llvm.experimental.constrained.fadd.f64(double %31, double 0x3FF921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %35 = tail call float @__cosdf(double noundef %34) #6
  %36 = fneg float %35
  store float %36, float* %1, align 4, !tbaa !3
  %37 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  %38 = tail call double @llvm.experimental.constrained.fadd.f64(double %37, double 0x3FF921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %44

39:                                               ; preds = %32
  %40 = tail call double @llvm.experimental.constrained.fsub.f64(double 0x3FF921FB54442D18, double %31, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %41 = tail call float @__cosdf(double noundef %40) #6
  store float %41, float* %1, align 4, !tbaa !3
  %42 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  %43 = tail call double @llvm.experimental.constrained.fsub.f64(double 0x3FF921FB54442D18, double %42, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %44

44:                                               ; preds = %39, %33
  %45 = phi double [ %43, %39 ], [ %38, %33 ]
  %46 = tail call float @__sindf(double noundef %45) #6
  store float %46, float* %2, align 4, !tbaa !3
  br label %121

47:                                               ; preds = %28
  br i1 %30, label %54, label %48

48:                                               ; preds = %47
  %49 = tail call double @llvm.experimental.constrained.fadd.f64(double %31, double 0x400921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %50 = tail call float @__sindf(double noundef %49) #6
  %51 = fneg float %50
  store float %51, float* %1, align 4, !tbaa !3
  %52 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  %53 = tail call double @llvm.experimental.constrained.fadd.f64(double %52, double 0x400921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %60

54:                                               ; preds = %47
  %55 = tail call double @llvm.experimental.constrained.fsub.f64(double %31, double 0x400921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %56 = tail call float @__sindf(double noundef %55) #6
  %57 = fneg float %56
  store float %57, float* %1, align 4, !tbaa !3
  %58 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  %59 = tail call double @llvm.experimental.constrained.fsub.f64(double %58, double 0x400921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %60

60:                                               ; preds = %54, %48
  %61 = phi double [ %53, %48 ], [ %59, %54 ]
  %62 = tail call float @__cosdf(double noundef %61) #6
  %63 = fneg float %62
  store float %63, float* %2, align 4, !tbaa !3
  br label %121

64:                                               ; preds = %26
  %65 = icmp ult i32 %8, 1088565718
  br i1 %65, label %66, label %101

66:                                               ; preds = %64
  %67 = icmp ult i32 %8, 1085271520
  %68 = icmp sgt i32 %7, -1
  %69 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  br i1 %67, label %70, label %87

70:                                               ; preds = %66
  br i1 %68, label %78, label %71

71:                                               ; preds = %70
  %72 = tail call double @llvm.experimental.constrained.fadd.f64(double %69, double 0x4012D97C7F3321D2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %73 = tail call float @__cosdf(double noundef %72) #6
  store float %73, float* %1, align 4, !tbaa !3
  %74 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  %75 = tail call double @llvm.experimental.constrained.fadd.f64(double %74, double 0x4012D97C7F3321D2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %76 = tail call float @__sindf(double noundef %75) #6
  %77 = fneg float %76
  br label %85

78:                                               ; preds = %70
  %79 = tail call double @llvm.experimental.constrained.fsub.f64(double %69, double 0x4012D97C7F3321D2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %80 = tail call float @__cosdf(double noundef %79) #6
  %81 = fneg float %80
  store float %81, float* %1, align 4, !tbaa !3
  %82 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  %83 = tail call double @llvm.experimental.constrained.fsub.f64(double %82, double 0x4012D97C7F3321D2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %84 = tail call float @__sindf(double noundef %83) #6
  br label %85

85:                                               ; preds = %78, %71
  %86 = phi float [ %84, %78 ], [ %77, %71 ]
  store float %86, float* %2, align 4, !tbaa !3
  br label %121

87:                                               ; preds = %66
  br i1 %68, label %93, label %88

88:                                               ; preds = %87
  %89 = tail call double @llvm.experimental.constrained.fadd.f64(double %69, double 0x401921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %90 = tail call float @__sindf(double noundef %89) #6
  store float %90, float* %1, align 4, !tbaa !3
  %91 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  %92 = tail call double @llvm.experimental.constrained.fadd.f64(double %91, double 0x401921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %98

93:                                               ; preds = %87
  %94 = tail call double @llvm.experimental.constrained.fsub.f64(double %69, double 0x401921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %95 = tail call float @__sindf(double noundef %94) #6
  store float %95, float* %1, align 4, !tbaa !3
  %96 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  %97 = tail call double @llvm.experimental.constrained.fsub.f64(double %96, double 0x401921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %98

98:                                               ; preds = %93, %88
  %99 = phi double [ %92, %88 ], [ %97, %93 ]
  %100 = tail call float @__cosdf(double noundef %99) #6
  store float %100, float* %2, align 4, !tbaa !3
  br label %121

101:                                              ; preds = %64
  %102 = icmp ugt i32 %8, 2139095039
  br i1 %102, label %103, label %105

103:                                              ; preds = %101
  %104 = tail call float @llvm.experimental.constrained.fsub.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store float %104, float* %2, align 4, !tbaa !3
  store float %104, float* %1, align 4, !tbaa !3
  br label %121

105:                                              ; preds = %101
  %106 = call i32 @__rem_pio2f(float noundef %0, double* noundef nonnull %5) #6
  %107 = load double, double* %5, align 8, !tbaa !7
  %108 = call float @__sindf(double noundef %107) #6
  %109 = load double, double* %5, align 8, !tbaa !7
  %110 = call float @__cosdf(double noundef %109) #6
  %111 = and i32 %106, 3
  switch i32 %111, label %118 [
    i32 0, label %112
    i32 1, label %113
    i32 2, label %115
    i32 3, label %119
  ]

112:                                              ; preds = %105
  store float %108, float* %1, align 4, !tbaa !3
  store float %110, float* %2, align 4, !tbaa !3
  br label %121

113:                                              ; preds = %105
  store float %110, float* %1, align 4, !tbaa !3
  %114 = fneg float %108
  store float %114, float* %2, align 4, !tbaa !3
  br label %121

115:                                              ; preds = %105
  %116 = fneg float %108
  store float %116, float* %1, align 4, !tbaa !3
  %117 = fneg float %110
  store float %117, float* %2, align 4, !tbaa !3
  br label %121

118:                                              ; preds = %105
  unreachable

119:                                              ; preds = %105
  %120 = fneg float %110
  store float %120, float* %1, align 4, !tbaa !3
  store float %108, float* %2, align 4, !tbaa !3
  br label %121

121:                                              ; preds = %112, %113, %115, %119, %103, %98, %85, %60, %44, %21, %18
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %6) #4
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #2

; Function Attrs: optsize
declare hidden float @__sindf(double noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #2

; Function Attrs: optsize
declare hidden float @__cosdf(double noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #2

; Function Attrs: optsize
declare hidden i32 @__rem_pio2f(float noundef, double* noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"float", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !5, i64 0}
