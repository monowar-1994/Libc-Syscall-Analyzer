; ModuleID = 'src/env/putenv.c'
source_filename = "src/env/putenv.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__environ = external local_unnamed_addr global i8**, align 8
@__putenv.oldenv = internal unnamed_addr global i8** null, align 8

@__env_rm_add = weak hidden alias void (i8*, i8*), void (i8*, i8*)* @dummy

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal void @dummy(i8* nocapture noundef %0, i8* nocapture noundef %1) #0 {
  ret void
}

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__putenv(i8* noundef %0, i64 noundef %1, i8* noundef %2) local_unnamed_addr #1 {
  %4 = load i8**, i8*** @__environ, align 8, !tbaa !3
  %5 = icmp eq i8** %4, null
  br i1 %5, label %26, label %6

6:                                                ; preds = %3
  %7 = load i8*, i8** %4, align 8, !tbaa !3
  %8 = icmp eq i8* %7, null
  br i1 %8, label %26, label %9

9:                                                ; preds = %6
  %10 = add i64 %1, 1
  br label %11

11:                                               ; preds = %9, %19
  %12 = phi i8* [ %7, %9 ], [ %22, %19 ]
  %13 = phi i8** [ %4, %9 ], [ %20, %19 ]
  %14 = phi i64 [ 0, %9 ], [ %21, %19 ]
  %15 = tail call i32 @strncmp(i8* noundef %0, i8* noundef nonnull %12, i64 noundef %10) #3
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

17:                                               ; preds = %11
  %18 = load i8*, i8** %13, align 8, !tbaa !3
  store i8* %0, i8** %13, align 8, !tbaa !3
  tail call void @__env_rm_add(i8* noundef %18, i8* noundef %2) #3
  br label %58

19:                                               ; preds = %11
  %20 = getelementptr inbounds i8*, i8** %13, i64 1
  %21 = add i64 %14, 1
  %22 = load i8*, i8** %20, align 8, !tbaa !3
  %23 = icmp eq i8* %22, null
  br i1 %23, label %24, label %11

24:                                               ; preds = %19
  %25 = load i8**, i8*** @__environ, align 8, !tbaa !3
  br label %26

26:                                               ; preds = %24, %6, %3
  %27 = phi i8** [ null, %3 ], [ %4, %6 ], [ %25, %24 ]
  %28 = phi i64 [ 0, %3 ], [ 0, %6 ], [ %21, %24 ]
  %29 = load i8**, i8*** @__putenv.oldenv, align 8, !tbaa !3
  %30 = icmp eq i8** %27, %29
  br i1 %30, label %31, label %37

31:                                               ; preds = %26
  %32 = bitcast i8** %27 to i8*
  %33 = shl i64 %28, 3
  %34 = add i64 %33, 16
  %35 = tail call i8* @realloc(i8* noundef %32, i64 noundef %34) #3
  %36 = icmp eq i8* %35, null
  br i1 %36, label %57, label %49

37:                                               ; preds = %26
  %38 = shl i64 %28, 3
  %39 = add i64 %38, 16
  %40 = tail call i8* @malloc(i64 noundef %39) #3
  %41 = icmp eq i8* %40, null
  br i1 %41, label %57, label %42

42:                                               ; preds = %37
  %43 = icmp eq i64 %28, 0
  br i1 %43, label %47, label %44

44:                                               ; preds = %42
  %45 = load i8*, i8** bitcast (i8*** @__environ to i8**), align 8, !tbaa !3
  %46 = tail call i8* @memcpy(i8* noundef nonnull %40, i8* noundef %45, i64 noundef %38) #3
  br label %47

47:                                               ; preds = %44, %42
  %48 = load i8*, i8** bitcast (i8*** @__putenv.oldenv to i8**), align 8, !tbaa !3
  tail call void @free(i8* noundef %48) #3
  br label %49

49:                                               ; preds = %31, %47
  %50 = phi i8* [ %35, %31 ], [ %40, %47 ]
  %51 = bitcast i8* %50 to i8**
  %52 = getelementptr inbounds i8*, i8** %51, i64 %28
  store i8* %0, i8** %52, align 8, !tbaa !3
  %53 = add i64 %28, 1
  %54 = getelementptr inbounds i8*, i8** %51, i64 %53
  store i8* null, i8** %54, align 8, !tbaa !3
  store i8* %50, i8** bitcast (i8*** @__putenv.oldenv to i8**), align 8, !tbaa !3
  store i8* %50, i8** bitcast (i8*** @__environ to i8**), align 8, !tbaa !3
  %55 = icmp eq i8* %2, null
  br i1 %55, label %58, label %56

56:                                               ; preds = %49
  tail call void @__env_rm_add(i8* noundef null, i8* noundef nonnull %2) #3
  br label %58

57:                                               ; preds = %37, %31
  tail call void @free(i8* noundef %2) #3
  br label %58

58:                                               ; preds = %17, %57, %56, %49
  %59 = phi i32 [ 0, %17 ], [ -1, %57 ], [ 0, %56 ], [ 0, %49 ]
  ret i32 %59
}

; Function Attrs: optsize
declare i32 @strncmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @realloc(i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @malloc(i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define i32 @putenv(i8* noundef %0) local_unnamed_addr #1 {
  %2 = tail call i8* @__strchrnul(i8* noundef %0, i32 noundef 61) #3
  %3 = ptrtoint i8* %2 to i64
  %4 = ptrtoint i8* %0 to i64
  %5 = sub i64 %3, %4
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %11, label %7

7:                                                ; preds = %1
  %8 = getelementptr inbounds i8, i8* %0, i64 %5
  %9 = load i8, i8* %8, align 1, !tbaa !7
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %11, label %13

11:                                               ; preds = %7, %1
  %12 = tail call i32 @unsetenv(i8* noundef %0) #3
  br label %15

13:                                               ; preds = %7
  %14 = tail call i32 @__putenv(i8* noundef nonnull %0, i64 noundef %5, i8* noundef null) #4
  br label %15

15:                                               ; preds = %13, %11
  %16 = phi i32 [ %14, %13 ], [ %12, %11 ]
  ret i32 %16
}

; Function Attrs: optsize
declare hidden i8* @__strchrnul(i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @unsetenv(i8* noundef) local_unnamed_addr #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { nobuiltin optsize strictfp "no-builtins" }

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
