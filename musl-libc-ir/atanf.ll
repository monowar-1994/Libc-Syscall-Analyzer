; ModuleID = 'src/math/atanf.c'
source_filename = "src/math/atanf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@atanhi = internal unnamed_addr constant [4 x float] [float 0x3FDDAC6700000000, float 0x3FE921FB40000000, float 0x3FEF730BC0000000, float 0x3FF921FB40000000], align 16
@atanlo = internal unnamed_addr constant [4 x float] [float 0x3E3586ED20000000, float 0x3E64442D00000000, float 0x3E6281F680000000, float 0x3E74442D00000000], align 16

; Function Attrs: nounwind optsize strictfp
define float @atanf(float noundef %0) local_unnamed_addr #0 {
  %2 = alloca float, align 4
  %3 = bitcast float %0 to i32
  %4 = and i32 %3, 2147483647
  %5 = icmp ugt i32 %4, 1283457023
  br i1 %5, label %6, label %13

6:                                                ; preds = %1
  %7 = icmp ugt i32 %4, 2139095040
  br i1 %7, label %71, label %8

8:                                                ; preds = %6
  %9 = tail call float @llvm.experimental.constrained.fadd.f32(float 0x3FF921FB40000000, float 0x3870000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %10 = fneg float %9
  %11 = icmp slt i32 %3, 0
  %12 = select i1 %11, float %10, float %9
  br label %71

13:                                               ; preds = %1
  %14 = icmp ult i32 %4, 1054867456
  br i1 %14, label %15, label %22

15:                                               ; preds = %13
  %16 = icmp ult i32 %4, 964689920
  br i1 %16, label %17, label %43

17:                                               ; preds = %15
  %18 = icmp ult i32 %4, 8388608
  br i1 %18, label %19, label %71

19:                                               ; preds = %17
  %20 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %21 = bitcast float* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %21)
  store volatile float %20, float* %2, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %21)
  br label %71

22:                                               ; preds = %13
  %23 = tail call float @fabsf(float noundef %0) #5
  %24 = icmp ult i32 %4, 1066926080
  br i1 %24, label %25, label %35

25:                                               ; preds = %22
  %26 = icmp ult i32 %4, 1060110336
  br i1 %26, label %27, label %31

27:                                               ; preds = %25
  %28 = tail call float @llvm.experimental.constrained.fmuladd.f32(float 2.000000e+00, float %23, float -1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %29 = tail call float @llvm.experimental.constrained.fadd.f32(float 2.000000e+00, float %23, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %30 = tail call float @llvm.experimental.constrained.fdiv.f32(float %28, float %29, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %43

31:                                               ; preds = %25
  %32 = tail call float @llvm.experimental.constrained.fsub.f32(float %23, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %33 = tail call float @llvm.experimental.constrained.fadd.f32(float %23, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %34 = tail call float @llvm.experimental.constrained.fdiv.f32(float %32, float %33, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %43

35:                                               ; preds = %22
  %36 = icmp ult i32 %4, 1075576832
  br i1 %36, label %37, label %41

37:                                               ; preds = %35
  %38 = tail call float @llvm.experimental.constrained.fsub.f32(float %23, float 1.500000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %39 = tail call float @llvm.experimental.constrained.fmuladd.f32(float 1.500000e+00, float %23, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %40 = tail call float @llvm.experimental.constrained.fdiv.f32(float %38, float %39, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %43

41:                                               ; preds = %35
  %42 = tail call float @llvm.experimental.constrained.fdiv.f32(float -1.000000e+00, float %23, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %43

43:                                               ; preds = %15, %31, %27, %41, %37
  %44 = phi float [ %30, %27 ], [ %34, %31 ], [ %40, %37 ], [ %42, %41 ], [ %0, %15 ]
  %45 = phi i1 [ false, %27 ], [ false, %31 ], [ false, %37 ], [ false, %41 ], [ true, %15 ]
  %46 = phi i64 [ 0, %27 ], [ 1, %31 ], [ 2, %37 ], [ 3, %41 ], [ -1, %15 ]
  %47 = tail call float @llvm.experimental.constrained.fmul.f32(float %44, float %44, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %48 = tail call float @llvm.experimental.constrained.fmul.f32(float %47, float %47, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %49 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %48, float 0x3FAF9584A0000000, float 0x3FC23EA1A0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %50 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %48, float %49, float 0x3FD5555520000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %51 = tail call float @llvm.experimental.constrained.fmul.f32(float %47, float %50, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %52 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %48, float 0xBFBB4248E0000000, float 0xBFC9995300000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %53 = tail call float @llvm.experimental.constrained.fmul.f32(float %48, float %52, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br i1 %45, label %54, label %58

54:                                               ; preds = %43
  %55 = tail call float @llvm.experimental.constrained.fadd.f32(float %51, float %53, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %56 = fneg float %44
  %57 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %56, float %55, float %44, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %71

58:                                               ; preds = %43
  %59 = getelementptr inbounds [4 x float], [4 x float]* @atanhi, i64 0, i64 %46
  %60 = load float, float* %59, align 4, !tbaa !3
  %61 = tail call float @llvm.experimental.constrained.fadd.f32(float %51, float %53, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %62 = getelementptr inbounds [4 x float], [4 x float]* @atanlo, i64 0, i64 %46
  %63 = load float, float* %62, align 4, !tbaa !3
  %64 = fneg float %63
  %65 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %44, float %61, float %64, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %66 = tail call float @llvm.experimental.constrained.fsub.f32(float %65, float %44, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %67 = tail call float @llvm.experimental.constrained.fsub.f32(float %60, float %66, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %68 = fneg float %67
  %69 = icmp slt i32 %3, 0
  %70 = select i1 %69, float %68, float %67
  br label %71

71:                                               ; preds = %17, %19, %6, %58, %54, %8
  %72 = phi float [ %12, %8 ], [ %57, %54 ], [ %70, %58 ], [ %0, %6 ], [ %0, %19 ], [ %0, %17 ]
  ret float %72
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #2

; Function Attrs: optsize
declare float @fabsf(float noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmuladd.f32(float, float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"float", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
