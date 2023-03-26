; ModuleID = 'src/time/nanosleep.c'
source_filename = "src/time/nanosleep.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timespec = type { i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @nanosleep(%struct.timespec* noundef %0, %struct.timespec* noundef %1) local_unnamed_addr #0 {
  %3 = tail call i32 @__clock_nanosleep(i32 noundef 0, i32 noundef 0, %struct.timespec* noundef %0, %struct.timespec* noundef %1) #2
  %4 = sub nsw i32 0, %3
  %5 = sext i32 %4 to i64
  %6 = tail call i64 @__syscall_ret(i64 noundef %5) #2
  %7 = trunc i64 %6 to i32
  ret i32 %7
}

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i32 @__clock_nanosleep(i32 noundef, i32 noundef, %struct.timespec* noundef, %struct.timespec* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
