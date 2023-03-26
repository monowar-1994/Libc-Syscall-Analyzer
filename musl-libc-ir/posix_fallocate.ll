; ModuleID = 'src/fcntl/posix_fallocate.c'
source_filename = "src/fcntl/posix_fallocate.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@posix_fallocate64 = weak alias i32 (i32, i64, i64), i32 (i32, i64, i64)* @posix_fallocate

; Function Attrs: nounwind optsize strictfp
define i32 @posix_fallocate(i32 noundef %0, i64 noundef %1, i64 noundef %2) #0 {
  %4 = sext i32 %0 to i64
  %5 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 285, i64 %4, i64 0, i64 %1, i64 %2) #1, !srcloc !3
  %6 = trunc i64 %5 to i32
  %7 = sub i32 0, %6
  ret i32 %7
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 66797}
