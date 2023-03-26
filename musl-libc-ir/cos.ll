; ModuleID = 'src/math/cos.c'
source_filename = "src/math/cos.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define double @cos(double noundef %0) local_unnamed_addr #0 {
  %2 = alloca double, align 8
  %3 = alloca [2 x double], align 16
  %4 = bitcast [2 x double]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %4) #4
  %5 = bitcast double %0 to i64
  %6 = lshr i64 %5, 32
  %7 = trunc i64 %6 to i32
  %8 = and i32 %7, 2147483647
  %9 = icmp ult i32 %8, 1072243196
  br i1 %9, label %10, label %19

10:                                               ; preds = %1
  %11 = icmp ult i32 %8, 1044816030
  br i1 %11, label %12, label %16

12:                                               ; preds = %10
  %13 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x4770000000000000, metadata !"fpexcept.ignore") #5
  %14 = tail call double @llvm.experimental.constrained.fadd.f64(double %0, double %13, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %15 = bitcast double* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %15)
  store volatile double %14, double* %2, align 8, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %15)
  br label %49

16:                                               ; preds = %10
  %17 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %18 = tail call double @__cos(double noundef %0, double noundef %17) #6
  br label %49

19:                                               ; preds = %1
  %20 = icmp ugt i32 %8, 2146435071
  br i1 %20, label %21, label %23

21:                                               ; preds = %19
  %22 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %49

23:                                               ; preds = %19
  %24 = getelementptr inbounds [2 x double], [2 x double]* %3, i64 0, i64 0
  %25 = call i32 @__rem_pio2(double noundef %0, double* noundef nonnull %24) #6
  %26 = and i32 %25, 3
  switch i32 %26, label %44 [
    i32 0, label %27
    i32 1, label %32
    i32 2, label %38
  ]

27:                                               ; preds = %23
  %28 = load double, double* %24, align 16, !tbaa !3
  %29 = getelementptr inbounds [2 x double], [2 x double]* %3, i64 0, i64 1
  %30 = load double, double* %29, align 8, !tbaa !3
  %31 = call double @__cos(double noundef %28, double noundef %30) #6
  br label %49

32:                                               ; preds = %23
  %33 = load double, double* %24, align 16, !tbaa !3
  %34 = getelementptr inbounds [2 x double], [2 x double]* %3, i64 0, i64 1
  %35 = load double, double* %34, align 8, !tbaa !3
  %36 = call double @__sin(double noundef %33, double noundef %35, i32 noundef 1) #6
  %37 = fneg double %36
  br label %49

38:                                               ; preds = %23
  %39 = load double, double* %24, align 16, !tbaa !3
  %40 = getelementptr inbounds [2 x double], [2 x double]* %3, i64 0, i64 1
  %41 = load double, double* %40, align 8, !tbaa !3
  %42 = call double @__cos(double noundef %39, double noundef %41) #6
  %43 = fneg double %42
  br label %49

44:                                               ; preds = %23
  %45 = load double, double* %24, align 16, !tbaa !3
  %46 = getelementptr inbounds [2 x double], [2 x double]* %3, i64 0, i64 1
  %47 = load double, double* %46, align 8, !tbaa !3
  %48 = call double @__sin(double noundef %45, double noundef %47, i32 noundef 1) #6
  br label %49

49:                                               ; preds = %44, %38, %32, %27, %21, %16, %12
  %50 = phi double [ 1.000000e+00, %12 ], [ %18, %16 ], [ %22, %21 ], [ %48, %44 ], [ %43, %38 ], [ %37, %32 ], [ %31, %27 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %4) #4
  ret double %50
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

; Function Attrs: optsize
declare hidden double @__cos(double noundef, double noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: optsize
declare hidden i32 @__rem_pio2(double noundef, double* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden double @__sin(double noundef, double noundef, i32 noundef) local_unnamed_addr #3

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
