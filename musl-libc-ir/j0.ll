; ModuleID = 'src/math/j0.c'
source_filename = "src/math/j0.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@pR8 = internal unnamed_addr constant [6 x double] [double 0.000000e+00, double 0xBFB1FFFFFFFFFD32, double 0xC02029D0B44FA779, double 0xC07011027B19E863, double 0xC0A36A6ECD4DCAFC, double 0xC0B4850B36CC643D], align 16
@pS8 = internal unnamed_addr constant [5 x double] [double 0x405D223307A96751, double 0x40ADF37D50596938, double 0x40E3D2BB6EB6B05F, double 0x40FC810F8F9FA9BD, double 0x40E741774F2C49DC], align 16
@pR5 = internal unnamed_addr constant [6 x double] [double 0xBDA918B147E495CC, double 0xBFB1FFFFE69AFBC6, double 0xC010A370F90C6BBF, double 0xC050EB2F5A7D1783, double 0xC074B3B36742CC63, double 0xC075A6EF28A38BD7], align 16
@pS5 = internal unnamed_addr constant [5 x double] [double 0x404E60810C98C5DE, double 0x40906D025C7E2864, double 0x40B75AF88FBE1D60, double 0x40C2CCB8FA76FA38, double 0x40A2CC1DC70BE864], align 16
@pR3 = internal unnamed_addr constant [6 x double] [double 0xBE25E1036FE1AA86, double 0xBFB1FFF6F7C0E24B, double 0xC00345B2AEA48074, double 0xC035F74A4CB94E14, double 0xC04D0A22420A1A45, double 0xC03F72ACA892D80F], align 16
@pS3 = internal unnamed_addr constant [5 x double] [double 0x4041ED9284077DD3, double 0x40769839464A7C0E, double 0x4092A66E6D1061D6, double 0x40919FFCB8C39B7E, double 0x4065B296FC379081], align 16
@pR2 = internal unnamed_addr constant [6 x double] [double 0xBE77D316E927026D, double 0xBFB1FF62495E1E42, double 0xBFF736398A24A843, double 0xC01E8AF3EDAFA7F3, double 0xC02662E6C5246303, double 0xC009DE81AF8FE70F], align 16
@pS2 = internal unnamed_addr constant [5 x double] [double 0x40363865908B5959, double 0x4061069E0EE8878F, double 0x4070E78642EA079B, double 0x40633C033AB6FAFF, double 0x402D50B344391809], align 16
@qR8 = internal unnamed_addr constant [6 x double] [double 0.000000e+00, double 0x3FB2BFFFFFFFFE2C, double 0x402789525BB334D6, double 0x40816D6315301825, double 0x40C14D993E18F46D, double 0x40E212D40E901566], align 16
@qS8 = internal unnamed_addr constant [6 x double] [double 0x406478D5365B39BC, double 0x40BFA2584E6B0563, double 0x4101665254D38C3F, double 0x412883DA83A52B43, double 0x4129A66B28DE0B3D, double 0xC114FD6D2C9530C5], align 16
@qR5 = internal unnamed_addr constant [6 x double] [double 0x3DB43D8F29CC8CD9, double 0x3FB2BFFFD172B04C, double 0x401757B0B9953DD3, double 0x4060E3920A8788E9, double 0x40900CF99DC8C481, double 0x409F17E953C6E3A6], align 16
@qS5 = internal unnamed_addr constant [6 x double] [double 0x4054B1B3FB5E1543, double 0x40A03BA0DA21C0CE, double 0x40D267D27B591E6D, double 0x40EBB5E397E02372, double 0x40E191181F7A54A0, double 0xC0B4EA57BEDBC609], align 16
@qR3 = internal unnamed_addr constant [6 x double] [double 0x3E32CD036ADECB82, double 0x3FB2BFEE0E8D0842, double 0x400AC0FC61149CF5, double 0x40454F98962DAEDD, double 0x406559DBE25EFD1F, double 0x4064D77C81FA21E0], align 16
@qS3 = internal unnamed_addr constant [6 x double] [double 0x40486122BFE343A6, double 0x40862D8386544EB3, double 0x40ACF04BE44DFC63, double 0x40B93C6CD7C76A28, double 0x40A3A8AAD94FB1C0, double 0xC062A7EB201CF40F], align 16
@qR2 = internal unnamed_addr constant [6 x double] [double 0x3E84313B54F76BDB, double 0x3FB2BEC53E883E34, double 0x3FFFF897E727779C, double 0x402CFDBFAAF96FE5, double 0x403FAA8E29FBDC4A, double 0x403040B171814BB4], align 16
@qS2 = internal unnamed_addr constant [6 x double] [double 0x403E5D96F7C07AED, double 0x4070D591E4D14B40, double 0x408A664522B3BF22, double 0x408B977C9C5CC214, double 0x406A95530E001365, double 0xC0153E6AF8B32931], align 16

