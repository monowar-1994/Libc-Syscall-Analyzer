; ModuleID = 'src/complex/cproj.c'
source_filename = "src/complex/cproj.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define { double, double } @cproj(double noundef %0, double noundef %1) local_unnamed_addr #0 {
  %3 = bitcast double %0 to i64
  %4 = and i64 %3, 9223372036854775807
  %5 = icmp eq i64 %4, 9218868437227405312
  br i1 %5, label %10, label %6

6:                                                ; preds = %2
  %7 = bitcast double %1 to i64
  %8 = and i64 %7, 9223372036854775807
  %9 = icmp eq i64 %8, 9218868437227405312
  br i1 %9, label %10, label %13

10:                                               ; preds = %6, %2
  %11 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x7FF0000000000000, metadata !"fpexcept.ignore") #3
  %12 = tail call double @copysign(double noundef 0.000000e+00, double noundef %1) #4
  br label %13

13:                                               ; preds = %6, %10
  %14 = phi double [ %11, %10 ], [ %0, %6 ]
  %15 = phi double [ %12, %10 ], [ %1, %6 ]
  %16 = insertvalue { double, double } poison, double %14, 0
  %17 = insertvalue { double, double } %16, double %15, 1
  ret { double, double } %17
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #1

; Function Attrs: optsize
declare double @copysign(double noundef, double noundef) local_unnamed_addr #2

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
