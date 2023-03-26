; ModuleID = 'src/stdio/open_memstream.c'
source_filename = "src/stdio/open_memstream.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.cookie = type { i8**, i64*, i64, i8*, i64, i64 }

@__libc = external hidden local_unnamed_addr global %struct.__libc, align 8

; Function Attrs: nounwind optsize strictfp
define %struct._IO_FILE* @open_memstream(i8** noundef %0, i64* noundef %1) local_unnamed_addr #0 {
  %3 = tail call i8* @malloc(i64 noundef 1304) #5
  %4 = icmp eq i8* %3, null
  br i1 %4, label %50, label %5

5:                                                ; preds = %2
  %6 = tail call i8* @malloc(i64 noundef 1) #5
  %7 = icmp eq i8* %6, null
  br i1 %7, label %8, label %9

8:                                                ; preds = %5
  tail call void @free(i8* noundef nonnull %3) #5
  br label %50

9:                                                ; preds = %5
  %10 = bitcast i8* %3 to %struct._IO_FILE*
  %11 = tail call i8* @memset(i8* noundef nonnull %3, i32 noundef 0, i64 noundef 232) #5
  %12 = getelementptr inbounds i8, i8* %3, i64 232
  %13 = tail call i8* @memset(i8* noundef nonnull %12, i32 noundef 0, i64 noundef 48) #5
  %14 = getelementptr inbounds i8, i8* %3, i64 152
  %15 = bitcast i8* %14 to i8**
  store i8* %12, i8** %15, align 8, !tbaa !3
  %16 = bitcast i8* %12 to i8***
  store i8** %0, i8*** %16, align 8, !tbaa !12
  %17 = getelementptr inbounds i8, i8* %3, i64 240
  %18 = bitcast i8* %17 to i64**
  store i64* %1, i64** %18, align 8, !tbaa !13
  store i64 0, i64* %1, align 8, !tbaa !14
  %19 = getelementptr inbounds i8, i8* %3, i64 264
  %20 = bitcast i8* %19 to <2 x i64>*
  store <2 x i64> zeroinitializer, <2 x i64>* %20, align 8, !tbaa !14
  %21 = getelementptr inbounds i8, i8* %3, i64 248
  %22 = bitcast i8* %21 to i64*
  store i64 0, i64* %22, align 8, !tbaa !15
  store i8* %6, i8** %0, align 8, !tbaa !16
  %23 = getelementptr inbounds i8, i8* %3, i64 256
  %24 = bitcast i8* %23 to i8**
  store i8* %6, i8** %24, align 8, !tbaa !17
  store i8 0, i8* %6, align 1, !tbaa !18
  %25 = bitcast i8* %3 to i32*
  store i32 4, i32* %25, align 8, !tbaa !19
  %26 = getelementptr inbounds i8, i8* %3, i64 120
  %27 = bitcast i8* %26 to i32*
  store i32 -1, i32* %27, align 8, !tbaa !20
  %28 = getelementptr inbounds i8, i8* %3, i64 280
  %29 = getelementptr inbounds i8, i8* %3, i64 88
  %30 = bitcast i8* %29 to i8**
  store i8* %28, i8** %30, align 8, !tbaa !21
  %31 = getelementptr inbounds i8, i8* %3, i64 96
  %32 = bitcast i8* %31 to i64*
  store i64 1024, i64* %32, align 8, !tbaa !22
  %33 = getelementptr inbounds i8, i8* %3, i64 144
  %34 = bitcast i8* %33 to i32*
  store i32 -1, i32* %34, align 8, !tbaa !23
  %35 = getelementptr inbounds i8, i8* %3, i64 72
  %36 = bitcast i8* %35 to i64 (%struct._IO_FILE*, i8*, i64)**
  store i64 (%struct._IO_FILE*, i8*, i64)* @ms_write, i64 (%struct._IO_FILE*, i8*, i64)** %36, align 8, !tbaa !24
  %37 = getelementptr inbounds i8, i8* %3, i64 80
  %38 = bitcast i8* %37 to i64 (%struct._IO_FILE*, i64, i32)**
  store i64 (%struct._IO_FILE*, i64, i32)* @ms_seek, i64 (%struct._IO_FILE*, i64, i32)** %38, align 8, !tbaa !25
  %39 = getelementptr inbounds i8, i8* %3, i64 24
  %40 = bitcast i8* %39 to i32 (%struct._IO_FILE*)**
  store i32 (%struct._IO_FILE*)* @ms_close, i32 (%struct._IO_FILE*)** %40, align 8, !tbaa !26
  %41 = getelementptr inbounds i8, i8* %3, i64 136
  %42 = bitcast i8* %41 to i32*
  store i32 -1, i32* %42, align 8, !tbaa !27
  %43 = load i8, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 1), align 1, !tbaa !28
  %44 = icmp eq i8 %43, 0
  br i1 %44, label %45, label %48

