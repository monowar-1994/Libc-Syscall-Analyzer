; ModuleID = 'src/network/inet_aton.c'
source_filename = "src/network/inet_aton.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.in_addr = type { i32 }

@inet_aton = weak alias i32 (i8*, %struct.in_addr*), i32 (i8*, %struct.in_addr*)* @__inet_aton

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__inet_aton(i8* noundef %0, %struct.in_addr* nocapture noundef writeonly %1) #0 {
  %3 = alloca [4 x i64], align 16
  %4 = alloca i8*, align 8
  %5 = bitcast %struct.in_addr* %1 to i8*
  %6 = bitcast [4 x i64]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %6) #4
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(32) %6, i8 0, i64 32, i1 false) #5
  %7 = bitcast i8** %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %7) #4
  br label %8

8:                                                ; preds = %2, %24
  %9 = phi i64 [ 0, %2 ], [ %26, %24 ]
  %10 = phi i8* [ %0, %2 ], [ %25, %24 ]
  %11 = call i64 @strtoul(i8* noundef %10, i8** noundef nonnull %4, i32 noundef 0) #6
  %12 = getelementptr inbounds [4 x i64], [4 x i64]* %3, i64 0, i64 %9
  store i64 %11, i64* %12, align 8, !tbaa !3
  %13 = load i8*, i8** %4, align 8, !tbaa !7
  %14 = icmp eq i8* %13, %10
  br i1 %14, label %63, label %15

15:                                               ; preds = %8
  %16 = load i8, i8* %13, align 1, !tbaa !9
  switch i8 %16, label %63 [
    i8 0, label %17
    i8 46, label %17
  ]

17:                                               ; preds = %15, %15
  %18 = load i8, i8* %10, align 1, !tbaa !9
  %19 = sext i8 %18 to i32
  %20 = add nsw i32 %19, -48
  %21 = icmp ult i32 %20, 10
  br i1 %21, label %22, label %63

22:                                               ; preds = %17
  %23 = icmp eq i8 %16, 0
  br i1 %23, label %28, label %24

24:                                               ; preds = %22
  %25 = getelementptr inbounds i8, i8* %13, i64 1
  %26 = add nuw nsw i64 %9, 1
  %27 = icmp eq i64 %26, 4
  br i1 %27, label %63, label %8

28:                                               ; preds = %22
  %29 = trunc i64 %9 to i32
  switch i32 %29, label %52 [
    i32 4, label %63
    i32 0, label %36
    i32 1, label %33
    i32 2, label %30
  ]

30:                                               ; preds = %28
  %31 = getelementptr inbounds [4 x i64], [4 x i64]* %3, i64 0, i64 2
  %32 = load i64, i64* %31, align 16, !tbaa !3
  br label %46

33:                                               ; preds = %28
  %34 = getelementptr inbounds [4 x i64], [4 x i64]* %3, i64 0, i64 1
  %35 = load i64, i64* %34, align 8, !tbaa !3
  br label %41

36:                                               ; preds = %28
  %37 = getelementptr inbounds [4 x i64], [4 x i64]* %3, i64 0, i64 0
  %38 = load i64, i64* %37, align 16, !tbaa !3
  %39 = and i64 %38, 16777215
  %40 = lshr i64 %38, 24
  store i64 %40, i64* %37, align 16, !tbaa !3
  br label %41

41:                                               ; preds = %33, %36
  %42 = phi i64 [ %35, %33 ], [ %39, %36 ]
  %43 = getelementptr inbounds [4 x i64], [4 x i64]* %3, i64 0, i64 1
  %44 = and i64 %42, 65535
  %45 = lshr i64 %42, 16
  store i64 %45, i64* %43, align 8, !tbaa !3
  br label %46

46:                                               ; preds = %30, %41
  %47 = phi i64 [ %32, %30 ], [ %44, %41 ]
  %48 = getelementptr inbounds [4 x i64], [4 x i64]* %3, i64 0, i64 2
  %49 = and i64 %47, 255
  %50 = getelementptr inbounds [4 x i64], [4 x i64]* %3, i64 0, i64 3
  store i64 %49, i64* %50, align 8, !tbaa !3
  %51 = lshr i64 %47, 8
  store i64 %51, i64* %48, align 16, !tbaa !3
  br label %52

52:                                               ; preds = %28, %46
  br label %53

53:                                               ; preds = %52, %58
  %54 = phi i64 [ %61, %58 ], [ 0, %52 ]
  %55 = getelementptr inbounds [4 x i64], [4 x i64]* %3, i64 0, i64 %54
  %56 = load i64, i64* %55, align 8, !tbaa !3
  %57 = icmp ugt i64 %56, 255
  br i1 %57, label %63, label %58

58:                                               ; preds = %53
  %59 = trunc i64 %56 to i8
  %60 = getelementptr inbounds i8, i8* %5, i64 %54
  store i8 %59, i8* %60, align 1, !tbaa !9
  %61 = add nuw nsw i64 %54, 1
  %62 = icmp eq i64 %61, 4
  br i1 %62, label %63, label %53

63:                                               ; preds = %24, %8, %17, %15, %58, %53, %28
  %64 = phi i32 [ 0, %28 ], [ 1, %58 ], [ 0, %53 ], [ 0, %15 ], [ 0, %17 ], [ 0, %8 ], [ 0, %24 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %7) #4
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %6) #4
  ret i32 %64
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: optsize
declare i64 @strtoul(i8* noundef, i8** noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"long", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"any pointer", !5, i64 0}
!9 = !{!5, !5, i64 0}
