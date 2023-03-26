; ModuleID = 'src/network/gethostbyname2_r.c'
source_filename = "src/network/gethostbyname2_r.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.hostent = type { i8*, i8**, i32, i32, i8** }
%struct.address = type { i32, i32, [16 x i8], i32 }

; Function Attrs: nounwind optsize strictfp
define i32 @gethostbyname2_r(i8* noundef %0, i32 noundef %1, %struct.hostent* noundef %2, i8* noundef %3, i64 noundef %4, %struct.hostent** nocapture noundef writeonly %5, i32* nocapture noundef writeonly %6) local_unnamed_addr #0 {
  %8 = alloca [48 x %struct.address], align 16
  %9 = alloca [256 x i8], align 16
  %10 = bitcast [48 x %struct.address]* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 1344, i8* nonnull %10) #4
  %11 = getelementptr inbounds [256 x i8], [256 x i8]* %9, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %11) #4
  store %struct.hostent* null, %struct.hostent** %5, align 8, !tbaa !3
  %12 = getelementptr inbounds [48 x %struct.address], [48 x %struct.address]* %8, i64 0, i64 0
  %13 = call i32 @__lookup_name(%struct.address* noundef nonnull %12, i8* noundef nonnull %11, i8* noundef %0, i32 noundef %1, i32 noundef 2) #5
  %14 = icmp slt i32 %13, 0
  br i1 %14, label %15, label %22

15:                                               ; preds = %7
  switch i32 %13, label %18 [
    i32 -2, label %16
    i32 -3, label %17
    i32 -11, label %19
    i32 -10, label %19
  ]

16:                                               ; preds = %15
  store i32 1, i32* %6, align 4, !tbaa !7
  br label %114

17:                                               ; preds = %15
  store i32 2, i32* %6, align 4, !tbaa !7
  br label %114

18:                                               ; preds = %15
  store i32 3, i32* %6, align 4, !tbaa !7
  br label %114

19:                                               ; preds = %15, %15
  store i32 3, i32* %6, align 4, !tbaa !7
  %20 = tail call i32* @___errno_location() #6
  %21 = load i32, i32* %20, align 4, !tbaa !7
  br label %114

22:                                               ; preds = %7
  %23 = getelementptr inbounds %struct.hostent, %struct.hostent* %2, i64 0, i32 2
  store i32 %1, i32* %23, align 8, !tbaa !9
  %24 = icmp eq i32 %1, 10
  %25 = select i1 %24, i32 16, i32 4
  %26 = getelementptr inbounds %struct.hostent, %struct.hostent* %2, i64 0, i32 3
  store i32 %25, i32* %26, align 4, !tbaa !11
  %27 = ptrtoint i8* %3 to i64
  %28 = sub i64 0, %27
  %29 = and i64 %28, 7
  %30 = add nuw nsw i32 %13, 1
  %31 = zext i32 %30 to i64
  %32 = or i32 %25, 8
  %33 = zext i32 %32 to i64
  %34 = mul nuw nsw i64 %31, %33
  %35 = call i64 @strlen(i8* noundef %0) #5
  %36 = call i64 @strlen(i8* noundef nonnull %11) #5
  %37 = add nuw nsw i64 %29, 34
  %38 = add nuw nsw i64 %37, %34
  %39 = add i64 %38, %35
  %40 = add i64 %39, %36
  %41 = icmp ugt i64 %40, %4
  br i1 %41, label %114, label %42

42:                                               ; preds = %22
  %43 = getelementptr inbounds i8, i8* %3, i64 %29
  %44 = getelementptr inbounds %struct.hostent, %struct.hostent* %2, i64 0, i32 1
  %45 = bitcast i8*** %44 to i8**
  store i8* %43, i8** %45, align 8, !tbaa !12
  %46 = getelementptr inbounds i8, i8* %43, i64 24
  %47 = getelementptr inbounds %struct.hostent, %struct.hostent* %2, i64 0, i32 4
  %48 = bitcast i8*** %47 to i8**
  store i8* %46, i8** %48, align 8, !tbaa !13
  %49 = shl nuw nsw i64 %31, 3
  %50 = getelementptr inbounds i8, i8* %46, i64 %49
  %51 = icmp eq i32 %13, 0
  %52 = bitcast i8* %46 to i8**
  br i1 %51, label %82, label %53

53:                                               ; preds = %42
  %54 = zext i32 %13 to i64
  store i8* %50, i8** %52, align 8, !tbaa !3
  %55 = load i32, i32* %26, align 4, !tbaa !11
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i8, i8* %50, i64 %56
  %58 = load i8**, i8*** %47, align 8, !tbaa !13
  %59 = load i8*, i8** %58, align 8, !tbaa !3
  %60 = getelementptr inbounds [48 x %struct.address], [48 x %struct.address]* %8, i64 0, i64 0, i32 2, i64 0
  %61 = call i8* @memcpy(i8* noundef %59, i8* noundef nonnull %60, i64 noundef %56) #5
  %62 = icmp eq i32 %13, 1
  br i1 %62, label %78, label %63

