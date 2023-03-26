; ModuleID = 'src/aio/aio.c'
source_filename = "src/aio/aio.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.aio_queue = type { i32, i32, i32, i32, i32, %struct.pthread_mutex_t, %struct.pthread_cond_t, %struct.aio_thread* }
%struct.pthread_mutex_t = type { %union.anon.2 }
%union.anon.2 = type { [5 x i8*] }
%struct.pthread_cond_t = type { %union.anon.3 }
%union.anon.3 = type { [6 x i8*] }
%struct.aio_thread = type { %struct.__pthread*, %struct.aiocb*, %struct.aio_thread*, %struct.aio_thread*, %struct.aio_queue*, i32, i32, i32, i64 }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon.1, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon.1 = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.aiocb = type { i32, i32, i32, i8*, i64, %struct.sigevent, i8*, [2 x i32], i32, i64, i64, i8*, i8*, [16 x i8] }
%struct.sigevent = type { %union.sigval, i32, i32, %union.anon }
%union.sigval = type { i8* }
%union.anon = type { %struct.anon, [32 x i8] }
%struct.anon = type { void (i8*)*, %struct.pthread_attr_t* }
%struct.pthread_attr_t = type { %union.anon.0 }
%union.anon.0 = type { [7 x i64] }
%struct.__sigset_t = type { [16 x i64] }
%struct.aio_args = type { %struct.aiocb*, %struct.aio_queue*, i32, %struct.sem_t }
%struct.sem_t = type { [8 x i32] }
%struct.pthread_rwlock_t = type { %union.anon.4 }
%union.anon.4 = type { [7 x i8*] }
%struct.pthread_mutexattr_t = type { i32 }
%struct.pthread_condattr_t = type { i32 }
%struct.siginfo_t = type { i32, i32, i32, %union.anon.5 }
%union.anon.5 = type { %struct.anon.6, [80 x i8] }
%struct.anon.6 = type { %union.anon.7, %union.anon.10 }
%union.anon.7 = type { %struct.anon.8 }
%struct.anon.8 = type { i32, i32 }
%union.anon.10 = type { %struct.anon.11 }
%struct.anon.11 = type { i32, i64, i64 }

@aio_fd_cnt = internal global i32 0, align 4
@map = internal unnamed_addr global %struct.aio_queue***** null, align 8
@__aio_fut = hidden global i32 0, align 4
@io_thread_stack_size = internal unnamed_addr global i64 0, align 8
@maplock = internal global { { [14 x i32] } } zeroinitializer, align 8

@aio_cancel64 = weak alias i32 (i32, %struct.aiocb*), i32 (i32, %struct.aiocb*)* @aio_cancel
@aio_error64 = weak alias i32 (%struct.aiocb*), i32 (%struct.aiocb*)* @aio_error
@aio_fsync64 = weak alias i32 (i32, %struct.aiocb*), i32 (i32, %struct.aiocb*)* @aio_fsync
@aio_read64 = weak alias i32 (%struct.aiocb*), i32 (%struct.aiocb*)* @aio_read
@aio_write64 = weak alias i32 (%struct.aiocb*), i32 (%struct.aiocb*)* @aio_write
@aio_return64 = weak alias i64 (%struct.aiocb*), i64 (%struct.aiocb*)* @aio_return

; Function Attrs: nounwind optsize strictfp
define i32 @aio_read(%struct.aiocb* noundef %0) #0 {
  %2 = tail call fastcc i32 @submit(%struct.aiocb* noundef %0, i32 noundef 0) #7
  ret i32 %2
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @submit(%struct.aiocb* noundef %0, i32 noundef %1) unnamed_addr #0 {
  %3 = alloca %struct.pthread_attr_t, align 8
  %4 = alloca %struct.__sigset_t, align 8
  %5 = alloca %struct.__sigset_t, align 8
  %6 = alloca %struct.__pthread*, align 8
  %7 = alloca %struct.aio_args, align 8
  %8 = bitcast %struct.pthread_attr_t* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %8) #8
  %9 = bitcast %struct.__sigset_t* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %9) #8
  %10 = bitcast %struct.__sigset_t* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %10) #8
  %11 = bitcast %struct.__pthread** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %11) #8
  %12 = getelementptr inbounds %struct.aiocb, %struct.aiocb* %0, i64 0, i32 0
  %13 = load i32, i32* %12, align 8, !tbaa !3
  %14 = tail call fastcc %struct.aio_queue* @__aio_get_queue(i32 noundef %13, i32 noundef 1) #7
  %15 = bitcast %struct.aio_args* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %15) #8
  %16 = getelementptr inbounds %struct.aio_args, %struct.aio_args* %7, i64 0, i32 0
  store %struct.aiocb* %0, %struct.aiocb** %16, align 8, !tbaa !11
  %17 = getelementptr inbounds %struct.aio_args, %struct.aio_args* %7, i64 0, i32 1
  store %struct.aio_queue* %14, %struct.aio_queue** %17, align 8, !tbaa !14
  %18 = getelementptr inbounds %struct.aio_args, %struct.aio_args* %7, i64 0, i32 2
  store i32 %1, i32* %18, align 8, !tbaa !15
  %19 = getelementptr inbounds %struct.aio_args, %struct.aio_args* %7, i64 0, i32 3
  %20 = bitcast %struct.sem_t* %19 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(32) %20, i8 0, i64 32, i1 false) #9
  %21 = call i32 @sem_init(%struct.sem_t* noundef nonnull %19, i32 noundef 0, i32 noundef 0) #10
  %22 = icmp eq %struct.aio_queue* %14, null
  br i1 %22, label %23, label %32

23:                                               ; preds = %2
  %24 = tail call i32* @___errno_location() #11
  %25 = load i32, i32* %24, align 4, !tbaa !16
  %26 = icmp eq i32 %25, 9
  br i1 %26, label %28, label %27

27:                                               ; preds = %23
  store i32 11, i32* %24, align 4, !tbaa !16
  br label %28

28:                                               ; preds = %27, %23
  %29 = phi i32 [ 11, %27 ], [ 9, %23 ]
  %30 = getelementptr inbounds %struct.aiocb, %struct.aiocb* %0, i64 0, i32 9
  store i64 -1, i64* %30, align 8, !tbaa !17
  %31 = getelementptr inbounds %struct.aiocb, %struct.aiocb* %0, i64 0, i32 8
  store volatile i32 %29, i32* %31, align 8, !tbaa !18
  br label %71

32:                                               ; preds = %2
  %33 = getelementptr inbounds %struct.aio_queue, %struct.aio_queue* %14, i64 0, i32 3
  %34 = load i32, i32* %33, align 4, !tbaa !19
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %33, align 4, !tbaa !19
  %36 = getelementptr inbounds %struct.aio_queue, %struct.aio_queue* %14, i64 0, i32 5
  %37 = call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* noundef nonnull %36) #10
  %38 = getelementptr inbounds %struct.aiocb, %struct.aiocb* %0, i64 0, i32 5, i32 2
  %39 = load i32, i32* %38, align 4, !tbaa !21
  %40 = icmp eq i32 %39, 2
  br i1 %40, label %41, label %49

41:                                               ; preds = %32
  %42 = getelementptr inbounds %struct.aiocb, %struct.aiocb* %0, i64 0, i32 5, i32 3, i32 0, i32 1
  %43 = load %struct.pthread_attr_t*, %struct.pthread_attr_t** %42, align 8, !tbaa !22
  %44 = icmp eq %struct.pthread_attr_t* %43, null
  br i1 %44, label %47, label %45

45:                                               ; preds = %41
  %46 = bitcast %struct.pthread_attr_t* %43 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 %8, i8* align 8 %46, i64 56, i1 true) #9, !tbaa.struct !23
  br label %54

47:                                               ; preds = %41
  %48 = call i32 @pthread_attr_init(%struct.pthread_attr_t* noundef nonnull %3) #10
  br label %54

49:                                               ; preds = %32
  %50 = call i32 @pthread_attr_init(%struct.pthread_attr_t* noundef nonnull %3) #10
  %51 = load i64, i64* @io_thread_stack_size, align 8, !tbaa !24
  %52 = call i32 @pthread_attr_setstacksize(%struct.pthread_attr_t* noundef nonnull %3, i64 noundef %51) #10
  %53 = call i32 @pthread_attr_setguardsize(%struct.pthread_attr_t* noundef nonnull %3, i64 noundef 0) #10
  br label %54

