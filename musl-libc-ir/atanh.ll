; ModuleID = 'src/math/atanh.c'
source_filename = "src/math/atanh.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define double @atanh(double noundef %0) local_unnamed_addr #0 {
  %2 = alloca float, align 4
  %3 = bitcast double %0 to i64
  %4 = lshr i64 %3, 52
  %5 = trunc i64 %4 to i32
  %6 = and i32 %5, 2047
  %7 = and i64 %3, 9223372036854775807
  %8 = bitcast i64 %7 to double
  %9 = icmp ult i32 %6, 1022
  br i1 %9, label %10, label %28

10:                                               ; preds = %1
  %11 = icmp ult i32 %6, 991
  br i1 %11, label %12, label %17

12:                                               ; preds = %10
  %13 = icmp eq i32 %6, 0
  br i1 %13, label %14, label %36

14:                                               ; preds = %12
  %15 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %16 = bitcast float* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %16)
  store volatile float %15, float* %2, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %16)
  br label %36

17:                                               ; preds = %10
  %18 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %19 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %20 = tail call double @llvm.experimental.constrained.fmul.f64(double %19, double %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %21 = tail call double @llvm.experimental.constrained.fmul.f64(double %20, double %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %22 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %23 = tail call double @llvm.experimental.constrained.fsub.f64(double %22, double %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %24 = tail call double @llvm.experimental.constrained.fdiv.f64(double %21, double %23, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %25 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %18, double %8, double %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %26 = tail call double @log1p(double noundef %25) #5
  %27 = tail call double @llvm.experimental.constrained.fmul.f64(double 5.000000e-01, double %26, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %36

28:                                               ; preds = %1
  %29 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %30 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %31 = tail call double @llvm.experimental.constrained.fsub.f64(double %30, double %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %32 = tail call double @llvm.experimental.constrained.fdiv.f64(double %8, double %31, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %33 = tail call double @llvm.experimental.constrained.fmul.f64(double %29, double %32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %34 = tail call double @log1p(double noundef %33) #5
  %35 = tail call double @llvm.experimental.constrained.fmul.f64(double 5.000000e-01, double %34, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %36

36:                                               ; preds = %17, %14, %12, %28
  %37 = phi double [ %8, %14 ], [ %8, %12 ], [ %27, %17 ], [ %35, %28 ]
  %38 = fneg double %37
  %39 = icmp slt i64 %3, 0
  %40 = select i1 %39, double %38, double %37
  ret double %40
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #2

; Function Attrs: optsize
declare double @log1p(double noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #2

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
!4 = !{!"float", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
