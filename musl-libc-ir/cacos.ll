; ModuleID = 'src/complex/cacos.c'
source_filename = "src/complex/cacos.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define { double, double } @cacos(double noundef %0, double noundef %1) local_unnamed_addr #0 {
  %3 = tail call { double, double } @casin(double noundef %0, double noundef %1) #3
  %4 = extractvalue { double, double } %3, 0
  %5 = extractvalue { double, double } %3, 1
  %6 = tail call double @llvm.experimental.constrained.fsub.f64(double 0x3FF921FB54442D18, double %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %7 = fneg double %5
  %8 = insertvalue { double, double } poison, double %6, 0
  %9 = insertvalue { double, double } %8, double %7, 1
  ret { double, double } %9
}

; Function Attrs: optsize
declare { double, double } @casin(double noundef, double noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

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