45:                                               ; preds = %9
  %46 = getelementptr inbounds i8, i8* %3, i64 140
  %47 = bitcast i8* %46 to i32*
  store volatile i32 -1, i32* %47, align 4, !tbaa !31
  br label %48

48:                                               ; preds = %45, %9
  %49 = tail call %struct._IO_FILE* @__ofl_add(%struct._IO_FILE* noundef nonnull %10) #5
  br label %50

50:                                               ; preds = %2, %48, %8
  %51 = phi %struct._IO_FILE* [ %49, %48 ], [ null, %8 ], [ null, %2 ]
  ret %struct._IO_FILE* %51
}

; Function Attrs: optsize
declare i8* @malloc(i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define internal i64 @ms_write(%struct._IO_FILE* nocapture noundef %0, i8* noundef %1, i64 noundef %2) #0 {
  %4 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 21
  %5 = bitcast i8** %4 to %struct.cookie**
  %6 = load %struct.cookie*, %struct.cookie** %5, align 8, !tbaa !32
  %7 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 5
  %8 = load i8*, i8** %7, align 8, !tbaa !33
  %9 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 7
  %10 = load i8*, i8** %9, align 8, !tbaa !34
  %11 = ptrtoint i8* %8 to i64
  %12 = ptrtoint i8* %10 to i64
  %13 = sub i64 %11, %12
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %18, label %15

15:                                               ; preds = %3
  store i8* %10, i8** %7, align 8, !tbaa !33
  %16 = tail call i64 @ms_write(%struct._IO_FILE* noundef nonnull %0, i8* noundef %10, i64 noundef %13) #6
  %17 = icmp ult i64 %16, %13
  br i1 %17, label %58, label %18

18:                                               ; preds = %15, %3
  %19 = getelementptr inbounds %struct.cookie, %struct.cookie* %6, i64 0, i32 2
  %20 = load i64, i64* %19, align 8, !tbaa !35
  %21 = add i64 %20, %2
  %22 = getelementptr inbounds %struct.cookie, %struct.cookie* %6, i64 0, i32 5
  %23 = load i64, i64* %22, align 8, !tbaa !36
  %24 = icmp ult i64 %21, %23
  br i1 %24, label %43, label %25

25:                                               ; preds = %18
  %26 = shl i64 %23, 1
  %27 = add i64 %21, 1
  %28 = or i64 %27, %26
  %29 = or i64 %28, 1
  %30 = getelementptr inbounds %struct.cookie, %struct.cookie* %6, i64 0, i32 3
  %31 = load i8*, i8** %30, align 8, !tbaa !37
  %32 = tail call i8* @realloc(i8* noundef %31, i64 noundef %29) #5
  %33 = icmp eq i8* %32, null
  br i1 %33, label %58, label %34

34:                                               ; preds = %25
  store i8* %32, i8** %30, align 8, !tbaa !37
  %35 = getelementptr inbounds %struct.cookie, %struct.cookie* %6, i64 0, i32 0
  %36 = load i8**, i8*** %35, align 8, !tbaa !38
  store i8* %32, i8** %36, align 8, !tbaa !16
  %37 = load i8*, i8** %30, align 8, !tbaa !37
  %38 = load i64, i64* %22, align 8, !tbaa !36
  %39 = getelementptr inbounds i8, i8* %37, i64 %38
  %40 = sub i64 %29, %38
  %41 = tail call i8* @memset(i8* noundef %39, i32 noundef 0, i64 noundef %40) #5
  store i64 %29, i64* %22, align 8, !tbaa !36
  %42 = load i64, i64* %19, align 8, !tbaa !35
  br label %43

43:                                               ; preds = %34, %18
  %44 = phi i64 [ %42, %34 ], [ %20, %18 ]
  %45 = getelementptr inbounds %struct.cookie, %struct.cookie* %6, i64 0, i32 3
  %46 = load i8*, i8** %45, align 8, !tbaa !37
  %47 = getelementptr inbounds i8, i8* %46, i64 %44
  %48 = tail call i8* @memcpy(i8* noundef %47, i8* noundef %1, i64 noundef %2) #5
  %49 = load i64, i64* %19, align 8, !tbaa !35
  %50 = add i64 %49, %2
  store i64 %50, i64* %19, align 8, !tbaa !35
  %51 = getelementptr inbounds %struct.cookie, %struct.cookie* %6, i64 0, i32 4
  %52 = load i64, i64* %51, align 8, !tbaa !39
  %53 = icmp ult i64 %50, %52
  br i1 %53, label %55, label %54

54:                                               ; preds = %43
  store i64 %50, i64* %51, align 8, !tbaa !39
  br label %55

55:                                               ; preds = %54, %43
  %56 = getelementptr inbounds %struct.cookie, %struct.cookie* %6, i64 0, i32 1
  %57 = load i64*, i64** %56, align 8, !tbaa !40
  store i64 %50, i64* %57, align 8, !tbaa !14
  br label %58

58:                                               ; preds = %25, %15, %55
  %59 = phi i64 [ %2, %55 ], [ 0, %15 ], [ 0, %25 ]
  ret i64 %59
}

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define internal i64 @ms_seek(%struct._IO_FILE* nocapture noundef readonly %0, i64 noundef %1, i32 noundef %2) #2 {
  %4 = alloca [3 x i64], align 8
  %5 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 21
  %6 = bitcast i8** %5 to %struct.cookie**
  %7 = load %struct.cookie*, %struct.cookie** %6, align 8, !tbaa !32
  %8 = icmp ugt i32 %2, 2
  br i1 %8, label %9, label %11

