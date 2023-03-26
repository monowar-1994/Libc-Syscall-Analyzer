; ModuleID = 'src/math/pow.c'
source_filename = "src/math/pow.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pow_log_data = type { double, double, [7 x double], [128 x %struct.anon] }
%struct.anon = type { double, double, double, double }
%struct.exp_data = type { double, double, double, double, [4 x double], double, [5 x double], [256 x i64] }

@__pow_log_data = external hidden local_unnamed_addr constant %struct.pow_log_data, align 8
@__exp_data = external hidden local_unnamed_addr constant %struct.exp_data, align 8

; Function Attrs: nounwind optsize strictfp
define double @pow(double noundef %0, double noundef %1) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = bitcast double %0 to i64
  %5 = bitcast double %1 to i64
  %6 = lshr i64 %4, 52
  %7 = trunc i64 %6 to i32
  %8 = lshr i64 %5, 52
  %9 = trunc i64 %8 to i32
  %10 = add nsw i32 %7, -2047
  %11 = icmp ult i32 %10, -2046
  %12 = and i32 %9, 2047
  %13 = add nsw i32 %12, -1086
  %14 = icmp ult i32 %13, -128
  %15 = select i1 %11, i1 true, i1 %14, !prof !3
  br i1 %15, label %16, label %138, !prof !3

16:                                               ; preds = %2
  %17 = shl i64 %5, 1
  %18 = add i64 %17, -1
  %19 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x7FF0000000000000, metadata !"fpexcept.ignore") #5
  %20 = bitcast double %19 to i64
  %21 = shl i64 %20, 1
  %22 = add i64 %21, -1
  %23 = icmp ult i64 %18, %22
  br i1 %23, label %52, label %24, !prof !4

24:                                               ; preds = %16
  %25 = icmp eq i64 %17, 0
  %26 = icmp eq i64 %4, 4607182418800017408
  %27 = or i1 %26, %25
  br i1 %27, label %274, label %28

28:                                               ; preds = %24
  %29 = shl i64 %4, 1
  %30 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x7FF0000000000000, metadata !"fpexcept.ignore") #6
  %31 = bitcast double %30 to i64
  %32 = shl i64 %31, 1
  %33 = icmp ugt i64 %29, %32
  br i1 %33, label %39, label %34

34:                                               ; preds = %28
  %35 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x7FF0000000000000, metadata !"fpexcept.ignore") #6
  %36 = bitcast double %35 to i64
  %37 = shl i64 %36, 1
  %38 = icmp ugt i64 %17, %37
  br i1 %38, label %39, label %41

39:                                               ; preds = %34, %28
  %40 = tail call double @llvm.experimental.constrained.fadd.f64(double %0, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %274

41:                                               ; preds = %34
  %42 = icmp eq i64 %29, 9214364837600034816
  br i1 %42, label %274, label %43

43:                                               ; preds = %41
  %44 = icmp ult i64 %29, 9214364837600034816
  %45 = zext i1 %44 to i32
  %46 = lshr i64 %5, 63
  %47 = trunc i64 %46 to i32
  %48 = xor i32 %47, 1
  %49 = icmp eq i32 %48, %45
  br i1 %49, label %274, label %50

50:                                               ; preds = %43
  %51 = tail call double @llvm.experimental.constrained.fmul.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %274

52:                                               ; preds = %16
  %53 = shl i64 %4, 1
  %54 = add i64 %53, -1
  %55 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x7FF0000000000000, metadata !"fpexcept.ignore") #5
  %56 = bitcast double %55 to i64
  %57 = shl i64 %56, 1
  %58 = add i64 %57, -1
  %59 = icmp ult i64 %54, %58
  br i1 %59, label %86, label %60, !prof !4

60:                                               ; preds = %52
  %61 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %62 = icmp sgt i64 %4, -1
  %63 = add nsw i32 %12, -1076
  %64 = icmp ult i32 %63, -53
  %65 = or i1 %62, %64
  br i1 %65, label %78, label %66

