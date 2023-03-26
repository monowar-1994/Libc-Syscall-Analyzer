; ModuleID = 'src/math/erfl.c'
source_filename = "src/math/erfl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define x86_fp80 @erfl(x86_fp80 noundef %0) local_unnamed_addr #0 {
  %2 = bitcast x86_fp80 %0 to i80
  %3 = lshr i80 %2, 64
  %4 = trunc i80 %3 to i32
  %5 = shl nuw i32 %4, 16
  %6 = and i32 %5, 2147418112
  %7 = trunc i80 %2 to i64
  %8 = lshr i64 %7, 48
  %9 = trunc i64 %8 to i32
  %10 = or i32 %6, %9
  %11 = icmp ugt i32 %10, 2147418111
  br i1 %11, label %12, label %20

12:                                               ; preds = %1
  %13 = lshr i32 %4, 14
  %14 = and i32 %13, 2
  %15 = sub nsw i32 1, %14
  %16 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 %15, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %17 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %18 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %17, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %19 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %16, x86_fp80 %18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %58

20:                                               ; preds = %1
  %21 = icmp ult i32 %10, 1073666048
  br i1 %21, label %22, label %45

22:                                               ; preds = %20
  %23 = icmp ult i32 %10, 1071546368
  br i1 %23, label %24, label %30

24:                                               ; preds = %22
  %25 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.250000e-01, metadata !"fpexcept.ignore") #3
  %26 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %27 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 0xK3FFF8375D410A6DB446C, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %26, x86_fp80 %0, x86_fp80 %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %29 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %25, x86_fp80 %28, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %58

30:                                               ; preds = %22
  %31 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %0, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %32 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %31, x86_fp80 0xKC006A587F1999B164FE8, x86_fp80 0xKC00AA61D154777EB9519, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %31, x86_fp80 %32, x86_fp80 0xKC00F85C36C1D991D946E, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %34 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %31, x86_fp80 %33, x86_fp80 0xKC011A1D511887DC5E424, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %35 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %31, x86_fp80 %34, x86_fp80 0xKC014AB6B55353EE251F9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %36 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %31, x86_fp80 %35, x86_fp80 0xK4013890DFACEC680CB0C, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %37 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 0xK400688E3EA4B462EBBD9, x86_fp80 %31, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %38 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %31, x86_fp80 %37, x86_fp80 0xK400B8CFCAC013C37575E, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %39 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %31, x86_fp80 %38, x86_fp80 0xK400F917CA49D3A9B4669, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %40 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %31, x86_fp80 %39, x86_fp80 0xK4012AC84BE0D9554997B, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %41 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %31, x86_fp80 %40, x86_fp80 0xK4014E4A3D90F25C1EEE9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %42 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %31, x86_fp80 %41, x86_fp80 0xK40168572745F3EF624EE, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %43 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %36, x86_fp80 %42, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %44 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %0, x86_fp80 %43, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %58

45:                                               ; preds = %20
  %46 = icmp ult i32 %10, 1073861973
  %47 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br i1 %46, label %48, label %51

48:                                               ; preds = %45
  %49 = tail call fastcc x86_fp80 @erfc2(i32 noundef %10, x86_fp80 noundef %0) #4
  %50 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %47, x86_fp80 %49, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %53

51:                                               ; preds = %45
  %52 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %47, x86_fp80 0xK00018000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %53

53:                                               ; preds = %51, %48
  %54 = phi x86_fp80 [ %50, %48 ], [ %52, %51 ]
  %55 = icmp ult i32 %4, 32768
  %56 = fneg x86_fp80 %54
  %57 = select i1 %55, x86_fp80 %54, x86_fp80 %56
  br label %58

