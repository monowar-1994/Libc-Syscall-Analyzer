; ModuleID = 'src/network/lookup_ipliteral.c'
source_filename = "src/network/lookup_ipliteral.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.address = type { i32, i32, [16 x i8], i32 }
%struct.in_addr = type { i32 }
%struct.in6_addr = type { %union.anon }
%union.anon = type { [4 x i32] }

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__lookup_ipliteral(%struct.address* noundef align 4 dereferenceable(28) %0, i8* noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = alloca %struct.in_addr, align 4
  %5 = alloca %struct.in6_addr, align 4
  %6 = alloca [64 x i8], align 16
  %7 = alloca i8*, align 8
  %8 = bitcast %struct.in_addr* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %8) #3
  %9 = bitcast %struct.in6_addr* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %9) #3
  %10 = call i32 @__inet_aton(i8* noundef %1, %struct.in_addr* noundef nonnull %4) #4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %19

12:                                               ; preds = %3
  %13 = icmp eq i32 %2, 10
  br i1 %13, label %80, label %14

14:                                               ; preds = %12
  %15 = getelementptr inbounds %struct.address, %struct.address* %0, i64 0, i32 2, i64 0
  %16 = call i8* @memcpy(i8* noundef nonnull %15, i8* noundef nonnull %8, i64 noundef 4) #4
  %17 = getelementptr inbounds %struct.address, %struct.address* %0, i64 0, i32 0
  store i32 2, i32* %17, align 4, !tbaa !3
  %18 = getelementptr inbounds %struct.address, %struct.address* %0, i64 0, i32 1
  store i32 0, i32* %18, align 4, !tbaa !8
  br label %80

19:                                               ; preds = %3
  %20 = getelementptr inbounds [64 x i8], [64 x i8]* %6, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %20) #3
  %21 = call i8* @strchr(i8* noundef %1, i32 noundef 37) #4
  %22 = bitcast i8** %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %22) #3
  %23 = icmp eq i8* %21, null
  br i1 %23, label %32, label %24

24:                                               ; preds = %19
  %25 = ptrtoint i8* %21 to i64
  %26 = ptrtoint i8* %1 to i64
  %27 = sub i64 %25, %26
  %28 = icmp slt i64 %27, 64
  br i1 %28, label %29, label %32

29:                                               ; preds = %24
  %30 = call i8* @memcpy(i8* noundef nonnull %20, i8* noundef %1, i64 noundef %27) #4
  %31 = getelementptr inbounds [64 x i8], [64 x i8]* %6, i64 0, i64 %27
  store i8 0, i8* %31, align 1, !tbaa !9
  br label %32

32:                                               ; preds = %29, %24, %19
  %33 = phi i8* [ %20, %29 ], [ %1, %24 ], [ %1, %19 ]
  %34 = call i32 @inet_pton(i32 noundef 10, i8* noundef %33, i8* noundef nonnull %9) #4
  %35 = icmp slt i32 %34, 1
  br i1 %35, label %78, label %36

36:                                               ; preds = %32
  %37 = icmp eq i32 %2, 2
  br i1 %37, label %78, label %38

38:                                               ; preds = %36
  %39 = getelementptr inbounds %struct.address, %struct.address* %0, i64 0, i32 2, i64 0
  %40 = call i8* @memcpy(i8* noundef nonnull %39, i8* noundef nonnull %9, i64 noundef 16) #4
  %41 = getelementptr inbounds %struct.address, %struct.address* %0, i64 0, i32 0
  store i32 10, i32* %41, align 4, !tbaa !3
  br i1 %23, label %74, label %42

42:                                               ; preds = %38
  %43 = getelementptr inbounds i8, i8* %21, i64 1
  %44 = load i8, i8* %43, align 1, !tbaa !9
  %45 = sext i8 %44 to i32
  %46 = add nsw i32 %45, -48
  %47 = icmp ult i32 %46, 10
  br i1 %47, label %48, label %53

48:                                               ; preds = %42
  %49 = call i64 @strtoull(i8* noundef nonnull %43, i8** noundef nonnull %7, i32 noundef 10) #4
  %50 = load i8*, i8** %7, align 8, !tbaa !10
  %51 = load i8, i8* %50, align 1, !tbaa !9
  %52 = icmp eq i8 %51, 0
  br i1 %52, label %72, label %56

53:                                               ; preds = %42
  store i8* %21, i8** %7, align 8, !tbaa !10
  %54 = load i8, i8* %21, align 1, !tbaa !9
  %55 = icmp eq i8 %54, 0
  br i1 %55, label %74, label %56

56:                                               ; preds = %53, %48
  %57 = load i8, i8* %9, align 4, !tbaa !9
  switch i8 %57, label %78 [
    i8 -2, label %58
    i8 -1, label %63
  ]

58:                                               ; preds = %56
  %59 = getelementptr inbounds i8, i8* %9, i64 1
  %60 = load i8, i8* %59, align 1, !tbaa !9
  %61 = and i8 %60, -64
  %62 = icmp eq i8 %61, -128
  br i1 %62, label %68, label %78

63:                                               ; preds = %56
  %64 = getelementptr inbounds i8, i8* %9, i64 1
  %65 = load i8, i8* %64, align 1, !tbaa !9
  %66 = and i8 %65, 15
  %67 = icmp eq i8 %66, 2
  br i1 %67, label %68, label %78

68:                                               ; preds = %63, %58
  %69 = call i32 @if_nametoindex(i8* noundef nonnull %43) #4
  %70 = zext i32 %69 to i64
  %71 = icmp eq i32 %69, 0
  br i1 %71, label %78, label %74

72:                                               ; preds = %48
  %73 = icmp ugt i64 %49, 4294967295
  br i1 %73, label %78, label %74

74:                                               ; preds = %53, %68, %72, %38
  %75 = phi i64 [ %49, %72 ], [ 0, %38 ], [ %70, %68 ], [ 0, %53 ]
  %76 = trunc i64 %75 to i32
  %77 = getelementptr inbounds %struct.address, %struct.address* %0, i64 0, i32 1
  store i32 %76, i32* %77, align 4, !tbaa !8
  br label %78

78:                                               ; preds = %56, %58, %72, %68, %63, %36, %32, %74
  %79 = phi i32 [ 1, %74 ], [ 0, %32 ], [ -2, %36 ], [ -2, %63 ], [ -2, %68 ], [ -2, %72 ], [ -2, %58 ], [ -2, %56 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %22) #3
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %20) #3
  br label %80

80:                                               ; preds = %12, %78, %14
  %81 = phi i32 [ 1, %14 ], [ %79, %78 ], [ -2, %12 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %9) #3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %8) #3
  ret i32 %81
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i32 @__inet_aton(i8* noundef, %struct.in_addr* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @strchr(i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @inet_pton(i32 noundef, i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @strtoull(i8* noundef, i8** noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @if_nametoindex(i8* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"address", !5, i64 0, !5, i64 4, !6, i64 8, !5, i64 24}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!4, !5, i64 4}
!9 = !{!6, !6, i64 0}
!10 = !{!11, !11, i64 0}
!11 = !{!"any pointer", !6, i64 0}
