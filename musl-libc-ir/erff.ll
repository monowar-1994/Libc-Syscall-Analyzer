; ModuleID = 'src/math/erff.c'
source_filename = "src/math/erff.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define float @erff(float noundef %0) local_unnamed_addr #0 {
  %2 = bitcast float %0 to i32
  %3 = and i32 %2, 2147483647
  %4 = icmp ugt i32 %3, 2139095039
  br i1 %4, label %5, label %13

5:                                                ; preds = %1
  %6 = lshr i32 %2, 30
  %7 = and i32 %6, 2
  %8 = sub nsw i32 1, %7
  %9 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %10 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %11 = tail call float @llvm.experimental.constrained.fdiv.f32(float %10, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %12 = tail call float @llvm.experimental.constrained.fadd.f32(float %9, float %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %49

13:                                               ; preds = %1
  %14 = icmp ult i32 %3, 1062731776
  br i1 %14, label %15, label %36

15:                                               ; preds = %13
  %16 = icmp ult i32 %3, 830472192
  br i1 %16, label %17, label %22

17:                                               ; preds = %15
  %18 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %19 = tail call float @llvm.experimental.constrained.fmul.f32(float 0x3FF06EBA80000000, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %20 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %18, float %0, float %19, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %21 = tail call float @llvm.experimental.constrained.fmul.f32(float 1.250000e-01, float %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %49

22:                                               ; preds = %15
  %23 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %24 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %23, float 0xBEF8EAD620000000, float 0xBF77A29120000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %25 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %23, float %24, float 0xBF9D2A51E0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %26 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %23, float %25, float 0xBFD4CD7D60000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %27 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %23, float %26, float 0x3FC06EBA80000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %29 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %23, float 0xBED09C4340000000, float 0x3F215DC920000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %30 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %23, float %29, float 0x3F74D022C0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %31 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %23, float %30, float 0x3FB0A54C60000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %32 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %23, float %31, float 0x3FD97779C0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %23, float %32, float %28, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %34 = tail call float @llvm.experimental.constrained.fdiv.f32(float %27, float %33, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %35 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %0, float %34, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %49

36:                                               ; preds = %13
  %37 = icmp ult i32 %3, 1086324736
  %38 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br i1 %37, label %39, label %42

39:                                               ; preds = %36
  %40 = tail call fastcc float @erfc2(i32 noundef %3, float noundef %0) #4
  %41 = tail call float @llvm.experimental.constrained.fsub.f32(float %38, float %40, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %44

42:                                               ; preds = %36
  %43 = tail call float @llvm.experimental.constrained.fsub.f32(float %38, float 0x3870000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %44

44:                                               ; preds = %42, %39
  %45 = phi float [ %41, %39 ], [ %43, %42 ]
  %46 = fneg float %45
  %47 = icmp slt i32 %2, 0
  %48 = select i1 %47, float %46, float %45
  br label %49

49:                                               ; preds = %44, %22, %17, %5
  %50 = phi float [ %12, %5 ], [ %21, %17 ], [ %35, %22 ], [ %48, %44 ]
  ret float %50
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmuladd.f32(float, float, float, metadata, metadata) #1

; Function Attrs: nounwind optsize strictfp
define internal fastcc float @erfc2(i32 noundef %0, float noundef %1) unnamed_addr #0 {
  %3 = icmp ult i32 %0, 1067450368
  %4 = tail call float @fabsf(float noundef %1) #5
  br i1 %3, label %5, label %25

5:                                                ; preds = %2
  %6 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %7 = tail call float @llvm.experimental.constrained.fsub.f32(float %4, float %6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %8 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %7, float 0xBF61BF3800000000, float 0x3FA22A3660000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %9 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %7, float %8, float 0xBFBC639840000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %10 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %7, float %9, float 0x3FD45FCA80000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %11 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %7, float %10, float 0xBFD7D24100000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %12 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %7, float %11, float 0x3FDA8D00A0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %13 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %7, float %12, float 0xBF6359B8C0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %14 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %15 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %7, float 0x3F888B5460000000, float 0x3F8BEDC260000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %16 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %7, float %15, float 0x3FC02660E0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %17 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %7, float %16, float 0x3FB2635CE0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %18 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %7, float %17, float 0x3FE14AF0A0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %19 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %7, float %18, float 0x3FBB3E6620000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %20 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %7, float %19, float %14, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %21 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %22 = tail call float @llvm.experimental.constrained.fsub.f32(float %21, float 0x3FEB0AC160000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %23 = tail call float @llvm.experimental.constrained.fdiv.f32(float %13, float %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %24 = tail call float @llvm.experimental.constrained.fsub.f32(float %22, float %23, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %75

25:                                               ; preds = %2
  %26 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %27 = tail call float @llvm.experimental.constrained.fmul.f32(float %4, float %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = tail call float @llvm.experimental.constrained.fdiv.f32(float %26, float %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %29 = icmp ult i32 %0, 1077336941
  br i1 %29, label %30, label %45

30:                                               ; preds = %25
  %31 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float 0xC023A0EFC0000000, float 0xC054526560000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %32 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float %31, float 0xC067135CE0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float %32, float 0xC0644CB180000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %34 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float %33, float 0xC04F300AE0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %35 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float %34, float 0xC0251E0440000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %36 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float %35, float 0xBFE63416E0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %37 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float %36, float 0xBF84341260000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %38 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float 0xBFAEEFF2E0000000, float 0x401A47EF80000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %39 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float %38, float 0x405B28A3E0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %40 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float %39, float 0x407AD02160000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %41 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float %40, float 0x40842B1920000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %42 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float %41, float 0x407B290DE0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %43 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float %42, float 0x4061350C60000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %44 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float %43, float 0x4033A6B9C0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %58

45:                                               ; preds = %25
  %46 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float 0xC07E384EA0000000, float 0xC090046160000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %47 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float %46, float 0xC083EC8820000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %48 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float %47, float 0xC064145D40000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %49 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float %48, float 0xC031C20960000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %50 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float %49, float 0xBFE993BA80000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %51 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float %50, float 0xBF84341240000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %52 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float 0xC03670E240000000, float 0x407DA874E0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %53 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float %52, float 0x40A3F219C0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %54 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float %53, float 0x40A8FFB760000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %55 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float %54, float 0x409802EB20000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %56 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float %55, float 0x40745CAE20000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %57 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float %56, float 0x403E568B20000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %58

58:                                               ; preds = %30, %45
  %59 = phi float [ %44, %30 ], [ %57, %45 ]
  %60 = phi float [ %37, %30 ], [ %51, %45 ]
  %61 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %28, float %59, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %62 = bitcast float %4 to i32
  %63 = and i32 %62, -8192
  %64 = bitcast i32 %63 to float
  %65 = fneg float %64
  %66 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %65, float %64, float -5.625000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %67 = tail call float @expf(float noundef %66) #5
  %68 = tail call float @llvm.experimental.constrained.fsub.f32(float %64, float %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %69 = tail call float @llvm.experimental.constrained.fadd.f32(float %64, float %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %70 = tail call float @llvm.experimental.constrained.fdiv.f32(float %60, float %61, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %71 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %68, float %69, float %70, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %72 = tail call float @expf(float noundef %71) #5
  %73 = tail call float @llvm.experimental.constrained.fmul.f32(float %67, float %72, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %74 = tail call float @llvm.experimental.constrained.fdiv.f32(float %73, float %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %75

75:                                               ; preds = %58, %5
  %76 = phi float [ %24, %5 ], [ %74, %58 ]
  ret float %76
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #1

; Function Attrs: nounwind optsize strictfp
define float @erfcf(float noundef %0) local_unnamed_addr #0 {
  %2 = bitcast float %0 to i32
  %3 = and i32 %2, 2147483647
  %4 = icmp ugt i32 %3, 2139095039
  br i1 %4, label %5, label %12

5:                                                ; preds = %1
  %6 = lshr i32 %2, 30
  %7 = and i32 %6, 2
  %8 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 %7, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %9 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %10 = tail call float @llvm.experimental.constrained.fdiv.f32(float %9, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %11 = tail call float @llvm.experimental.constrained.fadd.f32(float %8, float %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %56

12:                                               ; preds = %1
  %13 = icmp ult i32 %3, 1062731776
  br i1 %13, label %14, label %40

14:                                               ; preds = %12
  %15 = icmp ult i32 %3, 595591168
  br i1 %15, label %16, label %18

16:                                               ; preds = %14
  %17 = tail call float @llvm.experimental.constrained.fsub.f32(float 1.000000e+00, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %56

18:                                               ; preds = %14
  %19 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %20 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %19, float 0xBEF8EAD620000000, float 0xBF77A29120000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %21 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %19, float %20, float 0xBF9D2A51E0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %22 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %19, float %21, float 0xBFD4CD7D60000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %23 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %19, float %22, float 0x3FC06EBA80000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %24 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %19, float 0xBED09C4340000000, float 0x3F215DC920000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %25 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %19, float %24, float 0x3F74D022C0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %26 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %19, float %25, float 0x3FB0A54C60000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %27 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %19, float %26, float 0x3FD97779C0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %19, float %27, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %29 = tail call float @llvm.experimental.constrained.fdiv.f32(float %23, float %28, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %30 = icmp slt i32 %2, 0
  %31 = icmp ult i32 %3, 1048576000
  %32 = or i1 %30, %31
  br i1 %32, label %33, label %36

33:                                               ; preds = %18
  %34 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %0, float %29, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %35 = tail call float @llvm.experimental.constrained.fsub.f32(float 1.000000e+00, float %34, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %56

36:                                               ; preds = %18
  %37 = tail call float @llvm.experimental.constrained.fsub.f32(float %0, float 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %38 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %0, float %29, float %37, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %39 = tail call float @llvm.experimental.constrained.fsub.f32(float 5.000000e-01, float %38, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %56

40:                                               ; preds = %12
  %41 = icmp ult i32 %3, 1105199104
  br i1 %41, label %42, label %50

42:                                               ; preds = %40
  %43 = icmp sgt i32 %2, -1
  br i1 %43, label %48, label %44

44:                                               ; preds = %42
  %45 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %46 = tail call fastcc float @erfc2(i32 noundef %3, float noundef %0) #4
  %47 = tail call float @llvm.experimental.constrained.fsub.f32(float %45, float %46, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %56

48:                                               ; preds = %42
  %49 = tail call fastcc float @erfc2(i32 noundef %3, float noundef %0) #4
  br label %56

50:                                               ; preds = %40
  %51 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %52 = tail call float @llvm.experimental.constrained.fsub.f32(float %51, float 0x3870000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %53 = tail call float @llvm.experimental.constrained.fmul.f32(float 0x3870000000000000, float 0x3870000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %54 = icmp slt i32 %2, 0
  %55 = select i1 %54, float %52, float %53
  br label %56

56:                                               ; preds = %44, %48, %50, %36, %33, %16, %5
  %57 = phi float [ %11, %5 ], [ %17, %16 ], [ %35, %33 ], [ %39, %36 ], [ %55, %50 ], [ %47, %44 ], [ %49, %48 ]
  ret float %57
}

; Function Attrs: optsize
declare float @fabsf(float noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare float @expf(float noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { strictfp }
attributes #4 = { nobuiltin optsize strictfp "no-builtins" }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
