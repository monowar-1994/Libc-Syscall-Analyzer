; ModuleID = 'src/math/powl.c'
source_filename = "src/math/powl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@A = internal unnamed_addr constant [33 x x86_fp80] [x86_fp80 0xK3FFF8000000000000000, x86_fp80 0xK3FFEFA83B2DB722A033A, x86_fp80 0xK3FFEF5257D152486CC2C, x86_fp80 0xK3FFEEFE4B99BDCDAF5CB, x86_fp80 0xK3FFEEAC0C6E7DD24392F, x86_fp80 0xK3FFEE5B906E77C8348A8, x86_fp80 0xK3FFEE0CCDEEC2A94E111, x86_fp80 0xK3FFEDBFBB797DAF23755, x86_fp80 0xK3FFED744FCCAD69D6AF4, x86_fp80 0xK3FFED2A81D91F12AE45A, x86_fp80 0xK3FFECE248C151F8480E4, x86_fp80 0xK3FFEC9B9BD866E2F27A3, x86_fp80 0xK3FFEC5672A115506DADD, x86_fp80 0xK3FFEC12C4CCA66709456, x86_fp80 0xK3FFEBD08A39F580C36BF, x86_fp80 0xK3FFEB8FBAF4762FB9EE9, x86_fp80 0xK3FFEB504F333F9DE6484, x86_fp80 0xK3FFEB123F581D2AC2590, x86_fp80 0xK3FFEAD583EEA42A14AC6, x86_fp80 0xK3FFEA9A15AB4EA7C0EF8, x86_fp80 0xK3FFEA5FED6A9B15138EA, x86_fp80 0xK3FFEA27043030C496819, x86_fp80 0xK3FFE9EF5326091A111AE, x86_fp80 0xK3FFE9B8D39B9D54E5539, x86_fp80 0xK3FFE9837F0518DB8A96F, x86_fp80 0xK3FFE94F4EFA8FEF70961, x86_fp80 0xK3FFE91C3D373AB11C336, x86_fp80 0xK3FFE8EA4398B45CD53C0, x86_fp80 0xK3FFE8B95C1E3EA8BD6E7, x86_fp80 0xK3FFE88980E8092DA8527, x86_fp80 0xK3FFE85AAC367CC487B15, x86_fp80 0xK3FFE82CD8698AC2BA1D7, x86_fp80 0xK3FFE8000000000000000], align 16
@B = internal unnamed_addr constant [17 x x86_fp80] [x86_fp80 0xK00000000000000000000, x86_fp80 0xK3FBDF73A18F5DB301F87, x86_fp80 0xKBFBCBF4A29323E46AC15, x86_fp80 0xK3FB9CB12A091BA667944, x86_fp80 0xK3FBCE69A2EE640B4FF78, x86_fp80 0xKBFBBEE53E3835069C895, x86_fp80 0xK3FBCF8AB432593767CDE, x86_fp80 0xKBFBDAEFDC09325E0A10C, x86_fp80 0xK3FBDB2FB1366EA957D3E, x86_fp80 0xK3FBD93015191EB345D89, x86_fp80 0xK3FBBE5EBFB10B88380D9, x86_fp80 0xKBFBDBEDDC1EC288C045D, x86_fp80 0xK3FBD8D5A46305C85EDED, x86_fp80 0xK3FBAFD6D8E0AE5AC9D82, x86_fp80 0xKBFB98373AF14EB586DFD, x86_fp80 0xKBFBCE8DA91CF7AACF938, x86_fp80 0xK00000000000000000000], align 16
@P = internal constant [4 x x86_fp80] [x86_fp80 0xK3FF4DA6AC6F4A8B7B804, x86_fp80 0xK3FFDFAE158C0CF027DE9, x86_fp80 0xK3FFFE00067C93722405A, x86_fp80 0xK3FFFB33387CA6B43CD99], align 16
@Q = internal constant [3 x x86_fp80] [x86_fp80 0xK4001A8003B33A4696307, x86_fp80 0xK40028666A51C62D7FEC2, x86_fp80 0xK40018666A5D7D072DA32], align 16
@twom10000 = internal constant x86_fp80 0xK18EF8000000000000000, align 16
@R = internal constant [7 x x86_fp80] [x86_fp80 0xK3FEEFD2AEE1D530EA69B, x86_fp80 0xK3FF2A18259608E7EC746, x86_fp80 0xK3FF5AEC3FD6AADDA63B6, x86_fp80 0xK3FF89D955B7CFD99C104, x86_fp80 0xK3FFAE35846B8249DE05E, x86_fp80 0xK3FFCF5FDEFFC162C5D1D, x86_fp80 0xK3FFEB17217F7D1CF79AA], align 16

