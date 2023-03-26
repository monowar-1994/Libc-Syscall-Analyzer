; ModuleID = 'src/network/getsockopt.c'
source_filename = "src/network/getsockopt.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @getsockopt(i32 noundef %0, i32 noundef %1, i32 noundef %2, i8* noalias noundef %3, i32* noalias noundef %4) local_unnamed_addr #0 {
  %6 = sext i32 %0 to i64
  %7 = sext i32 %1 to i64
  %8 = sext i32 %2 to i64
  %9 = ptrtoint i8* %3 to i64
  %10 = ptrtoint i32* %4 to i64
  %11 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},{r8},{r9},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 55, i64 %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 0) #2, !srcloc !3
  %12 = shl i64 %11, 32
  %13 = ashr exact i64 %12, 32
  %14 = tail call i64 @__syscall_ret(i64 noundef %13) #3
  %15 = trunc i64 %14 to i32
  ret i32 %15
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
!3 = !{i64 89855}
