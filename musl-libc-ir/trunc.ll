; ModuleID = 'src/math/trunc.c'
source_filename = "src/math/trunc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nounwind optsize strictfp
define double @trunc(double noundef %0) local_unnamed_addr #0 {
  %2 = alloca double, align 8
  %3 = bitcast double %0 to i64
  %4 = lshr i64 %3, 52
  %5 = trunc i64 %4 to i32
  %6 = and i32 %5, 2047
  %7 = icmp ugt i32 %6, 1074
  br i1 %7, label %23, label %8

8:                                                ; preds = %1
  %9 = add nsw i32 %6, -1011
  %10 = icmp ult i32 %6, 1023
  %11 = select i1 %10, i32 1, i32 %9
  %12 = zext i32 %11 to i64
  %13 = lshr i64 -1, %12
  %14 = and i64 %13, %3
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %23, label %16

16:                                               ; preds = %8
  %17 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x4770000000000000, metadata !"fpexcept.ignore") #3
  %18 = tail call double @llvm.experimental.constrained.fadd.f64(double %0, double %17, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %19 = bitcast double* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %19)
  store volatile double %18, double* %2, align 8, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %19)
  %20 = xor i64 %13, -1
  %21 = and i64 %20, %3
  %22 = bitcast i64 %21 to double
  br label %23

23:                                               ; preds = %8, %1, %16
  %24 = phi double [ %22, %16 ], [ %0, %1 ], [ %0, %8 ]
  ret double %24
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

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
