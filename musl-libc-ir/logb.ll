; ModuleID = 'src/math/logb.c'
source_filename = "src/math/logb.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define double @logb(double noundef %0) local_unnamed_addr #0 {
  %2 = bitcast double %0 to i64
  %3 = and i64 %2, 9218868437227405312
  %4 = icmp eq i64 %3, 9218868437227405312
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %17

7:                                                ; preds = %1
  %8 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %9 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %0, double %8, metadata !"oeq", metadata !"fpexcept.ignore") #3
  br i1 %9, label %10, label %14

10:                                               ; preds = %7
  %11 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 -1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %12 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %13 = tail call double @llvm.experimental.constrained.fdiv.f64(double %11, double %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %17

14:                                               ; preds = %7
  %15 = tail call i32 @ilogb(double noundef %0) #4
  %16 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %15, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %17

17:                                               ; preds = %14, %10, %5
  %18 = phi double [ %13, %10 ], [ %16, %14 ], [ %6, %5 ]
  ret double %18
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #1

; Function Attrs: optsize
declare i32 @ilogb(double noundef) local_unnamed_addr #2

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
