; ModuleID = 'src/math/ceilf.c'
source_filename = "src/math/ceilf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nounwind optsize strictfp
define float @ceilf(float noundef %0) local_unnamed_addr #0 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = bitcast float %0 to i32
  %5 = lshr i32 %4, 23
  %6 = and i32 %5, 255
  %7 = add nsw i32 %6, -127
  %8 = icmp ugt i32 %6, 149
  br i1 %8, label %34, label %9

9:                                                ; preds = %1
  %10 = icmp ugt i32 %6, 126
  br i1 %10, label %11, label %24

11:                                               ; preds = %9
  %12 = lshr i32 8388607, %7
  %13 = and i32 %12, %4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %34, label %15

15:                                               ; preds = %11
  %16 = tail call float @llvm.experimental.constrained.fadd.f32(float %0, float 0x4770000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %17 = bitcast float* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %17)
  store volatile float %16, float* %3, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %17)
  %18 = icmp slt i32 %4, 0
  %19 = ashr i32 -8388608, %7
  %20 = select i1 %18, i32 0, i32 %12
  %21 = add i32 %20, %4
  %22 = and i32 %21, %19
  %23 = bitcast i32 %22 to float
  br label %34

24:                                               ; preds = %9
  %25 = tail call float @llvm.experimental.constrained.fadd.f32(float %0, float 0x4770000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %26 = bitcast float* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %26)
  store volatile float %25, float* %2, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %26)
  %27 = icmp sgt i32 %4, -1
  br i1 %27, label %30, label %28

28:                                               ; preds = %24
  %29 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double -0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %34

30:                                               ; preds = %24
  %31 = icmp eq i32 %4, 0
  br i1 %31, label %34, label %32

32:                                               ; preds = %30
  %33 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %34

34:                                               ; preds = %15, %30, %32, %28, %11, %1
  %35 = phi float [ %0, %1 ], [ %0, %11 ], [ %23, %15 ], [ %29, %28 ], [ %33, %32 ], [ %0, %30 ]
  ret float %35
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #2

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
!4 = !{!"float", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
