; ModuleID = 'src/math/lgammal.c'
source_filename = "src/math/lgammal.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__signgam = external global i32, align 4

@lgammal_r = weak alias x86_fp80 (x86_fp80, i32*), x86_fp80 (x86_fp80, i32*)* @__lgammal_r

; Function Attrs: nounwind optsize strictfp
define x86_fp80 @__lgammal_r(x86_fp80 noundef %0, i32* nocapture noundef writeonly %1) #0 {
  %3 = bitcast x86_fp80 %0 to i80
  %4 = lshr i80 %3, 64
  %5 = trunc i80 %4 to i32
  %6 = shl nuw i32 %5, 16
  %7 = and i32 %6, 2147418112
  %8 = trunc i80 %3 to i64
  %9 = lshr i64 %8, 48
  %10 = trunc i64 %9 to i32
  %11 = or i32 %7, %10
  store i32 1, i32* %1, align 4, !tbaa !3
  %12 = icmp ugt i32 %11, 2147418111
  br i1 %12, label %13, label %15

13:                                               ; preds = %2
  %14 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %0, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %249

15:                                               ; preds = %2
  %16 = icmp ult i32 %11, 1069580288
  %17 = icmp ult i32 %5, 32768
  br i1 %16, label %18, label %25

18:                                               ; preds = %15
  br i1 %17, label %21, label %19

19:                                               ; preds = %18
  store i32 -1, i32* %1, align 4, !tbaa !3
  %20 = fneg x86_fp80 %0
  br label %21

21:                                               ; preds = %19, %18
  %22 = phi x86_fp80 [ %20, %19 ], [ %0, %18 ]
  %23 = tail call x86_fp80 @logl(x86_fp80 noundef %22) #4
  %24 = fneg x86_fp80 %23
  br label %249

25:                                               ; preds = %15
  br i1 %17, label %77, label %26

26:                                               ; preds = %25
  %27 = fneg x86_fp80 %0
  %28 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #5
  %29 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %27, x86_fp80 %28, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %30 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 2.000000e+00, metadata !"fpexcept.ignore") #5
  %31 = tail call x86_fp80 @floorl(x86_fp80 noundef %29) #4
  %32 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %29, x86_fp80 %31, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %33 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %30, x86_fp80 %32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %34 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 4.000000e+00, metadata !"fpexcept.ignore") #5
  %35 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %33, x86_fp80 %34, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %36 = tail call i32 @llvm.experimental.constrained.fptosi.i32.f80(x86_fp80 %35, metadata !"fpexcept.ignore") #5
  %37 = add nsw i32 %36, 1
  %38 = sdiv i32 %37, 2
  %39 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 %38, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %40 = tail call float @llvm.experimental.constrained.fmul.f32(float %39, float 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %41 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float %40, metadata !"fpexcept.ignore") #5
  %42 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %33, x86_fp80 %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %43 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %42, x86_fp80 0xK4000C90FDAA22168C235, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  switch i32 %38, label %44 [
    i32 3, label %54
    i32 1, label %47
    i32 2, label %50
  ]

44:                                               ; preds = %26
  %45 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #5
  %46 = tail call x86_fp80 @__sinl(x86_fp80 noundef %43, x86_fp80 noundef %45, i32 noundef 0) #4
  br label %58

47:                                               ; preds = %26
  %48 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #5
  %49 = tail call x86_fp80 @__cosl(x86_fp80 noundef %43, x86_fp80 noundef %48) #4
  br label %58

50:                                               ; preds = %26
  %51 = fneg x86_fp80 %43
  %52 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #5
  %53 = tail call x86_fp80 @__sinl(x86_fp80 noundef %51, x86_fp80 noundef %52, i32 noundef 0) #4
  br label %58

54:                                               ; preds = %26
  %55 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #5
  %56 = tail call x86_fp80 @__cosl(x86_fp80 noundef %43, x86_fp80 noundef %55) #4
  %57 = fneg x86_fp80 %56
  br label %58

