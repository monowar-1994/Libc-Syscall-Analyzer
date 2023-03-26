; ModuleID = 'src/math/tgammal.c'
source_filename = "src/math/tgammal.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@P = internal constant [8 x x86_fp80] [x86_fp80 0xK3FF0B0B22BDA3F22434A, x86_fp80 0xK3FF3EE2E335BE82FF5AA, x86_fp80 0xK3FF7861BC7173757BE6C, x86_fp80 0xK3FF9C368B16651967F43, x86_fp80 0xK3FFBE3F48C3A8EB59549, x86_fp80 0xK3FFDB9D4C8E423AF8D75, x86_fp80 0xK3FFED67A16C819B329CF, x86_fp80 0xK3FFF8000000000000000], align 16
@Q = internal constant [9 x x86_fp80] [x86_fp80 0xKBFEEEA6712682DE85473, x86_fp80 0xK3FF2F60EA2DDC2F0334B, x86_fp80 0xKBFF5A23DA6911853BEED, x86_fp80 0xKBFF4D08F5DFD7CB1296E, x86_fp80 0xK3FF9E338D7BC79890417, x86_fp80 0xKBFFABDCDD58036983295, x86_fp80 0xKBFFCE5BC4AD33AB775EF, x86_fp80 0xK3FFDD47CFD572EC7E458, x86_fp80 0xK3FFF8000000000000000], align 16
@SN = internal constant [9 x x86_fp80] [x86_fp80 0xK3FF5948DB9F702DE5DD1, x86_fp80 0xK3FF7EC9CC5F1DD68989B, x86_fp80 0xK3FF89DA5386F18F02CA1, x86_fp80 0xKBFFAACD787D141DD783F, x86_fp80 0xKBFFCAA891905D76D7A5B, x86_fp80 0xKBFFAAC0AF47D12347F64, x86_fp80 0xK3FFEA7E7A01357D15E26, x86_fp80 0xK3FFE93C467E37DB0C7AA, x86_fp80 0xKBFFF8000000000000000], align 16
@S = internal constant [9 x x86_fp80] [x86_fp80 0xKBFF59C7E25E5D6D3BAEB, x86_fp80 0xK3FF7EC9AC74ECEB4FE9A, x86_fp80 0xKBFF89DA5B0E9DFEF9225, x86_fp80 0xKBFFAACD787DCEC1710B0, x86_fp80 0xK3FFCAA89190575156B8D, x86_fp80 0xKBFFAAC0AF47D126BF183, x86_fp80 0xKBFFEA7E7A01357D17BF6, x86_fp80 0xK3FFE93C467E37DB0C7A9, x86_fp80 0xK3FFF8000000000000000], align 16
@STIR = internal constant [9 x x86_fp80] [x86_fp80 0xK3FF4BB5D54E369F76EDE, x86_fp80 0xKBFEFC64B44430295C395, x86_fp80 0xKBFF49BFB5E477C59BA6F, x86_fp80 0xK3FF19293B11D1A395704, x86_fp80 0xK3FF4CD8798B21A2130B7, x86_fp80 0xKBFF2F09E6A087023BEF3, x86_fp80 0xKBFF6AFB934785AC83A1C, x86_fp80 0xK3FF6E38E38E3906EC3C9, x86_fp80 0xK3FFBAAAAAAAAAAAAA1D5], align 16

; Function Attrs: nounwind optsize strictfp
define x86_fp80 @tgammal(x86_fp80 noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @__fpclassifyl(x86_fp80 noundef %0) #3
  %3 = icmp sgt i32 %2, 1
  br i1 %3, label %7, label %4

4:                                                ; preds = %1
  %5 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float 0x7FF0000000000000, metadata !"fpexcept.ignore") #4
  %6 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %0, x86_fp80 %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %130

7:                                                ; preds = %1
  %8 = tail call x86_fp80 @fabsl(x86_fp80 noundef %0) #3
  %9 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.300000e+01, metadata !"fpexcept.ignore") #4
  %10 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %8, x86_fp80 %9, metadata !"ogt", metadata !"fpexcept.ignore") #4
  br i1 %10, label %11, label %60

