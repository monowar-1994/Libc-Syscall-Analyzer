; ModuleID = 'src/stdio/setvbuf.c'
source_filename = "src/stdio/setvbuf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define i32 @setvbuf(%struct._IO_FILE* noalias nocapture noundef %0, i8* noalias noundef %1, i32 noundef %2, i64 noundef %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 20
  store i32 -1, i32* %5, align 8, !tbaa !3
  %6 = icmp eq i32 %2, 2
  br i1 %6, label %7, label %9

7:                                                ; preds = %4
  %8 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 12
  store i64 0, i64* %8, align 8, !tbaa !10
  br label %27

9:                                                ; preds = %4
  %10 = icmp eq i32 %2, 1
  %11 = icmp ult i32 %2, 2
  br i1 %11, label %12, label %31

12:                                               ; preds = %9
  %13 = icmp ne i8* %1, null
  %14 = icmp ugt i64 %3, 7
  %15 = and i1 %13, %14
  br i1 %15, label %16, label %21

16:                                               ; preds = %12
  %17 = getelementptr inbounds i8, i8* %1, i64 8
  %18 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 11
  store i8* %17, i8** %18, align 8, !tbaa !11
  %19 = add i64 %3, -8
  %20 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 12
  store i64 %19, i64* %20, align 8, !tbaa !10
  br label %21

21:                                               ; preds = %16, %12
  br i1 %10, label %22, label %27

22:                                               ; preds = %21
  %23 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 12
  %24 = load i64, i64* %23, align 8, !tbaa !10
  %25 = icmp eq i64 %24, 0
  br i1 %25, label %27, label %26

26:                                               ; preds = %22
  store i32 10, i32* %5, align 8, !tbaa !3
  br label %27

27:                                               ; preds = %26, %22, %21, %7
  %28 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  %29 = load i32, i32* %28, align 8, !tbaa !12
  %30 = or i32 %29, 64
  store i32 %30, i32* %28, align 8, !tbaa !12
  br label %31

31:                                               ; preds = %9, %27
  %32 = phi i32 [ 0, %27 ], [ -1, %9 ]
  ret i32 %32
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
!10 = !{!4, !9, i64 96}
!11 = !{!4, !8, i64 88}
!12 = !{!4, !5, i64 0}
