; ModuleID = 'src/legacy/daemon.c'
source_filename = "src/legacy/daemon.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"/\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"/dev/null\00", align 1

; Function Attrs: nounwind optsize strictfp
define i32 @daemon(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp eq i32 %0, 0
  br i1 %3, label %4, label %7

4:                                                ; preds = %2
  %5 = tail call i32 @chdir(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)) #3
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %38

7:                                                ; preds = %4, %2
  %8 = icmp eq i32 %1, 0
  br i1 %8, label %9, label %28

9:                                                ; preds = %7
  %10 = tail call i32 (i8*, i32, ...) @open(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 noundef 2) #3
  %11 = icmp slt i32 %10, 0
  br i1 %11, label %38, label %12

12:                                               ; preds = %9
  %13 = tail call i32 @dup2(i32 noundef %10, i32 noundef 0) #3
  %14 = icmp slt i32 %13, 0
  br i1 %14, label %21, label %15

15:                                               ; preds = %12
  %16 = tail call i32 @dup2(i32 noundef %10, i32 noundef 1) #3
  %17 = icmp slt i32 %16, 0
  br i1 %17, label %21, label %18

18:                                               ; preds = %15
  %19 = tail call i32 @dup2(i32 noundef %10, i32 noundef 2) #3
  %20 = icmp slt i32 %19, 0
  br i1 %20, label %21, label %22

21:                                               ; preds = %18, %15, %12
  br label %22

22:                                               ; preds = %21, %18
  %23 = phi i1 [ false, %21 ], [ true, %18 ]
  %24 = icmp ugt i32 %10, 2
  br i1 %24, label %25, label %27

25:                                               ; preds = %22
  %26 = tail call i32 @close(i32 noundef %10) #3
  br label %27

27:                                               ; preds = %25, %22
  br i1 %23, label %28, label %38

28:                                               ; preds = %27, %7
  %29 = tail call i32 @fork() #3
  switch i32 %29, label %30 [
    i32 0, label %31
    i32 -1, label %38
  ]

30:                                               ; preds = %28
  tail call void @_exit(i32 noundef 0) #4
  unreachable

31:                                               ; preds = %28
  %32 = tail call i32 @setsid() #3
  %33 = icmp slt i32 %32, 0
  br i1 %33, label %38, label %34

34:                                               ; preds = %31
  %35 = tail call i32 @fork() #3
  switch i32 %35, label %36 [
    i32 0, label %37
    i32 -1, label %38
  ]

36:                                               ; preds = %34
  tail call void @_exit(i32 noundef 0) #4
  unreachable

37:                                               ; preds = %34
  br label %38

38:                                               ; preds = %27, %9, %34, %31, %28, %4, %37
  %39 = phi i32 [ 0, %37 ], [ -1, %4 ], [ %29, %28 ], [ -1, %31 ], [ %35, %34 ], [ -1, %9 ], [ -1, %27 ]
  ret i32 %39
}

; Function Attrs: optsize
declare i32 @chdir(i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @open(i8* noundef, i32 noundef, ...) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @dup2(i32 noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @close(i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @fork() local_unnamed_addr #1

; Function Attrs: noreturn optsize
declare void @_exit(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @setsid() local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { nobuiltin noreturn nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