54:                                               ; preds = %45, %47, %49
  %55 = call i32 @pthread_attr_setdetachstate(%struct.pthread_attr_t* noundef nonnull %3, i32 noundef 1) #10
  %56 = call i32 @sigfillset(%struct.__sigset_t* noundef nonnull %4) #10
  %57 = call i32 @pthread_sigmask(i32 noundef 0, %struct.__sigset_t* noundef nonnull %4, %struct.__sigset_t* noundef nonnull %5) #10
  %58 = getelementptr inbounds %struct.aiocb, %struct.aiocb* %0, i64 0, i32 8
  store volatile i32 115, i32* %58, align 8, !tbaa !18
  %59 = call i32 @pthread_create(%struct.__pthread** noundef nonnull %6, %struct.pthread_attr_t* noundef nonnull %3, i8* (i8*)* noundef nonnull @io_thread_func, i8* noundef nonnull %15) #10
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %66, label %61

61:                                               ; preds = %54
  %62 = call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* noundef nonnull %36) #10
  call fastcc void @__aio_unref_queue(%struct.aio_queue* noundef nonnull %14) #7
  %63 = tail call i32* @___errno_location() #11
  store i32 11, i32* %63, align 4, !tbaa !16
  store volatile i32 11, i32* %58, align 8, !tbaa !18
  %64 = getelementptr inbounds %struct.aiocb, %struct.aiocb* %0, i64 0, i32 9
  store i64 -1, i64* %64, align 8, !tbaa !17
  %65 = call i32 @pthread_sigmask(i32 noundef 2, %struct.__sigset_t* noundef nonnull %5, %struct.__sigset_t* noundef null) #10
  br label %71

66:                                               ; preds = %54
  %67 = call i32 @pthread_sigmask(i32 noundef 2, %struct.__sigset_t* noundef nonnull %5, %struct.__sigset_t* noundef null) #10
  br label %68

68:                                               ; preds = %66, %68
  %69 = call i32 @sem_wait(%struct.sem_t* noundef nonnull %19) #10
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %71, label %68

71:                                               ; preds = %68, %61, %28
  %72 = phi i32 [ -1, %28 ], [ -1, %61 ], [ 0, %68 ]
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %15) #8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %11) #8
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %10) #8
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %9) #8
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %8) #8
  ret i32 %72
}

; Function Attrs: nounwind optsize strictfp
define i32 @aio_write(%struct.aiocb* noundef %0) #0 {
  %2 = tail call fastcc i32 @submit(%struct.aiocb* noundef %0, i32 noundef 1) #7
  ret i32 %2
}

; Function Attrs: nounwind optsize strictfp
define i32 @aio_fsync(i32 noundef %0, %struct.aiocb* noundef %1) #0 {
  %3 = and i32 %0, -1048577
  %4 = icmp eq i32 %3, 4096
  br i1 %4, label %7, label %5

5:                                                ; preds = %2
  %6 = tail call i32* @___errno_location() #11
  store i32 22, i32* %6, align 4, !tbaa !16
  br label %9

7:                                                ; preds = %2
  %8 = tail call fastcc i32 @submit(%struct.aiocb* noundef %1, i32 noundef %0) #7
  br label %9

9:                                                ; preds = %7, %5
  %10 = phi i32 [ -1, %5 ], [ %8, %7 ]
  ret i32 %10
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn
define i64 @aio_return(%struct.aiocb* nocapture noundef readonly %0) #2 {
  %2 = getelementptr inbounds %struct.aiocb, %struct.aiocb* %0, i64 0, i32 9
  %3 = load i64, i64* %2, align 8, !tbaa !17
  ret i64 %3
}

; Function Attrs: nounwind optsize strictfp
define i32 @aio_error(%struct.aiocb* noundef %0) #0 {
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !25
  %2 = getelementptr inbounds %struct.aiocb, %struct.aiocb* %0, i64 0, i32 8
  %3 = load volatile i32, i32* %2, align 8, !tbaa !18
  %4 = and i32 %3, 2147483647
  ret i32 %4
}

; Function Attrs: nounwind optsize strictfp
define i32 @aio_cancel(i32 noundef %0, %struct.aiocb* noundef readonly %1) #0 {
  %3 = alloca %struct.__sigset_t, align 8
  %4 = alloca %struct.__sigset_t, align 8
  %5 = bitcast %struct.__sigset_t* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %5) #8
  %6 = bitcast %struct.__sigset_t* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %6) #8
  %7 = icmp eq %struct.aiocb* %1, null
  br i1 %7, label %14, label %8

8:                                                ; preds = %2
  %9 = getelementptr inbounds %struct.aiocb, %struct.aiocb* %1, i64 0, i32 0
  %10 = load i32, i32* %9, align 8, !tbaa !3
  %11 = icmp eq i32 %10, %0
  br i1 %11, label %14, label %12

12:                                               ; preds = %8
  %13 = tail call i32* @___errno_location() #11
  store i32 22, i32* %13, align 4, !tbaa !16
  br label %59

14:                                               ; preds = %8, %2
  %15 = call i32 @sigfillset(%struct.__sigset_t* noundef nonnull %3) #10
  %16 = call i32 @pthread_sigmask(i32 noundef 0, %struct.__sigset_t* noundef nonnull %3, %struct.__sigset_t* noundef nonnull %4) #10
  %17 = tail call i32* @___errno_location() #11
  store i32 2, i32* %17, align 4, !tbaa !16
  %18 = call fastcc %struct.aio_queue* @__aio_get_queue(i32 noundef %0, i32 noundef 0) #7
  %19 = icmp eq %struct.aio_queue* %18, null
  br i1 %19, label %20, label %24

20:                                               ; preds = %14
  %21 = load i32, i32* %17, align 4, !tbaa !16
  %22 = icmp eq i32 %21, 9
  %23 = select i1 %22, i32 -1, i32 2
  br label %56

24:                                               ; preds = %14
  %25 = getelementptr inbounds %struct.aio_queue, %struct.aio_queue* %18, i64 0, i32 7
  %26 = load %struct.aio_thread*, %struct.aio_thread** %25, align 8, !tbaa !26
  %27 = icmp eq %struct.aio_thread* %26, null
  br i1 %27, label %52, label %28

28:                                               ; preds = %24, %47
  %29 = phi %struct.aio_thread* [ %50, %47 ], [ %26, %24 ]
  %30 = phi i32 [ %48, %47 ], [ 2, %24 ]
  br i1 %7, label %35, label %31

31:                                               ; preds = %28
  %32 = getelementptr inbounds %struct.aio_thread, %struct.aio_thread* %29, i64 0, i32 1
  %33 = load %struct.aiocb*, %struct.aiocb** %32, align 8, !tbaa !27
  %34 = icmp eq %struct.aiocb* %33, %1
  br i1 %34, label %35, label %47

35:                                               ; preds = %31, %28
  %36 = getelementptr inbounds %struct.aio_thread, %struct.aio_thread* %29, i64 0, i32 5
  %37 = call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %36, i32 1, i32 -1) #8, !srcloc !29
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %47, label %39

39:                                               ; preds = %35
  %40 = getelementptr inbounds %struct.aio_thread, %struct.aio_thread* %29, i64 0, i32 0
  %41 = load %struct.__pthread*, %struct.__pthread** %40, align 8, !tbaa !30
  %42 = call i32 @pthread_cancel(%struct.__pthread* noundef %41) #10
  call void @__wait(i32* noundef nonnull %36, i32* noundef null, i32 noundef -1, i32 noundef 1) #10
  %43 = getelementptr inbounds %struct.aio_thread, %struct.aio_thread* %29, i64 0, i32 6
  %44 = load i32, i32* %43, align 4, !tbaa !31
  %45 = icmp eq i32 %44, 125
  %46 = select i1 %45, i32 0, i32 %30
  br label %47

47:                                               ; preds = %39, %35, %31
  %48 = phi i32 [ %30, %31 ], [ %30, %35 ], [ %46, %39 ]
  %49 = getelementptr inbounds %struct.aio_thread, %struct.aio_thread* %29, i64 0, i32 2
  %50 = load %struct.aio_thread*, %struct.aio_thread** %49, align 8, !tbaa !26
  %51 = icmp eq %struct.aio_thread* %50, null
  br i1 %51, label %52, label %28

