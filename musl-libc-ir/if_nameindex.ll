; ModuleID = 'src/network/if_nameindex.c'
source_filename = "src/network/if_nameindex.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.if_nameindex = type { i32, i8* }
%struct.ifnameindexctx = type { i32, i32, i32, %struct.ifnamemap*, [64 x i32] }
%struct.ifnamemap = type { i32, i32, i8, [16 x i8] }
%struct.nlmsghdr = type { i32, i16, i16, i32, i32 }
%struct.rtattr = type { i16, i16 }

; Function Attrs: nounwind optsize strictfp
define %struct.if_nameindex* @if_nameindex() local_unnamed_addr #0 {
  %1 = alloca %struct.ifnameindexctx, align 8
  %2 = alloca i32, align 4
  %3 = bitcast %struct.ifnameindexctx* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 280, i8* nonnull %3) #4
  %4 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #4
  %5 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %2) #5
  %6 = call i8* @memset(i8* noundef nonnull %3, i32 noundef 0, i64 noundef 280) #5
  %7 = call i32 @__rtnetlink_enumerate(i32 noundef 0, i32 noundef 2, i32 (i8*, %struct.nlmsghdr*)* noundef nonnull @netlink_msg_to_nameindex, i8* noundef nonnull %3) #5
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %58, label %9

9:                                                ; preds = %0
  %10 = getelementptr inbounds %struct.ifnameindexctx, %struct.ifnameindexctx* %1, i64 0, i32 0
  %11 = load i32, i32* %10, align 8, !tbaa !3
  %12 = add i32 %11, 1
  %13 = zext i32 %12 to i64
  %14 = shl nuw nsw i64 %13, 4
  %15 = getelementptr inbounds %struct.ifnameindexctx, %struct.ifnameindexctx* %1, i64 0, i32 2
  %16 = load i32, i32* %15, align 8, !tbaa !9
  %17 = zext i32 %16 to i64
  %18 = add nuw nsw i64 %14, %17
  %19 = call i8* @malloc(i64 noundef %18) #5
  %20 = bitcast i8* %19 to %struct.if_nameindex*
  %21 = icmp eq i8* %19, null
  br i1 %21, label %58, label %22

22:                                               ; preds = %9
  %23 = load i32, i32* %10, align 8, !tbaa !3
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %54, label %25

25:                                               ; preds = %22
  %26 = getelementptr inbounds %struct.ifnameindexctx, %struct.ifnameindexctx* %1, i64 0, i32 3
  %27 = load %struct.ifnamemap*, %struct.ifnamemap** %26, align 8, !tbaa !10
  %28 = zext i32 %23 to i64
  %29 = getelementptr inbounds %struct.if_nameindex, %struct.if_nameindex* %20, i64 %28
  %30 = getelementptr inbounds %struct.if_nameindex, %struct.if_nameindex* %29, i64 1
  %31 = bitcast %struct.if_nameindex* %30 to i8*
  br label %32

32:                                               ; preds = %25, %32
  %33 = phi i32 [ %50, %32 ], [ %23, %25 ]
  %34 = phi i8* [ %49, %32 ], [ %31, %25 ]
  %35 = phi %struct.ifnamemap* [ %51, %32 ], [ %27, %25 ]
  %36 = phi %struct.if_nameindex* [ %52, %32 ], [ %20, %25 ]
  %37 = getelementptr inbounds %struct.ifnamemap, %struct.ifnamemap* %35, i64 0, i32 1
  %38 = load i32, i32* %37, align 4, !tbaa !11
  %39 = getelementptr inbounds %struct.if_nameindex, %struct.if_nameindex* %36, i64 0, i32 0
  store i32 %38, i32* %39, align 8, !tbaa !13
  %40 = getelementptr inbounds %struct.if_nameindex, %struct.if_nameindex* %36, i64 0, i32 1
  store i8* %34, i8** %40, align 8, !tbaa !15
  %41 = getelementptr inbounds %struct.ifnamemap, %struct.ifnamemap* %35, i64 0, i32 3, i64 0
  %42 = getelementptr inbounds %struct.ifnamemap, %struct.ifnamemap* %35, i64 0, i32 2
  %43 = load i8, i8* %42, align 4, !tbaa !16
  %44 = zext i8 %43 to i64
  %45 = call i8* @memcpy(i8* noundef nonnull %34, i8* noundef nonnull %41, i64 noundef %44) #5
  %46 = load i8, i8* %42, align 4, !tbaa !16
  %47 = zext i8 %46 to i64
  %48 = getelementptr inbounds i8, i8* %34, i64 %47
  %49 = getelementptr inbounds i8, i8* %48, i64 1
  store i8 0, i8* %48, align 1, !tbaa !17
  %50 = add nsw i32 %33, -1
  %51 = getelementptr inbounds %struct.ifnamemap, %struct.ifnamemap* %35, i64 1
  %52 = getelementptr inbounds %struct.if_nameindex, %struct.if_nameindex* %36, i64 1
  %53 = icmp eq i32 %50, 0
  br i1 %53, label %54, label %32

