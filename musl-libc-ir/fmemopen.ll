; ModuleID = 'src/stdio/fmemopen.c'
source_filename = "src/stdio/fmemopen.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.cookie = type { i64, i64, i64, i8*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"rwa\00", align 1
@__libc = external hidden local_unnamed_addr global %struct.__libc, align 8

; Function Attrs: nounwind optsize strictfp
define %struct._IO_FILE* @fmemopen(i8* noalias noundef %0, i64 noundef %1, i8* noalias noundef %2) local_unnamed_addr #0 {
  %4 = tail call i8* @strchr(i8* noundef %2, i32 noundef 43) #6
  %5 = icmp eq i8* %4, null
  %6 = load i8, i8* %2, align 1, !tbaa !3
  %7 = sext i8 %6 to i32
  %8 = tail call i8* @strchr(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef %7) #6
  %9 = icmp eq i8* %8, null
  br i1 %9, label %10, label %12

10:                                               ; preds = %3
  %11 = tail call i32* @___errno_location() #7
  store i32 22, i32* %11, align 4, !tbaa !6
  br label %84

12:                                               ; preds = %3
  %13 = icmp eq i8* %0, null
  %14 = icmp slt i64 %1, 0
  %15 = and i1 %13, %14
  br i1 %15, label %16, label %18

16:                                               ; preds = %12
  %17 = tail call i32* @___errno_location() #7
  store i32 12, i32* %17, align 4, !tbaa !6
  br label %84

18:                                               ; preds = %12
  %19 = add i64 %1, 1304
  %20 = select i1 %13, i64 %19, i64 1304
  %21 = tail call i8* @malloc(i64 noundef %20) #6
  %22 = icmp eq i8* %21, null
  br i1 %22, label %84, label %23

23:                                               ; preds = %18
  %24 = tail call i8* @memset(i8* noundef nonnull %21, i32 noundef 0, i64 noundef 272) #6
  %25 = getelementptr inbounds i8, i8* %21, i64 232
  %26 = bitcast i8* %21 to %struct._IO_FILE*
  %27 = getelementptr inbounds i8, i8* %21, i64 152
  %28 = bitcast i8* %27 to i8**
  store i8* %25, i8** %28, align 8, !tbaa !8
  %29 = getelementptr inbounds i8, i8* %21, i64 120
  %30 = bitcast i8* %29 to i32*
  store i32 -1, i32* %30, align 8, !tbaa !12
  %31 = getelementptr inbounds i8, i8* %21, i64 144
  %32 = bitcast i8* %31 to i32*
  store i32 -1, i32* %32, align 8, !tbaa !13
  %33 = getelementptr inbounds i8, i8* %21, i64 280
  %34 = getelementptr inbounds i8, i8* %21, i64 88
  %35 = bitcast i8* %34 to i8**
  store i8* %33, i8** %35, align 8, !tbaa !14
  %36 = getelementptr inbounds i8, i8* %21, i64 96
  %37 = bitcast i8* %36 to i64*
  store i64 1024, i64* %37, align 8, !tbaa !15
  br i1 %13, label %38, label %41

38:                                               ; preds = %23
  %39 = getelementptr inbounds i8, i8* %21, i64 1304
  %40 = tail call i8* @memset(i8* noundef nonnull %39, i32 noundef 0, i64 noundef %1) #6
  br label %41

41:                                               ; preds = %38, %23
  %42 = phi i8* [ %0, %23 ], [ %39, %38 ]
  %43 = getelementptr inbounds i8, i8* %21, i64 256
  %44 = bitcast i8* %43 to i8**
  store i8* %42, i8** %44, align 8, !tbaa !16
  %45 = getelementptr inbounds i8, i8* %21, i64 248
  %46 = bitcast i8* %45 to i64*
  store i64 %1, i64* %46, align 8, !tbaa !18
  %47 = load i8, i8* %2, align 1, !tbaa !3
  %48 = sext i8 %47 to i32
  %49 = getelementptr inbounds i8, i8* %21, i64 264
  %50 = bitcast i8* %49 to i32*
  store i32 %48, i32* %50, align 8, !tbaa !19
  br i1 %5, label %51, label %56

