; ModuleID = 'src/network/res_query.c'
source_filename = "src/network/res_query.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@res_search = weak alias i32 (i8*, i32, i32, i8*, i32), i32 (i8*, i32, i32, i8*, i32)* @res_query

; Function Attrs: nounwind optsize strictfp
define i32 @res_query(i8* noundef %0, i32 noundef %1, i32 noundef %2, i8* noundef %3, i32 noundef %4) #0 {
  %6 = alloca [280 x i8], align 16
  %7 = getelementptr inbounds [280 x i8], [280 x i8]* %6, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 280, i8* nonnull %7) #4
  %8 = call i32 @__res_mkquery(i32 noundef 0, i8* noundef %0, i32 noundef %1, i32 noundef %2, i8* noundef null, i32 noundef 0, i8* noundef null, i8* noundef nonnull %7, i32 noundef 280) #5
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %28, label %10

10:                                               ; preds = %5
  %11 = call i32 @__res_send(i8* noundef nonnull %7, i32 noundef %8, i8* noundef %3, i32 noundef %4) #5
  %12 = icmp slt i32 %11, 12
  br i1 %12, label %25, label %13

13:                                               ; preds = %10
  %14 = getelementptr inbounds i8, i8* %3, i64 3
  %15 = load i8, i8* %14, align 1, !tbaa !3
  %16 = and i8 %15, 15
  switch i8 %16, label %28 [
    i8 3, label %25
    i8 0, label %17
  ]

17:                                               ; preds = %13
  %18 = getelementptr inbounds i8, i8* %3, i64 6
  %19 = load i8, i8* %18, align 1, !tbaa !3
  %20 = icmp eq i8 %19, 0
  br i1 %20, label %21, label %28

21:                                               ; preds = %17
  %22 = getelementptr inbounds i8, i8* %3, i64 7
  %23 = load i8, i8* %22, align 1, !tbaa !3
  %24 = icmp eq i8 %23, 0
  br i1 %24, label %25, label %28

25:                                               ; preds = %21, %13, %10
  %26 = phi i32 [ 2, %10 ], [ 1, %13 ], [ 4, %21 ]
  %27 = tail call i32* @__h_errno_location() #6
  store i32 %26, i32* %27, align 4, !tbaa !6
  br label %28

28:                                               ; preds = %25, %13, %21, %17, %5
  %29 = phi i32 [ %8, %5 ], [ %11, %13 ], [ %11, %21 ], [ %11, %17 ], [ -1, %25 ]
  call void @llvm.lifetime.end.p0i8(i64 280, i8* nonnull %7) #4
  ret i32 %29
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i32 @__res_mkquery(i32 noundef, i8* noundef, i32 noundef, i32 noundef, i8* noundef, i32 noundef, i8* noundef, i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__res_send(i8* noundef, i32 noundef, i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare i32* @__h_errno_location() local_unnamed_addr #3

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
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