66:                                               ; preds = %60
  %67 = sub nuw nsw i32 1075, %12
  %68 = zext i32 %67 to i64
  %69 = shl nuw nsw i64 1, %68
  %70 = add nsw i64 %69, -1
  %71 = and i64 %70, %5
  %72 = icmp ne i64 %71, 0
  %73 = and i64 %69, %5
  %74 = icmp eq i64 %73, 0
  %75 = select i1 %72, i1 true, i1 %74
  %76 = fneg double %61
  %77 = select i1 %75, double %61, double %76
  br label %78

78:                                               ; preds = %66, %60
  %79 = phi double [ %61, %60 ], [ %77, %66 ]
  %80 = icmp sgt i64 %5, -1
  br i1 %80, label %274, label %81

81:                                               ; preds = %78
  %82 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %83 = tail call double @llvm.experimental.constrained.fdiv.f64(double %82, double %79, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %84 = bitcast double* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %84)
  store volatile double %83, double* %3, align 8, !tbaa !5
  %85 = load volatile double, double* %3, align 8, !tbaa !5
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %84)
  br label %274

86:                                               ; preds = %52
  %87 = icmp sgt i64 %4, -1
  br i1 %87, label %109, label %88

88:                                               ; preds = %86
  %89 = icmp ult i32 %12, 1023
  br i1 %89, label %102, label %90

90:                                               ; preds = %88
  %91 = icmp ugt i32 %12, 1075
  br i1 %91, label %104, label %92

92:                                               ; preds = %90
  %93 = sub nuw nsw i32 1075, %12
  %94 = zext i32 %93 to i64
  %95 = shl nuw nsw i64 1, %94
  %96 = add nsw i64 %95, -1
  %97 = and i64 %96, %5
  %98 = icmp eq i64 %97, 0
  br i1 %98, label %99, label %102

99:                                               ; preds = %92
  %100 = and i64 %95, %5
  %101 = icmp eq i64 %100, 0
  br i1 %101, label %104, label %105

102:                                              ; preds = %92, %88
  %103 = tail call double @__math_invalid(double noundef %0) #7
  br label %274

104:                                              ; preds = %90, %99
  br label %105

105:                                              ; preds = %104, %99
  %106 = phi i32 [ 0, %104 ], [ 262144, %99 ]
  %107 = and i64 %4, 9223372036854775807
  %108 = and i32 %7, 2047
  br label %109

109:                                              ; preds = %105, %86
  %110 = phi i32 [ %108, %105 ], [ %7, %86 ]
  %111 = phi i64 [ %107, %105 ], [ %4, %86 ]
  %112 = phi i32 [ %106, %105 ], [ 0, %86 ]
  br i1 %14, label %113, label %131

113:                                              ; preds = %109
  %114 = icmp eq i64 %111, 4607182418800017408
  br i1 %114, label %274, label %115

115:                                              ; preds = %113
  %116 = icmp ult i32 %12, 958
  br i1 %116, label %117, label %123

117:                                              ; preds = %115
  %118 = icmp ugt i64 %111, 4607182418800017408
  br i1 %118, label %119, label %121

