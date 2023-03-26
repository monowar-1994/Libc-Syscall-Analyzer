; ModuleID = 'src/network/res_mkquery.c'
source_filename = "src/network/res_mkquery.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timespec = type { i64, i64 }

@res_mkquery = weak alias i32 (i32, i8*, i32, i32, i8*, i32, i8*, i8*, i32), i32 (i32, i8*, i32, i32, i8*, i32, i8*, i8*, i32)* @__res_mkquery

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__res_mkquery(i32 noundef %0, i8* noundef %1, i32 noundef %2, i32 noundef %3, i8* nocapture readnone %4, i32 %5, i8* nocapture readnone %6, i8* noundef %7, i32 noundef %8) #0 {
  %10 = alloca [280 x i8], align 16
  %11 = alloca %struct.timespec, align 8
  %12 = getelementptr inbounds [280 x i8], [280 x i8]* %10, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 280, i8* nonnull %12) #3
  %13 = bitcast %struct.timespec* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %13) #3
  %14 = tail call i64 @strnlen(i8* noundef %1, i64 noundef 255) #4
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %28, label %16

16:                                               ; preds = %9
  %17 = add i64 %14, -1
  %18 = getelementptr inbounds i8, i8* %1, i64 %17
  %19 = load i8, i8* %18, align 1, !tbaa !3
  %20 = icmp eq i8 %19, 46
  %21 = select i1 %20, i64 %17, i64 %14
  %22 = add i64 %21, 17
  %23 = icmp ne i64 %21, 0
  %24 = zext i1 %23 to i64
  %25 = add i64 %22, %24
  %26 = trunc i64 %25 to i32
  %27 = icmp ugt i64 %21, 253
  br i1 %27, label %96, label %28

28:                                               ; preds = %9, %16
  %29 = phi i32 [ %26, %16 ], [ 17, %9 ]
  %30 = phi i64 [ %25, %16 ], [ 17, %9 ]
  %31 = phi i64 [ %21, %16 ], [ 0, %9 ]
  %32 = icmp sgt i32 %29, %8
  %33 = icmp ugt i32 %0, 15
  %34 = or i1 %33, %32
  %35 = or i32 %3, %2
  %36 = icmp ugt i32 %35, 255
  %37 = or i1 %36, %34
  br i1 %37, label %96, label %38

38:                                               ; preds = %28
  %39 = shl i64 %30, 32
  %40 = ashr exact i64 %39, 32
  %41 = call i8* @memset(i8* noundef nonnull %12, i32 noundef 0, i64 noundef %40) #4
  %42 = trunc i32 %0 to i8
  %43 = shl nuw nsw i8 %42, 3
  %44 = or i8 %43, 1
  %45 = getelementptr inbounds [280 x i8], [280 x i8]* %10, i64 0, i64 2
  store i8 %44, i8* %45, align 2, !tbaa !3
  %46 = getelementptr inbounds [280 x i8], [280 x i8]* %10, i64 0, i64 3
  store i8 32, i8* %46, align 1, !tbaa !3
  %47 = getelementptr inbounds [280 x i8], [280 x i8]* %10, i64 0, i64 5
  store i8 1, i8* %47, align 1, !tbaa !3
  %48 = getelementptr inbounds [280 x i8], [280 x i8]* %10, i64 0, i64 13
  %49 = call i8* @memcpy(i8* noundef nonnull %48, i8* noundef %1, i64 noundef %31) #4
  %50 = load i8, i8* %48, align 1, !tbaa !3
  %51 = icmp eq i8 %50, 0
  br i1 %51, label %76, label %52

52:                                               ; preds = %38, %66
  %53 = phi i32 [ %71, %66 ], [ 13, %38 ]
  %54 = sext i32 %53 to i64
  br label %55

55:                                               ; preds = %52, %59
  %56 = phi i64 [ %54, %52 ], [ %60, %59 ]
  %57 = getelementptr inbounds [280 x i8], [280 x i8]* %10, i64 0, i64 %56
  %58 = load i8, i8* %57, align 1, !tbaa !3
  switch i8 %58, label %59 [
    i8 0, label %61
    i8 46, label %61
  ]

59:                                               ; preds = %55
  %60 = add i64 %56, 1
  br label %55

61:                                               ; preds = %55, %55
  %62 = trunc i64 %56 to i32
  %63 = sub nsw i32 %62, %53
  %64 = add i32 %63, -64
  %65 = icmp ult i32 %64, -63
  br i1 %65, label %96, label %66

66:                                               ; preds = %61
  %67 = trunc i32 %63 to i8
  %68 = add nsw i32 %53, -1
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [280 x i8], [280 x i8]* %10, i64 0, i64 %69
  store i8 %67, i8* %70, align 1, !tbaa !3
  %71 = add nsw i32 %62, 1
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [280 x i8], [280 x i8]* %10, i64 0, i64 %72
  %74 = load i8, i8* %73, align 1, !tbaa !3
  %75 = icmp eq i8 %74, 0
  br i1 %75, label %76, label %52

76:                                               ; preds = %66, %38
  %77 = phi i32 [ 13, %38 ], [ %71, %66 ]
  %78 = trunc i32 %3 to i8
  %79 = add nsw i32 %77, 1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [280 x i8], [280 x i8]* %10, i64 0, i64 %80
  store i8 %78, i8* %81, align 1, !tbaa !3
  %82 = trunc i32 %2 to i8
  %83 = add nsw i32 %77, 3
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [280 x i8], [280 x i8]* %10, i64 0, i64 %84
  store i8 %82, i8* %85, align 1, !tbaa !3
  %86 = call i32 @clock_gettime(i32 noundef 0, %struct.timespec* noundef nonnull %11) #4
  %87 = getelementptr inbounds %struct.timespec, %struct.timespec* %11, i64 0, i32 1
  %88 = load i64, i64* %87, align 8, !tbaa !6
  %89 = lshr i64 %88, 16
  %90 = add i64 %89, %88
  %91 = trunc i64 %90 to i8
  %92 = lshr i64 %90, 8
  %93 = trunc i64 %92 to i8
  store i8 %93, i8* %12, align 16, !tbaa !3
  %94 = getelementptr inbounds [280 x i8], [280 x i8]* %10, i64 0, i64 1
  store i8 %91, i8* %94, align 1, !tbaa !3
  %95 = call i8* @memcpy(i8* noundef %7, i8* noundef nonnull %12, i64 noundef %40) #4
  br label %96

96:                                               ; preds = %61, %16, %28, %76
  %97 = phi i32 [ %29, %76 ], [ -1, %28 ], [ -1, %16 ], [ -1, %61 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %13) #3
  call void @llvm.lifetime.end.p0i8(i64 280, i8* nonnull %12) #3
  ret i32 %97
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i64 @strnlen(i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @clock_gettime(i32 noundef, %struct.timespec* noundef) local_unnamed_addr #2

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
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !8, i64 8}
!7 = !{!"timespec", !8, i64 0, !8, i64 8}
!8 = !{!"long", !4, i64 0}