51:                                               ; preds = %41
  %52 = load i8, i8* %2, align 1, !tbaa !3
  %53 = icmp eq i8 %52, 114
  %54 = select i1 %53, i32 8, i32 4
  %55 = bitcast i8* %21 to i32*
  store i32 %54, i32* %55, align 8, !tbaa !20
  br label %56

56:                                               ; preds = %51, %41
  %57 = load i8, i8* %2, align 1, !tbaa !3
  switch i8 %57, label %66 [
    i8 114, label %58
    i8 97, label %61
  ]

58:                                               ; preds = %56
  %59 = getelementptr inbounds i8, i8* %21, i64 240
  %60 = bitcast i8* %59 to i64*
  store i64 %1, i64* %60, align 8, !tbaa !21
  br label %68

61:                                               ; preds = %56
  %62 = tail call i64 @strnlen(i8* noundef nonnull %42, i64 noundef %1) #6
  %63 = bitcast i8* %25 to i64*
  store i64 %62, i64* %63, align 8, !tbaa !22
  %64 = getelementptr inbounds i8, i8* %21, i64 240
  %65 = bitcast i8* %64 to i64*
  store i64 %62, i64* %65, align 8, !tbaa !21
  br label %68

66:                                               ; preds = %56
  br i1 %5, label %68, label %67

67:                                               ; preds = %66
  store i8 0, i8* %42, align 1, !tbaa !3
  br label %68

68:                                               ; preds = %61, %67, %66, %58
  %69 = getelementptr inbounds i8, i8* %21, i64 64
  %70 = bitcast i8* %69 to i64 (%struct._IO_FILE*, i8*, i64)**
  store i64 (%struct._IO_FILE*, i8*, i64)* @mread, i64 (%struct._IO_FILE*, i8*, i64)** %70, align 8, !tbaa !23
  %71 = getelementptr inbounds i8, i8* %21, i64 72
  %72 = bitcast i8* %71 to i64 (%struct._IO_FILE*, i8*, i64)**
  store i64 (%struct._IO_FILE*, i8*, i64)* @mwrite, i64 (%struct._IO_FILE*, i8*, i64)** %72, align 8, !tbaa !24
  %73 = getelementptr inbounds i8, i8* %21, i64 80
  %74 = bitcast i8* %73 to i64 (%struct._IO_FILE*, i64, i32)**
  store i64 (%struct._IO_FILE*, i64, i32)* @mseek, i64 (%struct._IO_FILE*, i64, i32)** %74, align 8, !tbaa !25
  %75 = getelementptr inbounds i8, i8* %21, i64 24
  %76 = bitcast i8* %75 to i32 (%struct._IO_FILE*)**
  store i32 (%struct._IO_FILE*)* @mclose, i32 (%struct._IO_FILE*)** %76, align 8, !tbaa !26
  %77 = load i8, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 1), align 1, !tbaa !27
  %78 = icmp eq i8 %77, 0
  br i1 %78, label %79, label %82

79:                                               ; preds = %68
  %80 = getelementptr inbounds i8, i8* %21, i64 140
  %81 = bitcast i8* %80 to i32*
  store volatile i32 -1, i32* %81, align 4, !tbaa !30
  br label %82

82:                                               ; preds = %79, %68
  %83 = tail call %struct._IO_FILE* @__ofl_add(%struct._IO_FILE* noundef nonnull %26) #6
  br label %84

84:                                               ; preds = %18, %82, %16, %10
  %85 = phi %struct._IO_FILE* [ null, %16 ], [ %83, %82 ], [ null, %10 ], [ null, %18 ]
  ret %struct._IO_FILE* %85
}

