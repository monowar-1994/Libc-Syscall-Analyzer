; ModuleID = 'src/stdio/fopencookie.c'
source_filename = "src/stdio/fopencookie.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque
%struct._IO_cookie_io_functions_t = type { i64 (i8*, i8*, i64)*, i64 (i8*, i8*, i64)*, i32 (i8*, i64*, i32)*, i32 (i8*)* }
%struct.fcookie = type { i8*, %struct._IO_cookie_io_functions_t }

@.str = private unnamed_addr constant [4 x i8] c"rwa\00", align 1

; Function Attrs: nounwind optsize strictfp
define %struct._IO_FILE* @fopencookie(i8* noundef %0, i8* noundef %1, %struct._IO_cookie_io_functions_t* nocapture noundef readonly byval(%struct._IO_cookie_io_functions_t) align 8 %2) local_unnamed_addr #0 {
  %4 = load i8, i8* %1, align 1, !tbaa !3
  %5 = sext i8 %4 to i32
  %6 = tail call i8* @strchr(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef %5) #4
  %7 = icmp eq i8* %6, null
  br i1 %7, label %8, label %10

8:                                                ; preds = %3
  %9 = tail call i32* @___errno_location() #5
  store i32 22, i32* %9, align 4, !tbaa !6
  br label %48

10:                                               ; preds = %3
  %11 = tail call i8* @malloc(i64 noundef 1304) #4
  %12 = icmp eq i8* %11, null
  br i1 %12, label %48, label %13

13:                                               ; preds = %10
  %14 = bitcast i8* %11 to %struct._IO_FILE*
  %15 = tail call i8* @memset(i8* noundef nonnull %11, i32 noundef 0, i64 noundef 232) #4
  %16 = tail call i8* @strchr(i8* noundef nonnull %1, i32 noundef 43) #4
  %17 = icmp eq i8* %16, null
  br i1 %17, label %18, label %23

18:                                               ; preds = %13
  %19 = load i8, i8* %1, align 1, !tbaa !3
  %20 = icmp eq i8 %19, 114
  %21 = select i1 %20, i32 8, i32 4
  %22 = bitcast i8* %11 to i32*
  store i32 %21, i32* %22, align 8, !tbaa !8
  br label %23

23:                                               ; preds = %18, %13
  %24 = getelementptr inbounds i8, i8* %11, i64 232
  %25 = bitcast i8* %24 to i8**
  store i8* %0, i8** %25, align 8, !tbaa !15
  %26 = getelementptr inbounds i8, i8* %11, i64 240
  %27 = bitcast %struct._IO_cookie_io_functions_t* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %26, i8* noundef nonnull align 8 dereferenceable(32) %27, i64 32, i1 false) #6, !tbaa.struct !16
  %28 = getelementptr inbounds i8, i8* %11, i64 120
  %29 = bitcast i8* %28 to i32*
  store i32 -1, i32* %29, align 8, !tbaa !18
  %30 = getelementptr inbounds i8, i8* %11, i64 152
  %31 = bitcast i8* %30 to i8**
  store i8* %24, i8** %31, align 8, !tbaa !19
  %32 = getelementptr inbounds i8, i8* %11, i64 280
  %33 = getelementptr inbounds i8, i8* %11, i64 88
  %34 = bitcast i8* %33 to i8**
  store i8* %32, i8** %34, align 8, !tbaa !20
  %35 = getelementptr inbounds i8, i8* %11, i64 96
  %36 = bitcast i8* %35 to i64*
  store i64 1024, i64* %36, align 8, !tbaa !21
  %37 = getelementptr inbounds i8, i8* %11, i64 144
  %38 = bitcast i8* %37 to i32*
  store i32 -1, i32* %38, align 8, !tbaa !22
  %39 = getelementptr inbounds i8, i8* %11, i64 64
  %40 = bitcast i8* %39 to i64 (%struct._IO_FILE*, i8*, i64)**
  store i64 (%struct._IO_FILE*, i8*, i64)* @cookieread, i64 (%struct._IO_FILE*, i8*, i64)** %40, align 8, !tbaa !23
  %41 = getelementptr inbounds i8, i8* %11, i64 72
  %42 = bitcast i8* %41 to i64 (%struct._IO_FILE*, i8*, i64)**
  store i64 (%struct._IO_FILE*, i8*, i64)* @cookiewrite, i64 (%struct._IO_FILE*, i8*, i64)** %42, align 8, !tbaa !24
  %43 = getelementptr inbounds i8, i8* %11, i64 80
  %44 = bitcast i8* %43 to i64 (%struct._IO_FILE*, i64, i32)**
  store i64 (%struct._IO_FILE*, i64, i32)* @cookieseek, i64 (%struct._IO_FILE*, i64, i32)** %44, align 8, !tbaa !25
  %45 = getelementptr inbounds i8, i8* %11, i64 24
  %46 = bitcast i8* %45 to i32 (%struct._IO_FILE*)**
  store i32 (%struct._IO_FILE*)* @cookieclose, i32 (%struct._IO_FILE*)** %46, align 8, !tbaa !26
  %47 = tail call %struct._IO_FILE* @__ofl_add(%struct._IO_FILE* noundef nonnull %14) #4
  br label %48

