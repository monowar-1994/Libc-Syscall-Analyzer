; ModuleID = 'src/math/scalblnf.c'
source_filename = "src/math/scalblnf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define float @scalblnf(float noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = icmp sgt i64 %1, -2147483648
  %4 = select i1 %3, i64 %1, i64 -2147483648
  %5 = icmp slt i64 %4, 2147483647
  %6 = select i1 %5, i64 %4, i64 2147483647
  %7 = trunc i64 %6 to i32
  %8 = tail call float @scalbnf(float noundef %0, i32 noundef %7) #2
  ret float %8
}

; Function Attrs: optsize
declare float @scalbnf(float noundef, i32 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
