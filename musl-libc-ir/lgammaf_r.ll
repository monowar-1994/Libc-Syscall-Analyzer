; ModuleID = 'src/math/lgammaf_r.c'
source_filename = "src/math/lgammaf_r.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@lgammaf_r = weak alias float (float, i32*), float (float, i32*)* @__lgammaf_r

; Function Attrs: nounwind optsize strictfp
define hidden float @__lgammaf_r(float noundef %0, i32* nocapture noundef writeonly %1) #0 {
  store i32 1, i32* %1, align 4, !tbaa !3
  %3 = bitcast float %0 to i32
  %4 = and i32 %3, 2147483647
  %5 = icmp ugt i32 %4, 2139095039
  br i1 %5, label %6, label %8

6:                                                ; preds = %2
  %7 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %215

8:                                                ; preds = %2
  %9 = icmp ult i32 %4, 889192448
  %10 = icmp sgt i32 %3, -1
  br i1 %9, label %11, label %18

11:                                               ; preds = %8
  br i1 %10, label %14, label %12

12:                                               ; preds = %11
  store i32 -1, i32* %1, align 4, !tbaa !3
  %13 = fneg float %0
  br label %14

14:                                               ; preds = %12, %11
  %15 = phi float [ %13, %12 ], [ %0, %11 ]
  %16 = tail call float @logf(float noundef %15) #4
  %17 = fneg float %16
  br label %215

18:                                               ; preds = %8
  br i1 %10, label %63, label %19

