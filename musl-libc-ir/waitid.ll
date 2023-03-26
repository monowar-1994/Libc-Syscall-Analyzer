; ModuleID = 'src/process/waitid.c'
source_filename = "src/process/waitid.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.siginfo_t = type { i32, i32, i32, %union.anon }
%union.anon = type { %struct.anon, [80 x i8] }
%struct.anon = type { %union.anon.0, %union.anon.3 }
%union.anon.0 = type { %struct.anon.1 }
%struct.anon.1 = type { i32, i32 }
%union.anon.3 = type { %struct.anon.4 }
%struct.anon.4 = type { i32, i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @waitid(i32 noundef %0, i32 noundef %1, %struct.siginfo_t* noundef %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = zext i32 %0 to i64
  %6 = zext i32 %1 to i64
  %7 = ptrtoint %struct.siginfo_t* %2 to i64
  %8 = sext i32 %3 to i64
  %9 = tail call i64 @__syscall_cp(i64 noundef 247, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8, i64 noundef 0, i64 noundef 0) #2
  %10 = tail call i64 @__syscall_ret(i64 noundef %9) #2
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i64 @__syscall_cp(i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
