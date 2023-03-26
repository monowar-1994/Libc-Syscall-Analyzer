; ModuleID = 'src/math/atan.c'
source_filename = "src/math/atan.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@atanhi = internal unnamed_addr constant [4 x double] [double 0x3FDDAC670561BB4F, double 0x3FE921FB54442D18, double 0x3FEF730BD281F69B, double 0x3FF921FB54442D18], align 16
@atanlo = internal unnamed_addr constant [4 x double] [double 0x3C7A2B7F222F65E2, double 0x3C81A62633145C07, double 0x3C7007887AF0CBBD, double 0x3C91A62633145C07], align 16

; Function Attrs: nounwind optsize strictfp
define double @atan(double noundef %0) local_unnamed_addr #0 {
  %2 = alloca float, align 4
  %3 = bitcast double %0 to i64
  %4 = lshr i64 %3, 32
  %5 = trunc i64 %4 to i32
  %6 = and i32 %5, 2147483647
  %7 = icmp ugt i32 %6, 1141899263
  br i1 %7, label %8, label %17

8:                                                ; preds = %1
  %9 = and i64 %3, 9223372036854775807
  %10 = icmp ugt i64 %9, 9218868437227405312
  br i1 %10, label %81, label %11

11:                                               ; preds = %8
  %12 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x3870000000000000, metadata !"fpexcept.ignore") #4
  %13 = tail call double @llvm.experimental.constrained.fadd.f64(double 0x3FF921FB54442D18, double %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %14 = fneg double %13
  %15 = icmp slt i64 %3, 0
  %16 = select i1 %15, double %14, double %13
  br label %81

17:                                               ; preds = %1
  %18 = icmp ult i32 %6, 1071382528
  br i1 %18, label %19, label %26

19:                                               ; preds = %17
  %20 = icmp ult i32 %6, 1044381696
  br i1 %20, label %21, label %47

21:                                               ; preds = %19
  %22 = icmp ult i32 %6, 1048576
  br i1 %22, label %23, label %81

23:                                               ; preds = %21
  %24 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %25 = bitcast float* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %25)
  store volatile float %24, float* %2, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %25)
  br label %81

26:                                               ; preds = %17
  %27 = tail call double @fabs(double noundef %0) #5
  %28 = icmp ult i32 %6, 1072889856
  br i1 %28, label %29, label %39

29:                                               ; preds = %26
  %30 = icmp ult i32 %6, 1072037888
  br i1 %30, label %31, label %35

31:                                               ; preds = %29
  %32 = tail call double @llvm.experimental.constrained.fmuladd.f64(double 2.000000e+00, double %27, double -1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %33 = tail call double @llvm.experimental.constrained.fadd.f64(double 2.000000e+00, double %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %34 = tail call double @llvm.experimental.constrained.fdiv.f64(double %32, double %33, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %47

35:                                               ; preds = %29
  %36 = tail call double @llvm.experimental.constrained.fsub.f64(double %27, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %37 = tail call double @llvm.experimental.constrained.fadd.f64(double %27, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %38 = tail call double @llvm.experimental.constrained.fdiv.f64(double %36, double %37, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %47

39:                                               ; preds = %26
  %40 = icmp ult i32 %6, 1073971200
  br i1 %40, label %41, label %45

41:                                               ; preds = %39
  %42 = tail call double @llvm.experimental.constrained.fsub.f64(double %27, double 1.500000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %43 = tail call double @llvm.experimental.constrained.fmuladd.f64(double 1.500000e+00, double %27, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %44 = tail call double @llvm.experimental.constrained.fdiv.f64(double %42, double %43, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %47

45:                                               ; preds = %39
  %46 = tail call double @llvm.experimental.constrained.fdiv.f64(double -1.000000e+00, double %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %47

47:                                               ; preds = %19, %35, %31, %45, %41
  %48 = phi double [ %34, %31 ], [ %38, %35 ], [ %44, %41 ], [ %46, %45 ], [ %0, %19 ]
  %49 = phi i1 [ false, %31 ], [ false, %35 ], [ false, %41 ], [ false, %45 ], [ true, %19 ]
  %50 = phi i64 [ 0, %31 ], [ 1, %35 ], [ 2, %41 ], [ 3, %45 ], [ -1, %19 ]
  %51 = tail call double @llvm.experimental.constrained.fmul.f64(double %48, double %48, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %52 = tail call double @llvm.experimental.constrained.fmul.f64(double %51, double %51, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %53 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %52, double 0x3F90AD3AE322DA11, double 0x3FA97B4B24760DEB, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %54 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %52, double %53, double 0x3FB10D66A0D03D51, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %55 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %52, double %54, double 0x3FB745CDC54C206E, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %56 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %52, double %55, double 0x3FC24924920083FF, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %57 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %52, double %56, double 0x3FD555555555550D, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %58 = tail call double @llvm.experimental.constrained.fmul.f64(double %51, double %57, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %59 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %52, double 0xBFA2B4442C6A6C2F, double 0xBFADDE2D52DEFD9A, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %60 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %52, double %59, double 0xBFB3B0F2AF749A6D, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %61 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %52, double %60, double 0xBFBC71C6FE231671, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %62 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %52, double %61, double 0xBFC999999998EBC4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %63 = tail call double @llvm.experimental.constrained.fmul.f64(double %52, double %62, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br i1 %49, label %64, label %68

64:                                               ; preds = %47
  %65 = tail call double @llvm.experimental.constrained.fadd.f64(double %58, double %63, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %66 = fneg double %48
  %67 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %66, double %65, double %48, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %81

68:                                               ; preds = %47
  %69 = getelementptr inbounds [4 x double], [4 x double]* @atanhi, i64 0, i64 %50
  %70 = load double, double* %69, align 8, !tbaa !7
  %71 = tail call double @llvm.experimental.constrained.fadd.f64(double %58, double %63, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %72 = getelementptr inbounds [4 x double], [4 x double]* @atanlo, i64 0, i64 %50
  %73 = load double, double* %72, align 8, !tbaa !7
  %74 = fneg double %73
  %75 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %48, double %71, double %74, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %76 = tail call double @llvm.experimental.constrained.fsub.f64(double %75, double %48, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %77 = tail call double @llvm.experimental.constrained.fsub.f64(double %70, double %76, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %78 = fneg double %77
  %79 = icmp slt i64 %3, 0
  %80 = select i1 %79, double %78, double %77
  br label %81

81:                                               ; preds = %21, %23, %8, %68, %64, %11
  %82 = phi double [ %16, %11 ], [ %67, %64 ], [ %80, %68 ], [ %0, %8 ], [ %0, %23 ], [ %0, %21 ]
  ret double %82
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

; Function Attrs: optsize
declare double @fabs(double noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

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
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !5, i64 0}
