; ModuleID = 'src/passwd/getgrent_a.c'
source_filename = "src/passwd/getgrent_a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type opaque
%struct.group = type { i8*, i8*, i32, i8** }

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__getgrent_a(%struct._IO_FILE* noundef %0, %struct.group* noundef %1, i8** noundef %2, i64* noundef %3, i8*** nocapture noundef %4, i64* nocapture noundef %5, %struct.group** nocapture noundef writeonly %6) local_unnamed_addr #0 {
  %8 = alloca i32, align 4
  %9 = bitcast i32* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %9) #4
  %10 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %8) #5
  %11 = call i64 @getline(i8** noundef %2, i64* noundef %3, %struct._IO_FILE* noundef %0) #5
  %12 = icmp slt i64 %11, 0
  br i1 %12, label %17, label %13

13:                                               ; preds = %7
  %14 = getelementptr inbounds %struct.group, %struct.group* %1, i64 0, i32 0
  %15 = getelementptr inbounds %struct.group, %struct.group* %1, i64 0, i32 1
  %16 = getelementptr inbounds %struct.group, %struct.group* %1, i64 0, i32 2
  br label %26

17:                                               ; preds = %35, %7
  %18 = call i32 @ferror(%struct._IO_FILE* noundef %0) #5
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %23, label %20

20:                                               ; preds = %17
  %21 = tail call i32* @___errno_location() #6
  %22 = load i32, i32* %21, align 4, !tbaa !3
  br label %23

23:                                               ; preds = %17, %20
  %24 = phi i32 [ %22, %20 ], [ 0, %17 ]
  %25 = load i8*, i8** %2, align 8, !tbaa !7
  call void @free(i8* noundef %25) #5
  store i8* null, i8** %2, align 8, !tbaa !7
  br label %115

26:                                               ; preds = %13, %35
  %27 = phi i64 [ %11, %13 ], [ %36, %35 ]
  %28 = load i8*, i8** %2, align 8, !tbaa !7
  %29 = add nsw i64 %27, -1
  %30 = getelementptr inbounds i8, i8* %28, i64 %29
  store i8 0, i8* %30, align 1, !tbaa !9
  %31 = load i8*, i8** %2, align 8, !tbaa !7
  %32 = getelementptr inbounds i8, i8* %31, i64 1
  store i8* %31, i8** %14, align 8, !tbaa !10
  %33 = call i8* @strchr(i8* noundef nonnull %32, i32 noundef 58) #5
  %34 = icmp eq i8* %33, null
  br i1 %34, label %35, label %38

35:                                               ; preds = %26, %38, %59
  %36 = call i64 @getline(i8** noundef nonnull %2, i64* noundef %3, %struct._IO_FILE* noundef %0) #5
  %37 = icmp slt i64 %36, 0
  br i1 %37, label %17, label %26

38:                                               ; preds = %26
  %39 = getelementptr inbounds i8, i8* %33, i64 1
  store i8 0, i8* %33, align 1, !tbaa !9
  store i8* %39, i8** %15, align 8, !tbaa !12
  %40 = call i8* @strchr(i8* noundef nonnull %39, i32 noundef 58) #5
  %41 = icmp eq i8* %40, null
  br i1 %41, label %35, label %42

42:                                               ; preds = %38
  %43 = getelementptr inbounds i8, i8* %40, i64 1
  store i8 0, i8* %40, align 1, !tbaa !9
  %44 = load i8, i8* %43, align 1, !tbaa !9
  %45 = sext i8 %44 to i32
  %46 = add nsw i32 %45, -48
  %47 = icmp ult i32 %46, 10
  br i1 %47, label %48, label %59

48:                                               ; preds = %42, %48
  %49 = phi i32 [ %57, %48 ], [ %46, %42 ]
  %50 = phi i8* [ %54, %48 ], [ %43, %42 ]
  %51 = phi i32 [ %53, %48 ], [ 0, %42 ]
  %52 = mul i32 %51, 10
  %53 = add i32 %52, %49
  %54 = getelementptr inbounds i8, i8* %50, i64 1
  %55 = load i8, i8* %54, align 1, !tbaa !9
  %56 = sext i8 %55 to i32
  %57 = add nsw i32 %56, -48
  %58 = icmp ult i32 %57, 10
  br i1 %58, label %48, label %59

59:                                               ; preds = %48, %42
  %60 = phi i8* [ %43, %42 ], [ %54, %48 ]
  %61 = phi i32 [ 0, %42 ], [ %53, %48 ]
  store i32 %61, i32* %16, align 8, !tbaa !13
  %62 = load i8, i8* %60, align 1, !tbaa !9
  %63 = icmp eq i8 %62, 58
  br i1 %63, label %64, label %35

64:                                               ; preds = %59
  %65 = getelementptr inbounds i8, i8* %60, i64 1
  store i8 0, i8* %60, align 1, !tbaa !9
  %66 = load i8, i8* %65, align 1, !tbaa !9
  %67 = icmp ne i8 %66, 0
  %68 = zext i1 %67 to i64
  store i64 %68, i64* %5, align 8, !tbaa !14
  br label %69