119:                                              ; preds = %117
  %120 = tail call double @llvm.experimental.constrained.fadd.f64(double 1.000000e+00, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %274

121:                                              ; preds = %117
  %122 = tail call double @llvm.experimental.constrained.fsub.f64(double 1.000000e+00, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %274

123:                                              ; preds = %115
  %124 = icmp ult i64 %111, 4607182418800017409
  %125 = icmp ult i32 %9, 2048
  %126 = xor i1 %125, %124
  br i1 %126, label %127, label %129

127:                                              ; preds = %123
  %128 = tail call double @__math_oflow(i32 noundef 0) #7
  br label %274

129:                                              ; preds = %123
  %130 = tail call double @__math_uflow(i32 noundef 0) #7
  br label %274

131:                                              ; preds = %109
  %132 = icmp eq i32 %110, 0
  br i1 %132, label %133, label %138

133:                                              ; preds = %131
  %134 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double 0x4330000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %135 = bitcast double %134 to i64
  %136 = and i64 %135, 9223372036854775807
  %137 = add nsw i64 %136, -234187180623265792
  br label %138

138:                                              ; preds = %131, %133, %2
  %139 = phi i64 [ %137, %133 ], [ %111, %131 ], [ %4, %2 ]
  %140 = phi i32 [ %112, %133 ], [ %112, %131 ], [ 0, %2 ]
  %141 = add i64 %139, -4604531861337669632
  %142 = lshr i64 %141, 45
  %143 = and i64 %142, 127
  %144 = ashr i64 %141, 52
  %145 = trunc i64 %144 to i32
  %146 = and i64 %141, -4503599627370496
  %147 = sub i64 %139, %146
  %148 = bitcast i64 %147 to double
  %149 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %145, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %150 = getelementptr inbounds %struct.pow_log_data, %struct.pow_log_data* @__pow_log_data, i64 0, i32 3, i64 %143, i32 0
  %151 = load double, double* %150, align 8, !tbaa !9
  %152 = getelementptr inbounds %struct.pow_log_data, %struct.pow_log_data* @__pow_log_data, i64 0, i32 3, i64 %143, i32 2
  %153 = load double, double* %152, align 8, !tbaa !11
  %154 = getelementptr inbounds %struct.pow_log_data, %struct.pow_log_data* @__pow_log_data, i64 0, i32 3, i64 %143, i32 3
  %155 = load double, double* %154, align 8, !tbaa !12
  %156 = add i64 %147, 2147483648
  %157 = and i64 %156, -4294967296
  %158 = bitcast i64 %157 to double
  %159 = tail call double @llvm.experimental.constrained.fsub.f64(double %148, double %158, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %160 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %158, double %151, double -1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %161 = tail call double @llvm.experimental.constrained.fmul.f64(double %159, double %151, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %162 = tail call double @llvm.experimental.constrained.fadd.f64(double %160, double %161, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %163 = load double, double* getelementptr inbounds (%struct.pow_log_data, %struct.pow_log_data* @__pow_log_data, i64 0, i32 0), align 8, !tbaa !13
  %164 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %149, double %163, double %153, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %165 = tail call double @llvm.experimental.constrained.fadd.f64(double %164, double %162, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %166 = load double, double* getelementptr inbounds (%struct.pow_log_data, %struct.pow_log_data* @__pow_log_data, i64 0, i32 1), align 8, !tbaa !15
  %167 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %149, double %166, double %155, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %168 = tail call double @llvm.experimental.constrained.fsub.f64(double %164, double %165, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %169 = tail call double @llvm.experimental.constrained.fadd.f64(double %168, double %162, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %170 = load double, double* getelementptr inbounds (%struct.pow_log_data, %struct.pow_log_data* @__pow_log_data, i64 0, i32 2, i64 0), align 8, !tbaa !5
  %171 = tail call double @llvm.experimental.constrained.fmul.f64(double %170, double %162, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %172 = tail call double @llvm.experimental.constrained.fmul.f64(double %162, double %171, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %173 = tail call double @llvm.experimental.constrained.fmul.f64(double %162, double %172, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %174 = tail call double @llvm.experimental.constrained.fmul.f64(double %170, double %160, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %175 = tail call double @llvm.experimental.constrained.fmul.f64(double %160, double %174, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %176 = tail call double @llvm.experimental.constrained.fadd.f64(double %165, double %175, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %177 = tail call double @llvm.experimental.constrained.fadd.f64(double %171, double %174, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %178 = tail call double @llvm.experimental.constrained.fmul.f64(double %161, double %177, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %179 = tail call double @llvm.experimental.constrained.fsub.f64(double %165, double %176, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %180 = tail call double @llvm.experimental.constrained.fadd.f64(double %179, double %175, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %181 = load double, double* getelementptr inbounds (%struct.pow_log_data, %struct.pow_log_data* @__pow_log_data, i64 0, i32 2, i64 1), align 8, !tbaa !5
  %182 = load double, double* getelementptr inbounds (%struct.pow_log_data, %struct.pow_log_data* @__pow_log_data, i64 0, i32 2, i64 2), align 8, !tbaa !5
  %183 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %162, double %182, double %181, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %184 = load double, double* getelementptr inbounds (%struct.pow_log_data, %struct.pow_log_data* @__pow_log_data, i64 0, i32 2, i64 3), align 8, !tbaa !5
  %185 = load double, double* getelementptr inbounds (%struct.pow_log_data, %struct.pow_log_data* @__pow_log_data, i64 0, i32 2, i64 4), align 8, !tbaa !5
  %186 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %162, double %185, double %184, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %187 = load double, double* getelementptr inbounds (%struct.pow_log_data, %struct.pow_log_data* @__pow_log_data, i64 0, i32 2, i64 5), align 8, !tbaa !5
  %188 = load double, double* getelementptr inbounds (%struct.pow_log_data, %struct.pow_log_data* @__pow_log_data, i64 0, i32 2, i64 6), align 8, !tbaa !5
  %189 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %162, double %188, double %187, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %190 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %172, double %189, double %186, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %191 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %172, double %190, double %183, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %192 = tail call double @llvm.experimental.constrained.fmul.f64(double %173, double %191, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %193 = tail call double @llvm.experimental.constrained.fadd.f64(double %167, double %169, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %194 = tail call double @llvm.experimental.constrained.fadd.f64(double %193, double %178, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %195 = tail call double @llvm.experimental.constrained.fadd.f64(double %194, double %180, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %196 = tail call double @llvm.experimental.constrained.fadd.f64(double %195, double %192, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %197 = tail call double @llvm.experimental.constrained.fadd.f64(double %176, double %196, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %198 = tail call double @llvm.experimental.constrained.fsub.f64(double %176, double %197, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %199 = tail call double @llvm.experimental.constrained.fadd.f64(double %198, double %196, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %200 = and i64 %5, -134217728
  %201 = bitcast i64 %200 to double
  %202 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double %201, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %203 = bitcast double %197 to i64
  %204 = and i64 %203, -134217728
  %205 = bitcast i64 %204 to double
  %206 = tail call double @llvm.experimental.constrained.fsub.f64(double %197, double %205, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %207 = tail call double @llvm.experimental.constrained.fadd.f64(double %206, double %199, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %208 = tail call double @llvm.experimental.constrained.fmul.f64(double %201, double %205, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %209 = tail call double @llvm.experimental.constrained.fmul.f64(double %1, double %207, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %210 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %202, double %205, double %209, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %211 = bitcast double %208 to i64
  %212 = lshr i64 %211, 52
  %213 = trunc i64 %212 to i32
  %214 = and i32 %213, 2047
  %215 = add nsw i32 %214, -969
  %216 = icmp ult i32 %215, 63
  br i1 %216, label %232, label %217, !prof !4

217:                                              ; preds = %138
  %218 = icmp ult i32 %214, 969
  br i1 %218, label %219, label %224

219:                                              ; preds = %217
  %220 = tail call double @llvm.experimental.constrained.fadd.f64(double 1.000000e+00, double %208, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %221 = icmp eq i32 %140, 0
  %222 = fneg double %220
  %223 = select i1 %221, double %220, double %222
  br label %274

224:                                              ; preds = %217
  %225 = icmp ult i32 %214, 1033
  br i1 %225, label %232, label %226

226:                                              ; preds = %224
  %227 = icmp sgt i64 %211, -1
  br i1 %227, label %230, label %228

228:                                              ; preds = %226
  %229 = tail call double @__math_uflow(i32 noundef %140) #7
  br label %274

230:                                              ; preds = %226
  %231 = tail call double @__math_oflow(i32 noundef %140) #7
  br label %274

232:                                              ; preds = %224, %138
  %233 = phi i32 [ %214, %138 ], [ 0, %224 ]
  %234 = load double, double* getelementptr inbounds (%struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 0), align 8, !tbaa !16
  %235 = tail call double @llvm.experimental.constrained.fmul.f64(double %234, double %208, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %236 = load double, double* getelementptr inbounds (%struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 1), align 8, !tbaa !18
  %237 = tail call double @llvm.experimental.constrained.fadd.f64(double %235, double %236, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %238 = bitcast double %237 to i64
  %239 = tail call double @llvm.experimental.constrained.fsub.f64(double %237, double %236, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %240 = load double, double* getelementptr inbounds (%struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 2), align 8, !tbaa !19
  %241 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %239, double %240, double %208, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %242 = load double, double* getelementptr inbounds (%struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 3), align 8, !tbaa !20
  %243 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %239, double %242, double %241, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %244 = tail call double @llvm.experimental.constrained.fadd.f64(double %243, double %210, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %245 = shl i64 %238, 1
  %246 = and i64 %245, 254
  %247 = zext i32 %140 to i64
  %248 = add i64 %238, %247
  %249 = shl i64 %248, 45
  %250 = getelementptr inbounds %struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 7, i64 %246
  %251 = bitcast i64* %250 to double*
  %252 = load double, double* %251, align 8, !tbaa !21
  %253 = or i64 %246, 1
  %254 = getelementptr inbounds %struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 7, i64 %253
  %255 = load i64, i64* %254, align 8, !tbaa !21
  %256 = add i64 %255, %249
  %257 = tail call double @llvm.experimental.constrained.fmul.f64(double %244, double %244, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %258 = tail call double @llvm.experimental.constrained.fadd.f64(double %252, double %244, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %259 = load double, double* getelementptr inbounds (%struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 4, i64 0), align 8, !tbaa !5
  %260 = load double, double* getelementptr inbounds (%struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 4, i64 1), align 8, !tbaa !5
  %261 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %244, double %260, double %259, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %262 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %257, double %261, double %258, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %263 = tail call double @llvm.experimental.constrained.fmul.f64(double %257, double %257, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %264 = load double, double* getelementptr inbounds (%struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 4, i64 2), align 8, !tbaa !5
  %265 = load double, double* getelementptr inbounds (%struct.exp_data, %struct.exp_data* @__exp_data, i64 0, i32 4, i64 3), align 8, !tbaa !5
  %266 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %244, double %265, double %264, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %267 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %263, double %266, double %262, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %268 = icmp eq i32 %233, 0
  br i1 %268, label %269, label %271, !prof !3

269:                                              ; preds = %232
  %270 = tail call fastcc double @specialcase(double noundef %267, i64 noundef %256, i64 noundef %238) #7
  br label %274

271:                                              ; preds = %232
  %272 = bitcast i64 %256 to double
  %273 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %272, double %267, double %272, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %274

274:                                              ; preds = %271, %269, %230, %228, %219, %102, %127, %129, %119, %121, %113, %81, %78, %43, %41, %24, %50, %39
  %275 = phi double [ %40, %39 ], [ %51, %50 ], [ 1.000000e+00, %24 ], [ 1.000000e+00, %41 ], [ 0.000000e+00, %43 ], [ %85, %81 ], [ %79, %78 ], [ 1.000000e+00, %113 ], [ %120, %119 ], [ %122, %121 ], [ %128, %127 ], [ %130, %129 ], [ %103, %102 ], [ %223, %219 ], [ %229, %228 ], [ %231, %230 ], [ %270, %269 ], [ %273, %271 ]
  ret double %275
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden double @__math_invalid(double noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: optsize
declare hidden double @__math_oflow(i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden double @__math_uflow(i32 noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #2

; Function Attrs: inlinehint nounwind optsize strictfp
define internal fastcc double @specialcase(double noundef %0, i64 noundef %1, i64 noundef %2) unnamed_addr #4 {
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = and i64 %2, 2147483648
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %13

8:                                                ; preds = %3
  %9 = add i64 %1, -4544132024016830464
  %10 = bitcast i64 %9 to double
  %11 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %10, double %0, double %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %12 = tail call double @llvm.experimental.constrained.fmul.f64(double 0x7F00000000000000, double %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %41

13:                                               ; preds = %3
  %14 = add i64 %1, 4602678819172646912
  %15 = bitcast i64 %14 to double
  %16 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %15, double %0, double %15, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %17 = tail call double @fabs(double noundef %16) #7
  %18 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %17, double 1.000000e+00, metadata !"olt", metadata !"fpexcept.ignore") #6
  br i1 %18, label %19, label %38

19:                                               ; preds = %13
  %20 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %16, double 0.000000e+00, metadata !"olt", metadata !"fpexcept.ignore") #6
  %21 = select i1 %20, double -1.000000e+00, double 1.000000e+00
  %22 = tail call double @llvm.experimental.constrained.fsub.f64(double %15, double %16, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %23 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %15, double %0, double %22, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %24 = tail call double @llvm.experimental.constrained.fadd.f64(double %21, double %16, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %25 = tail call double @llvm.experimental.constrained.fsub.f64(double %21, double %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %26 = tail call double @llvm.experimental.constrained.fadd.f64(double %25, double %16, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %27 = tail call double @llvm.experimental.constrained.fadd.f64(double %26, double %23, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %28 = tail call double @llvm.experimental.constrained.fadd.f64(double %24, double %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %29 = tail call double @llvm.experimental.constrained.fsub.f64(double %28, double %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %30 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %29, double 0.000000e+00, metadata !"oeq", metadata !"fpexcept.ignore") #6
  %31 = and i64 %14, -9223372036854775808
  %32 = bitcast i64 %31 to double
  %33 = select i1 %30, double %32, double %29
  %34 = bitcast double* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %34)
  store volatile double 0x10000000000000, double* %5, align 8, !tbaa !5
  %35 = load volatile double, double* %5, align 8, !tbaa !5
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %34)
  %36 = tail call double @llvm.experimental.constrained.fmul.f64(double %35, double 0x10000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %37 = bitcast double* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %37)
  store volatile double %36, double* %4, align 8, !tbaa !5
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %37)
  br label %38

38:                                               ; preds = %19, %13
  %39 = phi double [ %33, %19 ], [ %16, %13 ]
  %40 = tail call double @llvm.experimental.constrained.fmul.f64(double 0x10000000000000, double %39, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %41

41:                                               ; preds = %38, %8
  %42 = phi double [ %12, %8 ], [ %40, %38 ]
  ret double %42
}

; Function Attrs: optsize
declare double @fabs(double noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f64(double, double, metadata, metadata) #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { inlinehint nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind strictfp }
attributes #6 = { strictfp }
attributes #7 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!"branch_weights", i32 1, i32 2000}
!4 = !{!"branch_weights", i32 2000, i32 1}
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !6, i64 0}
!10 = !{!"", !6, i64 0, !6, i64 8, !6, i64 16, !6, i64 24}
!11 = !{!10, !6, i64 16}
!12 = !{!10, !6, i64 24}
!13 = !{!14, !6, i64 0}
!14 = !{!"pow_log_data", !6, i64 0, !6, i64 8, !7, i64 16, !7, i64 72}
!15 = !{!14, !6, i64 8}
!16 = !{!17, !6, i64 0}
!17 = !{!"exp_data", !6, i64 0, !6, i64 8, !6, i64 16, !6, i64 24, !7, i64 32, !6, i64 64, !7, i64 72, !7, i64 112}
!18 = !{!17, !6, i64 8}
!19 = !{!17, !6, i64 16}
!20 = !{!17, !6, i64 24}
!21 = !{!22, !22, i64 0}
!22 = !{!"long", !7, i64 0}
