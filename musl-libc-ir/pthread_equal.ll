; ModuleID = 'src/thread/pthread_equal.c'
source_filename = "src/thread/pthread_equal.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__pthread = type opaque

@pthread_equal = weak alias i32 (%struct.__pthread*, %struct.__pthread*), i32 (%struct.__pthread*, %struct.__pthread*)* @__pthread_equal
@thrd_equal = weak alias i32 (%struct.__pthread*, %struct.__pthread*), i32 (%struct.__pthread*, %struct.__pthread*)* @__pthread_equal

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal i32 @__pthread_equal(%struct.__pthread* noundef readnone %0, %struct.__pthread* noundef readnone %1) #0 {
  %3 = icmp eq %struct.__pthread* %0, %1
  %4 = zext i1 %3 to i32
  ret i32 %4
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
