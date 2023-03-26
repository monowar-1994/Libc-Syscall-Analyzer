; ModuleID = 'src/math/sincos.c'
source_filename = "src/math/sincos.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define void @sincos(double noundef %0, double* nocapture noundef writeonly %1, double* nocapture noundef writeonly %2) local_unnamed_addr #0 {
  %4 = alloca double, align 8
  %5 = alloca [2 x double], align 16
  %6 = bitcast [2 x double]* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %6) #4
  %7 = bitcast double %0 to i64
  %8 = lshr i64 %7, 32
  %9 = trunc i64 %8 to i32
  %10 = and i32 %9, 2147483647
  %11 = icmp ult i32 %10, 1072243196
  br i1 %11, label %12, label %27

12:                                               ; preds = %3
  %13 = icmp ult i32 %10, 1044816030
  br i1 %13, label %14, label %24

14:                                               ; preds = %12
  %15 = icmp ult i32 %10, 1048576
  %16 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x4770000000000000, metadata !"fpexcept.ignore") #5
  br i1 %15, label %17, label %19

17:                                               ; preds = %14
  %18 = tail call double @llvm.experimental.constrained.fdiv.f64(double %0, double %16, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %21

19:                                               ; preds = %14
  %20 = tail call double @llvm.experimental.constrained.fadd.f64(double %0, double %16, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %21

21:                                               ; preds = %19, %17
  %22 = phi double [ %18, %17 ], [ %20, %19 ]
  %23 = bitcast double* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %23)
  store volatile double %22, double* %4, align 8, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %23)
  store double %0, double* %1, align 8, !tbaa !3
  store double 1.000000e+00, double* %2, align 8, !tbaa !3
  br label %51

24:                                               ; preds = %12
  %25 = tail call double @__sin(double noundef %0, double noundef 0.000000e+00, i32 noundef 0) #6
  store double %25, double* %1, align 8, !tbaa !3
  %26 = tail call double @__cos(double noundef %0, double noundef 0.000000e+00) #6
  store double %26, double* %2, align 8, !tbaa !3
  br label %51

27:                                               ; preds = %3
  %28 = icmp ugt i32 %10, 2146435071
  br i1 %28, label %29, label %31

29:                                               ; preds = %27
  %30 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store double %30, double* %2, align 8, !tbaa !3
  store double %30, double* %1, align 8, !tbaa !3
  br label %51

31:                                               ; preds = %27
  %32 = getelementptr inbounds [2 x double], [2 x double]* %5, i64 0, i64 0
  %33 = call i32 @__rem_pio2(double noundef %0, double* noundef nonnull %32) #6
  %34 = load double, double* %32, align 16, !tbaa !3
  %35 = getelementptr inbounds [2 x double], [2 x double]* %5, i64 0, i64 1
  %36 = load double, double* %35, align 8, !tbaa !3
  %37 = call double @__sin(double noundef %34, double noundef %36, i32 noundef 1) #6
  %38 = load double, double* %32, align 16, !tbaa !3
  %39 = load double, double* %35, align 8, !tbaa !3
  %40 = call double @__cos(double noundef %38, double noundef %39) #6
  %41 = and i32 %33, 3
  switch i32 %41, label %48 [
    i32 0, label %42
    i32 1, label %43
    i32 2, label %45
    i32 3, label %49
  ]

42:                                               ; preds = %31
  store double %37, double* %1, align 8, !tbaa !3
  store double %40, double* %2, align 8, !tbaa !3
  br label %51

43:                                               ; preds = %31
  store double %40, double* %1, align 8, !tbaa !3
  %44 = fneg double %37
  store double %44, double* %2, align 8, !tbaa !3
  br label %51

45:                                               ; preds = %31
  %46 = fneg double %37
  store double %46, double* %1, align 8, !tbaa !3
  %47 = fneg double %40
  store double %47, double* %2, align 8, !tbaa !3
  br label %51

48:                                               ; preds = %31
  unreachable

49:                                               ; preds = %31
  %50 = fneg double %40
  store double %50, double* %1, align 8, !tbaa !3
  store double %37, double* %2, align 8, !tbaa !3
  br label %51

51:                                               ; preds = %42, %43, %45, %49, %29, %24, %21
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %6) #4
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

; Function Attrs: optsize
declare hidden double @__sin(double noundef, double noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden double @__cos(double noundef, double noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: optsize
declare hidden i32 @__rem_pio2(double noundef, double* noundef) local_unnamed_addr #3

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
