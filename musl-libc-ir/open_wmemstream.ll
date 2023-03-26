; ModuleID = 'src/stdio/open_wmemstream.c'
source_filename = "src/stdio/open_wmemstream.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.cookie = type { i32**, i64*, i64, i32*, i64, i64, %struct.__mbstate_t }
%struct.__mbstate_t = type { i32, i32 }

@__libc = external hidden local_unnamed_addr global %struct.__libc, align 8

; Function Attrs: nounwind optsize strictfp
define %struct._IO_FILE* @open_wmemstream(i32** noundef %0, i64* noundef %1) local_unnamed_addr #0 {
  %3 = tail call i8* @malloc(i64 noundef 296) #4
  %4 = icmp eq i8* %3, null
  br i1 %4, label %51, label %5

5:                                                ; preds = %2
  %6 = tail call i8* @malloc(i64 noundef 4) #4
  %7 = icmp eq i8* %6, null
  br i1 %7, label %8, label %9

8:                                                ; preds = %5
  tail call void @free(i8* noundef nonnull %3) #4
  br label %51

9:                                                ; preds = %5
  %10 = bitcast i8* %6 to i32*
  %11 = bitcast i8* %3 to %struct._IO_FILE*
  %12 = tail call i8* @memset(i8* noundef nonnull %3, i32 noundef 0, i64 noundef 232) #4
  %13 = getelementptr inbounds i8, i8* %3, i64 232
  %14 = tail call i8* @memset(i8* noundef nonnull %13, i32 noundef 0, i64 noundef 56) #4
  %15 = getelementptr inbounds i8, i8* %3, i64 152
  %16 = bitcast i8* %15 to i8**
  store i8* %13, i8** %16, align 8, !tbaa !3
  %17 = bitcast i8* %13 to i32***
  store i32** %0, i32*** %17, align 8, !tbaa !13
  %18 = getelementptr inbounds i8, i8* %3, i64 240
  %19 = bitcast i8* %18 to i64**
  store i64* %1, i64** %19, align 8, !tbaa !14
  store i64 0, i64* %1, align 8, !tbaa !15
  %20 = getelementptr inbounds i8, i8* %3, i64 264
  %21 = bitcast i8* %20 to <2 x i64>*
  store <2 x i64> zeroinitializer, <2 x i64>* %21, align 8, !tbaa !15
  %22 = getelementptr inbounds i8, i8* %3, i64 248
  %23 = bitcast i8* %22 to i64*
  store i64 0, i64* %23, align 8, !tbaa !16
  %24 = bitcast i32** %0 to i8**
  store i8* %6, i8** %24, align 8, !tbaa !17
  %25 = getelementptr inbounds i8, i8* %3, i64 256
  %26 = bitcast i8* %25 to i8**
  store i8* %6, i8** %26, align 8, !tbaa !18
  store i32 0, i32* %10, align 4, !tbaa !19
  %27 = bitcast i8* %3 to i32*
  store i32 4, i32* %27, align 8, !tbaa !20
  %28 = getelementptr inbounds i8, i8* %3, i64 120
  %29 = bitcast i8* %28 to i32*
  store i32 -1, i32* %29, align 8, !tbaa !21
  %30 = getelementptr inbounds i8, i8* %3, i64 288
  %31 = getelementptr inbounds i8, i8* %3, i64 88
  %32 = bitcast i8* %31 to i8**
  store i8* %30, i8** %32, align 8, !tbaa !22
  %33 = getelementptr inbounds i8, i8* %3, i64 96
  %34 = bitcast i8* %33 to i64*
  store i64 0, i64* %34, align 8, !tbaa !23
  %35 = getelementptr inbounds i8, i8* %3, i64 144
  %36 = bitcast i8* %35 to i32*
  store i32 -1, i32* %36, align 8, !tbaa !24
  %37 = getelementptr inbounds i8, i8* %3, i64 72
  %38 = bitcast i8* %37 to i64 (%struct._IO_FILE*, i8*, i64)**
  store i64 (%struct._IO_FILE*, i8*, i64)* @wms_write, i64 (%struct._IO_FILE*, i8*, i64)** %38, align 8, !tbaa !25
  %39 = getelementptr inbounds i8, i8* %3, i64 80
  %40 = bitcast i8* %39 to i64 (%struct._IO_FILE*, i64, i32)**
  store i64 (%struct._IO_FILE*, i64, i32)* @wms_seek, i64 (%struct._IO_FILE*, i64, i32)** %40, align 8, !tbaa !26
  %41 = getelementptr inbounds i8, i8* %3, i64 24
  %42 = bitcast i8* %41 to i32 (%struct._IO_FILE*)**
  store i32 (%struct._IO_FILE*)* @wms_close, i32 (%struct._IO_FILE*)** %42, align 8, !tbaa !27
  %43 = load i8, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 1), align 1, !tbaa !28
  %44 = icmp eq i8 %43, 0
  br i1 %44, label %45, label %48

