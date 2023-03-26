; ModuleID = 'src/math/lgamma_r.c'
source_filename = "src/math/lgamma_r.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@lgamma_r = weak alias double (double, i32*), double (double, i32*)* @__lgamma_r

; Function Attrs: nounwind optsize strictfp
define hidden double @__lgamma_r(double noundef %0, i32* nocapture noundef writeonly %1) #0 {
  store i32 1, i32* %1, align 4, !tbaa !3
  %3 = bitcast double %0 to i64
  %4 = lshr i64 %3, 32
  %5 = trunc i64 %4 to i32
  %6 = and i32 %5, 2147483647
  %7 = icmp ugt i32 %6, 2146435071
  br i1 %7, label %8, label %10

8:                                                ; preds = %2
  %9 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %221

10:                                               ; preds = %2
  %11 = icmp ult i32 %6, 999292928
  %12 = icmp sgt i64 %3, -1
  br i1 %11, label %13, label %20

13:                                               ; preds = %10
  br i1 %12, label %16, label %14

14:                                               ; preds = %13
  %15 = fneg double %0
  store i32 -1, i32* %1, align 4, !tbaa !3
  br label %16

16:                                               ; preds = %14, %13
  %17 = phi double [ %15, %14 ], [ %0, %13 ]
  %18 = tail call double @log(double noundef %17) #4
  %19 = fneg double %18
  br label %221

20:                                               ; preds = %10
  br i1 %12, label %63, label %21

