; ModuleID = 'src/passwd/getpwent_a.c'
source_filename = "src/passwd/getpwent_a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type opaque
%struct.passwd = type { i8*, i8*, i32, i32, i8*, i8*, i8* }

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__getpwent_a(%struct._IO_FILE* noundef %0, %struct.passwd* noundef %1, i8** noundef %2, i64* noundef %3, %struct.passwd** nocapture noundef writeonly %4) local_unnamed_addr #0 {
  %6 = alloca i32, align 4
  %7 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %7) #4
  %8 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %6) #5
  %9 = call i64 @getline(i8** noundef %2, i64* noundef %3, %struct._IO_FILE* noundef %0) #5
  %10 = icmp slt i64 %9, 0
  br i1 %10, label %18, label %11

11:                                               ; preds = %5
  %12 = getelementptr inbounds %struct.passwd, %struct.passwd* %1, i64 0, i32 0
  %13 = getelementptr inbounds %struct.passwd, %struct.passwd* %1, i64 0, i32 1
  %14 = getelementptr inbounds %struct.passwd, %struct.passwd* %1, i64 0, i32 2
  %15 = getelementptr inbounds %struct.passwd, %struct.passwd* %1, i64 0, i32 3
  %16 = getelementptr inbounds %struct.passwd, %struct.passwd* %1, i64 0, i32 4
  %17 = getelementptr inbounds %struct.passwd, %struct.passwd* %1, i64 0, i32 5
  br label %27

18:                                               ; preds = %36, %5
  %19 = call i32 @ferror(%struct._IO_FILE* noundef %0) #5
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %24, label %21

21:                                               ; preds = %18
  %22 = tail call i32* @___errno_location() #6
  %23 = load i32, i32* %22, align 4, !tbaa !3
  br label %24

24:                                               ; preds = %18, %21
  %25 = phi i32 [ %23, %21 ], [ 0, %18 ]
  %26 = load i8*, i8** %2, align 8, !tbaa !7
  call void @free(i8* noundef %26) #5
  store i8* null, i8** %2, align 8, !tbaa !7
  br label %98

27:                                               ; preds = %11, %36
  %28 = phi i64 [ %9, %11 ], [ %37, %36 ]
  %29 = load i8*, i8** %2, align 8, !tbaa !7
  %30 = add nsw i64 %28, -1
  %31 = getelementptr inbounds i8, i8* %29, i64 %30
  store i8 0, i8* %31, align 1, !tbaa !9
  %32 = load i8*, i8** %2, align 8, !tbaa !7
  %33 = getelementptr inbounds i8, i8* %32, i64 1
  store i8* %32, i8** %12, align 8, !tbaa !10
  %34 = call i8* @strchr(i8* noundef nonnull %33, i32 noundef 58) #5
  %35 = icmp eq i8* %34, null
  br i1 %35, label %36, label %39

36:                                               ; preds = %27, %39, %60, %82, %87, %91
  %37 = call i64 @getline(i8** noundef nonnull %2, i64* noundef %3, %struct._IO_FILE* noundef %0) #5
  %38 = icmp slt i64 %37, 0
  br i1 %38, label %18, label %27

39:                                               ; preds = %27
  %40 = getelementptr inbounds i8, i8* %34, i64 1
  store i8 0, i8* %34, align 1, !tbaa !9
  store i8* %40, i8** %13, align 8, !tbaa !12
  %41 = call i8* @strchr(i8* noundef nonnull %40, i32 noundef 58) #5
  %42 = icmp eq i8* %41, null
  br i1 %42, label %36, label %43

43:                                               ; preds = %39
  %44 = getelementptr inbounds i8, i8* %41, i64 1
  store i8 0, i8* %41, align 1, !tbaa !9
  %45 = load i8, i8* %44, align 1, !tbaa !9
  %46 = sext i8 %45 to i32
  %47 = add nsw i32 %46, -48
  %48 = icmp ult i32 %47, 10
  br i1 %48, label %49, label %60

49:                                               ; preds = %43, %49
  %50 = phi i32 [ %58, %49 ], [ %47, %43 ]
  %51 = phi i8* [ %55, %49 ], [ %44, %43 ]
  %52 = phi i32 [ %54, %49 ], [ 0, %43 ]
  %53 = mul i32 %52, 10
  %54 = add i32 %53, %50
  %55 = getelementptr inbounds i8, i8* %51, i64 1
  %56 = load i8, i8* %55, align 1, !tbaa !9
  %57 = sext i8 %56 to i32
  %58 = add nsw i32 %57, -48
  %59 = icmp ult i32 %58, 10
  br i1 %59, label %49, label %60

