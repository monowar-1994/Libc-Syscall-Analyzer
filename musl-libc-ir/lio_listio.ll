; ModuleID = 'src/aio/lio_listio.c'
source_filename = "src/aio/lio_listio.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.aiocb = type { i32, i32, i32, i8*, i64, %struct.sigevent, i8*, [2 x i32], i32, i64, i64, i8*, i8*, [16 x i8] }
%struct.sigevent = type { %union.sigval, i32, i32, %union.anon }
%union.sigval = type { i8* }
%union.anon = type { %struct.anon, [32 x i8] }
%struct.anon = type { void (i8*)*, %struct.pthread_attr_t* }
%struct.pthread_attr_t = type { %union.anon.0 }
%union.anon.0 = type { [7 x i64] }
%struct.__sigset_t = type { [16 x i64] }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon.1, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon.1 = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.lio_state = type { %struct.sigevent*, i32, [0 x %struct.aiocb*] }
%struct.timespec = type { i64, i64 }
%struct.siginfo_t = type { i32, i32, i32, %union.anon.2 }
%union.anon.2 = type { %struct.anon.3, [80 x i8] }
%struct.anon.3 = type { %union.anon.4, %union.anon.7 }
%union.anon.4 = type { %struct.anon.5 }
%struct.anon.5 = type { i32, i32 }
%union.anon.7 = type { %struct.anon.8 }
%struct.anon.8 = type { i32, i64, i64 }

@lio_listio64 = weak alias i32 (i32, %struct.aiocb**, i32, %struct.sigevent*), i32 (i32, %struct.aiocb**, i32, %struct.sigevent*)* @lio_listio

; Function Attrs: nounwind optsize strictfp
define i32 @lio_listio(i32 noundef %0, %struct.aiocb** noalias noundef %1, i32 noundef %2, %struct.sigevent* noalias noundef %3) #0 {
  %5 = alloca %struct.pthread_attr_t, align 8
  %6 = alloca %struct.__sigset_t, align 8
  %7 = alloca %struct.__sigset_t, align 8
  %8 = alloca %struct.__pthread*, align 8
  %9 = icmp slt i32 %2, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %4
  %11 = tail call i32* @___errno_location() #6
  store i32 22, i32* %11, align 4, !tbaa !3
  br label %99

12:                                               ; preds = %4
  %13 = icmp eq i32 %0, 0
  br i1 %13, label %20, label %14

14:                                               ; preds = %12
  %15 = icmp eq %struct.sigevent* %3, null
  br i1 %15, label %36, label %16

16:                                               ; preds = %14
  %17 = getelementptr inbounds %struct.sigevent, %struct.sigevent* %3, i64 0, i32 2
  %18 = load i32, i32* %17, align 4, !tbaa !7
  %19 = icmp eq i32 %18, 1
  br i1 %19, label %36, label %20

20:                                               ; preds = %16, %12
  %21 = zext i32 %2 to i64
  %22 = shl nuw nsw i64 %21, 3
  %23 = add nuw nsw i64 %22, 16
  %24 = tail call i8* @malloc(i64 noundef %23) #7
  %25 = icmp eq i8* %24, null
  br i1 %25, label %26, label %28

26:                                               ; preds = %20
  %27 = tail call i32* @___errno_location() #6
  store i32 11, i32* %27, align 4, !tbaa !3
  br label %99

28:                                               ; preds = %20
  %29 = bitcast i8* %24 to %struct.lio_state*
  %30 = getelementptr inbounds i8, i8* %24, i64 8
  %31 = bitcast i8* %30 to i32*
  store i32 %2, i32* %31, align 8, !tbaa !3
  %32 = bitcast i8* %24 to %struct.sigevent**
  store %struct.sigevent* %3, %struct.sigevent** %32, align 8, !tbaa !9
  %33 = getelementptr inbounds i8, i8* %24, i64 16
  %34 = bitcast %struct.aiocb** %1 to i8*
  %35 = tail call i8* @memcpy(i8* noundef nonnull %33, i8* noundef %34, i64 noundef %22) #7
  br label %36

36:                                               ; preds = %28, %16, %14
  %37 = phi %struct.lio_state* [ %29, %28 ], [ null, %16 ], [ null, %14 ]
  %38 = icmp eq i32 %2, 0
  br i1 %38, label %62, label %39

39:                                               ; preds = %36
  %40 = zext i32 %2 to i64
  br label %41

41:                                               ; preds = %39, %59
  %42 = phi i64 [ 0, %39 ], [ %60, %59 ]
  %43 = getelementptr inbounds %struct.aiocb*, %struct.aiocb** %1, i64 %42
  %44 = load %struct.aiocb*, %struct.aiocb** %43, align 8, !tbaa !9
  %45 = icmp eq %struct.aiocb* %44, null
  br i1 %45, label %59, label %46

