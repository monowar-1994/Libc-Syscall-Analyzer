; ModuleID = 'src/complex/csqrt.c'
source_filename = "src/complex/csqrt.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define { double, double } @csqrt(double noundef %0, double noundef %1) local_unnamed_addr #0 {
  %3 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %4 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %0, double %3, metadata !"oeq", metadata !"fpexcept.ignore") #3
  %5 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %1, double 0.000000e+00, metadata !"oeq", metadata !"fpexcept.ignore") #3
  %6 = and i1 %4, %5
  br i1 %6, label %7, label %9

7:                                                ; preds = %2
  %8 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %85

9:                                                ; preds = %2
  %10 = bitcast double %1 to i64
  %11 = and i64 %10, 9223372036854775807
  %12 = icmp eq i64 %11, 9218868437227405312
  br i1 %12, label %13, label %15

13:                                               ; preds = %9
  %14 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x7FF0000000000000, metadata !"fpexcept.ignore") #3
  br label %85

15:                                               ; preds = %9
  %16 = bitcast double %0 to i64
  %17 = and i64 %16, 9223372036854775807
  %18 = icmp ugt i64 %17, 9218868437227405312
  br i1 %18, label %19, label %23

19:                                               ; preds = %15
  %20 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %21 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %22 = tail call double @llvm.experimental.constrained.fdiv.f64(double %20, double %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %85

23:                                               ; preds = %15
  %24 = icmp eq i64 %17, 9218868437227405312
  br i1 %24, label %25, label %33

25:                                               ; preds = %23
  %26 = icmp sgt i64 %16, -1
  %27 = tail call double @llvm.experimental.constrained.fsub.f64(double %1, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br i1 %26, label %31, label %28

28:                                               ; preds = %25
  %29 = tail call double @fabs(double noundef %27) #4
  %30 = tail call double @copysign(double noundef %0, double noundef %1) #4
  br label %85

31:                                               ; preds = %25
  %32 = tail call double @copysign(double noundef %27, double noundef %1) #4
  br label %85

33:                                               ; preds = %23
  %34 = tail call double @fabs(double noundef %0) #4
  %35 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %34, double 0x7FDA827999FCEF32, metadata !"oge", metadata !"fpexcept.ignore") #3
  br i1 %35, label %39, label %36

36:                                               ; preds = %33
  %37 = tail call double @fabs(double noundef %1) #4
  %38 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %37, double 0x7FDA827999FCEF32, metadata !"oge", metadata !"fpexcept.ignore") #3
  br i1 %38, label %39, label %42

39:                                               ; preds = %36, %33
  %40 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double 2.500000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %41 = tail call double @llvm.experimental.constrained.fmul.f64(double %1, double 2.500000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %42

42:                                               ; preds = %36, %39
  %43 = phi i1 [ false, %39 ], [ true, %36 ]
  %44 = phi double [ %41, %39 ], [ %1, %36 ]
  %45 = phi double [ %40, %39 ], [ %0, %36 ]
  %46 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %47 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %45, double %46, metadata !"oge", metadata !"fpexcept.ignore") #3
  br i1 %47, label %48, label %56

48:                                               ; preds = %42
  %49 = tail call double @hypot(double noundef %45, double noundef %44) #4
  %50 = tail call double @llvm.experimental.constrained.fadd.f64(double %45, double %49, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %51 = tail call double @llvm.experimental.constrained.fmul.f64(double %50, double 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %52 = tail call double @sqrt(double noundef %51) #4
  %53 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %54 = tail call double @llvm.experimental.constrained.fmul.f64(double %53, double %52, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %55 = tail call double @llvm.experimental.constrained.fdiv.f64(double %44, double %54, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %67

56:                                               ; preds = %42
  %57 = fneg double %45
  %58 = tail call double @hypot(double noundef %45, double noundef %44) #4
  %59 = tail call double @llvm.experimental.constrained.fadd.f64(double %57, double %58, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %60 = tail call double @llvm.experimental.constrained.fmul.f64(double %59, double 5.000000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %61 = tail call double @sqrt(double noundef %60) #4
  %62 = tail call double @fabs(double noundef %44) #4
  %63 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %64 = tail call double @llvm.experimental.constrained.fmul.f64(double %63, double %61, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %65 = tail call double @llvm.experimental.constrained.fdiv.f64(double %62, double %64, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %66 = tail call double @copysign(double noundef %61, double noundef %44) #4
  br label %67

67:                                               ; preds = %56, %48
  %68 = phi double [ %52, %48 ], [ %65, %56 ]
  %69 = phi double [ %55, %48 ], [ %66, %56 ]
  br i1 %43, label %85, label %70

70:                                               ; preds = %67
  %71 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %72 = tail call double @llvm.experimental.constrained.fmul.f64(double %68, double %71, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %73 = tail call double @llvm.experimental.constrained.fmul.f64(double %69, double 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %74 = tail call double @llvm.experimental.constrained.fmul.f64(double %68, double 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %75 = tail call double @llvm.experimental.constrained.fmul.f64(double %69, double %71, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %76 = tail call double @llvm.experimental.constrained.fsub.f64(double %72, double %73, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %77 = tail call double @llvm.experimental.constrained.fadd.f64(double %74, double %75, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %78 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %76, double %76, metadata !"uno", metadata !"fpexcept.ignore") #3
  br i1 %78, label %79, label %85, !prof !3

79:                                               ; preds = %70
  %80 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %77, double %77, metadata !"uno", metadata !"fpexcept.ignore") #3
  br i1 %80, label %81, label %85, !prof !3

81:                                               ; preds = %79
  %82 = tail call { double, double } @__muldc3(double noundef %68, double noundef %69, double noundef %71, double noundef 0.000000e+00) #4
  %83 = extractvalue { double, double } %82, 0
  %84 = extractvalue { double, double } %82, 1
  br label %85

85:                                               ; preds = %67, %81, %79, %70, %31, %28, %19, %13, %7
  %86 = phi double [ %8, %7 ], [ %14, %13 ], [ %0, %19 ], [ %29, %28 ], [ %0, %31 ], [ %68, %67 ], [ %76, %70 ], [ %76, %79 ], [ %83, %81 ]
  %87 = phi double [ %1, %7 ], [ %1, %13 ], [ %22, %19 ], [ %30, %28 ], [ %32, %31 ], [ %69, %67 ], [ %77, %70 ], [ %77, %79 ], [ %84, %81 ]
  %88 = insertvalue { double, double } poison, double %86, 0
  %89 = insertvalue { double, double } %88, double %87, 1
  ret { double, double } %89
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #1

; Function Attrs: optsize
declare double @fabs(double noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare double @copysign(double noundef, double noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: optsize
declare double @sqrt(double noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare double @hypot(double noundef, double noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #1

declare { double, double } @__muldc3(double, double, double, double) local_unnamed_addr

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
!3 = !{!"branch_weights", i32 1, i32 1048575}
