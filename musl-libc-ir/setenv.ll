; ModuleID = 'src/env/setenv.c'
source_filename = "src/env/setenv.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__env_rm_add.env_alloced = internal unnamed_addr global i8** null, align 8
@__env_rm_add.env_alloced_n = internal unnamed_addr global i64 0, align 8

; Function Attrs: nounwind optsize strictfp
define hidden void @__env_rm_add(i8* noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = load i64, i64* @__env_rm_add.env_alloced_n, align 8, !tbaa !3
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %23, label %5

5:                                                ; preds = %2
  %6 = load i8**, i8*** @__env_rm_add.env_alloced, align 8, !tbaa !7
  br label %7

7:                                                ; preds = %5, %19
  %8 = phi i8* [ %1, %5 ], [ %20, %19 ]
  %9 = phi i64 [ 0, %5 ], [ %21, %19 ]
  %10 = getelementptr inbounds i8*, i8** %6, i64 %9
  %11 = load i8*, i8** %10, align 8, !tbaa !7
  %12 = icmp eq i8* %11, %0
  br i1 %12, label %13, label %14

13:                                               ; preds = %7
  store i8* %8, i8** %10, align 8, !tbaa !7
  tail call void @free(i8* noundef %0) #3
  br label %37

14:                                               ; preds = %7
  %15 = icmp eq i8* %11, null
  %16 = icmp ne i8* %8, null
  %17 = select i1 %15, i1 %16, i1 false
  br i1 %17, label %18, label %19

18:                                               ; preds = %14
  store i8* %8, i8** %10, align 8, !tbaa !7
  br label %19

19:                                               ; preds = %18, %14
  %20 = phi i8* [ null, %18 ], [ %8, %14 ]
  %21 = add nuw i64 %9, 1
  %22 = icmp eq i64 %21, %3
  br i1 %22, label %23, label %7

23:                                               ; preds = %19, %2
  %24 = phi i8* [ %1, %2 ], [ %20, %19 ]
  %25 = icmp eq i8* %24, null
  br i1 %25, label %37, label %26

26:                                               ; preds = %23
  %27 = load i8*, i8** bitcast (i8*** @__env_rm_add.env_alloced to i8**), align 8, !tbaa !7
  %28 = shl i64 %3, 3
  %29 = add i64 %28, 8
  %30 = tail call i8* @realloc(i8* noundef %27, i64 noundef %29) #3
  %31 = icmp eq i8* %30, null
  br i1 %31, label %37, label %32

32:                                               ; preds = %26
  %33 = bitcast i8* %30 to i8**
  store i8* %30, i8** bitcast (i8*** @__env_rm_add.env_alloced to i8**), align 8, !tbaa !7
  %34 = load i64, i64* @__env_rm_add.env_alloced_n, align 8, !tbaa !3
  %35 = add i64 %34, 1
  store i64 %35, i64* @__env_rm_add.env_alloced_n, align 8, !tbaa !3
  %36 = getelementptr inbounds i8*, i8** %33, i64 %34
  store i8* %24, i8** %36, align 8, !tbaa !7
  br label %37

37:                                               ; preds = %13, %32, %26, %23
  ret void
}

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @realloc(i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i32 @setenv(i8* noundef %0, i8* noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = icmp eq i8* %0, null
  br i1 %4, label %15, label %5

5:                                                ; preds = %3
  %6 = tail call i8* @__strchrnul(i8* noundef nonnull %0, i32 noundef 61) #3
  %7 = ptrtoint i8* %6 to i64
  %8 = ptrtoint i8* %0 to i64
  %9 = sub i64 %7, %8
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %15, label %11

11:                                               ; preds = %5
  %12 = getelementptr inbounds i8, i8* %0, i64 %9
  %13 = load i8, i8* %12, align 1, !tbaa !9
  %14 = icmp eq i8 %13, 0
  br i1 %14, label %17, label %15

15:                                               ; preds = %11, %5, %3
  %16 = tail call i32* @___errno_location() #4
  store i32 22, i32* %16, align 4, !tbaa !10
  br label %35

17:                                               ; preds = %11
  %18 = icmp eq i32 %2, 0
  br i1 %18, label %19, label %22

19:                                               ; preds = %17
  %20 = tail call i8* @getenv(i8* noundef nonnull %0) #3
  %21 = icmp eq i8* %20, null
  br i1 %21, label %22, label %35

22:                                               ; preds = %19, %17
  %23 = tail call i64 @strlen(i8* noundef %1) #3
  %24 = add i64 %9, 2
  %25 = add i64 %24, %23
  %26 = tail call i8* @malloc(i64 noundef %25) #3
  %27 = icmp eq i8* %26, null
  br i1 %27, label %35, label %28

28:                                               ; preds = %22
  %29 = tail call i8* @memcpy(i8* noundef nonnull %26, i8* noundef nonnull %0, i64 noundef %9) #3
  %30 = getelementptr inbounds i8, i8* %26, i64 %9
  store i8 61, i8* %30, align 1, !tbaa !9
  %31 = getelementptr inbounds i8, i8* %30, i64 1
  %32 = add i64 %23, 1
  %33 = tail call i8* @memcpy(i8* noundef nonnull %31, i8* noundef %1, i64 noundef %32) #3
  %34 = tail call i32 @__putenv(i8* noundef nonnull %26, i64 noundef %9, i8* noundef nonnull %26) #3
  br label %35

35:                                               ; preds = %22, %19, %28, %15
  %36 = phi i32 [ -1, %15 ], [ %34, %28 ], [ 0, %19 ], [ -1, %22 ]
  ret i32 %36
}

; Function Attrs: optsize
declare hidden i8* @__strchrnul(i8* noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @getenv(i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @malloc(i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i32 @__putenv(i8* noundef, i64 noundef, i8* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"long", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"any pointer", !5, i64 0}
!9 = !{!5, !5, i64 0}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !5, i64 0}