46:                                               ; preds = %41
  %47 = getelementptr inbounds %struct.aiocb, %struct.aiocb* %44, i64 0, i32 1
  %48 = load i32, i32* %47, align 4, !tbaa !11
  switch i32 %48, label %59 [
    i32 0, label %49
    i32 1, label %51
  ]

49:                                               ; preds = %46
  %50 = tail call i32 @aio_read(%struct.aiocb* noundef nonnull %44) #7
  br label %53

51:                                               ; preds = %46
  %52 = tail call i32 @aio_write(%struct.aiocb* noundef nonnull %44) #7
  br label %53

53:                                               ; preds = %51, %49
  %54 = phi i32 [ %52, %51 ], [ %50, %49 ]
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %59, label %56

56:                                               ; preds = %53
  %57 = bitcast %struct.lio_state* %37 to i8*
  tail call void @free(i8* noundef %57) #7
  %58 = tail call i32* @___errno_location() #6
  store i32 11, i32* %58, align 4, !tbaa !3
  br label %99

59:                                               ; preds = %53, %46, %41
  %60 = add nuw nsw i64 %42, 1
  %61 = icmp eq i64 %60, %40
  br i1 %61, label %62, label %41

62:                                               ; preds = %59, %36
  br i1 %13, label %63, label %66

63:                                               ; preds = %62
  %64 = tail call fastcc i32 @lio_wait(%struct.lio_state* noundef %37) #8
  %65 = bitcast %struct.lio_state* %37 to i8*
  tail call void @free(i8* noundef %65) #7
  br label %99

66:                                               ; preds = %62
  %67 = icmp eq %struct.lio_state* %37, null
  br i1 %67, label %99, label %68

68:                                               ; preds = %66
  %69 = bitcast %struct.pthread_attr_t* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %69) #9
  %70 = bitcast %struct.__sigset_t* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %70) #9
  %71 = bitcast %struct.__sigset_t* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %71) #9
  %72 = bitcast %struct.__pthread** %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %72) #9
  %73 = getelementptr inbounds %struct.sigevent, %struct.sigevent* %3, i64 0, i32 2
  %74 = load i32, i32* %73, align 4, !tbaa !7
  %75 = icmp eq i32 %74, 2
  br i1 %75, label %76, label %84

76:                                               ; preds = %68
  %77 = getelementptr inbounds %struct.sigevent, %struct.sigevent* %3, i64 0, i32 3, i32 0, i32 1
  %78 = load %struct.pthread_attr_t*, %struct.pthread_attr_t** %77, align 8, !tbaa !14
  %79 = icmp eq %struct.pthread_attr_t* %78, null
  br i1 %79, label %82, label %80

80:                                               ; preds = %76
  %81 = bitcast %struct.pthread_attr_t* %78 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 %69, i8* align 8 %81, i64 56, i1 true) #10, !tbaa.struct !15
  br label %88

82:                                               ; preds = %76
  %83 = call i32 @pthread_attr_init(%struct.pthread_attr_t* noundef nonnull %5) #7
  br label %88

84:                                               ; preds = %68
  %85 = call i32 @pthread_attr_init(%struct.pthread_attr_t* noundef nonnull %5) #7
  %86 = call i32 @pthread_attr_setstacksize(%struct.pthread_attr_t* noundef nonnull %5, i64 noundef 4096) #7
  %87 = call i32 @pthread_attr_setguardsize(%struct.pthread_attr_t* noundef nonnull %5, i64 noundef 0) #7
  br label %88

88:                                               ; preds = %80, %82, %84
  %89 = call i32 @pthread_attr_setdetachstate(%struct.pthread_attr_t* noundef nonnull %5, i32 noundef 1) #7
  %90 = call i32 @sigfillset(%struct.__sigset_t* noundef nonnull %6) #7
  %91 = call i32 @pthread_sigmask(i32 noundef 0, %struct.__sigset_t* noundef nonnull %6, %struct.__sigset_t* noundef nonnull %7) #7
  %92 = bitcast %struct.lio_state* %37 to i8*
  %93 = call i32 @pthread_create(%struct.__pthread** noundef nonnull %8, %struct.pthread_attr_t* noundef nonnull %5, i8* (i8*)* noundef nonnull @wait_thread, i8* noundef nonnull %92) #7
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %95, label %97

95:                                               ; preds = %88
  %96 = call i32 @pthread_sigmask(i32 noundef 2, %struct.__sigset_t* noundef nonnull %7, %struct.__sigset_t* noundef null) #7
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %72) #9
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %71) #9
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %70) #9
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %69) #9
  br label %99

