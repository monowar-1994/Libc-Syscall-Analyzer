; ModuleID = 'src/math/fmal.c'
source_filename = "src/math/fmal.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.dd = type { x86_fp80, x86_fp80 }

; Function Attrs: nounwind optsize strictfp
define x86_fp80 @fmal(x86_fp80 noundef %0, x86_fp80 noundef %1, x86_fp80 noundef %2) local_unnamed_addr #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.dd, align 16
  %8 = alloca x86_fp80, align 16
  %9 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %9) #6
  %10 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %10) #6
  %11 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %11) #6
  %12 = tail call i32 @__fpclassifyl(x86_fp80 noundef %0) #7
  %13 = icmp sgt i32 %12, 1
  br i1 %13, label %14, label %17

14:                                               ; preds = %3
  %15 = tail call i32 @__fpclassifyl(x86_fp80 noundef %1) #7
  %16 = icmp sgt i32 %15, 1
  br i1 %16, label %19, label %17

17:                                               ; preds = %14, %3
  %18 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %0, x86_fp80 %1, x86_fp80 %2, metadata !"round.dynamic", metadata !"fpexcept.strict") #8
  br label %146

19:                                               ; preds = %14
  %20 = tail call i32 @__fpclassifyl(x86_fp80 noundef %2) #7
  %21 = icmp sgt i32 %20, 1
  br i1 %21, label %22, label %146

22:                                               ; preds = %19
  %23 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.strict") #8
  %24 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %0, x86_fp80 %23, metadata !"oeq", metadata !"fpexcept.strict") #8
  br i1 %24, label %28, label %25

25:                                               ; preds = %22
  %26 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.strict") #8
  %27 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %1, x86_fp80 %26, metadata !"oeq", metadata !"fpexcept.strict") #8
  br i1 %27, label %28, label %30

28:                                               ; preds = %25, %22
  %29 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %0, x86_fp80 %1, x86_fp80 %2, metadata !"round.dynamic", metadata !"fpexcept.strict") #8
  br label %146

30:                                               ; preds = %25
  %31 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.strict") #8
  %32 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %2, x86_fp80 %31, metadata !"oeq", metadata !"fpexcept.strict") #8
  br i1 %32, label %33, label %35

33:                                               ; preds = %30
  %34 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %0, x86_fp80 %1, metadata !"round.dynamic", metadata !"fpexcept.strict") #8
  br label %146

35:                                               ; preds = %30
  %36 = call x86_fp80 @frexpl(x86_fp80 noundef %0, i32* noundef nonnull %4) #7
  %37 = call x86_fp80 @frexpl(x86_fp80 noundef %1, i32* noundef nonnull %5) #7
  %38 = call x86_fp80 @frexpl(x86_fp80 noundef %2, i32* noundef nonnull %6) #7
  %39 = call i32 @fegetround() #7
  %40 = load i32, i32* %4, align 4, !tbaa !3
  %41 = load i32, i32* %5, align 4, !tbaa !3
  %42 = add nsw i32 %41, %40
  %43 = load i32, i32* %6, align 4, !tbaa !3
  %44 = sub i32 %42, %43
  %45 = icmp slt i32 %44, -64
  br i1 %45, label %46, label %83

46:                                               ; preds = %35
  %47 = call i32 @feraiseexcept(i32 noundef 32) #7
  %48 = call i32 @__fpclassifyl(x86_fp80 noundef %2) #7
  %49 = icmp eq i32 %48, 4
  br i1 %49, label %52, label %50

50:                                               ; preds = %46
  %51 = call i32 @feraiseexcept(i32 noundef 16) #7
  br label %52

52:                                               ; preds = %50, %46
  switch i32 %39, label %146 [
    i32 3072, label %53
    i32 1024, label %65
    i32 2048, label %74
  ]

53:                                               ; preds = %52
  %54 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.strict") #8
  %55 = call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %0, x86_fp80 %54, metadata !"ogt", metadata !"fpexcept.strict") #8
  %56 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.strict") #8
  %57 = call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %1, x86_fp80 %56, metadata !"olt", metadata !"fpexcept.strict") #8
  %58 = xor i1 %55, %57
  %59 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.strict") #8
  %60 = call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %2, x86_fp80 %59, metadata !"olt", metadata !"fpexcept.strict") #8
  %61 = xor i1 %58, %60
  br i1 %61, label %146, label %62

62:                                               ; preds = %53
  %63 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.strict") #8
  %64 = call x86_fp80 @nextafterl(x86_fp80 noundef %2, x86_fp80 noundef %63) #7
  br label %146

