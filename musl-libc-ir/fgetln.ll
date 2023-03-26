; ModuleID = 'src/stdio/fgetln.c'
source_filename = "src/stdio/fgetln.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

; Function Attrs: nounwind optsize strictfp
define i8* @fgetln(%struct._IO_FILE* noundef %0, i64* nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = alloca [1 x i64], align 8
  %4 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 19
  %5 = load volatile i32, i32* %4, align 4, !tbaa !3
  %6 = icmp sgt i32 %5, -1
  br i1 %6, label %7, label %9

7:                                                ; preds = %2
  %8 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull %0) #2
  br label %9

9:                                                ; preds = %2, %7
  %10 = phi i32 [ %8, %7 ], [ 0, %2 ]
  %11 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  %12 = load i8*, i8** %11, align 8, !tbaa !10
  %13 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 2
  %14 = load i8*, i8** %13, align 8, !tbaa !11
  %15 = icmp eq i8* %12, %14
  br i1 %15, label %20, label %16

16:                                               ; preds = %9
  %17 = getelementptr inbounds i8, i8* %12, i64 1
  store i8* %17, i8** %11, align 8, !tbaa !10
  %18 = load i8, i8* %12, align 1, !tbaa !12
  %19 = zext i8 %18 to i32
  br label %22

20:                                               ; preds = %9
  %21 = tail call i32 @__uflow(%struct._IO_FILE* noundef nonnull %0) #2
  br label %22

22:                                               ; preds = %20, %16
  %23 = phi i32 [ %19, %16 ], [ %21, %20 ]
  %24 = tail call i32 @ungetc(i32 noundef %23, %struct._IO_FILE* noundef nonnull %0) #2
  %25 = load i8*, i8** %13, align 8, !tbaa !11
  %26 = icmp eq i8* %25, null
  br i1 %26, label %40, label %27

27:                                               ; preds = %22
  %28 = load i8*, i8** %11, align 8, !tbaa !10
  %29 = ptrtoint i8* %25 to i64
  %30 = ptrtoint i8* %28 to i64
  %31 = sub i64 %29, %30
  %32 = tail call i8* @memchr(i8* noundef %28, i32 noundef 10, i64 noundef %31) #2
  %33 = icmp eq i8* %32, null
  br i1 %33, label %40, label %34

34:                                               ; preds = %27
  %35 = load i8*, i8** %11, align 8, !tbaa !10
  %36 = getelementptr inbounds i8, i8* %32, i64 1
  %37 = ptrtoint i8* %36 to i64
  %38 = ptrtoint i8* %35 to i64
  %39 = sub i64 %37, %38
  store i64 %39, i64* %1, align 8, !tbaa !13
  store i8* %36, i8** %11, align 8, !tbaa !10
  br label %47

40:                                               ; preds = %27, %22
  %41 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 23
  %42 = getelementptr inbounds [1 x i64], [1 x i64]* %3, i64 0, i64 0
  store i64 0, i64* %42, align 8, !tbaa !13
  %43 = call i64 @getline(i8** noundef nonnull %41, i64* noundef nonnull %42, %struct._IO_FILE* noundef nonnull %0) #2
  %44 = icmp sgt i64 %43, 0
  br i1 %44, label %45, label %47

45:                                               ; preds = %40
  store i64 %43, i64* %1, align 8, !tbaa !13
  %46 = load i8*, i8** %41, align 8, !tbaa !14
  br label %47

47:                                               ; preds = %34, %45, %40
  %48 = phi i8* [ %35, %34 ], [ %46, %45 ], [ null, %40 ]
  %49 = icmp eq i32 %10, 0
  br i1 %49, label %51, label %50

50:                                               ; preds = %47
  call void @__unlockfile(%struct._IO_FILE* noundef nonnull %0) #2
  br label %51

51:                                               ; preds = %50, %47
  ret i8* %48
}

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @ungetc(i32 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare protected i32 @__uflow(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @memchr(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i64 @getline(i8** noundef, i64* noundef, %struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__unlockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 140}
!4 = !{!"_IO_FILE", !5, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !9, i64 96, !8, i64 104, !8, i64 112, !5, i64 120, !5, i64 124, !9, i64 128, !5, i64 136, !5, i64 140, !5, i64 144, !8, i64 152, !9, i64 160, !8, i64 168, !8, i64 176, !8, i64 184, !9, i64 192, !9, i64 200, !8, i64 208, !8, i64 216, !8, i64 224}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{!4, !8, i64 8}
!11 = !{!4, !8, i64 16}
!12 = !{!6, !6, i64 0}
!13 = !{!9, !9, i64 0}
!14 = !{!4, !8, i64 168}
