; ModuleID = 'src/math/fmod.c'
source_filename = "src/math/fmod.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nosync nounwind optsize strictfp
define double @fmod(double noundef %0, double noundef %1) local_unnamed_addr #0 {
  %3 = bitcast double %0 to i64
  %4 = lshr i64 %3, 52
  %5 = trunc i64 %4 to i32
  %6 = and i32 %5, 2047
  %7 = bitcast double %1 to i64
  %8 = lshr i64 %7, 52
  %9 = trunc i64 %8 to i32
  %10 = and i32 %9, 2047
  %11 = and i64 %3, -9223372036854775808
  %12 = shl i64 %7, 1
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %19, label %14

14:                                               ; preds = %2
  %15 = and i64 %7, 9223372036854775807
  %16 = icmp ugt i64 %15, 9218868437227405312
  %17 = icmp eq i32 %6, 2047
  %18 = or i1 %16, %17
  br i1 %18, label %19, label %23

19:                                               ; preds = %14, %2
  %20 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %21 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %22 = tail call double @llvm.experimental.constrained.fdiv.f64(double %20, double %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %126

23:                                               ; preds = %14
  %24 = shl i64 %3, 1
  %25 = icmp ugt i64 %24, %12
  br i1 %25, label %31, label %26

26:                                               ; preds = %23
  %27 = icmp eq i64 %24, %12
  br i1 %27, label %28, label %126

28:                                               ; preds = %26
  %29 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %30 = tail call double @llvm.experimental.constrained.fmul.f64(double %29, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %126

31:                                               ; preds = %23
  %32 = icmp eq i32 %6, 0
  br i1 %32, label %33, label %47

33:                                               ; preds = %31
  %34 = shl i64 %3, 12
  %35 = icmp sgt i64 %34, -1
  br i1 %35, label %36, label %42

36:                                               ; preds = %33, %36
  %37 = phi i64 [ %40, %36 ], [ %34, %33 ]
  %38 = phi i32 [ %39, %36 ], [ 0, %33 ]
  %39 = add nsw i32 %38, -1
  %40 = shl nuw i64 %37, 1
  %41 = icmp sgt i64 %40, -1
  br i1 %41, label %36, label %42

42:                                               ; preds = %36, %33
  %43 = phi i32 [ 0, %33 ], [ %39, %36 ]
  %44 = sub i32 1, %43
  %45 = zext i32 %44 to i64
  %46 = shl i64 %3, %45
  br label %50

47:                                               ; preds = %31
  %48 = and i64 %3, 4503599627370495
  %49 = or i64 %48, 4503599627370496
  br label %50

50:                                               ; preds = %47, %42
  %51 = phi i32 [ %6, %47 ], [ %43, %42 ]
  %52 = phi i64 [ %49, %47 ], [ %46, %42 ]
  %53 = icmp eq i32 %10, 0
  br i1 %53, label %54, label %68

54:                                               ; preds = %50
  %55 = shl i64 %7, 12
  %56 = icmp sgt i64 %55, -1
  br i1 %56, label %57, label %63

57:                                               ; preds = %54, %57
  %58 = phi i64 [ %61, %57 ], [ %55, %54 ]
  %59 = phi i32 [ %60, %57 ], [ 0, %54 ]
  %60 = add nsw i32 %59, -1
  %61 = shl nuw i64 %58, 1
  %62 = icmp sgt i64 %61, -1
  br i1 %62, label %57, label %63

63:                                               ; preds = %57, %54
  %64 = phi i32 [ 0, %54 ], [ %60, %57 ]
  %65 = sub i32 1, %64
  %66 = zext i32 %65 to i64
  %67 = shl i64 %7, %66
  br label %71

68:                                               ; preds = %50
  %69 = and i64 %7, 4503599627370495
  %70 = or i64 %69, 4503599627370496
  br label %71

71:                                               ; preds = %68, %63
  %72 = phi i64 [ %70, %68 ], [ %67, %63 ]
  %73 = phi i32 [ %10, %68 ], [ %64, %63 ]
  %74 = icmp sgt i32 %51, %73
  br i1 %74, label %75, label %90

75:                                               ; preds = %71, %85
  %76 = phi i64 [ %87, %85 ], [ %52, %71 ]
  %77 = phi i32 [ %88, %85 ], [ %51, %71 ]
  %78 = sub i64 %76, %72
  %79 = icmp sgt i64 %78, -1
  br i1 %79, label %80, label %85

80:                                               ; preds = %75
  %81 = icmp eq i64 %78, 0
  br i1 %81, label %82, label %85

82:                                               ; preds = %80
  %83 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %84 = tail call double @llvm.experimental.constrained.fmul.f64(double %83, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %126

85:                                               ; preds = %80, %75
  %86 = phi i64 [ %76, %75 ], [ %78, %80 ]
  %87 = shl i64 %86, 1
  %88 = add nsw i32 %77, -1
  %89 = icmp sgt i32 %88, %73
  br i1 %89, label %75, label %90

90:                                               ; preds = %85, %71
  %91 = phi i32 [ %51, %71 ], [ %73, %85 ]
  %92 = phi i64 [ %52, %71 ], [ %87, %85 ]
  %93 = sub i64 %92, %72
  %94 = icmp sgt i64 %93, -1
  br i1 %94, label %95, label %100

95:                                               ; preds = %90
  %96 = icmp eq i64 %93, 0
  br i1 %96, label %97, label %100

97:                                               ; preds = %95
  %98 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %99 = tail call double @llvm.experimental.constrained.fmul.f64(double %98, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %126

100:                                              ; preds = %95, %90
  %101 = phi i64 [ %92, %90 ], [ %93, %95 ]
  %102 = icmp ult i64 %101, 4503599627370496
  br i1 %102, label %103, label %109

103:                                              ; preds = %100, %103
  %104 = phi i64 [ %106, %103 ], [ %101, %100 ]
  %105 = phi i32 [ %107, %103 ], [ %91, %100 ]
  %106 = shl nuw nsw i64 %104, 1
  %107 = add nsw i32 %105, -1
  %108 = icmp ult i64 %104, 2251799813685248
  br i1 %108, label %103, label %109

109:                                              ; preds = %103, %100
  %110 = phi i32 [ %91, %100 ], [ %107, %103 ]
  %111 = phi i64 [ %101, %100 ], [ %106, %103 ]
  %112 = icmp sgt i32 %110, 0
  br i1 %112, label %113, label %118

113:                                              ; preds = %109
  %114 = add i64 %111, -4503599627370496
  %115 = zext i32 %110 to i64
  %116 = shl i64 %115, 52
  %117 = or i64 %114, %116
  br label %122

118:                                              ; preds = %109
  %119 = sub i32 1, %110
  %120 = zext i32 %119 to i64
  %121 = lshr i64 %111, %120
  br label %122

122:                                              ; preds = %118, %113
  %123 = phi i64 [ %117, %113 ], [ %121, %118 ]
  %124 = or i64 %123, %11
  %125 = bitcast i64 %124 to double
  br label %126

126:                                              ; preds = %26, %122, %97, %82, %28, %19
  %127 = phi double [ %22, %19 ], [ %30, %28 ], [ %84, %82 ], [ %99, %97 ], [ %125, %122 ], [ %0, %26 ]
  ret double %127
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #1

attributes #0 = { nofree nosync nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
