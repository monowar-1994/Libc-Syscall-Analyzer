; ModuleID = 'src/time/timer_create.c'
source_filename = "src/time/timer_create.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sigevent = type { %union.sigval, i32, i32, %union.anon }
%union.sigval = type { i8* }
%union.anon = type { %struct.anon, [32 x i8] }
%struct.anon = type { void (i8*)*, %struct.pthread_attr_t* }
%struct.pthread_attr_t = type { %union.anon.0 }
%union.anon.0 = type { [7 x i64] }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon.1, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon.1 = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.start_args = type { %struct.pthread_barrier_t, %struct.sigevent* }
%struct.pthread_barrier_t = type { %union.anon.2 }
%union.anon.2 = type { [4 x i8*] }
%struct.ksigevent = type { %union.sigval, i32, i32, i32 }
%struct.__sigset_t = type { [16 x i64] }
%struct.sigaction = type { %union.anon.3, %struct.__sigset_t, i32, void ()* }
%union.anon.3 = type { void (i32)* }
%struct.pthread_barrierattr_t = type { i32 }
%struct.__jmp_buf_tag = type { [8 x i64], i64, [16 x i64] }
%struct.siginfo_t = type { i32, i32, i32, %union.anon.4 }
%union.anon.4 = type { %struct.anon.5, [80 x i8] }
%struct.anon.5 = type { %union.anon.6, %union.anon.9 }
%union.anon.6 = type { %struct.anon.7 }
%struct.anon.7 = type { i32, i32 }
%union.anon.9 = type { %struct.anon.10 }
%struct.anon.10 = type { i32, i64, i64 }

@timer_create.init = internal global i32 0, align 4

@__pthread_tsd_run_dtors = weak hidden alias void (...), bitcast (void ()* @dummy_0 to void (...)*)

; Function Attrs: nounwind optsize strictfp
define i32 @timer_create(i32 noundef %0, %struct.sigevent* noalias noundef %1, i8** noalias nocapture noundef writeonly %2) local_unnamed_addr #0 {
  %4 = alloca %struct.__pthread*, align 8
  %5 = alloca %struct.pthread_attr_t, align 8
  %6 = alloca %struct.start_args, align 8
  %7 = alloca %struct.ksigevent, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.__sigset_t, align 8
  %10 = alloca %struct.sigaction, align 8
  %11 = alloca [1 x i64], align 8
  %12 = bitcast %struct.__pthread** %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %12) #10
  %13 = bitcast %struct.pthread_attr_t* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %13) #10
  %14 = bitcast %struct.start_args* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %14) #10
  %15 = bitcast %struct.ksigevent* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %15) #10
  %16 = bitcast i32* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %16) #10
  %17 = bitcast %struct.__sigset_t* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %17) #10
  %18 = icmp eq %struct.sigevent* %1, null
  br i1 %18, label %39, label %19

19:                                               ; preds = %3
  %20 = getelementptr inbounds %struct.sigevent, %struct.sigevent* %1, i64 0, i32 2
  %21 = load i32, i32* %20, align 4, !tbaa !3
  switch i32 %21, label %104 [
    i32 1, label %22
    i32 0, label %22
    i32 4, label %22
    i32 2, label %49
  ]

22:                                               ; preds = %19, %19, %19
  %23 = bitcast %struct.sigevent* %1 to i64*
  %24 = bitcast %struct.ksigevent* %7 to i64*
  %25 = load i64, i64* %23, align 8
  store i64 %25, i64* %24, align 8
  %26 = getelementptr inbounds %struct.sigevent, %struct.sigevent* %1, i64 0, i32 1
  %27 = load i32, i32* %26, align 8, !tbaa !8
  %28 = getelementptr inbounds %struct.ksigevent, %struct.ksigevent* %7, i64 0, i32 1
  store i32 %27, i32* %28, align 8, !tbaa !9
  %29 = getelementptr inbounds %struct.ksigevent, %struct.ksigevent* %7, i64 0, i32 2
  store i32 %21, i32* %29, align 4, !tbaa !11
  %30 = icmp eq i32 %21, 4
  br i1 %30, label %31, label %35

