; ModuleID = 'src/network/socket.c'
source_filename = "src/network/socket.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @socket(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = sext i32 %0 to i64
  %5 = sext i32 %1 to i64
  %6 = sext i32 %2 to i64
  %7 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},{r8},{r9},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 41, i64 %4, i64 %5, i64 %6, i64 0, i64 0, i64 0) #2, !srcloc !3
  %8 = trunc i64 %7 to i32
  switch i32 %8, label %32 [
    i32 -22, label %9
    i32 -93, label %9
  ]

9:                                                ; preds = %3, %3
  %10 = and i32 %1, 526336
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %32, label %12

12:                                               ; preds = %9
  %13 = and i32 %1, -526337
  %14 = sext i32 %13 to i64
  %15 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},{r8},{r9},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 41, i64 %4, i64 %14, i64 %6, i64 0, i64 0, i64 0) #2, !srcloc !3
  %16 = and i64 %15, 2147483648
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %18, label %32

18:                                               ; preds = %12
  %19 = and i32 %1, 524288
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %25, label %21

21:                                               ; preds = %18
  %22 = shl i64 %15, 32
  %23 = ashr exact i64 %22, 32
  %24 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %23, i64 2, i64 1) #2, !srcloc !4
  br label %25

25:                                               ; preds = %21, %18
  %26 = and i32 %1, 2048
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %32, label %28

28:                                               ; preds = %25
  %29 = shl i64 %15, 32
  %30 = ashr exact i64 %29, 32
  %31 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %30, i64 4, i64 2048) #2, !srcloc !4
  br label %32

32:                                               ; preds = %9, %28, %25, %3, %12
  %33 = phi i64 [ %15, %12 ], [ %15, %28 ], [ %15, %25 ], [ %7, %9 ], [ %7, %3 ]
  %34 = shl i64 %33, 32
  %35 = ashr exact i64 %34, 32
  %36 = tail call i64 @__syscall_ret(i64 noundef %35) #3
  %37 = trunc i64 %36 to i32
  ret i32 %37
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
!3 = !{i64 90977}
!4 = !{i64 89998}