11:                                               ; preds = %7
  %12 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #4
  %13 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %0, x86_fp80 %12, metadata !"olt", metadata !"fpexcept.ignore") #4
  br i1 %13, label %14, label %54

14:                                               ; preds = %11
  %15 = tail call x86_fp80 @floorl(x86_fp80 noundef %8) #3
  %16 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %8, x86_fp80 %15, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %17 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %18 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %16, x86_fp80 %17, metadata !"oeq", metadata !"fpexcept.ignore") #4
  br i1 %18, label %19, label %22

19:                                               ; preds = %14
  %20 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %21 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %20, x86_fp80 %16, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %130

22:                                               ; preds = %14
  %23 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %8, x86_fp80 0xK4009DB6E8F5C28F5C28F, metadata !"ogt", metadata !"fpexcept.ignore") #4
  br i1 %23, label %24, label %26

24:                                               ; preds = %22
  %25 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %43

26:                                               ; preds = %22
  %27 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #4
  %28 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %16, x86_fp80 %27, metadata !"ogt", metadata !"fpexcept.ignore") #4
  br i1 %28, label %29, label %33

29:                                               ; preds = %26
  %30 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #4
  %31 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %15, x86_fp80 %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %32 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %8, x86_fp80 %31, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %33

33:                                               ; preds = %29, %26
  %34 = phi x86_fp80 [ %31, %29 ], [ %15, %26 ]
  %35 = phi x86_fp80 [ %32, %29 ], [ %16, %26 ]
  %36 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 0xK4000C90FDAA22168C235, x86_fp80 %35, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %37 = tail call x86_fp80 @sinl(x86_fp80 noundef %36) #3
  %38 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %8, x86_fp80 %37, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %39 = tail call x86_fp80 @fabsl(x86_fp80 noundef %38) #3
  %40 = tail call fastcc x86_fp80 @stirf(x86_fp80 noundef %8) #5
  %41 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %39, x86_fp80 %40, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %42 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 0xK4000C90FDAA22168C235, x86_fp80 %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %43

43:                                               ; preds = %33, %24
  %44 = phi x86_fp80 [ %15, %24 ], [ %34, %33 ]
  %45 = phi x86_fp80 [ %25, %24 ], [ %42, %33 ]
  %46 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #4
  %47 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %46, x86_fp80 %44, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %48 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #4
  %49 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %8, x86_fp80 %48, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %50 = tail call x86_fp80 @floorl(x86_fp80 noundef %49) #3
  %51 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %47, x86_fp80 %50, metadata !"oeq", metadata !"fpexcept.ignore") #4
  %52 = fneg x86_fp80 %45
  %53 = select i1 %51, x86_fp80 %52, x86_fp80 %45
  br label %130

54:                                               ; preds = %11
  %55 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %0, x86_fp80 0xK4009DB6E8F5C28F5C28F, metadata !"ogt", metadata !"fpexcept.ignore") #4
  br i1 %55, label %56, label %58

56:                                               ; preds = %54
  %57 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %0, x86_fp80 0xK7FFE8000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %130

58:                                               ; preds = %54
  %59 = tail call fastcc x86_fp80 @stirf(x86_fp80 noundef %0) #5
  br label %130

60:                                               ; preds = %7
  %61 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #4
  %62 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 3.000000e+00, metadata !"fpexcept.ignore") #4
  %63 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %0, x86_fp80 %62, metadata !"oge", metadata !"fpexcept.ignore") #4
  br i1 %63, label %68, label %64

64:                                               ; preds = %68, %60
  %65 = phi x86_fp80 [ %0, %60 ], [ %72, %68 ]
  %66 = phi x86_fp80 [ %61, %60 ], [ %73, %68 ]
  %67 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %65, x86_fp80 0xKBFFA8000000000000000, metadata !"olt", metadata !"fpexcept.ignore") #4
  br i1 %67, label %76, label %83

68:                                               ; preds = %60, %68
  %69 = phi x86_fp80 [ %73, %68 ], [ %61, %60 ]
  %70 = phi x86_fp80 [ %72, %68 ], [ %0, %60 ]
  %71 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #4
  %72 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %70, x86_fp80 %71, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %73 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %69, x86_fp80 %72, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %74 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 3.000000e+00, metadata !"fpexcept.ignore") #4
  %75 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %72, x86_fp80 %74, metadata !"oge", metadata !"fpexcept.ignore") #4
  br i1 %75, label %68, label %64