52:                                               ; preds = %47, %24
  %53 = phi i32 [ 2, %24 ], [ %48, %47 ]
  %54 = getelementptr inbounds %struct.aio_queue, %struct.aio_queue* %18, i64 0, i32 5
  %55 = call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* noundef nonnull %54) #10
  br label %56

56:                                               ; preds = %20, %52
  %57 = phi i32 [ %53, %52 ], [ %23, %20 ]
  %58 = call i32 @pthread_sigmask(i32 noundef 2, %struct.__sigset_t* noundef nonnull %4, %struct.__sigset_t* noundef null) #10
  br label %59

59:                                               ; preds = %56, %12
  %60 = phi i32 [ -1, %12 ], [ %57, %56 ]
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %6) #8
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %5) #8
  ret i32 %60
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: optsize
declare i32 @sigfillset(%struct.__sigset_t* noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @pthread_sigmask(i32 noundef, %struct.__sigset_t* noundef, %struct.__sigset_t* noundef) local_unnamed_addr #4

; Function Attrs: nounwind optsize strictfp
define internal fastcc %struct.aio_queue* @__aio_get_queue(i32 noundef %0, i32 noundef %1) unnamed_addr #0 {
  %3 = icmp slt i32 %0, 0
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  %5 = tail call i32* @___errno_location() #11
  store i32 9, i32* %5, align 4, !tbaa !16
  br label %149

6:                                                ; preds = %2
  %7 = lshr i32 %0, 24
  %8 = lshr i32 %0, 16
  %9 = lshr i32 %0, 8
  %10 = tail call i32 @pthread_rwlock_rdlock(%struct.pthread_rwlock_t* noundef bitcast ({ { [14 x i32] } }* @maplock to %struct.pthread_rwlock_t*)) #10
  %11 = load %struct.aio_queue*****, %struct.aio_queue****** @map, align 8, !tbaa !26
  %12 = icmp eq %struct.aio_queue***** %11, null
  br i1 %12, label %38, label %13

13:                                               ; preds = %6
  %14 = zext i32 %7 to i64
  %15 = getelementptr inbounds %struct.aio_queue****, %struct.aio_queue***** %11, i64 %14
  %16 = load %struct.aio_queue****, %struct.aio_queue***** %15, align 8, !tbaa !26
  %17 = icmp eq %struct.aio_queue**** %16, null
  br i1 %17, label %38, label %18

18:                                               ; preds = %13
  %19 = and i32 %8, 255
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds %struct.aio_queue***, %struct.aio_queue**** %16, i64 %20
  %22 = load %struct.aio_queue***, %struct.aio_queue**** %21, align 8, !tbaa !26
  %23 = icmp eq %struct.aio_queue*** %22, null
  br i1 %23, label %38, label %24

24:                                               ; preds = %18
  %25 = and i32 %9, 255
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds %struct.aio_queue**, %struct.aio_queue*** %22, i64 %26
  %28 = load %struct.aio_queue**, %struct.aio_queue*** %27, align 8, !tbaa !26
  %29 = icmp eq %struct.aio_queue** %28, null
  br i1 %29, label %38, label %30

30:                                               ; preds = %24
  %31 = and i32 %0, 255
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds %struct.aio_queue*, %struct.aio_queue** %28, i64 %32
  %34 = load %struct.aio_queue*, %struct.aio_queue** %33, align 8, !tbaa !26
  %35 = icmp eq %struct.aio_queue* %34, null
  %36 = icmp ne i32 %1, 0
  %37 = and i1 %36, %35
  br i1 %37, label %40, label %141

38:                                               ; preds = %24, %18, %13, %6
  %39 = icmp eq i32 %1, 0
  br i1 %39, label %146, label %40

40:                                               ; preds = %30, %38
  %41 = tail call i32 @pthread_rwlock_unlock(%struct.pthread_rwlock_t* noundef bitcast ({ { [14 x i32] } }* @maplock to %struct.pthread_rwlock_t*)) #10
  %42 = tail call i32 (i32, i32, ...) @fcntl(i32 noundef %0, i32 noundef 1) #10
  %43 = icmp slt i32 %42, 0
  br i1 %43, label %149, label %44

44:                                               ; preds = %40
  %45 = tail call i32 @pthread_rwlock_wrlock(%struct.pthread_rwlock_t* noundef bitcast ({ { [14 x i32] } }* @maplock to %struct.pthread_rwlock_t*)) #10
  %46 = load i64, i64* @io_thread_stack_size, align 8, !tbaa !24
  %47 = icmp eq i64 %46, 0
  br i1 %47, label %48, label %53

48:                                               ; preds = %44
  %49 = tail call i64 @__getauxval(i64 noundef 51) #10
  %50 = add i64 %49, 512
  %51 = icmp ugt i64 %50, 4096
  %52 = select i1 %51, i64 %50, i64 4096
  store i64 %52, i64* @io_thread_stack_size, align 8, !tbaa !24
  br label %53

53:                                               ; preds = %48, %44
  %54 = load %struct.aio_queue*****, %struct.aio_queue****** @map, align 8, !tbaa !26
  %55 = icmp eq %struct.aio_queue***** %54, null
  br i1 %55, label %56, label %60

56:                                               ; preds = %53
  %57 = tail call i8* @__libc_calloc(i64 noundef 8, i64 noundef 128) #10
  store i8* %57, i8** bitcast (%struct.aio_queue****** @map to i8**), align 8, !tbaa !26
  %58 = bitcast i8* %57 to %struct.aio_queue*****
  %59 = icmp eq i8* %57, null
  br i1 %59, label %146, label %60

60:                                               ; preds = %53, %56
  %61 = phi %struct.aio_queue***** [ %58, %56 ], [ %54, %53 ]
  %62 = zext i32 %7 to i64
  %63 = getelementptr inbounds %struct.aio_queue****, %struct.aio_queue***** %61, i64 %62
  %64 = load %struct.aio_queue****, %struct.aio_queue***** %63, align 8, !tbaa !26
  %65 = icmp eq %struct.aio_queue**** %64, null
  br i1 %65, label %66, label %73

66:                                               ; preds = %60
  %67 = tail call i8* @__libc_calloc(i64 noundef 8, i64 noundef 256) #10
  %68 = load %struct.aio_queue*****, %struct.aio_queue****** @map, align 8, !tbaa !26
  %69 = getelementptr inbounds %struct.aio_queue****, %struct.aio_queue***** %68, i64 %62
  %70 = bitcast %struct.aio_queue***** %69 to i8**
  store i8* %67, i8** %70, align 8, !tbaa !26
  %71 = bitcast i8* %67 to %struct.aio_queue****
  %72 = icmp eq i8* %67, null
  br i1 %72, label %146, label %73

73:                                               ; preds = %60, %66
  %74 = phi %struct.aio_queue**** [ %71, %66 ], [ %64, %60 ]
  %75 = and i32 %8, 255
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds %struct.aio_queue***, %struct.aio_queue**** %74, i64 %76
  %78 = load %struct.aio_queue***, %struct.aio_queue**** %77, align 8, !tbaa !26
  %79 = icmp eq %struct.aio_queue*** %78, null
  br i1 %79, label %80, label %91

80:                                               ; preds = %73
  %81 = tail call i8* @__libc_calloc(i64 noundef 8, i64 noundef 256) #10
  %82 = load %struct.aio_queue*****, %struct.aio_queue****** @map, align 8, !tbaa !26
  %83 = getelementptr inbounds %struct.aio_queue****, %struct.aio_queue***** %82, i64 %62
  %84 = load %struct.aio_queue****, %struct.aio_queue***** %83, align 8, !tbaa !26
  %85 = getelementptr inbounds %struct.aio_queue***, %struct.aio_queue**** %84, i64 %76
  %86 = bitcast %struct.aio_queue**** %85 to i8**
  store i8* %81, i8** %86, align 8, !tbaa !26
  %87 = load %struct.aio_queue****, %struct.aio_queue***** %83, align 8, !tbaa !26
  %88 = getelementptr inbounds %struct.aio_queue***, %struct.aio_queue**** %87, i64 %76
  %89 = load %struct.aio_queue***, %struct.aio_queue**** %88, align 8, !tbaa !26
  %90 = icmp eq %struct.aio_queue*** %89, null
  br i1 %90, label %146, label %91

91:                                               ; preds = %73, %80
  %92 = phi %struct.aio_queue*** [ %89, %80 ], [ %78, %73 ]
  %93 = and i32 %9, 255
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds %struct.aio_queue**, %struct.aio_queue*** %92, i64 %94
  %96 = load %struct.aio_queue**, %struct.aio_queue*** %95, align 8, !tbaa !26
  %97 = icmp eq %struct.aio_queue** %96, null
  br i1 %97, label %98, label %113

98:                                               ; preds = %91
  %99 = tail call i8* @__libc_calloc(i64 noundef 8, i64 noundef 256) #10
  %100 = load %struct.aio_queue*****, %struct.aio_queue****** @map, align 8, !tbaa !26
  %101 = getelementptr inbounds %struct.aio_queue****, %struct.aio_queue***** %100, i64 %62
  %102 = load %struct.aio_queue****, %struct.aio_queue***** %101, align 8, !tbaa !26
  %103 = getelementptr inbounds %struct.aio_queue***, %struct.aio_queue**** %102, i64 %76
  %104 = load %struct.aio_queue***, %struct.aio_queue**** %103, align 8, !tbaa !26
  %105 = getelementptr inbounds %struct.aio_queue**, %struct.aio_queue*** %104, i64 %94
  %106 = bitcast %struct.aio_queue*** %105 to i8**
  store i8* %99, i8** %106, align 8, !tbaa !26
  %107 = load %struct.aio_queue****, %struct.aio_queue***** %101, align 8, !tbaa !26
  %108 = getelementptr inbounds %struct.aio_queue***, %struct.aio_queue**** %107, i64 %76
  %109 = load %struct.aio_queue***, %struct.aio_queue**** %108, align 8, !tbaa !26
  %110 = getelementptr inbounds %struct.aio_queue**, %struct.aio_queue*** %109, i64 %94
  %111 = load %struct.aio_queue**, %struct.aio_queue*** %110, align 8, !tbaa !26
  %112 = icmp eq %struct.aio_queue** %111, null
  br i1 %112, label %146, label %113

113:                                              ; preds = %91, %98
  %114 = phi %struct.aio_queue** [ %111, %98 ], [ %96, %91 ]
  %115 = and i32 %0, 255
  %116 = zext i32 %115 to i64
  %117 = getelementptr inbounds %struct.aio_queue*, %struct.aio_queue** %114, i64 %116
  %118 = load %struct.aio_queue*, %struct.aio_queue** %117, align 8, !tbaa !26
  %119 = icmp eq %struct.aio_queue* %118, null
  br i1 %119, label %120, label %142

120:                                              ; preds = %113
  %121 = tail call i8* @__libc_calloc(i64 noundef 120, i64 noundef 1) #10
  %122 = load %struct.aio_queue*****, %struct.aio_queue****** @map, align 8, !tbaa !26
  %123 = getelementptr inbounds %struct.aio_queue****, %struct.aio_queue***** %122, i64 %62
  %124 = load %struct.aio_queue****, %struct.aio_queue***** %123, align 8, !tbaa !26
  %125 = getelementptr inbounds %struct.aio_queue***, %struct.aio_queue**** %124, i64 %76
  %126 = load %struct.aio_queue***, %struct.aio_queue**** %125, align 8, !tbaa !26
  %127 = getelementptr inbounds %struct.aio_queue**, %struct.aio_queue*** %126, i64 %94
  %128 = load %struct.aio_queue**, %struct.aio_queue*** %127, align 8, !tbaa !26
  %129 = getelementptr inbounds %struct.aio_queue*, %struct.aio_queue** %128, i64 %116
  %130 = bitcast %struct.aio_queue** %129 to i8**
  store i8* %121, i8** %130, align 8, !tbaa !26
  %131 = icmp eq i8* %121, null
  br i1 %131, label %146, label %132

132:                                              ; preds = %120
  %133 = bitcast i8* %121 to %struct.aio_queue*
  %134 = bitcast i8* %121 to i32*
  store i32 %0, i32* %134, align 8, !tbaa !32
  %135 = getelementptr inbounds i8, i8* %121, i64 24
  %136 = bitcast i8* %135 to %struct.pthread_mutex_t*
  %137 = tail call i32 @pthread_mutex_init(%struct.pthread_mutex_t* noundef nonnull %136, %struct.pthread_mutexattr_t* noundef null) #10
  %138 = getelementptr inbounds i8, i8* %121, i64 64
  %139 = bitcast i8* %138 to %struct.pthread_cond_t*
  %140 = tail call i32 @pthread_cond_init(%struct.pthread_cond_t* noundef nonnull %139, %struct.pthread_condattr_t* noundef null) #10
  tail call void asm sideeffect "lock ; incl $0", "=*m,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) @aio_fd_cnt, i32* nonnull elementtype(i32) @aio_fd_cnt) #8, !srcloc !33
  br label %142

141:                                              ; preds = %30
  br i1 %35, label %146, label %142

142:                                              ; preds = %132, %113, %141
  %143 = phi %struct.aio_queue* [ %34, %141 ], [ %133, %132 ], [ %118, %113 ]
  %144 = getelementptr inbounds %struct.aio_queue, %struct.aio_queue* %143, i64 0, i32 5
  %145 = tail call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* noundef nonnull %144) #10
  br label %146

