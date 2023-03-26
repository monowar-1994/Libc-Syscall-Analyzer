; ModuleID = 'src/math/__expo2.c'
source_filename = "src/math/__expo2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define hidden double @__expo2(double noundef %0, double noundef %1) local_unnamed_addr #0 {
  %3 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double 0x40962066151ADD8B, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %4 = tail call double @exp(double noundef %3) #4
  %5 = tail call double @llvm.experimental.constrained.fmul.f64(double %1, double 0x7FC0000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %6 = tail call double @llvm.experimental.constrained.fmul.f64(double %4, double %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %7 = tail call double @llvm.experimental.constrained.fmul.f64(double %6, double 0x7FC0000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  ret double %7
}

; Function Attrs: optsize
declare double @exp(double noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

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