76:                                               ; preds = %64, %76
  %77 = phi x86_fp80 [ %79, %76 ], [ %66, %64 ]
  %78 = phi x86_fp80 [ %81, %76 ], [ %65, %64 ]
  %79 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %77, x86_fp80 %78, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %80 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #4
  %81 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %78, x86_fp80 %80, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %82 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %81, x86_fp80 0xKBFFA8000000000000000, metadata !"olt", metadata !"fpexcept.ignore") #4
  br i1 %82, label %76, label %83

83:                                               ; preds = %76, %64
  %84 = phi x86_fp80 [ %65, %64 ], [ %81, %76 ]
  %85 = phi x86_fp80 [ %66, %64 ], [ %79, %76 ]
  %86 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %84, x86_fp80 0xK3FFA8000000000000000, metadata !"ole", metadata !"fpexcept.ignore") #4
  br i1 %86, label %110, label %87

87:                                               ; preds = %83
  %88 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 2.000000e+00, metadata !"fpexcept.ignore") #4
  %89 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %84, x86_fp80 %88, metadata !"olt", metadata !"fpexcept.ignore") #4
  br i1 %89, label %90, label %98

90:                                               ; preds = %87, %90
  %91 = phi x86_fp80 [ %93, %90 ], [ %85, %87 ]
  %92 = phi x86_fp80 [ %95, %90 ], [ %84, %87 ]
  %93 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %91, x86_fp80 %92, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %94 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #4
  %95 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %92, x86_fp80 %94, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %96 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 2.000000e+00, metadata !"fpexcept.ignore") #4
  %97 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %95, x86_fp80 %96, metadata !"olt", metadata !"fpexcept.ignore") #4
  br i1 %97, label %90, label %98

98:                                               ; preds = %90, %87
  %99 = phi x86_fp80 [ %84, %87 ], [ %95, %90 ]
  %100 = phi x86_fp80 [ %85, %87 ], [ %93, %90 ]
  %101 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 2.000000e+00, metadata !"fpexcept.ignore") #4
  %102 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %99, x86_fp80 %101, metadata !"oeq", metadata !"fpexcept.ignore") #4
  br i1 %102, label %130, label %103

103:                                              ; preds = %98
  %104 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 2.000000e+00, metadata !"fpexcept.ignore") #4
  %105 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %99, x86_fp80 %104, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %106 = tail call x86_fp80 @__polevll(x86_fp80 noundef %105, x86_fp80* noundef getelementptr inbounds ([8 x x86_fp80], [8 x x86_fp80]* @P, i64 0, i64 0), i32 noundef 7) #3
  %107 = tail call x86_fp80 @__polevll(x86_fp80 noundef %105, x86_fp80* noundef getelementptr inbounds ([9 x x86_fp80], [9 x x86_fp80]* @Q, i64 0, i64 0), i32 noundef 8) #3
  %108 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %100, x86_fp80 %106, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %109 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %108, x86_fp80 %107, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %130

110:                                              ; preds = %83
  %111 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %112 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %84, x86_fp80 %111, metadata !"oeq", metadata !"fpexcept.ignore") #4
  br i1 %112, label %113, label %118

113:                                              ; preds = %110
  %114 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %115 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %85, x86_fp80 %114, metadata !"une", metadata !"fpexcept.ignore") #4
  br i1 %115, label %116, label %118

116:                                              ; preds = %113
  %117 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %84, x86_fp80 %84, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %130

118:                                              ; preds = %113, %110
  %119 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #4
  %120 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %84, x86_fp80 %119, metadata !"olt", metadata !"fpexcept.ignore") #4
  br i1 %120, label %121, label %126

121:                                              ; preds = %118
  %122 = fneg x86_fp80 %84
  %123 = tail call x86_fp80 @__polevll(x86_fp80 noundef %122, x86_fp80* noundef getelementptr inbounds ([9 x x86_fp80], [9 x x86_fp80]* @SN, i64 0, i64 0), i32 noundef 8) #3
  %124 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %122, x86_fp80 %123, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %125 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %85, x86_fp80 %124, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %130

