; ModuleID = 'src/time/clock_nanosleep.c'
source_filename = "src/time/clock_nanosleep.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timespec = type { i64, i64 }

@clock_nanosleep = weak alias i32 (i32, i32, %struct.timespec*, %struct.timespec*), i32 (i32, i32, %struct.timespec*, %struct.timespec*)* @__clock_nanosleep

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__clock_nanosleep(i32 noundef %0, i32 noundef %1, %struct.timespec* noundef %2, %struct.timespec* noundef %3) #0 {
  %5 = icmp eq i32 %0, 3
  br i1 %5, label %23, label %6

6:                                                ; preds = %4
  %7 = or i32 %1, %0
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %15

9:                                                ; preds = %6
  %10 = ptrtoint %struct.timespec* %2 to i64
  %11 = ptrtoint %struct.timespec* %3 to i64
  %12 = tail call i64 @__syscall_cp(i64 noundef 35, i64 noundef %10, i64 noundef %11, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #2
  %13 = trunc i64 %12 to i32
  %14 = sub i32 0, %13
  br label %23

15:                                               ; preds = %6
  %16 = sext i32 %0 to i64
  %17 = sext i32 %1 to i64
  %18 = ptrtoint %struct.timespec* %2 to i64
  %19 = ptrtoint %struct.timespec* %3 to i64
  %20 = tail call i64 @__syscall_cp(i64 noundef 230, i64 noundef %16, i64 noundef %17, i64 noundef %18, i64 noundef %19, i64 noundef 0, i64 noundef 0) #2
  %21 = trunc i64 %20 to i32
  %22 = sub i32 0, %21
  br label %23

23:                                               ; preds = %4, %15, %9
  %24 = phi i32 [ %22, %15 ], [ %14, %9 ], [ 22, %4 ]
  ret i32 %24
}

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