31:                                               ; preds = %22
  %32 = getelementptr inbounds %struct.sigevent, %struct.sigevent* %1, i64 0, i32 3
  %33 = bitcast %union.anon* %32 to i32*
  %34 = load i32, i32* %33, align 8, !tbaa !12
  br label %35

35:                                               ; preds = %22, %31
  %36 = phi i32 [ %34, %31 ], [ 0, %22 ]
  %37 = getelementptr inbounds %struct.ksigevent, %struct.ksigevent* %7, i64 0, i32 3
  store i32 %36, i32* %37, align 8
  %38 = ptrtoint %struct.ksigevent* %7 to i64
  br label %39

39:                                               ; preds = %3, %35
  %40 = phi i64 [ %38, %35 ], [ 0, %3 ]
  %41 = sext i32 %0 to i64
  %42 = ptrtoint i32* %8 to i64
  %43 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 222, i64 %41, i64 %40, i64 %42) #10, !srcloc !13
  %44 = call i64 @__syscall_ret(i64 noundef %43) #11
  %45 = icmp slt i64 %44, 0
  br i1 %45, label %109, label %46

46:                                               ; preds = %39
  %47 = load i32, i32* %8, align 4, !tbaa !14
  %48 = sext i32 %47 to i64
  br label %106

49:                                               ; preds = %19
  %50 = load volatile i32, i32* @timer_create.init, align 4, !tbaa !14
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %55

52:                                               ; preds = %49
  %53 = bitcast %struct.sigaction* %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 152, i8* nonnull %53) #10
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(152) %53, i8 0, i64 152, i1 false) #12
  %54 = call i32 @__libc_sigaction(i32 noundef 32, %struct.sigaction* noundef nonnull %10, %struct.sigaction* noundef null) #11
  call void asm sideeffect "mov $1, $0 ; lock ; orl $$0,(%rsp)", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) @timer_create.init, i32 1) #10, !srcloc !15
  call void @llvm.lifetime.end.p0i8(i64 152, i8* nonnull %53) #10
  br label %55

55:                                               ; preds = %52, %49
  %56 = getelementptr inbounds %struct.sigevent, %struct.sigevent* %1, i64 0, i32 3, i32 0, i32 1
  %57 = load %struct.pthread_attr_t*, %struct.pthread_attr_t** %56, align 8, !tbaa !12
  %58 = icmp eq %struct.pthread_attr_t* %57, null
  br i1 %58, label %61, label %59

59:                                               ; preds = %55
  %60 = bitcast %struct.pthread_attr_t* %57 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 %13, i8* align 8 %60, i64 56, i1 true) #12, !tbaa.struct !16
  br label %63

61:                                               ; preds = %55
  %62 = call i32 @pthread_attr_init(%struct.pthread_attr_t* noundef nonnull %5) #11
  br label %63

63:                                               ; preds = %61, %59
  %64 = call i32 @pthread_attr_setdetachstate(%struct.pthread_attr_t* noundef nonnull %5, i32 noundef 1) #11
  %65 = getelementptr inbounds %struct.start_args, %struct.start_args* %6, i64 0, i32 0
  %66 = call i32 @pthread_barrier_init(%struct.pthread_barrier_t* noundef nonnull %65, %struct.pthread_barrierattr_t* noundef null, i32 noundef 2) #11
  %67 = getelementptr inbounds %struct.start_args, %struct.start_args* %6, i64 0, i32 1
  store %struct.sigevent* %1, %struct.sigevent** %67, align 8, !tbaa !17
  call void @__block_app_sigs(i8* noundef nonnull %17) #11
  %68 = getelementptr inbounds [1 x i64], [1 x i64]* %11, i64 0, i64 0
  store i64 2147483648, i64* %68, align 8, !tbaa !21
  %69 = ptrtoint [1 x i64]* %11 to i64
  %70 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 14, i64 0, i64 %69, i64 0, i64 8) #10, !srcloc !23
  %71 = call i32 @pthread_create(%struct.__pthread** noundef nonnull %4, %struct.pthread_attr_t* noundef nonnull %5, i8* (i8*)* noundef nonnull @start, i8* noundef nonnull %14) #11
  call void @__restore_sigs(i8* noundef nonnull %17) #11
  %72 = icmp eq i32 %71, 0
  br i1 %72, label %75, label %73