60:                                               ; preds = %49, %43
  %61 = phi i8* [ %44, %43 ], [ %55, %49 ]
  %62 = phi i32 [ 0, %43 ], [ %54, %49 ]
  store i32 %62, i32* %14, align 8, !tbaa !13
  %63 = load i8, i8* %61, align 1, !tbaa !9
  %64 = icmp eq i8 %63, 58
  br i1 %64, label %65, label %36

65:                                               ; preds = %60
  %66 = getelementptr inbounds i8, i8* %61, i64 1
  store i8 0, i8* %61, align 1, !tbaa !9
  %67 = load i8, i8* %66, align 1, !tbaa !9
  %68 = sext i8 %67 to i32
  %69 = add nsw i32 %68, -48
  %70 = icmp ult i32 %69, 10
  br i1 %70, label %71, label %82

71:                                               ; preds = %65, %71
  %72 = phi i32 [ %80, %71 ], [ %69, %65 ]
  %73 = phi i8* [ %77, %71 ], [ %66, %65 ]
  %74 = phi i32 [ %76, %71 ], [ 0, %65 ]
  %75 = mul i32 %74, 10
  %76 = add i32 %75, %72
  %77 = getelementptr inbounds i8, i8* %73, i64 1
  %78 = load i8, i8* %77, align 1, !tbaa !9
  %79 = sext i8 %78 to i32
  %80 = add nsw i32 %79, -48
  %81 = icmp ult i32 %80, 10
  br i1 %81, label %71, label %82

82:                                               ; preds = %71, %65
  %83 = phi i8* [ %66, %65 ], [ %77, %71 ]
  %84 = phi i32 [ 0, %65 ], [ %76, %71 ]
  store i32 %84, i32* %15, align 4, !tbaa !14
  %85 = load i8, i8* %83, align 1, !tbaa !9
  %86 = icmp eq i8 %85, 58
  br i1 %86, label %87, label %36

87:                                               ; preds = %82
  %88 = getelementptr inbounds i8, i8* %83, i64 1
  store i8 0, i8* %83, align 1, !tbaa !9
  store i8* %88, i8** %16, align 8, !tbaa !15
  %89 = call i8* @strchr(i8* noundef nonnull %88, i32 noundef 58) #5
  %90 = icmp eq i8* %89, null
  br i1 %90, label %36, label %91

91:                                               ; preds = %87
  %92 = getelementptr inbounds i8, i8* %89, i64 1
  store i8 0, i8* %89, align 1, !tbaa !9
  store i8* %92, i8** %17, align 8, !tbaa !16
  %93 = call i8* @strchr(i8* noundef nonnull %92, i32 noundef 58) #5
  %94 = icmp eq i8* %93, null
  br i1 %94, label %36, label %95

95:                                               ; preds = %91
  %96 = getelementptr inbounds i8, i8* %93, i64 1
  store i8 0, i8* %93, align 1, !tbaa !9
  %97 = getelementptr inbounds %struct.passwd, %struct.passwd* %1, i64 0, i32 6
  store i8* %96, i8** %97, align 8, !tbaa !17
  br label %98

98:                                               ; preds = %95, %24
  %99 = phi %struct.passwd* [ null, %24 ], [ %1, %95 ]
  %100 = phi i32 [ %25, %24 ], [ 0, %95 ]
  %101 = load i32, i32* %6, align 4, !tbaa !3
  %102 = call i32 @pthread_setcancelstate(i32 noundef %101, i32* noundef null) #5
  store %struct.passwd* %99, %struct.passwd** %4, align 8, !tbaa !7
  %103 = icmp eq i32 %100, 0
  br i1 %103, label %106, label %104

104:                                              ; preds = %98
  %105 = tail call i32* @___errno_location() #6
  store i32 %100, i32* %105, align 4, !tbaa !3
  br label %106

106:                                              ; preds = %104, %98
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %7) #4
  ret i32 %100
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
!11 = !{!"passwd", !8, i64 0, !8, i64 8, !4, i64 16, !4, i64 20, !8, i64 24, !8, i64 32, !8, i64 40}
!12 = !{!11, !8, i64 8}
!13 = !{!11, !4, i64 16}
!14 = !{!11, !4, i64 20}
!15 = !{!11, !8, i64 24}
!16 = !{!11, !8, i64 32}
!17 = !{!11, !8, i64 40}