58:                                               ; preds = %53, %30, %24, %12
  %59 = phi x86_fp80 [ %19, %12 ], [ %29, %24 ], [ %44, %30 ], [ %57, %53 ]
  ret x86_fp80 %59
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: nounwind optsize strictfp
define internal fastcc x86_fp80 @erfc2(i32 noundef %0, x86_fp80 noundef %1) unnamed_addr #0 {
  %3 = icmp ult i32 %0, 1073717248
  %4 = tail call x86_fp80 @fabsl(x86_fp80 noundef %1) #5
  br i1 %3, label %5, label %26

5:                                                ; preds = %2
  %6 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %7 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %4, x86_fp80 %6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %8 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %7, x86_fp80 0xK3FFBC068D41797354859, x86_fp80 0xK3FFFED15DFCC1E1FA493, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %9 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %7, x86_fp80 %8, x86_fp80 0xKC000970E1DE3B589EC74, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %10 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %7, x86_fp80 %9, x86_fp80 0xK400386A855EFABD2F1A5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %11 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %7, x86_fp80 %10, x86_fp80 0xK4004B16FB9B1509C0C90, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %12 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %7, x86_fp80 %11, x86_fp80 0xKC004D590EFCBD7892BB3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %13 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %7, x86_fp80 %12, x86_fp80 0xK4006BC7B434EA78AEFB4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %14 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %7, x86_fp80 %13, x86_fp80 0xKBFFF89D991639982CCAF, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %15 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 0xK400194854B0AA1806CA0, x86_fp80 %7, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %16 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %7, x86_fp80 %15, x86_fp80 0xK4003A64BAFFEC56E6F95, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %17 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %7, x86_fp80 %16, x86_fp80 0xK4004F2685A65A8D2812C, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %18 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %7, x86_fp80 %17, x86_fp80 0xK40068BDF204103DF5006, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %19 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %7, x86_fp80 %18, x86_fp80 0xK40078E4DB5574A8D0A2C, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %20 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %7, x86_fp80 %19, x86_fp80 0xK4007A47663109BAFACB2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %21 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %7, x86_fp80 %20, x86_fp80 0xK4007E3F6935D7EB50540, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %22 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %23 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %22, x86_fp80 0xK3FFED8560B0000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %24 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %14, x86_fp80 %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %25 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %23, x86_fp80 %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %95

26:                                               ; preds = %2
  %27 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %4, x86_fp80 %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %29 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %27, x86_fp80 %28, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %30 = icmp ult i32 %0, 1073788635
  br i1 %30, label %31, label %49

31:                                               ; preds = %26
  %32 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 0xK4006DE17776039C08D90, x86_fp80 0xK400A9537E11D629D5E93, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %32, x86_fp80 0xK400BE3037CEDA5477EA6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %34 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %33, x86_fp80 0xK400C8B81019759F3B6EA, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %35 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %34, x86_fp80 0xK400B9F044EC3FB200D87, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %36 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %35, x86_fp80 0xK4009B073EC3E0C625EAF, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %37 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %36, x86_fp80 0xK4006BA3C66512680507E, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %38 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %37, x86_fp80 0xK4002A2E99A0AEEE04E8C, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %39 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %38, x86_fp80 0xK3FFC8BA1147F23483020, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %40 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 0xKC0068C396054B1AB12AE, x86_fp80 %29, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %41 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %40, x86_fp80 0xKC00AB3A8A2BD1AE5892A, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %42 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %41, x86_fp80 0xKC00CE2A80256FBB4CDAD, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %43 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %42, x86_fp80 0xKC00DE105654EC58FFCF7, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %44 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %43, x86_fp80 0xKC00DD0D5988E04C9308E, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %45 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %44, x86_fp80 0xKC00CC2C8E24B636B5DB4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %46 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %45, x86_fp80 0xKC00AB851FF714D683071, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %47 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %46, x86_fp80 0xKC007A5C82D562A7A71C7, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %48 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %47, x86_fp80 0xKC002DD28548B26F49C21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %77

49:                                               ; preds = %26
  %50 = icmp ult i32 %0, 1073861973
  br i1 %50, label %51, label %66

