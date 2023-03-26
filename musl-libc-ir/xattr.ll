; ModuleID = 'src/linux/xattr.c'
source_filename = "src/linux/xattr.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i64 @getxattr(i8* noundef %0, i8* noundef %1, i8* noundef %2, i64 noundef %3) local_unnamed_addr #0 {
  %5 = ptrtoint i8* %0 to i64
  %6 = ptrtoint i8* %1 to i64
  %7 = ptrtoint i8* %2 to i64
  %8 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 191, i64 %5, i64 %6, i64 %7, i64 %3) #2, !srcloc !3
  %9 = tail call i64 @__syscall_ret(i64 noundef %8) #3
  ret i64 %9
}

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i64 @lgetxattr(i8* noundef %0, i8* noundef %1, i8* noundef %2, i64 noundef %3) local_unnamed_addr #0 {
  %5 = ptrtoint i8* %0 to i64
  %6 = ptrtoint i8* %1 to i64
  %7 = ptrtoint i8* %2 to i64
  %8 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 192, i64 %5, i64 %6, i64 %7, i64 %3) #2, !srcloc !3
  %9 = tail call i64 @__syscall_ret(i64 noundef %8) #3
  ret i64 %9
}

; Function Attrs: nounwind optsize strictfp
define i64 @fgetxattr(i32 noundef %0, i8* noundef %1, i8* noundef %2, i64 noundef %3) local_unnamed_addr #0 {
  %5 = sext i32 %0 to i64
  %6 = ptrtoint i8* %1 to i64
  %7 = ptrtoint i8* %2 to i64
  %8 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 193, i64 %5, i64 %6, i64 %7, i64 %3) #2, !srcloc !3
  %9 = tail call i64 @__syscall_ret(i64 noundef %8) #3
  ret i64 %9
}

; Function Attrs: nounwind optsize strictfp
define i64 @listxattr(i8* noundef %0, i8* noundef %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = ptrtoint i8* %0 to i64
  %5 = ptrtoint i8* %1 to i64
  %6 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 194, i64 %4, i64 %5, i64 %2) #2, !srcloc !4
  %7 = tail call i64 @__syscall_ret(i64 noundef %6) #3
  ret i64 %7
}

; Function Attrs: nounwind optsize strictfp
define i64 @llistxattr(i8* noundef %0, i8* noundef %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = ptrtoint i8* %0 to i64
  %5 = ptrtoint i8* %1 to i64
  %6 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 195, i64 %4, i64 %5, i64 %2) #2, !srcloc !4
  %7 = tail call i64 @__syscall_ret(i64 noundef %6) #3
  ret i64 %7
}

; Function Attrs: nounwind optsize strictfp
define i64 @flistxattr(i32 noundef %0, i8* noundef %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = sext i32 %0 to i64
  %5 = ptrtoint i8* %1 to i64
  %6 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 196, i64 %4, i64 %5, i64 %2) #2, !srcloc !4
  %7 = tail call i64 @__syscall_ret(i64 noundef %6) #3
  ret i64 %7
}

; Function Attrs: nounwind optsize strictfp
define i32 @setxattr(i8* noundef %0, i8* noundef %1, i8* noundef %2, i64 noundef %3, i32 noundef %4) local_unnamed_addr #0 {
  %6 = ptrtoint i8* %0 to i64
  %7 = ptrtoint i8* %1 to i64
  %8 = ptrtoint i8* %2 to i64
  %9 = sext i32 %4 to i64
  %10 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},{r8},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 188, i64 %6, i64 %7, i64 %8, i64 %3, i64 %9) #2, !srcloc !5
  %11 = tail call i64 @__syscall_ret(i64 noundef %10) #3
  %12 = trunc i64 %11 to i32
  ret i32 %12
}

; Function Attrs: nounwind optsize strictfp
define i32 @lsetxattr(i8* noundef %0, i8* noundef %1, i8* noundef %2, i64 noundef %3, i32 noundef %4) local_unnamed_addr #0 {
  %6 = ptrtoint i8* %0 to i64
  %7 = ptrtoint i8* %1 to i64
  %8 = ptrtoint i8* %2 to i64
  %9 = sext i32 %4 to i64
  %10 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},{r8},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 189, i64 %6, i64 %7, i64 %8, i64 %3, i64 %9) #2, !srcloc !5
  %11 = tail call i64 @__syscall_ret(i64 noundef %10) #3
  %12 = trunc i64 %11 to i32
  ret i32 %12
}

; Function Attrs: nounwind optsize strictfp
define i32 @fsetxattr(i32 noundef %0, i8* noundef %1, i8* noundef %2, i64 noundef %3, i32 noundef %4) local_unnamed_addr #0 {
  %6 = sext i32 %0 to i64
  %7 = ptrtoint i8* %1 to i64
  %8 = ptrtoint i8* %2 to i64
  %9 = sext i32 %4 to i64
  %10 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},{r8},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 190, i64 %6, i64 %7, i64 %8, i64 %3, i64 %9) #2, !srcloc !5
  %11 = tail call i64 @__syscall_ret(i64 noundef %10) #3
  %12 = trunc i64 %11 to i32
  ret i32 %12
}

; Function Attrs: nounwind optsize strictfp
define i32 @removexattr(i8* noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = ptrtoint i8* %0 to i64
  %4 = ptrtoint i8* %1 to i64
  %5 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 197, i64 %3, i64 %4) #2, !srcloc !6
  %6 = tail call i64 @__syscall_ret(i64 noundef %5) #3
  %7 = trunc i64 %6 to i32
  ret i32 %7
}

; Function Attrs: nounwind optsize strictfp
define i32 @lremovexattr(i8* noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = ptrtoint i8* %0 to i64
  %4 = ptrtoint i8* %1 to i64
  %5 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 198, i64 %3, i64 %4) #2, !srcloc !6
  %6 = tail call i64 @__syscall_ret(i64 noundef %5) #3
  %7 = trunc i64 %6 to i32
  ret i32 %7
}

; Function Attrs: nounwind optsize strictfp
define i32 @fremovexattr(i32 noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = sext i32 %0 to i64
  %4 = ptrtoint i8* %1 to i64
  %5 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 199, i64 %3, i64 %4) #2, !srcloc !6
  %6 = tail call i64 @__syscall_ret(i64 noundef %5) #3
  %7 = trunc i64 %6 to i32
  ret i32 %7
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind strictfp }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 63476}
!4 = !{i64 63206}
!5 = !{i64 63802}
!6 = !{i64 62994}