; Function Attrs: nounwind optsize strictfp
define x86_fp80 @powl(x86_fp80 noundef %0, x86_fp80 noundef %1) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca x86_fp80, align 16
  %5 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %5) #4
  %6 = bitcast x86_fp80* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 10, i8* nonnull %6)
  %7 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store volatile x86_fp80 %7, x86_fp80* %4, align 16, !tbaa !3
  %8 = tail call i32 @__fpclassifyl(x86_fp80 noundef %0) #6
  %9 = icmp eq i32 %8, 0
  %10 = tail call i32 @__fpclassifyl(x86_fp80 noundef %1) #6
  %11 = icmp eq i32 %10, 0
  br i1 %9, label %12, label %18

12:                                               ; preds = %2
  br i1 %11, label %312, label %13

13:                                               ; preds = %12
  %14 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #5
  %15 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %1, x86_fp80 %14, metadata !"oeq", metadata !"fpexcept.ignore") #5
  br i1 %15, label %16, label %312

16:                                               ; preds = %13
  %17 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #5
  br label %312

18:                                               ; preds = %2
  %19 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #5
  %20 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %0, x86_fp80 %19, metadata !"oeq", metadata !"fpexcept.ignore") #5
  br i1 %11, label %21, label %24

21:                                               ; preds = %18
  br i1 %20, label %22, label %312

22:                                               ; preds = %21
  %23 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #5
  br label %312

24:                                               ; preds = %18
  br i1 %20, label %25, label %27

25:                                               ; preds = %24
  %26 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #5
  br label %312

27:                                               ; preds = %24
  %28 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double -1.000000e+00, metadata !"fpexcept.ignore") #5
  %29 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %0, x86_fp80 %28, metadata !"oeq", metadata !"fpexcept.ignore") #5
  br i1 %29, label %30, label %35

30:                                               ; preds = %27
  %31 = tail call i32 @__fpclassifyl(x86_fp80 noundef %1) #6
  %32 = icmp sgt i32 %31, 1
  br i1 %32, label %35, label %33

33:                                               ; preds = %30
  %34 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #5
  br label %312

35:                                               ; preds = %30, %27
  %36 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #5
  %37 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %1, x86_fp80 %36, metadata !"oeq", metadata !"fpexcept.ignore") #5
  %38 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #5
  br i1 %37, label %312, label %39

39:                                               ; preds = %35
  %40 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %1, x86_fp80 %38, metadata !"oeq", metadata !"fpexcept.ignore") #5
  br i1 %40, label %312, label %41

41:                                               ; preds = %39
  %42 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %1, x86_fp80 0xK7FFEFFFFFFFFFFFFFFFF, metadata !"oge", metadata !"fpexcept.ignore") #5
  br i1 %42, label %43, label %56

43:                                               ; preds = %41
  %44 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #5
  %45 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %0, x86_fp80 %44, metadata !"ogt", metadata !"fpexcept.ignore") #5
  br i1 %45, label %49, label %46

46:                                               ; preds = %43
  %47 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double -1.000000e+00, metadata !"fpexcept.ignore") #5
  %48 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %0, x86_fp80 %47, metadata !"olt", metadata !"fpexcept.ignore") #5
  br i1 %48, label %49, label %51

49:                                               ; preds = %46, %43
  %50 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float 0x7FF0000000000000, metadata !"fpexcept.ignore") #5
  br label %312

51:                                               ; preds = %46
  %52 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #5
  %53 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %0, x86_fp80 %52, metadata !"une", metadata !"fpexcept.ignore") #5
  br i1 %53, label %54, label %56

54:                                               ; preds = %51
  %55 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #5
  br label %312

56:                                               ; preds = %51, %41
  %57 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %1, x86_fp80 0xKFFFEFFFFFFFFFFFFFFFF, metadata !"ole", metadata !"fpexcept.ignore") #5
  br i1 %57, label %58, label %74