51:                                               ; preds = %49
  %52 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 0xKBFFFB35B767B1FAF5426, x86_fp80 0xKC001E23702E61492A1B2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %53 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %52, x86_fp80 0xKC0028D7A050450A2CC9B, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %54 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %53, x86_fp80 0xKC00188C2DF6AD5D3AA0D, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %55 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %54, x86_fp80 0xKBFFEEE91368B082A3D37, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %56 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %55, x86_fp80 0xKBFFBC137900C35C6FA33, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %57 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %56, x86_fp80 0xKBFF7840FC34A1215833D, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %58 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %57, x86_fp80 0xKBFF0CC3ECBC79CC360D1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %59 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 0xK4002BD2128334D0429EA, x86_fp80 %29, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %60 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %59, x86_fp80 0xK4003E5948A03597C3A41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %61 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %60, x86_fp80 0xK4003CA888BA1BCAABB46, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %62 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %61, x86_fp80 0xK40029ED77F375E7AF590, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %63 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %62, x86_fp80 0xK3FFFECE2088CB3DEBC0A, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %64 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %63, x86_fp80 0xK3FFCA225643BF00BB255, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %65 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %64, x86_fp80 0xK3FF7A1C04ED159F6AE68, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %77

66:                                               ; preds = %49
  %67 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 0xKBFFF83C37E35AEFE08A5, x86_fp80 0xKBFFFE1F611A68108769A, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %68 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %67, x86_fp80 0xKBFFEC08BE0F3198D261E, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %69 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %68, x86_fp80 0xKBFFBE9D03DEA0628E5B6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %70 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %69, x86_fp80 0xKBFF7CC992C826973D624, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %71 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %70, x86_fp80 0xKBFF1AE0E3B7F13E29D19, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %72 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 0xK4001A02A6A7B20F65C06, x86_fp80 %29, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %73 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %72, x86_fp80 0xK40019DFA2BCCE78B3201, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %74 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %73, x86_fp80 0xK3FFFD1CCE147F28CFE7F, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %75 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %74, x86_fp80 0xK3FFCD377BBB27F6AFCD4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %76 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %75, x86_fp80 0xK3FF889D7B4591D2BD98B, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %77

77:                                               ; preds = %51, %66, %31
  %78 = phi x86_fp80 [ %39, %31 ], [ %58, %51 ], [ %71, %66 ]
  %79 = phi x86_fp80 [ %48, %31 ], [ %65, %51 ], [ %76, %66 ]
  %80 = bitcast x86_fp80 %4 to i80
  %81 = and i80 %80, -1099511627776
  %82 = bitcast i80 %81 to x86_fp80
  %83 = fneg x86_fp80 %82
  %84 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.625000e-01, metadata !"fpexcept.ignore") #3
  %85 = fneg x86_fp80 %84
  %86 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %83, x86_fp80 %82, x86_fp80 %85, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %87 = tail call x86_fp80 @expl(x86_fp80 noundef %86) #5
  %88 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %82, x86_fp80 %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %89 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %82, x86_fp80 %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %90 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %78, x86_fp80 %79, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %91 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %88, x86_fp80 %89, x86_fp80 %90, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %92 = tail call x86_fp80 @expl(x86_fp80 noundef %91) #5
  %93 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %87, x86_fp80 %92, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %94 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %93, x86_fp80 %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %95

95:                                               ; preds = %77, %5
  %96 = phi x86_fp80 [ %25, %5 ], [ %94, %77 ]
  ret x86_fp80 %96
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: nounwind optsize strictfp
define x86_fp80 @erfcl(x86_fp80 noundef %0) local_unnamed_addr #0 {
  %2 = bitcast x86_fp80 %0 to i80
  %3 = lshr i80 %2, 64
  %4 = trunc i80 %3 to i32
  %5 = shl nuw i32 %4, 16
  %6 = and i32 %5, 2147418112
  %7 = trunc i80 %2 to i64
  %8 = lshr i64 %7, 48
  %9 = trunc i64 %8 to i32
  %10 = or i32 %6, %9
  %11 = icmp ugt i32 %10, 2147418111
  br i1 %11, label %12, label %19

