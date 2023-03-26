; ModuleID = 'src/misc/getsubopt.c'
source_filename = "src/misc/getsubopt.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @getsubopt(i8** nocapture noundef %0, i8** nocapture noundef readonly %1, i8** nocapture noundef writeonly %2) local_unnamed_addr #0 {
  %4 = load i8*, i8** %0, align 8, !tbaa !3
  store i8* null, i8** %2, align 8, !tbaa !3
  %5 = tail call i8* @strchr(i8* noundef %4, i32 noundef 44) #2
  store i8* %5, i8** %0, align 8, !tbaa !3
  %6 = icmp eq i8* %5, null
  br i1 %6, label %9, label %7

7:                                                ; preds = %3
  %8 = getelementptr inbounds i8, i8* %5, i64 1
  store i8* %8, i8** %0, align 8, !tbaa !3
  store i8 0, i8* %5, align 1, !tbaa !7
  br label %12

9:                                                ; preds = %3
  %10 = tail call i64 @strlen(i8* noundef %4) #2
  %11 = getelementptr inbounds i8, i8* %4, i64 %10
  store i8* %11, i8** %0, align 8, !tbaa !3
  br label %12

12:                                               ; preds = %9, %7
  %13 = load i8*, i8** %1, align 8, !tbaa !3
  %14 = icmp eq i8* %13, null
  br i1 %14, label %37, label %15

15:                                               ; preds = %12, %30
  %16 = phi i64 [ %31, %30 ], [ 0, %12 ]
  %17 = phi i8* [ %33, %30 ], [ %13, %12 ]
  %18 = phi i8** [ %32, %30 ], [ %1, %12 ]
  %19 = tail call i64 @strlen(i8* noundef nonnull %17) #2
  %20 = load i8*, i8** %18, align 8, !tbaa !3
  %21 = tail call i32 @strncmp(i8* noundef %20, i8* noundef %4, i64 noundef %19) #2
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %30

23:                                               ; preds = %15
  %24 = getelementptr inbounds i8, i8* %4, i64 %19
  %25 = load i8, i8* %24, align 1, !tbaa !7
  switch i8 %25, label %30 [
    i8 61, label %26
    i8 0, label %35
  ]

26:                                               ; preds = %23
  %27 = getelementptr inbounds i8, i8* %4, i64 %19
  %28 = trunc i64 %16 to i32
  %29 = getelementptr inbounds i8, i8* %27, i64 1
  store i8* %29, i8** %2, align 8, !tbaa !3
  br label %37

30:                                               ; preds = %15, %23
  %31 = add nuw i64 %16, 1
  %32 = getelementptr inbounds i8*, i8** %1, i64 %31
  %33 = load i8*, i8** %32, align 8, !tbaa !3
  %34 = icmp eq i8* %33, null
  br i1 %34, label %37, label %15

35:                                               ; preds = %23
  %36 = trunc i64 %16 to i32
  br label %37

37:                                               ; preds = %30, %35, %12, %26
  %38 = phi i32 [ %28, %26 ], [ -1, %12 ], [ %36, %35 ], [ -1, %30 ]
  ret i32 %38
}

; Function Attrs: optsize
declare i8* @strchr(i8* noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @strncmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!5, !5, i64 0}
