; ModuleID = 'src/dirent/fdopendir.c'
source_filename = "src/dirent/fdopendir.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__dirstream = type { i64, i32, i32, i32, [1 x i32], [2048 x i8] }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

; Function Attrs: nounwind optsize strictfp
define %struct.__dirstream* @fdopendir(i32 noundef %0) local_unnamed_addr #0 {
  %2 = alloca %struct.stat, align 8
  %3 = bitcast %struct.stat* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %3) #4
  %4 = call i32 @fstat(i32 noundef %0, %struct.stat* noundef nonnull %2) #5
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %27, label %6

6:                                                ; preds = %1
  %7 = call i32 (i32, i32, ...) @fcntl(i32 noundef %0, i32 noundef 3) #5
  %8 = and i32 %7, 2097152
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %12, label %10

10:                                               ; preds = %6
  %11 = tail call i32* @___errno_location() #6
  store i32 9, i32* %11, align 4, !tbaa !3
  br label %27

12:                                               ; preds = %6
  %13 = getelementptr inbounds %struct.stat, %struct.stat* %2, i64 0, i32 3
  %14 = load i32, i32* %13, align 8, !tbaa !7
  %15 = and i32 %14, 61440
  %16 = icmp eq i32 %15, 16384
  br i1 %16, label %19, label %17

17:                                               ; preds = %12
  %18 = tail call i32* @___errno_location() #6
  store i32 20, i32* %18, align 4, !tbaa !3
  br label %27

19:                                               ; preds = %12
  %20 = call i8* @calloc(i64 noundef 1, i64 noundef 2072) #5
  %21 = icmp eq i8* %20, null
  br i1 %21, label %27, label %22

22:                                               ; preds = %19
  %23 = bitcast i8* %20 to %struct.__dirstream*
  %24 = call i32 (i32, i32, ...) @fcntl(i32 noundef %0, i32 noundef 2, i32 noundef 1) #5
  %25 = getelementptr inbounds i8, i8* %20, i64 8
  %26 = bitcast i8* %25 to i32*
  store i32 %0, i32* %26, align 8, !tbaa !11
  br label %27

27:                                               ; preds = %19, %1, %22, %17, %10
  %28 = phi %struct.__dirstream* [ null, %10 ], [ %23, %22 ], [ null, %17 ], [ null, %1 ], [ null, %19 ]
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %3) #4
  ret %struct.__dirstream* %28
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @fstat(i32 noundef, %struct.stat* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @fcntl(i32 noundef, i32 noundef, ...) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

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
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !4, i64 24}
!8 = !{!"stat", !9, i64 0, !9, i64 8, !9, i64 16, !4, i64 24, !4, i64 28, !4, i64 32, !4, i64 36, !9, i64 40, !9, i64 48, !9, i64 56, !9, i64 64, !10, i64 72, !10, i64 88, !10, i64 104, !5, i64 120}
!9 = !{!"long", !5, i64 0}
!10 = !{!"timespec", !9, i64 0, !9, i64 8}
!11 = !{!12, !4, i64 8}
!12 = !{!"__dirstream", !9, i64 0, !4, i64 8, !4, i64 12, !4, i64 16, !5, i64 20, !5, i64 24}
