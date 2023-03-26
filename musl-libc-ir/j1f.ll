; ModuleID = 'src/math/j1f.c'
source_filename = "src/math/j1f.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@pr8 = internal unnamed_addr constant [6 x float] [float 0.000000e+00, float 0x3FBE000000000000, float 0x402A7A9D40000000, float 0x4079C0D460000000, float 0x40AE457DA0000000, float 0x40BEEA7AC0000000], align 16
@ps8 = internal unnamed_addr constant [5 x float] [float 0x405C8D4580000000, float 0x40AC85DCA0000000, float 0x40E20B86A0000000, float 0x40F7D42CC0000000, float 0x40DE151160000000], align 16
@pr5 = internal unnamed_addr constant [6 x float] [float 0x3DAD0667E0000000, float 0x3FBDFFFFE0000000, float 0x401B360460000000, float 0x405B13B940000000, float 0x40802D16E0000000, float 0x408085B8C0000000], align 16
@ps5 = internal unnamed_addr constant [5 x float] [float 0x404DA3EAA0000000, float 0x408EFB3620000000, float 0x40B4E94460000000, float 0x40BEA4B0C0000000, float 0x4097803000000000], align 16
@pr3 = internal unnamed_addr constant [6 x float] [float 0x3E29FC21A0000000, float 0x3FBDFFF560000000, float 0x400F76BCE0000000, float 0x40418F48A0000000, float 0x4056C38540000000, float 0x4048478F80000000], align 16
@ps3 = internal unnamed_addr constant [5 x float] [float 0x40416549A0000000, float 0x40750C3300000000, float 0x40905B7C60000000, float 0x408BD67DA0000000, float 0x4059F26D80000000], align 16
@pr2 = internal unnamed_addr constant [6 x float] [float 0x3E7CE9D500000000, float 0x3FBDFF42C0000000, float 0x4002F2B800000000, float 0x40287C3780000000, float 0x4031B1A820000000, float 0x40144B49A0000000], align 16
@ps2 = internal unnamed_addr constant [5 x float] [float 0x40356FBD80000000, float 0x405F529320000000, float 0x406D08D8E0000000, float 0x405D6B7AE0000000, float 0x4020BAB200000000], align 16
@qr8 = internal unnamed_addr constant [6 x float] [float 0.000000e+00, float 0xBFBA400000000000, float 0xC0304591A0000000, float 0xC087BCD060000000, float 0xC0C724E740000000, float 0xC0E7A6D060000000], align 16
@qs8 = internal unnamed_addr constant [6 x float] [float 0x40642CA6E0000000, float 0x40BE9162E0000000, float 0x4100579AC0000000, float 0x4125F65380000000, float 0x412457D280000000, float 0xC111F96900000000], align 16
@qr5 = internal unnamed_addr constant [6 x float] [float 0xBDB6FA4320000000, float 0xBFBA3FFFC0000000, float 0xC0201CE6C0000000, float 0xC066F56D60000000, float 0xC09574C660000000, float 0xC0A468E380000000], align 16
@qs5 = internal unnamed_addr constant [6 x float] [float 0x405451B300000000, float 0x409F1F31E0000000, float 0x40D10F1F00000000, float 0x40E8576DA0000000, float 0x40DB4B04C0000000, float 0xC0B26F2F00000000], align 16
@qr3 = internal unnamed_addr constant [6 x float] [float 0xBE35CFA9E0000000, float 0xBFBA3FEB60000000, float 0xC01270C240000000, float 0xC04CEC71C0000000, float 0xC06C87D340000000, float 0xC06B66B960000000], align 16
@qs3 = internal unnamed_addr constant [6 x float] [float 0x4047D523C0000000, float 0x40850EEBC0000000, float 0x40AA684E40000000, float 0x40B5ABBAA0000000, float 0x409DBC7A00000000, float 0xC060E67020000000], align 16
@qr2 = internal unnamed_addr constant [6 x float] [float 0xBE87F12640000000, float 0xBFBA3E8EA0000000, float 0xC006048460000000, float 0xC033A9E2C0000000, float 0xC04529A3E0000000, float 0xC0355F3640000000], align 16
@qs2 = internal unnamed_addr constant [6 x float] [float 0x403D888A80000000, float 0x406F9F68E0000000, float 0x4087AC05C0000000, float 0x40871B2540000000, float 0x40637E5E40000000, float 0xC013D686E0000000], align 16

; Function Attrs: nounwind optsize strictfp
define float @j1f(float noundef %0) local_unnamed_addr #0 {
  %2 = bitcast float %0 to i32
  %3 = lshr i32 %2, 31
  %4 = and i32 %2, 2147483647
  %5 = icmp ugt i32 %4, 2139095039
  br i1 %5, label %6, label %10

