; ModuleID = 'src/math/scalbf.c'
source_filename = "src/math/scalbf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define float @scalbf(float noundef %0, float noundef %1) local_unnamed_addr #0 {
  %3 = bitcast float %0 to i32
  %4 = and i32 %3, 2147483647
  %5 = icmp ugt i32 %4, 2139095040
  br i1 %5, label %10, label %6

6:                                                ; preds = %2
  %7 = bitcast float %1 to i32
  %8 = and i32 %7, 2147483647
  %9 = icmp ugt i32 %8, 2139095040
  br i1 %9, label %10, label %12

10:                                               ; preds = %6, %2
  %11 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %41

12:                                               ; preds = %6
  %13 = and i32 %7, 2139095040
  %14 = icmp eq i32 %13, 2139095040
  br i1 %14, label %15, label %22

15:                                               ; preds = %12
  %16 = tail call i1 @llvm.experimental.constrained.fcmps.f32(float %1, float 0.000000e+00, metadata !"ogt", metadata !"fpexcept.ignore") #3
  br i1 %16, label %17, label %19

17:                                               ; preds = %15
  %18 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %41

19:                                               ; preds = %15
  %20 = fneg float %1
  %21 = tail call float @llvm.experimental.constrained.fdiv.f32(float %0, float %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %41

22:                                               ; preds = %12
  %23 = tail call float @rintf(float noundef %1) #4
  %24 = tail call i1 @llvm.experimental.constrained.fcmp.f32(float %23, float %1, metadata !"une", metadata !"fpexcept.ignore") #3
  br i1 %24, label %25, label %29

25:                                               ; preds = %22
  %26 = tail call float @llvm.experimental.constrained.fsub.f32(float %1, float %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %27 = tail call float @llvm.experimental.constrained.fsub.f32(float %1, float %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = tail call float @llvm.experimental.constrained.fdiv.f32(float %26, float %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %41

29:                                               ; preds = %22
  %30 = tail call i1 @llvm.experimental.constrained.fcmps.f32(float %1, float 6.500000e+04, metadata !"ogt", metadata !"fpexcept.ignore") #3
  br i1 %30, label %31, label %33

31:                                               ; preds = %29
  %32 = tail call float @scalbnf(float noundef %0, i32 noundef 65000) #4
  br label %41

33:                                               ; preds = %29
  %34 = fneg float %1
  %35 = tail call i1 @llvm.experimental.constrained.fcmps.f32(float %34, float 6.500000e+04, metadata !"ogt", metadata !"fpexcept.ignore") #3
  br i1 %35, label %36, label %38

36:                                               ; preds = %33
  %37 = tail call float @scalbnf(float noundef %0, i32 noundef -65000) #4
  br label %41

38:                                               ; preds = %33
  %39 = tail call i32 @llvm.experimental.constrained.fptosi.i32.f32(float %1, metadata !"fpexcept.ignore") #3
  %40 = tail call float @scalbnf(float noundef %0, i32 noundef %39) #4
  br label %41

41:                                               ; preds = %38, %36, %31, %25, %19, %17, %10
  %42 = phi float [ %11, %10 ], [ %28, %25 ], [ %32, %31 ], [ %37, %36 ], [ %40, %38 ], [ %18, %17 ], [ %21, %19 ]
  ret float %42
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #1

; Function Attrs: optsize
declare float @rintf(float noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #1

; Function Attrs: optsize
declare float @scalbnf(float noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i32 @llvm.experimental.constrained.fptosi.i32.f32(float, metadata) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