12:                                               ; preds = %1
  %13 = lshr i32 %4, 14
  %14 = and i32 %13, 2
  %15 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 %14, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %16 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %17 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %16, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %18 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %15, x86_fp80 %17, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %67

19:                                               ; preds = %1
  %20 = icmp ult i32 %10, 1073666048
  br i1 %20, label %21, label %51

21:                                               ; preds = %19
  %22 = icmp ult i32 %10, 1069416448
  br i1 %22, label %23, label %26

23:                                               ; preds = %21
  %24 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #3
  %25 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %24, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %67

26:                                               ; preds = %21
  %27 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %0, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %27, x86_fp80 0xKC006A587F1999B164FE8, x86_fp80 0xKC00AA61D154777EB9519, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %29 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %27, x86_fp80 %28, x86_fp80 0xKC00F85C36C1D991D946E, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %30 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %27, x86_fp80 %29, x86_fp80 0xKC011A1D511887DC5E424, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %31 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %27, x86_fp80 %30, x86_fp80 0xKC014AB6B55353EE251F9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %32 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %27, x86_fp80 %31, x86_fp80 0xK4013890DFACEC680CB0C, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 0xK400688E3EA4B462EBBD9, x86_fp80 %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %34 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %27, x86_fp80 %33, x86_fp80 0xK400B8CFCAC013C37575E, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %35 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %27, x86_fp80 %34, x86_fp80 0xK400F917CA49D3A9B4669, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %36 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %27, x86_fp80 %35, x86_fp80 0xK4012AC84BE0D9554997B, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %37 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %27, x86_fp80 %36, x86_fp80 0xK4014E4A3D90F25C1EEE9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %38 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %27, x86_fp80 %37, x86_fp80 0xK40168572745F3EF624EE, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %39 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %32, x86_fp80 %38, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %40 = icmp ult i32 %10, 1073577984
  br i1 %40, label %41, label %45

41:                                               ; preds = %26
  %42 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #3
  %43 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %0, x86_fp80 %39, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %44 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %42, x86_fp80 %43, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %67

45:                                               ; preds = %26
  %46 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #3
  %47 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #3
  %48 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %0, x86_fp80 %47, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %49 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %0, x86_fp80 %39, x86_fp80 %48, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %50 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %46, x86_fp80 %49, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %67

51:                                               ; preds = %19
  %52 = icmp ult i32 %10, 1074124288
  %53 = icmp ult i32 %4, 32768
  br i1 %52, label %54, label %61

54:                                               ; preds = %51
  br i1 %53, label %59, label %55

55:                                               ; preds = %54
  %56 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %57 = tail call fastcc x86_fp80 @erfc2(i32 noundef %10, x86_fp80 noundef %0) #4
  %58 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %56, x86_fp80 %57, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %67

59:                                               ; preds = %54
  %60 = tail call fastcc x86_fp80 @erfc2(i32 noundef %10, x86_fp80 noundef %0) #4
  br label %67

61:                                               ; preds = %51
  br i1 %53, label %65, label %62

62:                                               ; preds = %61
  %63 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %64 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %63, x86_fp80 0xK00018000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %67

65:                                               ; preds = %61
  %66 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 0xK00018000000000000000, x86_fp80 0xK00018000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %67

67:                                               ; preds = %62, %65, %55, %59, %45, %41, %23, %12
  %68 = phi x86_fp80 [ %18, %12 ], [ %25, %23 ], [ %44, %41 ], [ %50, %45 ], [ %58, %55 ], [ %60, %59 ], [ %64, %62 ], [ %66, %65 ]
  ret x86_fp80 %68
}

; Function Attrs: optsize
declare x86_fp80 @fabsl(x86_fp80 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare x86_fp80 @expl(x86_fp80 noundef) local_unnamed_addr #2

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