146:                                              ; preds = %38, %120, %141, %142, %98, %80, %66, %56
  %147 = phi %struct.aio_queue* [ %143, %142 ], [ null, %141 ], [ null, %98 ], [ null, %80 ], [ null, %66 ], [ null, %56 ], [ null, %120 ], [ null, %38 ]
  %148 = tail call i32 @pthread_rwlock_unlock(%struct.pthread_rwlock_t* noundef bitcast ({ { [14 x i32] } }* @maplock to %struct.pthread_rwlock_t*)) #10
  br label %149

149:                                              ; preds = %146, %40, %4
  %150 = phi %struct.aio_queue* [ null, %4 ], [ %147, %146 ], [ null, %40 ]
  ret %struct.aio_queue* %150
}

; Function Attrs: optsize
declare i32 @pthread_cancel(%struct.__pthread* noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare hidden void @__wait(i32* noundef, i32* noundef, i32 noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* noundef) local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__aio_close(i32 noundef returned %0) local_unnamed_addr #0 {
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !25
  %2 = load volatile i32, i32* @aio_fd_cnt, align 4, !tbaa !16
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %6, label %4

4:                                                ; preds = %1
  %5 = tail call i32 @aio_cancel(i32 noundef %0, %struct.aiocb* noundef null) #7
  br label %6

6:                                                ; preds = %4, %1
  ret i32 %0
}

; Function Attrs: nounwind optsize strictfp
define hidden void @__aio_atfork(i32 noundef %0) local_unnamed_addr #0 {
  %2 = icmp slt i32 %0, 0
  br i1 %2, label %3, label %5

3:                                                ; preds = %1
  %4 = tail call i32 @pthread_rwlock_rdlock(%struct.pthread_rwlock_t* noundef bitcast ({ { [14 x i32] } }* @maplock to %struct.pthread_rwlock_t*)) #10
  br label %55

5:                                                ; preds = %1
  %6 = icmp ne i32 %0, 0
  %7 = load %struct.aio_queue*****, %struct.aio_queue****** @map, align 8
  %8 = icmp ne %struct.aio_queue***** %7, null
  %9 = select i1 %6, i1 %8, i1 false
  br i1 %9, label %10, label %53

10:                                               ; preds = %5, %50
  %11 = phi i64 [ %51, %50 ], [ 0, %5 ]
  %12 = getelementptr inbounds %struct.aio_queue****, %struct.aio_queue***** %7, i64 %11
  %13 = load %struct.aio_queue****, %struct.aio_queue***** %12, align 8, !tbaa !26
  %14 = icmp eq %struct.aio_queue**** %13, null
  br i1 %14, label %50, label %15

15:                                               ; preds = %10, %48
  %16 = phi %struct.aio_queue**** [ %49, %48 ], [ %13, %10 ]
  %17 = phi i64 [ %46, %48 ], [ 0, %10 ]
  %18 = getelementptr inbounds %struct.aio_queue***, %struct.aio_queue**** %16, i64 %17
  %19 = load %struct.aio_queue***, %struct.aio_queue**** %18, align 8, !tbaa !26
  %20 = icmp eq %struct.aio_queue*** %19, null
  br i1 %20, label %45, label %21