126:                                              ; preds = %118
  %127 = tail call x86_fp80 @__polevll(x86_fp80 noundef %84, x86_fp80* noundef getelementptr inbounds ([9 x x86_fp80], [9 x x86_fp80]* @S, i64 0, i64 0), i32 noundef 8) #3
  %128 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %84, x86_fp80 %127, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %129 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %85, x86_fp80 %128, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %130

130:                                              ; preds = %43, %121, %126, %98, %58, %56, %116, %103, %19, %4
  %131 = phi x86_fp80 [ %21, %19 ], [ %117, %116 ], [ %109, %103 ], [ %6, %4 ], [ %57, %56 ], [ %59, %58 ], [ %53, %43 ], [ %100, %98 ], [ %125, %121 ], [ %129, %126 ]
  ret x86_fp80 %131
}

; Function Attrs: optsize
declare i32 @__fpclassifyl(x86_fp80 noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: optsize
declare x86_fp80 @fabsl(x86_fp80 noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: optsize
declare x86_fp80 @floorl(x86_fp80 noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: optsize
declare x86_fp80 @sinl(x86_fp80 noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc x86_fp80 @stirf(x86_fp80 noundef %0) unnamed_addr #0 {
  %2 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #4
  %3 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %2, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %4 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.024000e+03, metadata !"fpexcept.ignore") #4
  %5 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %0, x86_fp80 %4, metadata !"ogt", metadata !"fpexcept.ignore") #4
  br i1 %5, label %6, label %14

6:                                                ; preds = %1
  %7 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 0xK3FF1923B0241CE01C3F2, x86_fp80 %3, x86_fp80 0xK3FF4CD87FB43A79620E4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %8 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %7, x86_fp80 %3, x86_fp80 0xKBFF2F09E7232FD42CAB1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %9 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %8, x86_fp80 %3, x86_fp80 0xKBFF6AFB93476D5A63DF2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %10 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %9, x86_fp80 %3, x86_fp80 0xK3FF6E38E38E38E38E38E, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %11 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %10, x86_fp80 %3, x86_fp80 0xK3FFBAAAAAAAAAAAAAAAB, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %12 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #4
  %13 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %11, x86_fp80 %3, x86_fp80 %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %18

14:                                               ; preds = %1
  %15 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #4
  %16 = tail call x86_fp80 @__polevll(x86_fp80 noundef %3, x86_fp80* noundef getelementptr inbounds ([9 x x86_fp80], [9 x x86_fp80]* @STIR, i64 0, i64 0), i32 noundef 8) #3
  %17 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %3, x86_fp80 %16, x86_fp80 %15, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %18

18:                                               ; preds = %14, %6
  %19 = phi x86_fp80 [ %13, %6 ], [ %17, %14 ]
  %20 = tail call x86_fp80 @expl(x86_fp80 noundef %0) #3
  %21 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %0, x86_fp80 0xK40098000000000000000, metadata !"ogt", metadata !"fpexcept.ignore") #4
  br i1 %21, label %22, label %27

22:                                               ; preds = %18
  %23 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 0xK3FFE8000000000000000, x86_fp80 %0, x86_fp80 0xKBFFD8000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %24 = tail call x86_fp80 @powl(x86_fp80 noundef %0, x86_fp80 noundef %23) #3
  %25 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %24, x86_fp80 %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %26 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %24, x86_fp80 %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %31

27:                                               ; preds = %18
  %28 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %0, x86_fp80 0xK3FFE8000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %29 = tail call x86_fp80 @powl(x86_fp80 noundef %0, x86_fp80 noundef %28) #3
  %30 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %29, x86_fp80 %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %31

31:                                               ; preds = %27, %22
  %32 = phi x86_fp80 [ %26, %22 ], [ %30, %27 ]
  %33 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 0xK4000A06C98FFB1382CB3, x86_fp80 %32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %34 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %33, x86_fp80 %19, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  ret x86_fp80 %34
}

; Function Attrs: optsize
declare hidden x86_fp80 @__polevll(x86_fp80 noundef, x86_fp80* noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: optsize
declare x86_fp80 @expl(x86_fp80 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare x86_fp80 @powl(x86_fp80 noundef, x86_fp80 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { strictfp }
attributes #5 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
