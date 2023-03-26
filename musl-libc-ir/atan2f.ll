; ModuleID = 'src/math/atan2f.c'
source_filename = "src/math/atan2f.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@switch.table.atan2f = private unnamed_addr constant [4 x float] [float 0.000000e+00, float -0.000000e+00, float 0x400921FB60000000, float 0xC00921FB60000000], align 4

; Function Attrs: nounwind optsize strictfp
define float @atan2f(float noundef %0, float noundef %1) local_unnamed_addr #0 {
  %3 = bitcast float %1 to i32
  %4 = and i32 %3, 2147483647
  %5 = icmp ugt i32 %4, 2139095040
  br i1 %5, label %10, label %6

6:                                                ; preds = %2
  %7 = bitcast float %0 to i32
  %8 = and i32 %7, 2147483647
  %9 = icmp ugt i32 %8, 2139095040
  br i1 %9, label %10, label %12

10:                                               ; preds = %6, %2
  %11 = tail call float @llvm.experimental.constrained.fadd.f32(float %1, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %91

12:                                               ; preds = %6
  %13 = icmp eq i32 %3, 1065353216
  br i1 %13, label %14, label %16

14:                                               ; preds = %12
  %15 = tail call float @atanf(float noundef %0) #4
  br label %91

16:                                               ; preds = %12
  %17 = lshr i32 %7, 31
  %18 = lshr i32 %3, 30
  %19 = and i32 %18, 2
  %20 = or i32 %19, %17
  %21 = icmp eq i32 %8, 0
  br i1 %21, label %22, label %26

22:                                               ; preds = %16
  switch i32 %20, label %25 [
    i32 0, label %91
    i32 1, label %91
    i32 2, label %23
    i32 3, label %24
  ]

23:                                               ; preds = %22
  br label %91

24:                                               ; preds = %22
  br label %91

25:                                               ; preds = %22
  unreachable

26:                                               ; preds = %16
  switch i32 %4, label %54 [
    i32 0, label %27
    i32 2139095040, label %34
  ]

27:                                               ; preds = %26
  %28 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %29 = tail call float @llvm.experimental.constrained.fdiv.f32(float 0xC00921FB60000000, float %28, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %30 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %31 = tail call float @llvm.experimental.constrained.fdiv.f32(float 0x400921FB60000000, float %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %32 = icmp slt i32 %7, 0
  %33 = select i1 %32, float %29, float %31
  br label %91

34:                                               ; preds = %26
  %35 = icmp eq i32 %8, 2139095040
  br i1 %35, label %36, label %87

36:                                               ; preds = %34
  switch i32 %20, label %53 [
    i32 0, label %37
    i32 1, label %40
    i32 2, label %43
    i32 3, label %48
  ]

37:                                               ; preds = %36
  %38 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %39 = tail call float @llvm.experimental.constrained.fdiv.f32(float 0x400921FB60000000, float %38, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %91

40:                                               ; preds = %36
  %41 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %42 = tail call float @llvm.experimental.constrained.fdiv.f32(float 0xC00921FB60000000, float %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %91

43:                                               ; preds = %36
  %44 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %45 = tail call float @llvm.experimental.constrained.fmul.f32(float %44, float 0x400921FB60000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %46 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %47 = tail call float @llvm.experimental.constrained.fdiv.f32(float %45, float %46, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %91

48:                                               ; preds = %36
  %49 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 -3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %50 = tail call float @llvm.experimental.constrained.fmul.f32(float %49, float 0x400921FB60000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %51 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %52 = tail call float @llvm.experimental.constrained.fdiv.f32(float %50, float %51, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %91

53:                                               ; preds = %36
  unreachable

54:                                               ; preds = %26
  %55 = add nuw i32 %4, 218103808
  %56 = icmp ult i32 %55, %8
  %57 = icmp eq i32 %8, 2139095040
  %58 = or i1 %57, %56
  br i1 %58, label %59, label %66

59:                                               ; preds = %54
  %60 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %61 = tail call float @llvm.experimental.constrained.fdiv.f32(float 0xC00921FB60000000, float %60, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %62 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %63 = tail call float @llvm.experimental.constrained.fdiv.f32(float 0x400921FB60000000, float %62, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %64 = icmp slt i32 %7, 0
  %65 = select i1 %64, float %61, float %63
  br label %91

66:                                               ; preds = %54
  %67 = icmp ne i32 %19, 0
  %68 = add nuw i32 %8, 218103808
  %69 = icmp ult i32 %68, %4
  %70 = select i1 %67, i1 %69, i1 false
  br i1 %70, label %71, label %73

71:                                               ; preds = %66
  %72 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %77

73:                                               ; preds = %66
  %74 = tail call float @llvm.experimental.constrained.fdiv.f32(float %0, float %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %75 = tail call float @fabsf(float noundef %74) #4
  %76 = tail call float @atanf(float noundef %75) #4
  br label %77

77:                                               ; preds = %73, %71
  %78 = phi float [ %72, %71 ], [ %76, %73 ]
  switch i32 %20, label %84 [
    i32 0, label %91
    i32 1, label %79
    i32 2, label %81
  ]

79:                                               ; preds = %77
  %80 = fneg float %78
  br label %91

81:                                               ; preds = %77
  %82 = tail call float @llvm.experimental.constrained.fsub.f32(float %78, float 0xBE7777A5C0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %83 = tail call float @llvm.experimental.constrained.fsub.f32(float 0x400921FB60000000, float %82, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %91

84:                                               ; preds = %77
  %85 = tail call float @llvm.experimental.constrained.fsub.f32(float %78, float 0xBE7777A5C0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %86 = tail call float @llvm.experimental.constrained.fsub.f32(float %85, float 0x400921FB60000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %91

87:                                               ; preds = %34
  %88 = zext i32 %20 to i64
  %89 = getelementptr inbounds [4 x float], [4 x float]* @switch.table.atan2f, i64 0, i64 %88
  %90 = load float, float* %89, align 4
  br label %91

91:                                               ; preds = %87, %77, %22, %22, %84, %81, %79, %59, %48, %43, %40, %37, %27, %24, %23, %14, %10
  %92 = phi float [ %11, %10 ], [ %15, %14 ], [ %33, %27 ], [ %65, %59 ], [ %86, %84 ], [ %83, %81 ], [ %80, %79 ], [ %52, %48 ], [ %47, %43 ], [ %42, %40 ], [ %39, %37 ], [ 0xC00921FB60000000, %24 ], [ 0x400921FB60000000, %23 ], [ %0, %22 ], [ %0, %22 ], [ %78, %77 ], [ %90, %87 ]
  ret float %92
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #1

; Function Attrs: optsize
declare float @atanf(float noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #1

; Function Attrs: optsize
declare float @fabsf(float noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #1

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