58:                                               ; preds = %44, %47, %50, %54
  %59 = phi x86_fp80 [ %46, %44 ], [ %53, %50 ], [ %49, %47 ], [ %57, %54 ]
  %60 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #3
  %61 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %59, x86_fp80 %60, metadata !"oeq", metadata !"fpexcept.ignore") #3
  br i1 %61, label %62, label %66

62:                                               ; preds = %58
  %63 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #3
  %64 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %27, x86_fp80 %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %65 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %63, x86_fp80 %64, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %249

66:                                               ; preds = %58
  %67 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #3
  %68 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %59, x86_fp80 %67, metadata !"ogt", metadata !"fpexcept.ignore") #3
  br i1 %68, label %69, label %70

69:                                               ; preds = %66
  store i32 -1, i32* %1, align 4, !tbaa !3
  br label %72

70:                                               ; preds = %66
  %71 = fneg x86_fp80 %59
  br label %72

72:                                               ; preds = %70, %69
  %73 = phi x86_fp80 [ %59, %69 ], [ %71, %70 ]
  %74 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %73, x86_fp80 %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %75 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 0xK4000C90FDAA22168C235, x86_fp80 %74, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %76 = tail call x86_fp80 @logl(x86_fp80 noundef %75) #4
  br label %77

77:                                               ; preds = %72, %25
  %78 = phi x86_fp80 [ %76, %72 ], [ undef, %25 ]
  %79 = phi x86_fp80 [ %27, %72 ], [ %0, %25 ]
  %80 = icmp eq i32 %11, 1073709056
  %81 = icmp eq i32 %11, 1073774592
  %82 = or i1 %80, %81
  %83 = icmp eq i64 %8, 0
  %84 = and i1 %83, %82
  br i1 %84, label %85, label %87

85:                                               ; preds = %77
  %86 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %245

87:                                               ; preds = %77
  %88 = icmp ult i32 %11, 1073774592
  br i1 %88, label %89, label %172

89:                                               ; preds = %87
  %90 = icmp ult i32 %11, 1073669735
  br i1 %90, label %91, label %102

91:                                               ; preds = %89
  %92 = tail call x86_fp80 @logl(x86_fp80 noundef %79) #4
  %93 = fneg x86_fp80 %92
  %94 = icmp ugt i32 %11, 1073658697
  br i1 %94, label %95, label %97

95:                                               ; preds = %91
  %96 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #3
  br label %112

97:                                               ; preds = %91
  %98 = icmp ugt i32 %11, 1073540402
  br i1 %98, label %99, label %152

99:                                               ; preds = %97
  %100 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #3
  %101 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 0xK3FFFBB16C31AB5F1FB71, x86_fp80 %100, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %131

102:                                              ; preds = %89
  %103 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #3
  %104 = icmp ugt i32 %11, 1073733029
  br i1 %104, label %105, label %107

105:                                              ; preds = %102
  %106 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 2.000000e+00, metadata !"fpexcept.ignore") #3
  br label %112

107:                                              ; preds = %102
  %108 = icmp ugt i32 %11, 1073716645
  br i1 %108, label %131, label %109

109:                                              ; preds = %107
  %110 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #3
  %111 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %79, x86_fp80 %110, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %152