65:                                               ; preds = %52
  %66 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.strict") #8
  %67 = call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %0, x86_fp80 %66, metadata !"ogt", metadata !"fpexcept.strict") #8
  %68 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.strict") #8
  %69 = call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %1, x86_fp80 %68, metadata !"olt", metadata !"fpexcept.strict") #8
  %70 = xor i1 %67, %69
  br i1 %70, label %146, label %71

71:                                               ; preds = %65
  %72 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float 0xFFF0000000000000, metadata !"fpexcept.strict") #8
  %73 = call x86_fp80 @nextafterl(x86_fp80 noundef %2, x86_fp80 noundef %72) #7
  br label %146

74:                                               ; preds = %52
  %75 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.strict") #8
  %76 = call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %0, x86_fp80 %75, metadata !"ogt", metadata !"fpexcept.strict") #8
  %77 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.strict") #8
  %78 = call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %1, x86_fp80 %77, metadata !"olt", metadata !"fpexcept.strict") #8
  %79 = xor i1 %76, %78
  br i1 %79, label %80, label %146

80:                                               ; preds = %74
  %81 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float 0x7FF0000000000000, metadata !"fpexcept.strict") #8
  %82 = call x86_fp80 @nextafterl(x86_fp80 noundef %2, x86_fp80 noundef %81) #7
  br label %146

83:                                               ; preds = %35
  %84 = icmp slt i32 %44, 129
  br i1 %84, label %85, label %88

85:                                               ; preds = %83
  %86 = sub nsw i32 0, %44
  %87 = call x86_fp80 @scalbnl(x86_fp80 noundef %38, i32 noundef %86) #7
  br label %90

88:                                               ; preds = %83
  %89 = call x86_fp80 @copysignl(x86_fp80 noundef 0xK00018000000000000000, x86_fp80 noundef %38) #7
  br label %90

90:                                               ; preds = %88, %85
  %91 = phi x86_fp80 [ %87, %85 ], [ %89, %88 ]
  %92 = call i32 @fesetround(i32 noundef 0) #7
  %93 = bitcast %struct.dd* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %93) #6
  call fastcc void @dd_mul(%struct.dd* nonnull sret(%struct.dd) align 16 %7, x86_fp80 noundef %36, x86_fp80 noundef %37) #9
  %94 = getelementptr inbounds %struct.dd, %struct.dd* %7, i64 0, i32 0
  %95 = load x86_fp80, x86_fp80* %94, align 16, !tbaa.struct !7
  %96 = getelementptr inbounds %struct.dd, %struct.dd* %7, i64 0, i32 1
  %97 = load x86_fp80, x86_fp80* %96, align 16, !tbaa.struct !10
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %93) #6
  %98 = call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %95, x86_fp80 %91, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %99 = call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %98, x86_fp80 %95, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %100 = call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %98, x86_fp80 %99, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %101 = call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %95, x86_fp80 %100, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %102 = call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %91, x86_fp80 %99, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %103 = call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %101, x86_fp80 %102, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %104 = load i32, i32* %4, align 4, !tbaa !3
  %105 = load i32, i32* %5, align 4, !tbaa !3
  %106 = add nsw i32 %105, %104
  %107 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.strict") #8
  %108 = call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %98, x86_fp80 %107, metadata !"oeq", metadata !"fpexcept.strict") #8
  br i1 %108, label %109, label %116

109:                                              ; preds = %90
  %110 = call i32 @fesetround(i32 noundef %39) #7
  %111 = bitcast x86_fp80* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 10, i8* nonnull %111)
  store volatile x86_fp80 %91, x86_fp80* %8, align 16, !tbaa !8
  %112 = load volatile x86_fp80, x86_fp80* %8, align 16, !tbaa !8
  %113 = call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %95, x86_fp80 %112, metadata !"round.dynamic", metadata !"fpexcept.strict") #8
  %114 = call x86_fp80 @scalbnl(x86_fp80 noundef %97, i32 noundef %106) #7
  %115 = call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %113, x86_fp80 %114, metadata !"round.dynamic", metadata !"fpexcept.strict") #8
  call void @llvm.lifetime.end.p0i8(i64 10, i8* nonnull %111)
  br label %146

116:                                              ; preds = %90
  %117 = icmp eq i32 %39, 0
  br i1 %117, label %136, label %118

