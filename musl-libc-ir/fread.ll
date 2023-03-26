; ModuleID = 'src/stdio/fread.c'
source_filename = "src/stdio/fread.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@fread_unlocked = weak alias i64 (i8*, i64, i64, %struct._IO_FILE*), i64 (i8*, i64, i64, %struct._IO_FILE*)* @fread

; Function Attrs: nounwind optsize strictfp
define i64 @fread(i8* noalias noundef %0, i64 noundef %1, i64 noundef %2, %struct._IO_FILE* noalias noundef %3) #0 {
  %5 = mul i64 %2, %1
  %6 = icmp eq i64 %1, 0
  %7 = select i1 %6, i64 0, i64 %2
  %8 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %3, i64 0, i32 19
  %9 = load volatile i32, i32* %8, align 4, !tbaa !3
  %10 = icmp sgt i32 %9, -1
  br i1 %10, label %11, label %13

11:                                               ; preds = %4
  %12 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull %3) #2
  br label %13

13:                                               ; preds = %4, %11
  %14 = phi i32 [ %12, %11 ], [ 0, %4 ]
  %15 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %3, i64 0, i32 18
  %16 = load i32, i32* %15, align 8, !tbaa !10
  %17 = add nsw i32 %16, -1
  %18 = or i32 %17, %16
  store i32 %18, i32* %15, align 8, !tbaa !10
  %19 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %3, i64 0, i32 1
  %20 = load i8*, i8** %19, align 8, !tbaa !11
  %21 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %3, i64 0, i32 2
  %22 = load i8*, i8** %21, align 8, !tbaa !12
  %23 = icmp eq i8* %20, %22
  br i1 %23, label %35, label %24

24:                                               ; preds = %13
  %25 = ptrtoint i8* %22 to i64
  %26 = ptrtoint i8* %20 to i64
  %27 = sub i64 %25, %26
  %28 = icmp ult i64 %27, %5
  %29 = select i1 %28, i64 %27, i64 %5
  %30 = tail call i8* @memcpy(i8* noundef %0, i8* noundef %20, i64 noundef %29) #2
  %31 = load i8*, i8** %19, align 8, !tbaa !11
  %32 = getelementptr inbounds i8, i8* %31, i64 %29
  store i8* %32, i8** %19, align 8, !tbaa !11
  %33 = getelementptr inbounds i8, i8* %0, i64 %29
  %34 = sub i64 %5, %29
  br label %35

35:                                               ; preds = %24, %13
  %36 = phi i8* [ %33, %24 ], [ %0, %13 ]
  %37 = phi i64 [ %34, %24 ], [ %5, %13 ]
  %38 = icmp eq i64 %37, 0
  br i1 %38, label %60, label %39

39:                                               ; preds = %35
  %40 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %3, i64 0, i32 8
  br label %41

41:                                               ; preds = %39, %56
  %42 = phi i64 [ %37, %39 ], [ %57, %56 ]
  %43 = phi i8* [ %36, %39 ], [ %58, %56 ]
  %44 = tail call i32 @__toread(%struct._IO_FILE* noundef nonnull %3) #2
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %50

46:                                               ; preds = %41
  %47 = load i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)** %40, align 8, !tbaa !13
  %48 = tail call i64 %47(%struct._IO_FILE* noundef nonnull %3, i8* noundef %43, i64 noundef %42) #2
  %49 = icmp eq i64 %48, 0
  br i1 %49, label %50, label %56

50:                                               ; preds = %41, %46
  %51 = icmp eq i32 %14, 0
  br i1 %51, label %53, label %52

52:                                               ; preds = %50
  tail call void @__unlockfile(%struct._IO_FILE* noundef nonnull %3) #2
  br label %53

53:                                               ; preds = %52, %50
  %54 = sub i64 %5, %42
  %55 = udiv i64 %54, %1
  br label %63

56:                                               ; preds = %46
  %57 = sub i64 %42, %48
  %58 = getelementptr inbounds i8, i8* %43, i64 %48
  %59 = icmp eq i64 %57, 0
  br i1 %59, label %60, label %41

60:                                               ; preds = %56, %35
  %61 = icmp eq i32 %14, 0
  br i1 %61, label %63, label %62

62:                                               ; preds = %60
  tail call void @__unlockfile(%struct._IO_FILE* noundef nonnull %3) #2
  br label %63

63:                                               ; preds = %60, %62, %53
  %64 = phi i64 [ %55, %53 ], [ %7, %62 ], [ %7, %60 ]
  ret i64 %64
}

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

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
!10 = !{!4, !5, i64 136}
!11 = !{!4, !8, i64 8}
!12 = !{!4, !8, i64 16}
!13 = !{!4, !8, i64 64}
