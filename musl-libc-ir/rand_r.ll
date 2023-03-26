; ModuleID = 'src/prng/rand_r.c'
source_filename = "src/prng/rand_r.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define i32 @rand_r(i32* nocapture noundef %0) local_unnamed_addr #0 {
  %2 = load i32, i32* %0, align 4, !tbaa !3
  %3 = mul i32 %2, 1103515245
  %4 = add i32 %3, 12345
  store i32 %4, i32* %0, align 4, !tbaa !3
  %5 = lshr i32 %4, 11
  %6 = xor i32 %5, %4
  %7 = shl i32 %6, 7
  %8 = and i32 %7, -1658038656
  %9 = xor i32 %8, %6
  %10 = shl i32 %9, 15
  %11 = and i32 %10, -272236544
  %12 = xor i32 %11, %9
  %13 = lshr i32 %12, 19
  %14 = lshr i32 %12, 1
  %15 = xor i32 %13, %14
  ret i32 %15
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