118:                                              ; preds = %116
  %119 = call i32 @fetestexcept(i32 noundef 32) #7
  %120 = call i32 @feclearexcept(i32 noundef 32) #7
  %121 = call i32 @fesetround(i32 noundef %39) #7
  %122 = call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %103, x86_fp80 %97, metadata !"round.dynamic", metadata !"fpexcept.strict") #8
  %123 = call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %98, x86_fp80 %122, metadata !"round.dynamic", metadata !"fpexcept.strict") #8
  %124 = call x86_fp80 @scalbnl(x86_fp80 noundef %123, i32 noundef %106) #7
  %125 = call i32 @ilogbl(x86_fp80 noundef %124) #7
  %126 = icmp slt i32 %125, -16382
  br i1 %126, label %127, label %132

127:                                              ; preds = %118
  %128 = call i32 @fetestexcept(i32 noundef 32) #7
  %129 = icmp eq i32 %128, 0
  br i1 %129, label %132, label %130

130:                                              ; preds = %127
  %131 = call i32 @feraiseexcept(i32 noundef 16) #7
  br label %146

132:                                              ; preds = %127, %118
  %133 = icmp eq i32 %119, 0
  br i1 %133, label %146, label %134

134:                                              ; preds = %132
  %135 = call i32 @feraiseexcept(i32 noundef 32) #7
  br label %146

136:                                              ; preds = %116
  %137 = call fastcc x86_fp80 @add_adjusted(x86_fp80 noundef %103, x86_fp80 noundef %97) #9
  %138 = call i32 @ilogbl(x86_fp80 noundef %98) #7
  %139 = add nsw i32 %138, %106
  %140 = icmp sgt i32 %139, -16383
  br i1 %140, label %141, label %144

141:                                              ; preds = %136
  %142 = call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %98, x86_fp80 %137, metadata !"round.dynamic", metadata !"fpexcept.strict") #8
  %143 = call x86_fp80 @scalbnl(x86_fp80 noundef %142, i32 noundef %106) #7
  br label %146

144:                                              ; preds = %136
  %145 = call fastcc x86_fp80 @add_and_denormalize(x86_fp80 noundef %98, x86_fp80 noundef %137, i32 noundef %106) #9
  br label %146

146:                                              ; preds = %130, %134, %132, %74, %65, %53, %52, %19, %144, %141, %109, %80, %71, %62, %33, %28, %17
  %147 = phi x86_fp80 [ %29, %28 ], [ %34, %33 ], [ %82, %80 ], [ %73, %71 ], [ %64, %62 ], [ %115, %109 ], [ %143, %141 ], [ %145, %144 ], [ %18, %17 ], [ %2, %19 ], [ %2, %52 ], [ %2, %53 ], [ %2, %65 ], [ %2, %74 ], [ %124, %132 ], [ %124, %134 ], [ %124, %130 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %11) #6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %10) #6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %9) #6
  ret x86_fp80 %147
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @__fpclassifyl(x86_fp80 noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80, x86_fp80, metadata, metadata) #3

; Function Attrs: optsize
declare x86_fp80 @frexpl(x86_fp80 noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @fegetround() local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @feraiseexcept(i32 noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80, x86_fp80, metadata, metadata) #3

; Function Attrs: optsize
declare x86_fp80 @nextafterl(x86_fp80 noundef, x86_fp80 noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float, metadata) #3

; Function Attrs: optsize
declare x86_fp80 @scalbnl(x86_fp80 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare x86_fp80 @copysignl(x86_fp80 noundef, x86_fp80 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @fesetround(i32 noundef) local_unnamed_addr #2

; Function Attrs: inlinehint mustprogress nofree nosync nounwind optsize strictfp willreturn
define internal fastcc void @dd_mul(%struct.dd* noalias nocapture writeonly sret(%struct.dd) align 16 %0, x86_fp80 noundef %1, x86_fp80 noundef %2) unnamed_addr #4 {
  %4 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #8
  %5 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 0xK401F8000000000000000, x86_fp80 %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #8
  %6 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %1, x86_fp80 %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #8
  %7 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %1, x86_fp80 %6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #8
  %8 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %7, x86_fp80 %6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #8
  %9 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %1, x86_fp80 %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #8
  %10 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #8
  %11 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 0xK401F8000000000000000, x86_fp80 %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #8
  %12 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %2, x86_fp80 %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #8
  %13 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %2, x86_fp80 %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #8
  %14 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %13, x86_fp80 %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #8
  %15 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %2, x86_fp80 %14, metadata !"round.dynamic", metadata !"fpexcept.ignore") #8
  %16 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %8, x86_fp80 %14, metadata !"round.dynamic", metadata !"fpexcept.ignore") #8
  %17 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %9, x86_fp80 %14, metadata !"round.dynamic", metadata !"fpexcept.ignore") #8
  %18 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %8, x86_fp80 %15, x86_fp80 %17, metadata !"round.dynamic", metadata !"fpexcept.ignore") #8
  %19 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %16, x86_fp80 %18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #8
  %20 = getelementptr inbounds %struct.dd, %struct.dd* %0, i64 0, i32 0
  store x86_fp80 %19, x86_fp80* %20, align 16, !tbaa !11
  %21 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %16, x86_fp80 %19, metadata !"round.dynamic", metadata !"fpexcept.ignore") #8
  %22 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %21, x86_fp80 %18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #8
  %23 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %9, x86_fp80 %15, x86_fp80 %22, metadata !"round.dynamic", metadata !"fpexcept.ignore") #8
  %24 = getelementptr inbounds %struct.dd, %struct.dd* %0, i64 0, i32 1
  store x86_fp80 %23, x86_fp80* %24, align 16, !tbaa !13
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #3

