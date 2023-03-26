; ModuleID = 'src/env/unsetenv.c'
source_filename = "src/env/unsetenv.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__environ = external local_unnamed_addr global i8**, align 8

@__env_rm_add = weak hidden alias void (i8*, i8*), void (i8*, i8*)* @dummy

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal void @dummy(i8* nocapture noundef %0, i8* nocapture noundef %1) #0 {
  ret void
}

; Function Attrs: nounwind optsize strictfp
define i32 @unsetenv(i8* noundef %0) local_unnamed_addr #1 {
  %2 = tail call i8* @__strchrnul(i8* noundef %0, i32 noundef 61) #4
  %3 = ptrtoint i8* %2 to i64
  %4 = ptrtoint i8* %0 to i64
  %5 = sub i64 %3, %4
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %11, label %7

7:                                                ; preds = %1
  %8 = getelementptr inbounds i8, i8* %0, i64 %5
  %9 = load i8, i8* %8, align 1, !tbaa !3
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %13, label %11

11:                                               ; preds = %7, %1
  %12 = tail call i32* @___errno_location() #5
  store i32 22, i32* %12, align 4, !tbaa !6
  br label %46

13:                                               ; preds = %7
  %14 = load i8**, i8*** @__environ, align 8, !tbaa !8
  %15 = icmp eq i8** %14, null
  br i1 %15, label %46, label %16

16:                                               ; preds = %13
  %17 = load i8*, i8** %14, align 8, !tbaa !8
  %18 = icmp eq i8* %17, null
  br i1 %18, label %46, label %19

19:                                               ; preds = %16, %38
  %20 = phi i8* [ %41, %38 ], [ %17, %16 ]
  %21 = phi i8** [ %39, %38 ], [ %14, %16 ]
  %22 = phi i8** [ %40, %38 ], [ %14, %16 ]
  %23 = tail call i32 @strncmp(i8* noundef %0, i8* noundef nonnull %20, i64 noundef %5) #4
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %31

25:                                               ; preds = %19
  %26 = load i8*, i8** %22, align 8, !tbaa !8
  %27 = getelementptr inbounds i8, i8* %26, i64 %5
  %28 = load i8, i8* %27, align 1, !tbaa !3
  %29 = icmp eq i8 %28, 61
  br i1 %29, label %30, label %31

30:                                               ; preds = %25
  tail call void @__env_rm_add(i8* noundef nonnull %26, i8* noundef null) #4
  br label %38

31:                                               ; preds = %25, %19
  %32 = icmp eq i8** %21, %22
  br i1 %32, label %36, label %33

33:                                               ; preds = %31
  %34 = load i8*, i8** %22, align 8, !tbaa !8
  %35 = getelementptr inbounds i8*, i8** %21, i64 1
  store i8* %34, i8** %21, align 8, !tbaa !8
  br label %38

36:                                               ; preds = %31
  %37 = getelementptr inbounds i8*, i8** %21, i64 1
  br label %38

38:                                               ; preds = %30, %36, %33
  %39 = phi i8** [ %35, %33 ], [ %37, %36 ], [ %21, %30 ]
  %40 = getelementptr inbounds i8*, i8** %22, i64 1
  %41 = load i8*, i8** %40, align 8, !tbaa !8
  %42 = icmp eq i8* %41, null
  br i1 %42, label %43, label %19

43:                                               ; preds = %38
  %44 = icmp eq i8** %39, %40
  br i1 %44, label %46, label %45

45:                                               ; preds = %43
  store i8* null, i8** %39, align 8, !tbaa !8
  br label %46

46:                                               ; preds = %16, %13, %45, %43, %11
  %47 = phi i32 [ -1, %11 ], [ 0, %43 ], [ 0, %45 ], [ 0, %13 ], [ 0, %16 ]
  ret i32 %47
}

; Function Attrs: optsize
declare hidden i8* @__strchrnul(i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @strncmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
!8 = !{!9, !9, i64 0}
!9 = !{!"any pointer", !4, i64 0}
