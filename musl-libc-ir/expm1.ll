; ModuleID = 'src/math/expm1.c'
source_filename = "src/math/expm1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nounwind optsize strictfp
define double @expm1(double noundef %0) local_unnamed_addr #0 {
  %2 = alloca float, align 4
  %3 = bitcast double %0 to i64
  %4 = lshr i64 %3, 32
  %5 = trunc i64 %4 to i32
  %6 = and i32 %5, 2147483647
  %7 = icmp ugt i32 %6, 1078159481
  br i1 %7, label %8, label %19

8:                                                ; preds = %1
  %9 = and i64 %3, 9223372036854775807
  %10 = icmp ugt i64 %9, 9218868437227405312
  br i1 %10, label %127, label %11

11:                                               ; preds = %8
  %12 = icmp sgt i64 %3, -1
  br i1 %12, label %15, label %13

13:                                               ; preds = %11
  %14 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 -1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %127

15:                                               ; preds = %11
  %16 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %0, double 0x40862E42FEFA39EF, metadata !"ogt", metadata !"fpexcept.ignore") #4
  br i1 %16, label %17, label %29

17:                                               ; preds = %15
  %18 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double 0x7FE0000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %127

19:                                               ; preds = %1
  %20 = icmp ugt i32 %6, 1071001154
  br i1 %20, label %21, label %44

21:                                               ; preds = %19
  %22 = icmp ult i32 %6, 1072734898
  br i1 %22, label %23, label %29

23:                                               ; preds = %21
  %24 = icmp sgt i64 %3, -1
  br i1 %24, label %25, label %27

25:                                               ; preds = %23
  %26 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double 0x3FE62E42FEE00000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %37

