; ModuleID = 'src/mman/mprotect.c'
source_filename = "src/mman/mprotect.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@mprotect = weak alias i32 (i8*, i64, i32), i32 (i8*, i64, i32)* @__mprotect

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__mprotect(i8* noundef %0, i64 noundef %1, i32 noundef %2) #0 {
  %4 = ptrtoint i8* %0 to i64
  %5 = and i64 %4, -4096
  %6 = getelementptr inbounds i8, i8* %0, i64 %1
  %7 = getelementptr inbounds i8, i8* %6, i64 4096
  %8 = getelementptr inbounds i8, i8* %7, i64 -1
  %9 = ptrtoint i8* %8 to i64
  %10 = and i64 %9, -4096
  %11 = sub i64 %10, %5
  %12 = sext i32 %2 to i64
  %13 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 10, i64 %5, i64 %11, i64 %12) #2, !srcloc !3
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
!3 = !{i64 119104}