48:                                               ; preds = %10, %23, %8
  %49 = phi %struct._IO_FILE* [ %47, %23 ], [ null, %8 ], [ null, %10 ]
  ret %struct._IO_FILE* %49
}

; Function Attrs: optsize
declare i8* @strchr(i8* noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @malloc(i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind optsize strictfp
define internal i64 @cookieread(%struct._IO_FILE* nocapture noundef %0, i8* noundef %1, i64 noundef %2) #0 {
  %4 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 21
  %5 = bitcast i8** %4 to %struct.fcookie**
  %6 = load %struct.fcookie*, %struct.fcookie** %5, align 8, !tbaa !27
  %7 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 12
  %8 = load i64, i64* %7, align 8, !tbaa !28
  %9 = icmp ne i64 %8, 0
  %10 = sext i1 %9 to i64
  %11 = add i64 %10, %2
  %12 = getelementptr inbounds %struct.fcookie, %struct.fcookie* %6, i64 0, i32 1, i32 0
  %13 = load i64 (i8*, i8*, i64)*, i64 (i8*, i8*, i64)** %12, align 8, !tbaa !29
  %14 = icmp eq i64 (i8*, i8*, i64)* %13, null
  br i1 %14, label %54, label %15

15:                                               ; preds = %3
  %16 = icmp eq i64 %11, 0
  br i1 %16, label %25, label %17

17:                                               ; preds = %15
  %18 = getelementptr inbounds %struct.fcookie, %struct.fcookie* %6, i64 0, i32 0
  %19 = load i8*, i8** %18, align 8, !tbaa !30
  %20 = tail call i64 %13(i8* noundef %19, i8* noundef %1, i64 noundef %11) #4
  %21 = icmp slt i64 %20, 1
  br i1 %21, label %49, label %22

22:                                               ; preds = %17
  %23 = sub i64 %2, %20
  %24 = load i64, i64* %7, align 8, !tbaa !28
  br label %25

25:                                               ; preds = %22, %15
  %26 = phi i64 [ %24, %22 ], [ %8, %15 ]
  %27 = phi i64 [ %23, %22 ], [ %2, %15 ]
  %28 = phi i64 [ %20, %22 ], [ 0, %15 ]
  %29 = icmp eq i64 %26, 0
  %30 = icmp ugt i64 %27, 1
  %31 = select i1 %29, i1 true, i1 %30
  br i1 %31, label %64, label %32

32:                                               ; preds = %25
  %33 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 11
  %34 = load i8*, i8** %33, align 8, !tbaa !31
  %35 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  store i8* %34, i8** %35, align 8, !tbaa !32
  %36 = load i64 (i8*, i8*, i64)*, i64 (i8*, i8*, i64)** %12, align 8, !tbaa !29
  %37 = getelementptr inbounds %struct.fcookie, %struct.fcookie* %6, i64 0, i32 0
  %38 = load i8*, i8** %37, align 8, !tbaa !30
  %39 = tail call i64 %36(i8* noundef %38, i8* noundef %34, i64 noundef %26) #4
  %40 = icmp slt i64 %39, 1
  br i1 %40, label %49, label %41

41:                                               ; preds = %32
  %42 = load i8*, i8** %35, align 8, !tbaa !32
  %43 = getelementptr inbounds i8, i8* %42, i64 %39
  %44 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 2
  store i8* %43, i8** %44, align 8, !tbaa !33
  %45 = getelementptr inbounds i8, i8* %42, i64 1
  store i8* %45, i8** %35, align 8, !tbaa !32
  %46 = load i8, i8* %42, align 1, !tbaa !3
  %47 = add nuw i64 %28, 1
  %48 = getelementptr inbounds i8, i8* %1, i64 %28
  store i8 %46, i8* %48, align 1, !tbaa !3
  br label %64

49:                                               ; preds = %32, %17
  %50 = phi i64 [ %20, %17 ], [ %39, %32 ]
  %51 = phi i64 [ 0, %17 ], [ %28, %32 ]
  %52 = icmp eq i64 %50, 0
  %53 = select i1 %52, i32 16, i32 32
  br label %54

54:                                               ; preds = %49, %3
  %55 = phi i64 [ 0, %3 ], [ %51, %49 ]
  %56 = phi i32 [ 32, %3 ], [ %53, %49 ]
  %57 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  %58 = load i32, i32* %57, align 8, !tbaa !34
  %59 = or i32 %58, %56
  store i32 %59, i32* %57, align 8, !tbaa !34
  %60 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 11
  %61 = load i8*, i8** %60, align 8, !tbaa !31
  %62 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 2
  store i8* %61, i8** %62, align 8, !tbaa !33
  %63 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  store i8* %61, i8** %63, align 8, !tbaa !32
  br label %64

64:                                               ; preds = %25, %54, %41
  %65 = phi i64 [ %55, %54 ], [ %47, %41 ], [ %28, %25 ]
  ret i64 %65
}

; Function Attrs: nounwind optsize strictfp
define internal i64 @cookiewrite(%struct._IO_FILE* nocapture noundef %0, i8* noundef %1, i64 noundef %2) #0 {
  %4 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 21
  %5 = bitcast i8** %4 to %struct.fcookie**
  %6 = load %struct.fcookie*, %struct.fcookie** %5, align 8, !tbaa !27
  %7 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 5
  %8 = load i8*, i8** %7, align 8, !tbaa !35
  %9 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 7
  %10 = load i8*, i8** %9, align 8, !tbaa !36
  %11 = ptrtoint i8* %8 to i64
  %12 = ptrtoint i8* %10 to i64
  %13 = sub i64 %11, %12
  %14 = getelementptr inbounds %struct.fcookie, %struct.fcookie* %6, i64 0, i32 1, i32 1
  %15 = load i64 (i8*, i8*, i64)*, i64 (i8*, i8*, i64)** %14, align 8, !tbaa !37
  %16 = icmp eq i64 (i8*, i8*, i64)* %15, null
  br i1 %16, label %36, label %17

17:                                               ; preds = %3
  %18 = icmp eq i64 %13, 0
  br i1 %18, label %24, label %19

19:                                               ; preds = %17
  store i8* %10, i8** %7, align 8, !tbaa !35
  %20 = tail call i64 @cookiewrite(%struct._IO_FILE* noundef nonnull %0, i8* noundef %10, i64 noundef %13) #7
  %21 = icmp ult i64 %20, %13
  br i1 %21, label %36, label %22

22:                                               ; preds = %19
  %23 = load i64 (i8*, i8*, i64)*, i64 (i8*, i8*, i64)** %14, align 8, !tbaa !37
  br label %24

24:                                               ; preds = %22, %17
  %25 = phi i64 (i8*, i8*, i64)* [ %23, %22 ], [ %15, %17 ]
  %26 = getelementptr inbounds %struct.fcookie, %struct.fcookie* %6, i64 0, i32 0
  %27 = load i8*, i8** %26, align 8, !tbaa !30
  %28 = tail call i64 %25(i8* noundef %27, i8* noundef %1, i64 noundef %2) #4
  %29 = icmp slt i64 %28, 0
  br i1 %29, label %30, label %36

30:                                               ; preds = %24
  %31 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 4
  store i8* null, i8** %9, align 8, !tbaa !36
  %32 = bitcast i8** %31 to <2 x i8*>*
  store <2 x i8*> zeroinitializer, <2 x i8*>* %32, align 8, !tbaa !17
  %33 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  %34 = load i32, i32* %33, align 8, !tbaa !34
  %35 = or i32 %34, 32
  store i32 %35, i32* %33, align 8, !tbaa !34
  br label %36

36:                                               ; preds = %24, %19, %3, %30
  %37 = phi i64 [ 0, %30 ], [ %2, %3 ], [ 0, %19 ], [ %28, %24 ]
  ret i64 %37
}

