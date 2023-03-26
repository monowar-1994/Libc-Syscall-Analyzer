; ModuleID = 'src/exit/_Exit.c'
source_filename = "src/exit/_Exit.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noreturn nounwind optsize strictfp
define void @_Exit(i32 noundef %0) local_unnamed_addr #0 {
  %2 = sext i32 %0 to i64
  %3 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 231, i64 %2) #1, !srcloc !3
  br label %4

4:                                                ; preds = %4, %1
  %5 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 60, i64 %2) #1, !srcloc !3
  br label %4
}

attributes #0 = { noreturn nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 66690}
