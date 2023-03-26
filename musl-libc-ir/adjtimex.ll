; ModuleID = 'src/linux/adjtimex.c'
source_filename = "src/linux/adjtimex.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timex = type { i32, i64, i64, i64, i64, i32, i64, i64, i64, %struct.timeval, i64, i64, i64, i32, i64, i64, i64, i64, i64, i32, [11 x i32] }
%struct.timeval = type { i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @adjtimex(%struct.timex* noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @clock_adjtime(i32 noundef 0, %struct.timex* noundef %0) #2
  ret i32 %2
}

; Function Attrs: optsize
declare i32 @clock_adjtime(i32 noundef, %struct.timex* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
