; ModuleID = 'src/math/__rem_pio2f.c'
source_filename = "src/math/__rem_pio2f.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__rem_pio2f(float noundef %0, double* nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = alloca [1 x double], align 8
  %4 = alloca [1 x double], align 8
  %5 = bitcast [1 x double]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %5) #4
  %6 = bitcast [1 x double]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %6) #4
  %7 = bitcast float %0 to i32
  %8 = and i32 %7, 2147483647
  %9 = icmp ult i32 %8, 1305022427
  br i1 %9, label %10, label %36

10:                                               ; preds = %2
  %11 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  %12 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %11, double 0x3FE45F306DC9C883, double 0x4338000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %13 = tail call double @llvm.experimental.constrained.fsub.f64(double %12, double 0x4338000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %14 = tail call i32 @llvm.experimental.constrained.fptosi.i32.f64(double %13, metadata !"fpexcept.ignore") #5
  %15 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  %16 = fneg double %13
  %17 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %16, double 0x3FF921FB50000000, double %15, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %18 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %16, double 0x3E5110B4611A6263, double %17, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store double %18, double* %1, align 8, !tbaa !3
  %19 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %18, double 0xBFE921FB60000000, metadata !"olt", metadata !"fpexcept.ignore") #5
  br i1 %19, label %20, label %27, !prof !7

20:                                               ; preds = %10
  %21 = add nsw i32 %14, -1
  %22 = tail call double @llvm.experimental.constrained.fadd.f64(double %13, double -1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %23 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  %24 = fneg double %22
  %25 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %24, double 0x3FF921FB50000000, double %23, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %26 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %24, double 0x3E5110B4611A6263, double %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store double %26, double* %1, align 8, !tbaa !3
  br label %57

27:                                               ; preds = %10
  %28 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %18, double 0x3FE921FB60000000, metadata !"ogt", metadata !"fpexcept.ignore") #5
  br i1 %28, label %29, label %57, !prof !7

29:                                               ; preds = %27
  %30 = add nsw i32 %14, 1
  %31 = tail call double @llvm.experimental.constrained.fadd.f64(double %13, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %32 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  %33 = fneg double %31
  %34 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %33, double 0x3FF921FB50000000, double %32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %35 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %33, double 0x3E5110B4611A6263, double %34, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store double %35, double* %1, align 8, !tbaa !3
  br label %57

36:                                               ; preds = %2
  %37 = icmp ugt i32 %8, 2139095039
  br i1 %37, label %38, label %41

38:                                               ; preds = %36
  %39 = tail call float @llvm.experimental.constrained.fsub.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %40 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %39, metadata !"fpexcept.ignore") #5
  store double %40, double* %1, align 8, !tbaa !3
  br label %57

41:                                               ; preds = %36
  %42 = lshr i32 %8, 23
  %43 = add nsw i32 %42, -150
  %44 = mul nsw i32 %43, -8388608
  %45 = add nsw i32 %44, %8
  %46 = bitcast i32 %45 to float
  %47 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %46, metadata !"fpexcept.ignore") #5
  %48 = getelementptr inbounds [1 x double], [1 x double]* %3, i64 0, i64 0
  store double %47, double* %48, align 8, !tbaa !3
  %49 = getelementptr inbounds [1 x double], [1 x double]* %4, i64 0, i64 0
  %50 = call i32 @__rem_pio2_large(double* noundef nonnull %48, double* noundef nonnull %49, i32 noundef %43, i32 noundef 1, i32 noundef 0) #6
  %51 = icmp sgt i32 %7, -1
  %52 = load double, double* %49, align 8, !tbaa !3
  br i1 %51, label %56, label %53

53:                                               ; preds = %41
  %54 = fneg double %52
  store double %54, double* %1, align 8, !tbaa !3
  %55 = sub nsw i32 0, %50
  br label %57

56:                                               ; preds = %41
  store double %52, double* %1, align 8, !tbaa !3
  br label %57

57:                                               ; preds = %20, %29, %27, %56, %53, %38
  %58 = phi i32 [ 0, %38 ], [ %55, %53 ], [ %50, %56 ], [ %21, %20 ], [ %30, %29 ], [ %14, %27 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %6) #4
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %5) #4
  ret i32 %58
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i32 @llvm.experimental.constrained.fptosi.i32.f64(double, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #2

; Function Attrs: optsize
declare hidden i32 @__rem_pio2_large(double* noundef, double* noundef, i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

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
!4 = !{!"double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!"branch_weights", i32 1, i32 2000}