6:                                                ; preds = %1
  %7 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %8 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %9 = tail call float @llvm.experimental.constrained.fdiv.f32(float %7, float %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %34

10:                                               ; preds = %1
  %11 = icmp ugt i32 %4, 1073741823
  br i1 %11, label %12, label %15

12:                                               ; preds = %10
  %13 = tail call float @fabsf(float noundef %0) #4
  %14 = tail call fastcc float @common(i32 noundef %4, float noundef %13, i32 noundef 0, i32 noundef %3) #5
  br label %34

15:                                               ; preds = %10
  %16 = icmp ugt i32 %4, 956301311
  br i1 %16, label %17, label %31

17:                                               ; preds = %15
  %18 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %19 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %18, float 0x3E6AAAFA40000000, float 0xBEF0C5C6C0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %20 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %18, float %19, float 0x3F570D9FA0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %21 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %18, float %20, float -6.250000e-02, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %22 = tail call float @llvm.experimental.constrained.fmul.f32(float %18, float %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %23 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %24 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %18, float 0x3DAB2ACFC0000000, float 0x3E35AC88C0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %25 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %18, float %24, float 0x3EB3BFF840000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %26 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %18, float %25, float 0x3F285F56C0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %27 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %18, float %26, float 0x3F939D0B20000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %18, float %27, float %23, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %29 = tail call float @llvm.experimental.constrained.fdiv.f32(float %22, float %28, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %30 = tail call float @llvm.experimental.constrained.fadd.f32(float 5.000000e-01, float %29, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %31

31:                                               ; preds = %15, %17
  %32 = phi float [ %30, %17 ], [ 5.000000e-01, %15 ]
  %33 = tail call float @llvm.experimental.constrained.fmul.f32(float %32, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %34

34:                                               ; preds = %31, %12, %6
  %35 = phi float [ %9, %6 ], [ %14, %12 ], [ %33, %31 ]
  ret float %35
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #1

; Function Attrs: nounwind optsize strictfp
define internal fastcc float @common(i32 noundef %0, float noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #0 {
  %5 = tail call float @sinf(float noundef %1) #4
  %6 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %5, metadata !"fpexcept.ignore") #3
  %7 = icmp eq i32 %2, 0
  %8 = fneg double %6
  %9 = select i1 %7, double %6, double %8
  %10 = tail call float @cosf(float noundef %1) #4
  %11 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %10, metadata !"fpexcept.ignore") #3
  %12 = tail call double @llvm.experimental.constrained.fsub.f64(double %9, double %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %13 = icmp ult i32 %0, 2130706432
  br i1 %13, label %14, label %133

14:                                               ; preds = %4
  %15 = fneg double %9
  %16 = tail call double @llvm.experimental.constrained.fsub.f64(double %15, double %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %17 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %18 = tail call float @llvm.experimental.constrained.fmul.f32(float %17, float %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %19 = tail call float @cosf(float noundef %18) #4
  %20 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %19, metadata !"fpexcept.ignore") #3
  %21 = tail call double @llvm.experimental.constrained.fmul.f64(double %9, double %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %22 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %23 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %21, double %22, metadata !"ogt", metadata !"fpexcept.ignore") #3
  br i1 %23, label %24, label %26

24:                                               ; preds = %14
  %25 = tail call double @llvm.experimental.constrained.fdiv.f64(double %20, double %16, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %28

26:                                               ; preds = %14
  %27 = tail call double @llvm.experimental.constrained.fdiv.f64(double %20, double %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %28

28:                                               ; preds = %26, %24
  %29 = phi double [ %16, %24 ], [ %27, %26 ]
  %30 = phi double [ %25, %24 ], [ %12, %26 ]
  %31 = icmp ult i32 %0, 1484783616
  br i1 %31, label %32, label %133

32:                                               ; preds = %28
  %33 = fneg double %29
  %34 = select i1 %7, double %29, double %33
  %35 = bitcast float %1 to i32
  %36 = and i32 %35, 2147483647
  %37 = icmp ugt i32 %36, 1090519039
  br i1 %37, label %44, label %38

38:                                               ; preds = %32
  %39 = icmp ugt i32 %36, 1083274218
  br i1 %39, label %44, label %40

40:                                               ; preds = %38
  %41 = icmp ugt i32 %36, 1077336342
  %42 = select i1 %41, float* getelementptr inbounds ([5 x float], [5 x float]* @ps3, i64 0, i64 0), float* getelementptr inbounds ([5 x float], [5 x float]* @ps2, i64 0, i64 0)
  %43 = select i1 %41, float* getelementptr inbounds ([6 x float], [6 x float]* @pr3, i64 0, i64 0), float* getelementptr inbounds ([6 x float], [6 x float]* @pr2, i64 0, i64 0)
  br label %44

44:                                               ; preds = %32, %38, %40
  %45 = phi float* [ getelementptr inbounds ([5 x float], [5 x float]* @ps8, i64 0, i64 0), %32 ], [ getelementptr inbounds ([5 x float], [5 x float]* @ps5, i64 0, i64 0), %38 ], [ %42, %40 ]
  %46 = phi float* [ getelementptr inbounds ([6 x float], [6 x float]* @pr8, i64 0, i64 0), %32 ], [ getelementptr inbounds ([6 x float], [6 x float]* @pr5, i64 0, i64 0), %38 ], [ %43, %40 ]
  %47 = tail call float @llvm.experimental.constrained.fmul.f32(float %1, float %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %48 = tail call float @llvm.experimental.constrained.fdiv.f32(float 1.000000e+00, float %47, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %49 = load float, float* %46, align 4, !tbaa !3
  %50 = getelementptr inbounds float, float* %46, i64 1
  %51 = load float, float* %50, align 4, !tbaa !3
  %52 = getelementptr inbounds float, float* %46, i64 2
  %53 = load float, float* %52, align 4, !tbaa !3
  %54 = getelementptr inbounds float, float* %46, i64 3
  %55 = load float, float* %54, align 4, !tbaa !3
  %56 = getelementptr inbounds float, float* %46, i64 4
  %57 = load float, float* %56, align 4, !tbaa !3
  %58 = getelementptr inbounds float, float* %46, i64 5
  %59 = load float, float* %58, align 4, !tbaa !3
  %60 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %48, float %59, float %57, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %61 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %48, float %60, float %55, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %62 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %48, float %61, float %53, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %63 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %48, float %62, float %51, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %64 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %48, float %63, float %49, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %65 = load float, float* %45, align 4, !tbaa !3
  %66 = getelementptr inbounds float, float* %45, i64 1
  %67 = load float, float* %66, align 4, !tbaa !3
  %68 = getelementptr inbounds float, float* %45, i64 2
  %69 = load float, float* %68, align 4, !tbaa !3
  %70 = getelementptr inbounds float, float* %45, i64 3
  %71 = load float, float* %70, align 4, !tbaa !3
  %72 = getelementptr inbounds float, float* %45, i64 4
  %73 = load float, float* %72, align 4, !tbaa !3
  %74 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %48, float %73, float %71, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %75 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %48, float %74, float %69, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %76 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %48, float %75, float %67, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %77 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %48, float %76, float %65, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %78 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %48, float %77, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %79 = tail call float @llvm.experimental.constrained.fdiv.f32(float %64, float %78, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %80 = tail call float @llvm.experimental.constrained.fadd.f32(float 1.000000e+00, float %79, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %81 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %80, metadata !"fpexcept.ignore") #3
  br i1 %37, label %88, label %82

82:                                               ; preds = %44
  %83 = icmp ugt i32 %36, 1083274218
  br i1 %83, label %88, label %84

84:                                               ; preds = %82
  %85 = icmp ugt i32 %36, 1077336342
  %86 = select i1 %85, float* getelementptr inbounds ([6 x float], [6 x float]* @qs3, i64 0, i64 0), float* getelementptr inbounds ([6 x float], [6 x float]* @qs2, i64 0, i64 0)
  %87 = select i1 %85, float* getelementptr inbounds ([6 x float], [6 x float]* @qr3, i64 0, i64 0), float* getelementptr inbounds ([6 x float], [6 x float]* @qr2, i64 0, i64 0)
  br label %88

88:                                               ; preds = %44, %82, %84
  %89 = phi float* [ getelementptr inbounds ([6 x float], [6 x float]* @qs8, i64 0, i64 0), %44 ], [ getelementptr inbounds ([6 x float], [6 x float]* @qs5, i64 0, i64 0), %82 ], [ %86, %84 ]
  %90 = phi float* [ getelementptr inbounds ([6 x float], [6 x float]* @qr8, i64 0, i64 0), %44 ], [ getelementptr inbounds ([6 x float], [6 x float]* @qr5, i64 0, i64 0), %82 ], [ %87, %84 ]
  %91 = tail call float @llvm.experimental.constrained.fmul.f32(float %1, float %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %92 = tail call float @llvm.experimental.constrained.fdiv.f32(float 1.000000e+00, float %91, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %93 = load float, float* %90, align 4, !tbaa !3
  %94 = getelementptr inbounds float, float* %90, i64 1
  %95 = load float, float* %94, align 4, !tbaa !3
  %96 = getelementptr inbounds float, float* %90, i64 2
  %97 = load float, float* %96, align 4, !tbaa !3
  %98 = getelementptr inbounds float, float* %90, i64 3
  %99 = load float, float* %98, align 4, !tbaa !3
  %100 = getelementptr inbounds float, float* %90, i64 4
  %101 = load float, float* %100, align 4, !tbaa !3
  %102 = getelementptr inbounds float, float* %90, i64 5
  %103 = load float, float* %102, align 4, !tbaa !3
  %104 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %92, float %103, float %101, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %105 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %92, float %104, float %99, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %106 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %92, float %105, float %97, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %107 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %92, float %106, float %95, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %108 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %92, float %107, float %93, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %109 = load float, float* %89, align 4, !tbaa !3
  %110 = getelementptr inbounds float, float* %89, i64 1
  %111 = load float, float* %110, align 4, !tbaa !3
  %112 = getelementptr inbounds float, float* %89, i64 2
  %113 = load float, float* %112, align 4, !tbaa !3
  %114 = getelementptr inbounds float, float* %89, i64 3
  %115 = load float, float* %114, align 4, !tbaa !3
  %116 = getelementptr inbounds float, float* %89, i64 4
  %117 = load float, float* %116, align 4, !tbaa !3
  %118 = getelementptr inbounds float, float* %89, i64 5
  %119 = load float, float* %118, align 4, !tbaa !3
  %120 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %92, float %119, float %117, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %121 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %92, float %120, float %115, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %122 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %92, float %121, float %113, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %123 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %92, float %122, float %111, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %124 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %92, float %123, float %109, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %125 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %92, float %124, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %126 = tail call float @llvm.experimental.constrained.fdiv.f32(float %108, float %125, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %127 = tail call float @llvm.experimental.constrained.fadd.f32(float 3.750000e-01, float %126, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %128 = tail call float @llvm.experimental.constrained.fdiv.f32(float %127, float %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %129 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %128, metadata !"fpexcept.ignore") #3
  %130 = tail call double @llvm.experimental.constrained.fmul.f64(double %129, double %34, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %131 = fneg double %130
  %132 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %81, double %30, double %131, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %133

133:                                              ; preds = %28, %88, %4
  %134 = phi double [ %132, %88 ], [ %30, %28 ], [ %12, %4 ]
  %135 = icmp eq i32 %3, 0
  %136 = fneg double %134
  %137 = select i1 %135, double %134, double %136
  %138 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x3FE20DD760000000, metadata !"fpexcept.ignore") #3
  %139 = tail call double @llvm.experimental.constrained.fmul.f64(double %138, double %137, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %140 = tail call float @sqrtf(float noundef %1) #4
  %141 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %140, metadata !"fpexcept.ignore") #3
  %142 = tail call double @llvm.experimental.constrained.fdiv.f64(double %139, double %141, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %143 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %142, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  ret float %143
}

; Function Attrs: optsize
declare float @fabsf(float noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmuladd.f32(float, float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #1

; Function Attrs: nounwind optsize strictfp
define float @y1f(float noundef %0) local_unnamed_addr #0 {
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
  %21 = tail call fastcc float @common(i32 noundef %2, float noundef %0, i32 noundef 1, i32 noundef 0) #5
  br label %45

22:                                               ; preds = %18
  %23 = icmp ult i32 %2, 855638016
  br i1 %23, label %24, label %26

24:                                               ; preds = %22
  %25 = tail call float @llvm.experimental.constrained.fdiv.f32(float 0xBFE45F3060000000, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %45

26:                                               ; preds = %22
  %27 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %27, float 0xBE78AC0060000000, float 0x3EF8AB0380000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %29 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %27, float %28, float 0xBF5F55E540000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %30 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %27, float %29, float 0x3FA9D3C780000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %31 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %27, float %30, float 0xBFC9186620000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %32 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %27, float 0x3DB25039E0000000, float 0x3E3ABF1D60000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %27, float %32, float 0x3EB6C05A80000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %34 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %27, float %33, float 0x3F2A8C8960000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %35 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %27, float %34, float 0x3F94650D40000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %36 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %27, float %35, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %37 = tail call float @llvm.experimental.constrained.fdiv.f32(float %31, float %36, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %38 = tail call float @j1f(float noundef %0) #5
  %39 = tail call float @logf(float noundef %0) #4
  %40 = tail call float @llvm.experimental.constrained.fdiv.f32(float 1.000000e+00, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %41 = fneg float %40
  %42 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %38, float %39, float %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %43 = tail call float @llvm.experimental.constrained.fmul.f32(float 0x3FE45F3060000000, float %42, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %44 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %0, float %37, float %43, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %45

45:                                               ; preds = %26, %24, %20, %15, %10, %5
  %46 = phi float [ %7, %5 ], [ %12, %10 ], [ %17, %15 ], [ %21, %20 ], [ %25, %24 ], [ %44, %26 ]
  ret float %46
}

; Function Attrs: optsize
declare float @logf(float noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare float @sinf(float noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #1

; Function Attrs: optsize
declare float @cosf(float noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #1

; Function Attrs: optsize
declare float @sqrtf(float noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #1

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