; Function Attrs: optsize
declare i32 @fetestexcept(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @feclearexcept(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @ilogbl(x86_fp80 noundef) local_unnamed_addr #2

; Function Attrs: inlinehint nounwind optsize strictfp
define internal fastcc x86_fp80 @add_adjusted(x86_fp80 noundef %0, x86_fp80 noundef %1) unnamed_addr #5 {
  %3 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %0, x86_fp80 %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %4 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %3, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %5 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %3, x86_fp80 %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %6 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %0, x86_fp80 %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %7 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %1, x86_fp80 %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %8 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %6, x86_fp80 %7, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %9 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #8
  %10 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %8, x86_fp80 %9, metadata !"une", metadata !"fpexcept.ignore") #8
  br i1 %10, label %11, label %19

11:                                               ; preds = %2
  %12 = bitcast x86_fp80 %3 to i80
  %13 = and i80 %12, 1
  %14 = icmp eq i80 %13, 0
  br i1 %14, label %15, label %19

15:                                               ; preds = %11
  %16 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float 0x7FF0000000000000, metadata !"fpexcept.ignore") #8
  %17 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %16, x86_fp80 %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #8
  %18 = tail call x86_fp80 @nextafterl(x86_fp80 noundef %3, x86_fp80 noundef %17) #7
  br label %19

19:                                               ; preds = %11, %15, %2
  %20 = phi x86_fp80 [ %3, %11 ], [ %18, %15 ], [ %3, %2 ]
  ret x86_fp80 %20
}

; Function Attrs: inlinehint nounwind optsize strictfp
define internal fastcc x86_fp80 @add_and_denormalize(x86_fp80 noundef %0, x86_fp80 noundef %1, i32 noundef %2) unnamed_addr #5 {
  %4 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %0, x86_fp80 %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %5 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %4, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %6 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %4, x86_fp80 %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %7 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %0, x86_fp80 %6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %8 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %1, x86_fp80 %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %9 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %7, x86_fp80 %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %10 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #8
  %11 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %9, x86_fp80 %10, metadata !"une", metadata !"fpexcept.ignore") #8
  br i1 %11, label %12, label %25

12:                                               ; preds = %3
  %13 = bitcast x86_fp80 %4 to i80
  %14 = lshr i80 %13, 64
  %15 = trunc i80 %14 to i32
  %16 = sub i32 0, %2
  %17 = icmp eq i32 %15, %16
  %18 = and i80 %13, 1
  %19 = icmp ne i80 %18, 0
  %20 = xor i1 %19, %17
  br i1 %20, label %25, label %21

21:                                               ; preds = %12
  %22 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float 0x7FF0000000000000, metadata !"fpexcept.ignore") #8
  %23 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %22, x86_fp80 %9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #8
  %24 = tail call x86_fp80 @nextafterl(x86_fp80 noundef %4, x86_fp80 noundef %23) #7
  br label %25

25:                                               ; preds = %12, %21, %3
  %26 = phi x86_fp80 [ %24, %21 ], [ %4, %12 ], [ %4, %3 ]
  %27 = tail call x86_fp80 @scalbnl(x86_fp80 noundef %26, i32 noundef %2) #7
  ret x86_fp80 %27
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80, x86_fp80, metadata, metadata) #3

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #4 = { inlinehint mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { inlinehint nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind strictfp }
attributes #7 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #8 = { strictfp }
attributes #9 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{i64 0, i64 16, !8, i64 16, i64 16, !8}
!8 = !{!9, !9, i64 0}
!9 = !{!"long double", !5, i64 0}
!10 = !{i64 0, i64 16, !8}
!11 = !{!12, !9, i64 0}
!12 = !{!"dd", !9, i64 0, !9, i64 16}
!13 = !{!12, !9, i64 16}
