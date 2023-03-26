; ModuleID = 'src/misc/openpty.c'
source_filename = "src/misc/openpty.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.termios = type { i32, i32, i32, i32, i8, [32 x i8], i32, i32 }
%struct.winsize = type { i16, i16, i16, i16 }

@.str = private unnamed_addr constant [10 x i8] c"/dev/ptmx\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"/dev/pts/%d\00", align 1

; Function Attrs: nounwind optsize strictfp
define i32 @openpty(i32* nocapture noundef writeonly %0, i32* nocapture noundef writeonly %1, i8* noundef %2, %struct.termios* noundef %3, %struct.winsize* noundef %4) local_unnamed_addr #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [20 x i8], align 16
  %9 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %9) #3
  store i32 0, i32* %6, align 4, !tbaa !3
  %10 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %10) #3
  %11 = getelementptr inbounds [20 x i8], [20 x i8]* %8, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %11) #3
  %12 = tail call i32 (i8*, i32, ...) @open(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i32 noundef 258) #4
  %13 = icmp slt i32 %12, 0
  br i1 %13, label %43, label %14

14:                                               ; preds = %5
  %15 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %7) #4
  %16 = call i32 (i32, i32, ...) @ioctl(i32 noundef %12, i32 noundef 1074025521, i32* noundef nonnull %6) #4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %37

18:                                               ; preds = %14
  %19 = call i32 (i32, i32, ...) @ioctl(i32 noundef %12, i32 noundef -2147199952, i32* noundef nonnull %6) #4
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %37

21:                                               ; preds = %18
  %22 = icmp eq i8* %2, null
  %23 = select i1 %22, i8* %11, i8* %2
  %24 = load i32, i32* %6, align 4, !tbaa !3
  %25 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef %23, i64 noundef 20, i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 noundef %24) #4
  %26 = call i32 (i8*, i32, ...) @open(i8* noundef %23, i32 noundef 258) #4
  %27 = icmp slt i32 %26, 0
  br i1 %27, label %37, label %28

28:                                               ; preds = %21
  %29 = icmp eq %struct.termios* %3, null
  br i1 %29, label %32, label %30

30:                                               ; preds = %28
  %31 = call i32 @tcsetattr(i32 noundef %26, i32 noundef 0, %struct.termios* noundef nonnull %3) #4
  br label %32

32:                                               ; preds = %30, %28
  %33 = icmp eq %struct.winsize* %4, null
  br i1 %33, label %36, label %34

34:                                               ; preds = %32
  %35 = call i32 (i32, i32, ...) @ioctl(i32 noundef %26, i32 noundef 21524, %struct.winsize* noundef nonnull %4) #4
  br label %36

36:                                               ; preds = %34, %32
  store i32 %12, i32* %0, align 4, !tbaa !3
  store i32 %26, i32* %1, align 4, !tbaa !3
  br label %39

37:                                               ; preds = %21, %14, %18
  %38 = call i32 @close(i32 noundef %12) #4
  br label %39

39:                                               ; preds = %36, %37
  %40 = phi i32 [ 0, %36 ], [ -1, %37 ]
  %41 = load i32, i32* %7, align 4, !tbaa !3
  %42 = call i32 @pthread_setcancelstate(i32 noundef %41, i32* noundef null) #4
  br label %43

43:                                               ; preds = %39, %5
  %44 = phi i32 [ -1, %5 ], [ %40, %39 ]
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %11) #3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %10) #3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %9) #3
  ret i32 %44
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @open(i8* noundef, i32 noundef, ...) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @ioctl(i32 noundef, i32 noundef, ...) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @snprintf(i8* noundef, i64 noundef, i8* noundef, ...) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @tcsetattr(i32 noundef, i32 noundef, %struct.termios* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @close(i32 noundef) local_unnamed_addr #2

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
