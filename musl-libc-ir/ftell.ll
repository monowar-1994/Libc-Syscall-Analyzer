; ModuleID = 'src/stdio/ftell.c'
source_filename = "src/stdio/ftell.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@ftello = weak alias i64 (%struct._IO_FILE*), i64 (%struct._IO_FILE*)* @__ftello
@ftello64 = weak alias i64 (%struct._IO_FILE*), i64 (%struct._IO_FILE*)* @__ftello

; Function Attrs: nounwind optsize strictfp
define hidden i64 @__ftello_unlocked(%struct._IO_FILE* noundef %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 10
  %3 = load i64 (%struct._IO_FILE*, i64, i32)*, i64 (%struct._IO_FILE*, i64, i32)** %2, align 8, !tbaa !3
  %4 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  %5 = load i32, i32* %4, align 8, !tbaa !10
  %6 = and i32 %5, 128
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %15, label %8

8:                                                ; preds = %1
  %9 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 5
  %10 = load i8*, i8** %9, align 8, !tbaa !11
  %11 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 7
  %12 = load i8*, i8** %11, align 8, !tbaa !12
  %13 = icmp eq i8* %10, %12
  %14 = select i1 %13, i32 1, i32 2
  br label %15

15:                                               ; preds = %8, %1
  %16 = phi i32 [ 1, %1 ], [ %14, %8 ]
  %17 = tail call i64 %3(%struct._IO_FILE* noundef nonnull %0, i64 noundef 0, i32 noundef %16) #2
  %18 = icmp slt i64 %17, 0
  br i1 %18, label %39, label %19

19:                                               ; preds = %15
  %20 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 2
  %21 = load i8*, i8** %20, align 8, !tbaa !13
  %22 = icmp eq i8* %21, null
  br i1 %22, label %25, label %23

23:                                               ; preds = %19
  %24 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  br label %31

25:                                               ; preds = %19
  %26 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 7
  %27 = load i8*, i8** %26, align 8, !tbaa !12
  %28 = icmp eq i8* %27, null
  br i1 %28, label %39, label %29

29:                                               ; preds = %25
  %30 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 5
  br label %31

31:                                               ; preds = %29, %23
  %32 = phi i8** [ %24, %23 ], [ %30, %29 ]
  %33 = phi i8* [ %21, %23 ], [ %27, %29 ]
  %34 = load i8*, i8** %32, align 8, !tbaa !14
  %35 = ptrtoint i8* %34 to i64
  %36 = ptrtoint i8* %33 to i64
  %37 = sub i64 %17, %36
  %38 = add i64 %37, %35
  br label %39

39:                                               ; preds = %31, %25, %15
  %40 = phi i64 [ %17, %15 ], [ %17, %25 ], [ %38, %31 ]
  ret i64 %40
}

; Function Attrs: nounwind optsize strictfp
define hidden i64 @__ftello(%struct._IO_FILE* noundef %0) #0 {
  %2 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 19
  %3 = load volatile i32, i32* %2, align 4, !tbaa !15
  %4 = icmp sgt i32 %3, -1
  br i1 %4, label %7, label %5

5:                                                ; preds = %1
  %6 = tail call i64 @__ftello_unlocked(%struct._IO_FILE* noundef nonnull %0) #3
  br label %12

7:                                                ; preds = %1
  %8 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull %0) #2
  %9 = icmp eq i32 %8, 0
  %10 = tail call i64 @__ftello_unlocked(%struct._IO_FILE* noundef nonnull %0) #3
  br i1 %9, label %12, label %11

11:                                               ; preds = %7
  tail call void @__unlockfile(%struct._IO_FILE* noundef nonnull %0) #2
  br label %12

12:                                               ; preds = %5, %11, %7
  %13 = phi i64 [ %6, %5 ], [ %10, %11 ], [ %10, %7 ]
  ret i64 %13
}

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__unlockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i64 @ftell(%struct._IO_FILE* noundef %0) local_unnamed_addr #0 {
  %2 = tail call i64 @__ftello(%struct._IO_FILE* noundef %0) #3
  ret i64 %2
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #3 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !8, i64 80}
!4 = !{!"_IO_FILE", !5, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !9, i64 96, !8, i64 104, !8, i64 112, !5, i64 120, !5, i64 124, !9, i64 128, !5, i64 136, !5, i64 140, !5, i64 144, !8, i64 152, !9, i64 160, !8, i64 168, !8, i64 176, !8, i64 184, !9, i64 192, !9, i64 200, !8, i64 208, !8, i64 216, !8, i64 224}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{!4, !5, i64 0}
!11 = !{!4, !8, i64 40}
!12 = !{!4, !8, i64 56}
!13 = !{!4, !8, i64 16}
!14 = !{!8, !8, i64 0}
!15 = !{!4, !5, i64 140}
