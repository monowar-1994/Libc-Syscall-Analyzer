; ModuleID = 'src/math/copysignl.c'
source_filename = "src/math/copysignl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define x86_fp80 @copysignl(x86_fp80 noundef %0, x86_fp80 noundef %1) local_unnamed_addr #0 {
  %3 = bitcast x86_fp80 %0 to i80
  %4 = bitcast x86_fp80 %1 to i80
  %5 = lshr i80 %4, 64
  %6 = trunc i80 %5 to i16
  %7 = and i16 %6, -32768
  %8 = lshr i80 %3, 64
  %9 = trunc i80 %8 to i16
  %10 = and i16 %9, 32767
  %11 = or i16 %7, %10
  %12 = zext i16 %11 to i80
  %13 = shl nuw i80 %12, 64
  %14 = and i80 %3, 18446744073709551615
  %15 = or i80 %13, %14
  %16 = bitcast i80 %15 to x86_fp80
  ret x86_fp80 %16
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
