; ModuleID = 'src/misc/lockf.c'
source_filename = "src/misc/lockf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.flock = type { i16, i16, i64, i64, i32 }

@lockf64 = weak alias i32 (i32, i32, i64), i32 (i32, i32, i64)* @lockf

; Function Attrs: nounwind optsize strictfp
define i32 @lockf(i32 noundef %0, i32 noundef %1, i64 noundef %2) #0 {
  %4 = alloca %struct.flock, align 8
  %5 = bitcast %struct.flock* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %5) #4
  %6 = getelementptr inbounds %struct.flock, %struct.flock* %4, i64 0, i32 0
  store i16 1, i16* %6, align 8, !tbaa !3
  %7 = getelementptr inbounds %struct.flock, %struct.flock* %4, i64 0, i32 1
  store i16 1, i16* %7, align 2, !tbaa !10
  %8 = getelementptr inbounds %struct.flock, %struct.flock* %4, i64 0, i32 2
  store i64 0, i64* %8, align 8, !tbaa !11
  %9 = getelementptr inbounds %struct.flock, %struct.flock* %4, i64 0, i32 3
  store i64 %2, i64* %9, align 8, !tbaa !12
  %10 = getelementptr inbounds %struct.flock, %struct.flock* %4, i64 0, i32 4
  store i32 0, i32* %10, align 8, !tbaa !13
  switch i32 %1, label %28 [
    i32 3, label %11
    i32 0, label %23
    i32 2, label %24
    i32 1, label %26
  ]

11:                                               ; preds = %3
  store i16 0, i16* %6, align 8, !tbaa !3
  %12 = call i32 (i32, i32, ...) @fcntl(i32 noundef %0, i32 noundef 5, %struct.flock* noundef nonnull %4) #5
  %13 = icmp slt i32 %12, 0
  br i1 %13, label %30, label %14

14:                                               ; preds = %11
  %15 = load i16, i16* %6, align 8, !tbaa !3
  %16 = icmp eq i16 %15, 2
  br i1 %16, label %30, label %17

17:                                               ; preds = %14
  %18 = load i32, i32* %10, align 8, !tbaa !13
  %19 = call i32 @getpid() #5
  %20 = icmp eq i32 %18, %19
  br i1 %20, label %30, label %21

21:                                               ; preds = %17
  %22 = tail call i32* @___errno_location() #6
  store i32 13, i32* %22, align 4, !tbaa !14
  br label %30

23:                                               ; preds = %3
  store i16 2, i16* %6, align 8, !tbaa !3
  br label %24

24:                                               ; preds = %3, %23
  %25 = call i32 (i32, i32, ...) @fcntl(i32 noundef %0, i32 noundef 6, %struct.flock* noundef nonnull %4) #5
  br label %30

26:                                               ; preds = %3
  %27 = call i32 (i32, i32, ...) @fcntl(i32 noundef %0, i32 noundef 7, %struct.flock* noundef nonnull %4) #5
  br label %30

28:                                               ; preds = %3
  %29 = tail call i32* @___errno_location() #6
  store i32 22, i32* %29, align 4, !tbaa !14
  br label %30

30:                                               ; preds = %14, %17, %11, %28, %26, %24, %21
  %31 = phi i32 [ -1, %28 ], [ %27, %26 ], [ %25, %24 ], [ -1, %21 ], [ -1, %11 ], [ 0, %17 ], [ 0, %14 ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %5) #4
  ret i32 %31
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @fcntl(i32 noundef, i32 noundef, ...) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @getpid() local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

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
!3 = !{!4, !5, i64 0}
!4 = !{!"flock", !5, i64 0, !5, i64 2, !8, i64 8, !8, i64 16, !9, i64 24}
!5 = !{!"short", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"long", !6, i64 0}
!9 = !{!"int", !6, i64 0}
!10 = !{!4, !5, i64 2}
!11 = !{!4, !8, i64 8}
!12 = !{!4, !8, i64 16}
!13 = !{!4, !9, i64 24}
!14 = !{!9, !9, i64 0}
