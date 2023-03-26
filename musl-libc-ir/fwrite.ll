; ModuleID = 'src/stdio/fwrite.c'
source_filename = "src/stdio/fwrite.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@fwrite_unlocked = weak alias i64 (i8*, i64, i64, %struct._IO_FILE*), i64 (i8*, i64, i64, %struct._IO_FILE*)* @fwrite

; Function Attrs: nounwind optsize strictfp
define hidden i64 @__fwritex(i8* noalias noundef %0, i64 noundef %1, %struct._IO_FILE* noalias noundef %2) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %2, i64 0, i32 4
  %5 = load i8*, i8** %4, align 8, !tbaa !3
  %6 = icmp eq i8* %5, null
  br i1 %6, label %7, label %12

7:                                                ; preds = %3
  %8 = tail call i32 @__towrite(%struct._IO_FILE* noundef nonnull %2) #2
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %54

10:                                               ; preds = %7
  %11 = load i8*, i8** %4, align 8, !tbaa !3
  br label %12

12:                                               ; preds = %10, %3
  %13 = phi i8* [ %11, %10 ], [ %5, %3 ]
  %14 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %2, i64 0, i32 5
  %15 = load i8*, i8** %14, align 8, !tbaa !10
  %16 = ptrtoint i8* %13 to i64
  %17 = ptrtoint i8* %15 to i64
  %18 = sub i64 %16, %17
  %19 = icmp ult i64 %18, %1
  br i1 %19, label %20, label %24

20:                                               ; preds = %12
  %21 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %2, i64 0, i32 9
  %22 = load i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)** %21, align 8, !tbaa !11
  %23 = tail call i64 %22(%struct._IO_FILE* noundef nonnull %2, i8* noundef %0, i64 noundef %1) #2
  br label %54

24:                                               ; preds = %12
  %25 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %2, i64 0, i32 20
  %26 = load i32, i32* %25, align 8, !tbaa !12
  %27 = icmp sgt i32 %26, -1
  br i1 %27, label %28, label %45

28:                                               ; preds = %24, %31
  %29 = phi i64 [ %32, %31 ], [ %1, %24 ]
  %30 = icmp eq i64 %29, 0
  br i1 %30, label %45, label %31

31:                                               ; preds = %28
  %32 = add i64 %29, -1
  %33 = getelementptr inbounds i8, i8* %0, i64 %32
  %34 = load i8, i8* %33, align 1, !tbaa !13
  %35 = icmp eq i8 %34, 10
  br i1 %35, label %36, label %28

36:                                               ; preds = %31
  %37 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %2, i64 0, i32 9
  %38 = load i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)** %37, align 8, !tbaa !11
  %39 = tail call i64 %38(%struct._IO_FILE* noundef %2, i8* noundef nonnull %0, i64 noundef %29) #2
  %40 = icmp ult i64 %39, %29
  br i1 %40, label %54, label %41

41:                                               ; preds = %36
  %42 = sub i64 %1, %29
  %43 = getelementptr inbounds i8, i8* %0, i64 %29
  %44 = load i8*, i8** %14, align 8, !tbaa !10
  br label %45

45:                                               ; preds = %28, %41, %24
  %46 = phi i8* [ %44, %41 ], [ %15, %24 ], [ %15, %28 ]
  %47 = phi i64 [ %42, %41 ], [ %1, %24 ], [ %1, %28 ]
  %48 = phi i8* [ %43, %41 ], [ %0, %24 ], [ %0, %28 ]
  %49 = phi i64 [ %29, %41 ], [ 0, %24 ], [ 0, %28 ]
  %50 = tail call i8* @memcpy(i8* noundef %46, i8* noundef %48, i64 noundef %47) #2
  %51 = load i8*, i8** %14, align 8, !tbaa !10
  %52 = getelementptr inbounds i8, i8* %51, i64 %47
  store i8* %52, i8** %14, align 8, !tbaa !10
  %53 = add i64 %49, %47
  br label %54

54:                                               ; preds = %7, %36, %45, %20
  %55 = phi i64 [ %23, %20 ], [ %53, %45 ], [ %39, %36 ], [ 0, %7 ]
  ret i64 %55
}

; Function Attrs: optsize
declare hidden i32 @__towrite(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i64 @fwrite(i8* noalias noundef %0, i64 noundef %1, i64 noundef %2, %struct._IO_FILE* noalias noundef %3) #0 {
  %5 = mul i64 %2, %1
  %6 = icmp eq i64 %1, 0
  %7 = select i1 %6, i64 0, i64 %2
  %8 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %3, i64 0, i32 19
  %9 = load volatile i32, i32* %8, align 4, !tbaa !14
  %10 = icmp sgt i32 %9, -1
  br i1 %10, label %13, label %11

11:                                               ; preds = %4
  %12 = tail call i64 @__fwritex(i8* noundef %0, i64 noundef %5, %struct._IO_FILE* noundef nonnull %3) #3
  br label %18

13:                                               ; preds = %4
  %14 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull %3) #2
  %15 = icmp eq i32 %14, 0
  %16 = tail call i64 @__fwritex(i8* noundef %0, i64 noundef %5, %struct._IO_FILE* noundef nonnull %3) #3
  br i1 %15, label %18, label %17

17:                                               ; preds = %13
  tail call void @__unlockfile(%struct._IO_FILE* noundef nonnull %3) #2
  br label %18

18:                                               ; preds = %11, %17, %13
  %19 = phi i64 [ %12, %11 ], [ %16, %17 ], [ %16, %13 ]
  %20 = icmp eq i64 %19, %5
  br i1 %20, label %23, label %21

21:                                               ; preds = %18
  %22 = udiv i64 %19, %1
  br label %23

23:                                               ; preds = %18, %21
  %24 = phi i64 [ %22, %21 ], [ %7, %18 ]
  ret i64 %24
}

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__unlockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #3 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !8, i64 32}
!4 = !{!"_IO_FILE", !5, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !9, i64 96, !8, i64 104, !8, i64 112, !5, i64 120, !5, i64 124, !9, i64 128, !5, i64 136, !5, i64 140, !5, i64 144, !8, i64 152, !9, i64 160, !8, i64 168, !8, i64 176, !8, i64 184, !9, i64 192, !9, i64 200, !8, i64 208, !8, i64 216, !8, i64 224}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{!4, !8, i64 40}
!11 = !{!4, !8, i64 72}
!12 = !{!4, !5, i64 144}
!13 = !{!6, !6, i64 0}
!14 = !{!4, !5, i64 140}
