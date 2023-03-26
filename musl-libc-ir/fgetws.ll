; ModuleID = 'src/stdio/fgetws.c'
source_filename = "src/stdio/fgetws.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@fgetws_unlocked = weak alias i32* (i32*, i32, %struct._IO_FILE*), i32* (i32*, i32, %struct._IO_FILE*)* @fgetws

; Function Attrs: nounwind optsize strictfp
define i32* @fgetws(i32* noalias noundef writeonly %0, i32 noundef %1, %struct._IO_FILE* noalias noundef %2) #0 {
  %4 = icmp eq i32 %1, 0
  br i1 %4, label %36, label %5

5:                                                ; preds = %3
  %6 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %2, i64 0, i32 19
  %7 = load volatile i32, i32* %6, align 4, !tbaa !3
  %8 = icmp sgt i32 %7, -1
  br i1 %8, label %9, label %11

9:                                                ; preds = %5
  %10 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull %2) #2
  br label %11

11:                                               ; preds = %5, %9
  %12 = phi i32 [ %10, %9 ], [ 0, %5 ]
  br label %13

13:                                               ; preds = %21, %11
  %14 = phi i32* [ %0, %11 ], [ %22, %21 ]
  %15 = phi i32 [ %1, %11 ], [ %16, %21 ]
  %16 = add nsw i32 %15, -1
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %24, label %18

18:                                               ; preds = %13
  %19 = tail call i32 @__fgetwc_unlocked(%struct._IO_FILE* noundef %2) #2
  %20 = icmp eq i32 %19, -1
  br i1 %20, label %24, label %21

21:                                               ; preds = %18
  %22 = getelementptr inbounds i32, i32* %14, i64 1
  store i32 %19, i32* %14, align 4, !tbaa !10
  %23 = icmp eq i32 %19, 10
  br i1 %23, label %24, label %13

24:                                               ; preds = %21, %18, %13
  %25 = phi i32* [ %14, %13 ], [ %14, %18 ], [ %22, %21 ]
  store i32 0, i32* %25, align 4, !tbaa !10
  %26 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %2, i64 0, i32 0
  %27 = load i32, i32* %26, align 8, !tbaa !11
  %28 = and i32 %27, 32
  %29 = icmp eq i32 %28, 0
  %30 = select i1 %29, i32* %25, i32* %0
  %31 = icmp eq i32 %12, 0
  br i1 %31, label %33, label %32

32:                                               ; preds = %24
  tail call void @__unlockfile(%struct._IO_FILE* noundef nonnull %2) #2
  br label %33

33:                                               ; preds = %32, %24
  %34 = icmp eq i32* %30, %0
  %35 = select i1 %34, i32* null, i32* %0
  br label %36

36:                                               ; preds = %3, %33
  %37 = phi i32* [ %35, %33 ], [ %0, %3 ]
  ret i32* %37
}

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @__fgetwc_unlocked(%struct._IO_FILE* noundef) local_unnamed_addr #1

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
!10 = !{!5, !5, i64 0}
!11 = !{!4, !5, i64 0}
