; ModuleID = 'src/linux/clock_adjtime.c'
source_filename = "src/linux/clock_adjtime.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timex = type { i32, i64, i64, i64, i64, i32, i64, i64, i64, %struct.timeval, i64, i64, i64, i32, i64, i64, i64, i64, i64, i32, [11 x i32] }
%struct.timeval = type { i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @clock_adjtime(i32 noundef %0, %struct.timex* noundef %1) local_unnamed_addr #0 {
  %3 = icmp eq i32 %0, 0
  br i1 %3, label %4, label %7

4:                                                ; preds = %2
  %5 = ptrtoint %struct.timex* %1 to i64
  %6 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 159, i64 %5) #2, !srcloc !3
  br label %11

7:                                                ; preds = %2
  %8 = sext i32 %0 to i64
  %9 = ptrtoint %struct.timex* %1 to i64
  %10 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 305, i64 %8, i64 %9) #2, !srcloc !4
  br label %11

11:                                               ; preds = %7, %4
  %12 = phi i64 [ %10, %7 ], [ %6, %4 ]
  %13 = tail call i64 @__syscall_ret(i64 noundef %12) #3
  %14 = trunc i64 %13 to i32
  ret i32 %14
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
!3 = !{i64 98547}
!4 = !{i64 98733}