112:                                              ; preds = %95, %105
  %113 = phi x86_fp80 [ %96, %95 ], [ %106, %105 ]
  %114 = phi x86_fp80 [ %93, %95 ], [ %103, %105 ]
  %115 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %79, x86_fp80 %113, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %116 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %115, x86_fp80 0xK4000F115D0E13AEA5AAC, x86_fp80 0xK4005E31280572629A7F8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %117 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %115, x86_fp80 %116, x86_fp80 0xK4008DC1ACEEC4B3BA538, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %118 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %115, x86_fp80 %117, x86_fp80 0xK400A964BBAC9559EAC31, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %119 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %115, x86_fp80 %118, x86_fp80 0xK4009E811ED79A7063DDF, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %120 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %115, x86_fp80 %119, x86_fp80 0xKC0089E94C7302246C2A8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %121 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 0xK4004F1B2AA9F4861B5CB, x86_fp80 %115, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %122 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %115, x86_fp80 %121, x86_fp80 0xK4008D4ACA5204E78D8C0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %123 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %115, x86_fp80 %122, x86_fp80 0xK400B8E4AB3272A55A21D, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %124 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %115, x86_fp80 %123, x86_fp80 0xK400CA05DBD87D12E640B, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %125 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %115, x86_fp80 %124, x86_fp80 0xK400C805BE51545C76426, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %126 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #3
  %127 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %115, x86_fp80 %120, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %128 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %127, x86_fp80 %125, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %129 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %126, x86_fp80 %115, x86_fp80 %128, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %130 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %114, x86_fp80 %129, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %245

131:                                              ; preds = %107, %99
  %132 = phi x86_fp80 [ %101, %99 ], [ 0xK3FFFBB16C31AB5F1FB71, %107 ]
  %133 = phi x86_fp80 [ %93, %99 ], [ %103, %107 ]
  %134 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %79, x86_fp80 %132, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %135 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %134, x86_fp80 0xK40018ABC66E1056EBB97, x86_fp80 0xK40069A2C6D7DA4A7143C, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %136 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %134, x86_fp80 %135, x86_fp80 0xK4009B5EDAD4A2B6AF60D, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %137 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %134, x86_fp80 %136, x86_fp80 0xK400BAAC17DCD67444A43, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %138 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %134, x86_fp80 %137, x86_fp80 0xK400C89F26A0FC9F11345, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %139 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %134, x86_fp80 %138, x86_fp80 0xK400BA0353CB55C121785, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %140 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %134, x86_fp80 %139, x86_fp80 0xK3FC5867F0E7C29340760, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %141 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 0xK400580D986849A094970, x86_fp80 %134, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %142 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %134, x86_fp80 %141, x86_fp80 0xK4008F41B2AA4D08C27AA, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %143 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %134, x86_fp80 %142, x86_fp80 0xK400BB7682D0BD0041DB4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %144 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %134, x86_fp80 %143, x86_fp80 0xK400D805C4B9F648BE3D4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %145 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %134, x86_fp80 %144, x86_fp80 0xK400DA7CE6EDDA9979471, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %146 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %134, x86_fp80 %145, x86_fp80 0xK400CA58F65AF2D6352AF, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %147 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %134, x86_fp80 %140, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %148 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %147, x86_fp80 %146, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %149 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 0xK3FC4F84AE446AD360AC8, x86_fp80 %148, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %150 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 0xKBFFBF8CDCDE61C521000, x86_fp80 %149, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %151 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %133, x86_fp80 %150, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %245

152:                                              ; preds = %109, %97
  %153 = phi x86_fp80 [ %103, %109 ], [ %93, %97 ]
  %154 = phi x86_fp80 [ %111, %109 ], [ %79, %97 ]
  %155 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %154, x86_fp80 0xK40018F80321770681672, x86_fp80 0xK4005E2738851DB576BEE, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %156 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %154, x86_fp80 %155, x86_fp80 0xK4008BA2D37BF660E26EB, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %157 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %154, x86_fp80 %156, x86_fp80 0xK4009EEF72A378D76FD0C, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %158 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %154, x86_fp80 %157, x86_fp80 0xK4009FF54090C5581BF2A, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %159 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %154, x86_fp80 %158, x86_fp80 0xK4008AB00B4302BB3CBF1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %160 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %154, x86_fp80 %159, x86_fp80 0xKC005B1B96F0070C4A41B, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %161 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %154, x86_fp80 %160, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %162 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 0xK4004B45C0DD3D2AA7F6A, x86_fp80 %154, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %163 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %154, x86_fp80 %162, x86_fp80 0xK4007ED116565A2F267A3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %164 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %154, x86_fp80 %163, x86_fp80 0xK4009F5CE67685BED2E20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %165 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %154, x86_fp80 %164, x86_fp80 0xK400AECAA1B7760BA7C84, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %166 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %154, x86_fp80 %165, x86_fp80 0xK400AD47B13801C9ABE6B, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %167 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %154, x86_fp80 %166, x86_fp80 0xK40098FDA96EE56155B39, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %168 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double -5.000000e-01, metadata !"fpexcept.ignore") #3
  %169 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %161, x86_fp80 %167, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %170 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %168, x86_fp80 %154, x86_fp80 %169, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %171 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %153, x86_fp80 %170, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %245

