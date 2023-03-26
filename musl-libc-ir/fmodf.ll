; ModuleID = 'src/math/fmodf.c'
source_filename = "src/math/fmodf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nosync nounwind optsize strictfp
define float @fmodf(float noundef %0, float noundef %1) local_unnamed_addr #0 {
  %3 = bitcast float %0 to i32
  %4 = lshr i32 %3, 23
  %5 = and i32 %4, 255
  %6 = bitcast float %1 to i32
  %7 = lshr i32 %6, 23
  %8 = and i32 %7, 255
  %9 = and i32 %3, -2147483648
  %10 = shl i32 %6, 1
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %17, label %12

12:                                               ; preds = %2
  %13 = and i32 %6, 2147483647
  %14 = icmp ugt i32 %13, 2139095040
  %15 = icmp eq i32 %5, 255
  %16 = or i1 %14, %15
  br i1 %16, label %17, label %21

17:                                               ; preds = %12, %2
  %18 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %19 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %20 = tail call float @llvm.experimental.constrained.fdiv.f32(float %18, float %19, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %120

21:                                               ; preds = %12
  %22 = shl i32 %3, 1
  %23 = icmp ugt i32 %22, %10
  br i1 %23, label %29, label %24

24:                                               ; preds = %21
  %25 = icmp eq i32 %22, %10
  br i1 %25, label %26, label %120

26:                                               ; preds = %24
  %27 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %28 = tail call float @llvm.experimental.constrained.fmul.f32(float %27, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %120

29:                                               ; preds = %21
  %30 = icmp eq i32 %5, 0
  br i1 %30, label %31, label %44

31:                                               ; preds = %29
  %32 = shl i32 %3, 9
  %33 = icmp sgt i32 %32, -1
  br i1 %33, label %34, label %40

34:                                               ; preds = %31, %34
  %35 = phi i32 [ %38, %34 ], [ %32, %31 ]
  %36 = phi i32 [ %37, %34 ], [ 0, %31 ]
  %37 = add nsw i32 %36, -1
  %38 = shl nuw i32 %35, 1
  %39 = icmp sgt i32 %38, -1
  br i1 %39, label %34, label %40

40:                                               ; preds = %34, %31
  %41 = phi i32 [ 0, %31 ], [ %37, %34 ]
  %42 = sub i32 1, %41
  %43 = shl i32 %3, %42
  br label %47

44:                                               ; preds = %29
  %45 = and i32 %3, 8388607
  %46 = or i32 %45, 8388608
  br label %47

47:                                               ; preds = %44, %40
  %48 = phi i32 [ %5, %44 ], [ %41, %40 ]
  %49 = phi i32 [ %46, %44 ], [ %43, %40 ]
  %50 = icmp eq i32 %8, 0
  br i1 %50, label %51, label %64

51:                                               ; preds = %47
  %52 = shl i32 %6, 9
  %53 = icmp sgt i32 %52, -1
  br i1 %53, label %54, label %60

54:                                               ; preds = %51, %54
  %55 = phi i32 [ %58, %54 ], [ %52, %51 ]
  %56 = phi i32 [ %57, %54 ], [ 0, %51 ]
  %57 = add nsw i32 %56, -1
  %58 = shl nuw i32 %55, 1
  %59 = icmp sgt i32 %58, -1
  br i1 %59, label %54, label %60

60:                                               ; preds = %54, %51
  %61 = phi i32 [ 0, %51 ], [ %57, %54 ]
  %62 = sub i32 1, %61
  %63 = shl i32 %6, %62
  br label %67

64:                                               ; preds = %47
  %65 = and i32 %6, 8388607
  %66 = or i32 %65, 8388608
  br label %67

67:                                               ; preds = %64, %60
  %68 = phi i32 [ %66, %64 ], [ %63, %60 ]
  %69 = phi i32 [ %8, %64 ], [ %61, %60 ]
  %70 = icmp sgt i32 %48, %69
  br i1 %70, label %71, label %86

71:                                               ; preds = %67, %81
  %72 = phi i32 [ %83, %81 ], [ %49, %67 ]
  %73 = phi i32 [ %84, %81 ], [ %48, %67 ]
  %74 = sub i32 %72, %68
  %75 = icmp sgt i32 %74, -1
  br i1 %75, label %76, label %81

76:                                               ; preds = %71
  %77 = icmp eq i32 %74, 0
  br i1 %77, label %78, label %81

78:                                               ; preds = %76
  %79 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %80 = tail call float @llvm.experimental.constrained.fmul.f32(float %79, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %120

81:                                               ; preds = %76, %71
  %82 = phi i32 [ %72, %71 ], [ %74, %76 ]
  %83 = shl i32 %82, 1
  %84 = add nsw i32 %73, -1
  %85 = icmp sgt i32 %84, %69
  br i1 %85, label %71, label %86

86:                                               ; preds = %81, %67
  %87 = phi i32 [ %48, %67 ], [ %69, %81 ]
  %88 = phi i32 [ %49, %67 ], [ %83, %81 ]
  %89 = sub i32 %88, %68
  %90 = icmp sgt i32 %89, -1
  br i1 %90, label %91, label %96

91:                                               ; preds = %86
  %92 = icmp eq i32 %89, 0
  br i1 %92, label %93, label %96

93:                                               ; preds = %91
  %94 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %95 = tail call float @llvm.experimental.constrained.fmul.f32(float %94, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %120

96:                                               ; preds = %91, %86
  %97 = phi i32 [ %88, %86 ], [ %89, %91 ]
  %98 = icmp ult i32 %97, 8388608
  br i1 %98, label %99, label %105

99:                                               ; preds = %96, %99
  %100 = phi i32 [ %102, %99 ], [ %97, %96 ]
  %101 = phi i32 [ %103, %99 ], [ %87, %96 ]
  %102 = shl nuw nsw i32 %100, 1
  %103 = add nsw i32 %101, -1
  %104 = icmp ult i32 %100, 4194304
  br i1 %104, label %99, label %105

105:                                              ; preds = %99, %96
  %106 = phi i32 [ %87, %96 ], [ %103, %99 ]
  %107 = phi i32 [ %97, %96 ], [ %102, %99 ]
  %108 = icmp sgt i32 %106, 0
  br i1 %108, label %109, label %113

109:                                              ; preds = %105
  %110 = add i32 %107, -8388608
  %111 = shl i32 %106, 23
  %112 = or i32 %110, %111
  br label %116

113:                                              ; preds = %105
  %114 = sub i32 1, %106
  %115 = lshr i32 %107, %114
  br label %116

116:                                              ; preds = %113, %109
  %117 = phi i32 [ %112, %109 ], [ %115, %113 ]
  %118 = or i32 %117, %9
  %119 = bitcast i32 %118 to float
  br label %120

120:                                              ; preds = %24, %116, %93, %78, %26, %17
  %121 = phi float [ %20, %17 ], [ %28, %26 ], [ %80, %78 ], [ %95, %93 ], [ %119, %116 ], [ %0, %24 ]
  ret float %121
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #1

attributes #0 = { nofree nosync nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
