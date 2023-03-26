; ModuleID = 'src/stdio/remove.c'
source_filename = "src/stdio/remove.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @remove(i8* noundef %0) local_unnamed_addr #0 {
  %2 = ptrtoint i8* %0 to i64
  %3 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 87, i64 %2) #2, !srcloc !3
  %4 = trunc i64 %3 to i32
  %5 = icmp eq i32 %4, -21
  br i1 %5, label %6, label %8

6:                                                ; preds = %1
  %7 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 84, i64 %2) #2, !srcloc !3
  br label %8

8:                                                ; preds = %6, %1
  %9 = phi i64 [ %7, %6 ], [ %3, %1 ]
  %10 = shl i64 %9, 32
  %11 = ashr exact i64 %10, 32
  %12 = tail call i64 @__syscall_ret(i64 noundef %11) #3
  %13 = trunc i64 %12 to i32
  ret i32 %13
}

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind strictfp }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 84627}