58:                                               ; preds = %56
  %59 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #5
  %60 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %0, x86_fp80 %59, metadata !"ogt", metadata !"fpexcept.ignore") #5
  br i1 %60, label %64, label %61

61:                                               ; preds = %58
  %62 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double -1.000000e+00, metadata !"fpexcept.ignore") #5
  %63 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %0, x86_fp80 %62, metadata !"olt", metadata !"fpexcept.ignore") #5
  br i1 %63, label %64, label %66

64:                                               ; preds = %61, %58
  %65 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #5
  br label %312

66:                                               ; preds = %61
  %67 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #5
  %68 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %0, x86_fp80 %67, metadata !"une", metadata !"fpexcept.ignore") #5
  br i1 %68, label %72, label %69

69:                                               ; preds = %66
  %70 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float 0xFFF0000000000000, metadata !"fpexcept.ignore") #5
  %71 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %1, x86_fp80 %70, metadata !"oeq", metadata !"fpexcept.ignore") #5
  br i1 %71, label %72, label %74

72:                                               ; preds = %69, %66
  %73 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float 0x7FF0000000000000, metadata !"fpexcept.ignore") #5
  br label %312

74:                                               ; preds = %69, %56
  %75 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %0, x86_fp80 0xK7FFEFFFFFFFFFFFFFFFF, metadata !"oge", metadata !"fpexcept.ignore") #5
  br i1 %75, label %76, label %83

76:                                               ; preds = %74
  %77 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #5
  %78 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %1, x86_fp80 %77, metadata !"ogt", metadata !"fpexcept.ignore") #5
  br i1 %78, label %79, label %81

79:                                               ; preds = %76
  %80 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float 0x7FF0000000000000, metadata !"fpexcept.ignore") #5
  br label %312

81:                                               ; preds = %76
  %82 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #5
  br label %312

83:                                               ; preds = %74
  %84 = tail call x86_fp80 @floorl(x86_fp80 noundef %1) #6
  %85 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %84, x86_fp80 %1, metadata !"oeq", metadata !"fpexcept.ignore") #5
  br i1 %85, label %86, label %96

86:                                               ; preds = %83
  %87 = tail call x86_fp80 @fabsl(x86_fp80 noundef %1) #6
  %88 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #5
  %89 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %88, x86_fp80 %87, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %90 = tail call x86_fp80 @floorl(x86_fp80 noundef %89) #6
  %91 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #5
  %92 = tail call x86_fp80 @fabsl(x86_fp80 noundef %84) #6
  %93 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %91, x86_fp80 %92, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %94 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %90, x86_fp80 %93, metadata !"une", metadata !"fpexcept.ignore") #5
  %95 = xor i1 %94, true
  br label %96

96:                                               ; preds = %86, %83
  %97 = phi i1 [ true, %83 ], [ %95, %86 ]
  %98 = phi i1 [ false, %83 ], [ %94, %86 ]
  %99 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %0, x86_fp80 0xKFFFEFFFFFFFFFFFFFFFF, metadata !"ole", metadata !"fpexcept.ignore") #5
  br i1 %99, label %100, label %116

100:                                              ; preds = %96
  %101 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #5
  %102 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %1, x86_fp80 %101, metadata !"ogt", metadata !"fpexcept.ignore") #5
  br i1 %102, label %103, label %108

103:                                              ; preds = %100
  br i1 %97, label %106, label %104

104:                                              ; preds = %103
  %105 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float 0xFFF0000000000000, metadata !"fpexcept.ignore") #5
  br label %312

106:                                              ; preds = %103
  %107 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float 0x7FF0000000000000, metadata !"fpexcept.ignore") #5
  br label %312

108:                                              ; preds = %100
  %109 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #5
  %110 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %1, x86_fp80 %109, metadata !"olt", metadata !"fpexcept.ignore") #5
  br i1 %110, label %111, label %116

111:                                              ; preds = %108
  br i1 %97, label %114, label %112

112:                                              ; preds = %111
  %113 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double -0.000000e+00, metadata !"fpexcept.ignore") #5
  br label %312

114:                                              ; preds = %111
  %115 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #5
  br label %312

116:                                              ; preds = %108, %96
  %117 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #5
  %118 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %0, x86_fp80 %117, metadata !"ole", metadata !"fpexcept.ignore") #5
  br i1 %118, label %119, label %149