19:                                               ; preds = %18
  %20 = fneg float %0
  %21 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %22 = tail call float @llvm.experimental.constrained.fmul.f32(float %20, float 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %23 = tail call float @floorf(float noundef %22) #4
  %24 = fneg float %23
  %25 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %20, float 5.000000e-01, float %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %26 = tail call float @llvm.experimental.constrained.fmul.f32(float %21, float %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %27 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %28 = tail call float @llvm.experimental.constrained.fmul.f32(float %26, float %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %29 = tail call i32 @llvm.experimental.constrained.fptosi.i32.f32(float %28, metadata !"fpexcept.ignore") #5
  %30 = add nsw i32 %29, 1
  %31 = sdiv i32 %30, 2
  %32 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 %31, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %33 = fneg float %32
  %34 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %33, float 5.000000e-01, float %26, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %35 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %34, metadata !"fpexcept.ignore") #5
  %36 = tail call double @llvm.experimental.constrained.fmul.f64(double %35, double 0x400921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  switch i32 %31, label %37 [
    i32 3, label %44
    i32 1, label %39
    i32 2, label %41
  ]

37:                                               ; preds = %19
  %38 = tail call float @__sindf(double noundef %36) #4
  br label %47

39:                                               ; preds = %19
  %40 = tail call float @__cosdf(double noundef %36) #4
  br label %47

41:                                               ; preds = %19
  %42 = fneg double %36
  %43 = tail call float @__sindf(double noundef %42) #4
  br label %47

44:                                               ; preds = %19
  %45 = tail call float @__cosdf(double noundef %36) #4
  %46 = fneg float %45
  br label %47

47:                                               ; preds = %37, %39, %41, %44
  %48 = phi float [ %38, %37 ], [ %43, %41 ], [ %40, %39 ], [ %46, %44 ]
  %49 = tail call i1 @llvm.experimental.constrained.fcmp.f32(float %48, float 0.000000e+00, metadata !"oeq", metadata !"fpexcept.ignore") #3
  br i1 %49, label %50, label %53

50:                                               ; preds = %47
  %51 = tail call float @llvm.experimental.constrained.fsub.f32(float %20, float %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %52 = tail call float @llvm.experimental.constrained.fdiv.f32(float 1.000000e+00, float %51, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %215

53:                                               ; preds = %47
  %54 = tail call i1 @llvm.experimental.constrained.fcmps.f32(float %48, float 0.000000e+00, metadata !"ogt", metadata !"fpexcept.ignore") #3
  br i1 %54, label %55, label %56

55:                                               ; preds = %53
  store i32 -1, i32* %1, align 4, !tbaa !3
  br label %58

56:                                               ; preds = %53
  %57 = fneg float %48
  br label %58

58:                                               ; preds = %56, %55
  %59 = phi float [ %48, %55 ], [ %57, %56 ]
  %60 = tail call float @llvm.experimental.constrained.fmul.f32(float %59, float %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %61 = tail call float @llvm.experimental.constrained.fdiv.f32(float 0x400921FB60000000, float %60, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %62 = tail call float @logf(float noundef %61) #4
  br label %63

63:                                               ; preds = %58, %18
  %64 = phi float [ %62, %58 ], [ undef, %18 ]
  %65 = phi float [ %20, %58 ], [ %0, %18 ]
  switch i32 %3, label %68 [
    i32 -1073741824, label %66
    i32 -1082130432, label %66
    i32 1073741824, label %66
    i32 1065353216, label %66
  ]

66:                                               ; preds = %63, %63, %63, %63
  %67 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %211

68:                                               ; preds = %63
  %69 = icmp ult i32 %4, 1073741824
  br i1 %69, label %70, label %151

70:                                               ; preds = %68
  %71 = icmp ult i32 %4, 1063675495
  br i1 %71, label %72, label %82

72:                                               ; preds = %70
  %73 = tail call float @logf(float noundef %65) #4
  %74 = fneg float %73
  %75 = icmp ugt i32 %4, 1060850207
  br i1 %75, label %76, label %78

76:                                               ; preds = %72
  %77 = tail call float @llvm.experimental.constrained.fsub.f32(float 1.000000e+00, float %65, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %92

78:                                               ; preds = %72
  %79 = icmp ugt i32 %4, 1047343879
  br i1 %79, label %80, label %134

80:                                               ; preds = %78
  %81 = tail call float @llvm.experimental.constrained.fsub.f32(float %65, float 0x3FDD8B6180000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %110

82:                                               ; preds = %70
  %83 = icmp ugt i32 %4, 1071490583
  br i1 %83, label %84, label %86

84:                                               ; preds = %82
  %85 = tail call float @llvm.experimental.constrained.fsub.f32(float 2.000000e+00, float %65, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %92

86:                                               ; preds = %82
  %87 = icmp ugt i32 %4, 1067296287
  br i1 %87, label %88, label %90

88:                                               ; preds = %86
  %89 = tail call float @llvm.experimental.constrained.fsub.f32(float %65, float 0x3FF762D860000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %110

90:                                               ; preds = %86
  %91 = tail call float @llvm.experimental.constrained.fsub.f32(float %65, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %134

92:                                               ; preds = %76, %84
  %93 = phi float [ %85, %84 ], [ %77, %76 ]
  %94 = phi float [ 0.000000e+00, %84 ], [ %74, %76 ]
  %95 = tail call float @llvm.experimental.constrained.fmul.f32(float %93, float %93, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %96 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %95, float 0x3EFA707440000000, float 0x3F2CF2ECE0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %97 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %95, float %96, float 0x3F538A9420000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %98 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %95, float %97, float 0x3F7E404FC0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %99 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %95, float %98, float 0x3FB13E0020000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %100 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %95, float %99, float 0x3FB3C467E0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %101 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %95, float 0x3F07858EA0000000, float 0x3F1C5088A0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %102 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %95, float %101, float 0x3F40B6C680000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %103 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %95, float %102, float 0x3F67ADD8C0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %104 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %95, float %103, float 0x3F951322A0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %105 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %95, float %104, float 0x3FD4A34CC0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %106 = tail call float @llvm.experimental.constrained.fmul.f32(float %95, float %105, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %107 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %93, float %100, float %106, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %108 = tail call float @llvm.experimental.constrained.fmuladd.f32(float -5.000000e-01, float %93, float %107, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %109 = tail call float @llvm.experimental.constrained.fadd.f32(float %94, float %108, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %211

110:                                              ; preds = %80, %88
  %111 = phi float [ %89, %88 ], [ %81, %80 ]
  %112 = phi float [ 0.000000e+00, %88 ], [ %74, %80 ]
  %113 = tail call float @llvm.experimental.constrained.fmul.f32(float %111, float %111, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %114 = tail call float @llvm.experimental.constrained.fmul.f32(float %113, float %111, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %115 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %114, float 0x3F34AF6D60000000, float 0xBF56FE8EC0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %116 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %114, float %115, float 0x3F78FCE0E0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %117 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %114, float %116, float 0xBFA0C9A8E0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %118 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %114, float %117, float 0x3FDEF72BC0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %119 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %114, float 0xBF347F24E0000000, float 0x3F4CDF0CE0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %120 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %114, float %119, float 0xBF6E2EFFC0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %121 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %114, float %120, float 0x3F9266E7A0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %122 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %114, float %121, float 0xBFC2E42780000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %123 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %114, float 0x3F35FD3EE0000000, float 0xBF41A610A0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %124 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %114, float %123, float 0x3F6282D320000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %125 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %114, float %124, float 0xBF851F9FC0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %126 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %114, float %125, float 0x3FB08B42A0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %127 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %111, float %126, float %122, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %128 = fneg float %114
  %129 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %128, float %127, float 0x3E3CC38A40000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %130 = fneg float %129
  %131 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %113, float %118, float %130, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %132 = tail call float @llvm.experimental.constrained.fadd.f32(float 0xBFBF19B9A0000000, float %131, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %133 = tail call float @llvm.experimental.constrained.fadd.f32(float %112, float %132, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %211

134:                                              ; preds = %90, %78
  %135 = phi float [ %91, %90 ], [ %65, %78 ]
  %136 = phi float [ 0.000000e+00, %90 ], [ %74, %78 ]
  %137 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %135, float 0x3F8B678BC0000000, float 0x3FCD4EAF00000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %138 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %135, float %137, float 0x3FEF497640000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %139 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %135, float %138, float 0x3FF7475CE0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %140 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %135, float %139, float 0x3FE4401E80000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %141 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %135, float %140, float 0xBFB3C467E0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %142 = tail call float @llvm.experimental.constrained.fmul.f32(float %135, float %141, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %143 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %135, float 0x3F6A5ABB60000000, float 0x3FBAAE55E0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %144 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %135, float %143, float 0x3FE89DFBE0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %145 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %135, float %144, float 0x40010725A0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %146 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %135, float %145, float 0x4003A5D7C0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %147 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %135, float %146, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %148 = tail call float @llvm.experimental.constrained.fdiv.f32(float %142, float %147, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %149 = tail call float @llvm.experimental.constrained.fmuladd.f32(float -5.000000e-01, float %135, float %148, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %150 = tail call float @llvm.experimental.constrained.fadd.f32(float %136, float %149, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %211

151:                                              ; preds = %68
  %152 = icmp ult i32 %4, 1090519040
  br i1 %152, label %153, label %193

153:                                              ; preds = %151
  %154 = tail call i32 @llvm.experimental.constrained.fptosi.i32.f32(float %65, metadata !"fpexcept.ignore") #3
  %155 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 %154, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %156 = tail call float @llvm.experimental.constrained.fsub.f32(float %65, float %155, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %157 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %156, float 0x3F00BFECE0000000, float 0x3F5E26B680000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %158 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %156, float %157, float 0x3F9B481C80000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %159 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %156, float %158, float 0x3FC2BB9CC0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %160 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %156, float %159, float 0x3FD4D98F40000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %161 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %156, float %160, float 0x3FCB848B40000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %162 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %156, float %161, float 0xBFB3C467E0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %163 = tail call float @llvm.experimental.constrained.fmul.f32(float %156, float %162, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %164 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %156, float 0x3EDEBAF7A0000000, float 0x3F497DDAC0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %165 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %156, float %164, float 0x3F9317EA80000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %166 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %156, float %165, float 0x3FC601EDC0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %167 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %156, float %166, float 0x3FE71A18A0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %168 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %156, float %167, float 0x3FF645A760000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %169 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %156, float %168, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %170 = tail call float @llvm.experimental.constrained.fdiv.f32(float %163, float %169, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %171 = tail call float @llvm.experimental.constrained.fmuladd.f32(float 5.000000e-01, float %156, float %170, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  switch i32 %154, label %211 [
    i32 7, label %172
    i32 6, label %175
    i32 5, label %179
    i32 4, label %183
    i32 3, label %187
  ]

172:                                              ; preds = %153
  %173 = tail call float @llvm.experimental.constrained.fadd.f32(float %156, float 6.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %174 = tail call float @llvm.experimental.constrained.fmul.f32(float 1.000000e+00, float %173, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %175

175:                                              ; preds = %153, %172
  %176 = phi float [ 1.000000e+00, %153 ], [ %174, %172 ]
  %177 = tail call float @llvm.experimental.constrained.fadd.f32(float %156, float 5.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %178 = tail call float @llvm.experimental.constrained.fmul.f32(float %176, float %177, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %179

179:                                              ; preds = %153, %175
  %180 = phi float [ 1.000000e+00, %153 ], [ %178, %175 ]
  %181 = tail call float @llvm.experimental.constrained.fadd.f32(float %156, float 4.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %182 = tail call float @llvm.experimental.constrained.fmul.f32(float %180, float %181, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %183

183:                                              ; preds = %153, %179
  %184 = phi float [ 1.000000e+00, %153 ], [ %182, %179 ]
  %185 = tail call float @llvm.experimental.constrained.fadd.f32(float %156, float 3.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %186 = tail call float @llvm.experimental.constrained.fmul.f32(float %184, float %185, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %187

187:                                              ; preds = %153, %183
  %188 = phi float [ 1.000000e+00, %153 ], [ %186, %183 ]
  %189 = tail call float @llvm.experimental.constrained.fadd.f32(float %156, float 2.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %190 = tail call float @llvm.experimental.constrained.fmul.f32(float %188, float %189, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %191 = tail call float @logf(float noundef %190) #4
  %192 = tail call float @llvm.experimental.constrained.fadd.f32(float %171, float %191, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %211

193:                                              ; preds = %151
  %194 = icmp ult i32 %4, 1551892480
  %195 = tail call float @logf(float noundef %65) #4
  br i1 %194, label %196, label %208

196:                                              ; preds = %193
  %197 = tail call float @llvm.experimental.constrained.fdiv.f32(float 1.000000e+00, float %65, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %198 = tail call float @llvm.experimental.constrained.fmul.f32(float %197, float %197, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %199 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %198, float 0xBF5AB89D00000000, float 0x3F4B67BA40000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %200 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %198, float %199, float 0xBF4380CB80000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %201 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %198, float %200, float 0x3F4A019FA0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %202 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %198, float %201, float 0xBF66C16C20000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %203 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %198, float %202, float 0x3FB5555560000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %204 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %197, float %203, float 0x3FDACFE3A0000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %205 = tail call float @llvm.experimental.constrained.fsub.f32(float %65, float 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %206 = tail call float @llvm.experimental.constrained.fsub.f32(float %195, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %207 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %205, float %206, float %204, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %211

208:                                              ; preds = %193
  %209 = tail call float @llvm.experimental.constrained.fsub.f32(float %195, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %210 = tail call float @llvm.experimental.constrained.fmul.f32(float %65, float %209, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %211

211:                                              ; preds = %134, %110, %92, %196, %208, %187, %153, %66
  %212 = phi float [ %67, %66 ], [ %150, %134 ], [ %133, %110 ], [ %109, %92 ], [ %171, %153 ], [ %192, %187 ], [ %207, %196 ], [ %210, %208 ]
  br i1 %10, label %215, label %213

213:                                              ; preds = %211
  %214 = tail call float @llvm.experimental.constrained.fsub.f32(float %64, float %212, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %215

215:                                              ; preds = %211, %213, %50, %14, %6
  %216 = phi float [ %7, %6 ], [ %17, %14 ], [ %52, %50 ], [ %214, %213 ], [ %212, %211 ]
  ret float %216
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #1

; Function Attrs: optsize
declare float @logf(float noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmuladd.f32(float, float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i32 @llvm.experimental.constrained.fptosi.i32.f32(float, metadata) #1

; Function Attrs: optsize
declare float @floorf(float noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: optsize
declare hidden float @__sindf(double noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden float @__cosdf(double noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
