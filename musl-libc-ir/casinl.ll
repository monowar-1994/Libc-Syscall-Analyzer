; ModuleID = 'src/complex/casinl.c'
source_filename = "src/complex/casinl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define { x86_fp80, x86_fp80 } @casinl({ x86_fp80, x86_fp80 }* nocapture noundef readonly byval({ x86_fp80, x86_fp80 }) align 16 %0) local_unnamed_addr #0 {
  %2 = alloca { x86_fp80, x86_fp80 }, align 16
  %3 = alloca { x86_fp80, x86_fp80 }, align 16
  %4 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %0, i64 0, i32 0
  %5 = load x86_fp80, x86_fp80* %4, align 16
  %6 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %0, i64 0, i32 1
  %7 = load x86_fp80, x86_fp80* %6, align 16
  %8 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #3
  %9 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %5, x86_fp80 %7, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %10 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %5, x86_fp80 %7, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %11 = fneg x86_fp80 %9
  %12 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %11, x86_fp80 %10, x86_fp80 %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %13 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double -2.000000e+00, metadata !"fpexcept.ignore") #3
  %14 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %13, x86_fp80 %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %15 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %14, x86_fp80 %7, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %16 = fneg x86_fp80 %7
  %17 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %2, i64 0, i32 0
  %18 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %2, i64 0, i32 1
  store x86_fp80 %12, x86_fp80* %17, align 16
  store x86_fp80 %15, x86_fp80* %18, align 16
  %19 = tail call { x86_fp80, x86_fp80 } @csqrtl({ x86_fp80, x86_fp80 }* noundef nonnull byval({ x86_fp80, x86_fp80 }) align 16 %2) #4
  %20 = extractvalue { x86_fp80, x86_fp80 } %19, 0
  %21 = extractvalue { x86_fp80, x86_fp80 } %19, 1
  %22 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %16, x86_fp80 %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %23 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %5, x86_fp80 %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %24 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %3, i64 0, i32 0
  %25 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %3, i64 0, i32 1
  store x86_fp80 %22, x86_fp80* %24, align 16
  store x86_fp80 %23, x86_fp80* %25, align 16
  %26 = tail call { x86_fp80, x86_fp80 } @clogl({ x86_fp80, x86_fp80 }* noundef nonnull byval({ x86_fp80, x86_fp80 }) align 16 %3) #4
  %27 = extractvalue { x86_fp80, x86_fp80 } %26, 0
  %28 = extractvalue { x86_fp80, x86_fp80 } %26, 1
  %29 = fneg x86_fp80 %27
  %30 = insertvalue { x86_fp80, x86_fp80 } poison, x86_fp80 %28, 0
  %31 = insertvalue { x86_fp80, x86_fp80 } %30, x86_fp80 %29, 1
  ret { x86_fp80, x86_fp80 } %31
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: optsize
declare { x86_fp80, x86_fp80 } @clogl({ x86_fp80, x86_fp80 }* noundef byval({ x86_fp80, x86_fp80 }) align 16) local_unnamed_addr #2

; Function Attrs: optsize
declare { x86_fp80, x86_fp80 } @csqrtl({ x86_fp80, x86_fp80 }* noundef byval({ x86_fp80, x86_fp80 }) align 16) local_unnamed_addr #2

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
