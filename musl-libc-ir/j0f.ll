; ModuleID = 'src/math/j0f.c'
source_filename = "src/math/j0f.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@pR8 = internal unnamed_addr constant [6 x float] [float 0.000000e+00, float -7.031250e-02, float 0xC02029D0C0000000, float 0xC070110280000000, float 0xC0A36A6EC0000000, float 0xC0B4850B40000000], align 16
@pS8 = internal unnamed_addr constant [5 x float] [float 0x405D223300000000, float 0x40ADF37D60000000, float 0x40E3D2BB60000000, float 0x40FC810F80000000, float 0x40E7417740000000], align 16
@pR5 = internal unnamed_addr constant [6 x float] [float 0xBDA918B140000000, float 0xBFB1FFFFE0000000, float 0xC010A37100000000, float 0xC050EB2F60000000, float 0xC074B3B360000000, float 0xC075A6EF20000000], align 16
@pS5 = internal unnamed_addr constant [5 x float] [float 0x404E608100000000, float 0x40906D0260000000, float 0x40B75AF880000000, float 0x40C2CCB900000000, float 0x40A2CC1DC0000000], align 16
@pR3 = internal unnamed_addr constant [6 x float] [float 0xBE25E10360000000, float 0xBFB1FFF700000000, float 0xC00345B2A0000000, float 0xC035F74A40000000, float 0xC04D0A2240000000, float 0xC03F72ACA0000000], align 16
@pS3 = internal unnamed_addr constant [5 x float] [float 0x4041ED9280000000, float 0x4076983940000000, float 0x4092A66E60000000, float 0x40919FFCC0000000, float 0x4065B29700000000], align 16
@pR2 = internal unnamed_addr constant [6 x float] [float 0xBE77D316E0000000, float 0xBFB1FF6240000000, float 0xBFF7363980000000, float 0xC01E8AF3E0000000, float 0xC02662E6C0000000, float 0xC009DE81A0000000], align 16
@pS2 = internal unnamed_addr constant [5 x float] [float 0x40363865A0000000, float 0x4061069E00000000, float 0x4070E78640000000, float 0x40633C0340000000, float 0x402D50B340000000], align 16
@qR8 = internal unnamed_addr constant [6 x float] [float 0.000000e+00, float 0x3FB2C00000000000, float 0x4027895260000000, float 0x40816D6320000000, float 0x40C14D9940000000, float 0x40E212D400000000], align 16
@qS8 = internal unnamed_addr constant [6 x float] [float 0x406478D540000000, float 0x40BFA25840000000, float 0x4101665260000000, float 0x412883DA80000000, float 0x4129A66B20000000, float 0xC114FD6D20000000], align 16
@qR5 = internal unnamed_addr constant [6 x float] [float 0x3DB43D8F20000000, float 0x3FB2BFFFE0000000, float 0x401757B0C0000000, float 0x4060E39200000000, float 0x40900CF9A0000000, float 0x409F17E960000000], align 16
@qS5 = internal unnamed_addr constant [6 x float] [float 0x4054B1B400000000, float 0x40A03BA0E0000000, float 0x40D267D280000000, float 0x40EBB5E3A0000000, float 0x40E1911820000000, float 0xC0B4EA57C0000000], align 16
@qR3 = internal unnamed_addr constant [6 x float] [float 0x3E32CD0360000000, float 0x3FB2BFEE00000000, float 0x400AC0FC60000000, float 0x40454F98A0000000, float 0x406559DBE0000000, float 0x4064D77C80000000], align 16
@qS3 = internal unnamed_addr constant [6 x float] [float 0x40486122C0000000, float 0x40862D8380000000, float 0x40ACF04BE0000000, float 0x40B93C6CE0000000, float 0x40A3A8AAE0000000, float 0xC062A7EB20000000], align 16
@qR2 = internal unnamed_addr constant [6 x float] [float 0x3E84313B60000000, float 0x3FB2BEC540000000, float 0x3FFFF897E0000000, float 0x402CFDBFA0000000, float 0x403FAA8E20000000, float 0x403040B180000000], align 16
@qS2 = internal unnamed_addr constant [6 x float] [float 0x403E5D9700000000, float 0x4070D591E0000000, float 0x408A664520000000, float 0x408B977CA0000000, float 0x406A955300000000, float 0xC0153E6B00000000], align 16

