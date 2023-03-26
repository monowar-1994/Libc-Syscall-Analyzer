; ModuleID = 'crt/crt1.c'
source_filename = "crt/crt1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

module asm ".text "
module asm ".global _start "
module asm "_start: "
module asm "\09xor %rbp,%rbp "
module asm "\09mov %rsp,%rdi "
module asm ".weak _DYNAMIC "
module asm ".hidden _DYNAMIC "
module asm "\09lea _DYNAMIC(%rip),%rsi "
module asm "\09andq $-16,%rsp "
module asm "\09call _start_c "

; Function Attrs: nounwind optsize strictfp
define dso_local void @_start_c(i64* noundef %0) local_unnamed_addr #0 {
  %2 = load i64, i64* %0, align 8, !tbaa !4
  %3 = trunc i64 %2 to i32
  %4 = getelementptr inbounds i64, i64* %0, i64 1
  %5 = bitcast i64* %4 to i8**
  %6 = tail call i32 @__libc_start_main(i32 (...)* noundef nonnull @main, i32 noundef %3, i8** noundef nonnull %5, void (...)* noundef @_init, void (...)* noundef @_fini, void (...)* noundef null) #2
  ret void
}

; Function Attrs: optsize
declare i32 @__libc_start_main(i32 (...)* noundef, i32 noundef, i8** noundef, void (...)* noundef, void (...)* noundef, void (...)* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @main(...) #1

; Function Attrs: optsize
declare extern_weak void @_init(...) #1

; Function Attrs: optsize
declare extern_weak void @_fini(...) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"Ubuntu clang version 14.0.6"}
!4 = !{!5, !5, i64 0}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
