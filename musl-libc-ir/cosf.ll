; ModuleID = 'src/math/cosf.c'
source_filename = "src/math/cosf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define float @cosf(float noundef %0) local_unnamed_addr #0 {
  %2 = alloca float, align 4
  %3 = alloca double, align 8
  %4 = bitcast double* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #4
  %5 = bitcast float %0 to i32
  %6 = and i32 %5, 2147483647
  %7 = icmp ult i32 %6, 1061752795
  br i1 %7, label %8, label %16

8:                                                ; preds = %1
  %9 = icmp ult i32 %6, 964689920
  br i1 %9, label %10, label %13

10:                                               ; preds = %8
  %11 = tail call float @llvm.experimental.constrained.fadd.f32(float %0, float 0x4770000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %12 = bitcast float* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %12)
  store volatile float %11, float* %2, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %12)
  br label %83

13:                                               ; preds = %8
  %14 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  %15 = tail call float @__cosdf(double noundef %14) #6
  br label %83

16:                                               ; preds = %1
  %17 = icmp ult i32 %6, 1081824210
  br i1 %17, label %18, label %38

18:                                               ; preds = %16
  %19 = icmp ugt i32 %6, 1075235811
  %20 = icmp sgt i32 %5, -1
  %21 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  br i1 %19, label %22, label %31

22:                                               ; preds = %18
  br i1 %20, label %25, label %23

23:                                               ; preds = %22
  %24 = tail call double @llvm.experimental.constrained.fadd.f64(double %21, double 0x400921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %27

25:                                               ; preds = %22
  %26 = tail call double @llvm.experimental.constrained.fsub.f64(double %21, double 0x400921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %27

27:                                               ; preds = %25, %23
  %28 = phi double [ %24, %23 ], [ %26, %25 ]
  %29 = tail call float @__cosdf(double noundef %28) #6
  %30 = fneg float %29
  br label %83

31:                                               ; preds = %18
  br i1 %20, label %35, label %32

32:                                               ; preds = %31
  %33 = tail call double @llvm.experimental.constrained.fadd.f64(double %21, double 0x3FF921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %34 = tail call float @__sindf(double noundef %33) #6
  br label %83

35:                                               ; preds = %31
  %36 = tail call double @llvm.experimental.constrained.fsub.f64(double 0x3FF921FB54442D18, double %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %37 = tail call float @__sindf(double noundef %36) #6
  br label %83

38:                                               ; preds = %16
  %39 = icmp ult i32 %6, 1088565718
  br i1 %39, label %40, label %62

40:                                               ; preds = %38
  %41 = icmp ugt i32 %6, 1085271519
  %42 = icmp sgt i32 %5, -1
  br i1 %41, label %43, label %52

43:                                               ; preds = %40
  %44 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  br i1 %42, label %47, label %45

45:                                               ; preds = %43
  %46 = tail call double @llvm.experimental.constrained.fadd.f64(double %44, double 0x401921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %49

47:                                               ; preds = %43
  %48 = tail call double @llvm.experimental.constrained.fsub.f64(double %44, double 0x401921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %49

49:                                               ; preds = %47, %45
  %50 = phi double [ %46, %45 ], [ %48, %47 ]
  %51 = tail call float @__cosdf(double noundef %50) #6
  br label %83

52:                                               ; preds = %40
  br i1 %42, label %58, label %53

53:                                               ; preds = %52
  %54 = fneg float %0
  %55 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %54, metadata !"fpexcept.ignore") #5
  %56 = tail call double @llvm.experimental.constrained.fsub.f64(double %55, double 0x4012D97C7F3321D2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %57 = tail call float @__sindf(double noundef %56) #6
  br label %83

58:                                               ; preds = %52
  %59 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  %60 = tail call double @llvm.experimental.constrained.fsub.f64(double %59, double 0x4012D97C7F3321D2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %61 = tail call float @__sindf(double noundef %60) #6
  br label %83

62:                                               ; preds = %38
  %63 = icmp ugt i32 %6, 2139095039
  br i1 %63, label %64, label %66

64:                                               ; preds = %62
  %65 = tail call float @llvm.experimental.constrained.fsub.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %83

66:                                               ; preds = %62
  %67 = call i32 @__rem_pio2f(float noundef %0, double* noundef nonnull %3) #6
  %68 = and i32 %67, 3
  switch i32 %68, label %80 [
    i32 0, label %69
    i32 1, label %72
    i32 2, label %76
  ]

69:                                               ; preds = %66
  %70 = load double, double* %3, align 8, !tbaa !7
  %71 = call float @__cosdf(double noundef %70) #6
  br label %83

72:                                               ; preds = %66
  %73 = load double, double* %3, align 8, !tbaa !7
  %74 = fneg double %73
  %75 = call float @__sindf(double noundef %74) #6
  br label %83

76:                                               ; preds = %66
  %77 = load double, double* %3, align 8, !tbaa !7
  %78 = call float @__cosdf(double noundef %77) #6
  %79 = fneg float %78
  br label %83

80:                                               ; preds = %66
  %81 = load double, double* %3, align 8, !tbaa !7
  %82 = call float @__sindf(double noundef %81) #6
  br label %83

83:                                               ; preds = %80, %76, %72, %69, %64, %58, %53, %49, %35, %32, %27, %13, %10
  %84 = phi float [ 1.000000e+00, %10 ], [ %15, %13 ], [ %30, %27 ], [ %34, %32 ], [ %37, %35 ], [ %51, %49 ], [ %57, %53 ], [ %61, %58 ], [ %65, %64 ], [ %82, %80 ], [ %79, %76 ], [ %75, %72 ], [ %71, %69 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #4
  ret float %84
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #2

; Function Attrs: optsize
declare hidden float @__cosdf(double noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: optsize
declare hidden float @__sindf(double noundef) local_unnamed_addr #3

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