; Function Attrs: nounwind optsize strictfp
define double @j0(double noundef %0) local_unnamed_addr #0 {
  %2 = bitcast double %0 to i64
  %3 = lshr i64 %2, 32
  %4 = trunc i64 %3 to i32
  %5 = and i32 %4, 2147483647
  %6 = icmp ugt i32 %5, 2146435071
  br i1 %6, label %7, label %11

7:                                                ; preds = %1
  %8 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %9 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %10 = tail call double @llvm.experimental.constrained.fdiv.f64(double %8, double %9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %49

11:                                               ; preds = %1
  %12 = tail call double @fabs(double noundef %0) #4
  %13 = icmp ugt i32 %5, 1073741823
  br i1 %13, label %14, label %16

14:                                               ; preds = %11
  %15 = tail call fastcc double @common(i32 noundef %5, double noundef %12, i32 noundef 0) #5
  br label %49

16:                                               ; preds = %11
  %17 = icmp ugt i32 %5, 1059061759
  br i1 %17, label %18, label %40

18:                                               ; preds = %16
  %19 = tail call double @llvm.experimental.constrained.fmul.f64(double %12, double %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %20 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %19, double 0xBE33D5E773D63FCE, double 0x3EBEB1D10C503919, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %21 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %19, double %20, double 0xBF28E6A5B61AC6E9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %22 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %19, double %21, double 0x3F8FFFFFFFFFFFFD, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %23 = tail call double @llvm.experimental.constrained.fmul.f64(double %19, double %22, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %24 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %25 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %19, double 0x3E1408BCF4745D8F, double 0x3EA13B54CE84D5A9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %26 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %19, double %25, double 0x3F1EA6D2DD57DBF4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %27 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %19, double %26, double 0x3F8FFCE882C8C2A4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %19, double %27, double %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %29 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %30 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %31 = tail call double @llvm.experimental.constrained.fdiv.f64(double %12, double %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %32 = tail call double @llvm.experimental.constrained.fadd.f64(double %29, double %31, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %34 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %35 = tail call double @llvm.experimental.constrained.fdiv.f64(double %12, double %34, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %36 = tail call double @llvm.experimental.constrained.fsub.f64(double %33, double %35, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %37 = tail call double @llvm.experimental.constrained.fdiv.f64(double %23, double %28, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %38 = tail call double @llvm.experimental.constrained.fmul.f64(double %19, double %37, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %39 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %32, double %36, double %38, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %49

40:                                               ; preds = %16
  %41 = icmp ugt i32 %5, 939524095
  br i1 %41, label %42, label %45

42:                                               ; preds = %40
  %43 = tail call double @llvm.experimental.constrained.fmul.f64(double 2.500000e-01, double %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %44 = tail call double @llvm.experimental.constrained.fmul.f64(double %43, double %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %45

45:                                               ; preds = %42, %40
  %46 = phi double [ %44, %42 ], [ %12, %40 ]
  %47 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %48 = tail call double @llvm.experimental.constrained.fsub.f64(double %47, double %46, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %49

49:                                               ; preds = %45, %18, %14, %7
  %50 = phi double [ %10, %7 ], [ %15, %14 ], [ %39, %18 ], [ %48, %45 ]
  ret double %50
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #1

; Function Attrs: optsize
declare double @fabs(double noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc double @common(i32 noundef %0, double noundef %1, i32 noundef %2) unnamed_addr #0 {
  %4 = tail call double @sin(double noundef %1) #4
  %5 = tail call double @cos(double noundef %1) #4
  %6 = icmp eq i32 %2, 0
  %7 = fneg double %5
  %8 = select i1 %6, double %5, double %7
  %9 = tail call double @llvm.experimental.constrained.fadd.f64(double %4, double %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %10 = icmp ult i32 %0, 2145386496
  br i1 %10, label %11, label %129

11:                                               ; preds = %3
  %12 = tail call double @llvm.experimental.constrained.fsub.f64(double %4, double %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %13 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %14 = tail call double @llvm.experimental.constrained.fmul.f64(double %13, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %15 = tail call double @cos(double noundef %14) #4
  %16 = fneg double %15
  %17 = tail call double @llvm.experimental.constrained.fmul.f64(double %4, double %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %18 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %19 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %17, double %18, metadata !"olt", metadata !"fpexcept.ignore") #3
  br i1 %19, label %20, label %22

20:                                               ; preds = %11
  %21 = tail call double @llvm.experimental.constrained.fdiv.f64(double %16, double %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %24

22:                                               ; preds = %11
  %23 = tail call double @llvm.experimental.constrained.fdiv.f64(double %16, double %9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %24

24:                                               ; preds = %22, %20
  %25 = phi double [ %12, %20 ], [ %23, %22 ]
  %26 = phi double [ %21, %20 ], [ %9, %22 ]
  %27 = icmp ult i32 %0, 1207959552
  br i1 %27, label %28, label %129

28:                                               ; preds = %24
  %29 = fneg double %25
  %30 = select i1 %6, double %25, double %29
  %31 = bitcast double %1 to i64
  %32 = lshr i64 %31, 32
  %33 = trunc i64 %32 to i32
  %34 = and i32 %33, 2147483647
  %35 = icmp ugt i32 %34, 1075838975
  br i1 %35, label %42, label %36

36:                                               ; preds = %28
  %37 = icmp ugt i32 %34, 1074933386
  br i1 %37, label %42, label %38

38:                                               ; preds = %36
  %39 = icmp ugt i32 %34, 1074191212
  %40 = select i1 %39, double* getelementptr inbounds ([5 x double], [5 x double]* @pS3, i64 0, i64 0), double* getelementptr inbounds ([5 x double], [5 x double]* @pS2, i64 0, i64 0)
  %41 = select i1 %39, double* getelementptr inbounds ([6 x double], [6 x double]* @pR3, i64 0, i64 0), double* getelementptr inbounds ([6 x double], [6 x double]* @pR2, i64 0, i64 0)
  br label %42

42:                                               ; preds = %28, %36, %38
  %43 = phi double* [ getelementptr inbounds ([5 x double], [5 x double]* @pS8, i64 0, i64 0), %28 ], [ getelementptr inbounds ([5 x double], [5 x double]* @pS5, i64 0, i64 0), %36 ], [ %40, %38 ]
  %44 = phi double* [ getelementptr inbounds ([6 x double], [6 x double]* @pR8, i64 0, i64 0), %28 ], [ getelementptr inbounds ([6 x double], [6 x double]* @pR5, i64 0, i64 0), %36 ], [ %41, %38 ]
  %45 = tail call double @llvm.experimental.constrained.fmul.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %46 = tail call double @llvm.experimental.constrained.fdiv.f64(double 1.000000e+00, double %45, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %47 = load double, double* %44, align 8, !tbaa !3
  %48 = getelementptr inbounds double, double* %44, i64 1
  %49 = load double, double* %48, align 8, !tbaa !3
  %50 = getelementptr inbounds double, double* %44, i64 2
  %51 = load double, double* %50, align 8, !tbaa !3
  %52 = getelementptr inbounds double, double* %44, i64 3
  %53 = load double, double* %52, align 8, !tbaa !3
  %54 = getelementptr inbounds double, double* %44, i64 4
  %55 = load double, double* %54, align 8, !tbaa !3
  %56 = getelementptr inbounds double, double* %44, i64 5
  %57 = load double, double* %56, align 8, !tbaa !3
  %58 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %46, double %57, double %55, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %59 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %46, double %58, double %53, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %60 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %46, double %59, double %51, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %61 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %46, double %60, double %49, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %62 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %46, double %61, double %47, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %63 = load double, double* %43, align 8, !tbaa !3
  %64 = getelementptr inbounds double, double* %43, i64 1
  %65 = load double, double* %64, align 8, !tbaa !3
  %66 = getelementptr inbounds double, double* %43, i64 2
  %67 = load double, double* %66, align 8, !tbaa !3
  %68 = getelementptr inbounds double, double* %43, i64 3
  %69 = load double, double* %68, align 8, !tbaa !3
  %70 = getelementptr inbounds double, double* %43, i64 4
  %71 = load double, double* %70, align 8, !tbaa !3
  %72 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %46, double %71, double %69, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %73 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %46, double %72, double %67, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %74 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %46, double %73, double %65, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %75 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %46, double %74, double %63, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %76 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %46, double %75, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %77 = tail call double @llvm.experimental.constrained.fdiv.f64(double %62, double %76, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %78 = tail call double @llvm.experimental.constrained.fadd.f64(double 1.000000e+00, double %77, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br i1 %35, label %85, label %79

79:                                               ; preds = %42
  %80 = icmp ugt i32 %34, 1074933386
  br i1 %80, label %85, label %81

81:                                               ; preds = %79
  %82 = icmp ugt i32 %34, 1074191212
  %83 = select i1 %82, double* getelementptr inbounds ([6 x double], [6 x double]* @qS3, i64 0, i64 0), double* getelementptr inbounds ([6 x double], [6 x double]* @qS2, i64 0, i64 0)
  %84 = select i1 %82, double* getelementptr inbounds ([6 x double], [6 x double]* @qR3, i64 0, i64 0), double* getelementptr inbounds ([6 x double], [6 x double]* @qR2, i64 0, i64 0)
  br label %85

85:                                               ; preds = %42, %79, %81
  %86 = phi double* [ getelementptr inbounds ([6 x double], [6 x double]* @qS8, i64 0, i64 0), %42 ], [ getelementptr inbounds ([6 x double], [6 x double]* @qS5, i64 0, i64 0), %79 ], [ %83, %81 ]
  %87 = phi double* [ getelementptr inbounds ([6 x double], [6 x double]* @qR8, i64 0, i64 0), %42 ], [ getelementptr inbounds ([6 x double], [6 x double]* @qR5, i64 0, i64 0), %79 ], [ %84, %81 ]
  %88 = tail call double @llvm.experimental.constrained.fmul.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %89 = tail call double @llvm.experimental.constrained.fdiv.f64(double 1.000000e+00, double %88, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %90 = load double, double* %87, align 8, !tbaa !3
  %91 = getelementptr inbounds double, double* %87, i64 1
  %92 = load double, double* %91, align 8, !tbaa !3
  %93 = getelementptr inbounds double, double* %87, i64 2
  %94 = load double, double* %93, align 8, !tbaa !3
  %95 = getelementptr inbounds double, double* %87, i64 3
  %96 = load double, double* %95, align 8, !tbaa !3
  %97 = getelementptr inbounds double, double* %87, i64 4
  %98 = load double, double* %97, align 8, !tbaa !3
  %99 = getelementptr inbounds double, double* %87, i64 5
  %100 = load double, double* %99, align 8, !tbaa !3
  %101 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %89, double %100, double %98, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %102 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %89, double %101, double %96, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %103 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %89, double %102, double %94, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %104 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %89, double %103, double %92, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %105 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %89, double %104, double %90, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %106 = load double, double* %86, align 8, !tbaa !3
  %107 = getelementptr inbounds double, double* %86, i64 1
  %108 = load double, double* %107, align 8, !tbaa !3
  %109 = getelementptr inbounds double, double* %86, i64 2
  %110 = load double, double* %109, align 8, !tbaa !3
  %111 = getelementptr inbounds double, double* %86, i64 3
  %112 = load double, double* %111, align 8, !tbaa !3
  %113 = getelementptr inbounds double, double* %86, i64 4
  %114 = load double, double* %113, align 8, !tbaa !3
  %115 = getelementptr inbounds double, double* %86, i64 5
  %116 = load double, double* %115, align 8, !tbaa !3
  %117 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %89, double %116, double %114, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %118 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %89, double %117, double %112, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %119 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %89, double %118, double %110, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %120 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %89, double %119, double %108, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %121 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %89, double %120, double %106, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %122 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %89, double %121, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %123 = tail call double @llvm.experimental.constrained.fdiv.f64(double %105, double %122, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %124 = tail call double @llvm.experimental.constrained.fadd.f64(double -1.250000e-01, double %123, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %125 = tail call double @llvm.experimental.constrained.fdiv.f64(double %124, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %126 = tail call double @llvm.experimental.constrained.fmul.f64(double %125, double %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %127 = fneg double %126
  %128 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %78, double %26, double %127, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %129

129:                                              ; preds = %24, %85, %3
  %130 = phi double [ %128, %85 ], [ %26, %24 ], [ %9, %3 ]
  %131 = tail call double @llvm.experimental.constrained.fmul.f64(double 0x3FE20DD750429B6D, double %130, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %132 = tail call double @sqrt(double noundef %1) #4
  %133 = tail call double @llvm.experimental.constrained.fdiv.f64(double %131, double %132, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  ret double %133
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

; Function Attrs: nounwind optsize strictfp
define double @y0(double noundef %0) local_unnamed_addr #0 {
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
  br label %48

12:                                               ; preds = %1
  %13 = icmp sgt i64 %2, -1
  br i1 %13, label %17, label %14

14:                                               ; preds = %12
  %15 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %16 = tail call double @llvm.experimental.constrained.fdiv.f64(double %15, double 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %48

17:                                               ; preds = %12
  %18 = icmp ugt i32 %4, 2146435071
  br i1 %18, label %19, label %22

19:                                               ; preds = %17
  %20 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %21 = tail call double @llvm.experimental.constrained.fdiv.f64(double %20, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %48

22:                                               ; preds = %17
  %23 = icmp ugt i32 %4, 1073741823
  br i1 %23, label %24, label %26

24:                                               ; preds = %22
  %25 = tail call fastcc double @common(i32 noundef %4, double noundef %0, i32 noundef 1) #5
  br label %48

26:                                               ; preds = %22
  %27 = icmp ugt i32 %4, 1044381695
  br i1 %27, label %28, label %45

28:                                               ; preds = %26
  %29 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %30 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %29, double 0xBDC5E43D693FB3C8, double 0x3E5500573B4EABD4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %31 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %29, double %30, double 0xBECFFEA773D25CAD, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %32 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %29, double %31, double 0x3F36C54D20B29B6B, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %29, double %32, double 0xBF8C4CE8B16CFA97, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %34 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %29, double %33, double 0x3FC69D019DE9E3FC, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %35 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %29, double %34, double 0xBFB2E4D699CBD01F, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %36 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %29, double 0x3DFE50183BD6D9EF, double 0x3E91642D7FF202FD, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %37 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %29, double %36, double 0x3F13ECBBF578C6C1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %38 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %29, double %37, double 0x3F8A127091C9C71A, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %39 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %29, double %38, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %40 = tail call double @llvm.experimental.constrained.fdiv.f64(double %35, double %39, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %41 = tail call double @j0(double noundef %0) #5
  %42 = tail call double @log(double noundef %0) #4
  %43 = tail call double @llvm.experimental.constrained.fmul.f64(double %41, double %42, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %44 = tail call double @llvm.experimental.constrained.fmuladd.f64(double 0x3FE45F306DC9C883, double %43, double %40, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %48

45:                                               ; preds = %26
  %46 = tail call double @log(double noundef %0) #4
  %47 = tail call double @llvm.experimental.constrained.fmuladd.f64(double 0x3FE45F306DC9C883, double %46, double 0xBFB2E4D699CBD01F, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %48

48:                                               ; preds = %45, %28, %24, %19, %14, %9
  %49 = phi double [ %11, %9 ], [ %16, %14 ], [ %21, %19 ], [ %25, %24 ], [ %44, %28 ], [ %47, %45 ]
  ret double %49
}

; Function Attrs: optsize
declare double @log(double noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare double @sin(double noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare double @cos(double noundef) local_unnamed_addr #2

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