21:                                               ; preds = %15, %41
  %22 = phi %struct.aio_queue*** [ %44, %41 ], [ %19, %15 ]
  %23 = phi i64 [ %39, %41 ], [ 0, %15 ]
  %24 = getelementptr inbounds %struct.aio_queue**, %struct.aio_queue*** %22, i64 %23
  %25 = load %struct.aio_queue**, %struct.aio_queue*** %24, align 8, !tbaa !26
  %26 = icmp eq %struct.aio_queue** %25, null
  br i1 %26, label %38, label %27

27:                                               ; preds = %21
  store %struct.aio_queue* null, %struct.aio_queue** %25, align 8, !tbaa !26
  br label %28

28:                                               ; preds = %27, %28
  %29 = phi i64 [ 1, %27 ], [ %36, %28 ]
  %30 = load %struct.aio_queue****, %struct.aio_queue***** %12, align 8, !tbaa !26
  %31 = getelementptr inbounds %struct.aio_queue***, %struct.aio_queue**** %30, i64 %17
  %32 = load %struct.aio_queue***, %struct.aio_queue**** %31, align 8, !tbaa !26
  %33 = getelementptr inbounds %struct.aio_queue**, %struct.aio_queue*** %32, i64 %23
  %34 = load %struct.aio_queue**, %struct.aio_queue*** %33, align 8, !tbaa !26
  %35 = getelementptr inbounds %struct.aio_queue*, %struct.aio_queue** %34, i64 %29
  store %struct.aio_queue* null, %struct.aio_queue** %35, align 8, !tbaa !26
  %36 = add nuw nsw i64 %29, 1
  %37 = icmp eq i64 %36, 256
  br i1 %37, label %38, label %28

38:                                               ; preds = %28, %21
  %39 = add nuw nsw i64 %23, 1
  %40 = icmp eq i64 %39, 256
  br i1 %40, label %45, label %41

41:                                               ; preds = %38
  %42 = load %struct.aio_queue****, %struct.aio_queue***** %12, align 8, !tbaa !26
  %43 = getelementptr inbounds %struct.aio_queue***, %struct.aio_queue**** %42, i64 %17
  %44 = load %struct.aio_queue***, %struct.aio_queue**** %43, align 8, !tbaa !26
  br label %21

45:                                               ; preds = %38, %15
  %46 = add nuw nsw i64 %17, 1
  %47 = icmp eq i64 %46, 256
  br i1 %47, label %50, label %48

48:                                               ; preds = %45
  %49 = load %struct.aio_queue****, %struct.aio_queue***** %12, align 8, !tbaa !26
  br label %15

50:                                               ; preds = %45, %10
  %51 = add nuw nsw i64 %11, 1
  %52 = icmp eq i64 %51, 128
  br i1 %52, label %53, label %10

53:                                               ; preds = %50, %5
  %54 = tail call i32 @pthread_rwlock_unlock(%struct.pthread_rwlock_t* noundef bitcast ({ { [14 x i32] } }* @maplock to %struct.pthread_rwlock_t*)) #10
  br label %55

55:                                               ; preds = %53, %3
  ret void
}

; Function Attrs: optsize
declare i32 @pthread_rwlock_rdlock(%struct.pthread_rwlock_t* noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @pthread_rwlock_unlock(%struct.pthread_rwlock_t* noundef) local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: optsize
declare i32 @sem_init(%struct.sem_t* noundef, i32 noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

; Function Attrs: optsize
declare i32 @pthread_attr_init(%struct.pthread_attr_t* noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @pthread_attr_setstacksize(%struct.pthread_attr_t* noundef, i64 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @pthread_attr_setguardsize(%struct.pthread_attr_t* noundef, i64 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @pthread_attr_setdetachstate(%struct.pthread_attr_t* noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @pthread_create(%struct.__pthread** noundef, %struct.pthread_attr_t* noundef, i8* (i8*)* noundef, i8* noundef) local_unnamed_addr #4

; Function Attrs: nounwind optsize strictfp
define internal i8* @io_thread_func(i8* noundef %0) #0 {
  %2 = alloca %struct.aio_thread, align 8
  %3 = alloca %struct.__ptcb, align 8
  %4 = bitcast %struct.aio_thread* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %4) #8
  %5 = bitcast i8* %0 to %struct.aiocb**
  %6 = load %struct.aiocb*, %struct.aiocb** %5, align 8, !tbaa !11
  %7 = getelementptr inbounds %struct.aiocb, %struct.aiocb* %6, i64 0, i32 0
  %8 = load i32, i32* %7, align 8, !tbaa !3
  %9 = getelementptr inbounds i8, i8* %0, i64 16
  %10 = bitcast i8* %9 to i32*
  %11 = load i32, i32* %10, align 8, !tbaa !15
  %12 = getelementptr inbounds %struct.aiocb, %struct.aiocb* %6, i64 0, i32 3
  %13 = load i8*, i8** %12, align 8, !tbaa !34
  %14 = getelementptr inbounds %struct.aiocb, %struct.aiocb* %6, i64 0, i32 4
  %15 = load i64, i64* %14, align 8, !tbaa !35
  %16 = getelementptr inbounds %struct.aiocb, %struct.aiocb* %6, i64 0, i32 10
  %17 = load i64, i64* %16, align 8, !tbaa !36
  %18 = getelementptr inbounds i8, i8* %0, i64 8
  %19 = bitcast i8* %18 to %struct.aio_queue**
  %20 = load %struct.aio_queue*, %struct.aio_queue** %19, align 8, !tbaa !14
  %21 = getelementptr inbounds %struct.aio_queue, %struct.aio_queue* %20, i64 0, i32 5
  %22 = tail call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* noundef nonnull %21) #10
  %23 = getelementptr inbounds i8, i8* %0, i64 20
  %24 = bitcast i8* %23 to %struct.sem_t*
  %25 = tail call i32 @sem_post(%struct.sem_t* noundef nonnull %24) #10
  %26 = getelementptr inbounds %struct.aio_thread, %struct.aio_thread* %2, i64 0, i32 7
  store i32 %11, i32* %26, align 8, !tbaa !37
  %27 = getelementptr inbounds %struct.aio_thread, %struct.aio_thread* %2, i64 0, i32 5
  store volatile i32 1, i32* %27, align 8, !tbaa !38
  %28 = getelementptr inbounds %struct.aio_thread, %struct.aio_thread* %2, i64 0, i32 8
  store i64 -1, i64* %28, align 8, !tbaa !39
  %29 = getelementptr inbounds %struct.aio_thread, %struct.aio_thread* %2, i64 0, i32 6
  store i32 125, i32* %29, align 4, !tbaa !31
  %30 = getelementptr inbounds %struct.aio_thread, %struct.aio_thread* %2, i64 0, i32 4
  store %struct.aio_queue* %20, %struct.aio_queue** %30, align 8, !tbaa !40
  %31 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #12, !srcloc !41
  %32 = inttoptr i64 %31 to %struct.__pthread*
  %33 = getelementptr inbounds %struct.aio_thread, %struct.aio_thread* %2, i64 0, i32 0
  store %struct.__pthread* %32, %struct.__pthread** %33, align 8, !tbaa !30
  %34 = getelementptr inbounds %struct.aio_thread, %struct.aio_thread* %2, i64 0, i32 1
  store %struct.aiocb* %6, %struct.aiocb** %34, align 8, !tbaa !27
  %35 = getelementptr inbounds %struct.aio_thread, %struct.aio_thread* %2, i64 0, i32 3
  store %struct.aio_thread* null, %struct.aio_thread** %35, align 8, !tbaa !42
  %36 = getelementptr inbounds %struct.aio_queue, %struct.aio_queue* %20, i64 0, i32 7
  %37 = load %struct.aio_thread*, %struct.aio_thread** %36, align 8, !tbaa !43
  %38 = getelementptr inbounds %struct.aio_thread, %struct.aio_thread* %2, i64 0, i32 2
  store %struct.aio_thread* %37, %struct.aio_thread** %38, align 8, !tbaa !44
  %39 = icmp eq %struct.aio_thread* %37, null
  br i1 %39, label %42, label %40

40:                                               ; preds = %1
  %41 = getelementptr inbounds %struct.aio_thread, %struct.aio_thread* %37, i64 0, i32 3
  store %struct.aio_thread* %2, %struct.aio_thread** %41, align 8, !tbaa !42
  br label %42

42:                                               ; preds = %40, %1
  store %struct.aio_thread* %2, %struct.aio_thread** %36, align 8, !tbaa !43
  %43 = getelementptr inbounds %struct.aio_queue, %struct.aio_queue* %20, i64 0, i32 4
  %44 = load i32, i32* %43, align 8, !tbaa !45
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %60

46:                                               ; preds = %42
  %47 = call i64 @lseek(i32 noundef %8, i64 noundef 0, i32 noundef 1) #10
  %48 = icmp sgt i64 %47, -1
  %49 = lshr i64 %47, 63
  %50 = trunc i64 %49 to i32
  %51 = xor i32 %50, 1
  %52 = getelementptr inbounds %struct.aio_queue, %struct.aio_queue* %20, i64 0, i32 1
  store i32 %51, i32* %52, align 4, !tbaa !46
  br i1 %48, label %53, label %57

53:                                               ; preds = %46
  %54 = call i32 (i32, i32, ...) @fcntl(i32 noundef %8, i32 noundef 3) #10
  %55 = lshr i32 %54, 10
  %56 = and i32 %55, 1
  br label %57

57:                                               ; preds = %53, %46
  %58 = phi i32 [ 1, %46 ], [ %56, %53 ]
  %59 = getelementptr inbounds %struct.aio_queue, %struct.aio_queue* %20, i64 0, i32 2
  store i32 %58, i32* %59, align 8, !tbaa !47
  store i32 1, i32* %43, align 8, !tbaa !45
  br label %60

60:                                               ; preds = %42, %57
  %61 = bitcast %struct.__ptcb* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %61) #8
  call void @_pthread_cleanup_push(%struct.__ptcb* noundef nonnull %3, void (i8*)* noundef nonnull @cleanup, i8* noundef nonnull %4) #10
  switch i32 %11, label %70 [
    i32 0, label %62
    i32 1, label %64
  ]

62:                                               ; preds = %60
  %63 = call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* noundef nonnull %21) #10
  br label %100

64:                                               ; preds = %60
  %65 = getelementptr inbounds %struct.aio_queue, %struct.aio_queue* %20, i64 0, i32 2
  %66 = load i32, i32* %65, align 8, !tbaa !47
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %68, label %70

68:                                               ; preds = %64
  %69 = call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* noundef nonnull %21) #10
  br label %92

70:                                               ; preds = %60, %64
  %71 = load %struct.aio_thread*, %struct.aio_thread** %38, align 8, !tbaa !44
  %72 = icmp eq %struct.aio_thread* %71, null
  br i1 %72, label %90, label %73

73:                                               ; preds = %70
  %74 = getelementptr inbounds %struct.aio_queue, %struct.aio_queue* %20, i64 0, i32 6
  br label %75

75:                                               ; preds = %84, %73
  %76 = phi %struct.aio_thread* [ %71, %73 ], [ %85, %84 ]
  %77 = getelementptr inbounds %struct.aio_thread, %struct.aio_thread* %76, i64 0, i32 7
  %78 = load i32, i32* %77, align 8, !tbaa !37
  %79 = icmp eq i32 %78, 1
  br i1 %79, label %86, label %80

80:                                               ; preds = %75
  %81 = getelementptr inbounds %struct.aio_thread, %struct.aio_thread* %76, i64 0, i32 2
  %82 = load %struct.aio_thread*, %struct.aio_thread** %81, align 8, !tbaa !44
  %83 = icmp eq %struct.aio_thread* %82, null
  br i1 %83, label %90, label %84

84:                                               ; preds = %80, %86
  %85 = phi %struct.aio_thread* [ %82, %80 ], [ %88, %86 ]
  br label %75

86:                                               ; preds = %75
  %87 = call i32 @pthread_cond_wait(%struct.pthread_cond_t* noundef nonnull %74, %struct.pthread_mutex_t* noundef nonnull %21) #10
  %88 = load %struct.aio_thread*, %struct.aio_thread** %38, align 8, !tbaa !44
  %89 = icmp eq %struct.aio_thread* %88, null
  br i1 %89, label %90, label %84

90:                                               ; preds = %86, %80, %70
  %91 = call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* noundef nonnull %21) #10
  switch i32 %11, label %120 [
    i32 1, label %92
    i32 0, label %100
    i32 1052672, label %108
    i32 4096, label %111
  ]