119:                                              ; preds = %116
  %120 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #5
  %121 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %0, x86_fp80 %120, metadata !"oeq", metadata !"fpexcept.ignore") #5
  br i1 %121, label %122, label %140

122:                                              ; preds = %119
  %123 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #5
  %124 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %1, x86_fp80 %123, metadata !"olt", metadata !"fpexcept.ignore") #5
  %125 = tail call i32 @__signbitl(x86_fp80 noundef %0) #6
  %126 = icmp ne i32 %125, 0
  %127 = and i1 %98, %126
  br i1 %124, label %128, label %135

128:                                              ; preds = %122
  br i1 %127, label %129, label %132

129:                                              ; preds = %128
  %130 = tail call double @llvm.experimental.constrained.fdiv.f64(double -1.000000e+00, double 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %131 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %130, metadata !"fpexcept.ignore") #5
  br label %312

132:                                              ; preds = %128
  %133 = tail call double @llvm.experimental.constrained.fdiv.f64(double 1.000000e+00, double 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %134 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %133, metadata !"fpexcept.ignore") #5
  br label %312

135:                                              ; preds = %122
  br i1 %127, label %136, label %138

136:                                              ; preds = %135
  %137 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double -0.000000e+00, metadata !"fpexcept.ignore") #5
  br label %312

138:                                              ; preds = %135
  %139 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #5
  br label %312

140:                                              ; preds = %119
  br i1 %85, label %145, label %141

141:                                              ; preds = %140
  %142 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %0, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %143 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %0, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %144 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %142, x86_fp80 %143, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %312

145:                                              ; preds = %140
  %146 = xor i1 %97, true
  %147 = zext i1 %146 to i32
  %148 = fneg x86_fp80 %0
  br label %150

149:                                              ; preds = %116
  br i1 %85, label %150, label %165

150:                                              ; preds = %145, %149
  %151 = phi x86_fp80 [ %148, %145 ], [ %0, %149 ]
  %152 = phi i32 [ %147, %145 ], [ 0, %149 ]
  %153 = tail call x86_fp80 @floorl(x86_fp80 noundef %151) #6
  %154 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %153, x86_fp80 %151, metadata !"oeq", metadata !"fpexcept.ignore") #5
  br i1 %154, label %155, label %165

155:                                              ; preds = %150
  %156 = tail call x86_fp80 @fabsl(x86_fp80 noundef %1) #6
  %157 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 3.276800e+04, metadata !"fpexcept.ignore") #5
  %158 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %156, x86_fp80 %157, metadata !"olt", metadata !"fpexcept.ignore") #5
  br i1 %158, label %159, label %165

159:                                              ; preds = %155
  %160 = tail call i32 @llvm.experimental.constrained.fptosi.i32.f80(x86_fp80 %1, metadata !"fpexcept.ignore") #5
  %161 = tail call fastcc x86_fp80 @powil(x86_fp80 noundef %151, i32 noundef %160) #7
  %162 = icmp eq i32 %152, 0
  %163 = fneg x86_fp80 %161
  %164 = select i1 %162, x86_fp80 %161, x86_fp80 %163
  br label %312

