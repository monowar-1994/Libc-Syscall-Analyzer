; ModuleID = 'src/stdio/puts.c'
source_filename = "src/stdio/puts.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@__stdout_FILE = external hidden global %struct._IO_FILE, align 8

; Function Attrs: nounwind optsize strictfp
define i32 @puts(i8* noundef %0) local_unnamed_addr #0 {
  %2 = load volatile i32, i32* getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdout_FILE, i64 0, i32 19), align 4, !tbaa !3
  %3 = icmp sgt i32 %2, -1
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  %5 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull @__stdout_FILE) #2
  br label %6

6:                                                ; preds = %1, %4
  %7 = phi i32 [ %5, %4 ], [ 0, %1 ]
  %8 = tail call i32 @fputs(i8* noundef %0, %struct._IO_FILE* noundef nonnull @__stdout_FILE) #2
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %22, label %10

10:                                               ; preds = %6
  %11 = load i32, i32* getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdout_FILE, i64 0, i32 20), align 8, !tbaa !10
  %12 = icmp eq i32 %11, 10
  br i1 %12, label %19, label %13

13:                                               ; preds = %10
  %14 = load i8*, i8** getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdout_FILE, i64 0, i32 5), align 8, !tbaa !11
  %15 = load i8*, i8** getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdout_FILE, i64 0, i32 4), align 8, !tbaa !12
  %16 = icmp eq i8* %14, %15
  br i1 %16, label %19, label %17

17:                                               ; preds = %13
  %18 = getelementptr inbounds i8, i8* %14, i64 1
  store i8* %18, i8** getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdout_FILE, i64 0, i32 5), align 8, !tbaa !11
  store i8 10, i8* %14, align 1, !tbaa !13
  br label %22

19:                                               ; preds = %13, %10
  %20 = tail call i32 @__overflow(%struct._IO_FILE* noundef nonnull @__stdout_FILE, i32 noundef 10) #2
  %21 = ashr i32 %20, 31
  br label %22

22:                                               ; preds = %17, %19, %6
  %23 = phi i32 [ -1, %6 ], [ 0, %17 ], [ %21, %19 ]
  %24 = icmp eq i32 %7, 0
  br i1 %24, label %26, label %25

25:                                               ; preds = %22
  tail call void @__unlockfile(%struct._IO_FILE* noundef nonnull @__stdout_FILE) #2
  br label %26

26:                                               ; preds = %25, %22
  ret i32 %23
}

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @fputs(i8* noundef, %struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare protected i32 @__overflow(%struct._IO_FILE* noundef, i32 noundef) local_unnamed_addr #1

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
!10 = !{!4, !5, i64 144}
!11 = !{!4, !8, i64 40}
!12 = !{!4, !8, i64 32}
!13 = !{!6, !6, i64 0}
