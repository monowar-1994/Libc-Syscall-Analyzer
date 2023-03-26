; ModuleID = 'src/stdio/perror.c'
source_filename = "src/stdio/perror.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@__stderr_FILE = external hidden global %struct._IO_FILE, align 8

; Function Attrs: nounwind optsize strictfp
define void @perror(i8* noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32* @___errno_location() #3
  %3 = load i32, i32* %2, align 4, !tbaa !3
  %4 = tail call i8* @strerror(i32 noundef %3) #4
  %5 = load volatile i32, i32* getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stderr_FILE, i64 0, i32 19), align 4, !tbaa !7
  %6 = icmp sgt i32 %5, -1
  br i1 %6, label %7, label %9

7:                                                ; preds = %1
  %8 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull @__stderr_FILE) #4
  br label %9

9:                                                ; preds = %1, %7
  %10 = phi i32 [ %8, %7 ], [ 0, %1 ]
  %11 = load %struct.__locale_struct*, %struct.__locale_struct** getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stderr_FILE, i64 0, i32 30), align 8, !tbaa !11
  %12 = load i32, i32* getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stderr_FILE, i64 0, i32 18), align 8, !tbaa !12
  %13 = icmp eq i8* %0, null
  br i1 %13, label %22, label %14

14:                                               ; preds = %9
  %15 = load i8, i8* %0, align 1, !tbaa !13
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %22, label %17

17:                                               ; preds = %14
  %18 = tail call i64 @strlen(i8* noundef nonnull %0) #4
  %19 = tail call i64 @fwrite(i8* noundef nonnull %0, i64 noundef %18, i64 noundef 1, %struct._IO_FILE* noundef nonnull @__stderr_FILE) #4
  %20 = tail call i32 @fputc(i32 noundef 58, %struct._IO_FILE* noundef nonnull @__stderr_FILE) #4
  %21 = tail call i32 @fputc(i32 noundef 32, %struct._IO_FILE* noundef nonnull @__stderr_FILE) #4
  br label %22

22:                                               ; preds = %17, %14, %9
  %23 = tail call i64 @strlen(i8* noundef %4) #4
  %24 = tail call i64 @fwrite(i8* noundef %4, i64 noundef %23, i64 noundef 1, %struct._IO_FILE* noundef nonnull @__stderr_FILE) #4
  %25 = tail call i32 @fputc(i32 noundef 10, %struct._IO_FILE* noundef nonnull @__stderr_FILE) #4
  store i32 %12, i32* getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stderr_FILE, i64 0, i32 18), align 8, !tbaa !12
  store %struct.__locale_struct* %11, %struct.__locale_struct** getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stderr_FILE, i64 0, i32 30), align 8, !tbaa !11
  %26 = icmp eq i32 %10, 0
  br i1 %26, label %28, label %27

27:                                               ; preds = %22
  tail call void @__unlockfile(%struct._IO_FILE* noundef nonnull @__stderr_FILE) #4
  br label %28

28:                                               ; preds = %27, %22
  ret void
}

; Function Attrs: optsize
declare i8* @strerror(i32 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i64 @fwrite(i8* noundef, i64 noundef, i64 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @fputc(i32 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__unlockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !4, i64 140}
!8 = !{!"_IO_FILE", !4, i64 0, !9, i64 8, !9, i64 16, !9, i64 24, !9, i64 32, !9, i64 40, !9, i64 48, !9, i64 56, !9, i64 64, !9, i64 72, !9, i64 80, !9, i64 88, !10, i64 96, !9, i64 104, !9, i64 112, !4, i64 120, !4, i64 124, !10, i64 128, !4, i64 136, !4, i64 140, !4, i64 144, !9, i64 152, !10, i64 160, !9, i64 168, !9, i64 176, !9, i64 184, !10, i64 192, !10, i64 200, !9, i64 208, !9, i64 216, !9, i64 224}
!9 = !{!"any pointer", !5, i64 0}
!10 = !{!"long", !5, i64 0}
!11 = !{!8, !9, i64 224}
!12 = !{!8, !4, i64 136}
!13 = !{!5, !5, i64 0}
