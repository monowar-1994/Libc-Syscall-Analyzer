; ModuleID = 'src/math/__rem_pio2.c'
source_filename = "src/math/__rem_pio2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__rem_pio2(double noundef %0, double* noundef %1) local_unnamed_addr #0 {
  %3 = alloca [3 x double], align 16
  %4 = alloca [2 x double], align 16
  %5 = bitcast [3 x double]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %5) #4
  %6 = bitcast [2 x double]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %6) #4
  %7 = bitcast double %0 to i64
  %8 = lshr i64 %7, 32
  %9 = trunc i64 %8 to i32
  %10 = and i32 %9, 2147483647
  %11 = icmp ult i32 %10, 1074752123
  br i1 %11, label %12, label %52

12:                                               ; preds = %2
  %13 = and i32 %9, 1048575
  %14 = icmp eq i32 %13, 598523
  br i1 %14, label %106, label %15

15:                                               ; preds = %12
  %16 = icmp ult i32 %10, 1073928573
  %17 = icmp sgt i64 %7, -1
  br i1 %16, label %18, label %31

18:                                               ; preds = %15
  br i1 %17, label %19, label %25

19:                                               ; preds = %18
  %20 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double 0x3FF921FB54400000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %21 = tail call double @llvm.experimental.constrained.fsub.f64(double %20, double 0x3DD0B4611A626331, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store double %21, double* %1, align 8, !tbaa !3
  %22 = tail call double @llvm.experimental.constrained.fsub.f64(double %20, double %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %23 = tail call double @llvm.experimental.constrained.fsub.f64(double %22, double 0x3DD0B4611A626331, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %24 = getelementptr inbounds double, double* %1, i64 1
  store double %23, double* %24, align 8, !tbaa !3
  br label %222

25:                                               ; preds = %18
  %26 = tail call double @llvm.experimental.constrained.fadd.f64(double %0, double 0x3FF921FB54400000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %27 = tail call double @llvm.experimental.constrained.fadd.f64(double %26, double 0x3DD0B4611A626331, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store double %27, double* %1, align 8, !tbaa !3
  %28 = tail call double @llvm.experimental.constrained.fsub.f64(double %26, double %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %29 = tail call double @llvm.experimental.constrained.fadd.f64(double %28, double 0x3DD0B4611A626331, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %30 = getelementptr inbounds double, double* %1, i64 1
  store double %29, double* %30, align 8, !tbaa !3
  br label %222

31:                                               ; preds = %15
  %32 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br i1 %17, label %33, label %44

33:                                               ; preds = %31
  %34 = fneg double %32
  %35 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %34, double 0x3FF921FB54400000, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %36 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %37 = fneg double %36
  %38 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %37, double 0x3DD0B4611A626331, double %35, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store double %38, double* %1, align 8, !tbaa !3
  %39 = tail call double @llvm.experimental.constrained.fsub.f64(double %35, double %38, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %40 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %41 = fneg double %40
  %42 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %41, double 0x3DD0B4611A626331, double %39, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %43 = getelementptr inbounds double, double* %1, i64 1
  store double %42, double* %43, align 8, !tbaa !3
  br label %222

44:                                               ; preds = %31
  %45 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %32, double 0x3FF921FB54400000, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %46 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %47 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %46, double 0x3DD0B4611A626331, double %45, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store double %47, double* %1, align 8, !tbaa !3
  %48 = tail call double @llvm.experimental.constrained.fsub.f64(double %45, double %47, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %49 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %50 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %49, double 0x3DD0B4611A626331, double %48, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %51 = getelementptr inbounds double, double* %1, i64 1
  store double %50, double* %51, align 8, !tbaa !3
  br label %222

52:                                               ; preds = %2
  %53 = icmp ult i32 %10, 1075594812
  br i1 %53, label %54, label %104

54:                                               ; preds = %52
  %55 = icmp ult i32 %10, 1075183037
  br i1 %55, label %56, label %80

56:                                               ; preds = %54
  %57 = icmp eq i32 %10, 1074977148
  br i1 %57, label %106, label %58

58:                                               ; preds = %56
  %59 = icmp sgt i64 %7, -1
  %60 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br i1 %59, label %61, label %72

61:                                               ; preds = %58
  %62 = fneg double %60
  %63 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %62, double 0x3FF921FB54400000, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %64 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %65 = fneg double %64
  %66 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %65, double 0x3DD0B4611A626331, double %63, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store double %66, double* %1, align 8, !tbaa !3
  %67 = tail call double @llvm.experimental.constrained.fsub.f64(double %63, double %66, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %68 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %69 = fneg double %68
  %70 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %69, double 0x3DD0B4611A626331, double %67, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %71 = getelementptr inbounds double, double* %1, i64 1
  store double %70, double* %71, align 8, !tbaa !3
  br label %222

72:                                               ; preds = %58
  %73 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %60, double 0x3FF921FB54400000, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %74 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %75 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %74, double 0x3DD0B4611A626331, double %73, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store double %75, double* %1, align 8, !tbaa !3
  %76 = tail call double @llvm.experimental.constrained.fsub.f64(double %73, double %75, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %77 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %78 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %77, double 0x3DD0B4611A626331, double %76, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %79 = getelementptr inbounds double, double* %1, i64 1
  store double %78, double* %79, align 8, !tbaa !3
  br label %222

80:                                               ; preds = %54
  %81 = icmp eq i32 %10, 1075388923
  br i1 %81, label %106, label %82

82:                                               ; preds = %80
  %83 = icmp sgt i64 %7, -1
  %84 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br i1 %83, label %85, label %96

85:                                               ; preds = %82
  %86 = fneg double %84
  %87 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %86, double 0x3FF921FB54400000, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %88 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %89 = fneg double %88
  %90 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %89, double 0x3DD0B4611A626331, double %87, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store double %90, double* %1, align 8, !tbaa !3
  %91 = tail call double @llvm.experimental.constrained.fsub.f64(double %87, double %90, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %92 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %93 = fneg double %92
  %94 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %93, double 0x3DD0B4611A626331, double %91, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %95 = getelementptr inbounds double, double* %1, i64 1
  store double %94, double* %95, align 8, !tbaa !3
  br label %222

96:                                               ; preds = %82
  %97 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %84, double 0x3FF921FB54400000, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %98 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %99 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %98, double 0x3DD0B4611A626331, double %97, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store double %99, double* %1, align 8, !tbaa !3
  %100 = tail call double @llvm.experimental.constrained.fsub.f64(double %97, double %99, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %101 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %102 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %101, double 0x3DD0B4611A626331, double %100, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %103 = getelementptr inbounds double, double* %1, i64 1
  store double %102, double* %103, align 8, !tbaa !3
  br label %222

104:                                              ; preds = %52
  %105 = icmp ult i32 %10, 1094263291
  br i1 %105, label %106, label %172

106:                                              ; preds = %104, %80, %56, %12
  %107 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %0, double 0x3FE45F306DC9C883, double 0x4338000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %108 = tail call double @llvm.experimental.constrained.fsub.f64(double %107, double 0x4338000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %109 = tail call i32 @llvm.experimental.constrained.fptosi.i32.f64(double %108, metadata !"fpexcept.ignore") #5
  %110 = fneg double %108
  %111 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %110, double 0x3FF921FB54400000, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %112 = tail call double @llvm.experimental.constrained.fmul.f64(double %108, double 0x3DD0B4611A626331, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %113 = tail call double @llvm.experimental.constrained.fsub.f64(double %111, double %112, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %114 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %113, double 0xBFE921FB54442D18, metadata !"olt", metadata !"fpexcept.ignore") #5
  br i1 %114, label %115, label %118, !prof !7

115:                                              ; preds = %106
  %116 = add nsw i32 %109, -1
  %117 = tail call double @llvm.experimental.constrained.fadd.f64(double %108, double -1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %124

118:                                              ; preds = %106
  %119 = tail call double @llvm.experimental.constrained.fsub.f64(double %111, double %112, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %120 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %119, double 0x3FE921FB54442D18, metadata !"ogt", metadata !"fpexcept.ignore") #5
  br i1 %120, label %121, label %130, !prof !7

121:                                              ; preds = %118
  %122 = add nsw i32 %109, 1
  %123 = tail call double @llvm.experimental.constrained.fadd.f64(double %108, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %124

124:                                              ; preds = %115, %121
  %125 = phi double [ %123, %121 ], [ %117, %115 ]
  %126 = phi i32 [ %122, %121 ], [ %116, %115 ]
  %127 = fneg double %125
  %128 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %127, double 0x3FF921FB54400000, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %129 = tail call double @llvm.experimental.constrained.fmul.f64(double %125, double 0x3DD0B4611A626331, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %130

130:                                              ; preds = %124, %118
  %131 = phi double [ %112, %118 ], [ %129, %124 ]
  %132 = phi double [ %111, %118 ], [ %128, %124 ]
  %133 = phi double [ %108, %118 ], [ %125, %124 ]
  %134 = phi i32 [ %109, %118 ], [ %126, %124 ]
  %135 = tail call double @llvm.experimental.constrained.fsub.f64(double %132, double %131, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store double %135, double* %1, align 8, !tbaa !3
  %136 = bitcast double %135 to i64
  %137 = lshr i64 %136, 52
  %138 = trunc i64 %137 to i32
  %139 = and i32 %138, 2047
  %140 = lshr i32 %10, 20
  %141 = sub nsw i32 %140, %139
  %142 = icmp sgt i32 %141, 16
  br i1 %142, label %143, label %165

143:                                              ; preds = %130
  %144 = tail call double @llvm.experimental.constrained.fmul.f64(double %133, double 0x3DD0B4611A600000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %145 = tail call double @llvm.experimental.constrained.fsub.f64(double %132, double %144, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %146 = tail call double @llvm.experimental.constrained.fsub.f64(double %132, double %145, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %147 = tail call double @llvm.experimental.constrained.fsub.f64(double %146, double %144, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %148 = fneg double %147
  %149 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %133, double 0x3BA3198A2E037073, double %148, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %150 = tail call double @llvm.experimental.constrained.fsub.f64(double %145, double %149, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store double %150, double* %1, align 8, !tbaa !3
  %151 = bitcast double %150 to i64
  %152 = lshr i64 %151, 52
  %153 = trunc i64 %152 to i32
  %154 = and i32 %153, 2047
  %155 = sub nsw i32 %140, %154
  %156 = icmp sgt i32 %155, 49
  br i1 %156, label %157, label %165

157:                                              ; preds = %143
  %158 = tail call double @llvm.experimental.constrained.fmul.f64(double %133, double 0x3BA3198A2E000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %159 = tail call double @llvm.experimental.constrained.fsub.f64(double %145, double %158, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %160 = tail call double @llvm.experimental.constrained.fsub.f64(double %145, double %159, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %161 = tail call double @llvm.experimental.constrained.fsub.f64(double %160, double %158, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %162 = fneg double %161
  %163 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %133, double 0x397B839A252049C1, double %162, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %164 = tail call double @llvm.experimental.constrained.fsub.f64(double %159, double %163, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store double %164, double* %1, align 8, !tbaa !3
  br label %165

165:                                              ; preds = %143, %157, %130
  %166 = phi double [ %164, %157 ], [ %150, %143 ], [ %135, %130 ]
  %167 = phi double [ %163, %157 ], [ %149, %143 ], [ %131, %130 ]
  %168 = phi double [ %159, %157 ], [ %145, %143 ], [ %132, %130 ]
  %169 = tail call double @llvm.experimental.constrained.fsub.f64(double %168, double %166, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %170 = tail call double @llvm.experimental.constrained.fsub.f64(double %169, double %167, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %171 = getelementptr inbounds double, double* %1, i64 1
  store double %170, double* %171, align 8, !tbaa !3
  br label %222

172:                                              ; preds = %104
  %173 = icmp ugt i32 %10, 2146435071
  br i1 %173, label %174, label %177

174:                                              ; preds = %172
  %175 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %176 = getelementptr inbounds double, double* %1, i64 1
  store double %175, double* %176, align 8, !tbaa !3
  store double %175, double* %1, align 8, !tbaa !3
  br label %222

177:                                              ; preds = %172
  %178 = and i64 %7, 4503599627370495
  %179 = or i64 %178, 4710765210229538816
  %180 = bitcast i64 %179 to double
  br label %181

181:                                              ; preds = %177, %181
  %182 = phi i1 [ true, %177 ], [ false, %181 ]
  %183 = phi i64 [ 0, %177 ], [ 1, %181 ]
  %184 = phi double [ %180, %177 ], [ %189, %181 ]
  %185 = tail call i32 @llvm.experimental.constrained.fptosi.i32.f64(double %184, metadata !"fpexcept.ignore") #5
  %186 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %185, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %187 = getelementptr inbounds [3 x double], [3 x double]* %3, i64 0, i64 %183
  store double %186, double* %187, align 8, !tbaa !3
  %188 = tail call double @llvm.experimental.constrained.fsub.f64(double %184, double %186, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %189 = tail call double @llvm.experimental.constrained.fmul.f64(double %188, double 0x4170000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br i1 %182, label %181, label %190

190:                                              ; preds = %181
  %191 = getelementptr inbounds [3 x double], [3 x double]* %3, i64 0, i64 2
  store double %189, double* %191, align 16, !tbaa !3
  %192 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %189, double 0.000000e+00, metadata !"oeq", metadata !"fpexcept.ignore") #5
  br i1 %192, label %193, label %199

193:                                              ; preds = %190, %193
  %194 = phi i64 [ %198, %193 ], [ 1, %190 ]
  %195 = getelementptr inbounds [3 x double], [3 x double]* %3, i64 0, i64 %194
  %196 = load double, double* %195, align 8, !tbaa !3
  %197 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %196, double 0.000000e+00, metadata !"oeq", metadata !"fpexcept.ignore") #5
  %198 = add i64 %194, -1
  br i1 %197, label %193, label %199

199:                                              ; preds = %193, %190
  %200 = phi i64 [ 2, %190 ], [ %194, %193 ]
  %201 = trunc i64 %200 to i32
  %202 = getelementptr inbounds [3 x double], [3 x double]* %3, i64 0, i64 0
  %203 = getelementptr inbounds [2 x double], [2 x double]* %4, i64 0, i64 0
  %204 = lshr i32 %10, 20
  %205 = add nsw i32 %204, -1046
  %206 = add nsw i32 %201, 1
  %207 = call i32 @__rem_pio2_large(double* noundef nonnull %202, double* noundef nonnull %203, i32 noundef %205, i32 noundef %206, i32 noundef 1) #6
  %208 = icmp sgt i64 %7, -1
  %209 = load double, double* %203, align 16, !tbaa !3
  br i1 %208, label %218, label %210

210:                                              ; preds = %199
  %211 = getelementptr inbounds [2 x double], [2 x double]* %4, i64 0, i64 1
  %212 = load double, double* %211, align 8, !tbaa !3
  %213 = insertelement <2 x double> poison, double %209, i64 0
  %214 = insertelement <2 x double> %213, double %212, i64 1
  %215 = fneg <2 x double> %214
  %216 = bitcast double* %1 to <2 x double>*
  store <2 x double> %215, <2 x double>* %216, align 8, !tbaa !3
  %217 = sub nsw i32 0, %207
  br label %222

218:                                              ; preds = %199
  store double %209, double* %1, align 8, !tbaa !3
  %219 = getelementptr inbounds [2 x double], [2 x double]* %4, i64 0, i64 1
  %220 = load double, double* %219, align 8, !tbaa !3
  %221 = getelementptr inbounds double, double* %1, i64 1
  store double %220, double* %221, align 8, !tbaa !3
  br label %222

222:                                              ; preds = %218, %210, %174, %165, %96, %85, %72, %61, %44, %33, %25, %19
  %223 = phi i32 [ %134, %165 ], [ -1, %25 ], [ 1, %19 ], [ -2, %44 ], [ 2, %33 ], [ -3, %72 ], [ 3, %61 ], [ -4, %96 ], [ 4, %85 ], [ 0, %174 ], [ %217, %210 ], [ %207, %218 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %6) #4
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %5) #4
  ret i32 %223
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i32 @llvm.experimental.constrained.fptosi.i32.f64(double, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f64(double, double, metadata, metadata) #2

; Function Attrs: optsize
declare hidden i32 @__rem_pio2_large(double* noundef, double* noundef, i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!"branch_weights", i32 1, i32 2000}
