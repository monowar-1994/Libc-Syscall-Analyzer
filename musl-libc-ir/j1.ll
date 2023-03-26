; ModuleID = 'src/math/j1.c'
source_filename = "src/math/j1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@pr8 = internal unnamed_addr constant [6 x double] [double 0.000000e+00, double 0x3FBDFFFFFFFFFCCE, double 0x402A7A9D357F7FCE, double 0x4079C0D4652EA590, double 0x40AE457DA3A532CC, double 0x40BEEA7AC32782DD], align 16
@ps8 = internal unnamed_addr constant [5 x double] [double 0x405C8D458E656CAC, double 0x40AC85DC964D274F, double 0x40E20B8697C5BB7F, double 0x40F7D42CB28F17BB, double 0x40DE1511697A0B2D], align 16
@pr5 = internal unnamed_addr constant [6 x double] [double 0x3DAD0667DAE1CA7D, double 0x3FBDFFFFE2C10043, double 0x401B36046E6315E3, double 0x405B13B9452602ED, double 0x40802D16D052D649, double 0x408085B8BB7E0CB7], align 16
@ps5 = internal unnamed_addr constant [5 x double] [double 0x404DA3EAA8AF633D, double 0x408EFB361B066701, double 0x40B4E9445706B6FB, double 0x40BEA4B0B8A5BB15, double 0x40978030036F5E51], align 16
@pr3 = internal unnamed_addr constant [6 x double] [double 0x3E29FC21A7AD9EDD, double 0x3FBDFFF55B21D17B, double 0x400F76BCE85EAD8A, double 0x40418F489DA6D129, double 0x4056C3854D2C1837, double 0x4048478F8EA83EE5], align 16
@ps3 = internal unnamed_addr constant [5 x double] [double 0x40416549A134069C, double 0x40750C3307F1A75F, double 0x40905B7C5037D523, double 0x408BD67DA32E31E9, double 0x4059F26D7C2EED53], align 16
@pr2 = internal unnamed_addr constant [6 x double] [double 0x3E7CE9D4F65544F4, double 0x3FBDFF42BE760D83, double 0x4002F2B7F98FAEC0, double 0x40287C377F71A964, double 0x4031B1A8177F8EE2, double 0x40144B49A574C1FE], align 16
@ps2 = internal unnamed_addr constant [5 x double] [double 0x40356FBD8AD5ECDC, double 0x405F529314F92CD5, double 0x406D08D8D5A2DBD9, double 0x405D6B7ADA1884A9, double 0x4020BAB1F44E5192], align 16
@qr8 = internal unnamed_addr constant [6 x double] [double 0.000000e+00, double 0xBFBA3FFFFFFFFDF3, double 0xC0304591A26779F7, double 0xC087BCD053E4B576, double 0xC0C724E740F87415, double 0xC0E7A6D065D09C6A], align 16
@qs8 = internal unnamed_addr constant [6 x double] [double 0x40642CA6DE5BCDE5, double 0x40BE9162D0D88419, double 0x4100579AB0B75E98, double 0x4125F65372869C19, double 0x412457D27719AD5C, double 0xC111F9690EA5AA18], align 16
@qr5 = internal unnamed_addr constant [6 x double] [double 0xBDB6FA431AA1A098, double 0xBFBA3FFFCB597FEF, double 0xC0201CE6CA03AD4B, double 0xC066F56D6CA7B9B0, double 0xC09574C66931734F, double 0xC0A468E388FDA79D], align 16
@qs5 = internal unnamed_addr constant [6 x double] [double 0x405451B2FF5A11B2, double 0x409F1F31E77BF839, double 0x40D10F1F0D64CE29, double 0x40E8576DAABAD197, double 0x40DB4B04CF7C364B, double 0xC0B26F2EFCFFA004], align 16
@qr3 = internal unnamed_addr constant [6 x double] [double 0xBE35CFA9D38FC84F, double 0xBFBA3FEB51AEED54, double 0xC01270C23302D9FF, double 0xC04CEC71C25D16DA, double 0xC06C87D34718D55F, double 0xC06B66B95F5C1BF6], align 16
@qs3 = internal unnamed_addr constant [6 x double] [double 0x4047D523CCD367E4, double 0x40850EEBC031EE3E, double 0x40AA684E448E7C9A, double 0x40B5ABBAA61D54A6, double 0x409DBC7A0DD4DF4B, double 0xC060E670290A311F], align 16
@qr2 = internal unnamed_addr constant [6 x double] [double 0xBE87F12644C626D2, double 0xBFBA3E8E9148B010, double 0xC006048469BB4EDA, double 0xC033A9E2C168907F, double 0xC04529A3DE104AAA, double 0xC0355F3639CF6E52], align 16
@qs2 = internal unnamed_addr constant [6 x double] [double 0x403D888A78AE64FF, double 0x406F9F68DB821CBA, double 0x4087AC05CE49A0F7, double 0x40871B2548D4C029, double 0x40637E5E3C3ED8D4, double 0xC013D686E71BE86B], align 16

