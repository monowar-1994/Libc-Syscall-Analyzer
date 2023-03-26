; ModuleID = 'src/math/asinh.c'
source_filename = "src/math/asinh.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define double @asinh(double noundef %0) local_unnamed_addr #0 {
  %2 = alloca double, align 8
  %3 = bitcast double %0 to i64
  %4 = lshr i64 %3, 52
  %5 = trunc i64 %4 to i32
  %6 = and i32 %5, 2047
  %7 = and i64 %3, 9223372036854775807
  %8 = bitcast i64 %7 to double
  %9 = icmp ugt i32 %6, 1048
  br i1 %9, label %10, label %13

10:                                               ; preds = %1
  %11 = tail call double @log(double noundef %8) #4
  %12 = tail call double @llvm.experimental.constrained.fadd.f64(double %11, double 0x3FE62E42FEFA39EF, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %41

13:                                               ; preds = %1
  %14 = icmp ugt i32 %6, 1023
  br i1 %14, label %15, label %25

15:                                               ; preds = %13
  %16 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %17 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %18 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %19 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %8, double %8, double %18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %20 = tail call double @sqrt(double noundef %19) #4
  %21 = tail call double @llvm.experimental.constrained.fadd.f64(double %20, double %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %22 = tail call double @llvm.experimental.constrained.fdiv.f64(double %17, double %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %23 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %16, double %8, double %22, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %24 = tail call double @log(double noundef %23) #4
  br label %41

25:                                               ; preds = %13
  %26 = icmp ugt i32 %6, 996
  br i1 %26, label %27, label %37

27:                                               ; preds = %25
  %28 = tail call double @llvm.experimental.constrained.fmul.f64(double %8, double %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %29 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %30 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %8, double %8, double %29, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %31 = tail call double @sqrt(double noundef %30) #4
  %32 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %33 = tail call double @llvm.experimental.constrained.fadd.f64(double %31, double %32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %34 = tail call double @llvm.experimental.constrained.fdiv.f64(double %28, double %33, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %35 = tail call double @llvm.experimental.constrained.fadd.f64(double %8, double %34, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %36 = tail call double @log1p(double noundef %35) #4
  br label %41

37:                                               ; preds = %25
  %38 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x4770000000000000, metadata !"fpexcept.ignore") #5
  %39 = tail call double @llvm.experimental.constrained.fadd.f64(double %8, double %38, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %40 = bitcast double* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %40)
  store volatile double %39, double* %2, align 8, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %40)
  br label %41

41:                                               ; preds = %15, %37, %27, %10
  %42 = phi double [ %12, %10 ], [ %24, %15 ], [ %36, %27 ], [ %8, %37 ]
  %43 = fneg double %42
  %44 = icmp slt i64 %3, 0
  %45 = select i1 %44, double %43, double %42
  ret double %45
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare double @log(double noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #3

; Function Attrs: optsize
declare double @sqrt(double noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #3

; Function Attrs: optsize
declare double @log1p(double noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
