; ModuleID = 'src/passwd/nscd_query.c'
source_filename = "src/passwd/nscd_query.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i16, [21 x i8] }
%struct._IO_FILE = type opaque
%struct.msghdr = type { i8*, i32, %struct.iovec*, i32, i32, i8*, i32, i32, i32 }
%struct.iovec = type { i8*, i64 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"/dev/null\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"re\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@addr = internal constant %struct.anon { i16 1, [21 x i8] c"/var/run/nscd/socket\00" }, align 2

; Function Attrs: nounwind optsize strictfp
define hidden %struct._IO_FILE* @__nscd_query(i32 noundef %0, i8* noundef %1, i32* noundef %2, i64 noundef %3, i32* nocapture noundef %4) local_unnamed_addr #0 {
  %6 = alloca [3 x i32], align 4
  %7 = alloca %struct.msghdr, align 8
  %8 = alloca [2 x %struct.iovec], align 8
  %9 = bitcast [3 x i32]* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %9) #6
  %10 = getelementptr inbounds [3 x i32], [3 x i32]* %6, i64 0, i64 0
  store i32 2, i32* %10, align 4, !tbaa !3
  %11 = getelementptr inbounds [3 x i32], [3 x i32]* %6, i64 0, i64 1
  store i32 %0, i32* %11, align 4, !tbaa !3
  %12 = getelementptr inbounds [3 x i32], [3 x i32]* %6, i64 0, i64 2
  %13 = tail call i64 @strnlen(i8* noundef %1, i64 noundef 256) #7
  %14 = trunc i64 %13 to i32
  %15 = add i32 %14, 1
  store i32 %15, i32* %12, align 4, !tbaa !3
  %16 = bitcast %struct.msghdr* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %16) #6
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(56) %16, i8 0, i64 56, i1 false) #8
  %17 = getelementptr inbounds %struct.msghdr, %struct.msghdr* %7, i64 0, i32 2
  %18 = getelementptr inbounds [2 x %struct.iovec], [2 x %struct.iovec]* %8, i64 0, i64 0
  %19 = bitcast [2 x %struct.iovec]* %8 to [3 x i32]**
  store [3 x i32]* %6, [3 x i32]** %19, align 8, !tbaa !7
  %20 = getelementptr inbounds [2 x %struct.iovec], [2 x %struct.iovec]* %8, i64 0, i64 0, i32 1
  store i64 12, i64* %20, align 8, !tbaa !11
  %21 = getelementptr inbounds [2 x %struct.iovec], [2 x %struct.iovec]* %8, i64 0, i64 1, i32 0
  store i8* %1, i8** %21, align 8, !tbaa !7
  %22 = getelementptr inbounds [2 x %struct.iovec], [2 x %struct.iovec]* %8, i64 0, i64 1, i32 1
  %23 = call i64 @strlen(i8* noundef %1) #7
  %24 = add i64 %23, 1
  store i64 %24, i64* %22, align 8, !tbaa !11
  store %struct.iovec* %18, %struct.iovec** %17, align 8, !tbaa !12
  %25 = getelementptr inbounds %struct.msghdr, %struct.msghdr* %7, i64 0, i32 3
  store i32 2, i32* %25, align 8, !tbaa !14
  %26 = tail call i32* @___errno_location() #9
  %27 = load i32, i32* %26, align 4, !tbaa !3
  %28 = bitcast i32* %2 to i8*
  store i32 0, i32* %4, align 4, !tbaa !3
  %29 = call i8* @memset(i8* noundef %28, i32 noundef 0, i64 noundef %3) #7
  store i32 2, i32* %2, align 4, !tbaa !3
  %30 = call i32 @socket(i32 noundef 1, i32 noundef 524289, i32 noundef 0) #7
  %31 = icmp slt i32 %30, 0
  br i1 %31, label %36, label %43

32:                                               ; preds = %72
  store i32 1, i32* %4, align 4, !tbaa !3
  %33 = call i8* @memset(i8* noundef nonnull %28, i32 noundef 0, i64 noundef %3) #7
  store i32 2, i32* %2, align 4, !tbaa !3
  %34 = call i32 @socket(i32 noundef 1, i32 noundef 524289, i32 noundef 0) #7
  %35 = icmp slt i32 %34, 0
  br i1 %35, label %36, label %43

36:                                               ; preds = %32, %5
  %37 = load i32, i32* %26, align 4, !tbaa !3
  %38 = icmp eq i32 %37, 97
  br i1 %38, label %39, label %99

39:                                               ; preds = %36
  %40 = call %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0)) #7
  %41 = icmp eq %struct._IO_FILE* %40, null
  br i1 %41, label %99, label %42

42:                                               ; preds = %39
  store i32 %27, i32* %26, align 4, !tbaa !3
  br label %99

43:                                               ; preds = %5, %32
  %44 = phi i32 [ %34, %32 ], [ %30, %5 ]
  %45 = call %struct._IO_FILE* @fdopen(i32 noundef %44, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)) #7
  %46 = icmp eq %struct._IO_FILE* %45, null
  br i1 %46, label %47, label %49

47:                                               ; preds = %43
  %48 = call i32 @close(i32 noundef %44) #7
  br label %99

