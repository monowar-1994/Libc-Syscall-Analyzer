; ModuleID = 'src/misc/login_tty.c'
source_filename = "src/misc/login_tty.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @login_tty(i32 noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @setsid() #2
  %3 = tail call i32 (i32, i32, ...) @ioctl(i32 noundef %0, i32 noundef 21518, i8* noundef null) #2
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %12

5:                                                ; preds = %1
  %6 = tail call i32 @dup2(i32 noundef %0, i32 noundef 0) #2
  %7 = tail call i32 @dup2(i32 noundef %0, i32 noundef 1) #2
  %8 = tail call i32 @dup2(i32 noundef %0, i32 noundef 2) #2
  %9 = icmp sgt i32 %0, 2
  br i1 %9, label %10, label %12

10:                                               ; preds = %5
  %11 = tail call i32 @close(i32 noundef %0) #2
  br label %12

12:                                               ; preds = %5, %10, %1
  %13 = phi i32 [ -1, %1 ], [ 0, %10 ], [ 0, %5 ]
  ret i32 %13
}

; Function Attrs: optsize
declare i32 @setsid() local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @ioctl(i32 noundef, i32 noundef, ...) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @dup2(i32 noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @close(i32 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