73:                                               ; preds = %63
  %74 = tail call i32* @___errno_location() #13
  store i32 %71, i32* %74, align 4, !tbaa !14
  br label %109

75:                                               ; preds = %63
  %76 = getelementptr inbounds %struct.ksigevent, %struct.ksigevent* %7, i64 0, i32 0, i32 0
  store i8* null, i8** %76, align 8, !tbaa !12
  %77 = getelementptr inbounds %struct.ksigevent, %struct.ksigevent* %7, i64 0, i32 1
  store i32 32, i32* %77, align 8, !tbaa !9
  %78 = getelementptr inbounds %struct.ksigevent, %struct.ksigevent* %7, i64 0, i32 2
  store i32 4, i32* %78, align 4, !tbaa !11
  %79 = load %struct.__pthread*, %struct.__pthread** %4, align 8, !tbaa !24
  %80 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %79, i64 0, i32 6
  %81 = load i32, i32* %80, align 8, !tbaa !25
  %82 = getelementptr inbounds %struct.ksigevent, %struct.ksigevent* %7, i64 0, i32 3
  store i32 %81, i32* %82, align 8, !tbaa !28
  %83 = sext i32 %0 to i64
  %84 = ptrtoint %struct.ksigevent* %7 to i64
  %85 = ptrtoint i32* %8 to i64
  %86 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 222, i64 %83, i64 %84, i64 %85) #10, !srcloc !13
  %87 = call i64 @__syscall_ret(i64 noundef %86) #11
  %88 = icmp slt i64 %87, 0
  br i1 %88, label %91, label %89

89:                                               ; preds = %75
  %90 = load i32, i32* %8, align 4, !tbaa !14
  br label %92

91:                                               ; preds = %75
  store i32 -1, i32* %8, align 4, !tbaa !14
  br label %92

92:                                               ; preds = %89, %91
  %93 = phi i32 [ %90, %89 ], [ -1, %91 ]
  %94 = load %struct.__pthread*, %struct.__pthread** %4, align 8, !tbaa !24
  %95 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %94, i64 0, i32 23
  store volatile i32 %93, i32* %95, align 4, !tbaa !29
  %96 = call i32 @pthread_barrier_wait(%struct.pthread_barrier_t* noundef nonnull %65) #11
  %97 = load i32, i32* %8, align 4, !tbaa !14
  %98 = icmp slt i32 %97, 0
  br i1 %98, label %109, label %99

99:                                               ; preds = %92
  %100 = load %struct.__pthread*, %struct.__pthread** %4, align 8, !tbaa !24
  %101 = ptrtoint %struct.__pthread* %100 to i64
  %102 = lshr i64 %101, 1
  %103 = or i64 %102, -9223372036854775808
  br label %106

104:                                              ; preds = %19
  %105 = tail call i32* @___errno_location() #13
  store i32 22, i32* %105, align 4, !tbaa !14
  br label %109

106:                                              ; preds = %99, %46
  %107 = phi i64 [ %103, %99 ], [ %48, %46 ]
  %108 = inttoptr i64 %107 to i8*
  store i8* %108, i8** %2, align 8, !tbaa !24
  br label %109

