; ModuleID = 'src/linux/fanotify.c'
source_filename = "src/linux/fanotify.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @fanotify_init(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = zext i32 %0 to i64
  %4 = zext i32 %1 to i64
  %5 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 300, i64 %3, i64 %4) #2, !srcloc !3
  %6 = tail call i64 @__syscall_ret(i64 noundef %5) #3
  %7 = trunc i64 %6 to i32
  ret i32 %7
}

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i32 @fanotify_mark(i32 noundef %0, i32 noundef %1, i64 noundef %2, i32 noundef %3, i8* noundef %4) local_unnamed_addr #0 {
  %6 = sext i32 %0 to i64
  %7 = zext i32 %1 to i64
  %8 = sext i32 %3 to i64
  %9 = ptrtoint i8* %4 to i64
  %10 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},{r8},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 301, i64 %6, i64 %7, i64 %2, i64 %8, i64 %9) #2, !srcloc !4
  %11 = tail call i64 @__syscall_ret(i64 noundef %10) #3
  %12 = trunc i64 %11 to i32
  ret i32 %12
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind strictfp }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 49399}
!4 = !{i64 50207}