21:                                               ; preds = %20
  %22 = fneg double %0
  %23 = tail call double @llvm.experimental.constrained.fmul.f64(double %22, double 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %24 = tail call double @floor(double noundef %23) #4
  %25 = fneg double %24
  %26 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %22, double 5.000000e-01, double %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %27 = tail call double @llvm.experimental.constrained.fmul.f64(double 2.000000e+00, double %26, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %28 = tail call double @llvm.experimental.constrained.fmul.f64(double %27, double 4.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %29 = tail call i32 @llvm.experimental.constrained.fptosi.i32.f64(double %28, metadata !"fpexcept.ignore") #5
  %30 = add nsw i32 %29, 1
  %31 = sdiv i32 %30, 2
  %32 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 %31, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %33 = tail call float @llvm.experimental.constrained.fmul.f32(float %32, float 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %34 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %33, metadata !"fpexcept.ignore") #5
  %35 = tail call double @llvm.experimental.constrained.fsub.f64(double %27, double %34, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %36 = tail call double @llvm.experimental.constrained.fmul.f64(double %35, double 0x400921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  switch i32 %31, label %37 [
    i32 3, label %44
    i32 1, label %39
    i32 2, label %41
  ]

37:                                               ; preds = %21
  %38 = tail call double @__sin(double noundef %36, double noundef 0.000000e+00, i32 noundef 0) #4
  br label %47

39:                                               ; preds = %21
  %40 = tail call double @__cos(double noundef %36, double noundef 0.000000e+00) #4
  br label %47

41:                                               ; preds = %21
  %42 = fneg double %36
  %43 = tail call double @__sin(double noundef %42, double noundef 0.000000e+00, i32 noundef 0) #4
  br label %47

44:                                               ; preds = %21
  %45 = tail call double @__cos(double noundef %36, double noundef 0.000000e+00) #4
  %46 = fneg double %45
  br label %47

47:                                               ; preds = %37, %39, %41, %44
  %48 = phi double [ %38, %37 ], [ %43, %41 ], [ %40, %39 ], [ %46, %44 ]
  %49 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %48, double 0.000000e+00, metadata !"oeq", metadata !"fpexcept.ignore") #3
  br i1 %49, label %50, label %53

50:                                               ; preds = %47
  %51 = tail call double @llvm.experimental.constrained.fsub.f64(double %22, double %22, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %52 = tail call double @llvm.experimental.constrained.fdiv.f64(double 1.000000e+00, double %51, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %221

53:                                               ; preds = %47
  %54 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %48, double 0.000000e+00, metadata !"ogt", metadata !"fpexcept.ignore") #3
  br i1 %54, label %55, label %56

55:                                               ; preds = %53
  store i32 -1, i32* %1, align 4, !tbaa !3
  br label %58

56:                                               ; preds = %53
  %57 = fneg double %48
  br label %58

58:                                               ; preds = %56, %55
  %59 = phi double [ %48, %55 ], [ %57, %56 ]
  %60 = tail call double @llvm.experimental.constrained.fmul.f64(double %59, double %22, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %61 = tail call double @llvm.experimental.constrained.fdiv.f64(double 0x400921FB54442D18, double %60, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %62 = tail call double @log(double noundef %61) #4
  br label %63

63:                                               ; preds = %58, %20
  %64 = phi double [ %62, %58 ], [ undef, %20 ]
  %65 = phi double [ %22, %58 ], [ %0, %20 ]
  %66 = icmp eq i32 %6, 1072693248
  %67 = icmp eq i32 %6, 1073741824
  %68 = or i1 %66, %67
  %69 = trunc i64 %3 to i32
  %70 = icmp eq i32 %69, 0
  %71 = and i1 %70, %68
  br i1 %71, label %72, label %74

72:                                               ; preds = %63
  %73 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %217

74:                                               ; preds = %63
  %75 = icmp ult i32 %6, 1073741824
  br i1 %75, label %76, label %157

76:                                               ; preds = %74
  %77 = icmp ult i32 %6, 1072483533
  br i1 %77, label %78, label %88

78:                                               ; preds = %76
  %79 = tail call double @log(double noundef %65) #4
  %80 = fneg double %79
  %81 = icmp ugt i32 %6, 1072130371
  br i1 %81, label %82, label %84

82:                                               ; preds = %78
  %83 = tail call double @llvm.experimental.constrained.fsub.f64(double 1.000000e+00, double %65, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %98

84:                                               ; preds = %78
  %85 = icmp ugt i32 %6, 1070442080
  br i1 %85, label %86, label %140

86:                                               ; preds = %84
  %87 = tail call double @llvm.experimental.constrained.fsub.f64(double %65, double 0x3FDD8B618D5AF8FC, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %116

88:                                               ; preds = %76
  %89 = icmp ugt i32 %6, 1073460418
  br i1 %89, label %90, label %92

90:                                               ; preds = %88
  %91 = tail call double @llvm.experimental.constrained.fsub.f64(double 2.000000e+00, double %65, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %98

92:                                               ; preds = %88
  %93 = icmp ugt i32 %6, 1072936131
  br i1 %93, label %94, label %96

94:                                               ; preds = %92
  %95 = tail call double @llvm.experimental.constrained.fsub.f64(double %65, double 0x3FF762D86356BE3F, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %116

96:                                               ; preds = %92
  %97 = tail call double @llvm.experimental.constrained.fsub.f64(double %65, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %140

98:                                               ; preds = %82, %90
  %99 = phi double [ %91, %90 ], [ %83, %82 ]
  %100 = phi double [ 0.000000e+00, %90 ], [ %80, %82 ]
  %101 = tail call double @llvm.experimental.constrained.fmul.f64(double %99, double %99, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %102 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %101, double 0x3EFA7074428CFA52, double 0x3F2CF2ECED10E54D, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %103 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %101, double %102, double 0x3F538A94116F3F5D, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %104 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %101, double %103, double 0x3F7E404FB68FEFE8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %105 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %101, double %104, double 0x3FB13E001A5562A7, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %106 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %101, double %105, double 0x3FB3C467E37DB0C8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %107 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %101, double 0x3F07858E90A45837, double 0x3F1C5088987DFB07, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %108 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %101, double %107, double 0x3F40B6C689B99C00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %109 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %101, double %108, double 0x3F67ADD8CCB7926B, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %110 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %101, double %109, double 0x3F951322AC92547B, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %111 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %101, double %110, double 0x3FD4A34CC4A60FAD, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %112 = tail call double @llvm.experimental.constrained.fmul.f64(double %101, double %111, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %113 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %99, double %106, double %112, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %114 = tail call double @llvm.experimental.constrained.fmuladd.f64(double -5.000000e-01, double %99, double %113, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %115 = tail call double @llvm.experimental.constrained.fadd.f64(double %100, double %114, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %217

116:                                              ; preds = %86, %94
  %117 = phi double [ %95, %94 ], [ %87, %86 ]
  %118 = phi double [ 0.000000e+00, %94 ], [ %80, %86 ]
  %119 = tail call double @llvm.experimental.constrained.fmul.f64(double %117, double %117, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %120 = tail call double @llvm.experimental.constrained.fmul.f64(double %119, double %117, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %121 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %120, double 0x3F34AF6D6C0EBBF7, double 0xBF56FE8EBF2D1AF1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %122 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %120, double %121, double 0x3F78FCE0E370E344, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %123 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %120, double %122, double 0xBFA0C9A8DF35B713, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %124 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %120, double %123, double 0x3FDEF72BC8EE38A2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %125 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %120, double 0xBF347F24ECC38C38, double 0x3F4CDF0CEF61A8E9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %126 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %120, double %125, double 0xBF6E2EFFB3E914D7, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %127 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %120, double %126, double 0x3F9266E7970AF9EC, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %128 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %120, double %127, double 0xBFC2E4278DC6C509, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %129 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %120, double 0x3F35FD3EE8C2D3F4, double 0xBF41A6109C73E0EC, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %130 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %120, double %129, double 0x3F6282D32E15C915, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %131 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %120, double %130, double 0xBF851F9FBA91EC6A, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %132 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %120, double %131, double 0x3FB08B4294D5419B, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %133 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %117, double %132, double %128, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %134 = fneg double %120
  %135 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %134, double %133, double 0xBC50C7CAA48A971F, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %136 = fneg double %135
  %137 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %119, double %124, double %136, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %138 = tail call double @llvm.experimental.constrained.fadd.f64(double 0xBFBF19B9BCC38A42, double %137, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %139 = tail call double @llvm.experimental.constrained.fadd.f64(double %118, double %138, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %217

140:                                              ; preds = %96, %84
  %141 = phi double [ %97, %96 ], [ %65, %84 ]
  %142 = phi double [ 0.000000e+00, %96 ], [ %80, %84 ]
  %143 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %141, double 0x3F8B678BBF2BAB09, double 0x3FCD4EAEF6010924, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %144 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %141, double %143, double 0x3FEF497644EA8450, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %145 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %141, double %144, double 0x3FF7475CD119BD6F, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %146 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %141, double %145, double 0x3FE4401E8B005DFF, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %147 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %141, double %146, double 0xBFB3C467E37DB0C8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %148 = tail call double @llvm.experimental.constrained.fmul.f64(double %141, double %147, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %149 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %141, double 0x3F6A5ABB57D0CF61, double 0x3FBAAE55D6537C88, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %150 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %141, double %149, double 0x3FE89DFBE45050AF, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %151 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %141, double %150, double 0x40010725A42B18F5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %152 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %141, double %151, double 0x4003A5D7C2BD619C, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %153 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %141, double %152, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %154 = tail call double @llvm.experimental.constrained.fdiv.f64(double %148, double %153, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %155 = tail call double @llvm.experimental.constrained.fmuladd.f64(double -5.000000e-01, double %141, double %154, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %156 = tail call double @llvm.experimental.constrained.fadd.f64(double %142, double %155, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %217

157:                                              ; preds = %74
  %158 = icmp ult i32 %6, 1075838976
  br i1 %158, label %159, label %199

159:                                              ; preds = %157
  %160 = tail call i32 @llvm.experimental.constrained.fptosi.i32.f64(double %65, metadata !"fpexcept.ignore") #3
  %161 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %160, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %162 = tail call double @llvm.experimental.constrained.fsub.f64(double %65, double %161, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %163 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %162, double 0x3F00BFECDD17E945, double 0x3F5E26B67368F239, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %164 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %162, double %163, double 0x3F9B481C7E939961, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %165 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %162, double %164, double 0x3FC2BB9CBEE5F2F7, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %166 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %162, double %165, double 0x3FD4D98F4F139F59, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %167 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %162, double %166, double 0x3FCB848B36E20878, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %168 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %162, double %167, double 0xBFB3C467E37DB0C8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %169 = tail call double @llvm.experimental.constrained.fmul.f64(double %162, double %168, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %170 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %162, double 0x3EDEBAF7A5B38140, double 0x3F497DDACA41A95B, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %171 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %162, double %170, double 0x3F9317EA742ED475, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %172 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %162, double %171, double 0x3FC601EDCCFBDF27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %173 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %162, double %172, double 0x3FE71A1893D3DCDC, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %174 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %162, double %173, double 0x3FF645A762C4AB74, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %175 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %162, double %174, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %176 = tail call double @llvm.experimental.constrained.fdiv.f64(double %169, double %175, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %177 = tail call double @llvm.experimental.constrained.fmuladd.f64(double 5.000000e-01, double %162, double %176, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  switch i32 %160, label %217 [
    i32 7, label %178
    i32 6, label %181
    i32 5, label %185
    i32 4, label %189
    i32 3, label %193
  ]

178:                                              ; preds = %159
  %179 = tail call double @llvm.experimental.constrained.fadd.f64(double %162, double 6.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %180 = tail call double @llvm.experimental.constrained.fmul.f64(double 1.000000e+00, double %179, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %181

181:                                              ; preds = %159, %178
  %182 = phi double [ 1.000000e+00, %159 ], [ %180, %178 ]
  %183 = tail call double @llvm.experimental.constrained.fadd.f64(double %162, double 5.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %184 = tail call double @llvm.experimental.constrained.fmul.f64(double %182, double %183, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %185

185:                                              ; preds = %159, %181
  %186 = phi double [ 1.000000e+00, %159 ], [ %184, %181 ]
  %187 = tail call double @llvm.experimental.constrained.fadd.f64(double %162, double 4.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %188 = tail call double @llvm.experimental.constrained.fmul.f64(double %186, double %187, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %189

189:                                              ; preds = %159, %185
  %190 = phi double [ 1.000000e+00, %159 ], [ %188, %185 ]
  %191 = tail call double @llvm.experimental.constrained.fadd.f64(double %162, double 3.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %192 = tail call double @llvm.experimental.constrained.fmul.f64(double %190, double %191, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %193

193:                                              ; preds = %159, %189
  %194 = phi double [ 1.000000e+00, %159 ], [ %192, %189 ]
  %195 = tail call double @llvm.experimental.constrained.fadd.f64(double %162, double 2.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %196 = tail call double @llvm.experimental.constrained.fmul.f64(double %194, double %195, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %197 = tail call double @log(double noundef %196) #4
  %198 = tail call double @llvm.experimental.constrained.fadd.f64(double %177, double %197, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %217

199:                                              ; preds = %157
  %200 = icmp ult i32 %6, 1133510656
  %201 = tail call double @log(double noundef %65) #4
  br i1 %200, label %202, label %214

202:                                              ; preds = %199
  %203 = tail call double @llvm.experimental.constrained.fdiv.f64(double 1.000000e+00, double %65, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %204 = tail call double @llvm.experimental.constrained.fmul.f64(double %203, double %203, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %205 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %204, double 0xBF5AB89D0B9E43E4, double 0x3F4B67BA4CDAD5D1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %206 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %204, double %205, double 0xBF4380CB8C0FE741, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %207 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %204, double %206, double 0x3F4A019F98CF38B6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %208 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %204, double %207, double 0xBF66C16C16B02E5C, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %209 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %204, double %208, double 0x3FB555555555553B, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %210 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %203, double %209, double 0x3FDACFE390C97D69, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %211 = tail call double @llvm.experimental.constrained.fsub.f64(double %65, double 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %212 = tail call double @llvm.experimental.constrained.fsub.f64(double %201, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %213 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %211, double %212, double %210, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %217

214:                                              ; preds = %199
  %215 = tail call double @llvm.experimental.constrained.fsub.f64(double %201, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %216 = tail call double @llvm.experimental.constrained.fmul.f64(double %65, double %215, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %217

217:                                              ; preds = %140, %116, %98, %202, %214, %193, %159, %72
  %218 = phi double [ %73, %72 ], [ %156, %140 ], [ %139, %116 ], [ %115, %98 ], [ %177, %159 ], [ %198, %193 ], [ %213, %202 ], [ %216, %214 ]
  br i1 %12, label %221, label %219

219:                                              ; preds = %217
  %220 = tail call double @llvm.experimental.constrained.fsub.f64(double %64, double %218, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %221

221:                                              ; preds = %217, %219, %50, %16, %8
  %222 = phi double [ %9, %8 ], [ %19, %16 ], [ %52, %50 ], [ %220, %219 ], [ %218, %217 ]
  ret double %222
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: optsize
declare double @log(double noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i32 @llvm.experimental.constrained.fptosi.i32.f64(double, metadata) #1

; Function Attrs: optsize
declare double @floor(double noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #1

; Function Attrs: optsize
declare hidden double @__sin(double noundef, double noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden double @__cos(double noundef, double noundef) local_unnamed_addr #2

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
