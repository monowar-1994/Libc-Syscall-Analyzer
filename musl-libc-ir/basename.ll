; ModuleID = 'src/misc/basename.c'
source_filename = "src/misc/basename.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c".\00", align 1

@__xpg_basename = weak alias i8* (i8*), i8* (i8*)* @basename

; Function Attrs: nounwind optsize strictfp
define i8* @basename(i8* noundef %0) #0 {
  %2 = icmp eq i8* %0, null
  br i1 %2, label %30, label %3

3:                                                ; preds = %1
  %4 = load i8, i8* %0, align 1, !tbaa !3
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %30, label %6

6:                                                ; preds = %3
  %7 = tail call i64 @strlen(i8* noundef nonnull %0) #2
  %8 = add i64 %7, -1
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %18, label %10

10:                                               ; preds = %6, %15
  %11 = phi i64 [ %16, %15 ], [ %8, %6 ]
  %12 = getelementptr inbounds i8, i8* %0, i64 %11
  %13 = load i8, i8* %12, align 1, !tbaa !3
  %14 = icmp eq i8 %13, 47
  br i1 %14, label %15, label %18

15:                                               ; preds = %10
  store i8 0, i8* %12, align 1, !tbaa !3
  %16 = add i64 %11, -1
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %18, label %10

18:                                               ; preds = %10, %15, %6
  %19 = phi i64 [ 0, %6 ], [ %11, %10 ], [ 0, %15 ]
  br label %20

20:                                               ; preds = %18, %23
  %21 = phi i64 [ %24, %23 ], [ %19, %18 ]
  %22 = icmp eq i64 %21, 0
  br i1 %22, label %28, label %23

23:                                               ; preds = %20
  %24 = add i64 %21, -1
  %25 = getelementptr inbounds i8, i8* %0, i64 %24
  %26 = load i8, i8* %25, align 1, !tbaa !3
  %27 = icmp eq i8 %26, 47
  br i1 %27, label %28, label %20

28:                                               ; preds = %20, %23
  %29 = getelementptr inbounds i8, i8* %0, i64 %21
  br label %30

30:                                               ; preds = %1, %3, %28
  %31 = phi i8* [ %29, %28 ], [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), %3 ], [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), %1 ]
  ret i8* %31
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
