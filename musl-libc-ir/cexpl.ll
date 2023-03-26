; ModuleID = 'src/complex/cexpl.c'
source_filename = "src/complex/cexpl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define { x86_fp80, x86_fp80 } @cexpl({ x86_fp80, x86_fp80 }* nocapture noundef readonly byval({ x86_fp80, x86_fp80 }) align 16 %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %0, i64 0, i32 0
  %3 = load x86_fp80, x86_fp80* %2, align 16
  %4 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %0, i64 0, i32 1
  %5 = load x86_fp80, x86_fp80* %4, align 16
  %6 = tail call double @llvm.experimental.constrained.fptrunc.f64.f80(x86_fp80 %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %7 = tail call double @llvm.experimental.constrained.fptrunc.f64.f80(x86_fp80 %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %8 = tail call { double, double } @cexp(double noundef %6, double noundef %7) #4
  %9 = extractvalue { double, double } %8, 0
  %10 = extractvalue { double, double } %8, 1
  %11 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %9, metadata !"fpexcept.ignore") #3
  %12 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %10, metadata !"fpexcept.ignore") #3
  %13 = insertvalue { x86_fp80, x86_fp80 } poison, x86_fp80 %11, 0
  %14 = insertvalue { x86_fp80, x86_fp80 } %13, x86_fp80 %12, 1
  ret { x86_fp80, x86_fp80 } %14
}

; Function Attrs: optsize
declare { double, double } @cexp(double noundef, double noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fptrunc.f64.f80(x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