165:                                              ; preds = %155, %150, %149
  %166 = phi x86_fp80 [ %151, %155 ], [ %151, %150 ], [ %0, %149 ]
  %167 = phi i32 [ %152, %155 ], [ %152, %150 ], [ 0, %149 ]
  %168 = call x86_fp80 @frexpl(x86_fp80 noundef %166, i32* noundef nonnull %3) #6
  %169 = load i32, i32* %3, align 4, !tbaa !7
  %170 = sext i32 %169 to i64
  %171 = call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %168, x86_fp80 0xK3FFEB123F581D2AC2590, metadata !"ole", metadata !"fpexcept.ignore") #5
  %172 = select i1 %171, i32 17, i32 1
  %173 = or i32 %172, 8
  %174 = zext i32 %173 to i64
  %175 = getelementptr inbounds [33 x x86_fp80], [33 x x86_fp80]* @A, i64 0, i64 %174
  %176 = load x86_fp80, x86_fp80* %175, align 16, !tbaa !3
  %177 = call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %168, x86_fp80 %176, metadata !"ole", metadata !"fpexcept.ignore") #5
  %178 = select i1 %177, i32 %173, i32 %172
  %179 = or i32 %178, 4
  %180 = zext i32 %179 to i64
  %181 = getelementptr inbounds [33 x x86_fp80], [33 x x86_fp80]* @A, i64 0, i64 %180
  %182 = load x86_fp80, x86_fp80* %181, align 16, !tbaa !3
  %183 = call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %168, x86_fp80 %182, metadata !"ole", metadata !"fpexcept.ignore") #5
  %184 = select i1 %183, i32 %179, i32 %178
  %185 = or i32 %184, 2
  %186 = zext i32 %185 to i64
  %187 = getelementptr inbounds [33 x x86_fp80], [33 x x86_fp80]* @A, i64 0, i64 %186
  %188 = load x86_fp80, x86_fp80* %187, align 16, !tbaa !3
  %189 = call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %168, x86_fp80 %188, metadata !"ole", metadata !"fpexcept.ignore") #5
  %190 = select i1 %189, i32 %185, i32 %184
  %191 = call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %168, x86_fp80 0xK3FFEFA83B2DB722A033A, metadata !"oge", metadata !"fpexcept.ignore") #5
  %192 = add nsw i32 %190, 1
  %193 = select i1 %191, i32 0, i32 %192
  store i32 %193, i32* %3, align 4, !tbaa !7
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds [33 x x86_fp80], [33 x x86_fp80]* @A, i64 0, i64 %194
  %196 = load x86_fp80, x86_fp80* %195, align 16, !tbaa !3
  %197 = call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %168, x86_fp80 %196, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %198 = sdiv i32 %193, 2
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds [17 x x86_fp80], [17 x x86_fp80]* @B, i64 0, i64 %199
  %201 = load x86_fp80, x86_fp80* %200, align 16, !tbaa !3
  %202 = call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %197, x86_fp80 %201, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %203 = call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %202, x86_fp80 %196, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %204 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %203, x86_fp80 %203, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store volatile x86_fp80 %204, x86_fp80* %4, align 16, !tbaa !3
  %205 = load volatile x86_fp80, x86_fp80* %4, align 16, !tbaa !3
  %206 = call x86_fp80 @__polevll(x86_fp80 noundef %203, x86_fp80* noundef getelementptr inbounds ([4 x x86_fp80], [4 x x86_fp80]* @P, i64 0, i64 0), i32 noundef 3) #6
  %207 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %205, x86_fp80 %206, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %208 = call x86_fp80 @__p1evll(x86_fp80 noundef %203, x86_fp80* noundef getelementptr inbounds ([3 x x86_fp80], [3 x x86_fp80]* @Q, i64 0, i64 0), i32 noundef 3) #6
  %209 = call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %207, x86_fp80 %208, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %210 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %203, x86_fp80 %209, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %211 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #5
  %212 = load volatile x86_fp80, x86_fp80* %4, align 16, !tbaa !3
  %213 = fneg x86_fp80 %211
  %214 = call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %213, x86_fp80 %212, x86_fp80 %210, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %215 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 0xK3FFDE2A8ECA5705FC2EF, x86_fp80 %214, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store volatile x86_fp80 %215, x86_fp80* %4, align 16, !tbaa !3
  %216 = load volatile x86_fp80, x86_fp80* %4, align 16, !tbaa !3
  %217 = call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %216, x86_fp80 %214, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store volatile x86_fp80 %217, x86_fp80* %4, align 16, !tbaa !3
  %218 = load volatile x86_fp80, x86_fp80* %4, align 16, !tbaa !3
  %219 = call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 0xK3FFDE2A8ECA5705FC2EF, x86_fp80 %203, x86_fp80 %218, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store volatile x86_fp80 %219, x86_fp80* %4, align 16, !tbaa !3
  %220 = load volatile x86_fp80, x86_fp80* %4, align 16, !tbaa !3
  %221 = call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %220, x86_fp80 %203, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store volatile x86_fp80 %221, x86_fp80* %4, align 16, !tbaa !3
  %222 = load i32, i32* %3, align 4, !tbaa !7
  %223 = sub nsw i32 0, %222
  %224 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 %223, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %225 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %226 = call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %224, x86_fp80 %225, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %227 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i64(i64 %170, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %228 = call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %226, x86_fp80 %227, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %229 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %230 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %1, x86_fp80 %229, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %231 = call x86_fp80 @floorl(x86_fp80 noundef %230) #6
  %232 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %233 = call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %231, x86_fp80 %232, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %234 = call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %1, x86_fp80 %233, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %235 = load volatile x86_fp80, x86_fp80* %4, align 16, !tbaa !3
  %236 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %228, x86_fp80 %234, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %237 = call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %235, x86_fp80 %1, x86_fp80 %236, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %238 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %239 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %237, x86_fp80 %238, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %240 = call x86_fp80 @floorl(x86_fp80 noundef %239) #6
  %241 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %242 = call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %240, x86_fp80 %241, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %243 = call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %237, x86_fp80 %242, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %244 = call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %228, x86_fp80 %233, x86_fp80 %242, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %245 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %246 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %244, x86_fp80 %245, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %247 = call x86_fp80 @floorl(x86_fp80 noundef %246) #6
  %248 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %249 = call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %247, x86_fp80 %248, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %250 = call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %244, x86_fp80 %249, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %251 = call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %243, x86_fp80 %250, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %252 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %253 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %251, x86_fp80 %252, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %254 = call x86_fp80 @floorl(x86_fp80 noundef %253) #6
  %255 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %256 = call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %254, x86_fp80 %255, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %257 = call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %249, x86_fp80 %256, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %258 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %259 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %257, x86_fp80 %258, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %260 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %261 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %260, x86_fp80 0xK400D8000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %262 = call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %259, x86_fp80 %261, metadata !"ogt", metadata !"fpexcept.ignore") #5
  br i1 %262, label %263, label %265