54:                                               ; preds = %32, %22
  %55 = phi %struct.if_nameindex* [ %20, %22 ], [ %52, %32 ]
  %56 = getelementptr inbounds %struct.if_nameindex, %struct.if_nameindex* %55, i64 0, i32 0
  store i32 0, i32* %56, align 8, !tbaa !13
  %57 = getelementptr inbounds %struct.if_nameindex, %struct.if_nameindex* %55, i64 0, i32 1
  store i8* null, i8** %57, align 8, !tbaa !15
  br label %58

58:                                               ; preds = %9, %0, %54
  %59 = phi %struct.if_nameindex* [ null, %0 ], [ %20, %54 ], [ null, %9 ]
  %60 = load i32, i32* %2, align 4, !tbaa !18
  %61 = call i32 @pthread_setcancelstate(i32 noundef %60, i32* noundef null) #5
  %62 = getelementptr inbounds %struct.ifnameindexctx, %struct.ifnameindexctx* %1, i64 0, i32 3
  %63 = bitcast %struct.ifnamemap** %62 to i8**
  %64 = load i8*, i8** %63, align 8, !tbaa !10
  call void @free(i8* noundef %64) #5
  %65 = tail call i32* @___errno_location() #6
  store i32 105, i32* %65, align 4, !tbaa !18
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #4
  call void @llvm.lifetime.end.p0i8(i64 280, i8* nonnull %3) #4
  ret %struct.if_nameindex* %59
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__rtnetlink_enumerate(i32 noundef, i32 noundef, i32 (i8*, %struct.nlmsghdr*)* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal i32 @netlink_msg_to_nameindex(i8* nocapture noundef %0, %struct.nlmsghdr* noundef %1) #0 {
  %3 = getelementptr inbounds %struct.nlmsghdr, %struct.nlmsghdr* %1, i64 0, i32 1
  %4 = load i16, i16* %3, align 4, !tbaa !19
  %5 = icmp eq i16 %4, 16
  %6 = getelementptr inbounds %struct.nlmsghdr, %struct.nlmsghdr* %1, i64 2
  %7 = bitcast %struct.nlmsghdr* %6 to %struct.rtattr*
  %8 = getelementptr inbounds %struct.nlmsghdr, %struct.nlmsghdr* %1, i64 1, i32 3
  %9 = bitcast i32* %8 to %struct.rtattr*
  %10 = select i1 %5, %struct.rtattr* %7, %struct.rtattr* %9
  %11 = getelementptr inbounds %struct.nlmsghdr, %struct.nlmsghdr* %1, i64 1, i32 1
  %12 = bitcast i16* %11 to i32*
  %13 = load i32, i32* %12, align 4, !tbaa !18
  %14 = bitcast %struct.nlmsghdr* %1 to i8*
  %15 = getelementptr inbounds %struct.nlmsghdr, %struct.nlmsghdr* %1, i64 0, i32 0
  %16 = load i32, i32* %15, align 4, !tbaa !22
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds i8, i8* %14, i64 %17
  %19 = ptrtoint i8* %18 to i64
  %20 = ptrtoint %struct.rtattr* %10 to i64
  %21 = sub i64 %19, %20
  %22 = icmp ugt i64 %21, 3
  br i1 %22, label %23, label %128

23:                                               ; preds = %2, %116
  %24 = phi %struct.rtattr* [ %124, %116 ], [ %10, %2 ]
  %25 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %24, i64 0, i32 1
  %26 = load i16, i16* %25, align 2, !tbaa !23
  %27 = icmp eq i16 %26, 3
  br i1 %27, label %28, label %116

28:                                               ; preds = %23
  %29 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %24, i64 0, i32 0
  %30 = load i16, i16* %29, align 2, !tbaa !25
  %31 = zext i16 %30 to i32
  %32 = add nsw i32 %31, -5
  %33 = icmp ugt i16 %30, 21
  br i1 %33, label %128, label %34

34:                                               ; preds = %28
  %35 = srem i32 %13, 64
  %36 = getelementptr inbounds i8, i8* %0, i64 24
  %37 = bitcast i8* %36 to [64 x i32]*
  %38 = sext i32 %35 to i64
  %39 = getelementptr inbounds [64 x i32], [64 x i32]* %37, i64 0, i64 %38
  %40 = load i32, i32* %39, align 4, !tbaa !18
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %69, label %42

42:                                               ; preds = %34
  %43 = getelementptr inbounds i8, i8* %0, i64 16
  %44 = bitcast i8* %43 to %struct.ifnamemap**
  %45 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %24, i64 1
  %46 = bitcast %struct.rtattr* %45 to i8*
  %47 = sext i32 %32 to i64
  br label %48

48:                                               ; preds = %42, %65
  %49 = phi i32 [ %40, %42 ], [ %67, %65 ]
  %50 = load %struct.ifnamemap*, %struct.ifnamemap** %44, align 8, !tbaa !10
  %51 = add i32 %49, -1
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds %struct.ifnamemap, %struct.ifnamemap* %50, i64 %52, i32 1
  %54 = load i32, i32* %53, align 4, !tbaa !11
  %55 = icmp eq i32 %54, %13
  br i1 %55, label %56, label %65

56:                                               ; preds = %48
  %57 = getelementptr inbounds %struct.ifnamemap, %struct.ifnamemap* %50, i64 %52, i32 2
  %58 = load i8, i8* %57, align 4, !tbaa !16
  %59 = zext i8 %58 to i32
  %60 = icmp eq i32 %32, %59
  br i1 %60, label %61, label %65

61:                                               ; preds = %56
  %62 = getelementptr inbounds %struct.ifnamemap, %struct.ifnamemap* %50, i64 %52, i32 3, i64 0
  %63 = tail call i32 @memcmp(i8* noundef nonnull %62, i8* noundef nonnull %46, i64 noundef %47) #5
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %128, label %65

65:                                               ; preds = %61, %56, %48
  %66 = getelementptr inbounds %struct.ifnamemap, %struct.ifnamemap* %50, i64 %52, i32 0
  %67 = load i32, i32* %66, align 4, !tbaa !18
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %48

69:                                               ; preds = %65, %34
  %70 = bitcast i8* %0 to i32*
  %71 = load i32, i32* %70, align 8, !tbaa !3
  %72 = getelementptr inbounds i8, i8* %0, i64 4
  %73 = bitcast i8* %72 to i32*
  %74 = load i32, i32* %73, align 4, !tbaa !26
  %75 = icmp ult i32 %71, %74
  br i1 %75, label %76, label %80

76:                                               ; preds = %69
  %77 = getelementptr inbounds i8, i8* %0, i64 16
  %78 = bitcast i8* %77 to %struct.ifnamemap**
  %79 = load %struct.ifnamemap*, %struct.ifnamemap** %78, align 8, !tbaa !10
  br label %95

80:                                               ; preds = %69
  %81 = icmp eq i32 %74, 0
  %82 = shl i32 %74, 1
  %83 = or i32 %82, 1
  %84 = select i1 %81, i32 8, i32 %83
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds i8, i8* %0, i64 16
  %87 = bitcast i8* %86 to i8**
  %88 = load i8*, i8** %87, align 8, !tbaa !10
  %89 = mul nuw nsw i64 %85, 28
  %90 = tail call i8* @realloc(i8* noundef %88, i64 noundef %89) #5
  %91 = icmp eq i8* %90, null
  br i1 %91, label %128, label %92

92:                                               ; preds = %80
  store i8* %90, i8** %87, align 8, !tbaa !10
  store i32 %84, i32* %73, align 4, !tbaa !26
  %93 = bitcast i8* %90 to %struct.ifnamemap*
  %94 = load i32, i32* %70, align 8, !tbaa !3
  br label %95

95:                                               ; preds = %76, %92
  %96 = phi i32 [ %71, %76 ], [ %94, %92 ]
  %97 = phi %struct.ifnamemap* [ %79, %76 ], [ %93, %92 ]
  %98 = zext i32 %96 to i64
  %99 = getelementptr inbounds %struct.ifnamemap, %struct.ifnamemap* %97, i64 %98, i32 1
  store i32 %13, i32* %99, align 4, !tbaa !11
  %100 = trunc i32 %32 to i8
  %101 = getelementptr inbounds %struct.ifnamemap, %struct.ifnamemap* %97, i64 %98, i32 2
  store i8 %100, i8* %101, align 4, !tbaa !16
  %102 = getelementptr inbounds %struct.ifnamemap, %struct.ifnamemap* %97, i64 %98, i32 3, i64 0
  %103 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %24, i64 1
  %104 = bitcast %struct.rtattr* %103 to i8*
  %105 = sext i32 %32 to i64
  %106 = tail call i8* @memcpy(i8* noundef nonnull %102, i8* noundef nonnull %104, i64 noundef %105) #5
  %107 = add nsw i32 %31, -4
  %108 = getelementptr inbounds i8, i8* %0, i64 8
  %109 = bitcast i8* %108 to i32*
  %110 = load i32, i32* %109, align 8, !tbaa !9
  %111 = add i32 %107, %110
  store i32 %111, i32* %109, align 8, !tbaa !9
  %112 = load i32, i32* %70, align 8, !tbaa !3
  %113 = add i32 %112, 1
  store i32 %113, i32* %70, align 8, !tbaa !3
  %114 = load i32, i32* %39, align 4, !tbaa !18
  %115 = getelementptr inbounds %struct.ifnamemap, %struct.ifnamemap* %97, i64 %98, i32 0
  store i32 %114, i32* %115, align 4, !tbaa !27
  store i32 %113, i32* %39, align 4, !tbaa !18
  br label %128

116:                                              ; preds = %23
  %117 = bitcast %struct.rtattr* %24 to i8*
  %118 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %24, i64 0, i32 0
  %119 = load i16, i16* %118, align 2, !tbaa !25
  %120 = zext i16 %119 to i64
  %121 = add nuw nsw i64 %120, 3
  %122 = and i64 %121, 131068
  %123 = getelementptr inbounds i8, i8* %117, i64 %122
  %124 = bitcast i8* %123 to %struct.rtattr*
  %125 = ptrtoint i8* %123 to i64
  %126 = sub i64 %19, %125
  %127 = icmp ugt i64 %126, 3
  br i1 %127, label %23, label %128

128:                                              ; preds = %116, %61, %2, %80, %28, %95
  %129 = phi i32 [ 0, %95 ], [ 0, %28 ], [ -1, %80 ], [ 0, %2 ], [ 0, %61 ], [ 0, %116 ]
  ret i32 %129
}