; Function Attrs: optsize
declare i8* @strchr(i8* noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @malloc(i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i64 @strnlen(i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define internal i64 @mread(%struct._IO_FILE* nocapture noundef %0, i8* noundef %1, i64 noundef %2) #0 {
  %4 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 21
  %5 = bitcast i8** %4 to %struct.cookie**
  %6 = load %struct.cookie*, %struct.cookie** %5, align 8, !tbaa !8
  %7 = getelementptr inbounds %struct.cookie, %struct.cookie* %6, i64 0, i32 1
  %8 = load i64, i64* %7, align 8, !tbaa !21
  %9 = getelementptr inbounds %struct.cookie, %struct.cookie* %6, i64 0, i32 0
  %10 = load i64, i64* %9, align 8, !tbaa !22
  %11 = tail call i64 @llvm.usub.sat.i64(i64 %8, i64 %10)
  %12 = icmp ult i64 %11, %2
  br i1 %12, label %13, label %17

13:                                               ; preds = %3
  %14 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  %15 = load i32, i32* %14, align 8, !tbaa !20
  %16 = or i32 %15, 16
  store i32 %16, i32* %14, align 8, !tbaa !20
  br label %17

17:                                               ; preds = %13, %3
  %18 = phi i64 [ %11, %13 ], [ %2, %3 ]
  %19 = getelementptr inbounds %struct.cookie, %struct.cookie* %6, i64 0, i32 3
  %20 = load i8*, i8** %19, align 8, !tbaa !16
  %21 = getelementptr inbounds i8, i8* %20, i64 %10
  %22 = tail call i8* @memcpy(i8* noundef %1, i8* noundef %21, i64 noundef %18) #6
  %23 = load i64, i64* %9, align 8, !tbaa !22
  %24 = add i64 %23, %18
  store i64 %24, i64* %9, align 8, !tbaa !22
  %25 = sub i64 %11, %18
  %26 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 12
  %27 = load i64, i64* %26, align 8, !tbaa !15
  %28 = icmp ugt i64 %25, %27
  %29 = select i1 %28, i64 %27, i64 %25
  %30 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 11
  %31 = load i8*, i8** %30, align 8, !tbaa !14
  %32 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  store i8* %31, i8** %32, align 8, !tbaa !31
  %33 = getelementptr inbounds i8, i8* %31, i64 %29
  %34 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 2
  store i8* %33, i8** %34, align 8, !tbaa !32
  %35 = load i8*, i8** %19, align 8, !tbaa !16
  %36 = getelementptr inbounds i8, i8* %35, i64 %24
  %37 = tail call i8* @memcpy(i8* noundef %31, i8* noundef %36, i64 noundef %29) #6
  %38 = load i64, i64* %9, align 8, !tbaa !22
  %39 = add i64 %38, %29
  store i64 %39, i64* %9, align 8, !tbaa !22
  ret i64 %18
}

; Function Attrs: nounwind optsize strictfp
define internal i64 @mwrite(%struct._IO_FILE* nocapture noundef %0, i8* noundef %1, i64 noundef %2) #0 {
  %4 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 21
  %5 = bitcast i8** %4 to %struct.cookie**
  %6 = load %struct.cookie*, %struct.cookie** %5, align 8, !tbaa !8
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
  %16 = tail call i64 @mwrite(%struct._IO_FILE* noundef nonnull %0, i8* noundef %10, i64 noundef %13) #8
  %17 = icmp ult i64 %16, %13
  br i1 %17, label %65, label %18

18:                                               ; preds = %15, %3
  %19 = getelementptr inbounds %struct.cookie, %struct.cookie* %6, i64 0, i32 4
  %20 = load i32, i32* %19, align 8, !tbaa !19
  %21 = icmp eq i32 %20, 97
  br i1 %21, label %25, label %22

22:                                               ; preds = %18
  %23 = getelementptr inbounds %struct.cookie, %struct.cookie* %6, i64 0, i32 0
  %24 = load i64, i64* %23, align 8, !tbaa !22
  br label %29

25:                                               ; preds = %18
  %26 = getelementptr inbounds %struct.cookie, %struct.cookie* %6, i64 0, i32 1
  %27 = load i64, i64* %26, align 8, !tbaa !21
  %28 = getelementptr inbounds %struct.cookie, %struct.cookie* %6, i64 0, i32 0
  store i64 %27, i64* %28, align 8, !tbaa !22
  br label %29

29:                                               ; preds = %22, %25
  %30 = phi i64 [ %24, %22 ], [ %27, %25 ]
  %31 = getelementptr inbounds %struct.cookie, %struct.cookie* %6, i64 0, i32 2
  %32 = load i64, i64* %31, align 8, !tbaa !18
  %33 = getelementptr inbounds %struct.cookie, %struct.cookie* %6, i64 0, i32 0
  %34 = sub i64 %32, %30
  %35 = icmp ult i64 %34, %2
  %36 = select i1 %35, i64 %34, i64 %2
  %37 = getelementptr inbounds %struct.cookie, %struct.cookie* %6, i64 0, i32 3
  %38 = load i8*, i8** %37, align 8, !tbaa !16
  %39 = getelementptr inbounds i8, i8* %38, i64 %30
  %40 = tail call i8* @memcpy(i8* noundef %39, i8* noundef %1, i64 noundef %36) #6
  %41 = load i64, i64* %33, align 8, !tbaa !22
  %42 = add i64 %41, %36
  store i64 %42, i64* %33, align 8, !tbaa !22
  %43 = getelementptr inbounds %struct.cookie, %struct.cookie* %6, i64 0, i32 1
  %44 = load i64, i64* %43, align 8, !tbaa !21
  %45 = icmp ugt i64 %42, %44
  br i1 %45, label %46, label %65

46:                                               ; preds = %29
  store i64 %42, i64* %43, align 8, !tbaa !21
  %47 = load i64, i64* %31, align 8, !tbaa !18
  %48 = icmp ult i64 %42, %47
  br i1 %48, label %49, label %52

49:                                               ; preds = %46
  %50 = load i8*, i8** %37, align 8, !tbaa !16
  %51 = getelementptr inbounds i8, i8* %50, i64 %42
  br label %63

52:                                               ; preds = %46
  %53 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  %54 = load i32, i32* %53, align 8, !tbaa !20
  %55 = and i32 %54, 4
  %56 = icmp eq i32 %55, 0
  %57 = icmp eq i64 %47, 0
  %58 = select i1 %56, i1 true, i1 %57
  br i1 %58, label %65, label %59

59:                                               ; preds = %52
  %60 = load i8*, i8** %37, align 8, !tbaa !16
  %61 = add i64 %47, -1
  %62 = getelementptr inbounds i8, i8* %60, i64 %61
  br label %63

63:                                               ; preds = %49, %59
  %64 = phi i8* [ %62, %59 ], [ %51, %49 ]
  store i8 0, i8* %64, align 1, !tbaa !3
  br label %65

65:                                               ; preds = %63, %29, %52, %15
  %66 = phi i64 [ 0, %15 ], [ %36, %52 ], [ %36, %29 ], [ %36, %63 ]
  ret i64 %66
}

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define internal i64 @mseek(%struct._IO_FILE* nocapture noundef readonly %0, i64 noundef %1, i32 noundef %2) #3 {
  %4 = alloca [3 x i64], align 8
  %5 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 21
  %6 = bitcast i8** %5 to %struct.cookie**
  %7 = load %struct.cookie*, %struct.cookie** %6, align 8, !tbaa !8
  %8 = icmp ugt i32 %2, 2
  br i1 %8, label %9, label %11

9:                                                ; preds = %11, %23, %3
  %10 = tail call i32* @___errno_location() #7
  store i32 22, i32* %10, align 4, !tbaa !6
  br label %30

11:                                               ; preds = %3
  %12 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 0
  store i64 0, i64* %12, align 8, !tbaa !35
  %13 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 1
  %14 = getelementptr inbounds %struct.cookie, %struct.cookie* %7, i64 0, i32 0
  %15 = bitcast %struct.cookie* %7 to <2 x i64>*
  %16 = load <2 x i64>, <2 x i64>* %15, align 8, !tbaa !35
  %17 = bitcast i64* %13 to <2 x i64>*
  store <2 x i64> %16, <2 x i64>* %17, align 8, !tbaa !35
  %18 = zext i32 %2 to i64
  %19 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 %18
  %20 = load i64, i64* %19, align 8, !tbaa !35
  %21 = sub nsw i64 0, %20
  %22 = icmp sgt i64 %21, %1
  br i1 %22, label %9, label %23

23:                                               ; preds = %11
  %24 = getelementptr inbounds %struct.cookie, %struct.cookie* %7, i64 0, i32 2
  %25 = load i64, i64* %24, align 8, !tbaa !18
  %26 = sub nsw i64 %25, %20
  %27 = icmp slt i64 %26, %1
  br i1 %27, label %9, label %28

28:                                               ; preds = %23
  %29 = add nsw i64 %20, %1
  store i64 %29, i64* %14, align 8, !tbaa !22
  br label %30

30:                                               ; preds = %28, %9
  %31 = phi i64 [ -1, %9 ], [ %29, %28 ]
  ret i64 %31
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal i32 @mclose(%struct._IO_FILE* nocapture noundef readnone %0) #4 {
  ret i32 0
}

