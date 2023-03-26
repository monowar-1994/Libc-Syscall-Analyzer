; ModuleID = 'src/math/rint.c'
source_filename = "src/math/rint.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define double @rint(double noundef %0) local_unnamed_addr #0 {
  %2 = bitcast double %0 to i64
  %3 = and i64 %2, 9218868437227405312
  %4 = icmp ugt i64 %3, 4836865999795912704
  br i1 %4, label %20, label %5

5:                                                ; preds = %1
  %6 = icmp sgt i64 %2, -1
  br i1 %6, label %10, label %7

7:                                                ; preds = %5
  %8 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double 0x4330000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %9 = tail call double @llvm.experimental.constrained.fadd.f64(double %8, double 0x4330000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %13

10:                                               ; preds = %5
  %11 = tail call double @llvm.experimental.constrained.fadd.f64(double %0, double 0x4330000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %12 = tail call double @llvm.experimental.constrained.fsub.f64(double %11, double 0x4330000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %13

13:                                               ; preds = %10, %7
  %14 = phi double [ %9, %7 ], [ %12, %10 ]
  %15 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %16 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %14, double %15, metadata !"oeq", metadata !"fpexcept.ignore") #2
  br i1 %16, label %17, label %20

17:                                               ; preds = %13
  %18 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %19 = select i1 %6, double %18, double -0.000000e+00
  br label %20

20:                                               ; preds = %13, %1, %17
  %21 = phi double [ %19, %17 ], [ %0, %1 ], [ %14, %13 ]
  ret double %21
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f64(double, double, metadata, metadata) #1

attributes #0 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