45:                                               ; preds = %9
  %46 = getelementptr inbounds i8, i8* %3, i64 140
  %47 = bitcast i8* %46 to i32*
  store volatile i32 -1, i32* %47, align 4, !tbaa !31
  br label %48

48:                                               ; preds = %45, %9
  %49 = tail call i32 @fwide(%struct._IO_FILE* noundef nonnull %11, i32 noundef 1) #4
  %50 = tail call %struct._IO_FILE* @__ofl_add(%struct._IO_FILE* noundef nonnull %11) #4
  br label %51

51:                                               ; preds = %2, %48, %8
  %52 = phi %struct._IO_FILE* [ %50, %48 ], [ null, %8 ], [ null, %2 ]
  ret %struct._IO_FILE* %52
}

; Function Attrs: optsize
declare i8* @malloc(i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define internal i64 @wms_write(%struct._IO_FILE* nocapture noundef readonly %0, i8* noundef %1, i64 noundef %2) #0 {
  %4 = alloca i8*, align 8
  store i8* %1, i8** %4, align 8, !tbaa !17
  %5 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 21
  %6 = bitcast i8** %5 to %struct.cookie**
  %7 = load %struct.cookie*, %struct.cookie** %6, align 8, !tbaa !32
  %8 = getelementptr inbounds %struct.cookie, %struct.cookie* %7, i64 0, i32 2
  %9 = load i64, i64* %8, align 8, !tbaa !33
  %10 = add i64 %9, %2
  %11 = getelementptr inbounds %struct.cookie, %struct.cookie* %7, i64 0, i32 5
  %12 = load i64, i64* %11, align 8, !tbaa !34
  %13 = icmp ult i64 %10, %12
  br i1 %13, label %38, label %14

14:                                               ; preds = %3
  %15 = shl i64 %12, 1
  %16 = add i64 %10, 1
  %17 = or i64 %16, %15
  %18 = or i64 %17, 1
  %19 = icmp ugt i64 %18, 2305843009213693951
  br i1 %19, label %58, label %20

20:                                               ; preds = %14
  %21 = getelementptr inbounds %struct.cookie, %struct.cookie* %7, i64 0, i32 3
  %22 = bitcast i32** %21 to i8**
  %23 = load i8*, i8** %22, align 8, !tbaa !35
  %24 = shl nuw nsw i64 %18, 2
  %25 = tail call i8* @realloc(i8* noundef %23, i64 noundef %24) #4
  %26 = icmp eq i8* %25, null
  br i1 %26, label %58, label %27

27:                                               ; preds = %20
  store i8* %25, i8** %22, align 8, !tbaa !35
  %28 = bitcast %struct.cookie* %7 to i8***
  %29 = load i8**, i8*** %28, align 8, !tbaa !36
  store i8* %25, i8** %29, align 8, !tbaa !17
  %30 = load i32*, i32** %21, align 8, !tbaa !35
  %31 = load i64, i64* %11, align 8, !tbaa !34
  %32 = getelementptr inbounds i32, i32* %30, i64 %31
  %33 = bitcast i32* %32 to i8*
  %34 = sub i64 %18, %31
  %35 = shl i64 %34, 2
  %36 = tail call i8* @memset(i8* noundef %33, i32 noundef 0, i64 noundef %35) #4
  store i64 %18, i64* %11, align 8, !tbaa !34
  %37 = load i64, i64* %8, align 8, !tbaa !33
  br label %38

38:                                               ; preds = %27, %3
  %39 = phi i64 [ %18, %27 ], [ %12, %3 ]
  %40 = phi i64 [ %37, %27 ], [ %9, %3 ]
  %41 = getelementptr inbounds %struct.cookie, %struct.cookie* %7, i64 0, i32 3
  %42 = load i32*, i32** %41, align 8, !tbaa !35
  %43 = getelementptr inbounds i32, i32* %42, i64 %40
  %44 = sub i64 %39, %40
  %45 = getelementptr inbounds %struct.cookie, %struct.cookie* %7, i64 0, i32 6
  %46 = call i64 @mbsnrtowcs(i32* noundef %43, i8** noundef nonnull %4, i64 noundef %2, i64 noundef %44, %struct.__mbstate_t* noundef nonnull %45) #4
  %47 = icmp eq i64 %46, -1
  br i1 %47, label %58, label %48

48:                                               ; preds = %38
  %49 = load i64, i64* %8, align 8, !tbaa !33
  %50 = add i64 %49, %46
  store i64 %50, i64* %8, align 8, !tbaa !33
  %51 = getelementptr inbounds %struct.cookie, %struct.cookie* %7, i64 0, i32 4
  %52 = load i64, i64* %51, align 8, !tbaa !37
  %53 = icmp ult i64 %50, %52
  br i1 %53, label %55, label %54

54:                                               ; preds = %48
  store i64 %50, i64* %51, align 8, !tbaa !37
  br label %55

55:                                               ; preds = %54, %48
  %56 = getelementptr inbounds %struct.cookie, %struct.cookie* %7, i64 0, i32 1
  %57 = load i64*, i64** %56, align 8, !tbaa !38
  store i64 %50, i64* %57, align 8, !tbaa !15
  br label %58

58:                                               ; preds = %38, %20, %14, %55
  %59 = phi i64 [ %2, %55 ], [ 0, %14 ], [ 0, %20 ], [ 0, %38 ]
  ret i64 %59
}