172:                                              ; preds = %87
  %173 = icmp ult i32 %11, 1073905664
  br i1 %173, label %174, label %223

174:                                              ; preds = %172
  %175 = tail call i32 @llvm.experimental.constrained.fptosi.i32.f80(x86_fp80 %79, metadata !"fpexcept.ignore") #3
  %176 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %175, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %177 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %176, metadata !"fpexcept.ignore") #3
  %178 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %79, x86_fp80 %177, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %179 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %178, x86_fp80 0xKC009D29DA60F5DFA05EF, x86_fp80 0xKC00EF4AA443706E810E3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %180 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %178, x86_fp80 %179, x86_fp80 0xKC012AD371282903EB2E4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %181 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %178, x86_fp80 %180, x86_fp80 0xKC014CA943F86A403F6BE, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %182 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %178, x86_fp80 %181, x86_fp80 0xKC015C89C01657BB2F73A, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %183 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %178, x86_fp80 %182, x86_fp80 0xKC014EE1FD18F72CBB4CD, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %184 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %178, x86_fp80 %183, x86_fp80 0xK4013B194321B770C93B4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %185 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %178, x86_fp80 %184, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %186 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 0xKC007E1198B5AF4A1810D, x86_fp80 %178, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %187 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %178, x86_fp80 %186, x86_fp80 0xKC00DEC8AB16E428C6E2C, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %188 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %178, x86_fp80 %187, x86_fp80 0xKC01287D5CC4AA7C1EF90, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %189 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %178, x86_fp80 %188, x86_fp80 0xKC015838BFC9A902FB887, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %190 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %178, x86_fp80 %189, x86_fp80 0xKC016F42D96F3D84BACAE, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %191 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %178, x86_fp80 %190, x86_fp80 0xKC017D6C87E69FFDB436A, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %192 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %178, x86_fp80 %191, x86_fp80 0xKC0178FBC72CDBD6AA4C7, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %193 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #3
  %194 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %185, x86_fp80 %192, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %195 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %193, x86_fp80 %178, x86_fp80 %194, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %196 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #3
  switch i32 %175, label %245 [
    i32 7, label %197
    i32 6, label %201
    i32 5, label %206
    i32 4, label %211
    i32 3, label %216
  ]

197:                                              ; preds = %174
  %198 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 6.000000e+00, metadata !"fpexcept.ignore") #3
  %199 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %178, x86_fp80 %198, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %200 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %196, x86_fp80 %199, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %201

201:                                              ; preds = %174, %197
  %202 = phi x86_fp80 [ %196, %174 ], [ %200, %197 ]
  %203 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e+00, metadata !"fpexcept.ignore") #3
  %204 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %178, x86_fp80 %203, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %205 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %202, x86_fp80 %204, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %206

206:                                              ; preds = %174, %201
  %207 = phi x86_fp80 [ %196, %174 ], [ %205, %201 ]
  %208 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 4.000000e+00, metadata !"fpexcept.ignore") #3
  %209 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %178, x86_fp80 %208, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %210 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %207, x86_fp80 %209, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %211

