; ModuleID = 'src/math/jnf.c'
source_filename = "src/math/jnf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define float @jnf(i32 noundef %0, float noundef %1) local_unnamed_addr #0 {
  %3 = bitcast float %1 to i32
  %4 = and i32 %3, 2147483647
  %5 = icmp ugt i32 %4, 2139095040
  br i1 %5, label %159, label %6

6:                                                ; preds = %2
  %7 = icmp eq i32 %0, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %6
  %9 = tail call float @j0f(float noundef %1) #3
  br label %159

10:                                               ; preds = %6
  %11 = icmp slt i32 %0, 0
  %12 = xor i32 %0, -1
  %13 = fneg float %1
  %14 = add nsw i32 %0, -1
  %15 = select i1 %11, i32 %12, i32 %14
  %16 = select i1 %11, float %13, float %1
  %17 = icmp eq i32 %15, 0
  br i1 %17, label %18, label %20

18:                                               ; preds = %10
  %19 = tail call float @j1f(float noundef %16) #3
  br label %159

20:                                               ; preds = %10
  %21 = xor i32 %3, %0
  %22 = lshr i32 %21, 31
  %23 = and i32 %22, %0
  %24 = tail call float @fabsf(float noundef %16) #3
  switch i32 %3, label %25 [
    i32 -8388608, label %154
    i32 -2147483648, label %154
    i32 2139095040, label %154
    i32 0, label %154
  ]

25:                                               ; preds = %20
  %26 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 %15, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %27 = tail call i1 @llvm.experimental.constrained.fcmps.f32(float %26, float %24, metadata !"olt", metadata !"fpexcept.ignore") #4
  br i1 %27, label %28, label %43

28:                                               ; preds = %25
  %29 = tail call float @j0f(float noundef %24) #3
  %30 = tail call float @j1f(float noundef %24) #3
  %31 = icmp sgt i32 %15, 0
  br i1 %31, label %32, label %154