97:                                               ; preds = %88
  call void @free(i8* noundef nonnull %92) #7
  %98 = tail call i32* @___errno_location() #6
  store i32 11, i32* %98, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %72) #9
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %71) #9
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %70) #9
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %69) #9
  br label %99

99:                                               ; preds = %66, %95, %97, %63, %56, %26, %10
  %100 = phi i32 [ -1, %10 ], [ -1, %56 ], [ %64, %63 ], [ -1, %97 ], [ -1, %26 ], [ 0, %95 ], [ 0, %66 ]
  ret i32 %100
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @malloc(i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @aio_read(%struct.aiocb* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @aio_write(%struct.aiocb* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #3

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @lio_wait(%struct.lio_state* noundef %0) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.lio_state, %struct.lio_state* %0, i64 0, i32 1
  %3 = load i32, i32* %2, align 8, !tbaa !3
  %4 = getelementptr inbounds %struct.lio_state, %struct.lio_state* %0, i64 0, i32 2, i64 0
  %5 = icmp sgt i32 %3, 0
  %6 = zext i32 %3 to i64
  br label %7

7:                                                ; preds = %35, %1
  %8 = phi i32 [ 0, %1 ], [ %27, %35 ]
  br i1 %5, label %9, label %26

9:                                                ; preds = %7, %20
  %10 = phi i64 [ %22, %20 ], [ 0, %7 ]
  %11 = phi i32 [ %21, %20 ], [ %8, %7 ]
  %12 = getelementptr inbounds %struct.lio_state, %struct.lio_state* %0, i64 0, i32 2, i64 %10
  %13 = load %struct.aiocb*, %struct.aiocb** %12, align 8, !tbaa !9
  %14 = icmp eq %struct.aiocb* %13, null
  br i1 %14, label %20, label %15

15:                                               ; preds = %9
  %16 = tail call i32 @aio_error(%struct.aiocb* noundef nonnull %13) #7
  switch i32 %16, label %17 [
    i32 115, label %24
    i32 0, label %18
  ]

17:                                               ; preds = %15
  br label %18

18:                                               ; preds = %15, %17
  %19 = phi i32 [ 1, %17 ], [ %11, %15 ]
  store %struct.aiocb* null, %struct.aiocb** %12, align 8, !tbaa !9
  br label %20

20:                                               ; preds = %9, %18
  %21 = phi i32 [ %19, %18 ], [ %11, %9 ]
  %22 = add nuw nsw i64 %10, 1
  %23 = icmp eq i64 %22, %6
  br i1 %23, label %30, label %9

24:                                               ; preds = %15
  %25 = trunc i64 %10 to i32
  br label %26

26:                                               ; preds = %24, %7
  %27 = phi i32 [ %8, %7 ], [ %11, %24 ]
  %28 = phi i32 [ 0, %7 ], [ %25, %24 ]
  %29 = icmp eq i32 %28, %3
  br i1 %29, label %30, label %35

30:                                               ; preds = %26, %20
  %31 = phi i32 [ %21, %20 ], [ %27, %26 ]
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %38, label %33

33:                                               ; preds = %30
  %34 = tail call i32* @___errno_location() #6
  store i32 5, i32* %34, align 4, !tbaa !3
  br label %38

35:                                               ; preds = %26
  %36 = tail call i32 @aio_suspend(%struct.aiocb** noundef nonnull %4, i32 noundef %3, %struct.timespec* noundef null) #7
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %7, label %38

38:                                               ; preds = %35, %30, %33
  %39 = phi i32 [ -1, %33 ], [ 0, %30 ], [ -1, %35 ]
  ret i32 %39
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: optsize
declare i32 @pthread_attr_init(%struct.pthread_attr_t* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @pthread_attr_setstacksize(%struct.pthread_attr_t* noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @pthread_attr_setguardsize(%struct.pthread_attr_t* noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @pthread_attr_setdetachstate(%struct.pthread_attr_t* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @sigfillset(%struct.__sigset_t* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @pthread_sigmask(i32 noundef, %struct.__sigset_t* noundef, %struct.__sigset_t* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @pthread_create(%struct.__pthread** noundef, %struct.pthread_attr_t* noundef, i8* (i8*)* noundef, i8* noundef) local_unnamed_addr #3

; Function Attrs: nounwind optsize strictfp
define internal i8* @wait_thread(i8* noundef %0) #0 {
  %2 = alloca %struct.siginfo_t, align 8
  %3 = bitcast i8* %0 to %struct.lio_state*
  %4 = bitcast i8* %0 to %struct.sigevent**
  %5 = load %struct.sigevent*, %struct.sigevent** %4, align 8, !tbaa !9
  %6 = tail call fastcc i32 @lio_wait(%struct.lio_state* noundef %3) #8
  tail call void @free(i8* noundef %0) #7
  %7 = getelementptr inbounds %struct.sigevent, %struct.sigevent* %5, i64 0, i32 2
  %8 = load i32, i32* %7, align 4, !tbaa !7
  switch i32 %8, label %32 [
    i32 0, label %9
    i32 2, label %27
  ]

9:                                                ; preds = %1
  %10 = bitcast %struct.siginfo_t* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %10) #9
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(128) %10, i8 0, i64 128, i1 false) #9
  %11 = getelementptr inbounds %struct.siginfo_t, %struct.siginfo_t* %2, i64 0, i32 0
  %12 = getelementptr inbounds %struct.sigevent, %struct.sigevent* %5, i64 0, i32 1
  %13 = load i32, i32* %12, align 8, !tbaa !3
  store i32 %13, i32* %11, align 8, !tbaa !16
  %14 = getelementptr inbounds %struct.siginfo_t, %struct.siginfo_t* %2, i64 0, i32 2
  store i32 -4, i32* %14, align 8, !tbaa !18
  %15 = getelementptr inbounds %struct.siginfo_t, %struct.siginfo_t* %2, i64 0, i32 3, i32 0, i32 0, i32 0, i32 0
  %16 = tail call i32 @getpid() #7
  store i32 %16, i32* %15, align 8, !tbaa !19
  %17 = getelementptr inbounds %struct.siginfo_t, %struct.siginfo_t* %2, i64 0, i32 3, i32 0, i32 0, i32 0, i32 1
  %18 = tail call i32 @getuid() #7
  store i32 %18, i32* %17, align 4, !tbaa !21
  %19 = getelementptr inbounds %struct.siginfo_t, %struct.siginfo_t* %2, i64 0, i32 3, i32 0, i32 1
  %20 = bitcast %struct.sigevent* %5 to i64*
  %21 = bitcast %union.anon.7* %19 to i64*
  %22 = load i64, i64* %20, align 8
  store i64 %22, i64* %21, align 8
  %23 = sext i32 %16 to i64
  %24 = sext i32 %13 to i64
  %25 = ptrtoint %struct.siginfo_t* %2 to i64
  %26 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 129, i64 %23, i64 %24, i64 %25) #9, !srcloc !22
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %10) #9
  br label %32

27:                                               ; preds = %1
  %28 = getelementptr inbounds %struct.sigevent, %struct.sigevent* %5, i64 0, i32 3, i32 0, i32 0
  %29 = load void (i8*)*, void (i8*)** %28, align 8, !tbaa !14
  %30 = getelementptr inbounds %struct.sigevent, %struct.sigevent* %5, i64 0, i32 0, i32 0
  %31 = load i8*, i8** %30, align 8
  tail call void %29(i8* %31) #7
  br label %32

32:                                               ; preds = %1, %27, %9
  ret i8* null
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @aio_error(%struct.aiocb* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @aio_suspend(%struct.aiocb** noundef, i32 noundef, %struct.timespec* noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: optsize
declare i32 @getpid() local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @getuid() local_unnamed_addr #3

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #5 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #6 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #7 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #8 = { nobuiltin optsize strictfp "no-builtins" }
attributes #9 = { nounwind strictfp }
attributes #10 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !4, i64 12}
!8 = !{!"sigevent", !5, i64 0, !4, i64 8, !4, i64 12, !5, i64 16}
!9 = !{!10, !10, i64 0}
!10 = !{!"any pointer", !5, i64 0}
!11 = !{!12, !4, i64 4}
!12 = !{!"aiocb", !4, i64 0, !4, i64 4, !4, i64 8, !10, i64 16, !13, i64 24, !8, i64 32, !10, i64 96, !5, i64 104, !4, i64 112, !13, i64 120, !13, i64 128, !10, i64 136, !10, i64 144, !5, i64 152}
!13 = !{!"long", !5, i64 0}
!14 = !{!5, !5, i64 0}
!15 = !{i64 0, i64 56, !14, i64 0, i64 56, !14, i64 0, i64 56, !14}
!16 = !{!17, !4, i64 0}
!17 = !{!"", !4, i64 0, !4, i64 4, !4, i64 8, !5, i64 16}
!18 = !{!17, !4, i64 8}
!19 = !{!20, !4, i64 0}
!20 = !{!"", !4, i64 0, !4, i64 4}
!21 = !{!20, !4, i64 4}
!22 = !{i64 260219}
