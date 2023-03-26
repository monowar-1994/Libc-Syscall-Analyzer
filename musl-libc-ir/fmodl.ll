; ModuleID = 'src/math/x86_64/fmodl.c'
source_filename = "src/math/x86_64/fmodl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nosync nounwind optsize readnone strictfp
define x86_fp80 @fmodl(x86_fp80 noundef %0, x86_fp80 noundef %1) local_unnamed_addr #0 {
  br label %3

3:                                                ; preds = %3, %2
  %4 = phi x86_fp80 [ %0, %2 ], [ %6, %3 ]
  %5 = tail call { x86_fp80, i16 } asm "fprem; fnstsw %ax", "={st},={ax},{st(1)},0,~{dirflag},~{fpsr},~{flags}"(x86_fp80 %1, x86_fp80 %4) #1, !srcloc !3
  %6 = extractvalue { x86_fp80, i16 } %5, 0
  %7 = extractvalue { x86_fp80, i16 } %5, 1
  %8 = and i16 %7, 1024
  %9 = icmp eq i16 %8, 0
  br i1 %9, label %10, label %3

10:                                               ; preds = %3
  %11 = extractvalue { x86_fp80, i16 } %5, 0
  ret x86_fp80 %11
}

attributes #0 = { nofree nosync nounwind optsize readnone strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind readnone strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 106}
