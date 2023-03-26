; ModuleID = 'src/linux/signalfd.c'
source_filename = "src/linux/signalfd.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__sigset_t = type { [16 x i64] }

; Function Attrs: nounwind optsize strictfp
define i32 @signalfd(i32 noundef %0, %struct.__sigset_t* noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = sext i32 %0 to i64
  %5 = ptrtoint %struct.__sigset_t* %1 to i64
  %6 = sext i32 %2 to i64
  %7 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 289, i64 %4, i64 %5, i64 8, i64 %6) #2, !srcloc !3
  %8 = trunc i64 %7 to i32
  %9 = icmp eq i32 %8, -38
  br i1 %9, label %10, label %28

10:                                               ; preds = %3
  %11 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 282, i64 %4, i64 %5, i64 8) #2, !srcloc !4
  %12 = and i64 %11, 2147483648
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %14, label %28

14:                                               ; preds = %10
  %15 = and i32 %2, 524288
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %21, label %17

17:                                               ; preds = %14
  %18 = shl i64 %11, 32
  %19 = ashr exact i64 %18, 32
  %20 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %19, i64 2, i64 1) #2, !srcloc !4
  br label %21

21:                                               ; preds = %17, %14
  %22 = and i32 %2, 2048
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %28, label %24

24:                                               ; preds = %21
  %25 = shl i64 %11, 32
  %26 = ashr exact i64 %25, 32
  %27 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %26, i64 4, i64 2048) #2, !srcloc !4
  br label %28

28:                                               ; preds = %10, %24, %21, %3
  %29 = phi i64 [ %7, %3 ], [ %11, %21 ], [ %11, %24 ], [ %11, %10 ]
  %30 = shl i64 %29, 32
  %31 = ashr exact i64 %30, 32
  %32 = tail call i64 @__syscall_ret(i64 noundef %31) #3
  %33 = trunc i64 %32 to i32
  ret i32 %33
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
!3 = !{i64 117158}
!4 = !{i64 116888}
