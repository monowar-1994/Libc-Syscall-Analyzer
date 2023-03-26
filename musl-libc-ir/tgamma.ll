; ModuleID = 'src/math/tgamma.c'
source_filename = "src/math/tgamma.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@fact = internal unnamed_addr constant [23 x double] [double 1.000000e+00, double 1.000000e+00, double 2.000000e+00, double 6.000000e+00, double 2.400000e+01, double 1.200000e+02, double 7.200000e+02, double 5.040000e+03, double 4.032000e+04, double 3.628800e+05, double 3.628800e+06, double 3.991680e+07, double 0x41BC8CFC00000000, double 0x41F7328CC0000000, double 0x42344C3B28000000, double 0x4273077775800000, double 0x42B3077775800000, double 0x42F437EEECD80000, double 0x4336BEECCA730000, double 0x437B02B930689000, double 0x43C0E1B3BE415A00, double 0x4406283BE9B5C620, double 0x444E77526159F06C], align 16
@Snum = internal unnamed_addr constant [13 x double] [double 0x4215EA5143C1A49E, double 0x4223FC7075F54C57, double 0x4220A132818AB61A, double 0x4210B0B522E8261A, double 0x41F67FC1B3A5A1E8, double 0x41D57418F5D3F33F, double 0x41ADAB0C7BB95F2A, double 0x417DF876F95DCC98, double 0x4145F1E95080F44C, double 0x4106B6421F8787EB, double 0x40BF87AC0858D804, double 0x406A5A607BBC3B52, double 0x40040D931FF62705], align 16
@Sden = internal unnamed_addr constant [13 x double] [double 0.000000e+00, double 3.991680e+07, double 0x419CBD6980000000, double 0x41A1FDA6B0000000, double 0x4199187170000000, double 0x4185EEB690000000, double 0x41697171E0000000, double 0x41441F7B00000000, double 3.574230e+05, double 3.267000e+04, double 1.925000e+03, double 6.600000e+01, double 1.000000e+00], align 16

; Function Attrs: nounwind optsize strictfp
define double @tgamma(double noundef %0) local_unnamed_addr #0 {
  %2 = alloca float, align 4
  %3 = bitcast double %0 to i64
  %4 = lshr i64 %3, 32
  %5 = trunc i64 %4 to i32
  %6 = and i32 %5, 2147483647
  %7 = icmp ugt i32 %6, 2146435071
  br i1 %7, label %8, label %11

