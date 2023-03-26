; ModuleID = 'src/misc/dirname.c'
source_filename = "src/misc/dirname.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"/\00", align 1

; Function Attrs: nounwind optsize strictfp
define i8* @dirname(i8* noundef %0) local_unnamed_addr #0 {
  %2 = icmp eq i8* %0, null
  br i1 %2, label %34, label %3

3:                                                ; preds = %1
  %4 = load i8, i8* %0, align 1, !tbaa !3
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %34, label %6

6:                                                ; preds = %3
  %7 = tail call i64 @strlen(i8* noundef nonnull %0) #2
  br label %8

8:                                                ; preds = %14, %6
  %9 = phi i64 [ %7, %6 ], [ %10, %14 ]
  %10 = add i64 %9, -1
  %11 = getelementptr inbounds i8, i8* %0, i64 %10
  %12 = load i8, i8* %11, align 1, !tbaa !3
  %13 = icmp eq i8 %12, 47
  br i1 %13, label %14, label %16

14:                                               ; preds = %8
  %15 = icmp eq i64 %10, 0
  br i1 %15, label %34, label %8

16:                                               ; preds = %8, %19
  %17 = phi i64 [ %20, %19 ], [ %10, %8 ]
  %18 = icmp eq i64 %17, 0
  br i1 %18, label %34, label %19

19:                                               ; preds = %16
  %20 = add i64 %17, -1
  %21 = getelementptr inbounds i8, i8* %0, i64 %20
  %22 = load i8, i8* %21, align 1, !tbaa !3
  %23 = icmp eq i8 %22, 47
  br i1 %23, label %24, label %16

24:                                               ; preds = %19, %27
  %25 = phi i64 [ %28, %27 ], [ %20, %19 ]
  %26 = icmp eq i64 %25, 0
  br i1 %26, label %34, label %27

27:                                               ; preds = %24
  %28 = add i64 %25, -1
  %29 = getelementptr inbounds i8, i8* %0, i64 %28
  %30 = load i8, i8* %29, align 1, !tbaa !3
  %31 = icmp eq i8 %30, 47
  br i1 %31, label %24, label %32

32:                                               ; preds = %27
  %33 = getelementptr inbounds i8, i8* %0, i64 %25
  store i8 0, i8* %33, align 1, !tbaa !3
  br label %34

34:                                               ; preds = %14, %16, %24, %1, %3, %32
  %35 = phi i8* [ %0, %32 ], [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), %3 ], [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), %1 ], [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0), %24 ], [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), %16 ], [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0), %14 ]
  ret i8* %35
}

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