; Function Attrs: nounwind optsize strictfp
define internal i64 @wms_seek(%struct._IO_FILE* nocapture noundef readonly %0, i64 noundef %1, i32 noundef %2) #0 {
  %4 = alloca [3 x i64], align 8
  %5 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 21
  %6 = bitcast i8** %5 to %struct.cookie**
  %7 = load %struct.cookie*, %struct.cookie** %6, align 8, !tbaa !32
  %8 = icmp ugt i32 %2, 2
  br i1 %8, label %9, label %11

9:                                                ; preds = %11, %3
  %10 = tail call i32* @___errno_location() #5
  store i32 22, i32* %10, align 4, !tbaa !19
  br label %32

11:                                               ; preds = %3
  %12 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 0
  store i64 0, i64* %12, align 8, !tbaa !15
  %13 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 1
  %14 = getelementptr inbounds %struct.cookie, %struct.cookie* %7, i64 0, i32 2
  %15 = load i64, i64* %14, align 8, !tbaa !33
  store i64 %15, i64* %13, align 8, !tbaa !15
  %16 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 2
  %17 = getelementptr inbounds %struct.cookie, %struct.cookie* %7, i64 0, i32 4
  %18 = load i64, i64* %17, align 8, !tbaa !37
  store i64 %18, i64* %16, align 8, !tbaa !15
  %19 = zext i32 %2 to i64
  %20 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 %19
  %21 = load i64, i64* %20, align 8, !tbaa !15
  %22 = sub nsw i64 0, %21
  %23 = icmp sgt i64 %22, %1
  %24 = sub nsw i64 2305843009213693951, %21
  %25 = icmp slt i64 %24, %1
  %26 = select i1 %23, i1 true, i1 %25
  br i1 %26, label %9, label %27

