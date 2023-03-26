; ModuleID = 'src/math/floor.c'
source_filename = "src/math/floor.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nounwind optsize strictfp
define double @floor(double noundef %0) local_unnamed_addr #0 {
  %2 = alloca double, align 8
  %3 = bitcast double %0 to i64
  %4 = lshr i64 %3, 52
  %5 = trunc i64 %4 to i32
  %6 = and i32 %5, 2047
  %7 = icmp ugt i32 %6, 1074
  br i1 %7, label %35, label %8

8:                                                ; preds = %1
  %9 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %10 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %0, double %9, metadata !"oeq", metadata !"fpexcept.ignore") #3
  br i1 %10, label %35, label %11

11:                                               ; preds = %8
  %12 = icmp sgt i64 %3, -1
  br i1 %12, label %16, label %13

13:                                               ; preds = %11
  %14 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double 0x4330000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %15 = tail call double @llvm.experimental.constrained.fadd.f64(double %14, double 0x4330000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %19

16:                                               ; preds = %11
  %17 = tail call double @llvm.experimental.constrained.fadd.f64(double %0, double 0x4330000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %18 = tail call double @llvm.experimental.constrained.fsub.f64(double %17, double 0x4330000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %19

19:                                               ; preds = %16, %13
  %20 = phi double [ %18, %16 ], [ %15, %13 ]
  %21 = tail call double @llvm.experimental.constrained.fsub.f64(double %20, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %22 = icmp ult i32 %6, 1023
  br i1 %22, label %23, label %28

23:                                               ; preds = %19
  %24 = bitcast double* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %24)
  store volatile double %21, double* %2, align 8, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %24)
  %25 = xor i1 %12, true
  %26 = sext i1 %25 to i32
  %27 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %26, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %35

28:                                               ; preds = %19
  %29 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %30 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %21, double %29, metadata !"ogt", metadata !"fpexcept.ignore") #3
  %31 = tail call double @llvm.experimental.constrained.fadd.f64(double %0, double %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br i1 %30, label %32, label %35

32:                                               ; preds = %28
  %33 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %34 = tail call double @llvm.experimental.constrained.fsub.f64(double %31, double %33, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %35

35:                                               ; preds = %28, %1, %8, %32, %23
  %36 = phi double [ %27, %23 ], [ %34, %32 ], [ %0, %8 ], [ %0, %1 ], [ %31, %28 ]
  ret double %36
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

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
