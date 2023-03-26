; ModuleID = 'src/math/ilogbf.c'
source_filename = "src/math/ilogbf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nounwind optsize strictfp
define i32 @ilogbf(float noundef %0) local_unnamed_addr #0 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = bitcast float %0 to i32
  %5 = lshr i32 %4, 23
  %6 = trunc i32 %5 to i8
  switch i8 %6, label %29 [
    i8 0, label %7
    i8 -1, label %22
  ]

7:                                                ; preds = %1
  %8 = shl i32 %4, 9
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %12, label %10

10:                                               ; preds = %7
  %11 = icmp sgt i32 %8, -1
  br i1 %11, label %16, label %32

12:                                               ; preds = %7
  %13 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.strict") #3
  %14 = tail call float @llvm.experimental.constrained.fdiv.f32(float %13, float 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.strict") #3
  %15 = bitcast float* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %15)
  store volatile float %14, float* %3, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %15)
  br label %32

16:                                               ; preds = %10, %16
  %17 = phi i32 [ %19, %16 ], [ -127, %10 ]
  %18 = phi i32 [ %20, %16 ], [ %8, %10 ]
  %19 = add nsw i32 %17, -1
  %20 = shl nuw i32 %18, 1
  %21 = icmp sgt i32 %20, -1
  br i1 %21, label %16, label %32

22:                                               ; preds = %1
  %23 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.strict") #3
  %24 = tail call float @llvm.experimental.constrained.fdiv.f32(float %23, float 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.strict") #3
  %25 = bitcast float* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %25)
  store volatile float %24, float* %2, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %25)
  %26 = and i32 %4, 8388607
  %27 = icmp eq i32 %26, 0
  %28 = select i1 %27, i32 2147483647, i32 -2147483648
  br label %32

29:                                               ; preds = %1
  %30 = and i32 %5, 255
  %31 = add nsw i32 %30, -127
  br label %32

32:                                               ; preds = %16, %10, %29, %22, %12
  %33 = phi i32 [ %28, %22 ], [ %31, %29 ], [ -2147483648, %12 ], [ -127, %10 ], [ %19, %16 ]
  ret i32 %33
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #2

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
