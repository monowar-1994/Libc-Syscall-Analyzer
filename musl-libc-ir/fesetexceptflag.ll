; ModuleID = 'src/fenv/fesetexceptflag.c'
source_filename = "src/fenv/fesetexceptflag.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @fesetexceptflag(i16* nocapture noundef readonly %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = load i16, i16* %0, align 2, !tbaa !3
  %4 = zext i16 %3 to i32
  %5 = xor i32 %4, -1
  %6 = and i32 %5, %1
  %7 = tail call i32 @feclearexcept(i32 noundef %6) #2
  %8 = load i16, i16* %0, align 2, !tbaa !3
  %9 = zext i16 %8 to i32
  %10 = and i32 %9, %1
  %11 = tail call i32 @feraiseexcept(i32 noundef %10) #2
  ret i32 0
}

; Function Attrs: optsize
declare i32 @feclearexcept(i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @feraiseexcept(i32 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"short", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
