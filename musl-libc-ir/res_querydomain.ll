; ModuleID = 'src/network/res_querydomain.c'
source_filename = "src/network/res_querydomain.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @res_querydomain(i8* noundef %0, i8* noundef %1, i32 noundef %2, i32 noundef %3, i8* noundef %4, i32 noundef %5) local_unnamed_addr #0 {
  %7 = alloca [255 x i8], align 16
  %8 = getelementptr inbounds [255 x i8], [255 x i8]* %7, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 255, i8* nonnull %8) #3
  %9 = tail call i64 @strnlen(i8* noundef %0, i64 noundef 255) #4
  %10 = tail call i64 @strnlen(i8* noundef %1, i64 noundef 255) #4
  %11 = add i64 %9, -254
  %12 = add i64 %11, %10
  %13 = icmp ult i64 %12, -255
  br i1 %13, label %21, label %14

14:                                               ; preds = %6
  %15 = call i8* @memcpy(i8* noundef nonnull %8, i8* noundef %0, i64 noundef %9) #4
  %16 = getelementptr inbounds [255 x i8], [255 x i8]* %7, i64 0, i64 %9
  store i8 46, i8* %16, align 1, !tbaa !3
  %17 = getelementptr inbounds i8, i8* %16, i64 1
  %18 = add i64 %10, 1
  %19 = call i8* @memcpy(i8* noundef nonnull %17, i8* noundef %1, i64 noundef %18) #4
  %20 = call i32 @res_query(i8* noundef nonnull %8, i32 noundef %2, i32 noundef %3, i8* noundef %4, i32 noundef %5) #4
  br label %21

21:                                               ; preds = %6, %14
  %22 = phi i32 [ %20, %14 ], [ -1, %6 ]
  call void @llvm.lifetime.end.p0i8(i64 255, i8* nonnull %8) #3
  ret i32 %22
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i64 @strnlen(i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @res_query(i8* noundef, i32 noundef, i32 noundef, i8* noundef, i32 noundef) local_unnamed_addr #2

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
