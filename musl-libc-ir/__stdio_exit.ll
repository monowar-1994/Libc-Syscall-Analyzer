; ModuleID = 'src/stdio/__stdio_exit.c'
source_filename = "src/stdio/__stdio_exit.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@dummy_file = internal global %struct._IO_FILE* null, align 8

@__stdin_used = weak hidden alias %struct._IO_FILE*, %struct._IO_FILE** @dummy_file
@__stdout_used = weak hidden alias %struct._IO_FILE*, %struct._IO_FILE** @dummy_file
@__stderr_used = weak hidden alias %struct._IO_FILE*, %struct._IO_FILE** @dummy_file
@__stdio_exit_needed = weak hidden alias void (), void ()* @__stdio_exit

; Function Attrs: nounwind optsize strictfp
define hidden void @__stdio_exit() #0 {
  %1 = tail call %struct._IO_FILE** @__ofl_lock() #2
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %1, align 8, !tbaa !3
  %3 = icmp eq %struct._IO_FILE* %2, null
  br i1 %3, label %9, label %4

4:                                                ; preds = %0, %4
  %5 = phi %struct._IO_FILE* [ %7, %4 ], [ %2, %0 ]
  tail call fastcc void @close_file(%struct._IO_FILE* noundef nonnull %5) #3
  %6 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %5, i64 0, i32 14
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8, !tbaa !3
  %8 = icmp eq %struct._IO_FILE* %7, null
  br i1 %8, label %9, label %4

9:                                                ; preds = %4, %0
  %10 = load volatile %struct._IO_FILE*, %struct._IO_FILE** @__stdin_used, align 8, !tbaa !3
  tail call fastcc void @close_file(%struct._IO_FILE* noundef %10) #3
  %11 = load volatile %struct._IO_FILE*, %struct._IO_FILE** @__stdout_used, align 8, !tbaa !3
  tail call fastcc void @close_file(%struct._IO_FILE* noundef %11) #3
  %12 = load volatile %struct._IO_FILE*, %struct._IO_FILE** @__stderr_used, align 8, !tbaa !3
  tail call fastcc void @close_file(%struct._IO_FILE* noundef %12) #3
  ret void
}

; Function Attrs: optsize
declare hidden %struct._IO_FILE** @__ofl_lock() local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @close_file(%struct._IO_FILE* noundef %0) unnamed_addr #0 {
  %2 = icmp eq %struct._IO_FILE* %0, null
  br i1 %2, label %32, label %3

3:                                                ; preds = %1
  %4 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 19
  %5 = load volatile i32, i32* %4, align 4, !tbaa !7
  %6 = icmp sgt i32 %5, -1
  br i1 %6, label %7, label %9

7:                                                ; preds = %3
  %8 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull %0) #2
  br label %9

9:                                                ; preds = %3, %7
  %10 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 5
  %11 = load i8*, i8** %10, align 8, !tbaa !11
  %12 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 7
  %13 = load i8*, i8** %12, align 8, !tbaa !12
  %14 = icmp eq i8* %11, %13
  br i1 %14, label %19, label %15

15:                                               ; preds = %9
  %16 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 9
  %17 = load i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)** %16, align 8, !tbaa !13
  %18 = tail call i64 %17(%struct._IO_FILE* noundef nonnull %0, i8* noundef null, i64 noundef 0) #2
  br label %19

19:                                               ; preds = %15, %9
  %20 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  %21 = load i8*, i8** %20, align 8, !tbaa !14
  %22 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 2
  %23 = load i8*, i8** %22, align 8, !tbaa !15
  %24 = icmp eq i8* %21, %23
  br i1 %24, label %32, label %25

25:                                               ; preds = %19
  %26 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 10
  %27 = load i64 (%struct._IO_FILE*, i64, i32)*, i64 (%struct._IO_FILE*, i64, i32)** %26, align 8, !tbaa !16
  %28 = ptrtoint i8* %21 to i64
  %29 = ptrtoint i8* %23 to i64
  %30 = sub i64 %28, %29
  %31 = tail call i64 %27(%struct._IO_FILE* noundef nonnull %0, i64 noundef %30, i32 noundef 1) #2
  br label %32

32:                                               ; preds = %1, %25, %19
  ret void
}

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #3 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !9, i64 140}
!8 = !{!"_IO_FILE", !9, i64 0, !4, i64 8, !4, i64 16, !4, i64 24, !4, i64 32, !4, i64 40, !4, i64 48, !4, i64 56, !4, i64 64, !4, i64 72, !4, i64 80, !4, i64 88, !10, i64 96, !4, i64 104, !4, i64 112, !9, i64 120, !9, i64 124, !10, i64 128, !9, i64 136, !9, i64 140, !9, i64 144, !4, i64 152, !10, i64 160, !4, i64 168, !4, i64 176, !4, i64 184, !10, i64 192, !10, i64 200, !4, i64 208, !4, i64 216, !4, i64 224}
!9 = !{!"int", !5, i64 0}
!10 = !{!"long", !5, i64 0}
!11 = !{!8, !4, i64 40}
!12 = !{!8, !4, i64 56}
!13 = !{!8, !4, i64 72}
!14 = !{!8, !4, i64 8}
!15 = !{!8, !4, i64 16}
!16 = !{!8, !4, i64 80}
