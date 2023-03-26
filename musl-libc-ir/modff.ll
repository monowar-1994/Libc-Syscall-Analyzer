; ModuleID = 'src/math/modff.c'
source_filename = "src/math/modff.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define float @modff(float noundef %0, float* nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = bitcast float %0 to i32
  %4 = lshr i32 %3, 23
  %5 = and i32 %4, 255
  %6 = add nsw i32 %5, -127
  %7 = icmp ugt i32 %5, 149
  br i1 %7, label %8, label %16

8:                                                ; preds = %2
  store float %0, float* %1, align 4, !tbaa !3
  %9 = icmp ne i32 %6, 128
  %10 = and i32 %3, 8388607
  %11 = icmp eq i32 %10, 0
  %12 = or i1 %11, %9
  br i1 %12, label %13, label %34

13:                                               ; preds = %8
  %14 = and i32 %3, -2147483648
  %15 = bitcast i32 %14 to float
  br label %34

16:                                               ; preds = %2
  %17 = icmp ult i32 %5, 127
  br i1 %17, label %18, label %21

18:                                               ; preds = %16
  %19 = and i32 %3, -2147483648
  %20 = bitcast float* %1 to i32*
  store i32 %19, i32* %20, align 4, !tbaa !3
  br label %34

21:                                               ; preds = %16
  %22 = lshr i32 8388607, %6
  %23 = and i32 %22, %3
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %28

25:                                               ; preds = %21
  store float %0, float* %1, align 4, !tbaa !3
  %26 = and i32 %3, -2147483648
  %27 = bitcast i32 %26 to float
  br label %34

28:                                               ; preds = %21
  %29 = ashr i32 -8388608, %6
  %30 = and i32 %29, %3
  %31 = bitcast i32 %30 to float
  %32 = bitcast float* %1 to i32*
  store i32 %30, i32* %32, align 4, !tbaa !3
  %33 = tail call float @llvm.experimental.constrained.fsub.f32(float %0, float %31, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %34

34:                                               ; preds = %8, %28, %25, %18, %13
  %35 = phi float [ %15, %13 ], [ %0, %18 ], [ %27, %25 ], [ %33, %28 ], [ %0, %8 ]
  ret float %35
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #1

attributes #0 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"float", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