32:                                               ; preds = %28, %32
  %33 = phi float [ %41, %32 ], [ %30, %28 ]
  %34 = phi float [ %33, %32 ], [ %29, %28 ]
  %35 = phi i32 [ %36, %32 ], [ 0, %28 ]
  %36 = add nuw nsw i32 %35, 1
  %37 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 %36, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %38 = tail call float @llvm.experimental.constrained.fmul.f32(float 2.000000e+00, float %37, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %39 = tail call float @llvm.experimental.constrained.fdiv.f32(float %38, float %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %40 = fneg float %34
  %41 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %33, float %39, float %40, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %42 = icmp eq i32 %36, %15
  br i1 %42, label %154, label %32

43:                                               ; preds = %25
  %44 = icmp ult i32 %4, 897581056
  br i1 %44, label %45, label %65

45:                                               ; preds = %43
  %46 = icmp slt i32 %15, 8
  %47 = select i1 %46, i32 %15, i32 8
  %48 = tail call float @llvm.experimental.constrained.fmul.f32(float 5.000000e-01, float %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %49 = icmp slt i32 %47, 1
  br i1 %49, label %61, label %50

50:                                               ; preds = %45
  %51 = add nsw i32 %47, 1
  br label %52

52:                                               ; preds = %50, %52
  %53 = phi float [ %58, %52 ], [ %48, %50 ]
  %54 = phi float [ %57, %52 ], [ 1.000000e+00, %50 ]
  %55 = phi i32 [ %59, %52 ], [ 2, %50 ]
  %56 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 %55, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %57 = tail call float @llvm.experimental.constrained.fmul.f32(float %54, float %56, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %58 = tail call float @llvm.experimental.constrained.fmul.f32(float %53, float %48, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %59 = add nuw nsw i32 %55, 1
  %60 = icmp eq i32 %55, %51
  br i1 %60, label %61, label %52

61:                                               ; preds = %52, %45
  %62 = phi float [ 1.000000e+00, %45 ], [ %57, %52 ]
  %63 = phi float [ %48, %45 ], [ %58, %52 ]
  %64 = tail call float @llvm.experimental.constrained.fdiv.f32(float %63, float %62, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %154

65:                                               ; preds = %43
  %66 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 %15, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %67 = tail call float @llvm.experimental.constrained.fadd.f32(float %66, float 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %68 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %69 = tail call float @llvm.experimental.constrained.fmul.f32(float %68, float %67, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %70 = tail call float @llvm.experimental.constrained.fdiv.f32(float %69, float %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %71 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %72 = tail call float @llvm.experimental.constrained.fdiv.f32(float %71, float %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %73 = tail call float @llvm.experimental.constrained.fadd.f32(float %70, float %72, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %74 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %70, float %73, float -1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %75 = tail call i1 @llvm.experimental.constrained.fcmps.f32(float %74, float 1.000000e+04, metadata !"olt", metadata !"fpexcept.ignore") #4
  br i1 %75, label %76, label %86

76:                                               ; preds = %65, %76
  %77 = phi i32 [ %81, %76 ], [ 1, %65 ]
  %78 = phi float [ %82, %76 ], [ %73, %65 ]
  %79 = phi float [ %84, %76 ], [ %74, %65 ]
  %80 = phi float [ %79, %76 ], [ %70, %65 ]
  %81 = add nuw nsw i32 %77, 1
  %82 = tail call float @llvm.experimental.constrained.fadd.f32(float %78, float %72, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %83 = fneg float %80
  %84 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %82, float %79, float %83, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %85 = tail call i1 @llvm.experimental.constrained.fcmps.f32(float %84, float 1.000000e+04, metadata !"olt", metadata !"fpexcept.ignore") #4
  br i1 %85, label %76, label %86

86:                                               ; preds = %76, %65
  %87 = phi i32 [ 1, %65 ], [ %81, %76 ]
  br label %88

88:                                               ; preds = %86, %88
  %89 = phi float [ %97, %88 ], [ 0.000000e+00, %86 ]
  %90 = phi i32 [ %98, %88 ], [ %87, %86 ]
  %91 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %92 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 %90, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %93 = tail call float @llvm.experimental.constrained.fadd.f32(float %92, float %67, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %94 = tail call float @llvm.experimental.constrained.fmul.f32(float %91, float %93, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %95 = tail call float @llvm.experimental.constrained.fdiv.f32(float %94, float %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %96 = tail call float @llvm.experimental.constrained.fsub.f32(float %95, float %89, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %97 = tail call float @llvm.experimental.constrained.fdiv.f32(float 1.000000e+00, float %96, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %98 = add nsw i32 %90, -1
  %99 = icmp eq i32 %90, 0
  br i1 %99, label %100, label %88

100:                                              ; preds = %88
  %101 = tail call float @fabsf(float noundef %70) #3
  %102 = tail call float @logf(float noundef %101) #3
  %103 = tail call float @llvm.experimental.constrained.fmul.f32(float %67, float %102, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %104 = tail call i1 @llvm.experimental.constrained.fcmps.f32(float %103, float 0x40562E3000000000, metadata !"olt", metadata !"fpexcept.ignore") #4
  %105 = icmp sgt i32 %15, 0
  br i1 %104, label %107, label %106

106:                                              ; preds = %100
  br i1 %105, label %119, label %139

107:                                              ; preds = %100
  br i1 %105, label %108, label %139

108:                                              ; preds = %107, %108
  %109 = phi float [ %116, %108 ], [ 1.000000e+00, %107 ]
  %110 = phi float [ %109, %108 ], [ %97, %107 ]
  %111 = phi i32 [ %117, %108 ], [ %15, %107 ]
  %112 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 %111, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %113 = tail call float @llvm.experimental.constrained.fmul.f32(float 2.000000e+00, float %112, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %114 = tail call float @llvm.experimental.constrained.fmul.f32(float %113, float %109, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %115 = tail call float @llvm.experimental.constrained.fdiv.f32(float %114, float %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %116 = tail call float @llvm.experimental.constrained.fsub.f32(float %115, float %110, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %117 = add nsw i32 %111, -1
  %118 = icmp ugt i32 %111, 1
  br i1 %118, label %108, label %139

119:                                              ; preds = %106, %133
  %120 = phi float [ %136, %133 ], [ %97, %106 ]
  %121 = phi float [ %135, %133 ], [ 1.000000e+00, %106 ]
  %122 = phi float [ %134, %133 ], [ %97, %106 ]
  %123 = phi i32 [ %137, %133 ], [ %15, %106 ]
  %124 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 %123, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %125 = tail call float @llvm.experimental.constrained.fmul.f32(float 2.000000e+00, float %124, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %126 = tail call float @llvm.experimental.constrained.fmul.f32(float %125, float %121, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %127 = tail call float @llvm.experimental.constrained.fdiv.f32(float %126, float %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %128 = tail call float @llvm.experimental.constrained.fsub.f32(float %127, float %122, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %129 = tail call i1 @llvm.experimental.constrained.fcmps.f32(float %128, float 0x43B0000000000000, metadata !"ogt", metadata !"fpexcept.ignore") #4
  br i1 %129, label %130, label %133

130:                                              ; preds = %119
  %131 = tail call float @llvm.experimental.constrained.fdiv.f32(float %121, float %128, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %132 = tail call float @llvm.experimental.constrained.fdiv.f32(float %120, float %128, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %133

133:                                              ; preds = %119, %130
  %134 = phi float [ %131, %130 ], [ %121, %119 ]
  %135 = phi float [ 1.000000e+00, %130 ], [ %128, %119 ]
  %136 = phi float [ %132, %130 ], [ %120, %119 ]
  %137 = add nsw i32 %123, -1
  %138 = icmp sgt i32 %123, 1
  br i1 %138, label %119, label %139

139:                                              ; preds = %133, %108, %106, %107
  %140 = phi float [ %97, %107 ], [ %97, %106 ], [ %109, %108 ], [ %134, %133 ]
  %141 = phi float [ 1.000000e+00, %107 ], [ 1.000000e+00, %106 ], [ %116, %108 ], [ %135, %133 ]
  %142 = phi float [ %97, %107 ], [ %97, %106 ], [ %97, %108 ], [ %136, %133 ]
  %143 = tail call float @j0f(float noundef %24) #3
  %144 = tail call float @j1f(float noundef %24) #3
  %145 = tail call float @fabsf(float noundef %143) #3
  %146 = tail call float @fabsf(float noundef %144) #3
  %147 = tail call i1 @llvm.experimental.constrained.fcmps.f32(float %145, float %146, metadata !"oge", metadata !"fpexcept.ignore") #4
  br i1 %147, label %148, label %151

148:                                              ; preds = %139
  %149 = tail call float @llvm.experimental.constrained.fmul.f32(float %142, float %143, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %150 = tail call float @llvm.experimental.constrained.fdiv.f32(float %149, float %141, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %154

151:                                              ; preds = %139
  %152 = tail call float @llvm.experimental.constrained.fmul.f32(float %142, float %144, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %153 = tail call float @llvm.experimental.constrained.fdiv.f32(float %152, float %140, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %154

154:                                              ; preds = %32, %28, %148, %151, %20, %20, %20, %20, %61
  %155 = phi float [ %64, %61 ], [ 0.000000e+00, %20 ], [ 0.000000e+00, %20 ], [ 0.000000e+00, %20 ], [ 0.000000e+00, %20 ], [ %150, %148 ], [ %153, %151 ], [ %30, %28 ], [ %41, %32 ]
  %156 = icmp eq i32 %23, 0
  %157 = fneg float %155
  %158 = select i1 %156, float %155, float %157
  br label %159

159:                                              ; preds = %2, %154, %18, %8
  %160 = phi float [ %9, %8 ], [ %19, %18 ], [ %158, %154 ], [ %1, %2 ]
  ret float %160
}

; Function Attrs: optsize
declare float @j0f(float noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare float @j1f(float noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare float @fabsf(float noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmuladd.f32(float, float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #2

; Function Attrs: optsize
declare float @logf(float noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define float @ynf(i32 noundef %0, float noundef %1) local_unnamed_addr #0 {
  %3 = bitcast float %1 to i32
  %4 = and i32 %3, 2147483647
  %5 = icmp ugt i32 %4, 2139095040
  br i1 %5, label %58, label %6

6:                                                ; preds = %2
  %7 = icmp slt i32 %3, 0
  %8 = icmp ne i32 %4, 0
  %9 = and i1 %7, %8
  br i1 %9, label %10, label %13

10:                                               ; preds = %6
  %11 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %12 = tail call float @llvm.experimental.constrained.fdiv.f32(float %11, float 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %58

13:                                               ; preds = %6
  %14 = icmp eq i32 %4, 2139095040
  br i1 %14, label %58, label %15

15:                                               ; preds = %13
  %16 = icmp eq i32 %0, 0
  br i1 %16, label %17, label %19

17:                                               ; preds = %15
  %18 = tail call float @y0f(float noundef %1) #3
  br label %58

19:                                               ; preds = %15
  %20 = icmp slt i32 %0, 0
  %21 = xor i32 %0, -1
  %22 = and i32 %0, 1
  %23 = add nsw i32 %0, -1
  %24 = select i1 %20, i32 %22, i32 0
  %25 = select i1 %20, i32 %21, i32 %23
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %32

27:                                               ; preds = %19
  %28 = icmp eq i32 %24, 0
  %29 = tail call float @y1f(float noundef %1) #3
  %30 = fneg float %29
  %31 = select i1 %28, float %29, float %30
  br label %58

32:                                               ; preds = %19
  %33 = tail call float @y0f(float noundef %1) #3
  %34 = tail call float @y1f(float noundef %1) #3
  %35 = bitcast float %34 to i32
  %36 = icmp sgt i32 %25, 0
  %37 = icmp ne i32 %35, -8388608
  %38 = select i1 %36, i1 %37, i1 false
  br i1 %38, label %39, label %53

39:                                               ; preds = %32, %39
  %40 = phi float [ %48, %39 ], [ %34, %32 ]
  %41 = phi float [ %40, %39 ], [ %33, %32 ]
  %42 = phi i32 [ %43, %39 ], [ 0, %32 ]
  %43 = add nuw nsw i32 %42, 1
  %44 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 %43, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %45 = tail call float @llvm.experimental.constrained.fmul.f32(float 2.000000e+00, float %44, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %46 = tail call float @llvm.experimental.constrained.fdiv.f32(float %45, float %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %47 = fneg float %41
  %48 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %46, float %40, float %47, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %49 = bitcast float %48 to i32
  %50 = icmp slt i32 %43, %25
  %51 = icmp ne i32 %49, -8388608
  %52 = select i1 %50, i1 %51, i1 false
  br i1 %52, label %39, label %53

53:                                               ; preds = %39, %32
  %54 = phi float [ %34, %32 ], [ %48, %39 ]
  %55 = icmp eq i32 %24, 0
  %56 = fneg float %54
  %57 = select i1 %55, float %54, float %56
  br label %58

58:                                               ; preds = %27, %13, %2, %53, %17, %10
  %59 = phi float [ %12, %10 ], [ %18, %17 ], [ %57, %53 ], [ %1, %2 ], [ 0.000000e+00, %13 ], [ %31, %27 ]
  ret float %59
}

; Function Attrs: optsize
declare float @y0f(float noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare float @y1f(float noundef) local_unnamed_addr #1

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