92:                                               ; preds = %68, %90
  %93 = getelementptr inbounds %struct.aio_queue, %struct.aio_queue* %20, i64 0, i32 2
  %94 = load i32, i32* %93, align 8, !tbaa !47
  %95 = icmp eq i32 %94, 0
  br i1 %95, label %98, label %96

96:                                               ; preds = %92
  %97 = call i64 @write(i32 noundef %8, i8* noundef %13, i64 noundef %15) #10
  br label %114

98:                                               ; preds = %92
  %99 = call i64 @pwrite(i32 noundef %8, i8* noundef %13, i64 noundef %15, i64 noundef %17) #10
  br label %114

100:                                              ; preds = %62, %90
  %101 = getelementptr inbounds %struct.aio_queue, %struct.aio_queue* %20, i64 0, i32 1
  %102 = load i32, i32* %101, align 4, !tbaa !46
  %103 = icmp eq i32 %102, 0
  br i1 %103, label %104, label %106

104:                                              ; preds = %100
  %105 = call i64 @read(i32 noundef %8, i8* noundef %13, i64 noundef %15) #10
  br label %114

106:                                              ; preds = %100
  %107 = call i64 @pread(i32 noundef %8, i8* noundef %13, i64 noundef %15, i64 noundef %17) #10
  br label %114

108:                                              ; preds = %90
  %109 = call i32 @fsync(i32 noundef %8) #10
  %110 = sext i32 %109 to i64
  br label %114

111:                                              ; preds = %90
  %112 = call i32 @fdatasync(i32 noundef %8) #10
  %113 = sext i32 %112 to i64
  br label %114

114:                                              ; preds = %104, %106, %96, %98, %111, %108
  %115 = phi i64 [ %113, %111 ], [ %110, %108 ], [ %97, %96 ], [ %99, %98 ], [ %105, %104 ], [ %107, %106 ]
  store i64 %115, i64* %28, align 8, !tbaa !39
  %116 = icmp slt i64 %115, 0
  br i1 %116, label %117, label %120

117:                                              ; preds = %114
  %118 = tail call i32* @___errno_location() #11
  %119 = load i32, i32* %118, align 4, !tbaa !16
  br label %120

120:                                              ; preds = %90, %114, %117
  %121 = phi i32 [ %119, %117 ], [ 0, %114 ], [ 0, %90 ]
  store i32 %121, i32* %29, align 4, !tbaa !31
  call void @_pthread_cleanup_pop(%struct.__ptcb* noundef nonnull %3, i32 noundef 1) #10
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %61) #8
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %4) #8
  ret i8* null
}

; Function Attrs: optsize
declare i32 @pthread_mutex_lock(%struct.pthread_mutex_t* noundef) local_unnamed_addr #4

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @__aio_unref_queue(%struct.aio_queue* noundef %0) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.aio_queue, %struct.aio_queue* %0, i64 0, i32 3
  %3 = load i32, i32* %2, align 4, !tbaa !19
  %4 = icmp sgt i32 %3, 1
  br i1 %4, label %5, label %9

5:                                                ; preds = %1
  %6 = add nsw i32 %3, -1
  store i32 %6, i32* %2, align 4, !tbaa !19
  %7 = getelementptr inbounds %struct.aio_queue, %struct.aio_queue* %0, i64 0, i32 5
  %8 = tail call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* noundef nonnull %7) #10
  br label %44

9:                                                ; preds = %1
  %10 = getelementptr inbounds %struct.aio_queue, %struct.aio_queue* %0, i64 0, i32 5
  %11 = tail call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* noundef nonnull %10) #10
  %12 = tail call i32 @pthread_rwlock_wrlock(%struct.pthread_rwlock_t* noundef bitcast ({ { [14 x i32] } }* @maplock to %struct.pthread_rwlock_t*)) #10
  %13 = tail call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* noundef nonnull %10) #10
  %14 = load i32, i32* %2, align 4, !tbaa !19
  %15 = icmp eq i32 %14, 1
  br i1 %15, label %16, label %40