; Function Attrs: nounwind optsize strictfp
define internal i64 @cookieseek(%struct._IO_FILE* nocapture noundef readonly %0, i64 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i64, align 8
  store i64 %1, i64* %4, align 8, !tbaa !38
  %5 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 21
  %6 = bitcast i8** %5 to %struct.fcookie**
  %7 = load %struct.fcookie*, %struct.fcookie** %6, align 8, !tbaa !27
  %8 = icmp ugt i32 %2, 2
  br i1 %8, label %9, label %11

9:                                                ; preds = %3
  %10 = tail call i32* @___errno_location() #5
  store i32 22, i32* %10, align 4, !tbaa !6
  br label %26

11:                                               ; preds = %3
  %12 = getelementptr inbounds %struct.fcookie, %struct.fcookie* %7, i64 0, i32 1, i32 2
  %13 = load i32 (i8*, i64*, i32)*, i32 (i8*, i64*, i32)** %12, align 8, !tbaa !39
  %14 = icmp eq i32 (i8*, i64*, i32)* %13, null
  br i1 %14, label %15, label %17

15:                                               ; preds = %11
  %16 = tail call i32* @___errno_location() #5
  store i32 95, i32* %16, align 4, !tbaa !6
  br label %26

17:                                               ; preds = %11
  %18 = getelementptr inbounds %struct.fcookie, %struct.fcookie* %7, i64 0, i32 0
  %19 = load i8*, i8** %18, align 8, !tbaa !30
  %20 = call i32 %13(i8* noundef %19, i64* noundef nonnull %4, i32 noundef %2) #4
  %21 = icmp slt i32 %20, 0
  br i1 %21, label %22, label %24

22:                                               ; preds = %17
  %23 = sext i32 %20 to i64
  br label %26

24:                                               ; preds = %17
  %25 = load i64, i64* %4, align 8, !tbaa !38
  br label %26

26:                                               ; preds = %24, %22, %15, %9
  %27 = phi i64 [ -1, %9 ], [ %23, %22 ], [ %25, %24 ], [ -1, %15 ]
  ret i64 %27
}

