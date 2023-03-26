; ModuleID = 'src/string/strcasecmp.c'
source_filename = "src/string/strcasecmp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__locale_struct = type opaque

@strcasecmp_l = weak alias i32 (i8*, i8*, %struct.__locale_struct*), i32 (i8*, i8*, %struct.__locale_struct*)* @__strcasecmp_l

; Function Attrs: nounwind strictfp
define i32 @strcasecmp(i8* nocapture noundef readonly %0, i8* nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = load i8, i8* %0, align 1, !tbaa !3
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %27, label %5

5:                                                ; preds = %2, %22
  %6 = phi i8 [ %25, %22 ], [ %3, %2 ]
  %7 = phi i8* [ %24, %22 ], [ %1, %2 ]
  %8 = phi i8* [ %23, %22 ], [ %0, %2 ]
  %9 = zext i8 %6 to i32
  %10 = load i8, i8* %7, align 1, !tbaa !3
  %11 = icmp eq i8 %10, 0
  br i1 %11, label %27, label %12

12:                                               ; preds = %5
  %13 = icmp eq i8 %6, %10
  br i1 %13, label %22, label %14

14:                                               ; preds = %12
  %15 = tail call i32 @tolower(i32 noundef %9) #2
  %16 = load i8, i8* %7, align 1, !tbaa !3
  %17 = zext i8 %16 to i32
  %18 = tail call i32 @tolower(i32 noundef %17) #2
  %19 = icmp eq i32 %15, %18
  br i1 %19, label %22, label %20

20:                                               ; preds = %14
  %21 = load i8, i8* %8, align 1, !tbaa !3
  br label %27

22:                                               ; preds = %12, %14
  %23 = getelementptr inbounds i8, i8* %8, i64 1
  %24 = getelementptr inbounds i8, i8* %7, i64 1
  %25 = load i8, i8* %23, align 1, !tbaa !3
  %26 = icmp eq i8 %25, 0
  br i1 %26, label %27, label %5

27:                                               ; preds = %5, %22, %20, %2
  %28 = phi i8 [ 0, %2 ], [ %21, %20 ], [ %6, %5 ], [ 0, %22 ]
  %29 = phi i8* [ %1, %2 ], [ %7, %20 ], [ %7, %5 ], [ %24, %22 ]
  %30 = zext i8 %28 to i32
  %31 = tail call i32 @tolower(i32 noundef %30) #2
  %32 = load i8, i8* %29, align 1, !tbaa !3
  %33 = zext i8 %32 to i32
  %34 = tail call i32 @tolower(i32 noundef %33) #2
  %35 = sub nsw i32 %31, %34
  ret i32 %35
}

declare i32 @tolower(i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind strictfp
define i32 @__strcasecmp_l(i8* nocapture noundef readonly %0, i8* nocapture noundef readonly %1, %struct.__locale_struct* nocapture readnone %2) #0 {
  %4 = load i8, i8* %0, align 1, !tbaa !3
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %28, label %6

6:                                                ; preds = %3, %23
  %7 = phi i8 [ %26, %23 ], [ %4, %3 ]
  %8 = phi i8* [ %25, %23 ], [ %1, %3 ]
  %9 = phi i8* [ %24, %23 ], [ %0, %3 ]
  %10 = zext i8 %7 to i32
  %11 = load i8, i8* %8, align 1, !tbaa !3
  %12 = icmp eq i8 %11, 0
  br i1 %12, label %28, label %13

13:                                               ; preds = %6
  %14 = icmp eq i8 %7, %11
  br i1 %14, label %23, label %15

15:                                               ; preds = %13
  %16 = tail call i32 @tolower(i32 noundef %10) #2
  %17 = load i8, i8* %8, align 1, !tbaa !3
  %18 = zext i8 %17 to i32
  %19 = tail call i32 @tolower(i32 noundef %18) #2
  %20 = icmp eq i32 %16, %19
  br i1 %20, label %23, label %21

21:                                               ; preds = %15
  %22 = load i8, i8* %9, align 1, !tbaa !3
  br label %28

23:                                               ; preds = %15, %13
  %24 = getelementptr inbounds i8, i8* %9, i64 1
  %25 = getelementptr inbounds i8, i8* %8, i64 1
  %26 = load i8, i8* %24, align 1, !tbaa !3
  %27 = icmp eq i8 %26, 0
  br i1 %27, label %28, label %6

28:                                               ; preds = %6, %23, %3, %21
  %29 = phi i8 [ 0, %3 ], [ %22, %21 ], [ 0, %23 ], [ %7, %6 ]
  %30 = phi i8* [ %1, %3 ], [ %8, %21 ], [ %25, %23 ], [ %8, %6 ]
  %31 = zext i8 %29 to i32
  %32 = tail call i32 @tolower(i32 noundef %31) #2
  %33 = load i8, i8* %30, align 1, !tbaa !3
  %34 = zext i8 %33 to i32
  %35 = tail call i32 @tolower(i32 noundef %34) #2
  %36 = sub nsw i32 %32, %35
  ret i32 %36
}

attributes #0 = { nounwind strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