63:                                               ; preds = %53, %63
  %64 = phi i64 [ %76, %63 ], [ 1, %53 ]
  %65 = phi i8* [ %70, %63 ], [ %57, %53 ]
  %66 = load i8**, i8*** %47, align 8, !tbaa !13
  %67 = getelementptr inbounds i8*, i8** %66, i64 %64
  store i8* %65, i8** %67, align 8, !tbaa !3
  %68 = load i32, i32* %26, align 4, !tbaa !11
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8, i8* %65, i64 %69
  %71 = load i8**, i8*** %47, align 8, !tbaa !13
  %72 = getelementptr inbounds i8*, i8** %71, i64 %64
  %73 = load i8*, i8** %72, align 8, !tbaa !3
  %74 = getelementptr inbounds [48 x %struct.address], [48 x %struct.address]* %8, i64 0, i64 %64, i32 2, i64 0
  %75 = call i8* @memcpy(i8* noundef %73, i8* noundef nonnull %74, i64 noundef %69) #5
  %76 = add nuw nsw i64 %64, 1
  %77 = icmp eq i64 %76, %54
  br i1 %77, label %78, label %63

78:                                               ; preds = %63, %53
  %79 = phi i8* [ %57, %53 ], [ %70, %63 ]
  %80 = load i8**, i8*** %47, align 8, !tbaa !13
  %81 = zext i32 %13 to i64
  br label %82

82:                                               ; preds = %42, %78
  %83 = phi i8** [ %80, %78 ], [ %52, %42 ]
  %84 = phi i64 [ %81, %78 ], [ 0, %42 ]
  %85 = phi i8* [ %79, %78 ], [ %50, %42 ]
  %86 = getelementptr inbounds i8*, i8** %83, i64 %84
  store i8* null, i8** %86, align 8, !tbaa !3
  %87 = load i8**, i8*** %44, align 8, !tbaa !12
  store i8* %85, i8** %87, align 8, !tbaa !3
  %88 = getelementptr inbounds %struct.hostent, %struct.hostent* %2, i64 0, i32 0
  store i8* %85, i8** %88, align 8, !tbaa !14
  %89 = call i8* @strcpy(i8* noundef %85, i8* noundef nonnull %11) #5
  %90 = load i8*, i8** %88, align 8, !tbaa !14
  %91 = call i64 @strlen(i8* noundef %90) #5
  %92 = load i8*, i8** %88, align 8, !tbaa !14
  %93 = call i32 @strcmp(i8* noundef %92, i8* noundef %0) #5
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %108, label %95

95:                                               ; preds = %82
  %96 = add i64 %91, 1
  %97 = getelementptr inbounds i8, i8* %85, i64 %96
  %98 = load i8**, i8*** %44, align 8, !tbaa !12
  %99 = getelementptr inbounds i8*, i8** %98, i64 1
  store i8* %97, i8** %99, align 8, !tbaa !3
  %100 = load i8**, i8*** %44, align 8, !tbaa !12
  %101 = getelementptr inbounds i8*, i8** %100, i64 1
  %102 = load i8*, i8** %101, align 8, !tbaa !3
  %103 = call i8* @strcpy(i8* noundef %102, i8* noundef %0) #5
  %104 = load i8**, i8*** %44, align 8, !tbaa !12
  %105 = getelementptr inbounds i8*, i8** %104, i64 1
  %106 = load i8*, i8** %105, align 8, !tbaa !3
  %107 = call i64 @strlen(i8* noundef %106) #5
  br label %111

108:                                              ; preds = %82
  %109 = load i8**, i8*** %44, align 8, !tbaa !12
  %110 = getelementptr inbounds i8*, i8** %109, i64 1
  store i8* null, i8** %110, align 8, !tbaa !3
  br label %111

111:                                              ; preds = %108, %95
  %112 = load i8**, i8*** %44, align 8, !tbaa !12
  %113 = getelementptr inbounds i8*, i8** %112, i64 2
  store i8* null, i8** %113, align 8, !tbaa !3
  store %struct.hostent* %2, %struct.hostent** %5, align 8, !tbaa !3
  br label %114

114:                                              ; preds = %22, %111, %19, %18, %17, %16
  %115 = phi i32 [ 74, %18 ], [ %21, %19 ], [ 11, %17 ], [ 2, %16 ], [ 0, %111 ], [ 34, %22 ]
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %11) #4
  call void @llvm.lifetime.end.p0i8(i64 1344, i8* nonnull %10) #4
  ret i32 %115
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i32 @__lookup_name(%struct.address* noundef, i8* noundef, i8* noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @strcpy(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @strcmp(i8* noundef, i8* noundef) local_unnamed_addr #2

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
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
!9 = !{!10, !8, i64 16}
!10 = !{!"hostent", !4, i64 0, !4, i64 8, !8, i64 16, !8, i64 20, !4, i64 24}
!11 = !{!10, !8, i64 20}
!12 = !{!10, !4, i64 8}
!13 = !{!10, !4, i64 24}
!14 = !{!10, !4, i64 0}