9:                                                ; preds = %11, %3
  %10 = tail call i32* @___errno_location() #7
  store i32 22, i32* %10, align 4, !tbaa !41
  br label %29

11:                                               ; preds = %3
  %12 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 0
  store i64 0, i64* %12, align 8, !tbaa !14
  %13 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 1
  %14 = getelementptr inbounds %struct.cookie, %struct.cookie* %7, i64 0, i32 2
  %15 = load i64, i64* %14, align 8, !tbaa !35
  store i64 %15, i64* %13, align 8, !tbaa !14
  %16 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 2
  %17 = getelementptr inbounds %struct.cookie, %struct.cookie* %7, i64 0, i32 4
  %18 = load i64, i64* %17, align 8, !tbaa !39
  store i64 %18, i64* %16, align 8, !tbaa !14
  %19 = zext i32 %2 to i64
  %20 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 %19
  %21 = load i64, i64* %20, align 8, !tbaa !14
  %22 = sub nsw i64 0, %21
  %23 = icmp sgt i64 %22, %1
  %24 = sub nsw i64 9223372036854775807, %21
  %25 = icmp slt i64 %24, %1
  %26 = select i1 %23, i1 true, i1 %25
  br i1 %26, label %9, label %27

27:                                               ; preds = %11
  %28 = add nsw i64 %21, %1
  store i64 %28, i64* %14, align 8, !tbaa !35
  br label %29

29:                                               ; preds = %27, %9
  %30 = phi i64 [ -1, %9 ], [ %28, %27 ]
  ret i64 %30
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal i32 @ms_close(%struct._IO_FILE* nocapture noundef readnone %0) #3 {
  ret i32 0
}

; Function Attrs: optsize
declare hidden %struct._IO_FILE* @__ofl_add(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @realloc(i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #4

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nobuiltin optsize strictfp "no-builtins" }
attributes #7 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !9, i64 152}
!4 = !{!"ms_FILE", !5, i64 0, !11, i64 232, !7, i64 280}
!5 = !{!"_IO_FILE", !6, i64 0, !9, i64 8, !9, i64 16, !9, i64 24, !9, i64 32, !9, i64 40, !9, i64 48, !9, i64 56, !9, i64 64, !9, i64 72, !9, i64 80, !9, i64 88, !10, i64 96, !9, i64 104, !9, i64 112, !6, i64 120, !6, i64 124, !10, i64 128, !6, i64 136, !6, i64 140, !6, i64 144, !9, i64 152, !10, i64 160, !9, i64 168, !9, i64 176, !9, i64 184, !10, i64 192, !10, i64 200, !9, i64 208, !9, i64 216, !9, i64 224}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"any pointer", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"cookie", !9, i64 0, !9, i64 8, !10, i64 16, !9, i64 24, !10, i64 32, !10, i64 40}
!12 = !{!4, !9, i64 232}
!13 = !{!4, !9, i64 240}
!14 = !{!10, !10, i64 0}
!15 = !{!4, !10, i64 248}
!16 = !{!9, !9, i64 0}
!17 = !{!4, !9, i64 256}
!18 = !{!7, !7, i64 0}
!19 = !{!4, !6, i64 0}
!20 = !{!4, !6, i64 120}
!21 = !{!4, !9, i64 88}
!22 = !{!4, !10, i64 96}
!23 = !{!4, !6, i64 144}
!24 = !{!4, !9, i64 72}
!25 = !{!4, !9, i64 80}
!26 = !{!4, !9, i64 24}
!27 = !{!4, !6, i64 136}
!28 = !{!29, !7, i64 1}
!29 = !{!"__libc", !7, i64 0, !7, i64 1, !7, i64 2, !7, i64 3, !6, i64 4, !9, i64 8, !9, i64 16, !10, i64 24, !10, i64 32, !10, i64 40, !10, i64 48, !30, i64 56}
!30 = !{!"__locale_struct", !7, i64 0}
!31 = !{!4, !6, i64 140}
!32 = !{!5, !9, i64 152}
!33 = !{!5, !9, i64 40}
!34 = !{!5, !9, i64 56}
!35 = !{!11, !10, i64 16}
!36 = !{!11, !10, i64 40}
!37 = !{!11, !9, i64 24}
!38 = !{!11, !9, i64 0}
!39 = !{!11, !10, i64 32}
!40 = !{!11, !9, i64 8}
!41 = !{!6, !6, i64 0}
