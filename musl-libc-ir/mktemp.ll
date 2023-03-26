; ModuleID = 'src/temp/mktemp.c'
source_filename = "src/temp/mktemp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

@.str = private unnamed_addr constant [7 x i8] c"XXXXXX\00", align 1

; Function Attrs: nounwind optsize strictfp
define i8* @mktemp(i8* noundef returned %0) local_unnamed_addr #0 {
  %2 = alloca %struct.stat, align 8
  %3 = tail call i64 @strlen(i8* noundef %0) #4
  %4 = bitcast %struct.stat* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %4) #5
  %5 = icmp ult i64 %3, 6
  br i1 %5, label %11, label %6

6:                                                ; preds = %1
  %7 = getelementptr inbounds i8, i8* %0, i64 %3
  %8 = getelementptr inbounds i8, i8* %7, i64 -6
  %9 = tail call i32 @memcmp(i8* noundef nonnull %8, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i64 noundef 6) #4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %13, label %11

11:                                               ; preds = %6, %1
  %12 = tail call i32* @___errno_location() #6
  store i32 22, i32* %12, align 4, !tbaa !3
  store i8 0, i8* %0, align 1, !tbaa !7
  br label %28

13:                                               ; preds = %6, %23
  %14 = phi i32 [ %24, %23 ], [ 100, %6 ]
  %15 = call i8* @__randname(i8* noundef nonnull %8) #4
  %16 = call i32 @stat(i8* noundef %0, %struct.stat* noundef nonnull %2) #4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %23, label %18

18:                                               ; preds = %13
  %19 = tail call i32* @___errno_location() #6
  %20 = load i32, i32* %19, align 4, !tbaa !3
  %21 = icmp eq i32 %20, 2
  br i1 %21, label %28, label %22

22:                                               ; preds = %18
  store i8 0, i8* %0, align 1, !tbaa !7
  br label %28

23:                                               ; preds = %13
  %24 = add nsw i32 %14, -1
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %13

26:                                               ; preds = %23
  store i8 0, i8* %0, align 1, !tbaa !7
  %27 = tail call i32* @___errno_location() #6
  store i32 17, i32* %27, align 4, !tbaa !3
  br label %28

28:                                               ; preds = %18, %22, %26, %11
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %4) #5
  ret i8* %0
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @memcmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare hidden i8* @__randname(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @stat(i8* noundef, %struct.stat* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nounwind strictfp }
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
!7 = !{!5, !5, i64 0}