69:                                               ; preds = %75, %64
  %70 = phi i64 [ %68, %64 ], [ %76, %75 ]
  %71 = phi i8* [ %65, %64 ], [ %77, %75 ]
  %72 = load i8, i8* %71, align 1, !tbaa !9
  switch i8 %72, label %75 [
    i8 0, label %78
    i8 44, label %73
  ]

73:                                               ; preds = %69
  %74 = add i64 %70, 1
  store i64 %74, i64* %5, align 8, !tbaa !14
  br label %75

75:                                               ; preds = %69, %73
  %76 = phi i64 [ %70, %69 ], [ %74, %73 ]
  %77 = getelementptr inbounds i8, i8* %71, i64 1
  br label %69

78:                                               ; preds = %69
  %79 = bitcast i8*** %4 to i8**
  %80 = load i8*, i8** %79, align 8, !tbaa !7
  call void @free(i8* noundef %80) #5
  %81 = load i64, i64* %5, align 8, !tbaa !14
  %82 = add i64 %81, 1
  %83 = call i8* @calloc(i64 noundef 8, i64 noundef %82) #5
  %84 = bitcast i8* %83 to i8**
  store i8* %83, i8** %79, align 8, !tbaa !7
  %85 = icmp eq i8* %83, null
  br i1 %85, label %86, label %90

86:                                               ; preds = %78
  %87 = tail call i32* @___errno_location() #6
  %88 = load i32, i32* %87, align 4, !tbaa !3
  %89 = load i8*, i8** %2, align 8, !tbaa !7
  call void @free(i8* noundef %89) #5
  store i8* null, i8** %2, align 8, !tbaa !7
  br label %115

90:                                               ; preds = %78
  %91 = load i8, i8* %65, align 1, !tbaa !9
  %92 = icmp eq i8 %91, 0
  br i1 %92, label %111, label %93

93:                                               ; preds = %90
  store i8* %65, i8** %84, align 8, !tbaa !7
  br label %94

94:                                               ; preds = %103, %93
  %95 = phi i8* [ %65, %93 ], [ %106, %103 ]
  %96 = phi i64 [ 0, %93 ], [ %105, %103 ]
  %97 = load i8, i8* %95, align 1, !tbaa !9
  switch i8 %97, label %103 [
    i8 0, label %107
    i8 44, label %98
  ]

98:                                               ; preds = %94
  %99 = getelementptr inbounds i8, i8* %95, i64 1
  store i8 0, i8* %95, align 1, !tbaa !9
  %100 = load i8**, i8*** %4, align 8, !tbaa !7
  %101 = add i64 %96, 1
  %102 = getelementptr inbounds i8*, i8** %100, i64 %101
  store i8* %99, i8** %102, align 8, !tbaa !7
  br label %103

103:                                              ; preds = %94, %98
  %104 = phi i8* [ %95, %94 ], [ %99, %98 ]
  %105 = phi i64 [ %96, %94 ], [ %101, %98 ]
  %106 = getelementptr inbounds i8, i8* %104, i64 1
  br label %94

107:                                              ; preds = %94
  %108 = load i8**, i8*** %4, align 8, !tbaa !7
  %109 = add i64 %96, 1
  %110 = getelementptr inbounds i8*, i8** %108, i64 %109
  br label %111

111:                                              ; preds = %90, %107
  %112 = phi i8** [ %110, %107 ], [ %84, %90 ]
  store i8* null, i8** %112, align 8, !tbaa !7
  %113 = load i8**, i8*** %4, align 8, !tbaa !7
  %114 = getelementptr inbounds %struct.group, %struct.group* %1, i64 0, i32 3
  store i8** %113, i8*** %114, align 8, !tbaa !16
  br label %115

115:                                              ; preds = %111, %86, %23
  %116 = phi %struct.group* [ null, %23 ], [ %1, %111 ], [ null, %86 ]
  %117 = phi i32 [ %24, %23 ], [ 0, %111 ], [ %88, %86 ]
  %118 = load i32, i32* %8, align 4, !tbaa !3
  %119 = call i32 @pthread_setcancelstate(i32 noundef %118, i32* noundef null) #5
  store %struct.group* %116, %struct.group** %6, align 8, !tbaa !7
  %120 = icmp eq i32 %117, 0
  br i1 %120, label %123, label %121

121:                                              ; preds = %115
  %122 = tail call i32* @___errno_location() #6
  store i32 %117, i32* %122, align 4, !tbaa !3
  br label %123

123:                                              ; preds = %121, %115
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %9) #4
  ret i32 %117
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @getline(i8** noundef, i64* noundef, %struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @ferror(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @strchr(i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"any pointer", !5, i64 0}
!9 = !{!5, !5, i64 0}
!10 = !{!11, !8, i64 0}
!11 = !{!"group", !8, i64 0, !8, i64 8, !4, i64 16, !8, i64 24}
!12 = !{!11, !8, i64 8}
!13 = !{!11, !4, i64 16}
!14 = !{!15, !15, i64 0}
!15 = !{!"long", !5, i64 0}
!16 = !{!11, !8, i64 24}