8:                                                ; preds = %1
  %9 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x7FF0000000000000, metadata !"fpexcept.ignore") #4
  %10 = tail call double @llvm.experimental.constrained.fadd.f64(double %0, double %9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %152

11:                                               ; preds = %1
  %12 = icmp ult i32 %6, 1016070144
  br i1 %12, label %13, label %16

13:                                               ; preds = %11
  %14 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %15 = tail call double @llvm.experimental.constrained.fdiv.f64(double %14, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %152

16:                                               ; preds = %11
  %17 = tail call double @floor(double noundef %0) #5
  %18 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %0, double %17, metadata !"oeq", metadata !"fpexcept.ignore") #4
  br i1 %18, label %19, label %33

19:                                               ; preds = %16
  %20 = icmp sgt i64 %3, -1
  br i1 %20, label %24, label %21

21:                                               ; preds = %19
  %22 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %23 = tail call double @llvm.experimental.constrained.fdiv.f64(double %22, double 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %152

24:                                               ; preds = %19
  %25 = tail call double @llvm.experimental.constrained.uitofp.f64.i64(i64 23, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %26 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %0, double %25, metadata !"ole", metadata !"fpexcept.ignore") #4
  br i1 %26, label %27, label %33

27:                                               ; preds = %24
  %28 = tail call i32 @llvm.experimental.constrained.fptosi.i32.f64(double %0, metadata !"fpexcept.ignore") #4
  %29 = add nsw i32 %28, -1
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [23 x double], [23 x double]* @fact, i64 0, i64 %30
  %32 = load double, double* %31, align 8, !tbaa !3
  br label %152

33:                                               ; preds = %24, %16
  %34 = icmp ugt i32 %6, 1080492031
  br i1 %34, label %35, label %50

35:                                               ; preds = %33
  %36 = icmp sgt i64 %3, -1
  br i1 %36, label %48, label %37

37:                                               ; preds = %35
  %38 = tail call double @llvm.experimental.constrained.fdiv.f64(double 0x3810000000000000, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %39 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %38, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %40 = bitcast float* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %40)
  store volatile float %39, float* %2, align 4, !tbaa !7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %40)
  %41 = tail call double @floor(double noundef %0) #5
  %42 = tail call double @llvm.experimental.constrained.fmul.f64(double %41, double 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %43 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %44 = tail call double @floor(double noundef %43) #5
  %45 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %42, double %44, metadata !"oeq", metadata !"fpexcept.ignore") #4
  br i1 %45, label %46, label %152

46:                                               ; preds = %37
  %47 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %152

48:                                               ; preds = %35
  %49 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double 0x7FE0000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %152

50:                                               ; preds = %33
  %51 = fneg double %0
  %52 = icmp slt i64 %3, 0
  %53 = select i1 %52, double %51, double %0
  %54 = tail call double @llvm.experimental.constrained.fadd.f64(double %53, double 0x40161945B9800000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %55 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %53, double 0x40161945B9800000, metadata !"ogt", metadata !"fpexcept.ignore") #4
  br i1 %55, label %56, label %59

56:                                               ; preds = %50
  %57 = tail call double @llvm.experimental.constrained.fsub.f64(double %54, double %53, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %58 = tail call double @llvm.experimental.constrained.fsub.f64(double %57, double 0x40161945B9800000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %62

59:                                               ; preds = %50
  %60 = tail call double @llvm.experimental.constrained.fsub.f64(double %54, double 0x40161945B9800000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %61 = tail call double @llvm.experimental.constrained.fsub.f64(double %60, double %53, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %62

62:                                               ; preds = %59, %56
  %63 = phi double [ %58, %56 ], [ %61, %59 ]
  %64 = tail call double @llvm.experimental.constrained.fsub.f64(double %53, double 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %65 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %66 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %67 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %68 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %53, double %67, metadata !"olt", metadata !"fpexcept.ignore") #6
  br i1 %68, label %69, label %81

69:                                               ; preds = %62, %69
  %70 = phi i64 [ %79, %69 ], [ 12, %62 ]
  %71 = phi double [ %78, %69 ], [ %66, %62 ]
  %72 = phi double [ %75, %69 ], [ %65, %62 ]
  %73 = getelementptr inbounds [13 x double], [13 x double]* @Snum, i64 0, i64 %70
  %74 = load double, double* %73, align 8, !tbaa !3
  %75 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %72, double %53, double %74, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %76 = getelementptr inbounds [13 x double], [13 x double]* @Sden, i64 0, i64 %70
  %77 = load double, double* %76, align 8, !tbaa !3
  %78 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %71, double %53, double %77, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %79 = add nsw i64 %70, -1
  %80 = icmp eq i64 %70, 0
  br i1 %80, label %95, label %69

81:                                               ; preds = %62, %81
  %82 = phi i64 [ %93, %81 ], [ 0, %62 ]
  %83 = phi double [ %92, %81 ], [ %66, %62 ]
  %84 = phi double [ %88, %81 ], [ %65, %62 ]
  %85 = tail call double @llvm.experimental.constrained.fdiv.f64(double %84, double %53, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %86 = getelementptr inbounds [13 x double], [13 x double]* @Snum, i64 0, i64 %82
  %87 = load double, double* %86, align 8, !tbaa !3
  %88 = tail call double @llvm.experimental.constrained.fadd.f64(double %85, double %87, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %89 = tail call double @llvm.experimental.constrained.fdiv.f64(double %83, double %53, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %90 = getelementptr inbounds [13 x double], [13 x double]* @Sden, i64 0, i64 %82
  %91 = load double, double* %90, align 8, !tbaa !3
  %92 = tail call double @llvm.experimental.constrained.fadd.f64(double %89, double %91, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %93 = add nuw nsw i64 %82, 1
  %94 = icmp eq i64 %93, 13
  br i1 %94, label %95, label %81

95:                                               ; preds = %81, %69
  %96 = phi double [ %75, %69 ], [ %88, %81 ]
  %97 = phi double [ %78, %69 ], [ %92, %81 ]
  %98 = tail call double @llvm.experimental.constrained.fdiv.f64(double %96, double %97, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %99 = fneg double %54
  %100 = tail call double @exp(double noundef %99) #5
  %101 = tail call double @llvm.experimental.constrained.fmul.f64(double %98, double %100, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %102 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %103 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %0, double %102, metadata !"olt", metadata !"fpexcept.ignore") #4
  br i1 %103, label %104, label %140

104:                                              ; preds = %95
  %105 = tail call double @llvm.experimental.constrained.fmul.f64(double %53, double 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %106 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %107 = tail call double @floor(double noundef %105) #5
  %108 = tail call double @llvm.experimental.constrained.fsub.f64(double %105, double %107, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %109 = tail call double @llvm.experimental.constrained.fmul.f64(double %106, double %108, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %110 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %111 = tail call double @llvm.experimental.constrained.fmul.f64(double %110, double %109, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %112 = tail call i32 @llvm.experimental.constrained.fptosi.i32.f64(double %111, metadata !"fpexcept.ignore") #6
  %113 = add nsw i32 %112, 1
  %114 = sdiv i32 %113, 2
  %115 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %114, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %116 = fneg double %115
  %117 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %116, double 5.000000e-01, double %109, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %118 = tail call double @llvm.experimental.constrained.fmul.f64(double %117, double 0x400921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  switch i32 %114, label %119 [
    i32 3, label %129
    i32 1, label %122
    i32 2, label %125
  ]

119:                                              ; preds = %104
  %120 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %121 = tail call double @__sin(double noundef %118, double noundef %120, i32 noundef 0) #5
  br label %133

122:                                              ; preds = %104
  %123 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %124 = tail call double @__cos(double noundef %118, double noundef %123) #5
  br label %133

125:                                              ; preds = %104
  %126 = fneg double %118
  %127 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %128 = tail call double @__sin(double noundef %126, double noundef %127, i32 noundef 0) #5
  br label %133

129:                                              ; preds = %104
  %130 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %131 = tail call double @__cos(double noundef %118, double noundef %130) #5
  %132 = fneg double %131
  br label %133

133:                                              ; preds = %119, %122, %125, %129
  %134 = phi double [ %121, %119 ], [ %128, %125 ], [ %124, %122 ], [ %132, %129 ]
  %135 = tail call double @llvm.experimental.constrained.fmul.f64(double %134, double %53, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %136 = tail call double @llvm.experimental.constrained.fmul.f64(double %135, double %101, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %137 = tail call double @llvm.experimental.constrained.fdiv.f64(double 0xC00921FB54442D18, double %136, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %138 = fneg double %63
  %139 = fneg double %64
  br label %140

140:                                              ; preds = %133, %95
  %141 = phi double [ %138, %133 ], [ %63, %95 ]
  %142 = phi double [ %139, %133 ], [ %64, %95 ]
  %143 = phi double [ %137, %133 ], [ %101, %95 ]
  %144 = tail call double @llvm.experimental.constrained.fmul.f64(double %141, double 0x40181945B9800000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %145 = tail call double @llvm.experimental.constrained.fmul.f64(double %144, double %143, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %146 = tail call double @llvm.experimental.constrained.fdiv.f64(double %145, double %54, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %147 = tail call double @llvm.experimental.constrained.fadd.f64(double %143, double %146, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %148 = tail call double @llvm.experimental.constrained.fmul.f64(double 5.000000e-01, double %142, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %149 = tail call double @pow(double noundef %54, double noundef %148) #5
  %150 = tail call double @llvm.experimental.constrained.fmul.f64(double %147, double %149, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %151 = tail call double @llvm.experimental.constrained.fmul.f64(double %150, double %149, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %152

152:                                              ; preds = %37, %140, %48, %46, %27, %21, %13, %8
  %153 = phi double [ %10, %8 ], [ %15, %13 ], [ %23, %21 ], [ %32, %27 ], [ %47, %46 ], [ %49, %48 ], [ %151, %140 ], [ -0.000000e+00, %37 ]
  ret double %153
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #2

; Function Attrs: optsize
declare double @floor(double noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.uitofp.f64.i64(i64, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i32 @llvm.experimental.constrained.fptosi.i32.f64(double, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: optsize
declare double @exp(double noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare double @pow(double noundef, double noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #2

; Function Attrs: optsize
declare hidden double @__sin(double noundef, double noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden double @__cos(double noundef, double noundef) local_unnamed_addr #3

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !5, i64 0}