49:                                               ; preds = %43
  %50 = load i32, i32* %12, align 4, !tbaa !3
  %51 = icmp sgt i32 %50, 256
  br i1 %51, label %99, label %52

52:                                               ; preds = %49
  %53 = call i32 @connect(i32 noundef %44, %struct.sockaddr* noundef bitcast (%struct.anon* @addr to %struct.sockaddr*), i32 noundef 24) #7
  %54 = icmp slt i32 %53, 0
  br i1 %54, label %55, label %58

55:                                               ; preds = %52
  %56 = load i32, i32* %26, align 4, !tbaa !3
  switch i32 %56, label %97 [
    i32 13, label %57
    i32 111, label %57
    i32 2, label %57
  ]

57:                                               ; preds = %55, %55, %55
  store i32 %27, i32* %26, align 4, !tbaa !3
  br label %99

58:                                               ; preds = %52
  %59 = call i64 @sendmsg(i32 noundef %44, %struct.msghdr* noundef nonnull %7, i32 noundef 16384) #7
  %60 = icmp slt i64 %59, 0
  br i1 %60, label %97, label %61

61:                                               ; preds = %58
  %62 = call i64 @fread(i8* noundef nonnull %28, i64 noundef %3, i64 noundef 1, %struct._IO_FILE* noundef nonnull %45) #7
  %63 = icmp eq i64 %62, 0
  br i1 %63, label %64, label %79

64:                                               ; preds = %61
  %65 = call i32 @ferror(%struct._IO_FILE* noundef nonnull %45) #7
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %67, label %97

67:                                               ; preds = %64
  %68 = load i32, i32* %4, align 4, !tbaa !3
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %70, label %96

70:                                               ; preds = %67
  %71 = call i32 @fclose(%struct._IO_FILE* noundef nonnull %45) #7
  br label %72

72:                                               ; preds = %70, %72
  %73 = phi i64 [ 0, %70 ], [ %77, %72 ]
  %74 = getelementptr inbounds [3 x i32], [3 x i32]* %6, i64 0, i64 %73
  %75 = load i32, i32* %74, align 4, !tbaa !3
  %76 = call i32 @llvm.bswap.i32(i32 %75) #10
  store i32 %76, i32* %74, align 4, !tbaa !3
  %77 = add nuw nsw i64 %73, 1
  %78 = icmp eq i64 %77, 3
  br i1 %78, label %32, label %72

79:                                               ; preds = %61
  %80 = load i32, i32* %4, align 4, !tbaa !3
  %81 = icmp eq i32 %80, 0
  %82 = icmp ult i64 %3, 4
  %83 = or i1 %81, %82
  br i1 %83, label %93, label %84

84:                                               ; preds = %79
  %85 = lshr i64 %3, 2
  br label %86

86:                                               ; preds = %84, %86
  %87 = phi i64 [ %91, %86 ], [ 0, %84 ]
  %88 = getelementptr inbounds i32, i32* %2, i64 %87
  %89 = load i32, i32* %88, align 4, !tbaa !3
  %90 = call i32 @llvm.bswap.i32(i32 %89) #10
  store i32 %90, i32* %88, align 4, !tbaa !3
  %91 = add nuw nsw i64 %87, 1
  %92 = icmp eq i64 %91, %85
  br i1 %92, label %93, label %86

93:                                               ; preds = %86, %79
  %94 = load i32, i32* %2, align 4, !tbaa !3
  %95 = icmp eq i32 %94, 2
  br i1 %95, label %99, label %96

96:                                               ; preds = %67, %93
  store i32 5, i32* %26, align 4, !tbaa !3
  br label %97

97:                                               ; preds = %64, %58, %96, %55
  %98 = call i32 @fclose(%struct._IO_FILE* noundef nonnull %45) #7
  br label %99

99:                                               ; preds = %49, %93, %36, %39, %42, %97, %57, %47
  %100 = phi %struct._IO_FILE* [ %45, %57 ], [ null, %97 ], [ null, %47 ], [ %40, %42 ], [ null, %39 ], [ null, %36 ], [ %45, %93 ], [ %45, %49 ]
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %16) #6
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %9) #6
  ret %struct._IO_FILE* %100
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i64 @strnlen(i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #4

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare %struct._IO_FILE* @fopen(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare %struct._IO_FILE* @fdopen(i32 noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @close(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @connect(i32 noundef, %struct.sockaddr* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @sendmsg(i32 noundef, %struct.msghdr* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @fread(i8* noundef, i64 noundef, i64 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @ferror(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @fclose(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.bswap.i32(i32) #5

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #4 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { nounwind strictfp }
attributes #7 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #8 = { strictfp }
attributes #9 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #10 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !9, i64 0}
!8 = !{!"iovec", !9, i64 0, !10, i64 8}
!9 = !{!"any pointer", !5, i64 0}
!10 = !{!"long", !5, i64 0}
!11 = !{!8, !10, i64 8}
!12 = !{!13, !9, i64 16}
!13 = !{!"msghdr", !9, i64 0, !4, i64 8, !9, i64 16, !4, i64 24, !4, i64 28, !9, i64 32, !4, i64 40, !4, i64 44, !4, i64 48}
!14 = !{!13, !4, i64 24}