16:                                               ; preds = %9
  %17 = getelementptr inbounds %struct.aio_queue, %struct.aio_queue* %0, i64 0, i32 0
  %18 = load i32, i32* %17, align 8, !tbaa !32
  %19 = ashr i32 %18, 24
  %20 = lshr i32 %18, 16
  %21 = lshr i32 %18, 8
  %22 = load %struct.aio_queue*****, %struct.aio_queue****** @map, align 8, !tbaa !26
  %23 = sext i32 %19 to i64
  %24 = getelementptr inbounds %struct.aio_queue****, %struct.aio_queue***** %22, i64 %23
  %25 = load %struct.aio_queue****, %struct.aio_queue***** %24, align 8, !tbaa !26
  %26 = and i32 %20, 255
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds %struct.aio_queue***, %struct.aio_queue**** %25, i64 %27
  %29 = load %struct.aio_queue***, %struct.aio_queue**** %28, align 8, !tbaa !26
  %30 = and i32 %21, 255
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds %struct.aio_queue**, %struct.aio_queue*** %29, i64 %31
  %33 = load %struct.aio_queue**, %struct.aio_queue*** %32, align 8, !tbaa !26
  %34 = and i32 %18, 255
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds %struct.aio_queue*, %struct.aio_queue** %33, i64 %35
  store %struct.aio_queue* null, %struct.aio_queue** %36, align 8, !tbaa !26
  tail call void asm sideeffect "lock ; decl $0", "=*m,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) @aio_fd_cnt, i32* nonnull elementtype(i32) @aio_fd_cnt) #8, !srcloc !48
  %37 = tail call i32 @pthread_rwlock_unlock(%struct.pthread_rwlock_t* noundef bitcast ({ { [14 x i32] } }* @maplock to %struct.pthread_rwlock_t*)) #10
  %38 = tail call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* noundef nonnull %10) #10
  %39 = bitcast %struct.aio_queue* %0 to i8*
  tail call void @__libc_free(i8* noundef %39) #10
  br label %44

40:                                               ; preds = %9
  %41 = add nsw i32 %14, -1
  store i32 %41, i32* %2, align 4, !tbaa !19
  %42 = tail call i32 @pthread_rwlock_unlock(%struct.pthread_rwlock_t* noundef bitcast ({ { [14 x i32] } }* @maplock to %struct.pthread_rwlock_t*)) #10
  %43 = tail call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* noundef nonnull %10) #10
  br label %44

44:                                               ; preds = %5, %40, %16
  ret void
}

; Function Attrs: optsize
declare i32 @sem_wait(%struct.sem_t* noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @sem_post(%struct.sem_t* noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i64 @lseek(i32 noundef, i64 noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @fcntl(i32 noundef, i32 noundef, ...) local_unnamed_addr #4

; Function Attrs: optsize
declare void @_pthread_cleanup_push(%struct.__ptcb* noundef, void (i8*)* noundef, i8* noundef) local_unnamed_addr #4

; Function Attrs: nounwind optsize strictfp
define internal void @cleanup(i8* noundef %0) #0 {
  %2 = alloca %struct.siginfo_t, align 8
  %3 = getelementptr inbounds i8, i8* %0, i64 32
  %4 = bitcast i8* %3 to %struct.aio_queue**
  %5 = load %struct.aio_queue*, %struct.aio_queue** %4, align 8, !tbaa !40
  %6 = getelementptr inbounds i8, i8* %0, i64 8
  %7 = bitcast i8* %6 to %struct.aiocb**
  %8 = load %struct.aiocb*, %struct.aiocb** %7, align 8, !tbaa !27
  %9 = getelementptr inbounds %struct.aiocb, %struct.aiocb* %8, i64 0, i32 5, i32 0, i32 0
  %10 = load i8*, i8** %9, align 8, !tbaa.struct !49
  %11 = getelementptr inbounds %struct.aiocb, %struct.aiocb* %8, i64 0, i32 5, i32 1
  %12 = load i32, i32* %11, align 8
  %13 = getelementptr inbounds %struct.aiocb, %struct.aiocb* %8, i64 0, i32 5, i32 2
  %14 = load i32, i32* %13, align 4, !tbaa.struct !50
  %15 = getelementptr inbounds %struct.aiocb, %struct.aiocb* %8, i64 0, i32 5, i32 3, i32 0, i32 0
  %16 = load void (i8*)*, void (i8*)** %15, align 8, !tbaa.struct !51
  %17 = getelementptr inbounds i8, i8* %0, i64 56
  %18 = bitcast i8* %17 to i64*
  %19 = load i64, i64* %18, align 8, !tbaa !39
  %20 = getelementptr inbounds %struct.aiocb, %struct.aiocb* %8, i64 0, i32 9
  store i64 %19, i64* %20, align 8, !tbaa !17
  %21 = getelementptr inbounds i8, i8* %0, i64 40
  %22 = bitcast i8* %21 to i32*
  %23 = tail call i32 asm sideeffect "xchg $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %22, i32 0) #8, !srcloc !52
  %24 = icmp slt i32 %23, 0
  br i1 %24, label %25, label %31

25:                                               ; preds = %1
  %26 = ptrtoint i8* %21 to i64
  %27 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %26, i64 129, i64 2147483647) #8, !srcloc !53
  %28 = icmp eq i64 %27, -38
  br i1 %28, label %29, label %31

29:                                               ; preds = %25
  %30 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %26, i64 1, i64 2147483647) #8, !srcloc !53
  br label %31

31:                                               ; preds = %29, %25, %1
  %32 = getelementptr inbounds %struct.aiocb, %struct.aiocb* %8, i64 0, i32 8
  %33 = getelementptr inbounds i8, i8* %0, i64 44
  %34 = bitcast i8* %33 to i32*
  %35 = load i32, i32* %34, align 4, !tbaa !31
  %36 = tail call i32 asm sideeffect "xchg $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %32, i32 %35) #8, !srcloc !52
  %37 = icmp eq i32 %36, 115
  br i1 %37, label %44, label %38

38:                                               ; preds = %31
  %39 = ptrtoint i32* %32 to i64
  %40 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %39, i64 129, i64 2147483647) #8, !srcloc !53
  %41 = icmp eq i64 %40, -38
  br i1 %41, label %42, label %44

42:                                               ; preds = %38
  %43 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %39, i64 1, i64 2147483647) #8, !srcloc !53
  br label %44

44:                                               ; preds = %42, %38, %31
  %45 = tail call i32 asm sideeffect "xchg $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) @__aio_fut, i32 0) #8, !srcloc !52
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %52, label %47

47:                                               ; preds = %44
  %48 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 ptrtoint (i32* @__aio_fut to i64), i64 129, i64 2147483647) #8, !srcloc !53
  %49 = icmp eq i64 %48, -38
  br i1 %49, label %50, label %52

50:                                               ; preds = %47
  %51 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 ptrtoint (i32* @__aio_fut to i64), i64 1, i64 2147483647) #8, !srcloc !53
  br label %52

52:                                               ; preds = %50, %47, %44
  %53 = getelementptr inbounds %struct.aio_queue, %struct.aio_queue* %5, i64 0, i32 5
  %54 = tail call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* noundef nonnull %53) #10
  %55 = getelementptr inbounds i8, i8* %0, i64 16
  %56 = bitcast i8* %55 to %struct.aio_thread**
  %57 = load %struct.aio_thread*, %struct.aio_thread** %56, align 8, !tbaa !44
  %58 = icmp eq %struct.aio_thread* %57, null
  br i1 %58, label %64, label %59

59:                                               ; preds = %52
  %60 = getelementptr inbounds i8, i8* %0, i64 24
  %61 = bitcast i8* %60 to %struct.aio_thread**
  %62 = load %struct.aio_thread*, %struct.aio_thread** %61, align 8, !tbaa !42
  %63 = getelementptr inbounds %struct.aio_thread, %struct.aio_thread* %57, i64 0, i32 3
  store %struct.aio_thread* %62, %struct.aio_thread** %63, align 8, !tbaa !42
  br label %64

