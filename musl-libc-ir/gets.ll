; ModuleID = 'src/stdio/gets.c'
source_filename = "src/stdio/gets.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@__stdin_FILE = external hidden global %struct._IO_FILE, align 8

; Function Attrs: nounwind optsize strictfp
define i8* @gets(i8* noundef writeonly %0) local_unnamed_addr #0 {
  %2 = load volatile i32, i32* getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdin_FILE, i64 0, i32 19), align 4, !tbaa !3
  %3 = icmp sgt i32 %2, -1
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  %5 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull @__stdin_FILE) #2
  br label %6

6:                                                ; preds = %1, %4
  %7 = phi i32 [ %5, %4 ], [ 0, %1 ]
  br label %8

8:                                                ; preds = %21, %6
  %9 = phi i64 [ 0, %6 ], [ %23, %21 ]
  %10 = load i8*, i8** getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdin_FILE, i64 0, i32 1), align 8, !tbaa !10
  %11 = load i8*, i8** getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdin_FILE, i64 0, i32 2), align 8, !tbaa !11
  %12 = icmp eq i8* %10, %11
  br i1 %12, label %17, label %13

13:                                               ; preds = %8
  %14 = getelementptr inbounds i8, i8* %10, i64 1
  store i8* %14, i8** getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdin_FILE, i64 0, i32 1), align 8, !tbaa !10
  %15 = load i8, i8* %10, align 1, !tbaa !12
  %16 = zext i8 %15 to i32
  br label %19

17:                                               ; preds = %8
  %18 = tail call i32 @__uflow(%struct._IO_FILE* noundef nonnull @__stdin_FILE) #2
  br label %19

19:                                               ; preds = %17, %13
  %20 = phi i32 [ %16, %13 ], [ %18, %17 ]
  switch i32 %20, label %21 [
    i32 -1, label %25
    i32 10, label %25
  ]

21:                                               ; preds = %19
  %22 = trunc i32 %20 to i8
  %23 = add i64 %9, 1
  %24 = getelementptr inbounds i8, i8* %0, i64 %9
  store i8 %22, i8* %24, align 1, !tbaa !12
  br label %8

25:                                               ; preds = %19, %19
  %26 = icmp eq i32 %20, 10
  %27 = getelementptr inbounds i8, i8* %0, i64 %9
  store i8 0, i8* %27, align 1, !tbaa !12
  br i1 %26, label %35, label %28

28:                                               ; preds = %25
  %29 = load i32, i32* getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdin_FILE, i64 0, i32 0), align 8, !tbaa !13
  %30 = and i32 %29, 16
  %31 = icmp ne i32 %30, 0
  %32 = icmp ne i64 %9, 0
  %33 = select i1 %31, i1 %32, i1 false
  %34 = select i1 %33, i8* %0, i8* null
  br label %35

35:                                               ; preds = %28, %25
  %36 = phi i8* [ %0, %25 ], [ %34, %28 ]
  %37 = icmp eq i32 %7, 0
  br i1 %37, label %39, label %38

38:                                               ; preds = %35
  tail call void @__unlockfile(%struct._IO_FILE* noundef nonnull @__stdin_FILE) #2
  br label %39

39:                                               ; preds = %38, %35
  ret i8* %36
}

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare protected i32 @__uflow(%struct._IO_FILE* noundef) local_unnamed_addr #1

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
!13 = !{!4, !5, i64 0}