263:                                              ; preds = %165
  %264 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 0xK670F8000000000000000, x86_fp80 0xK670F8000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %312

265:                                              ; preds = %165
  %266 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 -32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %267 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %266, x86_fp80 0xK400D8080000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %268 = call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %259, x86_fp80 %267, metadata !"olt", metadata !"fpexcept.ignore") #5
  br i1 %268, label %269, label %273

269:                                              ; preds = %265
  %270 = load volatile x86_fp80, x86_fp80* @twom10000, align 16, !tbaa !3
  %271 = load volatile x86_fp80, x86_fp80* @twom10000, align 16, !tbaa !3
  %272 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %270, x86_fp80 %271, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %312

273:                                              ; preds = %265
  %274 = call i64 @llvm.experimental.constrained.fptosi.i64.f80(x86_fp80 %259, metadata !"fpexcept.ignore") #5
  %275 = call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %251, x86_fp80 %256, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %276 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #5
  %277 = call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %275, x86_fp80 %276, metadata !"ogt", metadata !"fpexcept.ignore") #5
  br i1 %277, label %278, label %284

278:                                              ; preds = %273
  %279 = add nsw i64 %274, 1
  %280 = call double @llvm.experimental.constrained.sitofp.f64.i32(i32 32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %281 = call double @llvm.experimental.constrained.fdiv.f64(double 1.000000e+00, double %280, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %282 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %281, metadata !"fpexcept.ignore") #5
  %283 = call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %275, x86_fp80 %282, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %284

284:                                              ; preds = %278, %273
  %285 = phi i64 [ %279, %278 ], [ %274, %273 ]
  %286 = phi x86_fp80 [ %283, %278 ], [ %275, %273 ]
  %287 = call x86_fp80 @__polevll(x86_fp80 noundef %286, x86_fp80* noundef getelementptr inbounds ([7 x x86_fp80], [7 x x86_fp80]* @R, i64 0, i64 0), i32 noundef 6) #6
  %288 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %286, x86_fp80 %287, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store volatile x86_fp80 %288, x86_fp80* %4, align 16, !tbaa !3
  %289 = lshr i64 %285, 63
  %290 = trunc i64 %289 to i32
  %291 = xor i32 %290, 1
  %292 = sdiv i64 %285, 32
  %293 = trunc i64 %292 to i32
  %294 = add i32 %291, %293
  store i32 %294, i32* %3, align 4, !tbaa !7
  %295 = shl nsw i32 %294, 5
  %296 = sext i32 %295 to i64
  %297 = sub nsw i64 %296, %285
  %298 = getelementptr inbounds [33 x x86_fp80], [33 x x86_fp80]* @A, i64 0, i64 %297
  %299 = load x86_fp80, x86_fp80* %298, align 16, !tbaa !3
  %300 = load volatile x86_fp80, x86_fp80* %4, align 16, !tbaa !3
  %301 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %299, x86_fp80 %300, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store volatile x86_fp80 %301, x86_fp80* %4, align 16, !tbaa !3
  %302 = load volatile x86_fp80, x86_fp80* %4, align 16, !tbaa !3
  %303 = call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %302, x86_fp80 %299, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store volatile x86_fp80 %303, x86_fp80* %4, align 16, !tbaa !3
  %304 = load volatile x86_fp80, x86_fp80* %4, align 16, !tbaa !3
  %305 = call x86_fp80 @scalbnl(x86_fp80 noundef %304, i32 noundef %294) #6
  store volatile x86_fp80 %305, x86_fp80* %4, align 16, !tbaa !3
  %306 = icmp eq i32 %167, 0
  br i1 %306, label %310, label %307

307:                                              ; preds = %284
  %308 = load volatile x86_fp80, x86_fp80* %4, align 16, !tbaa !3
  %309 = fneg x86_fp80 %308
  store volatile x86_fp80 %309, x86_fp80* %4, align 16, !tbaa !3
  br label %310

310:                                              ; preds = %307, %284
  %311 = load volatile x86_fp80, x86_fp80* %4, align 16, !tbaa !3
  br label %312

312:                                              ; preds = %35, %39, %21, %12, %13, %310, %269, %263, %159, %141, %138, %136, %132, %129, %114, %112, %106, %104, %81, %79, %72, %64, %54, %49, %33, %25, %22, %16
  %313 = phi x86_fp80 [ %17, %16 ], [ %23, %22 ], [ %26, %25 ], [ %50, %49 ], [ %55, %54 ], [ %65, %64 ], [ %73, %72 ], [ %80, %79 ], [ %82, %81 ], [ %105, %104 ], [ %107, %106 ], [ %113, %112 ], [ %115, %114 ], [ %131, %129 ], [ %134, %132 ], [ %137, %136 ], [ %139, %138 ], [ %144, %141 ], [ %164, %159 ], [ %264, %263 ], [ %272, %269 ], [ %311, %310 ], [ %34, %33 ], [ %0, %13 ], [ %0, %12 ], [ %1, %21 ], [ %0, %39 ], [ %38, %35 ]
  call void @llvm.lifetime.end.p0i8(i64 10, i8* nonnull %6)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %5) #4
  ret x86_fp80 %313
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32, metadata, metadata) #2

