; ModuleID = 'src/ipc/shmctl.c'
source_filename = "src/ipc/shmctl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.shmid_ds = type { %struct.ipc_perm, i64, i64, i64, i64, i32, i32, i64, i64, i64 }
%struct.ipc_perm = type { i32, i32, i32, i32, i32, i32, i32, i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @shmctl(i32 noundef %0, i32 noundef %1, %struct.shmid_ds* noundef %2) local_unnamed_addr #0 {
  %4 = sext i32 %0 to i64
  %5 = sext i32 %1 to i64
  %6 = ptrtoint %struct.shmid_ds* %2 to i64
  %7 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 31, i64 %4, i64 %5, i64 %6) #2, !srcloc !3
  %8 = shl i64 %7, 32
  %9 = ashr exact i64 %8, 32
  %10 = tail call i64 @__syscall_ret(i64 noundef %9) #3
  %11 = trunc i64 %10 to i32
  ret i32 %11
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
!3 = !{i64 89343}