109:                                              ; preds = %92, %39, %106, %104, %73
  %110 = phi i32 [ -1, %104 ], [ -1, %73 ], [ 0, %106 ], [ -1, %39 ], [ -1, %92 ]
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %17) #10
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %16) #10
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %15) #10
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %14) #10
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %13) #10
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %12) #10
  ret i32 %110
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: optsize
declare hidden i32 @__libc_sigaction(i32 noundef, %struct.sigaction* noundef, %struct.sigaction* noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @pthread_attr_init(%struct.pthread_attr_t* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @pthread_attr_setdetachstate(%struct.pthread_attr_t* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @pthread_barrier_init(%struct.pthread_barrier_t* noundef, %struct.pthread_barrierattr_t* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden void @__block_app_sigs(i8* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @pthread_create(%struct.__pthread** noundef, %struct.pthread_attr_t* noundef, i8* (i8*)* noundef, i8* noundef) local_unnamed_addr #3

; Function Attrs: nounwind optsize strictfp
define internal i8* @start(i8* noundef %0) #0 {
  %2 = alloca [1 x %struct.__jmp_buf_tag], align 16
  %3 = alloca %struct.siginfo_t, align 8
  %4 = alloca [1 x i64], align 8
  %5 = alloca %struct.__ptcb, align 8
  %6 = call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #14, !srcloc !30
  %7 = inttoptr i64 %6 to %struct.__pthread*
  %8 = bitcast [1 x %struct.__jmp_buf_tag]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 200, i8* nonnull %8) #10
  %9 = getelementptr inbounds i8, i8* %0, i64 32
  %10 = bitcast i8* %9 to %struct.sigevent**
  %11 = load %struct.sigevent*, %struct.sigevent** %10, align 8, !tbaa !17
  %12 = getelementptr inbounds %struct.sigevent, %struct.sigevent* %11, i64 0, i32 3, i32 0, i32 0
  %13 = load void (i8*)*, void (i8*)** %12, align 8, !tbaa !12
  %14 = getelementptr inbounds %struct.sigevent, %struct.sigevent* %11, i64 0, i32 0, i32 0
  %15 = load i8*, i8** %14, align 8, !tbaa.struct !31
  %16 = bitcast i8* %0 to %struct.pthread_barrier_t*
  %17 = call i32 @pthread_barrier_wait(%struct.pthread_barrier_t* noundef %16) #11
  %18 = bitcast %struct.siginfo_t* %3 to i8*
  %19 = getelementptr inbounds [1 x i64], [1 x i64]* %4, i64 0, i64 0
  %20 = bitcast [1 x i64]* %4 to %struct.__sigset_t*
  %21 = getelementptr inbounds %struct.siginfo_t, %struct.siginfo_t* %3, i64 0, i32 2
  %22 = getelementptr inbounds [1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* %2, i64 0, i64 0
  %23 = bitcast %struct.__ptcb* %5 to i8*
  %24 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %7, i64 0, i32 23
  br label %25

25:                                               ; preds = %36, %1
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %18) #10
  br label %26

26:                                               ; preds = %26, %25
  store i64 2147483648, i64* %19, align 8, !tbaa !21
  %27 = call i32 @sigwaitinfo(%struct.__sigset_t* noundef nonnull %20, %struct.siginfo_t* noundef nonnull %3) #11
  %28 = icmp slt i32 %27, 0
  br i1 %28, label %26, label %29

29:                                               ; preds = %26
  %30 = load i32, i32* %21, align 8, !tbaa !32
  %31 = icmp eq i32 %30, -2
  br i1 %31, label %32, label %36

32:                                               ; preds = %29
  %33 = call i32 @setjmp(%struct.__jmp_buf_tag* noundef nonnull %22) #15
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %36

35:                                               ; preds = %32
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %23) #10
  call void @_pthread_cleanup_push(%struct.__ptcb* noundef nonnull %5, void (i8*)* noundef nonnull @cleanup_fromsig, i8* noundef nonnull %8) #11
  call void %13(i8* %15) #11
  call void @_pthread_cleanup_pop(%struct.__ptcb* noundef nonnull %5, i32 noundef 1) #11
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %23) #10
  br label %36

36:                                               ; preds = %35, %32, %29
  %37 = load volatile i32, i32* %24, align 4, !tbaa !29
  %38 = icmp slt i32 %37, 0
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %18) #10
  br i1 %38, label %39, label %25

39:                                               ; preds = %36
  %40 = load volatile i32, i32* %24, align 4, !tbaa !29
  %41 = and i32 %40, 2147483647
  %42 = zext i32 %41 to i64
  %43 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 226, i64 %42) #10, !srcloc !34
  call void @llvm.lifetime.end.p0i8(i64 200, i8* nonnull %8) #10
  ret i8* null
}