; Function Attrs: optsize
declare i32 @__fpclassifyl(x86_fp80 noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float, metadata) #2

; Function Attrs: optsize
declare x86_fp80 @floorl(x86_fp80 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare x86_fp80 @fabsl(x86_fp80 noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: optsize
declare i32 @__signbitl(x86_fp80 noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc x86_fp80 @powil(x86_fp80 noundef %0, i32 noundef %1) unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #4
  %5 = icmp eq i32 %1, 0
  br i1 %5, label %6, label %8

6:                                                ; preds = %2
  %7 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #5
  br label %84

8:                                                ; preds = %2
  %9 = icmp slt i32 %1, 0
  %10 = sub nsw i32 0, %1
  %11 = select i1 %9, i32 %10, i32 %1
  %12 = select i1 %9, i32 1, i32 -1
  %13 = select i1 %9, i32 -1, i32 1
  %14 = call x86_fp80 @frexpl(x86_fp80 noundef %0, i32* noundef nonnull %3) #6
  %15 = load i32, i32* %3, align 4, !tbaa !7
  %16 = add nsw i32 %15, -1
  %17 = mul nsw i32 %16, %11
  %18 = icmp eq i32 %17, 0
  %19 = add i32 %17, -65
  %20 = icmp ult i32 %19, -129
  %21 = or i1 %18, %20
  br i1 %21, label %22, label %34

22:                                               ; preds = %8
  %23 = call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %14, x86_fp80 0xK3FFEB504F333F9DE6433, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %24 = call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %14, x86_fp80 0xK3FFEB504F333F9DE6433, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %25 = call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %23, x86_fp80 %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %26 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #5
  %27 = fneg x86_fp80 %26
  %28 = call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 0xK4000BA827999FCEF3161, x86_fp80 %25, x86_fp80 %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %29 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 %15, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %30 = call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %28, x86_fp80 %29, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %31 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %32 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %30, x86_fp80 %31, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %33 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %32, x86_fp80 0xK3FFEB17217F7D1CF79AC, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %37

34:                                               ; preds = %8
  %35 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 %17, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %36 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 0xK3FFEB17217F7D1CF79AC, x86_fp80 %35, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %37

37:                                               ; preds = %34, %22
  %38 = phi x86_fp80 [ %33, %22 ], [ %36, %34 ]
  %39 = call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %38, x86_fp80 0xK400CB17217F7D1CF79AC, metadata !"ogt", metadata !"fpexcept.ignore") #5
  br i1 %39, label %40, label %42

40:                                               ; preds = %37
  %41 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 0xK670F8000000000000000, x86_fp80 0xK670F8000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %84

42:                                               ; preds = %37
  %43 = call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %38, x86_fp80 0xKC00CB21DFE7F09E2BAAA, metadata !"olt", metadata !"fpexcept.ignore") #5
  br i1 %43, label %44, label %48

44:                                               ; preds = %42
  %45 = load volatile x86_fp80, x86_fp80* @twom10000, align 16, !tbaa !3
  %46 = load volatile x86_fp80, x86_fp80* @twom10000, align 16, !tbaa !3
  %47 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %45, x86_fp80 %46, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %84

48:                                               ; preds = %42
  %49 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 2.000000e+00, metadata !"fpexcept.ignore") #5
  %50 = call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 0xKC00CB17217F7D1CF79AC, x86_fp80 %49, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %51 = call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %38, x86_fp80 %50, metadata !"olt", metadata !"fpexcept.ignore") #5
  br i1 %51, label %52, label %55

