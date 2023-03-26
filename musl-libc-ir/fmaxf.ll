; ModuleID = 'src/math/fmaxf.c'
source_filename = "src/math/fmaxf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define float @fmaxf(float noundef %0, float noundef %1) local_unnamed_addr #0 {
  %3 = bitcast float %0 to i32
  %4 = and i32 %3, 2147483647
  %5 = icmp ugt i32 %4, 2139095040
  br i1 %5, label %19, label %6

6:                                                ; preds = %2
  %7 = bitcast float %1 to i32
  %8 = and i32 %7, 2147483647
  %9 = icmp ugt i32 %8, 2139095040
  br i1 %9, label %19, label %10

10:                                               ; preds = %6
  %11 = xor i32 %7, %3
  %12 = icmp sgt i32 %11, -1
  br i1 %12, label %16, label %13

13:                                               ; preds = %10
  %14 = icmp slt i32 %3, 0
  %15 = select i1 %14, float %1, float %0
  br label %19

16:                                               ; preds = %10
  %17 = tail call i1 @llvm.experimental.constrained.fcmps.f32(float %0, float %1, metadata !"olt", metadata !"fpexcept.ignore") #2
  %18 = select i1 %17, float %1, float %0
  br label %19

19:                                               ; preds = %6, %2, %16, %13
  %20 = phi float [ %15, %13 ], [ %18, %16 ], [ %1, %2 ], [ %0, %6 ]
  ret float %20
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f32(float, float, metadata, metadata) #1

attributes #0 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
