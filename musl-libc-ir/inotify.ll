; ModuleID = 'src/linux/inotify.c'
source_filename = "src/linux/inotify.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @inotify_init() local_unnamed_addr #0 {
  %1 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 294, i64 0) #2, !srcloc !3
  %2 = trunc i64 %1 to i32
  %3 = icmp eq i32 %2, -38
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = tail call i64 asm sideeffect "syscall", "={ax},{ax},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 253) #2, !srcloc !4
  br label %6

6:                                                ; preds = %0, %4
  %7 = phi i64 [ %1, %0 ], [ %5, %4 ]
  %8 = shl i64 %7, 32
  %9 = ashr exact i64 %8, 32
  %10 = tail call i64 @__syscall_ret(i64 noundef %9) #3
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

; Function Attrs: nounwind optsize strictfp
define i32 @inotify_init1(i32 noundef %0) local_unnamed_addr #0 {
  %2 = sext i32 %0 to i64
  %3 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 294, i64 %2) #2, !srcloc !3
  %4 = trunc i64 %3 to i32
  %5 = icmp ne i32 %4, -38
  %6 = icmp ne i32 %0, 0
  %7 = or i1 %6, %5
  br i1 %7, label %10, label %8

8:                                                ; preds = %1
  %9 = tail call i64 asm sideeffect "syscall", "={ax},{ax},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 253) #2, !srcloc !4
  br label %10

10:                                               ; preds = %8, %1
  %11 = phi i64 [ %3, %1 ], [ %9, %8 ]
  %12 = shl i64 %11, 32
  %13 = ashr exact i64 %12, 32
  %14 = tail call i64 @__syscall_ret(i64 noundef %13) #3
  %15 = trunc i64 %14 to i32
  ret i32 %15
}

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i32 @inotify_add_watch(i32 noundef %0, i8* noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = sext i32 %0 to i64
  %5 = ptrtoint i8* %1 to i64
  %6 = zext i32 %2 to i64
  %7 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 254, i64 %4, i64 %5, i64 %6) #2, !srcloc !5
  %8 = tail call i64 @__syscall_ret(i64 noundef %7) #3
  %9 = trunc i64 %8 to i32
  ret i32 %9
}

; Function Attrs: nounwind optsize strictfp
define i32 @inotify_rm_watch(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = sext i32 %0 to i64
  %4 = sext i32 %1 to i64
  %5 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 255, i64 %3, i64 %4) #2, !srcloc !6
  %6 = tail call i64 @__syscall_ret(i64 noundef %5) #3
  %7 = trunc i64 %6 to i32
  ret i32 %7
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
!3 = !{i64 82468}
!4 = !{i64 82300}
!5 = !{i64 82866}
!6 = !{i64 82654}
