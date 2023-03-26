; ModuleID = 'src/unistd/dup3.c'
source_filename = "src/unistd/dup3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@dup3 = weak alias i32 (i32, i32, i32), i32 (i32, i32, i32)* @__dup3

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__dup3(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = icmp eq i32 %0, %1
  br i1 %4, label %29, label %5

5:                                                ; preds = %3
  %6 = and i32 %2, 524288
  %7 = icmp eq i32 %6, 0
  %8 = sext i32 %0 to i64
  %9 = sext i32 %1 to i64
  br i1 %7, label %10, label %11

10:                                               ; preds = %13, %5
  br label %19

11:                                               ; preds = %5
  %12 = sext i32 %2 to i64
  br label %13

13:                                               ; preds = %11, %13
  %14 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 292, i64 %8, i64 %9, i64 %12) #2, !srcloc !3
  %15 = trunc i64 %14 to i32
  switch i32 %15, label %16 [
    i32 -16, label %13
    i32 -38, label %10
  ]

16:                                               ; preds = %13
  %17 = shl i64 %14, 32
  %18 = ashr exact i64 %17, 32
  br label %29

19:                                               ; preds = %10, %19
  %20 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 33, i64 %8, i64 %9) #2, !srcloc !4
  %21 = trunc i64 %20 to i32
  %22 = icmp eq i32 %21, -16
  br i1 %22, label %19, label %23

23:                                               ; preds = %19
  br i1 %7, label %26, label %24

24:                                               ; preds = %23
  %25 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %9, i64 2, i64 1) #2, !srcloc !3
  br label %26

26:                                               ; preds = %24, %23
  %27 = shl i64 %20, 32
  %28 = ashr exact i64 %27, 32
  br label %29

29:                                               ; preds = %3, %26, %16
  %30 = phi i64 [ %28, %26 ], [ %18, %16 ], [ -22, %3 ]
  %31 = tail call i64 @__syscall_ret(i64 noundef %30) #3
  %32 = trunc i64 %31 to i32
  ret i32 %32
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
!3 = !{i64 92440}
!4 = !{i64 92228}
