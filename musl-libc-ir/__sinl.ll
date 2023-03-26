; ModuleID = 'src/math/__sinl.c'
source_filename = "src/math/__sinl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define hidden x86_fp80 @__sinl(x86_fp80 noundef %0, x86_fp80 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %0, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %5 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %4, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %6 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x3F81111111111111, metadata !"fpexcept.ignore") #2
  %7 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0xBF2A01A01A019F81, metadata !"fpexcept.ignore") #2
  %8 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x3EC71DE3A55560F7, metadata !"fpexcept.ignore") #2
  %9 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0xBE5AE64564F16CAD, metadata !"fpexcept.ignore") #2
  %10 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x3DE61242B90243B5, metadata !"fpexcept.ignore") #2
  %11 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0xBD6AE42EBD1B2E00, metadata !"fpexcept.ignore") #2
  %12 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x3CE79372EA0B3F64, metadata !"fpexcept.ignore") #2
  %13 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %4, x86_fp80 %12, x86_fp80 %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %14 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %4, x86_fp80 %13, x86_fp80 %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %15 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %4, x86_fp80 %14, x86_fp80 %9, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %16 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %4, x86_fp80 %15, x86_fp80 %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %17 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %4, x86_fp80 %16, x86_fp80 %7, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %18 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %4, x86_fp80 %17, x86_fp80 %6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %19 = icmp eq i32 %2, 0
  br i1 %19, label %20, label %23

20:                                               ; preds = %3
  %21 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %4, x86_fp80 %18, x86_fp80 0xKBFFCAAAAAAAAAAAAAAAB, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %22 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %5, x86_fp80 %21, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %33

23:                                               ; preds = %3
  %24 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #2
  %25 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %5, x86_fp80 %18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %26 = fneg x86_fp80 %25
  %27 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %24, x86_fp80 %1, x86_fp80 %26, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %28 = fneg x86_fp80 %1
  %29 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %4, x86_fp80 %27, x86_fp80 %28, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %30 = fneg x86_fp80 %5
  %31 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %30, x86_fp80 0xKBFFCAAAAAAAAAAAAAAAB, x86_fp80 %29, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %32 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %0, x86_fp80 %31, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %33

33:                                               ; preds = %23, %20
  %34 = phi x86_fp80 [ %22, %20 ], [ %32, %23 ]
  ret x86_fp80 %34
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80, x86_fp80, metadata, metadata) #1

attributes #0 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
