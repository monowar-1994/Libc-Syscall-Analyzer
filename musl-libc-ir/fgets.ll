; ModuleID = 'src/stdio/fgets.c'
source_filename = "src/stdio/fgets.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@fgets_unlocked = weak alias i8* (i8*, i32, %struct._IO_FILE*), i8* (i8*, i32, %struct._IO_FILE*)* @fgets

; Function Attrs: nounwind optsize strictfp
define i8* @fgets(i8* noalias noundef %0, i32 noundef %1, %struct._IO_FILE* noalias noundef %2) #0 {
  %4 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %2, i64 0, i32 19
  %5 = load volatile i32, i32* %4, align 4, !tbaa !3
  %6 = icmp sgt i32 %5, -1
  br i1 %6, label %7, label %9

7:                                                ; preds = %3
  %8 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull %2) #2
  br label %9

9:                                                ; preds = %3, %7
  %10 = phi i32 [ %8, %7 ], [ 0, %3 ]
  %11 = add nsw i32 %1, -1
  %12 = icmp slt i32 %1, 2
  br i1 %12, label %16, label %13

13:                                               ; preds = %9
  %14 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %2, i64 0, i32 1
  %15 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %2, i64 0, i32 2
  br label %26

16:                                               ; preds = %9
  %17 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %2, i64 0, i32 18
  %18 = load i32, i32* %17, align 8, !tbaa !10
  %19 = add nsw i32 %18, -1
  %20 = or i32 %19, %18
  store i32 %20, i32* %17, align 8, !tbaa !10
  %21 = icmp eq i32 %10, 0
  br i1 %21, label %23, label %22

22:                                               ; preds = %16
  tail call void @__unlockfile(%struct._IO_FILE* noundef nonnull %2) #2
  br label %23

23:                                               ; preds = %22, %16
  %24 = icmp eq i32 %11, 0
  br i1 %24, label %25, label %102

25:                                               ; preds = %23
  store i8 0, i8* %0, align 1, !tbaa !11
  br label %102

26:                                               ; preds = %13, %83
  %27 = phi i8* [ %89, %83 ], [ %0, %13 ]
  %28 = phi i32 [ %87, %83 ], [ %11, %13 ]
  %29 = load i8*, i8** %14, align 8, !tbaa !12
  %30 = load i8*, i8** %15, align 8, !tbaa !13
  %31 = icmp eq i8* %29, %30
  br i1 %31, label %71, label %32

32:                                               ; preds = %26
  %33 = ptrtoint i8* %30 to i64
  %34 = ptrtoint i8* %29 to i64
  %35 = sub i64 %33, %34
  %36 = tail call i8* @memchr(i8* noundef %29, i32 noundef 10, i64 noundef %35) #2
  %37 = icmp eq i8* %36, null
  br i1 %37, label %44, label %38

38:                                               ; preds = %32
  %39 = load i8*, i8** %14, align 8, !tbaa !12
  %40 = ptrtoint i8* %36 to i64
  %41 = ptrtoint i8* %39 to i64
  %42 = add i64 %40, 1
  %43 = sub i64 %42, %41
  br label %50

44:                                               ; preds = %32
  %45 = load i8*, i8** %15, align 8, !tbaa !13
  %46 = load i8*, i8** %14, align 8, !tbaa !12
  %47 = ptrtoint i8* %45 to i64
  %48 = ptrtoint i8* %46 to i64
  %49 = sub i64 %47, %48
  br label %50

50:                                               ; preds = %44, %38
  %51 = phi i8* [ %39, %38 ], [ %46, %44 ]
  %52 = phi i64 [ %43, %38 ], [ %49, %44 ]
  %53 = sext i32 %28 to i64
  %54 = icmp ult i64 %52, %53
  %55 = select i1 %54, i64 %52, i64 %53
  %56 = tail call i8* @memcpy(i8* noundef %27, i8* noundef %51, i64 noundef %55) #2
  %57 = load i8*, i8** %14, align 8, !tbaa !12
  %58 = getelementptr inbounds i8, i8* %57, i64 %55
  store i8* %58, i8** %14, align 8, !tbaa !12
  %59 = getelementptr inbounds i8, i8* %27, i64 %55
  %60 = trunc i64 %55 to i32
  %61 = sub i32 %28, %60
  %62 = icmp ne i32 %61, 0
  %63 = select i1 %37, i1 %62, i1 false
  br i1 %63, label %64, label %94

64:                                               ; preds = %50
  %65 = load i8*, i8** %15, align 8, !tbaa !13
  %66 = icmp eq i8* %58, %65
  br i1 %66, label %71, label %67

67:                                               ; preds = %64
  %68 = getelementptr inbounds i8, i8* %58, i64 1
  store i8* %68, i8** %14, align 8, !tbaa !12
  %69 = load i8, i8* %58, align 1, !tbaa !11
  %70 = zext i8 %69 to i32
  br label %83

71:                                               ; preds = %26, %64
  %72 = phi i32 [ %61, %64 ], [ %28, %26 ]
  %73 = phi i8* [ %59, %64 ], [ %27, %26 ]
  %74 = tail call i32 @__uflow(%struct._IO_FILE* noundef nonnull %2) #2
  %75 = icmp slt i32 %74, 0
  br i1 %75, label %76, label %83

76:                                               ; preds = %71
  %77 = icmp eq i8* %73, %0
  br i1 %77, label %98, label %78

78:                                               ; preds = %76
  %79 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %2, i64 0, i32 0
  %80 = load i32, i32* %79, align 8, !tbaa !14
  %81 = and i32 %80, 16
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %98, label %94

83:                                               ; preds = %67, %71
  %84 = phi i32 [ %61, %67 ], [ %72, %71 ]
  %85 = phi i8* [ %59, %67 ], [ %73, %71 ]
  %86 = phi i32 [ %70, %67 ], [ %74, %71 ]
  %87 = add nsw i32 %84, -1
  %88 = trunc i32 %86 to i8
  %89 = getelementptr inbounds i8, i8* %85, i64 1
  store i8 %88, i8* %85, align 1, !tbaa !11
  %90 = and i32 %86, 255
  %91 = icmp ne i32 %90, 10
  %92 = icmp ne i32 %87, 0
  %93 = select i1 %91, i1 %92, i1 false
  br i1 %93, label %26, label %94

94:                                               ; preds = %83, %50, %78
  %95 = phi i8* [ %73, %78 ], [ %59, %50 ], [ %89, %83 ]
  %96 = icmp eq i8* %0, null
  br i1 %96, label %98, label %97

97:                                               ; preds = %94
  store i8 0, i8* %95, align 1, !tbaa !11
  br label %98

98:                                               ; preds = %78, %76, %94, %97
  %99 = phi i8* [ null, %94 ], [ %0, %97 ], [ null, %76 ], [ null, %78 ]
  %100 = icmp eq i32 %10, 0
  br i1 %100, label %102, label %101

101:                                              ; preds = %98
  tail call void @__unlockfile(%struct._IO_FILE* noundef %2) #2
  br label %102

102:                                              ; preds = %98, %101, %23, %25
  %103 = phi i8* [ %0, %25 ], [ null, %23 ], [ %99, %101 ], [ %99, %98 ]
  ret i8* %103
}

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__unlockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @memchr(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare protected i32 @__uflow(%struct._IO_FILE* noundef) local_unnamed_addr #1

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
!11 = !{!6, !6, i64 0}
!12 = !{!4, !8, i64 8}
!13 = !{!4, !8, i64 16}
!14 = !{!4, !5, i64 0}