; Function Attrs: optsize
declare hidden %struct._IO_FILE* @__ofl_add(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.usub.sat.i64(i64, i64) #5

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #7 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #8 = { nobuiltin optsize strictfp "no-builtins" }

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
!8 = !{!9, !10, i64 152}
!9 = !{!"_IO_FILE", !7, i64 0, !10, i64 8, !10, i64 16, !10, i64 24, !10, i64 32, !10, i64 40, !10, i64 48, !10, i64 56, !10, i64 64, !10, i64 72, !10, i64 80, !10, i64 88, !11, i64 96, !10, i64 104, !10, i64 112, !7, i64 120, !7, i64 124, !11, i64 128, !7, i64 136, !7, i64 140, !7, i64 144, !10, i64 152, !11, i64 160, !10, i64 168, !10, i64 176, !10, i64 184, !11, i64 192, !11, i64 200, !10, i64 208, !10, i64 216, !10, i64 224}
!10 = !{!"any pointer", !4, i64 0}
!11 = !{!"long", !4, i64 0}
!12 = !{!9, !7, i64 120}
!13 = !{!9, !7, i64 144}
!14 = !{!9, !10, i64 88}
!15 = !{!9, !11, i64 96}
!16 = !{!17, !10, i64 24}
!17 = !{!"cookie", !11, i64 0, !11, i64 8, !11, i64 16, !10, i64 24, !7, i64 32}
!18 = !{!17, !11, i64 16}
!19 = !{!17, !7, i64 32}
!20 = !{!9, !7, i64 0}
!21 = !{!17, !11, i64 8}
!22 = !{!17, !11, i64 0}
!23 = !{!9, !10, i64 64}
!24 = !{!9, !10, i64 72}
!25 = !{!9, !10, i64 80}
!26 = !{!9, !10, i64 24}
!27 = !{!28, !4, i64 1}
!28 = !{!"__libc", !4, i64 0, !4, i64 1, !4, i64 2, !4, i64 3, !7, i64 4, !10, i64 8, !10, i64 16, !11, i64 24, !11, i64 32, !11, i64 40, !11, i64 48, !29, i64 56}
!29 = !{!"__locale_struct", !4, i64 0}
!30 = !{!9, !7, i64 140}
!31 = !{!9, !10, i64 8}
!32 = !{!9, !10, i64 16}
!33 = !{!9, !10, i64 40}
!34 = !{!9, !10, i64 56}
!35 = !{!11, !11, i64 0}
