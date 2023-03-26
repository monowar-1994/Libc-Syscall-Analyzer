; ModuleID = 'src/process/execvp.c'
source_filename = "src/process/execvp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"PATH\00", align 1
@.str.1 = private unnamed_addr constant [29 x i8] c"/usr/local/bin:/bin:/usr/bin\00", align 1
@__environ = external local_unnamed_addr global i8**, align 8

@execvpe = weak alias i32 (i8*, i8**, i8**), i32 (i8*, i8**, i8**)* @__execvpe

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__execvpe(i8* noundef %0, i8** noundef %1, i8** noundef %2) #0 {
  %4 = tail call i8* @getenv(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)) #4
  %5 = tail call i32* @___errno_location() #5
  store i32 2, i32* %5, align 4, !tbaa !3
  %6 = load i8, i8* %0, align 1, !tbaa !7
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %59, label %8

8:                                                ; preds = %3
  %9 = tail call i8* @strchr(i8* noundef nonnull %0, i32 noundef 47) #4
  %10 = icmp eq i8* %9, null
  br i1 %10, label %13, label %11

11:                                               ; preds = %8
  %12 = tail call i32 @execve(i8* noundef nonnull %0, i8** noundef %1, i8** noundef %2) #4
  br label %59

13:                                               ; preds = %8
  %14 = icmp eq i8* %4, null
  %15 = select i1 %14, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.1, i64 0, i64 0), i8* %4
  %16 = tail call i64 @strnlen(i8* noundef nonnull %0, i64 noundef 256) #4
  %17 = icmp ugt i64 %16, 255
  br i1 %17, label %18, label %19

18:                                               ; preds = %13
  store i32 36, i32* %5, align 4, !tbaa !3
  br label %59

19:                                               ; preds = %13
  %20 = tail call i64 @strnlen(i8* noundef %15, i64 noundef 4095) #4
  %21 = add i64 %20, 1
  %22 = add nuw nsw i64 %16, 1
  %23 = add i64 %22, %21
  br label %24

24:                                               ; preds = %52, %19
  %25 = phi i32 [ 0, %19 ], [ %53, %52 ]
  %26 = phi i8* [ %15, %19 ], [ %54, %52 ]
  %27 = call i8* @llvm.stacksave() #6
  %28 = alloca i8, i64 %23, align 16
  %29 = call i8* @__strchrnul(i8* noundef %26, i32 noundef 58) #4
  %30 = ptrtoint i8* %29 to i64
  %31 = ptrtoint i8* %26 to i64
  %32 = sub i64 %30, %31
  %33 = icmp ult i64 %32, %21
  br i1 %33, label %37, label %34

34:                                               ; preds = %24
  %35 = load i8, i8* %29, align 1, !tbaa !7
  %36 = icmp eq i8 %35, 0
  br i1 %36, label %55, label %52

37:                                               ; preds = %24
  %38 = call i8* @memcpy(i8* noundef nonnull %28, i8* noundef %26, i64 noundef %32) #4
  %39 = getelementptr inbounds i8, i8* %28, i64 %32
  store i8 47, i8* %39, align 1, !tbaa !7
  %40 = icmp ugt i8* %29, %26
  %41 = zext i1 %40 to i64
  %42 = getelementptr inbounds i8, i8* %39, i64 %41
  %43 = call i8* @memcpy(i8* noundef nonnull %42, i8* noundef nonnull %0, i64 noundef %22) #4
  %44 = call i32 @execve(i8* noundef nonnull %28, i8** noundef %1, i8** noundef %2) #4
  %45 = load i32, i32* %5, align 4, !tbaa !3
  switch i32 %45, label %51 [
    i32 13, label %46
    i32 2, label %47
    i32 20, label %47
  ]

46:                                               ; preds = %37
  br label %47

47:                                               ; preds = %46, %37, %37
  %48 = phi i32 [ %25, %37 ], [ %25, %37 ], [ 1, %46 ]
  %49 = load i8, i8* %29, align 1, !tbaa !7
  %50 = icmp eq i8 %49, 0
  br i1 %50, label %55, label %52

51:                                               ; preds = %37
  call void @llvm.stackrestore(i8* %27) #6
  br label %59

52:                                               ; preds = %34, %47
  %53 = phi i32 [ %48, %47 ], [ %25, %34 ]
  %54 = getelementptr inbounds i8, i8* %29, i64 1
  call void @llvm.stackrestore(i8* %27) #6
  br label %24

55:                                               ; preds = %47, %34
  %56 = phi i32 [ %25, %34 ], [ %48, %47 ]
  call void @llvm.stackrestore(i8* %27) #6
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %59, label %58

58:                                               ; preds = %55
  store i32 13, i32* %5, align 4, !tbaa !3
  br label %59

59:                                               ; preds = %51, %55, %58, %3, %18, %11
  %60 = phi i32 [ %12, %11 ], [ -1, %18 ], [ -1, %51 ], [ -1, %3 ], [ -1, %58 ], [ -1, %55 ]
  ret i32 %60
}

; Function Attrs: optsize
declare i8* @getenv(i8* noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @strchr(i8* noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @execve(i8* noundef, i8** noundef, i8** noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i64 @strnlen(i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare i8* @llvm.stacksave() #3

; Function Attrs: optsize
declare hidden i8* @__strchrnul(i8* noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.stackrestore(i8*) #3

; Function Attrs: nounwind optsize strictfp
define i32 @execvp(i8* noundef %0, i8** noundef %1) local_unnamed_addr #0 {
  %3 = load i8**, i8*** @__environ, align 8, !tbaa !8
  %4 = tail call i32 @__execvpe(i8* noundef %0, i8** noundef %1, i8** noundef %3) #7
  ret i32 %4
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind willreturn }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #6 = { strictfp }
attributes #7 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!5, !5, i64 0}
!8 = !{!9, !9, i64 0}
!9 = !{!"any pointer", !5, i64 0}