; Function Attrs: optsize
declare hidden void @__restore_sigs(i8* noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #5

; Function Attrs: optsize
declare i32 @pthread_barrier_wait(%struct.pthread_barrier_t* noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal void @dummy_0() #6 {
  ret void
}

; Function Attrs: optsize
declare i32 @sigwaitinfo(%struct.__sigset_t* noundef, %struct.siginfo_t* noundef) local_unnamed_addr #3

; Function Attrs: optsize returns_twice
declare i32 @setjmp(%struct.__jmp_buf_tag* noundef) local_unnamed_addr #7

; Function Attrs: optsize
declare void @_pthread_cleanup_push(%struct.__ptcb* noundef, void (i8*)* noundef, i8* noundef) local_unnamed_addr #3

; Function Attrs: noreturn nounwind optsize strictfp
define internal void @cleanup_fromsig(i8* noundef %0) #8 {
  %2 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #14, !srcloc !30
  %3 = inttoptr i64 %2 to %struct.__pthread*
  tail call void (...) @__pthread_tsd_run_dtors() #11
  %4 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %3, i64 0, i32 9
  store volatile i32 0, i32* %4, align 4, !tbaa !35
  %5 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %3, i64 0, i32 19
  store %struct.__ptcb* null, %struct.__ptcb** %5, align 8, !tbaa !36
  %6 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %3, i64 0, i32 10
  store volatile i8 0, i8* %6, align 8, !tbaa !37
  %7 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %3, i64 0, i32 11
  store volatile i8 0, i8* %7, align 1, !tbaa !38
  tail call void (...) @__reset_tls() #11
  %8 = bitcast i8* %0 to %struct.__jmp_buf_tag*
  tail call void @longjmp(%struct.__jmp_buf_tag* noundef %8, i32 noundef 1) #16
  unreachable
}

; Function Attrs: optsize
declare void @_pthread_cleanup_pop(%struct.__ptcb* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden void @__reset_tls(...) local_unnamed_addr #3

; Function Attrs: noreturn optsize
declare void @longjmp(%struct.__jmp_buf_tag* noundef, i32 noundef) local_unnamed_addr #9

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #5 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { optsize returns_twice "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { noreturn nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { noreturn optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nounwind strictfp }
attributes #11 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #12 = { strictfp }
attributes #13 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #14 = { nounwind readnone strictfp }
attributes #15 = { nobuiltin nounwind optsize returns_twice strictfp "no-builtins" }
attributes #16 = { nobuiltin noreturn nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !7, i64 12}
!4 = !{!"sigevent", !5, i64 0, !7, i64 8, !7, i64 12, !5, i64 16}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!"int", !5, i64 0}
!8 = !{!4, !7, i64 8}
!9 = !{!10, !7, i64 8}
!10 = !{!"ksigevent", !5, i64 0, !7, i64 8, !7, i64 12, !7, i64 16}
!11 = !{!10, !7, i64 12}
!12 = !{!5, !5, i64 0}
!13 = !{i64 207995}
!14 = !{!7, !7, i64 0}
!15 = !{i64 236798}
!16 = !{i64 0, i64 56, !12, i64 0, i64 56, !12, i64 0, i64 56, !12}
!17 = !{!18, !20, i64 32}
!18 = !{!"start_args", !19, i64 0, !20, i64 32}
!19 = !{!"", !5, i64 0}
!20 = !{!"any pointer", !5, i64 0}
!21 = !{!22, !22, i64 0}
!22 = !{!"long", !5, i64 0}
!23 = !{i64 208265}
!24 = !{!20, !20, i64 0}
!25 = !{!26, !7, i64 48}
!26 = !{!"__pthread", !20, i64 0, !20, i64 8, !20, i64 16, !20, i64 24, !22, i64 32, !22, i64 40, !7, i64 48, !7, i64 52, !7, i64 56, !7, i64 60, !5, i64 64, !5, i64 65, !5, i64 66, !5, i64 66, !20, i64 72, !22, i64 80, !20, i64 88, !22, i64 96, !22, i64 104, !20, i64 112, !20, i64 120, !20, i64 128, !27, i64 136, !7, i64 160, !7, i64 164, !20, i64 168, !5, i64 176, !20, i64 184, !20, i64 192}
!27 = !{!"", !20, i64 0, !22, i64 8, !20, i64 16}
!28 = !{!10, !7, i64 16}
!29 = !{!26, !7, i64 164}
!30 = !{i64 238112}
!31 = !{i64 0, i64 4, !14, i64 0, i64 8, !24}
!32 = !{!33, !7, i64 8}
!33 = !{!"", !7, i64 0, !7, i64 4, !7, i64 8, !5, i64 16}
!34 = !{i64 207597}
!35 = !{!26, !7, i64 60}
!36 = !{!26, !20, i64 120}
!37 = !{!26, !5, i64 64}
!38 = !{!26, !5, i64 65}
