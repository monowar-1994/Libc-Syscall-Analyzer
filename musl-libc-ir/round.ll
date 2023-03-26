; ModuleID = 'src/math/round.c'
source_filename = "src/math/round.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nounwind optsize strictfp
define double @round(double noundef %0) local_unnamed_addr #0 {
  %2 = alloca double, align 8
  %3 = bitcast double %0 to i64
  %4 = lshr i64 %3, 52
  %5 = trunc i64 %4 to i32
  %6 = and i32 %5, 2047
  %7 = icmp ugt i32 %6, 1074
  br i1 %7, label %36, label %8

8:                                                ; preds = %1
  %9 = icmp sgt i64 %3, -1
  %10 = fneg double %0
  %11 = select i1 %9, double %0, double %10
  %12 = icmp ult i32 %6, 1022
  %13 = tail call double @llvm.experimental.constrained.fadd.f64(double %11, double 0x4330000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br i1 %12, label %14, label %18

14:                                               ; preds = %8
  %15 = bitcast double* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %15)
  store volatile double %13, double* %2, align 8, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %15)
  %16 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %17 = tail call double @llvm.experimental.constrained.fmul.f64(double %16, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %36

18:                                               ; preds = %8
  %19 = tail call double @llvm.experimental.constrained.fsub.f64(double %13, double 0x4330000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %20 = tail call double @llvm.experimental.constrained.fsub.f64(double %19, double %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %21 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %20, double 5.000000e-01, metadata !"ogt", metadata !"fpexcept.ignore") #3
  br i1 %21, label %22, label %26

22:                                               ; preds = %18
  %23 = tail call double @llvm.experimental.constrained.fadd.f64(double %20, double %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %24 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %25 = tail call double @llvm.experimental.constrained.fsub.f64(double %23, double %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %32

26:                                               ; preds = %18
  %27 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %20, double -5.000000e-01, metadata !"ole", metadata !"fpexcept.ignore") #3
  %28 = tail call double @llvm.experimental.constrained.fadd.f64(double %20, double %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br i1 %27, label %29, label %32

29:                                               ; preds = %26
  %30 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %31 = tail call double @llvm.experimental.constrained.fadd.f64(double %28, double %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %32

32:                                               ; preds = %26, %29, %22
  %33 = phi double [ %25, %22 ], [ %31, %29 ], [ %28, %26 ]
  %34 = fneg double %33
  %35 = select i1 %9, double %33, double %34
  br label %36

36:                                               ; preds = %1, %32, %14
  %37 = phi double [ %17, %14 ], [ %35, %32 ], [ %0, %1 ]
  ret double %37
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f64(double, double, metadata, metadata) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nofree nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
