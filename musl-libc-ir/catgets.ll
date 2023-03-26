; ModuleID = 'src/locale/catgets.c'
source_filename = "src/locale/catgets.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i8* @catgets(i8* noundef %0, i32 noundef %1, i32 noundef %2, i8* noundef readnone %3) local_unnamed_addr #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = getelementptr inbounds i8, i8* %0, i64 4
  %8 = bitcast i8* %7 to i32*
  %9 = load i32, i32* %8, align 4, !tbaa !3
  %10 = tail call i32 @llvm.bswap.i32(i32 %9) #6
  %11 = getelementptr inbounds i8, i8* %0, i64 20
  %12 = getelementptr inbounds i8, i8* %0, i64 12
  %13 = bitcast i8* %12 to i32*
  %14 = load i32, i32* %13, align 4, !tbaa !3
  %15 = getelementptr inbounds i8, i8* %0, i64 16
  %16 = bitcast i8* %15 to i32*
  %17 = load i32, i32* %16, align 4, !tbaa !3
  %18 = tail call i32 @llvm.bswap.i32(i32 %17) #6
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds i8, i8* %11, i64 %19
  %21 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %21) #7
  %22 = tail call i32 @llvm.bswap.i32(i32 %1) #6
  store i32 %22, i32* %5, align 4, !tbaa !3
  %23 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %23) #7
  %24 = tail call i32 @llvm.bswap.i32(i32 %2) #6
  store i32 %24, i32* %6, align 4, !tbaa !3
  %25 = zext i32 %10 to i64
  %26 = call i8* @bsearch(i8* noundef nonnull %21, i8* noundef nonnull %11, i64 noundef %25, i64 noundef 12, i32 (i8*, i8*)* noundef nonnull @cmp) #8
  %27 = icmp eq i8* %26, null
  br i1 %27, label %28, label %30

28:                                               ; preds = %4
  %29 = tail call i32* @___errno_location() #9
  store i32 42, i32* %29, align 4, !tbaa !3
  br label %57

30:                                               ; preds = %4
  %31 = call i32 @llvm.bswap.i32(i32 %14) #6
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i8, i8* %11, i64 %32
  %34 = getelementptr inbounds i8, i8* %26, i64 4
  %35 = bitcast i8* %34 to i32*
  %36 = load i32, i32* %35, align 4, !tbaa !3
  %37 = call i32 @llvm.bswap.i32(i32 %36) #6
  %38 = getelementptr inbounds i8, i8* %26, i64 8
  %39 = bitcast i8* %38 to i32*
  %40 = load i32, i32* %39, align 4, !tbaa !3
  %41 = call i32 @llvm.bswap.i32(i32 %40) #6
  %42 = mul i32 %41, 12
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds i8, i8* %33, i64 %43
  %45 = zext i32 %37 to i64
  %46 = call i8* @bsearch(i8* noundef nonnull %23, i8* noundef nonnull %44, i64 noundef %45, i64 noundef 12, i32 (i8*, i8*)* noundef nonnull @cmp) #8
  %47 = icmp eq i8* %46, null
  br i1 %47, label %48, label %50

48:                                               ; preds = %30
  %49 = tail call i32* @___errno_location() #9
  store i32 42, i32* %49, align 4, !tbaa !3
  br label %57

50:                                               ; preds = %30
  %51 = getelementptr inbounds i8, i8* %46, i64 8
  %52 = bitcast i8* %51 to i32*
  %53 = load i32, i32* %52, align 4, !tbaa !3
  %54 = call i32 @llvm.bswap.i32(i32 %53) #6
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds i8, i8* %20, i64 %55
  br label %57

57:                                               ; preds = %48, %50, %28
  %58 = phi i8* [ %3, %28 ], [ %56, %50 ], [ %3, %48 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %23) #7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %21) #7
  ret i8* %58
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i8* @bsearch(i8* noundef, i8* noundef, i64 noundef, i64 noundef, i32 (i8*, i8*)* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readonly strictfp willreturn
define internal i32 @cmp(i8* nocapture noundef readonly %0, i8* nocapture noundef readonly %1) #3 {
  %3 = bitcast i8* %0 to i32*
  %4 = load i32, i32* %3, align 4, !tbaa !3
  %5 = tail call i32 @llvm.bswap.i32(i32 %4) #6
  %6 = bitcast i8* %1 to i32*
  %7 = load i32, i32* %6, align 4, !tbaa !3
  %8 = tail call i32 @llvm.bswap.i32(i32 %7) #6
  %9 = icmp ult i32 %5, %8
  %10 = icmp ugt i32 %5, %8
  %11 = zext i1 %10 to i32
  %12 = select i1 %9, i32 -1, i32 %11
  ret i32 %12
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.bswap.i32(i32) #5

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readonly strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { nounwind }
attributes #7 = { nounwind strictfp }
attributes #8 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #9 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