; Function Attrs: nounwind optsize strictfp
define double @j1(double noundef %0) local_unnamed_addr #0 {
  %2 = bitcast double %0 to i64
  %3 = lshr i64 %2, 32
  %4 = trunc i64 %3 to i32
  %5 = lshr i32 %4, 31
  %6 = and i32 %4, 2147483647
  %7 = icmp ugt i32 %6, 2146435071
  br i1 %7, label %8, label %12

8:                                                ; preds = %1
  %9 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %10 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %11 = tail call double @llvm.experimental.constrained.fdiv.f64(double %9, double %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %36

12:                                               ; preds = %1
  %13 = icmp ugt i32 %6, 1073741823
  br i1 %13, label %14, label %17

14:                                               ; preds = %12
  %15 = tail call double @fabs(double noundef %0) #4
  %16 = tail call fastcc double @common(i32 noundef %6, double noundef %15, i32 noundef 0, i32 noundef %5) #5
  br label %36

17:                                               ; preds = %12
  %18 = icmp ugt i32 %6, 939524095
  br i1 %18, label %19, label %32

19:                                               ; preds = %17
  %20 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %21 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %20, double 0x3E6AAAFA46CA0BD9, double 0xBEF0C5C6BA169668, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %22 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %20, double %21, double 0x3F570D9F98472C61, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %23 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %20, double %22, double -6.250000e-02, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %24 = tail call double @llvm.experimental.constrained.fmul.f64(double %20, double %23, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %25 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %26 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %20, double 0x3DAB2ACFCFB97ED8, double 0x3E35AC88C97DFF2C, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %27 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %20, double %26, double 0x3EB3BFF8333F8498, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %20, double %27, double 0x3F285F56B9CDF664, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %29 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %20, double %28, double 0x3F939D0B12637E53, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %30 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %20, double %29, double %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %31 = tail call double @llvm.experimental.constrained.fdiv.f64(double %24, double %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %32

32:                                               ; preds = %17, %19
  %33 = phi double [ %31, %19 ], [ %0, %17 ]
  %34 = tail call double @llvm.experimental.constrained.fadd.f64(double 5.000000e-01, double %33, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %35 = tail call double @llvm.experimental.constrained.fmul.f64(double %34, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %36

36:                                               ; preds = %32, %14, %8
  %37 = phi double [ %11, %8 ], [ %16, %14 ], [ %35, %32 ]
  ret double %37
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #1

; Function Attrs: nounwind optsize strictfp
define internal fastcc double @common(i32 noundef %0, double noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #0 {
  %5 = tail call double @sin(double noundef %1) #4
  %6 = icmp eq i32 %2, 0
  %7 = fneg double %5
  %8 = select i1 %6, double %5, double %7
  %9 = tail call double @cos(double noundef %1) #4
  %10 = tail call double @llvm.experimental.constrained.fsub.f64(double %8, double %9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %11 = icmp ult i32 %0, 2145386496
  br i1 %11, label %12, label %130

12:                                               ; preds = %4
  %13 = fneg double %8
  %14 = tail call double @llvm.experimental.constrained.fsub.f64(double %13, double %9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %15 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %16 = tail call double @llvm.experimental.constrained.fmul.f64(double %15, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %17 = tail call double @cos(double noundef %16) #4
  %18 = tail call double @llvm.experimental.constrained.fmul.f64(double %8, double %9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %19 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %20 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %18, double %19, metadata !"ogt", metadata !"fpexcept.ignore") #3
  br i1 %20, label %21, label %23

21:                                               ; preds = %12
  %22 = tail call double @llvm.experimental.constrained.fdiv.f64(double %17, double %14, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %25

23:                                               ; preds = %12
  %24 = tail call double @llvm.experimental.constrained.fdiv.f64(double %17, double %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %25

25:                                               ; preds = %23, %21
  %26 = phi double [ %14, %21 ], [ %24, %23 ]
  %27 = phi double [ %22, %21 ], [ %10, %23 ]
  %28 = icmp ult i32 %0, 1207959552
  br i1 %28, label %29, label %130

29:                                               ; preds = %25
  %30 = fneg double %26
  %31 = select i1 %6, double %26, double %30
  %32 = bitcast double %1 to i64
  %33 = lshr i64 %32, 32
  %34 = trunc i64 %33 to i32
  %35 = and i32 %34, 2147483647
  %36 = icmp ugt i32 %35, 1075838975
  br i1 %36, label %43, label %37

37:                                               ; preds = %29
  %38 = icmp ugt i32 %35, 1074933386
  br i1 %38, label %43, label %39

39:                                               ; preds = %37
  %40 = icmp ugt i32 %35, 1074191212
  %41 = select i1 %40, double* getelementptr inbounds ([5 x double], [5 x double]* @ps3, i64 0, i64 0), double* getelementptr inbounds ([5 x double], [5 x double]* @ps2, i64 0, i64 0)
  %42 = select i1 %40, double* getelementptr inbounds ([6 x double], [6 x double]* @pr3, i64 0, i64 0), double* getelementptr inbounds ([6 x double], [6 x double]* @pr2, i64 0, i64 0)
  br label %43

43:                                               ; preds = %29, %37, %39
  %44 = phi double* [ getelementptr inbounds ([5 x double], [5 x double]* @ps8, i64 0, i64 0), %29 ], [ getelementptr inbounds ([5 x double], [5 x double]* @ps5, i64 0, i64 0), %37 ], [ %41, %39 ]
  %45 = phi double* [ getelementptr inbounds ([6 x double], [6 x double]* @pr8, i64 0, i64 0), %29 ], [ getelementptr inbounds ([6 x double], [6 x double]* @pr5, i64 0, i64 0), %37 ], [ %42, %39 ]
  %46 = tail call double @llvm.experimental.constrained.fmul.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %47 = tail call double @llvm.experimental.constrained.fdiv.f64(double 1.000000e+00, double %46, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %48 = load double, double* %45, align 8, !tbaa !3
  %49 = getelementptr inbounds double, double* %45, i64 1
  %50 = load double, double* %49, align 8, !tbaa !3
  %51 = getelementptr inbounds double, double* %45, i64 2
  %52 = load double, double* %51, align 8, !tbaa !3
  %53 = getelementptr inbounds double, double* %45, i64 3
  %54 = load double, double* %53, align 8, !tbaa !3
  %55 = getelementptr inbounds double, double* %45, i64 4
  %56 = load double, double* %55, align 8, !tbaa !3
  %57 = getelementptr inbounds double, double* %45, i64 5
  %58 = load double, double* %57, align 8, !tbaa !3
  %59 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %47, double %58, double %56, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %60 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %47, double %59, double %54, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %61 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %47, double %60, double %52, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %62 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %47, double %61, double %50, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %63 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %47, double %62, double %48, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %64 = load double, double* %44, align 8, !tbaa !3
  %65 = getelementptr inbounds double, double* %44, i64 1
  %66 = load double, double* %65, align 8, !tbaa !3
  %67 = getelementptr inbounds double, double* %44, i64 2
  %68 = load double, double* %67, align 8, !tbaa !3
  %69 = getelementptr inbounds double, double* %44, i64 3
  %70 = load double, double* %69, align 8, !tbaa !3
  %71 = getelementptr inbounds double, double* %44, i64 4
  %72 = load double, double* %71, align 8, !tbaa !3
  %73 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %47, double %72, double %70, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %74 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %47, double %73, double %68, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %75 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %47, double %74, double %66, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %76 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %47, double %75, double %64, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %77 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %47, double %76, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %78 = tail call double @llvm.experimental.constrained.fdiv.f64(double %63, double %77, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %79 = tail call double @llvm.experimental.constrained.fadd.f64(double 1.000000e+00, double %78, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br i1 %36, label %86, label %80

80:                                               ; preds = %43
  %81 = icmp ugt i32 %35, 1074933386
  br i1 %81, label %86, label %82

82:                                               ; preds = %80
  %83 = icmp ugt i32 %35, 1074191212
  %84 = select i1 %83, double* getelementptr inbounds ([6 x double], [6 x double]* @qs3, i64 0, i64 0), double* getelementptr inbounds ([6 x double], [6 x double]* @qs2, i64 0, i64 0)
  %85 = select i1 %83, double* getelementptr inbounds ([6 x double], [6 x double]* @qr3, i64 0, i64 0), double* getelementptr inbounds ([6 x double], [6 x double]* @qr2, i64 0, i64 0)
  br label %86

86:                                               ; preds = %43, %80, %82
  %87 = phi double* [ getelementptr inbounds ([6 x double], [6 x double]* @qs8, i64 0, i64 0), %43 ], [ getelementptr inbounds ([6 x double], [6 x double]* @qs5, i64 0, i64 0), %80 ], [ %84, %82 ]
  %88 = phi double* [ getelementptr inbounds ([6 x double], [6 x double]* @qr8, i64 0, i64 0), %43 ], [ getelementptr inbounds ([6 x double], [6 x double]* @qr5, i64 0, i64 0), %80 ], [ %85, %82 ]
  %89 = tail call double @llvm.experimental.constrained.fmul.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %90 = tail call double @llvm.experimental.constrained.fdiv.f64(double 1.000000e+00, double %89, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %91 = load double, double* %88, align 8, !tbaa !3
  %92 = getelementptr inbounds double, double* %88, i64 1
  %93 = load double, double* %92, align 8, !tbaa !3
  %94 = getelementptr inbounds double, double* %88, i64 2
  %95 = load double, double* %94, align 8, !tbaa !3
  %96 = getelementptr inbounds double, double* %88, i64 3
  %97 = load double, double* %96, align 8, !tbaa !3
  %98 = getelementptr inbounds double, double* %88, i64 4
  %99 = load double, double* %98, align 8, !tbaa !3
  %100 = getelementptr inbounds double, double* %88, i64 5
  %101 = load double, double* %100, align 8, !tbaa !3
  %102 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %90, double %101, double %99, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %103 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %90, double %102, double %97, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %104 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %90, double %103, double %95, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %105 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %90, double %104, double %93, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %106 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %90, double %105, double %91, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %107 = load double, double* %87, align 8, !tbaa !3
  %108 = getelementptr inbounds double, double* %87, i64 1
  %109 = load double, double* %108, align 8, !tbaa !3
  %110 = getelementptr inbounds double, double* %87, i64 2
  %111 = load double, double* %110, align 8, !tbaa !3
  %112 = getelementptr inbounds double, double* %87, i64 3
  %113 = load double, double* %112, align 8, !tbaa !3
  %114 = getelementptr inbounds double, double* %87, i64 4
  %115 = load double, double* %114, align 8, !tbaa !3
  %116 = getelementptr inbounds double, double* %87, i64 5
  %117 = load double, double* %116, align 8, !tbaa !3
  %118 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %90, double %117, double %115, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %119 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %90, double %118, double %113, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %120 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %90, double %119, double %111, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %121 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %90, double %120, double %109, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %122 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %90, double %121, double %107, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %123 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %90, double %122, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %124 = tail call double @llvm.experimental.constrained.fdiv.f64(double %106, double %123, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %125 = tail call double @llvm.experimental.constrained.fadd.f64(double 3.750000e-01, double %124, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %126 = tail call double @llvm.experimental.constrained.fdiv.f64(double %125, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %127 = tail call double @llvm.experimental.constrained.fmul.f64(double %126, double %31, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %128 = fneg double %127
  %129 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %79, double %27, double %128, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %130

130:                                              ; preds = %25, %86, %4
  %131 = phi double [ %129, %86 ], [ %27, %25 ], [ %10, %4 ]
  %132 = icmp eq i32 %3, 0
  %133 = fneg double %131
  %134 = select i1 %132, double %131, double %133
  %135 = tail call double @llvm.experimental.constrained.fmul.f64(double 0x3FE20DD750429B6D, double %134, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %136 = tail call double @sqrt(double noundef %1) #4
  %137 = tail call double @llvm.experimental.constrained.fdiv.f64(double %135, double %136, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  ret double %137
}

; Function Attrs: optsize
declare double @fabs(double noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #1

; Function Attrs: nounwind optsize strictfp
define double @y1(double noundef %0) local_unnamed_addr #0 {
  %2 = bitcast double %0 to i64
  %3 = lshr i64 %2, 32
  %4 = trunc i64 %3 to i32
  %5 = trunc i64 %2 to i32
  %6 = shl i32 %4, 1
  %7 = or i32 %6, %5
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %12

9:                                                ; preds = %1
  %10 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 -1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %11 = tail call double @llvm.experimental.constrained.fdiv.f64(double %10, double 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %51

12:                                               ; preds = %1
  %13 = icmp sgt i64 %2, -1
  br i1 %13, label %17, label %14

14:                                               ; preds = %12
  %15 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %16 = tail call double @llvm.experimental.constrained.fdiv.f64(double %15, double 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %51

17:                                               ; preds = %12
  %18 = icmp ugt i32 %4, 2146435071
  br i1 %18, label %19, label %22

19:                                               ; preds = %17
  %20 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %21 = tail call double @llvm.experimental.constrained.fdiv.f64(double %20, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %51

22:                                               ; preds = %17
  %23 = icmp ugt i32 %4, 1073741823
  br i1 %23, label %24, label %26

24:                                               ; preds = %22
  %25 = tail call fastcc double @common(i32 noundef %4, double noundef %0, i32 noundef 1, i32 noundef 0) #5
  br label %51

26:                                               ; preds = %22
  %27 = icmp ult i32 %4, 1016070144
  br i1 %27, label %28, label %30

28:                                               ; preds = %26
  %29 = tail call double @llvm.experimental.constrained.fdiv.f64(double 0xBFE45F306DC9C883, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %51

30:                                               ; preds = %26
  %31 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %32 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %31, double 0xBE78AC00569105B8, double 0x3EF8AB038FA6B88E, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %31, double %32, double 0xBF5F55E54844F50F, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %34 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %31, double %33, double 0x3FA9D3C776292CD1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %35 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %31, double %34, double 0xBFC91866143CBC8A, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %36 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %37 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %31, double 0x3DB25039DACA772A, double 0x3E3ABF1D5BA69A86, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %38 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %31, double %37, double 0x3EB6C05A894E8CA6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %39 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %31, double %38, double 0x3F2A8C896C257764, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %40 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %31, double %39, double 0x3F94650D3F4DA9F0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %41 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %31, double %40, double %36, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %42 = tail call double @llvm.experimental.constrained.fdiv.f64(double %35, double %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %43 = tail call double @j1(double noundef %0) #5
  %44 = tail call double @log(double noundef %0) #4
  %45 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %46 = tail call double @llvm.experimental.constrained.fdiv.f64(double %45, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %47 = fneg double %46
  %48 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %43, double %44, double %47, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %49 = tail call double @llvm.experimental.constrained.fmul.f64(double 0x3FE45F306DC9C883, double %48, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %50 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %0, double %42, double %49, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %51

51:                                               ; preds = %30, %28, %24, %19, %14, %9
  %52 = phi double [ %11, %9 ], [ %16, %14 ], [ %21, %19 ], [ %25, %24 ], [ %29, %28 ], [ %50, %30 ]
  ret double %52
}

; Function Attrs: optsize
declare double @log(double noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare double @sin(double noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare double @cos(double noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f64(double, double, metadata, metadata) #1

; Function Attrs: optsize
declare double @sqrt(double noundef) local_unnamed_addr #2

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
!4 = !{!"double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
