; ModuleID = 'src/complex/csinh.c'
source_filename = "src/complex/csinh.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define { double, double } @csinh(double noundef %0, double noundef %1) local_unnamed_addr #0 {
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
  br i1 %15, label %16, label %58

16:                                               ; preds = %2
  %17 = or i32 %12, %10
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %21

19:                                               ; preds = %16
  %20 = tail call double @sinh(double noundef %0) #3
  br label %110

21:                                               ; preds = %16
  %22 = icmp ult i32 %11, 1077280768
  br i1 %22, label %23, label %30

23:                                               ; preds = %21
  %24 = tail call double @sinh(double noundef %0) #3
  %25 = tail call double @cos(double noundef %1) #3
  %26 = tail call double @llvm.experimental.constrained.fmul.f64(double %24, double %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %27 = tail call double @cosh(double noundef %0) #3
  %28 = tail call double @sin(double noundef %1) #3
  %29 = tail call double @llvm.experimental.constrained.fmul.f64(double %27, double %28, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %110

30:                                               ; preds = %21
  %31 = icmp ult i32 %11, 1082535490
  br i1 %31, label %32, label %41

32:                                               ; preds = %30
  %33 = tail call double @fabs(double noundef %0) #3
  %34 = tail call double @exp(double noundef %33) #3
  %35 = tail call double @llvm.experimental.constrained.fmul.f64(double %34, double 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %36 = tail call double @copysign(double noundef %35, double noundef %0) #3
  %37 = tail call double @cos(double noundef %1) #3
  %38 = tail call double @llvm.experimental.constrained.fmul.f64(double %36, double %37, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %39 = tail call double @sin(double noundef %1) #3
  %40 = tail call double @llvm.experimental.constrained.fmul.f64(double %35, double %39, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %110

41:                                               ; preds = %30
  %42 = icmp ult i32 %11, 1083620266
  br i1 %42, label %43, label %51

43:                                               ; preds = %41
  %44 = tail call double @fabs(double noundef %0) #3
  %45 = tail call { double, double } @__ldexp_cexp(double noundef %44, double noundef %1, i32 noundef -1) #3
  %46 = extractvalue { double, double } %45, 0
  %47 = extractvalue { double, double } %45, 1
  %48 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %49 = tail call double @copysign(double noundef %48, double noundef %0) #3
  %50 = tail call double @llvm.experimental.constrained.fmul.f64(double %46, double %49, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %110

51:                                               ; preds = %41
  %52 = tail call double @llvm.experimental.constrained.fmul.f64(double 0x7FE0000000000000, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %53 = tail call double @cos(double noundef %1) #3
  %54 = tail call double @llvm.experimental.constrained.fmul.f64(double %52, double %53, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %55 = tail call double @llvm.experimental.constrained.fmul.f64(double %52, double %52, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %56 = tail call double @sin(double noundef %1) #3
  %57 = tail call double @llvm.experimental.constrained.fmul.f64(double %55, double %56, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %110

58:                                               ; preds = %2
  %59 = or i32 %11, %6
  %60 = icmp eq i32 %59, 0
  %61 = icmp ugt i32 %12, 2146435071
  %62 = and i1 %60, %61
  br i1 %62, label %63, label %69

63:                                               ; preds = %58
  %64 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %65 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %66 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %65, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %67 = tail call double @copysign(double noundef %64, double noundef %66) #3
  %68 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %110

69:                                               ; preds = %58
  %70 = or i32 %12, %10
  %71 = icmp eq i32 %70, 0
  %72 = icmp ugt i32 %11, 2146435071
  %73 = and i1 %72, %71
  br i1 %73, label %74, label %81

74:                                               ; preds = %69
  %75 = and i32 %5, 1048575
  %76 = or i32 %75, %6
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %110, label %78

78:                                               ; preds = %74
  %79 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %80 = tail call double @copysign(double noundef %79, double noundef %1) #3
  br label %110

81:                                               ; preds = %69
  %82 = and i1 %13, %61
  br i1 %82, label %83, label %87

83:                                               ; preds = %81
  %84 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %85 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %86 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %85, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %110

87:                                               ; preds = %81
  br i1 %72, label %88, label %103

88:                                               ; preds = %87
  %89 = and i32 %5, 1048575
  %90 = or i32 %89, %6
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %92, label %103

92:                                               ; preds = %88
  br i1 %61, label %93, label %97

93:                                               ; preds = %92
  %94 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %95 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %96 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %95, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %110

97:                                               ; preds = %92
  %98 = tail call double @cos(double noundef %1) #3
  %99 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %98, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %100 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x7FF0000000000000, metadata !"fpexcept.ignore") #4
  %101 = tail call double @sin(double noundef %1) #3
  %102 = tail call double @llvm.experimental.constrained.fmul.f64(double %100, double %101, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %110

103:                                              ; preds = %88, %87
  %104 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %105 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %106 = tail call double @llvm.experimental.constrained.fmul.f64(double %104, double %105, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %107 = tail call double @llvm.experimental.constrained.fadd.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %108 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %109 = tail call double @llvm.experimental.constrained.fmul.f64(double %107, double %108, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %110

110:                                              ; preds = %74, %103, %97, %93, %83, %78, %63, %51, %43, %32, %23, %19
  %111 = phi double [ %20, %19 ], [ %26, %23 ], [ %38, %32 ], [ %50, %43 ], [ %54, %51 ], [ %67, %63 ], [ %0, %78 ], [ %84, %83 ], [ %94, %93 ], [ %99, %97 ], [ %106, %103 ], [ %0, %74 ]
  %112 = phi double [ %1, %19 ], [ %29, %23 ], [ %40, %32 ], [ %47, %43 ], [ %57, %51 ], [ %68, %63 ], [ %80, %78 ], [ %86, %83 ], [ %96, %93 ], [ %102, %97 ], [ %109, %103 ], [ %1, %74 ]
  %113 = insertvalue { double, double } poison, double %111, 0
  %114 = insertvalue { double, double } %113, double %112, 1
  ret { double, double } %114
}

; Function Attrs: optsize
declare double @sinh(double noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare double @cos(double noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

; Function Attrs: optsize
declare double @cosh(double noundef) local_unnamed_addr #1

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
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #2

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
