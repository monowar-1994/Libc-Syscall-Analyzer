; ModuleID = 'src/stdio/getchar_unlocked.c'
source_filename = "src/stdio/getchar_unlocked.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@__stdin_FILE = external hidden global %struct._IO_FILE, align 8

; Function Attrs: nounwind optsize strictfp
define i32 @getchar_unlocked() local_unnamed_addr #0 {
  %1 = load i8*, i8** getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdin_FILE, i64 0, i32 1), align 8, !tbaa !3
  %2 = load i8*, i8** getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdin_FILE, i64 0, i32 2), align 8, !tbaa !10
  %3 = icmp eq i8* %1, %2
  br i1 %3, label %8, label %4

4:                                                ; preds = %0
  %5 = getelementptr inbounds i8, i8* %1, i64 1
  store i8* %5, i8** getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdin_FILE, i64 0, i32 1), align 8, !tbaa !3
  %6 = load i8, i8* %1, align 1, !tbaa !11
  %7 = zext i8 %6 to i32
  br label %10

8:                                                ; preds = %0
  %9 = tail call i32 @__uflow(%struct._IO_FILE* noundef nonnull @__stdin_FILE) #2
  br label %10

10:                                               ; preds = %8, %4
  %11 = phi i32 [ %7, %4 ], [ %9, %8 ]
  ret i32 %11
}

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
!3 = !{!4, !8, i64 8}
!4 = !{!"_IO_FILE", !5, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !9, i64 96, !8, i64 104, !8, i64 112, !5, i64 120, !5, i64 124, !9, i64 128, !5, i64 136, !5, i64 140, !5, i64 144, !8, i64 152, !9, i64 160, !8, i64 168, !8, i64 176, !8, i64 184, !9, i64 192, !9, i64 200, !8, i64 208, !8, i64 216, !8, i64 224}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{!4, !8, i64 16}
!11 = !{!6, !6, i64 0}
