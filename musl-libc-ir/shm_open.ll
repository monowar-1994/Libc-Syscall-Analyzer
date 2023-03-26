; ModuleID = 'src/mman/shm_open.c'
source_filename = "src/mman/shm_open.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"/dev/shm/\00", align 1

; Function Attrs: nounwind optsize strictfp
define hidden i8* @__shm_mapname(i8* noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  br label %3

3:                                                ; preds = %3, %2
  %4 = phi i8* [ %0, %2 ], [ %7, %3 ]
  %5 = load i8, i8* %4, align 1, !tbaa !3
  %6 = icmp eq i8 %5, 47
  %7 = getelementptr inbounds i8, i8* %4, i64 1
  br i1 %6, label %3, label %8

8:                                                ; preds = %3
  %9 = tail call i8* @__strchrnul(i8* noundef nonnull %4, i32 noundef 47) #4
  %10 = load i8, i8* %9, align 1, !tbaa !3
  %11 = icmp ne i8 %10, 0
  %12 = icmp eq i8* %9, %4
  %13 = or i1 %12, %11
  br i1 %13, label %26, label %14

14:                                               ; preds = %8
  %15 = ptrtoint i8* %9 to i64
  %16 = ptrtoint i8* %4 to i64
  %17 = sub i64 %15, %16
  %18 = icmp slt i64 %17, 3
  br i1 %18, label %19, label %28

19:                                               ; preds = %14
  %20 = load i8, i8* %4, align 1, !tbaa !3
  %21 = icmp eq i8 %20, 46
  br i1 %21, label %22, label %32

22:                                               ; preds = %19
  %23 = getelementptr inbounds i8, i8* %9, i64 -1
  %24 = load i8, i8* %23, align 1, !tbaa !3
  %25 = icmp eq i8 %24, 46
  br i1 %25, label %26, label %32

26:                                               ; preds = %22, %8
  %27 = tail call i32* @___errno_location() #5
  store i32 22, i32* %27, align 4, !tbaa !6
  br label %37

28:                                               ; preds = %14
  %29 = icmp ugt i64 %17, 255
  br i1 %29, label %30, label %32

30:                                               ; preds = %28
  %31 = tail call i32* @___errno_location() #5
  store i32 36, i32* %31, align 4, !tbaa !6
  br label %37

32:                                               ; preds = %19, %22, %28
  %33 = tail call i8* @memcpy(i8* noundef %1, i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i64 noundef 9) #4
  %34 = getelementptr inbounds i8, i8* %1, i64 9
  %35 = add nsw i64 %17, 1
  %36 = tail call i8* @memcpy(i8* noundef nonnull %34, i8* noundef nonnull %4, i64 noundef %35) #4
  br label %37

37:                                               ; preds = %32, %30, %26
  %38 = phi i8* [ null, %26 ], [ null, %30 ], [ %1, %32 ]
  ret i8* %38
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i8* @__strchrnul(i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define i32 @shm_open(i8* noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = alloca i32, align 4
  %5 = alloca [265 x i8], align 16
  %6 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %6) #6
  %7 = getelementptr inbounds [265 x i8], [265 x i8]* %5, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 265, i8* nonnull %7) #6
  %8 = call i8* @__shm_mapname(i8* noundef %0, i8* noundef nonnull %7) #7
  %9 = icmp eq i8* %8, null
  br i1 %9, label %16, label %10

10:                                               ; preds = %3
  %11 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %4) #4
  %12 = or i32 %1, 657408
  %13 = call i32 (i8*, i32, ...) @open(i8* noundef nonnull %8, i32 noundef %12, i32 noundef %2) #4
  %14 = load i32, i32* %4, align 4, !tbaa !6
  %15 = call i32 @pthread_setcancelstate(i32 noundef %14, i32* noundef null) #4
  br label %16

16:                                               ; preds = %3, %10
  %17 = phi i32 [ %13, %10 ], [ -1, %3 ]
  call void @llvm.lifetime.end.p0i8(i64 265, i8* nonnull %7) #6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %6) #6
  ret i32 %17
}

; Function Attrs: optsize
declare i32 @pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @open(i8* noundef, i32 noundef, ...) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define i32 @shm_unlink(i8* noundef %0) local_unnamed_addr #0 {
  %2 = alloca [265 x i8], align 16
  %3 = getelementptr inbounds [265 x i8], [265 x i8]* %2, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 265, i8* nonnull %3) #6
  %4 = call i8* @__shm_mapname(i8* noundef %0, i8* noundef nonnull %3) #7
  %5 = icmp eq i8* %4, null
  br i1 %5, label %8, label %6

6:                                                ; preds = %1
  %7 = call i32 @unlink(i8* noundef nonnull %4) #4
  br label %8

8:                                                ; preds = %1, %6
  %9 = phi i32 [ %7, %6 ], [ -1, %1 ]
  call void @llvm.lifetime.end.p0i8(i64 265, i8* nonnull %3) #6
  ret i32 %9
}

; Function Attrs: optsize
declare i32 @unlink(i8* noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #6 = { nounwind strictfp }
attributes #7 = { nobuiltin optsize strictfp "no-builtins" }

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
