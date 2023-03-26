; ModuleID = 'src/env/getenv.c'
source_filename = "src/env/getenv.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__environ = external local_unnamed_addr global i8**, align 8

; Function Attrs: nounwind optsize strictfp
define i8* @getenv(i8* noundef %0) local_unnamed_addr #0 {
  %2 = tail call i8* @__strchrnul(i8* noundef %0, i32 noundef 61) #2
  %3 = ptrtoint i8* %2 to i64
  %4 = ptrtoint i8* %0 to i64
  %5 = sub i64 %3, %4
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %34, label %7

7:                                                ; preds = %1
  %8 = getelementptr inbounds i8, i8* %0, i64 %5
  %9 = load i8, i8* %8, align 1, !tbaa !3
  %10 = icmp eq i8 %9, 0
  %11 = load i8**, i8*** @__environ, align 8
  %12 = icmp ne i8** %11, null
  %13 = select i1 %10, i1 %12, i1 false
  br i1 %13, label %14, label %34

14:                                               ; preds = %7
  %15 = load i8*, i8** %11, align 8, !tbaa !6
  %16 = icmp eq i8* %15, null
  br i1 %16, label %34, label %17

17:                                               ; preds = %14, %27
  %18 = phi i8* [ %29, %27 ], [ %15, %14 ]
  %19 = phi i8** [ %28, %27 ], [ %11, %14 ]
  %20 = tail call i32 @strncmp(i8* noundef %0, i8* noundef nonnull %18, i64 noundef %5) #2
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %27

22:                                               ; preds = %17
  %23 = load i8*, i8** %19, align 8, !tbaa !6
  %24 = getelementptr inbounds i8, i8* %23, i64 %5
  %25 = load i8, i8* %24, align 1, !tbaa !3
  %26 = icmp eq i8 %25, 61
  br i1 %26, label %31, label %27

27:                                               ; preds = %17, %22
  %28 = getelementptr inbounds i8*, i8** %19, i64 1
  %29 = load i8*, i8** %28, align 8, !tbaa !6
  %30 = icmp eq i8* %29, null
  br i1 %30, label %34, label %17

31:                                               ; preds = %22
  %32 = getelementptr inbounds i8, i8* %23, i64 %5
  %33 = getelementptr inbounds i8, i8* %32, i64 1
  br label %34

34:                                               ; preds = %27, %14, %1, %7, %31
  %35 = phi i8* [ %33, %31 ], [ null, %7 ], [ null, %1 ], [ null, %14 ], [ null, %27 ]
  ret i8* %35
}

; Function Attrs: optsize
declare hidden i8* @__strchrnul(i8* noundef, i32 noundef) local_unnamed_addr #1

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
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !4, i64 0}
