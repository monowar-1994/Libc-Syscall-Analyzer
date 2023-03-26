; ModuleID = 'src/legacy/getusershell.c'
source_filename = "src/legacy/getusershell.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type opaque

@f = internal unnamed_addr global %struct._IO_FILE* null, align 8
@.str = private unnamed_addr constant [12 x i8] c"/etc/shells\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"rbe\00", align 1
@defshells = internal constant [18 x i8] c"/bin/sh\0A/bin/csh\0A\00", align 16
@.str.2 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@line = internal global i8* null, align 8
@linesize = internal global i64 0, align 8

; Function Attrs: nounwind optsize strictfp
define void @endusershell() local_unnamed_addr #0 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @f, align 8, !tbaa !3
  %2 = icmp eq %struct._IO_FILE* %1, null
  br i1 %2, label %5, label %3

3:                                                ; preds = %0
  %4 = tail call i32 @fclose(%struct._IO_FILE* noundef nonnull %1) #2
  br label %5

5:                                                ; preds = %3, %0
  store %struct._IO_FILE* null, %struct._IO_FILE** @f, align 8, !tbaa !3
  ret void
}

; Function Attrs: optsize
declare i32 @fclose(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define void @setusershell() local_unnamed_addr #0 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @f, align 8, !tbaa !3
  %2 = icmp eq %struct._IO_FILE* %1, null
  br i1 %2, label %3, label %8

3:                                                ; preds = %0
  %4 = tail call %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)) #2
  store %struct._IO_FILE* %4, %struct._IO_FILE** @f, align 8, !tbaa !3
  %5 = icmp eq %struct._IO_FILE* %4, null
  br i1 %5, label %6, label %8

6:                                                ; preds = %3
  %7 = tail call %struct._IO_FILE* @fmemopen(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @defshells, i64 0, i64 0), i64 noundef 17, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0)) #2
  store %struct._IO_FILE* %7, %struct._IO_FILE** @f, align 8, !tbaa !3
  br label %8

8:                                                ; preds = %0, %6, %3
  ret void
}

; Function Attrs: optsize
declare %struct._IO_FILE* @fopen(i8* noundef, i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare %struct._IO_FILE* @fmemopen(i8* noundef, i64 noundef, i8* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i8* @getusershell() local_unnamed_addr #0 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @f, align 8, !tbaa !3
  %2 = icmp eq %struct._IO_FILE* %1, null
  br i1 %2, label %3, label %6

3:                                                ; preds = %0
  tail call void @setusershell() #3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @f, align 8, !tbaa !3
  %5 = icmp eq %struct._IO_FILE* %4, null
  br i1 %5, label %18, label %6

6:                                                ; preds = %0, %3
  %7 = phi %struct._IO_FILE* [ %4, %3 ], [ %1, %0 ]
  %8 = tail call i64 @getline(i8** noundef nonnull @line, i64* noundef nonnull @linesize, %struct._IO_FILE* noundef nonnull %7) #2
  %9 = icmp slt i64 %8, 1
  br i1 %9, label %18, label %10

10:                                               ; preds = %6
  %11 = load i8*, i8** @line, align 8, !tbaa !3
  %12 = add nsw i64 %8, -1
  %13 = getelementptr inbounds i8, i8* %11, i64 %12
  %14 = load i8, i8* %13, align 1, !tbaa !7
  %15 = icmp eq i8 %14, 10
  br i1 %15, label %16, label %18

16:                                               ; preds = %10
  store i8 0, i8* %13, align 1, !tbaa !7
  %17 = load i8*, i8** @line, align 8, !tbaa !3
  br label %18

18:                                               ; preds = %10, %16, %6, %3
  %19 = phi i8* [ null, %3 ], [ null, %6 ], [ %17, %16 ], [ %11, %10 ]
  ret i8* %19
}

; Function Attrs: optsize
declare i64 @getline(i8** noundef, i64* noundef, %struct._IO_FILE* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #3 = { nobuiltin optsize strictfp "no-builtins" }

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
