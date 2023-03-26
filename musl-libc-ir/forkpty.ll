; ModuleID = 'src/misc/forkpty.c'
source_filename = "src/misc/forkpty.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.termios = type { i32, i32, i32, i32, i8, [32 x i8], i32, i32 }
%struct.winsize = type { i16, i16, i16, i16 }
%struct.__sigset_t = type { [16 x i64] }

; Function Attrs: nounwind optsize strictfp
define i32 @forkpty(i32* nocapture noundef writeonly %0, i8* noundef %1, %struct.termios* noundef %2, %struct.winsize* noundef %3) local_unnamed_addr #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [2 x i32], align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.__sigset_t, align 8
  %11 = alloca %struct.__sigset_t, align 8
  %12 = alloca i32, align 4
  %13 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %13) #5
  %14 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %14) #5
  %15 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %15) #5
  store i32 0, i32* %7, align 4, !tbaa !3
  %16 = bitcast [2 x i32]* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %16) #5
  %17 = bitcast i32* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %17) #5
  %18 = bitcast %struct.__sigset_t* %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %18) #5
  %19 = bitcast %struct.__sigset_t* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %19) #5
  %20 = call i32 @openpty(i32* noundef nonnull %5, i32* noundef nonnull %6, i8* noundef %1, %struct.termios* noundef %2, %struct.winsize* noundef %3) #6
  %21 = icmp slt i32 %20, 0
  br i1 %21, label %83, label %22

22:                                               ; preds = %4
  %23 = call i32 @sigfillset(%struct.__sigset_t* noundef nonnull %10) #6
  %24 = call i32 @pthread_sigmask(i32 noundef 0, %struct.__sigset_t* noundef nonnull %10, %struct.__sigset_t* noundef nonnull %11) #6
  %25 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %9) #6
  %26 = getelementptr inbounds [2 x i32], [2 x i32]* %8, i64 0, i64 0
  %27 = call i32 @pipe2(i32* noundef nonnull %26, i32 noundef 524288) #6
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %31, label %29

29:                                               ; preds = %22
  %30 = load i32, i32* %6, align 4, !tbaa !3
  br label %71

31:                                               ; preds = %22
  %32 = call i32 @fork() #6
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %50

34:                                               ; preds = %31
  %35 = load i32, i32* %5, align 4, !tbaa !3
  %36 = call i32 @close(i32 noundef %35) #6
  %37 = load i32, i32* %26, align 4, !tbaa !3
  %38 = call i32 @close(i32 noundef %37) #6
  %39 = load i32, i32* %6, align 4, !tbaa !3
  %40 = call i32 @login_tty(i32 noundef %39) #6
  %41 = icmp eq i32 %40, 0
  %42 = getelementptr inbounds [2 x i32], [2 x i32]* %8, i64 0, i64 1
  %43 = load i32, i32* %42, align 4, !tbaa !3
  br i1 %41, label %48, label %44

44:                                               ; preds = %34
  %45 = tail call i32* @___errno_location() #7
  %46 = bitcast i32* %45 to i8*
  %47 = call i64 @write(i32 noundef %43, i8* noundef %46, i64 noundef 4) #6
  call void @_exit(i32 noundef 127) #8
  unreachable

48:                                               ; preds = %34
  %49 = call i32 @close(i32 noundef %43) #6
  br label %78

50:                                               ; preds = %31
  %51 = load i32, i32* %6, align 4, !tbaa !3
  %52 = call i32 @close(i32 noundef %51) #6
  %53 = getelementptr inbounds [2 x i32], [2 x i32]* %8, i64 0, i64 1
  %54 = load i32, i32* %53, align 4, !tbaa !3
  %55 = call i32 @close(i32 noundef %54) #6
  %56 = load i32, i32* %26, align 4, !tbaa !3
  %57 = call i64 @read(i32 noundef %56, i8* noundef nonnull %15, i64 noundef 4) #6
  %58 = icmp sgt i64 %57, 0
  br i1 %58, label %59, label %65

59:                                               ; preds = %50
  %60 = bitcast i32* %12 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %60) #5
  %61 = call i32 @waitpid(i32 noundef %32, i32* noundef nonnull %12, i32 noundef 0) #6
  %62 = load i32, i32* %7, align 4, !tbaa !3
  %63 = tail call i32* @___errno_location() #7
  store i32 %62, i32* %63, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %60) #5
  %64 = load i32, i32* %26, align 4, !tbaa !3
  br label %71

65:                                               ; preds = %50
  %66 = load i32, i32* %26, align 4, !tbaa !3
  %67 = call i32 @close(i32 noundef %66) #6
  %68 = icmp sgt i32 %32, 0
  br i1 %68, label %69, label %74

69:                                               ; preds = %65
  %70 = load i32, i32* %5, align 4, !tbaa !3
  store i32 %70, i32* %0, align 4, !tbaa !3
  br label %78

71:                                               ; preds = %29, %59
  %72 = phi i32 [ %64, %59 ], [ %30, %29 ]
  %73 = call i32 @close(i32 noundef %72) #6
  br label %74

74:                                               ; preds = %71, %65
  %75 = phi i32 [ %32, %65 ], [ -1, %71 ]
  %76 = load i32, i32* %5, align 4, !tbaa !3
  %77 = call i32 @close(i32 noundef %76) #6
  br label %78

78:                                               ; preds = %69, %74, %48
  %79 = phi i32 [ 0, %48 ], [ %75, %74 ], [ %32, %69 ]
  %80 = load i32, i32* %9, align 4, !tbaa !3
  %81 = call i32 @pthread_setcancelstate(i32 noundef %80, i32* noundef null) #6
  %82 = call i32 @pthread_sigmask(i32 noundef 2, %struct.__sigset_t* noundef nonnull %11, %struct.__sigset_t* noundef null) #6
  br label %83

83:                                               ; preds = %78, %4
  %84 = phi i32 [ -1, %4 ], [ %79, %78 ]
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %19) #5
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %18) #5
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %17) #5
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %16) #5
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %15) #5
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %14) #5
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %13) #5
  ret i32 %84
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @openpty(i32* noundef, i32* noundef, i8* noundef, %struct.termios* noundef, %struct.winsize* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @sigfillset(%struct.__sigset_t* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @pthread_sigmask(i32 noundef, %struct.__sigset_t* noundef, %struct.__sigset_t* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @pipe2(i32* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @close(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @fork() local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @login_tty(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @write(i32 noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: noreturn optsize
declare void @_exit(i32 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i64 @read(i32 noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @waitpid(i32 noundef, i32* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #7 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #8 = { nobuiltin noreturn nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
