; ModuleID = 'src/math/cosh.c'
source_filename = "src/math/cosh.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define double @cosh(double noundef %0) local_unnamed_addr #0 {
  %2 = alloca double, align 8
  %3 = bitcast double %0 to i64
  %4 = and i64 %3, 9223372036854775807
  %5 = bitcast i64 %4 to double
  %6 = lshr i64 %4, 32
  %7 = trunc i64 %6 to i32
  %8 = icmp ult i32 %7, 1072049730
  br i1 %8, label %9, label %26

9:                                                ; preds = %1
  %10 = icmp ult i32 %7, 1045430272
  br i1 %10, label %11, label %16

11:                                               ; preds = %9
  %12 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x4770000000000000, metadata !"fpexcept.ignore") #4
  %13 = tail call double @llvm.experimental.constrained.fadd.f64(double %5, double %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %14 = bitcast double* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %14)
  store volatile double %13, double* %2, align 8, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %14)
  %15 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %36

16:                                               ; preds = %9
  %17 = tail call double @expm1(double noundef %5) #5
  %18 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %19 = tail call double @llvm.experimental.constrained.fmul.f64(double %17, double %17, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %20 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %21 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %22 = tail call double @llvm.experimental.constrained.fadd.f64(double %21, double %17, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %23 = tail call double @llvm.experimental.constrained.fmul.f64(double %20, double %22, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %24 = tail call double @llvm.experimental.constrained.fdiv.f64(double %19, double %23, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %25 = tail call double @llvm.experimental.constrained.fadd.f64(double %18, double %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %36

26:                                               ; preds = %1
  %27 = icmp ult i32 %7, 1082535490
  br i1 %27, label %28, label %34

28:                                               ; preds = %26
  %29 = tail call double @exp(double noundef %5) #5
  %30 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %31 = tail call double @llvm.experimental.constrained.fdiv.f64(double %30, double %29, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %32 = tail call double @llvm.experimental.constrained.fadd.f64(double %29, double %31, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %33 = tail call double @llvm.experimental.constrained.fmul.f64(double 5.000000e-01, double %32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %36

34:                                               ; preds = %26
  %35 = tail call double @__expo2(double noundef %5, double noundef 1.000000e+00) #5
  br label %36

36:                                               ; preds = %34, %28, %16, %11
  %37 = phi double [ %15, %11 ], [ %25, %16 ], [ %33, %28 ], [ %35, %34 ]
  ret double %37
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #2

; Function Attrs: optsize
declare double @expm1(double noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #2

; Function Attrs: optsize
declare double @exp(double noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden double @__expo2(double noundef, double noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
