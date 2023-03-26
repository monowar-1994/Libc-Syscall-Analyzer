; ModuleID = 'src/unistd/close.c'
source_filename = "src/unistd/close.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__aio_close = weak hidden alias i32 (i32), i32 (i32)* @dummy

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal i32 @dummy(i32 noundef returned %0) #0 {
  ret i32 %0
}

; Function Attrs: nounwind optsize strictfp
define i32 @close(i32 noundef %0) local_unnamed_addr #1 {
  %2 = tail call i32 @__aio_close(i32 noundef %0) #3
  %3 = sext i32 %2 to i64
  %4 = tail call i64 @__syscall_cp(i64 noundef 3, i64 noundef %3, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #3
  %5 = trunc i64 %4 to i32
  %6 = icmp eq i32 %5, -4
  %7 = shl i64 %4, 32
  %8 = ashr exact i64 %7, 32
  %9 = select i1 %6, i64 0, i64 %8
  %10 = tail call i64 @__syscall_ret(i64 noundef %9) #3
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

; Function Attrs: optsize
declare hidden i64 @__syscall_cp(i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
