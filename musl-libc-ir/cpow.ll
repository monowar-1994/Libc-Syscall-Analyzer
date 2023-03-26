; ModuleID = 'src/complex/cpow.c'
source_filename = "src/complex/cpow.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define { double, double } @cpow(double noundef %0, double noundef %1, double noundef %2, double noundef %3) local_unnamed_addr #0 {
  %5 = tail call { double, double } @clog(double noundef %0, double noundef %1) #3
  %6 = extractvalue { double, double } %5, 0
  %7 = extractvalue { double, double } %5, 1
  %8 = tail call double @llvm.experimental.constrained.fmul.f64(double %2, double %6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %9 = tail call double @llvm.experimental.constrained.fmul.f64(double %3, double %7, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %10 = tail call double @llvm.experimental.constrained.fmul.f64(double %2, double %7, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %11 = tail call double @llvm.experimental.constrained.fmul.f64(double %3, double %6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %12 = tail call double @llvm.experimental.constrained.fsub.f64(double %8, double %9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %13 = tail call double @llvm.experimental.constrained.fadd.f64(double %10, double %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %14 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %12, double %12, metadata !"uno", metadata !"fpexcept.ignore") #4
  br i1 %14, label %15, label %21, !prof !3

15:                                               ; preds = %4
  %16 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %13, double %13, metadata !"uno", metadata !"fpexcept.ignore") #4
  br i1 %16, label %17, label %21, !prof !3

17:                                               ; preds = %15
  %18 = tail call { double, double } @__muldc3(double noundef %2, double noundef %3, double noundef %6, double noundef %7) #3
  %19 = extractvalue { double, double } %18, 0
  %20 = extractvalue { double, double } %18, 1
  br label %21

21:                                               ; preds = %17, %15, %4
  %22 = phi double [ %12, %4 ], [ %12, %15 ], [ %19, %17 ]
  %23 = phi double [ %13, %4 ], [ %13, %15 ], [ %20, %17 ]
  %24 = tail call { double, double } @cexp(double noundef %22, double noundef %23) #3
  ret { double, double } %24
}

; Function Attrs: optsize
declare { double, double } @cexp(double noundef, double noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare { double, double } @clog(double noundef, double noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f64(double, double, metadata, metadata) #2

declare { double, double } @__muldc3(double, double, double, double) local_unnamed_addr

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
!3 = !{!"branch_weights", i32 1, i32 1048575}