27:                                               ; preds = %11
  %28 = getelementptr inbounds %struct.cookie, %struct.cookie* %7, i64 0, i32 6
  %29 = bitcast %struct.__mbstate_t* %28 to i8*
  %30 = tail call i8* @memset(i8* noundef nonnull %29, i32 noundef 0, i64 noundef 8) #4
  %31 = add nsw i64 %21, %1
  store i64 %31, i64* %14, align 8, !tbaa !33
  br label %32

32:                                               ; preds = %27, %9
  %33 = phi i64 [ -1, %9 ], [ %31, %27 ]
  ret i64 %33
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal i32 @wms_close(%struct._IO_FILE* nocapture noundef readnone %0) #2 {
  ret i32 0
}

; Function Attrs: optsize
declare i32 @fwide(%struct._IO_FILE* noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden %struct._IO_FILE* @__ofl_add(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @realloc(i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i64 @mbsnrtowcs(i32* noundef, i8** noundef, i64 noundef, i64 noundef, %struct.__mbstate_t* noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !9, i64 152}
!4 = !{!"wms_FILE", !5, i64 0, !11, i64 232, !7, i64 288}
!5 = !{!"_IO_FILE", !6, i64 0, !9, i64 8, !9, i64 16, !9, i64 24, !9, i64 32, !9, i64 40, !9, i64 48, !9, i64 56, !9, i64 64, !9, i64 72, !9, i64 80, !9, i64 88, !10, i64 96, !9, i64 104, !9, i64 112, !6, i64 120, !6, i64 124, !10, i64 128, !6, i64 136, !6, i64 140, !6, i64 144, !9, i64 152, !10, i64 160, !9, i64 168, !9, i64 176, !9, i64 184, !10, i64 192, !10, i64 200, !9, i64 208, !9, i64 216, !9, i64 224}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"any pointer", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"cookie", !9, i64 0, !9, i64 8, !10, i64 16, !9, i64 24, !10, i64 32, !10, i64 40, !12, i64 48}
!12 = !{!"__mbstate_t", !6, i64 0, !6, i64 4}
!13 = !{!4, !9, i64 232}
!14 = !{!4, !9, i64 240}
!15 = !{!10, !10, i64 0}
!16 = !{!4, !10, i64 248}
!17 = !{!9, !9, i64 0}
!18 = !{!4, !9, i64 256}
!19 = !{!6, !6, i64 0}
!20 = !{!4, !6, i64 0}
!21 = !{!4, !6, i64 120}
!22 = !{!4, !9, i64 88}
!23 = !{!4, !10, i64 96}
!24 = !{!4, !6, i64 144}
!25 = !{!4, !9, i64 72}
!26 = !{!4, !9, i64 80}
!27 = !{!4, !9, i64 24}
!28 = !{!29, !7, i64 1}
!29 = !{!"__libc", !7, i64 0, !7, i64 1, !7, i64 2, !7, i64 3, !6, i64 4, !9, i64 8, !9, i64 16, !10, i64 24, !10, i64 32, !10, i64 40, !10, i64 48, !30, i64 56}
!30 = !{!"__locale_struct", !7, i64 0}
!31 = !{!4, !6, i64 140}
!32 = !{!5, !9, i64 152}
!33 = !{!11, !10, i64 16}
!34 = !{!11, !10, i64 40}
!35 = !{!11, !9, i64 24}
!36 = !{!11, !9, i64 0}
!37 = !{!11, !10, i64 32}
!38 = !{!11, !9, i64 8}
