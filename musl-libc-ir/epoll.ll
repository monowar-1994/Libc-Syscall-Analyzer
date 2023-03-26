; ModuleID = 'src/linux/epoll.c'
source_filename = "src/linux/epoll.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.epoll_event = type <{ i32, %union.epoll_data }>
%union.epoll_data = type { i8* }
%struct.__sigset_t = type { [16 x i64] }

; Function Attrs: nounwind optsize strictfp
define i32 @epoll_create(i32 noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @epoll_create1(i32 noundef 0) #2
  ret i32 %2
}

; Function Attrs: nounwind optsize strictfp
define i32 @epoll_create1(i32 noundef %0) local_unnamed_addr #0 {
  %2 = sext i32 %0 to i64
  %3 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 291, i64 %2) #3, !srcloc !3
  %4 = trunc i64 %3 to i32
  %5 = icmp ne i32 %4, -38
  %6 = icmp ne i32 %0, 0
  %7 = or i1 %6, %5
  br i1 %7, label %10, label %8

8:                                                ; preds = %1
  %9 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 213, i64 1) #3, !srcloc !3
  br label %10

10:                                               ; preds = %8, %1
  %11 = phi i64 [ %3, %1 ], [ %9, %8 ]
  %12 = shl i64 %11, 32
  %13 = ashr exact i64 %12, 32
  %14 = tail call i64 @__syscall_ret(i64 noundef %13) #4
  %15 = trunc i64 %14 to i32
  ret i32 %15
}

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i32 @epoll_ctl(i32 noundef %0, i32 noundef %1, i32 noundef %2, %struct.epoll_event* noundef %3) local_unnamed_addr #0 {
  %5 = sext i32 %0 to i64
  %6 = sext i32 %1 to i64
  %7 = sext i32 %2 to i64
  %8 = ptrtoint %struct.epoll_event* %3 to i64
  %9 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 233, i64 %5, i64 %6, i64 %7, i64 %8) #3, !srcloc !4
  %10 = tail call i64 @__syscall_ret(i64 noundef %9) #4
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

; Function Attrs: nounwind optsize strictfp
define i32 @epoll_pwait(i32 noundef %0, %struct.epoll_event* noundef %1, i32 noundef %2, i32 noundef %3, %struct.__sigset_t* noundef %4) local_unnamed_addr #0 {
  %6 = sext i32 %0 to i64
  %7 = ptrtoint %struct.epoll_event* %1 to i64
  %8 = sext i32 %2 to i64
  %9 = sext i32 %3 to i64
  %10 = ptrtoint %struct.__sigset_t* %4 to i64
  %11 = tail call i64 @__syscall_cp(i64 noundef 281, i64 noundef %6, i64 noundef %7, i64 noundef %8, i64 noundef %9, i64 noundef %10, i64 noundef 8) #4
  %12 = trunc i64 %11 to i32
  %13 = icmp ne i32 %12, -38
  %14 = icmp ne %struct.__sigset_t* %4, null
  %15 = or i1 %14, %13
  br i1 %15, label %18, label %16

16:                                               ; preds = %5
  %17 = tail call i64 @__syscall_cp(i64 noundef 232, i64 noundef %6, i64 noundef %7, i64 noundef %8, i64 noundef %9, i64 noundef 0, i64 noundef 0) #4
  br label %18

18:                                               ; preds = %16, %5
  %19 = phi i64 [ %11, %5 ], [ %17, %16 ]
  %20 = shl i64 %19, 32
  %21 = ashr exact i64 %20, 32
  %22 = tail call i64 @__syscall_ret(i64 noundef %21) #4
  %23 = trunc i64 %22 to i32
  ret i32 %23
}

; Function Attrs: optsize
declare hidden i64 @__syscall_cp(i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i32 @epoll_wait(i32 noundef %0, %struct.epoll_event* noundef %1, i32 noundef %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = tail call i32 @epoll_pwait(i32 noundef %0, %struct.epoll_event* noundef %1, i32 noundef %2, i32 noundef %3, %struct.__sigset_t* noundef null) #2
  ret i32 %5
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin optsize strictfp "no-builtins" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 130629}
!4 = !{i64 131297}
