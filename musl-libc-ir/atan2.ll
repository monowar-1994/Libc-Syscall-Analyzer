; ModuleID = 'src/math/atan2.c'
source_filename = "src/math/atan2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@switch.table.atan2 = private unnamed_addr constant [4 x double] [double 0.000000e+00, double -0.000000e+00, double 0x400921FB54442D18, double 0xC00921FB54442D18], align 8

; Function Attrs: nounwind optsize strictfp
define double @atan2(double noundef %0, double noundef %1) local_unnamed_addr #0 {
  %3 = bitcast double %1 to i64
  %4 = and i64 %3, 9223372036854775807
  %5 = icmp ugt i64 %4, 9218868437227405312
  br i1 %5, label %10, label %6

6:                                                ; preds = %2
  %7 = bitcast double %0 to i64
  %8 = and i64 %7, 9223372036854775807
  %9 = icmp ugt i64 %8, 9218868437227405312
  br i1 %9, label %10, label %12

10:                                               ; preds = %6, %2
  %11 = tail call double @llvm.experimental.constrained.fadd.f64(double %1, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %106

12:                                               ; preds = %6
  %13 = lshr i64 %3, 32
  %14 = trunc i64 %13 to i32
  %15 = trunc i64 %3 to i32
  %16 = lshr i64 %7, 32
  %17 = trunc i64 %16 to i32
  %18 = add i32 %14, -1072693248
  %19 = or i32 %18, %15
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %23

21:                                               ; preds = %12
  %22 = tail call double @atan(double noundef %0) #4
  br label %106

23:                                               ; preds = %12
  %24 = trunc i64 %7 to i32
  %25 = lshr i32 %17, 31
  %26 = lshr i32 %14, 30
  %27 = and i32 %26, 2
  %28 = or i32 %27, %25
  %29 = and i32 %14, 2147483647
  %30 = and i32 %17, 2147483647
  %31 = or i32 %30, %24
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %37

33:                                               ; preds = %23
  switch i32 %28, label %36 [
    i32 0, label %106
    i32 1, label %106
    i32 2, label %34
    i32 3, label %35
  ]

34:                                               ; preds = %33
  br label %106

35:                                               ; preds = %33
  br label %106

36:                                               ; preds = %33
  unreachable

37:                                               ; preds = %23
  %38 = or i32 %29, %15
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %47

40:                                               ; preds = %37
  %41 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %42 = tail call double @llvm.experimental.constrained.fdiv.f64(double 0xC00921FB54442D18, double %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %43 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %44 = tail call double @llvm.experimental.constrained.fdiv.f64(double 0x400921FB54442D18, double %43, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %45 = icmp slt i64 %7, 0
  %46 = select i1 %45, double %42, double %44
  br label %106

47:                                               ; preds = %37
  %48 = icmp eq i32 %29, 2146435072
  br i1 %48, label %49, label %69

49:                                               ; preds = %47
  %50 = icmp eq i32 %30, 2146435072
  br i1 %50, label %51, label %102

51:                                               ; preds = %49
  switch i32 %28, label %68 [
    i32 0, label %52
    i32 1, label %55
    i32 2, label %58
    i32 3, label %63
  ]

52:                                               ; preds = %51
  %53 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %54 = tail call double @llvm.experimental.constrained.fdiv.f64(double 0x400921FB54442D18, double %53, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %106

55:                                               ; preds = %51
  %56 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %57 = tail call double @llvm.experimental.constrained.fdiv.f64(double 0xC00921FB54442D18, double %56, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %106

58:                                               ; preds = %51
  %59 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %60 = tail call double @llvm.experimental.constrained.fmul.f64(double %59, double 0x400921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %61 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %62 = tail call double @llvm.experimental.constrained.fdiv.f64(double %60, double %61, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %106

63:                                               ; preds = %51
  %64 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 -3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %65 = tail call double @llvm.experimental.constrained.fmul.f64(double %64, double 0x400921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %66 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %67 = tail call double @llvm.experimental.constrained.fdiv.f64(double %65, double %66, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %106

68:                                               ; preds = %51
  unreachable

69:                                               ; preds = %47
  %70 = add nuw i32 %29, 67108864
  %71 = icmp ult i32 %70, %30
  %72 = icmp eq i32 %30, 2146435072
  %73 = or i1 %72, %71
  br i1 %73, label %74, label %81

74:                                               ; preds = %69
  %75 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %76 = tail call double @llvm.experimental.constrained.fdiv.f64(double 0xC00921FB54442D18, double %75, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %77 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %78 = tail call double @llvm.experimental.constrained.fdiv.f64(double 0x400921FB54442D18, double %77, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %79 = icmp slt i64 %7, 0
  %80 = select i1 %79, double %76, double %78
  br label %106

81:                                               ; preds = %69
  %82 = icmp ne i32 %27, 0
  %83 = add nuw i32 %30, 67108864
  %84 = icmp ult i32 %83, %29
  %85 = select i1 %82, i1 %84, i1 false
  br i1 %85, label %86, label %88

86:                                               ; preds = %81
  %87 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %92

88:                                               ; preds = %81
  %89 = tail call double @llvm.experimental.constrained.fdiv.f64(double %0, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %90 = tail call double @fabs(double noundef %89) #4
  %91 = tail call double @atan(double noundef %90) #4
  br label %92

92:                                               ; preds = %88, %86
  %93 = phi double [ %87, %86 ], [ %91, %88 ]
  switch i32 %28, label %99 [
    i32 0, label %106
    i32 1, label %94
    i32 2, label %96
  ]

94:                                               ; preds = %92
  %95 = fneg double %93
  br label %106

96:                                               ; preds = %92
  %97 = tail call double @llvm.experimental.constrained.fsub.f64(double %93, double 0x3CA1A62633145C07, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %98 = tail call double @llvm.experimental.constrained.fsub.f64(double 0x400921FB54442D18, double %97, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %106

99:                                               ; preds = %92
  %100 = tail call double @llvm.experimental.constrained.fsub.f64(double %93, double 0x3CA1A62633145C07, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %101 = tail call double @llvm.experimental.constrained.fsub.f64(double %100, double 0x400921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %106

102:                                              ; preds = %49
  %103 = zext i32 %28 to i64
  %104 = getelementptr inbounds [4 x double], [4 x double]* @switch.table.atan2, i64 0, i64 %103
  %105 = load double, double* %104, align 8
  br label %106

106:                                              ; preds = %102, %92, %33, %33, %99, %96, %94, %74, %63, %58, %55, %52, %40, %35, %34, %21, %10
  %107 = phi double [ %11, %10 ], [ %22, %21 ], [ %46, %40 ], [ %80, %74 ], [ %101, %99 ], [ %98, %96 ], [ %95, %94 ], [ %67, %63 ], [ %62, %58 ], [ %57, %55 ], [ %54, %52 ], [ 0xC00921FB54442D18, %35 ], [ 0x400921FB54442D18, %34 ], [ %0, %33 ], [ %0, %33 ], [ %93, %92 ], [ %105, %102 ]
  ret double %107
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #1

; Function Attrs: optsize
declare double @atan(double noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: optsize
declare double @fabs(double noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
