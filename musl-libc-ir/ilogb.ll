; ModuleID = 'src/math/ilogb.c'
source_filename = "src/math/ilogb.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nounwind optsize strictfp
define i32 @ilogb(double noundef %0) local_unnamed_addr #0 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = bitcast double %0 to i64
  %5 = lshr i64 %4, 52
  %6 = trunc i64 %5 to i32
  %7 = and i32 %6, 2047
  switch i32 %7, label %30 [
    i32 0, label %8
    i32 2047, label %23
  ]

8:                                                ; preds = %1
  %9 = shl i64 %4, 12
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %13, label %11

11:                                               ; preds = %8
  %12 = icmp sgt i64 %9, -1
  br i1 %12, label %17, label %32

13:                                               ; preds = %8
  %14 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.strict") #3
  %15 = tail call float @llvm.experimental.constrained.fdiv.f32(float %14, float 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.strict") #3
  %16 = bitcast float* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %16)
  store volatile float %15, float* %3, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %16)
  br label %32

17:                                               ; preds = %11, %17
  %18 = phi i32 [ %20, %17 ], [ -1023, %11 ]
  %19 = phi i64 [ %21, %17 ], [ %9, %11 ]
  %20 = add nsw i32 %18, -1
  %21 = shl nuw i64 %19, 1
  %22 = icmp sgt i64 %21, -1
  br i1 %22, label %17, label %32

23:                                               ; preds = %1
  %24 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.strict") #3
  %25 = tail call float @llvm.experimental.constrained.fdiv.f32(float %24, float 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.strict") #3
  %26 = bitcast float* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %26)
  store volatile float %25, float* %2, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %26)
  %27 = and i64 %4, 4503599627370495
  %28 = icmp eq i64 %27, 0
  %29 = select i1 %28, i32 2147483647, i32 -2147483648
  br label %32

30:                                               ; preds = %1
  %31 = add nsw i32 %7, -1023
  br label %32

32:                                               ; preds = %17, %11, %30, %23, %13
  %33 = phi i32 [ %29, %23 ], [ %31, %30 ], [ -2147483648, %13 ], [ -1023, %11 ], [ %20, %17 ]
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
