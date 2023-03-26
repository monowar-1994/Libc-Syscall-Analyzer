; ModuleID = 'src/linux/wait4.c'
source_filename = "src/linux/wait4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.rusage = type { %struct.timeval, %struct.timeval, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, [16 x i64] }
%struct.timeval = type { i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @wait4(i32 noundef %0, i32* noundef %1, i32 noundef %2, %struct.rusage* noundef %3) local_unnamed_addr #0 {
  %5 = icmp eq %struct.rusage* %3, null
  %6 = getelementptr inbounds %struct.rusage, %struct.rusage* %3, i64 0, i32 2
  %7 = getelementptr inbounds i64, i64* %6, i64 -4
  %8 = sext i32 %0 to i64
  %9 = ptrtoint i32* %1 to i64
  %10 = sext i32 %2 to i64
  %11 = ptrtoint i64* %7 to i64
  %12 = select i1 %5, i64 0, i64 %11
  %13 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 61, i64 %8, i64 %9, i64 %10, i64 %12) #2, !srcloc !3
  %14 = shl i64 %13, 32
  %15 = ashr exact i64 %14, 32
  %16 = tail call i64 @__syscall_ret(i64 noundef %15) #3
  %17 = trunc i64 %16 to i32
  ret i32 %17
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
!3 = !{i64 143255}
