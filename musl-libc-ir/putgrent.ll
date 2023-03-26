; ModuleID = 'src/passwd/putgrent.c'
source_filename = "src/passwd/putgrent.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.group = type { i8*, i8*, i32, i8** }
%struct._IO_FILE = type opaque

@.str = private unnamed_addr constant [10 x i8] c"%s:%s:%u:\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"%s%s\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c",\00", align 1
@.str.3 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: nounwind optsize strictfp
define i32 @putgrent(%struct.group* nocapture noundef readonly %0, %struct._IO_FILE* noundef %1) local_unnamed_addr #0 {
  tail call void @flockfile(%struct._IO_FILE* noundef %1) #2
  %3 = getelementptr inbounds %struct.group, %struct.group* %0, i64 0, i32 0
  %4 = load i8*, i8** %3, align 8, !tbaa !3
  %5 = getelementptr inbounds %struct.group, %struct.group* %0, i64 0, i32 1
  %6 = load i8*, i8** %5, align 8, !tbaa !9
  %7 = getelementptr inbounds %struct.group, %struct.group* %0, i64 0, i32 2
  %8 = load i32, i32* %7, align 8, !tbaa !10
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %1, i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i8* noundef %4, i8* noundef %6, i32 noundef %8) #2
  %10 = icmp slt i32 %9, 0
  br i1 %10, label %33, label %11

11:                                               ; preds = %2
  %12 = getelementptr inbounds %struct.group, %struct.group* %0, i64 0, i32 3
  %13 = load i8**, i8*** %12, align 8, !tbaa !11
  %14 = icmp eq i8** %13, null
  br i1 %14, label %31, label %15

15:                                               ; preds = %11
  %16 = load i8*, i8** %13, align 8, !tbaa !12
  %17 = icmp eq i8* %16, null
  br i1 %17, label %31, label %23

18:                                               ; preds = %23
  %19 = load i8**, i8*** %12, align 8, !tbaa !11
  %20 = getelementptr inbounds i8*, i8** %19, i64 %30
  %21 = load i8*, i8** %20, align 8, !tbaa !12
  %22 = icmp eq i8* %21, null
  br i1 %22, label %31, label %23

23:                                               ; preds = %15, %18
  %24 = phi i8* [ %21, %18 ], [ %16, %15 ]
  %25 = phi i64 [ %30, %18 ], [ 0, %15 ]
  %26 = icmp eq i64 %25, 0
  %27 = select i1 %26, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %1, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i8* noundef %27, i8* noundef nonnull %24) #2
  %29 = icmp slt i32 %28, 0
  %30 = add i64 %25, 1
  br i1 %29, label %33, label %18

31:                                               ; preds = %18, %15, %11
  %32 = tail call i32 @fputc(i32 noundef 10, %struct._IO_FILE* noundef %1) #2
  br label %33

33:                                               ; preds = %23, %2, %31
  %34 = phi i32 [ %9, %2 ], [ %32, %31 ], [ %28, %23 ]
  tail call void @funlockfile(%struct._IO_FILE* noundef %1) #2
  %35 = ashr i32 %34, 31
  ret i32 %35
}

; Function Attrs: optsize
declare void @flockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @fprintf(%struct._IO_FILE* noundef, i8* noundef, ...) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @fputc(i32 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare void @funlockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"group", !5, i64 0, !5, i64 8, !8, i64 16, !5, i64 24}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"int", !6, i64 0}
!9 = !{!4, !5, i64 8}
!10 = !{!4, !8, i64 16}
!11 = !{!4, !5, i64 24}
!12 = !{!5, !5, i64 0}
