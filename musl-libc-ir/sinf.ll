; ModuleID = 'src/math/sinf.c'
source_filename = "src/math/sinf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define float @sinf(float noundef %0) local_unnamed_addr #0 {
  %2 = alloca float, align 4
  %3 = alloca double, align 8
  %4 = bitcast double* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #4
  %5 = bitcast float %0 to i32
  %6 = and i32 %5, 2147483647
  %7 = icmp ult i32 %6, 1061752795
  br i1 %7, label %8, label %22

8:                                                ; preds = %1
  %9 = icmp ult i32 %6, 964689920
  br i1 %9, label %10, label %19

10:                                               ; preds = %8
  %11 = icmp ult i32 %6, 8388608
  br i1 %11, label %12, label %14

12:                                               ; preds = %10
  %13 = tail call float @llvm.experimental.constrained.fdiv.f32(float %0, float 0x4770000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %16

14:                                               ; preds = %10
  %15 = tail call float @llvm.experimental.constrained.fadd.f32(float %0, float 0x4770000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %16

16:                                               ; preds = %14, %12
  %17 = phi float [ %13, %12 ], [ %15, %14 ]
  %18 = bitcast float* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %18)
  store volatile float %17, float* %2, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %18)
  br label %88

19:                                               ; preds = %8
  %20 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  %21 = tail call float @__sindf(double noundef %20) #6
  br label %88

22:                                               ; preds = %1
  %23 = icmp ult i32 %6, 1081824210
  br i1 %23, label %24, label %45

24:                                               ; preds = %22
  %25 = icmp ult i32 %6, 1075235812
  %26 = icmp sgt i32 %5, -1
  %27 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  br i1 %25, label %28, label %36

28:                                               ; preds = %24
  br i1 %26, label %33, label %29

29:                                               ; preds = %28
  %30 = tail call double @llvm.experimental.constrained.fadd.f64(double %27, double 0x3FF921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %31 = tail call float @__cosdf(double noundef %30) #6
  %32 = fneg float %31
  br label %88

33:                                               ; preds = %28
  %34 = tail call double @llvm.experimental.constrained.fsub.f64(double %27, double 0x3FF921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %35 = tail call float @__cosdf(double noundef %34) #6
  br label %88

36:                                               ; preds = %24
  br i1 %26, label %39, label %37

37:                                               ; preds = %36
  %38 = tail call double @llvm.experimental.constrained.fadd.f64(double %27, double 0x400921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %41

39:                                               ; preds = %36
  %40 = tail call double @llvm.experimental.constrained.fsub.f64(double %27, double 0x400921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %41

41:                                               ; preds = %39, %37
  %42 = phi double [ %40, %39 ], [ %38, %37 ]
  %43 = fneg double %42
  %44 = tail call float @__sindf(double noundef %43) #6
  br label %88

45:                                               ; preds = %22
  %46 = icmp ult i32 %6, 1088565718
  br i1 %46, label %47, label %67

47:                                               ; preds = %45
  %48 = icmp ult i32 %6, 1085271520
  %49 = icmp sgt i32 %5, -1
  %50 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  br i1 %48, label %51, label %59

51:                                               ; preds = %47
  br i1 %49, label %55, label %52

52:                                               ; preds = %51
  %53 = tail call double @llvm.experimental.constrained.fadd.f64(double %50, double 0x4012D97C7F3321D2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %54 = tail call float @__cosdf(double noundef %53) #6
  br label %88

55:                                               ; preds = %51
  %56 = tail call double @llvm.experimental.constrained.fsub.f64(double %50, double 0x4012D97C7F3321D2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %57 = tail call float @__cosdf(double noundef %56) #6
  %58 = fneg float %57
  br label %88

59:                                               ; preds = %47
  br i1 %49, label %62, label %60

60:                                               ; preds = %59
  %61 = tail call double @llvm.experimental.constrained.fadd.f64(double %50, double 0x401921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %64

62:                                               ; preds = %59
  %63 = tail call double @llvm.experimental.constrained.fsub.f64(double %50, double 0x401921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %64

64:                                               ; preds = %62, %60
  %65 = phi double [ %61, %60 ], [ %63, %62 ]
  %66 = tail call float @__sindf(double noundef %65) #6
  br label %88

67:                                               ; preds = %45
  %68 = icmp ugt i32 %6, 2139095039
  br i1 %68, label %69, label %71

69:                                               ; preds = %67
  %70 = tail call float @llvm.experimental.constrained.fsub.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %88

71:                                               ; preds = %67
  %72 = call i32 @__rem_pio2f(float noundef %0, double* noundef nonnull %3) #6
  %73 = and i32 %72, 3
  switch i32 %73, label %84 [
    i32 0, label %74
    i32 1, label %77
    i32 2, label %80
  ]

74:                                               ; preds = %71
  %75 = load double, double* %3, align 8, !tbaa !7
  %76 = call float @__sindf(double noundef %75) #6
  br label %88

77:                                               ; preds = %71
  %78 = load double, double* %3, align 8, !tbaa !7
  %79 = call float @__cosdf(double noundef %78) #6
  br label %88

80:                                               ; preds = %71
  %81 = load double, double* %3, align 8, !tbaa !7
  %82 = fneg double %81
  %83 = call float @__sindf(double noundef %82) #6
  br label %88

84:                                               ; preds = %71
  %85 = load double, double* %3, align 8, !tbaa !7
  %86 = call float @__cosdf(double noundef %85) #6
  %87 = fneg float %86
  br label %88

88:                                               ; preds = %84, %80, %77, %74, %69, %64, %55, %52, %41, %33, %29, %19, %16
  %89 = phi float [ %0, %16 ], [ %21, %19 ], [ %32, %29 ], [ %35, %33 ], [ %44, %41 ], [ %54, %52 ], [ %58, %55 ], [ %66, %64 ], [ %70, %69 ], [ %87, %84 ], [ %83, %80 ], [ %79, %77 ], [ %76, %74 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #4
  ret float %89
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
