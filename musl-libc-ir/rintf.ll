; ModuleID = 'src/math/rintf.c'
source_filename = "src/math/rintf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define float @rintf(float noundef %0) local_unnamed_addr #0 {
  %2 = bitcast float %0 to i32
  %3 = and i32 %2, 2130706432
  %4 = icmp ugt i32 %3, 1249902592
  br i1 %4, label %19, label %5

5:                                                ; preds = %1
  %6 = icmp sgt i32 %2, -1
  br i1 %6, label %10, label %7

7:                                                ; preds = %5
  %8 = tail call float @llvm.experimental.constrained.fsub.f32(float %0, float 0x4160000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %9 = tail call float @llvm.experimental.constrained.fadd.f32(float %8, float 0x4160000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %13

10:                                               ; preds = %5
  %11 = tail call float @llvm.experimental.constrained.fadd.f32(float %0, float 0x4160000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %12 = tail call float @llvm.experimental.constrained.fsub.f32(float %11, float 0x4160000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %13

13:                                               ; preds = %10, %7
  %14 = phi float [ 0.000000e+00, %10 ], [ -0.000000e+00, %7 ]
  %15 = phi float [ %12, %10 ], [ %9, %7 ]
  %16 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %17 = tail call i1 @llvm.experimental.constrained.fcmp.f32(float %15, float %16, metadata !"oeq", metadata !"fpexcept.ignore") #2
  %18 = select i1 %17, float %14, float %15
  br label %19

19:                                               ; preds = %13, %1
  %20 = phi float [ %0, %1 ], [ %18, %13 ]
  ret float %20
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f32(float, float, metadata, metadata) #1

attributes #0 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
