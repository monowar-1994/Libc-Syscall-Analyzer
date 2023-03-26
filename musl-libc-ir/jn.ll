; ModuleID = 'src/math/jn.c'
source_filename = "src/math/jn.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define double @jn(i32 noundef %0, double noundef %1) local_unnamed_addr #0 {
  %3 = bitcast double %1 to i64
  %4 = lshr i64 %3, 32
  %5 = trunc i64 %4 to i32
  %6 = trunc i64 %3 to i32
  %7 = and i32 %5, 2147483647
  %8 = icmp ne i32 %6, 0
  %9 = zext i1 %8 to i32
  %10 = or i32 %7, %9
  %11 = icmp ugt i32 %10, 2146435072
  br i1 %11, label %198, label %12

12:                                               ; preds = %2
  %13 = icmp eq i32 %0, 0
  br i1 %13, label %14, label %16

14:                                               ; preds = %12
  %15 = tail call double @j0(double noundef %1) #3
  br label %198

16:                                               ; preds = %12
  %17 = icmp slt i32 %0, 0
  %18 = xor i32 %0, -1
  %19 = fneg double %1
  %20 = add nsw i32 %0, -1
  %21 = select i1 %17, i32 %18, i32 %20
  %22 = select i1 %17, double %19, double %1
  %23 = icmp eq i32 %21, 0
  br i1 %23, label %24, label %26

24:                                               ; preds = %16
  %25 = tail call double @j1(double noundef %22) #3
  br label %198

26:                                               ; preds = %16
  %27 = xor i32 %5, %0
  %28 = lshr i32 %27, 31
  %29 = and i32 %28, %0
  %30 = tail call double @fabs(double noundef %22) #3
  %31 = or i32 %7, %6
  %32 = icmp eq i32 %31, 0
  %33 = icmp eq i32 %7, 2146435072
  %34 = or i1 %33, %32
  br i1 %34, label %193, label %35

35:                                               ; preds = %26
  %36 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %37 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %36, double %30, metadata !"olt", metadata !"fpexcept.ignore") #4
  br i1 %37, label %38, label %81

38:                                               ; preds = %35
  %39 = icmp ugt i32 %7, 1389363199
  br i1 %39, label %40, label %66

40:                                               ; preds = %38
  %41 = and i32 %21, 3
  switch i32 %41, label %56 [
    i32 0, label %42
    i32 1, label %47
    i32 2, label %52
    i32 3, label %57
  ]

