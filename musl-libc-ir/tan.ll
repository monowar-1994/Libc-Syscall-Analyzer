; ModuleID = 'src/math/tan.c'
source_filename = "src/math/tan.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define double @tan(double noundef %0) local_unnamed_addr #0 {
  %2 = alloca double, align 8
  %3 = alloca [2 x double], align 16
  %4 = bitcast [2 x double]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %4) #4
  %5 = bitcast double %0 to i64
  %6 = lshr i64 %5, 32
  %7 = trunc i64 %6 to i32
  %8 = and i32 %7, 2147483647
  %9 = icmp ult i32 %8, 1072243196
  br i1 %9, label %10, label %24

10:                                               ; preds = %1
  %11 = icmp ult i32 %8, 1044381696
  br i1 %11, label %12, label %22

12:                                               ; preds = %10
  %13 = icmp ult i32 %8, 1048576
  %14 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x4770000000000000, metadata !"fpexcept.ignore") #5
  br i1 %13, label %15, label %17

15:                                               ; preds = %12
  %16 = tail call double @llvm.experimental.constrained.fdiv.f64(double %0, double %14, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %19

17:                                               ; preds = %12
  %18 = tail call double @llvm.experimental.constrained.fadd.f64(double %0, double %14, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %19

19:                                               ; preds = %17, %15
  %20 = phi double [ %16, %15 ], [ %18, %17 ]
  %21 = bitcast double* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %21)
  store volatile double %20, double* %2, align 8, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %21)
  br label %36

22:                                               ; preds = %10
  %23 = tail call double @__tan(double noundef %0, double noundef 0.000000e+00, i32 noundef 0) #6
  br label %36

24:                                               ; preds = %1
  %25 = icmp ugt i32 %8, 2146435071
  br i1 %25, label %26, label %28

26:                                               ; preds = %24
  %27 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %36

28:                                               ; preds = %24
  %29 = getelementptr inbounds [2 x double], [2 x double]* %3, i64 0, i64 0
  %30 = call i32 @__rem_pio2(double noundef %0, double* noundef nonnull %29) #6
  %31 = load double, double* %29, align 16, !tbaa !3
  %32 = getelementptr inbounds [2 x double], [2 x double]* %3, i64 0, i64 1
  %33 = load double, double* %32, align 8, !tbaa !3
  %34 = and i32 %30, 1
  %35 = call double @__tan(double noundef %31, double noundef %33, i32 noundef %34) #6
  br label %36

36:                                               ; preds = %28, %26, %22, %19
  %37 = phi double [ %0, %19 ], [ %23, %22 ], [ %27, %26 ], [ %35, %28 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %4) #4
  ret double %37
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
declare hidden double @__tan(double noundef, double noundef, i32 noundef) local_unnamed_addr #3

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
