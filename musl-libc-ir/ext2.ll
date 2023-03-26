; ModuleID = 'src/stdio/ext2.c'
source_filename = "src/stdio/ext2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn
define i64 @__freadahead(%struct._IO_FILE* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 2
  %3 = load i8*, i8** %2, align 8, !tbaa !3
  %4 = icmp eq i8* %3, null
  br i1 %4, label %11, label %5

5:                                                ; preds = %1
  %6 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  %7 = load i8*, i8** %6, align 8, !tbaa !10
  %8 = ptrtoint i8* %3 to i64
  %9 = ptrtoint i8* %7 to i64
  %10 = sub i64 %8, %9
  br label %11

11:                                               ; preds = %1, %5
  %12 = phi i64 [ %10, %5 ], [ 0, %1 ]
  ret i64 %12
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define i8* @__freadptr(%struct._IO_FILE* nocapture noundef readonly %0, i64* nocapture noundef writeonly %1) local_unnamed_addr #1 {
  %3 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  %4 = load i8*, i8** %3, align 8, !tbaa !10
  %5 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 2
  %6 = load i8*, i8** %5, align 8, !tbaa !3
  %7 = icmp eq i8* %4, %6
  br i1 %7, label %12, label %8

8:                                                ; preds = %2
  %9 = ptrtoint i8* %6 to i64
  %10 = ptrtoint i8* %4 to i64
  %11 = sub i64 %9, %10
  store i64 %11, i64* %1, align 8, !tbaa !11
  br label %12

12:                                               ; preds = %2, %8
  %13 = phi i8* [ %4, %8 ], [ null, %2 ]
  ret i8* %13
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define void @__freadptrinc(%struct._IO_FILE* nocapture noundef %0, i64 noundef %1) local_unnamed_addr #1 {
  %3 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  %4 = load i8*, i8** %3, align 8, !tbaa !10
  %5 = getelementptr inbounds i8, i8* %4, i64 %1
  store i8* %5, i8** %3, align 8, !tbaa !10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define void @__fseterr(%struct._IO_FILE* nocapture noundef %0) local_unnamed_addr #1 {
  %2 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  %3 = load i32, i32* %2, align 8, !tbaa !12
  %4 = or i32 %3, 32
  store i32 %4, i32* %2, align 8, !tbaa !12
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !8, i64 16}
!4 = !{!"_IO_FILE", !5, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !9, i64 96, !8, i64 104, !8, i64 112, !5, i64 120, !5, i64 124, !9, i64 128, !5, i64 136, !5, i64 140, !5, i64 144, !8, i64 152, !9, i64 160, !8, i64 168, !8, i64 176, !8, i64 184, !9, i64 192, !9, i64 200, !8, i64 208, !8, i64 216, !8, i64 224}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{!4, !8, i64 8}
!11 = !{!9, !9, i64 0}
!12 = !{!4, !5, i64 0}
