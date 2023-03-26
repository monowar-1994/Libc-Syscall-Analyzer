; ModuleID = 'src/math/erf.c'
source_filename = "src/math/erf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define double @erf(double noundef %0) local_unnamed_addr #0 {
  %2 = bitcast double %0 to i64
  %3 = lshr i64 %2, 32
  %4 = trunc i64 %3 to i32
  %5 = and i32 %4, 2147483647
  %6 = icmp ugt i32 %5, 2146435071
  br i1 %6, label %7, label %15

7:                                                ; preds = %1
  %8 = lshr i32 %4, 30
  %9 = and i32 %8, 2
  %10 = sub nsw i32 1, %9
  %11 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %12 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %13 = tail call double @llvm.experimental.constrained.fdiv.f64(double %12, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %14 = tail call double @llvm.experimental.constrained.fadd.f64(double %11, double %13, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %50

15:                                               ; preds = %1
  %16 = icmp ult i32 %5, 1072365568
  br i1 %16, label %17, label %37

17:                                               ; preds = %15
  %18 = icmp ult i32 %5, 1043333120
  br i1 %18, label %19, label %24

19:                                               ; preds = %17
  %20 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %21 = tail call double @llvm.experimental.constrained.fmul.f64(double 0x3FF06EBA8214DB69, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %22 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %20, double %0, double %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %23 = tail call double @llvm.experimental.constrained.fmul.f64(double 1.250000e-01, double %22, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %50

24:                                               ; preds = %17
  %25 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %26 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %25, double 0xBEF8EAD6120016AC, double 0xBF77A291236668E4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %27 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %25, double %26, double 0xBF9D2A51DBD7194F, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %25, double %27, double 0xBFD4CD7D691CB913, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %29 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %25, double %28, double 0x3FC06EBA8214DB68, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %30 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %25, double 0xBED09C4342A26120, double 0x3F215DC9221C1A10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %31 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %25, double %30, double 0x3F74D022C4D36B0F, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %32 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %25, double %31, double 0x3FB0A54C5536CEBA, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %25, double %32, double 0x3FD97779CDDADC09, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %34 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %25, double %33, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %35 = tail call double @llvm.experimental.constrained.fdiv.f64(double %29, double %34, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %36 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %0, double %35, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %50

37:                                               ; preds = %15
  %38 = icmp ult i32 %5, 1075314688
  %39 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br i1 %38, label %40, label %43

40:                                               ; preds = %37
  %41 = tail call fastcc double @erfc2(i32 noundef %5, double noundef %0) #4
  %42 = tail call double @llvm.experimental.constrained.fsub.f64(double %39, double %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %45

43:                                               ; preds = %37
  %44 = tail call double @llvm.experimental.constrained.fsub.f64(double %39, double 0x10000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %45

45:                                               ; preds = %43, %40
  %46 = phi double [ %42, %40 ], [ %44, %43 ]
  %47 = fneg double %46
  %48 = icmp slt i64 %2, 0
  %49 = select i1 %48, double %47, double %46
  br label %50

50:                                               ; preds = %45, %24, %19, %7
  %51 = phi double [ %14, %7 ], [ %23, %19 ], [ %36, %24 ], [ %49, %45 ]
  ret double %51
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #1

; Function Attrs: nounwind optsize strictfp
define internal fastcc double @erfc2(i32 noundef %0, double noundef %1) unnamed_addr #0 {
  %3 = icmp ult i32 %0, 1072955392
  %4 = tail call double @fabs(double noundef %1) #5
  br i1 %3, label %5, label %25

5:                                                ; preds = %2
  %6 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %7 = tail call double @llvm.experimental.constrained.fsub.f64(double %4, double %6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %8 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %7, double 0xBF61BF380A96073F, double 0x3FA22A36599795EB, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %9 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %7, double %8, double 0xBFBC63983D3E28EC, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %10 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %7, double %9, double 0x3FD45FCA805120E4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %11 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %7, double %10, double 0xBFD7D240FBB8C3F1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %12 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %7, double %11, double 0x3FDA8D00AD92B34D, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %13 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %7, double %12, double 0xBF6359B8BEF77538, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %14 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %15 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %7, double 0x3F888B545735151D, double 0x3F8BEDC26B51DD1C, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %16 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %7, double %15, double 0x3FC02660E763351F, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %17 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %7, double %16, double 0x3FB2635CD99FE9A7, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %18 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %7, double %17, double 0x3FE14AF092EB6F33, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %19 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %7, double %18, double 0x3FBB3E6618EEE323, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %20 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %7, double %19, double %14, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %21 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %22 = tail call double @llvm.experimental.constrained.fsub.f64(double %21, double 0x3FEB0AC160000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %23 = tail call double @llvm.experimental.constrained.fdiv.f64(double %13, double %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %24 = tail call double @llvm.experimental.constrained.fsub.f64(double %22, double %23, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %75

25:                                               ; preds = %2
  %26 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %27 = tail call double @llvm.experimental.constrained.fmul.f64(double %4, double %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = tail call double @llvm.experimental.constrained.fdiv.f64(double %26, double %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %29 = icmp ult i32 %0, 1074191213
  br i1 %29, label %30, label %45

30:                                               ; preds = %25
  %31 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double 0xC023A0EFC69AC25C, double 0xC054526557E4D2F2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %32 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double %31, double 0xC067135CEBCCABB2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double %32, double 0xC0644CB184282266, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %34 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double %33, double 0xC04F300AE4CBA38D, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %35 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double %34, double 0xC0251E0441B0E726, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %36 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double %35, double 0xBFE63416E4BA7360, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %37 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double %36, double 0xBF843412600D6435, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %38 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double 0xBFAEEFF2EE749A62, double 0x401A47EF8E484A93, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %39 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double %38, double 0x405B28A3EE48AE2C, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %40 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double %39, double 0x407AD02157700314, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %41 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double %40, double 0x40842B1921EC2868, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %42 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double %41, double 0x407B290DD58A1A71, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %43 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double %42, double 0x4061350C526AE721, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %44 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double %43, double 0x4033A6B9BD707687, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %58

45:                                               ; preds = %25
  %46 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double 0xC07E384E9BDC383F, double 0xC09004616A2E5992, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %47 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double %46, double 0xC083EC881375F228, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %48 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double %47, double 0xC064145D43C5ED98, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %49 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double %48, double 0xC031C209555F995A, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %50 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double %49, double 0xBFE993BA70C285DE, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %51 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double %50, double 0xBF84341239E86F4A, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %52 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double 0xC03670E242712D62, double 0x407DA874E79FE763, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %53 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double %52, double 0x40A3F219CEDF3BE6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %54 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double %53, double 0x40A8FFB7688C246A, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %55 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double %54, double 0x409802EB189D5118, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %56 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double %55, double 0x40745CAE221B9F0A, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %57 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double %56, double 0x403E568B261D5190, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %58

58:                                               ; preds = %45, %30
  %59 = phi double [ %57, %45 ], [ %44, %30 ]
  %60 = phi double [ %51, %45 ], [ %37, %30 ]
  %61 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %28, double %59, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %62 = bitcast double %4 to i64
  %63 = and i64 %62, -4294967296
  %64 = bitcast i64 %63 to double
  %65 = fneg double %64
  %66 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %65, double %64, double -5.625000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %67 = tail call double @exp(double noundef %66) #5
  %68 = tail call double @llvm.experimental.constrained.fsub.f64(double %64, double %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %69 = tail call double @llvm.experimental.constrained.fadd.f64(double %64, double %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %70 = tail call double @llvm.experimental.constrained.fdiv.f64(double %60, double %61, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %71 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %68, double %69, double %70, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %72 = tail call double @exp(double noundef %71) #5
  %73 = tail call double @llvm.experimental.constrained.fmul.f64(double %67, double %72, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %74 = tail call double @llvm.experimental.constrained.fdiv.f64(double %73, double %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %75

75:                                               ; preds = %58, %5
  %76 = phi double [ %24, %5 ], [ %74, %58 ]
  ret double %76
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

; Function Attrs: nounwind optsize strictfp
define double @erfc(double noundef %0) local_unnamed_addr #0 {
  %2 = bitcast double %0 to i64
  %3 = lshr i64 %2, 32
  %4 = trunc i64 %3 to i32
  %5 = and i32 %4, 2147483647
  %6 = icmp ugt i32 %5, 2146435071
  br i1 %6, label %7, label %14

7:                                                ; preds = %1
  %8 = lshr i32 %4, 30
  %9 = and i32 %8, 2
  %10 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %11 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %12 = tail call double @llvm.experimental.constrained.fdiv.f64(double %11, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %13 = tail call double @llvm.experimental.constrained.fadd.f64(double %10, double %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %58

14:                                               ; preds = %1
  %15 = icmp ult i32 %5, 1072365568
  br i1 %15, label %16, label %42

16:                                               ; preds = %14
  %17 = icmp ult i32 %5, 1013972992
  br i1 %17, label %18, label %20

18:                                               ; preds = %16
  %19 = tail call double @llvm.experimental.constrained.fsub.f64(double 1.000000e+00, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %58

20:                                               ; preds = %16
  %21 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %22 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %21, double 0xBEF8EAD6120016AC, double 0xBF77A291236668E4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %23 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %21, double %22, double 0xBF9D2A51DBD7194F, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %24 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %21, double %23, double 0xBFD4CD7D691CB913, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %25 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %21, double %24, double 0x3FC06EBA8214DB68, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %26 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %21, double 0xBED09C4342A26120, double 0x3F215DC9221C1A10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %27 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %21, double %26, double 0x3F74D022C4D36B0F, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %21, double %27, double 0x3FB0A54C5536CEBA, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %29 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %21, double %28, double 0x3FD97779CDDADC09, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %30 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %21, double %29, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %31 = tail call double @llvm.experimental.constrained.fdiv.f64(double %25, double %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %32 = icmp slt i64 %2, 0
  %33 = icmp ult i32 %5, 1070596096
  %34 = or i1 %32, %33
  br i1 %34, label %35, label %38

35:                                               ; preds = %20
  %36 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %0, double %31, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %37 = tail call double @llvm.experimental.constrained.fsub.f64(double 1.000000e+00, double %36, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %58

38:                                               ; preds = %20
  %39 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %40 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %0, double %31, double %39, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %41 = tail call double @llvm.experimental.constrained.fsub.f64(double 5.000000e-01, double %40, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %58

42:                                               ; preds = %14
  %43 = icmp ult i32 %5, 1077673984
  br i1 %43, label %44, label %52

44:                                               ; preds = %42
  %45 = icmp sgt i64 %2, -1
  br i1 %45, label %50, label %46

46:                                               ; preds = %44
  %47 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %48 = tail call fastcc double @erfc2(i32 noundef %5, double noundef %0) #4
  %49 = tail call double @llvm.experimental.constrained.fsub.f64(double %47, double %48, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %58

50:                                               ; preds = %44
  %51 = tail call fastcc double @erfc2(i32 noundef %5, double noundef %0) #4
  br label %58

52:                                               ; preds = %42
  %53 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %54 = tail call double @llvm.experimental.constrained.fsub.f64(double %53, double 0x10000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %55 = tail call double @llvm.experimental.constrained.fmul.f64(double 0x10000000000000, double 0x10000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %56 = icmp slt i64 %2, 0
  %57 = select i1 %56, double %54, double %55
  br label %58

58:                                               ; preds = %46, %50, %52, %38, %35, %18, %7
  %59 = phi double [ %13, %7 ], [ %19, %18 ], [ %37, %35 ], [ %41, %38 ], [ %57, %52 ], [ %49, %46 ], [ %51, %50 ]
  ret double %59
}

; Function Attrs: optsize
declare double @fabs(double noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare double @exp(double noundef) local_unnamed_addr #2

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