211:                                              ; preds = %174, %206
  %212 = phi x86_fp80 [ %196, %174 ], [ %210, %206 ]
  %213 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 3.000000e+00, metadata !"fpexcept.ignore") #3
  %214 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %178, x86_fp80 %213, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %215 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %212, x86_fp80 %214, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %216

216:                                              ; preds = %174, %211
  %217 = phi x86_fp80 [ %196, %174 ], [ %215, %211 ]
  %218 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 2.000000e+00, metadata !"fpexcept.ignore") #3
  %219 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %178, x86_fp80 %218, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %220 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %217, x86_fp80 %219, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %221 = tail call x86_fp80 @logl(x86_fp80 noundef %220) #4
  %222 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %195, x86_fp80 %221, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %245

223:                                              ; preds = %172
  %224 = icmp ult i32 %11, 1078034432
  %225 = tail call x86_fp80 @logl(x86_fp80 noundef %79) #4
  %226 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #3
  br i1 %224, label %227, label %242

227:                                              ; preds = %223
  %228 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %226, x86_fp80 %79, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %229 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %228, x86_fp80 %228, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %230 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %229, x86_fp80 0xK3FF7A01291C2CC08D984, x86_fp80 0xKBFF5F6853DA103043D91, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %231 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %229, x86_fp80 %230, x86_fp80 0xK3FF4DC88D492AAD13BDC, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %232 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %229, x86_fp80 %231, x86_fp80 0xKBFF49C09844E9FCE8B20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %233 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %229, x86_fp80 %232, x86_fp80 0xK3FF4D00D009230E5F8F2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %234 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %229, x86_fp80 %233, x86_fp80 0xKBFF6B60B60B603A84D88, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %235 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %229, x86_fp80 %234, x86_fp80 0xK3FFBAAAAAAAAAAAA9FCC, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %236 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %228, x86_fp80 %235, x86_fp80 0xK3FFDD67F1C864BEB4A69, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %237 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #3
  %238 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %79, x86_fp80 %237, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %239 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #3
  %240 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %225, x86_fp80 %239, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %241 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %238, x86_fp80 %240, x86_fp80 %236, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %245

242:                                              ; preds = %223
  %243 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %225, x86_fp80 %226, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %244 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %79, x86_fp80 %243, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %245

245:                                              ; preds = %152, %131, %112, %227, %242, %216, %174, %85
  %246 = phi x86_fp80 [ %86, %85 ], [ %171, %152 ], [ %151, %131 ], [ %130, %112 ], [ %195, %174 ], [ %222, %216 ], [ %241, %227 ], [ %244, %242 ]
  br i1 %17, label %249, label %247

247:                                              ; preds = %245
  %248 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %78, x86_fp80 %246, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %249

249:                                              ; preds = %245, %247, %62, %21, %13
  %250 = phi x86_fp80 [ %14, %13 ], [ %24, %21 ], [ %65, %62 ], [ %248, %247 ], [ %246, %245 ]
  ret x86_fp80 %250
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: optsize
declare x86_fp80 @logl(x86_fp80 noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i32 @llvm.experimental.constrained.fptosi.i32.f80(x86_fp80, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #1

; Function Attrs: nounwind optsize strictfp
define x86_fp80 @lgammal(x86_fp80 noundef %0) local_unnamed_addr #0 {
  %2 = tail call x86_fp80 @__lgammal_r(x86_fp80 noundef %0, i32* noundef nonnull @__signgam) #6
  ret x86_fp80 %2
}

; Function Attrs: optsize
declare x86_fp80 @floorl(x86_fp80 noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float, metadata) #1

; Function Attrs: optsize
declare hidden x86_fp80 @__sinl(x86_fp80 noundef, x86_fp80 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden x86_fp80 @__cosl(x86_fp80 noundef, x86_fp80 noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nounwind strictfp }
attributes #6 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