; Function Attrs: optsize
declare i8* @malloc(i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @memcmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @realloc(i8* noundef, i64 noundef) local_unnamed_addr #2

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
!3 = !{!4, !5, i64 0}
!4 = !{!"ifnameindexctx", !5, i64 0, !5, i64 4, !5, i64 8, !8, i64 16, !6, i64 24}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!4, !5, i64 8}
!10 = !{!4, !8, i64 16}
!11 = !{!12, !5, i64 4}
!12 = !{!"ifnamemap", !5, i64 0, !5, i64 4, !6, i64 8, !6, i64 9}
!13 = !{!14, !5, i64 0}
!14 = !{!"if_nameindex", !5, i64 0, !8, i64 8}
!15 = !{!14, !8, i64 8}
!16 = !{!12, !6, i64 8}
!17 = !{!6, !6, i64 0}
!18 = !{!5, !5, i64 0}
!19 = !{!20, !21, i64 4}
!20 = !{!"nlmsghdr", !5, i64 0, !21, i64 4, !21, i64 6, !5, i64 8, !5, i64 12}
!21 = !{!"short", !6, i64 0}
!22 = !{!20, !5, i64 0}
!23 = !{!24, !21, i64 2}
!24 = !{!"rtattr", !21, i64 0, !21, i64 2}
!25 = !{!24, !21, i64 0}
!26 = !{!4, !5, i64 4}
!27 = !{!12, !5, i64 0}
