; ModuleID = 'src/internal/shgetc.c'
source_filename = "src/internal/shgetc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

; Function Attrs: mustprogress nofree norecurse nosync nounwind strictfp willreturn
define hidden void @__shlim(%struct._IO_FILE* nocapture noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 26
  store i64 %1, i64* %3, align 8, !tbaa !3
  %4 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 11
  %5 = load i8*, i8** %4, align 8, !tbaa !10
  %6 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  %7 = load i8*, i8** %6, align 8, !tbaa !11
  %8 = ptrtoint i8* %5 to i64
  %9 = ptrtoint i8* %7 to i64
  %10 = sub i64 %8, %9
  %11 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 27
  store i64 %10, i64* %11, align 8, !tbaa !12
  %12 = icmp ne i64 %1, 0
  %13 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 2
  %14 = load i8*, i8** %13, align 8, !tbaa !13
  %15 = ptrtoint i8* %14 to i64
  %16 = sub i64 %15, %9
  %17 = icmp sgt i64 %16, %1
  %18 = select i1 %12, i1 %17, i1 false
  %19 = getelementptr inbounds i8, i8* %7, i64 %1
  %20 = select i1 %18, i8* %19, i8* %14
  %21 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 25
  store i8* %20, i8** %21, align 8, !tbaa !14
  ret void
}

; Function Attrs: nounwind strictfp
define hidden i32 @__shgetc(%struct._IO_FILE* noundef %0) local_unnamed_addr #1 {
  %2 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 27
  %3 = load i64, i64* %2, align 8, !tbaa !12
  %4 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  %5 = load i8*, i8** %4, align 8, !tbaa !11
  %6 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 11
  %7 = load i8*, i8** %6, align 8, !tbaa !10
  %8 = ptrtoint i8* %5 to i64
  %9 = ptrtoint i8* %7 to i64
  %10 = sub i64 %8, %9
  %11 = add nsw i64 %10, %3
  %12 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 26
  %13 = load i64, i64* %12, align 8, !tbaa !3
  %14 = icmp eq i64 %13, 0
  %15 = icmp slt i64 %11, %13
  %16 = select i1 %14, i1 true, i1 %15
  br i1 %16, label %17, label %25

17:                                               ; preds = %1
  %18 = tail call i32 @__uflow(%struct._IO_FILE* noundef nonnull %0) #3
  %19 = icmp slt i32 %18, 0
  br i1 %19, label %20, label %32

20:                                               ; preds = %17
  %21 = load i8*, i8** %6, align 8, !tbaa !10
  %22 = load i8*, i8** %4, align 8, !tbaa !11
  %23 = ptrtoint i8* %21 to i64
  %24 = ptrtoint i8* %22 to i64
  br label %25

25:                                               ; preds = %20, %1
  %26 = phi i64 [ %24, %20 ], [ %8, %1 ]
  %27 = phi i64 [ %23, %20 ], [ %9, %1 ]
  %28 = phi i8* [ %22, %20 ], [ %5, %1 ]
  %29 = add i64 %11, %27
  %30 = sub i64 %29, %26
  store i64 %30, i64* %2, align 8, !tbaa !12
  %31 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 25
  store i8* %28, i8** %31, align 8, !tbaa !14
  store i64 -1, i64* %12, align 8, !tbaa !3
  br label %58

32:                                               ; preds = %17
  %33 = add nsw i64 %11, 1
  %34 = load i64, i64* %12, align 8, !tbaa !3
  %35 = icmp eq i64 %34, 0
  %36 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 2
  %37 = load i8*, i8** %36, align 8, !tbaa !13
  %38 = load i8*, i8** %4, align 8, !tbaa !11
  %39 = ptrtoint i8* %38 to i64
  %40 = ptrtoint i8* %37 to i64
  %41 = ptrtoint i8* %38 to i64
  %42 = sub i64 %40, %41
  %43 = sub nsw i64 %34, %33
  %44 = icmp sgt i64 %42, %43
  %45 = getelementptr inbounds i8, i8* %38, i64 %43
  %46 = select i1 %44, i8* %45, i8* %37
  %47 = select i1 %35, i8* %37, i8* %46
  %48 = select i1 %35, i64 %39, i64 %41
  %49 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 25
  store i8* %47, i8** %49, align 8, !tbaa !14
  %50 = load i8*, i8** %6, align 8, !tbaa !10
  %51 = ptrtoint i8* %50 to i64
  %52 = add i64 %33, %51
  %53 = sub i64 %52, %48
  store i64 %53, i64* %2, align 8, !tbaa !12
  %54 = icmp ugt i8* %38, %50
  br i1 %54, label %58, label %55

55:                                               ; preds = %32
  %56 = trunc i32 %18 to i8
  %57 = getelementptr inbounds i8, i8* %38, i64 -1
  store i8 %56, i8* %57, align 1, !tbaa !15
  br label %58

58:                                               ; preds = %32, %55, %25
  %59 = phi i32 [ -1, %25 ], [ %18, %55 ], [ %18, %32 ]
  ret i32 %59
}

declare protected i32 @__uflow(%struct._IO_FILE* noundef) local_unnamed_addr #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !9, i64 192}
!4 = !{!"_IO_FILE", !5, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !9, i64 96, !8, i64 104, !8, i64 112, !5, i64 120, !5, i64 124, !9, i64 128, !5, i64 136, !5, i64 140, !5, i64 144, !8, i64 152, !9, i64 160, !8, i64 168, !8, i64 176, !8, i64 184, !9, i64 192, !9, i64 200, !8, i64 208, !8, i64 216, !8, i64 224}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{!4, !8, i64 88}
!11 = !{!4, !8, i64 8}
!12 = !{!4, !9, i64 200}
!13 = !{!4, !8, i64 16}
!14 = !{!4, !8, i64 184}
!15 = !{!6, !6, i64 0}
