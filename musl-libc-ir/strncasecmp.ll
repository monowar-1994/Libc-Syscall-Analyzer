; ModuleID = 'src/string/strncasecmp.c'
source_filename = "src/string/strncasecmp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__locale_struct = type opaque

@strncasecmp_l = weak alias i32 (i8*, i8*, i64, %struct.__locale_struct*), i32 (i8*, i8*, i64, %struct.__locale_struct*)* @__strncasecmp_l

; Function Attrs: nounwind strictfp
define i32 @strncasecmp(i8* nocapture noundef readonly %0, i8* nocapture noundef readonly %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = icmp eq i64 %2, 0
  br i1 %4, label %43, label %5

5:                                                ; preds = %3
  %6 = load i8, i8* %0, align 1, !tbaa !3
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %34, label %8

8:                                                ; preds = %5, %29
  %9 = phi i8 [ %32, %29 ], [ %6, %5 ]
  %10 = phi i64 [ %13, %29 ], [ %2, %5 ]
  %11 = phi i8* [ %31, %29 ], [ %1, %5 ]
  %12 = phi i8* [ %30, %29 ], [ %0, %5 ]
  %13 = add i64 %10, -1
  %14 = zext i8 %9 to i32
  %15 = load i8, i8* %11, align 1, !tbaa !3
  %16 = icmp ne i8 %15, 0
  %17 = icmp ne i64 %13, 0
  %18 = select i1 %16, i1 %17, i1 false
  br i1 %18, label %19, label %34

19:                                               ; preds = %8
  %20 = icmp eq i8 %9, %15
  br i1 %20, label %29, label %21

21:                                               ; preds = %19
  %22 = tail call i32 @tolower(i32 noundef %14) #2
  %23 = load i8, i8* %11, align 1, !tbaa !3
  %24 = zext i8 %23 to i32
  %25 = tail call i32 @tolower(i32 noundef %24) #2
  %26 = icmp eq i32 %22, %25
  br i1 %26, label %29, label %27

27:                                               ; preds = %21
  %28 = load i8, i8* %12, align 1, !tbaa !3
  br label %34

29:                                               ; preds = %19, %21
  %30 = getelementptr inbounds i8, i8* %12, i64 1
  %31 = getelementptr inbounds i8, i8* %11, i64 1
  %32 = load i8, i8* %30, align 1, !tbaa !3
  %33 = icmp eq i8 %32, 0
  br i1 %33, label %34, label %8

34:                                               ; preds = %8, %29, %27, %5
  %35 = phi i8 [ 0, %5 ], [ %28, %27 ], [ %9, %8 ], [ 0, %29 ]
  %36 = phi i8* [ %1, %5 ], [ %11, %27 ], [ %11, %8 ], [ %31, %29 ]
  %37 = zext i8 %35 to i32
  %38 = tail call i32 @tolower(i32 noundef %37) #2
  %39 = load i8, i8* %36, align 1, !tbaa !3
  %40 = zext i8 %39 to i32
  %41 = tail call i32 @tolower(i32 noundef %40) #2
  %42 = sub nsw i32 %38, %41
  br label %43

43:                                               ; preds = %3, %34
  %44 = phi i32 [ %42, %34 ], [ 0, %3 ]
  ret i32 %44
}

declare i32 @tolower(i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind strictfp
define i32 @__strncasecmp_l(i8* nocapture noundef readonly %0, i8* nocapture noundef readonly %1, i64 noundef %2, %struct.__locale_struct* nocapture readnone %3) #0 {
  %5 = icmp eq i64 %2, 0
  br i1 %5, label %44, label %6

6:                                                ; preds = %4
  %7 = load i8, i8* %0, align 1, !tbaa !3
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %35, label %9

9:                                                ; preds = %6, %30
  %10 = phi i8 [ %33, %30 ], [ %7, %6 ]
  %11 = phi i64 [ %14, %30 ], [ %2, %6 ]
  %12 = phi i8* [ %32, %30 ], [ %1, %6 ]
  %13 = phi i8* [ %31, %30 ], [ %0, %6 ]
  %14 = add i64 %11, -1
  %15 = zext i8 %10 to i32
  %16 = load i8, i8* %12, align 1, !tbaa !3
  %17 = icmp ne i8 %16, 0
  %18 = icmp ne i64 %14, 0
  %19 = select i1 %17, i1 %18, i1 false
  br i1 %19, label %20, label %35

20:                                               ; preds = %9
  %21 = icmp eq i8 %10, %16
  br i1 %21, label %30, label %22

22:                                               ; preds = %20
  %23 = tail call i32 @tolower(i32 noundef %15) #2
  %24 = load i8, i8* %12, align 1, !tbaa !3
  %25 = zext i8 %24 to i32
  %26 = tail call i32 @tolower(i32 noundef %25) #2
  %27 = icmp eq i32 %23, %26
  br i1 %27, label %30, label %28

28:                                               ; preds = %22
  %29 = load i8, i8* %13, align 1, !tbaa !3
  br label %35

30:                                               ; preds = %22, %20
  %31 = getelementptr inbounds i8, i8* %13, i64 1
  %32 = getelementptr inbounds i8, i8* %12, i64 1
  %33 = load i8, i8* %31, align 1, !tbaa !3
  %34 = icmp eq i8 %33, 0
  br i1 %34, label %35, label %9

35:                                               ; preds = %30, %9, %28, %6
  %36 = phi i8 [ 0, %6 ], [ %29, %28 ], [ 0, %30 ], [ %10, %9 ]
  %37 = phi i8* [ %1, %6 ], [ %12, %28 ], [ %32, %30 ], [ %12, %9 ]
  %38 = zext i8 %36 to i32
  %39 = tail call i32 @tolower(i32 noundef %38) #2
  %40 = load i8, i8* %37, align 1, !tbaa !3
  %41 = zext i8 %40 to i32
  %42 = tail call i32 @tolower(i32 noundef %41) #2
  %43 = sub nsw i32 %39, %42
  br label %44

44:                                               ; preds = %4, %35
  %45 = phi i32 [ %43, %35 ], [ 0, %4 ]
  ret i32 %45
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
