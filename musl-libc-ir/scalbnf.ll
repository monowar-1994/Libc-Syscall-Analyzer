; ModuleID = 'src/math/scalbnf.c'
source_filename = "src/math/scalbnf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define float @scalbnf(float noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %1, 127
  br i1 %3, label %4, label %13

4:                                                ; preds = %2
  %5 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float 0x47E0000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %6 = add nsw i32 %1, -127
  %7 = icmp ugt i32 %1, 254
  br i1 %7, label %8, label %24

8:                                                ; preds = %4
  %9 = tail call float @llvm.experimental.constrained.fmul.f32(float %5, float 0x47E0000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %10 = icmp ult i32 %1, 381
  %11 = select i1 %10, i32 %1, i32 381
  %12 = add nsw i32 %11, -254
  br label %24

13:                                               ; preds = %2
  %14 = icmp slt i32 %1, -126
  br i1 %14, label %15, label %24

15:                                               ; preds = %13
  %16 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float 0x3990000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %17 = add nuw nsw i32 %1, 102
  %18 = icmp ult i32 %1, -228
  br i1 %18, label %19, label %24

19:                                               ; preds = %15
  %20 = tail call float @llvm.experimental.constrained.fmul.f32(float %16, float 0x3990000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %21 = icmp ugt i32 %1, -330
  %22 = select i1 %21, i32 %1, i32 -330
  %23 = add nuw nsw i32 %22, 204
  br label %24

24:                                               ; preds = %13, %19, %15, %4, %8
  %25 = phi i32 [ %12, %8 ], [ %6, %4 ], [ %23, %19 ], [ %17, %15 ], [ %1, %13 ]
  %26 = phi float [ %9, %8 ], [ %5, %4 ], [ %20, %19 ], [ %16, %15 ], [ %0, %13 ]
  %27 = shl nsw i32 %25, 23
  %28 = add i32 %27, 1065353216
  %29 = bitcast i32 %28 to float
  %30 = tail call float @llvm.experimental.constrained.fmul.f32(float %26, float %29, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  ret float %30
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #1

attributes #0 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