64:                                               ; preds = %52, %59
  %65 = getelementptr inbounds i8, i8* %0, i64 24
  %66 = bitcast i8* %65 to %struct.aio_thread**
  %67 = load %struct.aio_thread*, %struct.aio_thread** %66, align 8, !tbaa !42
  %68 = icmp eq %struct.aio_thread* %67, null
  %69 = getelementptr inbounds %struct.aio_queue, %struct.aio_queue* %5, i64 0, i32 7
  %70 = getelementptr inbounds %struct.aio_thread, %struct.aio_thread* %67, i64 0, i32 2
  %71 = select i1 %68, %struct.aio_thread** %69, %struct.aio_thread** %70
  store %struct.aio_thread* %57, %struct.aio_thread** %71, align 8, !tbaa !26
  %72 = getelementptr inbounds %struct.aio_queue, %struct.aio_queue* %5, i64 0, i32 6
  %73 = tail call i32 @pthread_cond_broadcast(%struct.pthread_cond_t* noundef nonnull %72) #10
  tail call fastcc void @__aio_unref_queue(%struct.aio_queue* noundef %5) #7
  switch i32 %14, label %92 [
    i32 0, label %74
    i32 2, label %88
  ]

74:                                               ; preds = %64
  %75 = bitcast %struct.siginfo_t* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %75) #8
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(128) %75, i8 0, i64 128, i1 false) #9
  %76 = getelementptr inbounds %struct.siginfo_t, %struct.siginfo_t* %2, i64 0, i32 0
  store i32 %12, i32* %76, align 8, !tbaa !54
  %77 = getelementptr inbounds %struct.siginfo_t, %struct.siginfo_t* %2, i64 0, i32 2
  store i32 -4, i32* %77, align 8, !tbaa !56
  %78 = getelementptr inbounds %struct.siginfo_t, %struct.siginfo_t* %2, i64 0, i32 3, i32 0, i32 0, i32 0, i32 0
  %79 = tail call i32 @getpid() #10
  store i32 %79, i32* %78, align 8, !tbaa !57
  %80 = getelementptr inbounds %struct.siginfo_t, %struct.siginfo_t* %2, i64 0, i32 3, i32 0, i32 0, i32 0, i32 1
  %81 = tail call i32 @getuid() #10
  store i32 %81, i32* %80, align 4, !tbaa !59
  %82 = getelementptr inbounds %struct.siginfo_t, %struct.siginfo_t* %2, i64 0, i32 3, i32 0, i32 1
  %83 = bitcast %union.anon.10* %82 to i8**
  store i8* %10, i8** %83, align 8, !tbaa.struct !60
  %84 = sext i32 %79 to i64
  %85 = sext i32 %12 to i64
  %86 = ptrtoint %struct.siginfo_t* %2 to i64
  %87 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 129, i64 %84, i64 %85, i64 %86) #8, !srcloc !53
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %75) #8
  br label %92

88:                                               ; preds = %64
  %89 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #12, !srcloc !41
  %90 = inttoptr i64 %89 to %struct.__pthread*
  %91 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %90, i64 0, i32 9
  tail call void asm sideeffect "mov $1, $0 ; lock ; orl $$0,(%rsp)", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %91, i32 0) #8, !srcloc !61
  tail call void %16(i8* %10) #10
  br label %92

92:                                               ; preds = %74, %64, %88
  ret void
}

; Function Attrs: optsize
declare i32 @pthread_cond_wait(%struct.pthread_cond_t* noundef, %struct.pthread_mutex_t* noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i64 @write(i32 noundef, i8* noundef, i64 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i64 @pwrite(i32 noundef, i8* noundef, i64 noundef, i64 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i64 @read(i32 noundef, i8* noundef, i64 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i64 @pread(i32 noundef, i8* noundef, i64 noundef, i64 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @fsync(i32 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @fdatasync(i32 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare void @_pthread_cleanup_pop(%struct.__ptcb* noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @pthread_cond_broadcast(%struct.pthread_cond_t* noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @getpid() local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @getuid() local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @pthread_rwlock_wrlock(%struct.pthread_rwlock_t* noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare hidden void @__libc_free(i8* noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare hidden i64 @__getauxval(i64 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare hidden i8* @__libc_calloc(i64 noundef, i64 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @pthread_mutex_init(%struct.pthread_mutex_t* noundef, %struct.pthread_mutexattr_t* noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @pthread_cond_init(%struct.pthread_cond_t* noundef, %struct.pthread_condattr_t* noundef) local_unnamed_addr #4

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #4 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #6 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #7 = { nobuiltin optsize strictfp "no-builtins" }
attributes #8 = { nounwind strictfp }
attributes #9 = { strictfp }
attributes #10 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #11 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #12 = { nounwind readnone strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"aiocb", !5, i64 0, !5, i64 4, !5, i64 8, !8, i64 16, !9, i64 24, !10, i64 32, !8, i64 96, !6, i64 104, !5, i64 112, !9, i64 120, !9, i64 128, !8, i64 136, !8, i64 144, !6, i64 152}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{!"sigevent", !6, i64 0, !5, i64 8, !5, i64 12, !6, i64 16}
!11 = !{!12, !8, i64 0}
!12 = !{!"aio_args", !8, i64 0, !8, i64 8, !5, i64 16, !13, i64 20}
!13 = !{!"", !6, i64 0}
!14 = !{!12, !8, i64 8}
!15 = !{!12, !5, i64 16}
!16 = !{!5, !5, i64 0}
!17 = !{!4, !9, i64 120}
!18 = !{!4, !5, i64 112}
!19 = !{!20, !5, i64 12}
!20 = !{!"aio_queue", !5, i64 0, !5, i64 4, !5, i64 8, !5, i64 12, !5, i64 16, !13, i64 24, !13, i64 64, !8, i64 112}
!21 = !{!4, !5, i64 44}
!22 = !{!6, !6, i64 0}
!23 = !{i64 0, i64 56, !22, i64 0, i64 56, !22, i64 0, i64 56, !22}
!24 = !{!9, !9, i64 0}
!25 = !{i64 350776}
!26 = !{!8, !8, i64 0}
!27 = !{!28, !8, i64 8}
!28 = !{!"aio_thread", !8, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !5, i64 40, !5, i64 44, !5, i64 48, !9, i64 56}
!29 = !{i64 348906}
!30 = !{!28, !8, i64 0}
!31 = !{!28, !5, i64 44}
!32 = !{!20, !5, i64 0}
!33 = !{i64 350311}
!34 = !{!4, !8, i64 16}
!35 = !{!4, !9, i64 24}
!36 = !{!4, !9, i64 128}
!37 = !{!28, !5, i64 48}
!38 = !{!28, !5, i64 40}
!39 = !{!28, !9, i64 56}
!40 = !{!28, !8, i64 32}
!41 = !{i64 393411}
!42 = !{!28, !8, i64 24}
!43 = !{!20, !8, i64 112}
!44 = !{!28, !8, i64 16}
!45 = !{!20, !5, i64 16}
!46 = !{!20, !5, i64 4}
!47 = !{!20, !5, i64 8}
!48 = !{i64 350457}
!49 = !{i64 0, i64 4, !16, i64 0, i64 8, !26, i64 8, i64 4, !16, i64 12, i64 4, !16, i64 16, i64 48, !22, i64 16, i64 4, !16, i64 16, i64 8, !26, i64 24, i64 8, !26}
!50 = !{i64 0, i64 4, !16, i64 4, i64 48, !22, i64 4, i64 4, !16, i64 4, i64 8, !26, i64 12, i64 8, !26}
!51 = !{i64 0, i64 48, !22, i64 0, i64 4, !16, i64 0, i64 8, !26, i64 8, i64 8, !26}
!52 = !{i64 349306}
!53 = !{i64 336467}
!54 = !{!55, !5, i64 0}
!55 = !{!"", !5, i64 0, !5, i64 4, !5, i64 8, !6, i64 16}
!56 = !{!55, !5, i64 8}
!57 = !{!58, !5, i64 0}
!58 = !{!"", !5, i64 0, !5, i64 4}
!59 = !{!58, !5, i64 4}
!60 = !{i64 0, i64 4, !16, i64 0, i64 8, !26}
!61 = !{i64 350616}
