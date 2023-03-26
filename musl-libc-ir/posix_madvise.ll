; ModuleID = 'src/mman/posix_madvise.c'
source_filename = "src/mman/posix_madvise.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @posix_madvise(i8* noundef %0, i64 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = icmp eq i32 %2, 4
  br i1 %4, label %11, label %5

5:                                                ; preds = %3
  %6 = ptrtoint i8* %0 to i64
  %7 = sext i32 %2 to i64
  %8 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 28, i64 %6, i64 %1, i64 %7) #1, !srcloc !3
  %9 = trunc i64 %8 to i32
  %10 = sub i32 0, %9
  br label %11

11:                                               ; preds = %3, %5
  %12 = phi i32 [ %10, %5 ], [ 0, %3 ]
  ret i32 %12
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 65496}