52:                                               ; preds = %48
  %53 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #5
  %54 = call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %53, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %55

55:                                               ; preds = %52, %48
  %56 = phi x86_fp80 [ %54, %52 ], [ %0, %48 ]
  %57 = phi i32 [ %12, %52 ], [ %13, %48 ]
  %58 = and i32 %11, 1
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %60, label %62

60:                                               ; preds = %55
  %61 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #5
  br label %62

62:                                               ; preds = %55, %60
  %63 = phi x86_fp80 [ %61, %60 ], [ %56, %55 ]
  %64 = icmp ult i32 %11, 2
  br i1 %64, label %78, label %65

65:                                               ; preds = %62, %75
  %66 = phi i32 [ %69, %75 ], [ %11, %62 ]
  %67 = phi x86_fp80 [ %76, %75 ], [ %63, %62 ]
  %68 = phi x86_fp80 [ %70, %75 ], [ %56, %62 ]
  %69 = lshr i32 %66, 1
  %70 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %68, x86_fp80 %68, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %71 = and i32 %66, 2
  %72 = icmp eq i32 %71, 0
  br i1 %72, label %75, label %73

73:                                               ; preds = %65
  %74 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %67, x86_fp80 %70, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %75

75:                                               ; preds = %73, %65
  %76 = phi x86_fp80 [ %74, %73 ], [ %67, %65 ]
  %77 = icmp ult i32 %66, 4
  br i1 %77, label %78, label %65

78:                                               ; preds = %75, %62
  %79 = phi x86_fp80 [ %63, %62 ], [ %76, %75 ]
  %80 = icmp slt i32 %57, 0
  br i1 %80, label %81, label %84

81:                                               ; preds = %78
  %82 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #5
  %83 = call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %82, x86_fp80 %79, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %84

84:                                               ; preds = %78, %81, %44, %40, %6
  %85 = phi x86_fp80 [ %7, %6 ], [ %41, %40 ], [ %47, %44 ], [ %83, %81 ], [ %79, %78 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #4
  ret x86_fp80 %85
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i32 @llvm.experimental.constrained.fptosi.i32.f80(x86_fp80, metadata) #2

; Function Attrs: optsize
declare x86_fp80 @frexpl(x86_fp80 noundef, i32* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden x86_fp80 @__polevll(x86_fp80 noundef, x86_fp80* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden x86_fp80 @__p1evll(x86_fp80 noundef, x86_fp80* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.sitofp.f80.i64(i64, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i64 @llvm.experimental.constrained.fptosi.i64.f80(x86_fp80, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #2

; Function Attrs: optsize
declare x86_fp80 @scalbnl(x86_fp80 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #7 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"long double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
