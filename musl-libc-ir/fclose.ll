; ModuleID = 'src/stdio/fclose.c'
source_filename = "src/stdio/fclose.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@__unlist_locked_file = weak hidden alias void (%struct._IO_FILE*), void (%struct._IO_FILE*)* @dummy

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal void @dummy(%struct._IO_FILE* nocapture noundef %0) #0 {
  ret void
}

; Function Attrs: nounwind optsize strictfp
define i32 @fclose(%struct._IO_FILE* noundef %0) local_unnamed_addr #1 {
  %2 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 19
  %3 = load volatile i32, i32* %2, align 4, !tbaa !3
  %4 = icmp sgt i32 %3, -1
  br i1 %4, label %5, label %8

5:                                                ; preds = %1
  %6 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull %0) #3
  %7 = icmp eq i32 %6, 0
  br label %8

8:                                                ; preds = %1, %5
  %9 = phi i1 [ %7, %5 ], [ true, %1 ]
  %10 = tail call i32 @fflush(%struct._IO_FILE* noundef nonnull %0) #3
  %11 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 3
  %12 = load i32 (%struct._IO_FILE*)*, i32 (%struct._IO_FILE*)** %11, align 8, !tbaa !10
  %13 = tail call i32 %12(%struct._IO_FILE* noundef nonnull %0) #3
  br i1 %9, label %15, label %14

14:                                               ; preds = %8
  tail call void @__unlockfile(%struct._IO_FILE* noundef nonnull %0) #3
  br label %15

15:                                               ; preds = %14, %8
  %16 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  %17 = load i32, i32* %16, align 8, !tbaa !11
  %18 = and i32 %17, 1
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %43

20:                                               ; preds = %15
  tail call void @__unlist_locked_file(%struct._IO_FILE* noundef nonnull %0) #3
  %21 = tail call %struct._IO_FILE** @__ofl_lock() #3
  %22 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 13
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** %22, align 8, !tbaa !12
  %24 = icmp eq %struct._IO_FILE* %23, null
  br i1 %24, label %29, label %25

25:                                               ; preds = %20
  %26 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 14
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %26, align 8, !tbaa !13
  %28 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %23, i64 0, i32 14
  store %struct._IO_FILE* %27, %struct._IO_FILE** %28, align 8, !tbaa !13
  br label %29

29:                                               ; preds = %25, %20
  %30 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 14
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** %30, align 8, !tbaa !13
  %32 = icmp eq %struct._IO_FILE* %31, null
  br i1 %32, label %35, label %33

33:                                               ; preds = %29
  %34 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %31, i64 0, i32 13
  store %struct._IO_FILE* %23, %struct._IO_FILE** %34, align 8, !tbaa !12
  br label %35

35:                                               ; preds = %33, %29
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** %21, align 8, !tbaa !14
  %37 = icmp eq %struct._IO_FILE* %36, %0
  br i1 %37, label %38, label %39

38:                                               ; preds = %35
  store %struct._IO_FILE* %31, %struct._IO_FILE** %21, align 8, !tbaa !14
  br label %39

39:                                               ; preds = %38, %35
  tail call void @__ofl_unlock() #3
  %40 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 23
  %41 = load i8*, i8** %40, align 8, !tbaa !15
  tail call void @free(i8* noundef %41) #3
  %42 = bitcast %struct._IO_FILE* %0 to i8*
  tail call void @free(i8* noundef %42) #3
  br label %43

43:                                               ; preds = %15, %39
  %44 = or i32 %13, %10
  ret i32 %44
}

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @fflush(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__unlockfile(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden %struct._IO_FILE** @__ofl_lock() local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__ofl_unlock() local_unnamed_addr #2

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }

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
!10 = !{!4, !8, i64 24}
!11 = !{!4, !5, i64 0}
!12 = !{!4, !8, i64 104}
!13 = !{!4, !8, i64 112}
!14 = !{!8, !8, i64 0}
!15 = !{!4, !8, i64 168}
