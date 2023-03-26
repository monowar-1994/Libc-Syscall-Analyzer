; ModuleID = 'src/math/nextafterf.c'
source_filename = "src/math/nextafterf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nounwind optsize strictfp
define float @nextafterf(float noundef %0, float noundef %1) local_unnamed_addr #0 {
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = bitcast float %0 to i32
  %6 = and i32 %5, 2147483647
  %7 = icmp ugt i32 %6, 2139095040
  br i1 %7, label %12, label %8

8:                                                ; preds = %2
  %9 = bitcast float %1 to i32
  %10 = and i32 %9, 2147483647
  %11 = icmp ugt i32 %10, 2139095040
  br i1 %11, label %12, label %14

12:                                               ; preds = %8, %2
  %13 = tail call float @llvm.experimental.constrained.fadd.f32(float %0, float %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %43

14:                                               ; preds = %8
  %15 = icmp eq i32 %5, %9
  br i1 %15, label %43, label %16

16:                                               ; preds = %14
  %17 = icmp eq i32 %6, 0
  br i1 %17, label %18, label %23

18:                                               ; preds = %16
  %19 = icmp eq i32 %10, 0
  br i1 %19, label %43, label %20

20:                                               ; preds = %18
  %21 = and i32 %9, -2147483648
  %22 = or i32 %21, 1
  br label %32

23:                                               ; preds = %16
  %24 = icmp ule i32 %6, %10
  %25 = xor i32 %9, %5
  %26 = icmp sgt i32 %25, -1
  %27 = and i1 %24, %26
  br i1 %27, label %30, label %28

28:                                               ; preds = %23
  %29 = add i32 %5, -1
  br label %32

30:                                               ; preds = %23
  %31 = add i32 %5, 1
  br label %32

32:                                               ; preds = %28, %30, %20
  %33 = phi i32 [ %22, %20 ], [ %29, %28 ], [ %31, %30 ]
  %34 = bitcast i32 %33 to float
  %35 = and i32 %33, 2139095040
  switch i32 %35, label %43 [
    i32 2139095040, label %36
    i32 0, label %39
  ]

36:                                               ; preds = %32
  %37 = tail call float @llvm.experimental.constrained.fadd.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %38 = bitcast float* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %38)
  store volatile float %37, float* %4, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %38)
  br label %43

39:                                               ; preds = %32
  %40 = tail call float @llvm.experimental.constrained.fmul.f32(float %34, float %34, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %41 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %0, float %0, float %40, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %42 = bitcast float* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %42)
  store volatile float %41, float* %3, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %42)
  br label %43

43:                                               ; preds = %36, %39, %32, %18, %14, %12
  %44 = phi float [ %13, %12 ], [ %1, %14 ], [ %1, %18 ], [ %34, %32 ], [ %34, %39 ], [ %34, %36 ]
  ret float %44
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmuladd.f32(float, float, float, metadata, metadata) #2

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
