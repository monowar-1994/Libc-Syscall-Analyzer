; ModuleID = 'src/signal/block.c'
source_filename = "src/signal/block.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@all_mask = internal constant [1 x i64] [i64 -1], align 8
@app_mask = internal constant [1 x i64] [i64 -15032385537], align 8

; Function Attrs: nounwind optsize strictfp
define hidden void @__block_all_sigs(i8* noundef %0) local_unnamed_addr #0 {
  %2 = ptrtoint i8* %0 to i64
  %3 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 14, i64 0, i64 ptrtoint ([1 x i64]* @all_mask to i64), i64 %2, i64 8) #1, !srcloc !3
  ret void
}

; Function Attrs: nounwind optsize strictfp
define hidden void @__block_app_sigs(i8* noundef %0) local_unnamed_addr #0 {
  %2 = ptrtoint i8* %0 to i64
  %3 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 14, i64 0, i64 ptrtoint ([1 x i64]* @app_mask to i64), i64 %2, i64 8) #1, !srcloc !3
  ret void
}

; Function Attrs: nounwind optsize strictfp
define hidden void @__restore_sigs(i8* noundef %0) local_unnamed_addr #0 {
  %2 = ptrtoint i8* %0 to i64
  %3 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 14, i64 2, i64 %2, i64 0, i64 8) #1, !srcloc !3
  ret void
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 204921}
