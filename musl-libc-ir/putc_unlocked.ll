; ModuleID = 'src/stdio/putc_unlocked.c'
source_filename = "src/stdio/putc_unlocked.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@fputc_unlocked = weak alias i32 (i32, %struct._IO_FILE*), i32 (i32, %struct._IO_FILE*)* @putc_unlocked
@_IO_putc_unlocked = weak alias i32 (i32, %struct._IO_FILE*), i32 (i32, %struct._IO_FILE*)* @putc_unlocked

; Function Attrs: nounwind optsize strictfp
define i32 @putc_unlocked(i32 noundef %0, %struct._IO_FILE* noundef %1) #0 {
  %3 = trunc i32 %0 to i8
  %4 = and i32 %0, 255
  %5 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 20
  %6 = load i32, i32* %5, align 8, !tbaa !3
  %7 = icmp eq i32 %4, %6
  br i1 %7, label %16, label %8

8:                                                ; preds = %2
  %9 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 5
  %10 = load i8*, i8** %9, align 8, !tbaa !10
  %11 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 4
  %12 = load i8*, i8** %11, align 8, !tbaa !11
  %13 = icmp eq i8* %10, %12
  br i1 %13, label %16, label %14

14:                                               ; preds = %8
  %15 = getelementptr inbounds i8, i8* %10, i64 1
  store i8* %15, i8** %9, align 8, !tbaa !10
  store i8 %3, i8* %10, align 1, !tbaa !12
  br label %18

16:                                               ; preds = %8, %2
  %17 = tail call i32 @__overflow(%struct._IO_FILE* noundef nonnull %1, i32 noundef %4) #2
  br label %18

18:                                               ; preds = %16, %14
  %19 = phi i32 [ %4, %14 ], [ %17, %16 ]
  ret i32 %19
}

; Function Attrs: optsize
declare protected i32 @__overflow(%struct._IO_FILE* noundef, i32 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 144}
!4 = !{!"_IO_FILE", !5, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !9, i64 96, !8, i64 104, !8, i64 112, !5, i64 120, !5, i64 124, !9, i64 128, !5, i64 136, !5, i64 140, !5, i64 144, !8, i64 152, !9, i64 160, !8, i64 168, !8, i64 176, !8, i64 184, !9, i64 192, !9, i64 200, !8, i64 208, !8, i64 216, !8, i64 224}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{!4, !8, i64 40}
!11 = !{!4, !8, i64 32}
!12 = !{!6, !6, i64 0}