; Function Attrs: nounwind optsize strictfp
define internal i32 @cookieclose(%struct._IO_FILE* nocapture noundef readonly %0) #0 {
  %2 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 21
  %3 = bitcast i8** %2 to %struct.fcookie**
  %4 = load %struct.fcookie*, %struct.fcookie** %3, align 8, !tbaa !27
  %5 = getelementptr inbounds %struct.fcookie, %struct.fcookie* %4, i64 0, i32 1, i32 3
  %6 = load i32 (i8*)*, i32 (i8*)** %5, align 8, !tbaa !40
  %7 = icmp eq i32 (i8*)* %6, null
  br i1 %7, label %12, label %8

8:                                                ; preds = %1
  %9 = getelementptr inbounds %struct.fcookie, %struct.fcookie* %4, i64 0, i32 0
  %10 = load i8*, i8** %9, align 8, !tbaa !30
  %11 = tail call i32 %6(i8* noundef %10) #4
  br label %12

12:                                               ; preds = %1, %8
  %13 = phi i32 [ %11, %8 ], [ 0, %1 ]
  ret i32 %13
}

; Function Attrs: optsize
declare hidden %struct._IO_FILE* @__ofl_add(%struct._IO_FILE* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #6 = { strictfp }
attributes #7 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
!8 = !{!9, !7, i64 0}
!9 = !{!"cookie_FILE", !10, i64 0, !13, i64 232, !4, i64 272}
!10 = !{!"_IO_FILE", !7, i64 0, !11, i64 8, !11, i64 16, !11, i64 24, !11, i64 32, !11, i64 40, !11, i64 48, !11, i64 56, !11, i64 64, !11, i64 72, !11, i64 80, !11, i64 88, !12, i64 96, !11, i64 104, !11, i64 112, !7, i64 120, !7, i64 124, !12, i64 128, !7, i64 136, !7, i64 140, !7, i64 144, !11, i64 152, !12, i64 160, !11, i64 168, !11, i64 176, !11, i64 184, !12, i64 192, !12, i64 200, !11, i64 208, !11, i64 216, !11, i64 224}
!11 = !{!"any pointer", !4, i64 0}
!12 = !{!"long", !4, i64 0}
!13 = !{!"fcookie", !11, i64 0, !14, i64 8}
!14 = !{!"_IO_cookie_io_functions_t", !11, i64 0, !11, i64 8, !11, i64 16, !11, i64 24}
!15 = !{!9, !11, i64 232}
!16 = !{i64 0, i64 8, !17, i64 8, i64 8, !17, i64 16, i64 8, !17, i64 24, i64 8, !17}
!17 = !{!11, !11, i64 0}
!18 = !{!9, !7, i64 120}
!19 = !{!9, !11, i64 152}
!20 = !{!9, !11, i64 88}
!21 = !{!9, !12, i64 96}
!22 = !{!9, !7, i64 144}
!23 = !{!9, !11, i64 64}
!24 = !{!9, !11, i64 72}
!25 = !{!9, !11, i64 80}
!26 = !{!9, !11, i64 24}
!27 = !{!10, !11, i64 152}
!28 = !{!10, !12, i64 96}
!29 = !{!13, !11, i64 8}
!30 = !{!13, !11, i64 0}
!31 = !{!10, !11, i64 88}
!32 = !{!10, !11, i64 8}
!33 = !{!10, !11, i64 16}
!34 = !{!10, !7, i64 0}
!35 = !{!10, !11, i64 40}
!36 = !{!10, !11, i64 56}
!37 = !{!13, !11, i64 16}
!38 = !{!12, !12, i64 0}
!39 = !{!13, !11, i64 24}
!40 = !{!13, !11, i64 32}