27:                                               ; preds = %23
  %28 = tail call double @llvm.experimental.constrained.fadd.f64(double %0, double 0x3FE62E42FEE00000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %37

29:                                               ; preds = %15, %21
  %30 = tail call double @llvm.copysign.f64(double 5.000000e-01, double %0)
  %31 = tail call double @llvm.experimental.constrained.fmuladd.f64(double 0x3FF71547652B82FE, double %0, double %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %32 = tail call i32 @llvm.experimental.constrained.fptosi.i32.f64(double %31, metadata !"fpexcept.ignore") #4
  %33 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %34 = fneg double %33
  %35 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %34, double 0x3FE62E42FEE00000, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %36 = tail call double @llvm.experimental.constrained.fmul.f64(double %33, double 0x3DEA39EF35793C76, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %37

37:                                               ; preds = %25, %27, %29
  %38 = phi double [ 0xBDEA39EF35793C76, %27 ], [ 0x3DEA39EF35793C76, %25 ], [ %36, %29 ]
  %39 = phi double [ %28, %27 ], [ %26, %25 ], [ %35, %29 ]
  %40 = phi i32 [ -1, %27 ], [ 1, %25 ], [ %32, %29 ]
  %41 = tail call double @llvm.experimental.constrained.fsub.f64(double %39, double %38, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %42 = tail call double @llvm.experimental.constrained.fsub.f64(double %39, double %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %43 = tail call double @llvm.experimental.constrained.fsub.f64(double %42, double %38, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %51

44:                                               ; preds = %19
  %45 = icmp ult i32 %6, 1016070144
  br i1 %45, label %46, label %51

46:                                               ; preds = %44
  %47 = icmp ult i32 %6, 1048576
  br i1 %47, label %48, label %127

48:                                               ; preds = %46
  %49 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %50 = bitcast float* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %50)
  store volatile float %49, float* %2, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %50)
  br label %127

51:                                               ; preds = %44, %37
  %52 = phi double [ %43, %37 ], [ undef, %44 ]
  %53 = phi double [ %41, %37 ], [ %0, %44 ]
  %54 = phi i32 [ %40, %37 ], [ 0, %44 ]
  %55 = tail call double @llvm.experimental.constrained.fmul.f64(double 5.000000e-01, double %53, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %56 = tail call double @llvm.experimental.constrained.fmul.f64(double %53, double %55, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %57 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %56, double 0xBE8AFDB76E09C32D, double 0x3ED0CFCA86E65239, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %58 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %56, double %57, double 0xBF14CE199EAADBB7, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %59 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %56, double %58, double 0x3F5A01A019FE5585, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %60 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %56, double %59, double 0xBFA11111111110F4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %61 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %56, double %60, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %62 = fneg double %61
  %63 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %62, double %55, double 3.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %64 = tail call double @llvm.experimental.constrained.fsub.f64(double %61, double %63, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %65 = fneg double %53
  %66 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %65, double %63, double 6.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %67 = tail call double @llvm.experimental.constrained.fdiv.f64(double %64, double %66, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %68 = tail call double @llvm.experimental.constrained.fmul.f64(double %56, double %67, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %69 = icmp eq i32 %54, 0
  br i1 %69, label %70, label %74

70:                                               ; preds = %51
  %71 = fneg double %56
  %72 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %53, double %68, double %71, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %73 = tail call double @llvm.experimental.constrained.fsub.f64(double %53, double %72, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %127

74:                                               ; preds = %51
  %75 = tail call double @llvm.experimental.constrained.fsub.f64(double %68, double %52, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %76 = fneg double %52
  %77 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %53, double %75, double %76, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %78 = tail call double @llvm.experimental.constrained.fsub.f64(double %77, double %56, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  switch i32 %54, label %91 [
    i32 -1, label %79
    i32 1, label %82
  ]

79:                                               ; preds = %74
  %80 = tail call double @llvm.experimental.constrained.fsub.f64(double %53, double %78, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %81 = tail call double @llvm.experimental.constrained.fmuladd.f64(double 5.000000e-01, double %80, double -5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %127

82:                                               ; preds = %74
  %83 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %53, double -2.500000e-01, metadata !"olt", metadata !"fpexcept.ignore") #4
  br i1 %83, label %84, label %88

84:                                               ; preds = %82
  %85 = tail call double @llvm.experimental.constrained.fadd.f64(double %53, double 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %86 = tail call double @llvm.experimental.constrained.fsub.f64(double %78, double %85, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %87 = tail call double @llvm.experimental.constrained.fmul.f64(double -2.000000e+00, double %86, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %127

88:                                               ; preds = %82
  %89 = tail call double @llvm.experimental.constrained.fsub.f64(double %53, double %78, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %90 = tail call double @llvm.experimental.constrained.fmuladd.f64(double 2.000000e+00, double %89, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %127

91:                                               ; preds = %74
  %92 = add nsw i32 %54, 1023
  %93 = zext i32 %92 to i64
  %94 = shl i64 %93, 52
  %95 = bitcast i64 %94 to double
  %96 = icmp ugt i32 %54, 56
  br i1 %96, label %97, label %109

97:                                               ; preds = %91
  %98 = tail call double @llvm.experimental.constrained.fsub.f64(double %53, double %78, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %99 = tail call double @llvm.experimental.constrained.fadd.f64(double %98, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %100 = icmp eq i32 %54, 1024
  br i1 %100, label %101, label %104

101:                                              ; preds = %97
  %102 = tail call double @llvm.experimental.constrained.fmul.f64(double %99, double 2.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %103 = tail call double @llvm.experimental.constrained.fmul.f64(double %102, double 0x7FE0000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %106

104:                                              ; preds = %97
  %105 = tail call double @llvm.experimental.constrained.fmul.f64(double %99, double %95, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %106

106:                                              ; preds = %104, %101
  %107 = phi double [ %103, %101 ], [ %105, %104 ]
  %108 = tail call double @llvm.experimental.constrained.fsub.f64(double %107, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %127

109:                                              ; preds = %91
  %110 = sub nuw nsw i32 1023, %54
  %111 = zext i32 %110 to i64
  %112 = shl nuw nsw i64 %111, 52
  %113 = bitcast i64 %112 to double
  %114 = icmp ult i32 %54, 20
  br i1 %114, label %115, label %121

115:                                              ; preds = %109
  %116 = tail call double @llvm.experimental.constrained.fsub.f64(double %53, double %78, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %117 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %118 = tail call double @llvm.experimental.constrained.fsub.f64(double %117, double %113, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %119 = tail call double @llvm.experimental.constrained.fadd.f64(double %116, double %118, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %120 = tail call double @llvm.experimental.constrained.fmul.f64(double %119, double %95, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %127

121:                                              ; preds = %109
  %122 = tail call double @llvm.experimental.constrained.fadd.f64(double %78, double %113, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %123 = tail call double @llvm.experimental.constrained.fsub.f64(double %53, double %122, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %124 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %125 = tail call double @llvm.experimental.constrained.fadd.f64(double %123, double %124, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %126 = tail call double @llvm.experimental.constrained.fmul.f64(double %125, double %95, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %127

127:                                              ; preds = %115, %121, %46, %48, %8, %106, %88, %84, %79, %70, %17, %13
  %128 = phi double [ %14, %13 ], [ %18, %17 ], [ %73, %70 ], [ %81, %79 ], [ %87, %84 ], [ %90, %88 ], [ %108, %106 ], [ %0, %8 ], [ %0, %48 ], [ %0, %46 ], [ %120, %115 ], [ %126, %121 ]
  ret double %128
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i32 @llvm.experimental.constrained.fptosi.i32.f64(double, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #3

attributes #0 = { nofree nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"float", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
