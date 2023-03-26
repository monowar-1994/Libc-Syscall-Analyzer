; ModuleID = 'src/complex/ccosh.c'
source_filename = "src/complex/ccosh.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define { double, double } @ccosh(double noundef %0, double noundef %1) local_unnamed_addr #0 {
  %3 = bitcast double %0 to i64
  %4 = lshr i64 %3, 32
  %5 = trunc i64 %4 to i32
  %6 = trunc i64 %3 to i32
  %7 = bitcast double %1 to i64
  %8 = lshr i64 %7, 32
  %9 = trunc i64 %8 to i32
  %10 = trunc i64 %7 to i32
  %11 = and i32 %5, 2147483647
  %12 = and i32 %9, 2147483647
  %13 = icmp ult i32 %11, 2146435072
  %14 = icmp ult i32 %12, 2146435072
  %15 = and i1 %13, %14
  br i1 %15, label %16, label %59

16:                                               ; preds = %2
  %17 = or i32 %12, %10
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %22

19:                                               ; preds = %16
  %20 = tail call double @cosh(double noundef %0) #3
  %21 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %116

22:                                               ; preds = %16
  %23 = icmp ult i32 %11, 1077280768
  br i1 %23, label %24, label %31

24:                                               ; preds = %22
  %25 = tail call double @cosh(double noundef %0) #3
  %26 = tail call double @cos(double noundef %1) #3
  %27 = tail call double @llvm.experimental.constrained.fmul.f64(double %25, double %26, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %28 = tail call double @sinh(double noundef %0) #3
  %29 = tail call double @sin(double noundef %1) #3
  %30 = tail call double @llvm.experimental.constrained.fmul.f64(double %28, double %29, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %116

31:                                               ; preds = %22
  %32 = icmp ult i32 %11, 1082535490
  br i1 %32, label %33, label %42

33:                                               ; preds = %31
  %34 = tail call double @fabs(double noundef %0) #3
  %35 = tail call double @exp(double noundef %34) #3
  %36 = tail call double @llvm.experimental.constrained.fmul.f64(double %35, double 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %37 = tail call double @cos(double noundef %1) #3
  %38 = tail call double @llvm.experimental.constrained.fmul.f64(double %36, double %37, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %39 = tail call double @copysign(double noundef %36, double noundef %0) #3
  %40 = tail call double @sin(double noundef %1) #3
  %41 = tail call double @llvm.experimental.constrained.fmul.f64(double %39, double %40, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %116

42:                                               ; preds = %31
  %43 = icmp ult i32 %11, 1083620266
  br i1 %43, label %44, label %52

44:                                               ; preds = %42
  %45 = tail call double @fabs(double noundef %0) #3
  %46 = tail call { double, double } @__ldexp_cexp(double noundef %45, double noundef %1, i32 noundef -1) #3
  %47 = extractvalue { double, double } %46, 0
  %48 = extractvalue { double, double } %46, 1
  %49 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %50 = tail call double @copysign(double noundef %49, double noundef %0) #3
  %51 = tail call double @llvm.experimental.constrained.fmul.f64(double %48, double %50, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %116

52:                                               ; preds = %42
  %53 = tail call double @llvm.experimental.constrained.fmul.f64(double 0x7FE0000000000000, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %54 = tail call double @llvm.experimental.constrained.fmul.f64(double %53, double %53, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %55 = tail call double @cos(double noundef %1) #3
  %56 = tail call double @llvm.experimental.constrained.fmul.f64(double %54, double %55, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %57 = tail call double @sin(double noundef %1) #3
  %58 = tail call double @llvm.experimental.constrained.fmul.f64(double %53, double %57, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %116

59:                                               ; preds = %2
  %60 = or i32 %11, %6
  %61 = icmp eq i32 %60, 0
  %62 = icmp ugt i32 %12, 2146435071
  %63 = and i1 %61, %62
  br i1 %63, label %64, label %70

64:                                               ; preds = %59
  %65 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %66 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %67 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %68 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %67, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %69 = tail call double @copysign(double noundef %66, double noundef %68) #3
  br label %116

70:                                               ; preds = %59
  %71 = or i32 %12, %10
  %72 = icmp eq i32 %71, 0
  %73 = icmp ugt i32 %11, 2146435071
  %74 = and i1 %73, %72
  br i1 %74, label %75, label %88

75:                                               ; preds = %70
  %76 = and i32 %5, 1048575
  %77 = or i32 %76, %6
  %78 = icmp eq i32 %77, 0
  %79 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %80 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br i1 %78, label %81, label %84

81:                                               ; preds = %75
  %82 = tail call double @copysign(double noundef %80, double noundef %0) #3
  %83 = tail call double @llvm.experimental.constrained.fmul.f64(double %82, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %116

84:                                               ; preds = %75
  %85 = tail call double @llvm.experimental.constrained.fadd.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %86 = tail call double @llvm.experimental.constrained.fmul.f64(double %85, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %87 = tail call double @copysign(double noundef %80, double noundef %86) #3
  br label %116

88:                                               ; preds = %70
  %89 = and i1 %13, %62
  br i1 %89, label %90, label %94

90:                                               ; preds = %88
  %91 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %92 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %93 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %92, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %116

94:                                               ; preds = %88
  br i1 %73, label %95, label %109

95:                                               ; preds = %94
  %96 = and i32 %5, 1048575
  %97 = or i32 %96, %6
  %98 = icmp eq i32 %97, 0
  br i1 %98, label %99, label %109

99:                                               ; preds = %95
  %100 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br i1 %62, label %101, label %104

101:                                              ; preds = %99
  %102 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %103 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %102, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %116

104:                                              ; preds = %99
  %105 = tail call double @cos(double noundef %1) #3
  %106 = tail call double @llvm.experimental.constrained.fmul.f64(double %100, double %105, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %107 = tail call double @sin(double noundef %1) #3
  %108 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %107, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %116

109:                                              ; preds = %95, %94
  %110 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %111 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %112 = tail call double @llvm.experimental.constrained.fmul.f64(double %110, double %111, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %113 = tail call double @llvm.experimental.constrained.fadd.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %114 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %115 = tail call double @llvm.experimental.constrained.fmul.f64(double %113, double %114, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %116

116:                                              ; preds = %109, %104, %101, %90, %84, %81, %64, %52, %44, %33, %24, %19
  %117 = phi double [ %20, %19 ], [ %27, %24 ], [ %38, %33 ], [ %47, %44 ], [ %56, %52 ], [ %65, %64 ], [ %79, %81 ], [ %79, %84 ], [ %91, %90 ], [ %100, %101 ], [ %106, %104 ], [ %112, %109 ]
  %118 = phi double [ %21, %19 ], [ %30, %24 ], [ %41, %33 ], [ %51, %44 ], [ %58, %52 ], [ %69, %64 ], [ %83, %81 ], [ %87, %84 ], [ %93, %90 ], [ %103, %101 ], [ %108, %104 ], [ %115, %109 ]
  %119 = insertvalue { double, double } poison, double %117, 0
  %120 = insertvalue { double, double } %119, double %118, 1
  ret { double, double } %120
}

; Function Attrs: optsize
declare double @cosh(double noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

; Function Attrs: optsize
declare double @cos(double noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare double @sinh(double noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare double @sin(double noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare double @exp(double noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare double @fabs(double noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare double @copysign(double noundef, double noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden { double, double } @__ldexp_cexp(double noundef, double noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

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