; Function Attrs: nounwind optsize strictfp
define float @j0f(float noundef %0) local_unnamed_addr #0 {
  %2 = bitcast float %0 to i32
  %3 = and i32 %2, 2147483647
  %4 = icmp ugt i32 %3, 2139095039
  br i1 %4, label %5, label %9

5:                                                ; preds = %1
  %6 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %7 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %8 = tail call float @llvm.experimental.constrained.fdiv.f32(float %6, float %7, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %47

9:                                                ; preds = %1
  %10 = tail call float @fabsf(float noundef %0) #4
  %11 = icmp ugt i32 %3, 1073741823
  br i1 %11, label %12, label %14

12:                                               ; preds = %9
  %13 = tail call fastcc float @common(i32 noundef %3, float noundef %10, i32 noundef 0) #5
  br label %47

14:                                               ; preds = %9
  %15 = icmp ugt i32 %3, 973078527
  br i1 %15, label %16, label %38

16:                                               ; preds = %14
  %17 = tail call float @llvm.experimental.constrained.fmul.f32(float %10, float %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %18 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %17, float 0xBE33D5E780000000, float 0x3EBEB1D100000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %19 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %17, float %18, float 0xBF28E6A5C0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %20 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %17, float %19, float 1.562500e-02, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %21 = tail call float @llvm.experimental.constrained.fmul.f32(float %17, float %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %22 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %23 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %17, float 0x3E1408BD00000000, float 0x3EA13B54C0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %24 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %17, float %23, float 0x3F1EA6D2E0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %25 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %17, float %24, float 0x3F8FFCE880000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %26 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %17, float %25, float %22, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %27 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %29 = tail call float @llvm.experimental.constrained.fdiv.f32(float %10, float %28, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %30 = tail call float @llvm.experimental.constrained.fadd.f32(float %27, float %29, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %31 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %32 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = tail call float @llvm.experimental.constrained.fdiv.f32(float %10, float %32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %34 = tail call float @llvm.experimental.constrained.fsub.f32(float %31, float %33, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %35 = tail call float @llvm.experimental.constrained.fdiv.f32(float %21, float %26, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %36 = tail call float @llvm.experimental.constrained.fmul.f32(float %17, float %35, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %37 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %30, float %34, float %36, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %47

38:                                               ; preds = %14
  %39 = icmp ugt i32 %3, 562036735
  br i1 %39, label %40, label %43

40:                                               ; preds = %38
  %41 = tail call float @llvm.experimental.constrained.fmul.f32(float 2.500000e-01, float %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %42 = tail call float @llvm.experimental.constrained.fmul.f32(float %41, float %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %43

43:                                               ; preds = %40, %38
  %44 = phi float [ %42, %40 ], [ %10, %38 ]
  %45 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %46 = tail call float @llvm.experimental.constrained.fsub.f32(float %45, float %44, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %47

47:                                               ; preds = %43, %16, %12, %5
  %48 = phi float [ %8, %5 ], [ %13, %12 ], [ %37, %16 ], [ %46, %43 ]
  ret float %48
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #1

; Function Attrs: optsize
declare float @fabsf(float noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc float @common(i32 noundef %0, float noundef %1, i32 noundef %2) unnamed_addr #0 {
  %4 = tail call float @sinf(float noundef %1) #4
  %5 = tail call float @cosf(float noundef %1) #4
  %6 = icmp eq i32 %2, 0
  %7 = fneg float %5
  %8 = select i1 %6, float %5, float %7
  %9 = tail call float @llvm.experimental.constrained.fadd.f32(float %4, float %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %10 = icmp ult i32 %0, 2130706432
  br i1 %10, label %11, label %127

11:                                               ; preds = %3
  %12 = tail call float @llvm.experimental.constrained.fsub.f32(float %4, float %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %13 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %14 = tail call float @llvm.experimental.constrained.fmul.f32(float %13, float %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %15 = tail call float @cosf(float noundef %14) #4
  %16 = fneg float %15
  %17 = tail call float @llvm.experimental.constrained.fmul.f32(float %4, float %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %18 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %19 = tail call i1 @llvm.experimental.constrained.fcmps.f32(float %17, float %18, metadata !"olt", metadata !"fpexcept.ignore") #3
  br i1 %19, label %20, label %22

20:                                               ; preds = %11
  %21 = tail call float @llvm.experimental.constrained.fdiv.f32(float %16, float %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %24

22:                                               ; preds = %11
  %23 = tail call float @llvm.experimental.constrained.fdiv.f32(float %16, float %9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %24

24:                                               ; preds = %22, %20
  %25 = phi float [ %12, %20 ], [ %23, %22 ]
  %26 = phi float [ %21, %20 ], [ %9, %22 ]
  %27 = icmp ult i32 %0, 1484783616
  br i1 %27, label %28, label %127

28:                                               ; preds = %24
  %29 = fneg float %25
  %30 = select i1 %6, float %25, float %29
  %31 = bitcast float %1 to i32
  %32 = and i32 %31, 2147483647
  %33 = icmp ugt i32 %32, 1090519039
  br i1 %33, label %40, label %34

34:                                               ; preds = %28
  %35 = icmp ugt i32 %32, 1083274218
  br i1 %35, label %40, label %36

36:                                               ; preds = %34
  %37 = icmp ugt i32 %32, 1077336342
  %38 = select i1 %37, float* getelementptr inbounds ([5 x float], [5 x float]* @pS3, i64 0, i64 0), float* getelementptr inbounds ([5 x float], [5 x float]* @pS2, i64 0, i64 0)
  %39 = select i1 %37, float* getelementptr inbounds ([6 x float], [6 x float]* @pR3, i64 0, i64 0), float* getelementptr inbounds ([6 x float], [6 x float]* @pR2, i64 0, i64 0)
  br label %40

40:                                               ; preds = %28, %34, %36
  %41 = phi float* [ getelementptr inbounds ([5 x float], [5 x float]* @pS8, i64 0, i64 0), %28 ], [ getelementptr inbounds ([5 x float], [5 x float]* @pS5, i64 0, i64 0), %34 ], [ %38, %36 ]
  %42 = phi float* [ getelementptr inbounds ([6 x float], [6 x float]* @pR8, i64 0, i64 0), %28 ], [ getelementptr inbounds ([6 x float], [6 x float]* @pR5, i64 0, i64 0), %34 ], [ %39, %36 ]
  %43 = tail call float @llvm.experimental.constrained.fmul.f32(float %1, float %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %44 = tail call float @llvm.experimental.constrained.fdiv.f32(float 1.000000e+00, float %43, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %45 = load float, float* %42, align 4, !tbaa !3
  %46 = getelementptr inbounds float, float* %42, i64 1
  %47 = load float, float* %46, align 4, !tbaa !3
  %48 = getelementptr inbounds float, float* %42, i64 2
  %49 = load float, float* %48, align 4, !tbaa !3
  %50 = getelementptr inbounds float, float* %42, i64 3
  %51 = load float, float* %50, align 4, !tbaa !3
  %52 = getelementptr inbounds float, float* %42, i64 4
  %53 = load float, float* %52, align 4, !tbaa !3
  %54 = getelementptr inbounds float, float* %42, i64 5
  %55 = load float, float* %54, align 4, !tbaa !3
  %56 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %44, float %55, float %53, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %57 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %44, float %56, float %51, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %58 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %44, float %57, float %49, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %59 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %44, float %58, float %47, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %60 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %44, float %59, float %45, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %61 = load float, float* %41, align 4, !tbaa !3
  %62 = getelementptr inbounds float, float* %41, i64 1
  %63 = load float, float* %62, align 4, !tbaa !3
  %64 = getelementptr inbounds float, float* %41, i64 2
  %65 = load float, float* %64, align 4, !tbaa !3
  %66 = getelementptr inbounds float, float* %41, i64 3
  %67 = load float, float* %66, align 4, !tbaa !3
  %68 = getelementptr inbounds float, float* %41, i64 4
  %69 = load float, float* %68, align 4, !tbaa !3
  %70 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %44, float %69, float %67, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %71 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %44, float %70, float %65, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %72 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %44, float %71, float %63, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %73 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %44, float %72, float %61, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %74 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %44, float %73, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %75 = tail call float @llvm.experimental.constrained.fdiv.f32(float %60, float %74, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %76 = tail call float @llvm.experimental.constrained.fadd.f32(float 1.000000e+00, float %75, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br i1 %33, label %83, label %77

77:                                               ; preds = %40
  %78 = icmp ugt i32 %32, 1083274218
  br i1 %78, label %83, label %79

79:                                               ; preds = %77
  %80 = icmp ugt i32 %32, 1077336342
  %81 = select i1 %80, float* getelementptr inbounds ([6 x float], [6 x float]* @qS3, i64 0, i64 0), float* getelementptr inbounds ([6 x float], [6 x float]* @qS2, i64 0, i64 0)
  %82 = select i1 %80, float* getelementptr inbounds ([6 x float], [6 x float]* @qR3, i64 0, i64 0), float* getelementptr inbounds ([6 x float], [6 x float]* @qR2, i64 0, i64 0)
  br label %83

83:                                               ; preds = %40, %77, %79
  %84 = phi float* [ getelementptr inbounds ([6 x float], [6 x float]* @qS8, i64 0, i64 0), %40 ], [ getelementptr inbounds ([6 x float], [6 x float]* @qS5, i64 0, i64 0), %77 ], [ %81, %79 ]
  %85 = phi float* [ getelementptr inbounds ([6 x float], [6 x float]* @qR8, i64 0, i64 0), %40 ], [ getelementptr inbounds ([6 x float], [6 x float]* @qR5, i64 0, i64 0), %77 ], [ %82, %79 ]
  %86 = tail call float @llvm.experimental.constrained.fmul.f32(float %1, float %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %87 = tail call float @llvm.experimental.constrained.fdiv.f32(float 1.000000e+00, float %86, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %88 = load float, float* %85, align 4, !tbaa !3
  %89 = getelementptr inbounds float, float* %85, i64 1
  %90 = load float, float* %89, align 4, !tbaa !3
  %91 = getelementptr inbounds float, float* %85, i64 2
  %92 = load float, float* %91, align 4, !tbaa !3
  %93 = getelementptr inbounds float, float* %85, i64 3
  %94 = load float, float* %93, align 4, !tbaa !3
  %95 = getelementptr inbounds float, float* %85, i64 4
  %96 = load float, float* %95, align 4, !tbaa !3
  %97 = getelementptr inbounds float, float* %85, i64 5
  %98 = load float, float* %97, align 4, !tbaa !3
  %99 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %87, float %98, float %96, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %100 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %87, float %99, float %94, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %101 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %87, float %100, float %92, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %102 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %87, float %101, float %90, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %103 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %87, float %102, float %88, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %104 = load float, float* %84, align 4, !tbaa !3
  %105 = getelementptr inbounds float, float* %84, i64 1
  %106 = load float, float* %105, align 4, !tbaa !3
  %107 = getelementptr inbounds float, float* %84, i64 2
  %108 = load float, float* %107, align 4, !tbaa !3
  %109 = getelementptr inbounds float, float* %84, i64 3
  %110 = load float, float* %109, align 4, !tbaa !3
  %111 = getelementptr inbounds float, float* %84, i64 4
  %112 = load float, float* %111, align 4, !tbaa !3
  %113 = getelementptr inbounds float, float* %84, i64 5
  %114 = load float, float* %113, align 4, !tbaa !3
  %115 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %87, float %114, float %112, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %116 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %87, float %115, float %110, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %117 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %87, float %116, float %108, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %118 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %87, float %117, float %106, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %119 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %87, float %118, float %104, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %120 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %87, float %119, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %121 = tail call float @llvm.experimental.constrained.fdiv.f32(float %103, float %120, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %122 = tail call float @llvm.experimental.constrained.fadd.f32(float -1.250000e-01, float %121, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %123 = tail call float @llvm.experimental.constrained.fdiv.f32(float %122, float %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %124 = tail call float @llvm.experimental.constrained.fmul.f32(float %123, float %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %125 = fneg float %124
  %126 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %76, float %26, float %125, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %127

127:                                              ; preds = %24, %83, %3
  %128 = phi float [ %126, %83 ], [ %26, %24 ], [ %9, %3 ]
  %129 = tail call float @llvm.experimental.constrained.fmul.f32(float 0x3FE20DD760000000, float %128, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %130 = tail call float @sqrtf(float noundef %1) #4
  %131 = tail call float @llvm.experimental.constrained.fdiv.f32(float %129, float %130, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  ret float %131
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmuladd.f32(float, float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #1

; Function Attrs: nounwind optsize strictfp
define float @y0f(float noundef %0) local_unnamed_addr #0 {
  %2 = bitcast float %0 to i32
  %3 = and i32 %2, 2147483647
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %8

5:                                                ; preds = %1
  %6 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 -1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %7 = tail call float @llvm.experimental.constrained.fdiv.f32(float %6, float 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %45

8:                                                ; preds = %1
  %9 = icmp sgt i32 %2, -1
  br i1 %9, label %13, label %10

10:                                               ; preds = %8
  %11 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %12 = tail call float @llvm.experimental.constrained.fdiv.f32(float %11, float 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %45

13:                                               ; preds = %8
  %14 = icmp ugt i32 %2, 2139095039
  br i1 %14, label %15, label %18

15:                                               ; preds = %13
  %16 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %17 = tail call float @llvm.experimental.constrained.fdiv.f32(float %16, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %45

18:                                               ; preds = %13
  %19 = icmp ugt i32 %2, 1073741823
  br i1 %19, label %20, label %22

20:                                               ; preds = %18
  %21 = tail call fastcc float @common(i32 noundef %2, float noundef %0, i32 noundef 1) #5
  br label %45

22:                                               ; preds = %18
  %23 = icmp ugt i32 %2, 956301311
  br i1 %23, label %24, label %42

24:                                               ; preds = %22
  %25 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %26 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %25, float 0xBDC5E43D60000000, float 0x3E55005740000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %27 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %25, float %26, float 0xBECFFEA780000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %25, float %27, float 0x3F36C54D20000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %29 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %25, float %28, float 0xBF8C4CE8C0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %30 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %25, float %29, float 0x3FC69D01A0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %31 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %25, float %30, float 0xBFB2E4D6A0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %32 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %25, float 0x3DFE501840000000, float 0x3E91642D80000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %34 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %25, float %33, float 0x3F13ECBC00000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %35 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %25, float %34, float 0x3F8A1270A0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %36 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %25, float %35, float %32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %37 = tail call float @llvm.experimental.constrained.fdiv.f32(float %31, float %36, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %38 = tail call float @j0f(float noundef %0) #5
  %39 = tail call float @logf(float noundef %0) #4
  %40 = tail call float @llvm.experimental.constrained.fmul.f32(float %38, float %39, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %41 = tail call float @llvm.experimental.constrained.fmuladd.f32(float 0x3FE45F3060000000, float %40, float %37, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %45

42:                                               ; preds = %22
  %43 = tail call float @logf(float noundef %0) #4
  %44 = tail call float @llvm.experimental.constrained.fmuladd.f32(float 0x3FE45F3060000000, float %43, float 0xBFB2E4D6A0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %45

45:                                               ; preds = %42, %24, %20, %15, %10, %5
  %46 = phi float [ %7, %5 ], [ %12, %10 ], [ %17, %15 ], [ %21, %20 ], [ %41, %24 ], [ %44, %42 ]
  ret float %46
}

; Function Attrs: optsize
declare float @logf(float noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare float @sinf(float noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare float @cosf(float noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f32(float, float, metadata, metadata) #1

; Function Attrs: optsize
declare float @sqrtf(float noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nobuiltin optsize strictfp "no-builtins" }
attributes #6 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"float", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
