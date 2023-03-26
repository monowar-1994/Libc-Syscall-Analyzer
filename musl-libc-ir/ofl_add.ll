; ModuleID = 'src/stdio/ofl_add.c'
source_filename = "src/stdio/ofl_add.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

; Function Attrs: nounwind optsize strictfp
define hidden %struct._IO_FILE* @__ofl_add(%struct._IO_FILE* noundef returned %0) local_unnamed_addr #0 {
  %2 = tail call %struct._IO_FILE** @__ofl_lock() #2
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8, !tbaa !3
  %4 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 14
  store %struct._IO_FILE* %3, %struct._IO_FILE** %4, align 8, !tbaa !7
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8, !tbaa !3
  %6 = icmp eq %struct._IO_FILE* %5, null
  br i1 %6, label %9, label %7

7:                                                ; preds = %1
  %8 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %5, i64 0, i32 13
  store %struct._IO_FILE* %0, %struct._IO_FILE** %8, align 8, !tbaa !11
  br label %9

9:                                                ; preds = %7, %1
  store %struct._IO_FILE* %0, %struct._IO_FILE** %2, align 8, !tbaa !3
  tail call void @__ofl_unlock() #2
  ret %struct._IO_FILE* %0
}

; Function Attrs: optsize
declare hidden %struct._IO_FILE** @__ofl_lock() local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__ofl_unlock() local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !4, i64 112}
!8 = !{!"_IO_FILE", !9, i64 0, !4, i64 8, !4, i64 16, !4, i64 24, !4, i64 32, !4, i64 40, !4, i64 48, !4, i64 56, !4, i64 64, !4, i64 72, !4, i64 80, !4, i64 88, !10, i64 96, !4, i64 104, !4, i64 112, !9, i64 120, !9, i64 124, !10, i64 128, !9, i64 136, !9, i64 140, !9, i64 144, !4, i64 152, !10, i64 160, !4, i64 168, !4, i64 176, !4, i64 184, !10, i64 192, !10, i64 200, !4, i64 208, !4, i64 216, !4, i64 224}
!9 = !{!"int", !5, i64 0}
!10 = !{!"long", !5, i64 0}
!11 = !{!8, !4, i64 104}
