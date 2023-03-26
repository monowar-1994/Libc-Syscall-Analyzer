; ModuleID = 'src/stdio/ungetc.c'
source_filename = "src/stdio/ungetc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

; Function Attrs: nounwind optsize strictfp
define i32 @ungetc(i32 noundef %0, %struct._IO_FILE* noundef %1) local_unnamed_addr #0 {
  %3 = icmp eq i32 %0, -1
  br i1 %3, label %38, label %4

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 19
  %6 = load volatile i32, i32* %5, align 4, !tbaa !3
  %7 = icmp sgt i32 %6, -1
  br i1 %7, label %8, label %10

8:                                                ; preds = %4
  %9 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull %1) #2
  br label %10

10:                                               ; preds = %4, %8
  %11 = phi i32 [ %9, %8 ], [ 0, %4 ]
  %12 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 1
  %13 = load i8*, i8** %12, align 8, !tbaa !10
  %14 = icmp eq i8* %13, null
  br i1 %14, label %15, label %19

15:                                               ; preds = %10
  %16 = tail call i32 @__toread(%struct._IO_FILE* noundef nonnull %1) #2
  %17 = load i8*, i8** %12, align 8, !tbaa !10
  %18 = icmp eq i8* %17, null
  br i1 %18, label %25, label %19

19:                                               ; preds = %10, %15
  %20 = phi i8* [ %17, %15 ], [ %13, %10 ]
  %21 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 11
  %22 = load i8*, i8** %21, align 8, !tbaa !11
  %23 = getelementptr inbounds i8, i8* %22, i64 -8
  %24 = icmp ugt i8* %20, %23
  br i1 %24, label %28, label %25

25:                                               ; preds = %15, %19
  %26 = icmp eq i32 %11, 0
  br i1 %26, label %38, label %27

27:                                               ; preds = %25
  tail call void @__unlockfile(%struct._IO_FILE* noundef nonnull %1) #2
  br label %38

28:                                               ; preds = %19
  %29 = trunc i32 %0 to i8
  %30 = getelementptr inbounds i8, i8* %20, i64 -1
  store i8* %30, i8** %12, align 8, !tbaa !10
  store i8 %29, i8* %30, align 1, !tbaa !12
  %31 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 0
  %32 = load i32, i32* %31, align 8, !tbaa !13
  %33 = and i32 %32, -17
  store i32 %33, i32* %31, align 8, !tbaa !13
  %34 = icmp eq i32 %11, 0
  br i1 %34, label %36, label %35

35:                                               ; preds = %28
  tail call void @__unlockfile(%struct._IO_FILE* noundef nonnull %1) #2
  br label %36

36:                                               ; preds = %35, %28
  %37 = and i32 %0, 255
  br label %38

38:                                               ; preds = %36, %27, %25, %2
  %39 = phi i32 [ -1, %2 ], [ %37, %36 ], [ -1, %27 ], [ -1, %25 ]
  ret i32 %39
}

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i32 @__toread(%struct._IO_FILE* noundef) local_unnamed_addr #1

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
!11 = !{!4, !8, i64 88}
!12 = !{!6, !6, i64 0}
!13 = !{!4, !5, i64 0}