42:                                               ; preds = %40
  %43 = tail call double @cos(double noundef %30) #3
  %44 = fneg double %43
  %45 = tail call double @sin(double noundef %30) #3
  %46 = tail call double @llvm.experimental.constrained.fadd.f64(double %44, double %45, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %61

47:                                               ; preds = %40
  %48 = tail call double @cos(double noundef %30) #3
  %49 = fneg double %48
  %50 = tail call double @sin(double noundef %30) #3
  %51 = tail call double @llvm.experimental.constrained.fsub.f64(double %49, double %50, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %61

52:                                               ; preds = %40
  %53 = tail call double @cos(double noundef %30) #3
  %54 = tail call double @sin(double noundef %30) #3
  %55 = tail call double @llvm.experimental.constrained.fsub.f64(double %53, double %54, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %61

56:                                               ; preds = %40
  unreachable

57:                                               ; preds = %40
  %58 = tail call double @cos(double noundef %30) #3
  %59 = tail call double @sin(double noundef %30) #3
  %60 = tail call double @llvm.experimental.constrained.fadd.f64(double %58, double %59, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %61

61:                                               ; preds = %57, %52, %47, %42
  %62 = phi double [ %60, %57 ], [ %55, %52 ], [ %51, %47 ], [ %46, %42 ]
  %63 = tail call double @llvm.experimental.constrained.fmul.f64(double 0x3FE20DD750429B6D, double %62, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %64 = tail call double @sqrt(double noundef %30) #3
  %65 = tail call double @llvm.experimental.constrained.fdiv.f64(double %63, double %64, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %193

66:                                               ; preds = %38
  %67 = tail call double @j0(double noundef %30) #3
  %68 = tail call double @j1(double noundef %30) #3
  %69 = icmp sgt i32 %21, 0
  br i1 %69, label %70, label %193

70:                                               ; preds = %66, %70
  %71 = phi double [ %79, %70 ], [ %68, %66 ]
  %72 = phi double [ %71, %70 ], [ %67, %66 ]
  %73 = phi i32 [ %74, %70 ], [ 0, %66 ]
  %74 = add nuw nsw i32 %73, 1
  %75 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %74, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %76 = tail call double @llvm.experimental.constrained.fmul.f64(double 2.000000e+00, double %75, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %77 = tail call double @llvm.experimental.constrained.fdiv.f64(double %76, double %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %78 = fneg double %72
  %79 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %71, double %77, double %78, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %80 = icmp eq i32 %74, %21
  br i1 %80, label %193, label %70

81:                                               ; preds = %35
  %82 = icmp ult i32 %7, 1041235968
  br i1 %82, label %83, label %103

83:                                               ; preds = %81
  %84 = icmp sgt i32 %21, 32
  br i1 %84, label %193, label %85

85:                                               ; preds = %83
  %86 = tail call double @llvm.experimental.constrained.fmul.f64(double %30, double 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %87 = icmp slt i32 %21, 1
  br i1 %87, label %99, label %88

88:                                               ; preds = %85
  %89 = add i32 %21, 1
  br label %90

90:                                               ; preds = %88, %90
  %91 = phi double [ %96, %90 ], [ %86, %88 ]
  %92 = phi double [ %95, %90 ], [ 1.000000e+00, %88 ]
  %93 = phi i32 [ %97, %90 ], [ 2, %88 ]
  %94 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %93, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %95 = tail call double @llvm.experimental.constrained.fmul.f64(double %92, double %94, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %96 = tail call double @llvm.experimental.constrained.fmul.f64(double %91, double %86, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %97 = add nuw i32 %93, 1
  %98 = icmp eq i32 %93, %89
  br i1 %98, label %99, label %90

99:                                               ; preds = %90, %85
  %100 = phi double [ 1.000000e+00, %85 ], [ %95, %90 ]
  %101 = phi double [ %86, %85 ], [ %96, %90 ]
  %102 = tail call double @llvm.experimental.constrained.fdiv.f64(double %101, double %100, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %193

103:                                              ; preds = %81
  %104 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %105 = tail call double @llvm.experimental.constrained.fadd.f64(double %104, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %106 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %107 = tail call double @llvm.experimental.constrained.fmul.f64(double %106, double %105, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %108 = tail call double @llvm.experimental.constrained.fdiv.f64(double %107, double %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %109 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %110 = tail call double @llvm.experimental.constrained.fdiv.f64(double %109, double %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %111 = tail call double @llvm.experimental.constrained.fadd.f64(double %108, double %110, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %112 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %108, double %111, double -1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %113 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %112, double 1.000000e+09, metadata !"olt", metadata !"fpexcept.ignore") #4
  br i1 %113, label %114, label %124

114:                                              ; preds = %103, %114
  %115 = phi i32 [ %119, %114 ], [ 1, %103 ]
  %116 = phi double [ %120, %114 ], [ %111, %103 ]
  %117 = phi double [ %122, %114 ], [ %112, %103 ]
  %118 = phi double [ %117, %114 ], [ %108, %103 ]
  %119 = add nuw nsw i32 %115, 1
  %120 = tail call double @llvm.experimental.constrained.fadd.f64(double %116, double %110, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %121 = fneg double %118
  %122 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %120, double %117, double %121, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %123 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %122, double 1.000000e+09, metadata !"olt", metadata !"fpexcept.ignore") #4
  br i1 %123, label %114, label %124

124:                                              ; preds = %114, %103
  %125 = phi i32 [ 1, %103 ], [ %119, %114 ]
  br label %126

126:                                              ; preds = %124, %126
  %127 = phi double [ %136, %126 ], [ 0.000000e+00, %124 ]
  %128 = phi i32 [ %137, %126 ], [ %125, %124 ]
  %129 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %130 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %131 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %128, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %132 = tail call double @llvm.experimental.constrained.fadd.f64(double %131, double %105, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %133 = tail call double @llvm.experimental.constrained.fmul.f64(double %130, double %132, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %134 = tail call double @llvm.experimental.constrained.fdiv.f64(double %133, double %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %135 = tail call double @llvm.experimental.constrained.fsub.f64(double %134, double %127, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %136 = tail call double @llvm.experimental.constrained.fdiv.f64(double %129, double %135, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %137 = add nsw i32 %128, -1
  %138 = icmp eq i32 %128, 0
  br i1 %138, label %139, label %126

139:                                              ; preds = %126
  %140 = tail call double @fabs(double noundef %108) #3
  %141 = tail call double @log(double noundef %140) #3
  %142 = tail call double @llvm.experimental.constrained.fmul.f64(double %105, double %141, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %143 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %142, double 0x40862E42FEFA39EF, metadata !"olt", metadata !"fpexcept.ignore") #4
  %144 = icmp sgt i32 %21, 0
  br i1 %143, label %146, label %145

145:                                              ; preds = %139
  br i1 %144, label %158, label %178

146:                                              ; preds = %139
  br i1 %144, label %147, label %178

147:                                              ; preds = %146, %147
  %148 = phi double [ %155, %147 ], [ 1.000000e+00, %146 ]
  %149 = phi double [ %148, %147 ], [ %136, %146 ]
  %150 = phi i32 [ %156, %147 ], [ %21, %146 ]
  %151 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %150, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %152 = tail call double @llvm.experimental.constrained.fmul.f64(double 2.000000e+00, double %151, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %153 = tail call double @llvm.experimental.constrained.fmul.f64(double %148, double %152, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %154 = tail call double @llvm.experimental.constrained.fdiv.f64(double %153, double %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %155 = tail call double @llvm.experimental.constrained.fsub.f64(double %154, double %149, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %156 = add nsw i32 %150, -1
  %157 = icmp ugt i32 %150, 1
  br i1 %157, label %147, label %178

158:                                              ; preds = %145, %172
  %159 = phi double [ %175, %172 ], [ %136, %145 ]
  %160 = phi double [ %174, %172 ], [ 1.000000e+00, %145 ]
  %161 = phi double [ %173, %172 ], [ %136, %145 ]
  %162 = phi i32 [ %176, %172 ], [ %21, %145 ]
  %163 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %162, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %164 = tail call double @llvm.experimental.constrained.fmul.f64(double 2.000000e+00, double %163, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %165 = tail call double @llvm.experimental.constrained.fmul.f64(double %160, double %164, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %166 = tail call double @llvm.experimental.constrained.fdiv.f64(double %165, double %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %167 = tail call double @llvm.experimental.constrained.fsub.f64(double %166, double %161, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %168 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %167, double 0x5F30000000000000, metadata !"ogt", metadata !"fpexcept.ignore") #4
  br i1 %168, label %169, label %172

169:                                              ; preds = %158
  %170 = tail call double @llvm.experimental.constrained.fdiv.f64(double %160, double %167, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %171 = tail call double @llvm.experimental.constrained.fdiv.f64(double %159, double %167, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %172

172:                                              ; preds = %158, %169
  %173 = phi double [ %170, %169 ], [ %160, %158 ]
  %174 = phi double [ 1.000000e+00, %169 ], [ %167, %158 ]
  %175 = phi double [ %171, %169 ], [ %159, %158 ]
  %176 = add nsw i32 %162, -1
  %177 = icmp sgt i32 %162, 1
  br i1 %177, label %158, label %178

178:                                              ; preds = %172, %147, %145, %146
  %179 = phi double [ %136, %146 ], [ %136, %145 ], [ %148, %147 ], [ %173, %172 ]
  %180 = phi double [ 1.000000e+00, %146 ], [ 1.000000e+00, %145 ], [ %155, %147 ], [ %174, %172 ]
  %181 = phi double [ %136, %146 ], [ %136, %145 ], [ %136, %147 ], [ %175, %172 ]
  %182 = tail call double @j0(double noundef %30) #3
  %183 = tail call double @j1(double noundef %30) #3
  %184 = tail call double @fabs(double noundef %182) #3
  %185 = tail call double @fabs(double noundef %183) #3
  %186 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %184, double %185, metadata !"oge", metadata !"fpexcept.ignore") #4
  br i1 %186, label %187, label %190

187:                                              ; preds = %178
  %188 = tail call double @llvm.experimental.constrained.fmul.f64(double %181, double %182, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %189 = tail call double @llvm.experimental.constrained.fdiv.f64(double %188, double %180, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %193

190:                                              ; preds = %178
  %191 = tail call double @llvm.experimental.constrained.fmul.f64(double %181, double %183, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %192 = tail call double @llvm.experimental.constrained.fdiv.f64(double %191, double %179, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %193

193:                                              ; preds = %70, %66, %187, %190, %83, %26, %61, %99
  %194 = phi double [ %65, %61 ], [ %102, %99 ], [ 0.000000e+00, %26 ], [ 0.000000e+00, %83 ], [ %189, %187 ], [ %192, %190 ], [ %68, %66 ], [ %79, %70 ]
  %195 = icmp eq i32 %29, 0
  %196 = fneg double %194
  %197 = select i1 %195, double %194, double %196
  br label %198

198:                                              ; preds = %2, %193, %24, %14
  %199 = phi double [ %15, %14 ], [ %25, %24 ], [ %197, %193 ], [ %1, %2 ]
  ret double %199
}

; Function Attrs: optsize
declare double @j0(double noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare double @j1(double noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare double @fabs(double noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f64(double, double, metadata, metadata) #2

; Function Attrs: optsize
declare double @cos(double noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare double @sin(double noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

; Function Attrs: optsize
declare double @sqrt(double noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #2

; Function Attrs: optsize
declare double @log(double noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define double @yn(i32 noundef %0, double noundef %1) local_unnamed_addr #0 {
  %3 = bitcast double %1 to i64
  %4 = lshr i64 %3, 32
  %5 = trunc i64 %4 to i32
  %6 = trunc i64 %3 to i32
  %7 = and i32 %5, 2147483647
  %8 = icmp ne i32 %6, 0
  %9 = zext i1 %8 to i32
  %10 = or i32 %7, %9
  %11 = icmp ugt i32 %10, 2146435072
  br i1 %11, label %95, label %12

12:                                               ; preds = %2
  %13 = icmp sgt i64 %3, -1
  %14 = or i32 %7, %6
  %15 = icmp eq i32 %14, 0
  %16 = or i1 %13, %15
  br i1 %16, label %20, label %17

17:                                               ; preds = %12
  %18 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %19 = tail call double @llvm.experimental.constrained.fdiv.f64(double %18, double 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %95

20:                                               ; preds = %12
  %21 = icmp eq i32 %7, 2146435072
  br i1 %21, label %95, label %22

22:                                               ; preds = %20
  %23 = icmp eq i32 %0, 0
  br i1 %23, label %24, label %26

24:                                               ; preds = %22
  %25 = tail call double @y0(double noundef %1) #3
  br label %95

26:                                               ; preds = %22
  %27 = icmp slt i32 %0, 0
  %28 = xor i32 %0, -1
  %29 = and i32 %0, 1
  %30 = add nsw i32 %0, -1
  %31 = select i1 %27, i32 %29, i32 0
  %32 = select i1 %27, i32 %28, i32 %30
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %39

34:                                               ; preds = %26
  %35 = icmp eq i32 %31, 0
  %36 = tail call double @y1(double noundef %1) #3
  %37 = fneg double %36
  %38 = select i1 %35, double %36, double %37
  br label %95

39:                                               ; preds = %26
  %40 = icmp ugt i32 %7, 1389363199
  br i1 %40, label %41, label %67

41:                                               ; preds = %39
  %42 = and i32 %32, 3
  switch i32 %42, label %57 [
    i32 0, label %43
    i32 1, label %48
    i32 2, label %53
    i32 3, label %58
  ]

43:                                               ; preds = %41
  %44 = tail call double @sin(double noundef %1) #3
  %45 = fneg double %44
  %46 = tail call double @cos(double noundef %1) #3
  %47 = tail call double @llvm.experimental.constrained.fsub.f64(double %45, double %46, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %62

48:                                               ; preds = %41
  %49 = tail call double @sin(double noundef %1) #3
  %50 = fneg double %49
  %51 = tail call double @cos(double noundef %1) #3
  %52 = tail call double @llvm.experimental.constrained.fadd.f64(double %50, double %51, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %62

53:                                               ; preds = %41
  %54 = tail call double @sin(double noundef %1) #3
  %55 = tail call double @cos(double noundef %1) #3
  %56 = tail call double @llvm.experimental.constrained.fadd.f64(double %54, double %55, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %62

57:                                               ; preds = %41
  unreachable

58:                                               ; preds = %41
  %59 = tail call double @sin(double noundef %1) #3
  %60 = tail call double @cos(double noundef %1) #3
  %61 = tail call double @llvm.experimental.constrained.fsub.f64(double %59, double %60, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %62

62:                                               ; preds = %58, %53, %48, %43
  %63 = phi double [ %61, %58 ], [ %56, %53 ], [ %52, %48 ], [ %47, %43 ]
  %64 = tail call double @llvm.experimental.constrained.fmul.f64(double 0x3FE20DD750429B6D, double %63, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %65 = tail call double @sqrt(double noundef %1) #3
  %66 = tail call double @llvm.experimental.constrained.fdiv.f64(double %64, double %65, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %90

67:                                               ; preds = %39
  %68 = tail call double @y0(double noundef %1) #3
  %69 = tail call double @y1(double noundef %1) #3
  %70 = bitcast double %69 to i64
  %71 = icmp sgt i32 %32, 0
  %72 = and i64 %70, -4294967296
  %73 = icmp ne i64 %72, -4503599627370496
  %74 = select i1 %71, i1 %73, i1 false
  br i1 %74, label %75, label %90

75:                                               ; preds = %67, %75
  %76 = phi double [ %84, %75 ], [ %69, %67 ]
  %77 = phi double [ %76, %75 ], [ %68, %67 ]
  %78 = phi i32 [ %79, %75 ], [ 0, %67 ]
  %79 = add nuw nsw i32 %78, 1
  %80 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %79, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %81 = tail call double @llvm.experimental.constrained.fmul.f64(double 2.000000e+00, double %80, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %82 = tail call double @llvm.experimental.constrained.fdiv.f64(double %81, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %83 = fneg double %77
  %84 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %82, double %76, double %83, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %85 = bitcast double %84 to i64
  %86 = icmp slt i32 %79, %32
  %87 = and i64 %85, -4294967296
  %88 = icmp ne i64 %87, -4503599627370496
  %89 = select i1 %86, i1 %88, i1 false
  br i1 %89, label %75, label %90

90:                                               ; preds = %75, %67, %62
  %91 = phi double [ %66, %62 ], [ %69, %67 ], [ %84, %75 ]
  %92 = icmp eq i32 %31, 0
  %93 = fneg double %91
  %94 = select i1 %92, double %91, double %93
  br label %95

95:                                               ; preds = %34, %20, %2, %90, %24, %17
  %96 = phi double [ %19, %17 ], [ %25, %24 ], [ %94, %90 ], [ %1, %2 ], [ 0.000000e+00, %20 ], [ %38, %34 ]
  ret double %96
}

; Function Attrs: optsize
declare double @y0(double noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare double @y1(double noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
