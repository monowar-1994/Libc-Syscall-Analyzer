; ModuleID = 'src/misc/initgroups.c'
source_filename = "src/misc/initgroups.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @initgroups(i8* noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = alloca [32 x i32], align 16
  %4 = alloca i32, align 4
  %5 = bitcast [32 x i32]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %5) #3
  %6 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %6) #3
  store i32 32, i32* %4, align 4, !tbaa !3
  %7 = getelementptr inbounds [32 x i32], [32 x i32]* %3, i64 0, i64 0
  %8 = call i32 @getgrouplist(i8* noundef %0, i32 noundef %1, i32* noundef nonnull %7, i32* noundef nonnull %4) #4
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %14, label %10

10:                                               ; preds = %2
  %11 = load i32, i32* %4, align 4, !tbaa !3
  %12 = sext i32 %11 to i64
  %13 = call i32 @setgroups(i64 noundef %12, i32* noundef nonnull %7) #4
  br label %14

14:                                               ; preds = %2, %10
  %15 = phi i32 [ %13, %10 ], [ -1, %2 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %6) #3
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %5) #3
  ret i32 %15
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @getgrouplist(i8* noundef, i32 noundef, i32* noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @setgroups(i64 noundef, i32* noundef) local_unnamed_addr #2

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
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
