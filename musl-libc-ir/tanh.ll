; ModuleID = 'src/math/tanh.c'
source_filename = "src/math/tanh.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define double @tanh(double noundef %0) local_unnamed_addr #0 {
  %2 = alloca float, align 4
  %3 = bitcast double %0 to i64
  %4 = and i64 %3, 9223372036854775807
  %5 = bitcast i64 %4 to double
  %6 = lshr i64 %4, 32
  %7 = trunc i64 %6 to i32
  %8 = icmp ugt i32 %7, 1071748074
  br i1 %8, label %9, label %26

9:                                                ; preds = %1
  %10 = icmp ugt i32 %7, 1077149696
  br i1 %10, label %11, label %16

11:                                               ; preds = %9
  %12 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %13 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %14 = tail call double @llvm.experimental.constrained.fdiv.f64(double %13, double %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %15 = tail call double @llvm.experimental.constrained.fsub.f64(double %12, double %14, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %48

16:                                               ; preds = %9
  %17 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %18 = tail call double @llvm.experimental.constrained.fmul.f64(double %17, double %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %19 = tail call double @expm1(double noundef %18) #5
  %20 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %21 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %22 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %23 = tail call double @llvm.experimental.constrained.fadd.f64(double %19, double %22, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %24 = tail call double @llvm.experimental.constrained.fdiv.f64(double %21, double %23, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %25 = tail call double @llvm.experimental.constrained.fsub.f64(double %20, double %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %48

26:                                               ; preds = %1
  %27 = icmp ugt i32 %7, 1070618798
  br i1 %27, label %28, label %35

28:                                               ; preds = %26
  %29 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %30 = tail call double @llvm.experimental.constrained.fmul.f64(double %29, double %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %31 = tail call double @expm1(double noundef %30) #5
  %32 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %33 = tail call double @llvm.experimental.constrained.fadd.f64(double %31, double %32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %34 = tail call double @llvm.experimental.constrained.fdiv.f64(double %31, double %33, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %48

35:                                               ; preds = %26
  %36 = icmp ugt i32 %7, 1048575
  br i1 %36, label %37, label %45

37:                                               ; preds = %35
  %38 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 -2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %39 = tail call double @llvm.experimental.constrained.fmul.f64(double %38, double %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %40 = tail call double @expm1(double noundef %39) #5
  %41 = fneg double %40
  %42 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %43 = tail call double @llvm.experimental.constrained.fadd.f64(double %40, double %42, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %44 = tail call double @llvm.experimental.constrained.fdiv.f64(double %41, double %43, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %48

45:                                               ; preds = %35
  %46 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %47 = bitcast float* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %47)
  store volatile float %46, float* %2, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %47)
  br label %48

48:                                               ; preds = %28, %45, %37, %11, %16
  %49 = phi double [ %15, %11 ], [ %25, %16 ], [ %34, %28 ], [ %44, %37 ], [ %5, %45 ]
  %50 = fneg double %49
  %51 = icmp slt i64 %3, 0
  %52 = select i1 %51, double %50, double %49
  ret double %52
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: optsize
declare double @expm1(double noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #2

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
