; ModuleID = 'src/thread/pthread_create.c'
source_filename = "src/thread/pthread_create.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.pthread_attr_t = type { %union.anon.0 }
%union.anon.0 = type { [7 x i64] }
%struct.__sigset_t = type { [16 x i64] }

@__thread_list_lock = external hidden global i32, align 4
@tl_lock_count = internal unnamed_addr global i32 0, align 4
@tl_lock_waiters = internal global i32 0, align 4
@__libc = external hidden global %struct.__libc, align 8
@dummy = internal global i64 0, align 8
@dummy_tsd = internal global [1 x i8*] zeroinitializer, align 8
@dummy_file = internal global %struct._IO_FILE* null, align 8
@__default_stacksize = external hidden local_unnamed_addr global i32, align 4
@__default_guardsize = external hidden local_unnamed_addr global i32, align 4

@__acquire_ptc = weak hidden alias void (), void ()* @dummy_0
@__release_ptc = weak hidden alias void (), void ()* @dummy_0
@__pthread_tsd_run_dtors = weak hidden alias void (...), bitcast (void ()* @dummy_0 to void (...)*)
@__do_orphaned_stdio_locks = weak hidden alias void (), void ()* @dummy_0
@__dl_thread_cleanup = weak hidden alias void (), void ()* @dummy_0
@__membarrier_init = weak hidden alias void (), void ()* @dummy_0
@__pthread_tsd_size = weak hidden alias i64, i64* @dummy
@__pthread_tsd_main = weak hidden alias [1 x i8*], [1 x i8*]* @dummy_tsd
@__stdin_used = weak hidden alias %struct._IO_FILE*, %struct._IO_FILE** @dummy_file
@__stdout_used = weak hidden alias %struct._IO_FILE*, %struct._IO_FILE** @dummy_file
@__stderr_used = weak hidden alias %struct._IO_FILE*, %struct._IO_FILE** @dummy_file
@pthread_exit = weak alias void (i8*), void (i8*)* @__pthread_exit
@pthread_create = weak alias i32 (%struct.__pthread**, %struct.pthread_attr_t*, i8* (i8*)*, i8*), i32 (%struct.__pthread**, %struct.pthread_attr_t*, i8* (i8*)*, i8*)* @__pthread_create

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal void @dummy_0() #0 {
  ret void
}

; Function Attrs: nounwind optsize strictfp
define hidden void @__tl_lock() local_unnamed_addr #1 {
  %1 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #9, !srcloc !3
  %2 = inttoptr i64 %1 to %struct.__pthread*
  %3 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %2, i64 0, i32 6
  %4 = load i32, i32* %3, align 8, !tbaa !4
  %5 = load volatile i32, i32* @__thread_list_lock, align 4, !tbaa !12
  %6 = icmp eq i32 %5, %4
  br i1 %6, label %10, label %7

7:                                                ; preds = %0
  %8 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) @__thread_list_lock, i32 0, i32 %4) #10, !srcloc !13
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %17, label %13

10:                                               ; preds = %0
  %11 = load i32, i32* @tl_lock_count, align 4, !tbaa !12
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* @tl_lock_count, align 4, !tbaa !12
  br label %17

13:                                               ; preds = %7, %13
  %14 = phi i32 [ %15, %13 ], [ %8, %7 ]
  tail call void @__wait(i32* noundef nonnull @__thread_list_lock, i32* noundef nonnull @tl_lock_waiters, i32 noundef %14, i32 noundef 0) #11
  %15 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) @__thread_list_lock, i32 0, i32 %4) #10, !srcloc !13
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %13

17:                                               ; preds = %13, %7, %10
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: optsize
declare hidden void @__wait(i32* noundef, i32* noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind optsize strictfp
define hidden void @__tl_unlock() local_unnamed_addr #1 {
  %1 = load i32, i32* @tl_lock_count, align 4, !tbaa !12
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %5, label %3

3:                                                ; preds = %0
  %4 = add nsw i32 %1, -1
  store i32 %4, i32* @tl_lock_count, align 4, !tbaa !12
  br label %13

5:                                                ; preds = %0
  tail call void asm sideeffect "mov $1, $0 ; lock ; orl $$0,(%rsp)", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) @__thread_list_lock, i32 0) #10, !srcloc !14
  %6 = load i32, i32* @tl_lock_waiters, align 4, !tbaa !12
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %13, label %8

8:                                                ; preds = %5
  %9 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 ptrtoint (i32* @__thread_list_lock to i64), i64 1, i64 1) #10, !srcloc !15
  %10 = icmp eq i64 %9, -38
  br i1 %10, label %11, label %13

11:                                               ; preds = %8
  %12 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 ptrtoint (i32* @__thread_list_lock to i64), i64 1, i64 1) #10, !srcloc !15
  br label %13

13:                                               ; preds = %11, %8, %3, %5
  ret void
}

; Function Attrs: nounwind optsize strictfp
define hidden void @__tl_sync(%struct.__pthread* nocapture noundef readnone %0) local_unnamed_addr #1 {
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #10, !srcloc !16
  %2 = load volatile i32, i32* @__thread_list_lock, align 4, !tbaa !12
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %12, label %4

4:                                                ; preds = %1
  tail call void @__wait(i32* noundef nonnull @__thread_list_lock, i32* noundef nonnull @tl_lock_waiters, i32 noundef %2, i32 noundef 0) #11
  %5 = load i32, i32* @tl_lock_waiters, align 4, !tbaa !12
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %12, label %7

7:                                                ; preds = %4
  %8 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 ptrtoint (i32* @__thread_list_lock to i64), i64 1, i64 1) #10, !srcloc !15
  %9 = icmp eq i64 %8, -38
  br i1 %9, label %10, label %12

10:                                               ; preds = %7
  %11 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 ptrtoint (i32* @__thread_list_lock to i64), i64 1, i64 1) #10, !srcloc !15
  br label %12

12:                                               ; preds = %10, %7, %4, %1
  ret void
}

; Function Attrs: noreturn nounwind optsize strictfp
define hidden void @__pthread_exit(i8* noundef %0) #4 {
  %2 = alloca %struct.__sigset_t, align 8
  %3 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #9, !srcloc !3
  %4 = inttoptr i64 %3 to %struct.__pthread*
  %5 = bitcast %struct.__sigset_t* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %5) #10
  %6 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %4, i64 0, i32 10
  store volatile i8 1, i8* %6, align 8, !tbaa !17
  %7 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %4, i64 0, i32 11
  store volatile i8 0, i8* %7, align 1, !tbaa !18
  %8 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %4, i64 0, i32 18
  store i8* %0, i8** %8, align 8, !tbaa !19
  %9 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %4, i64 0, i32 19
  %10 = load %struct.__ptcb*, %struct.__ptcb** %9, align 8, !tbaa !20
  %11 = icmp eq %struct.__ptcb* %10, null
  br i1 %11, label %22, label %12

12:                                               ; preds = %1, %12
  %13 = phi %struct.__ptcb* [ %20, %12 ], [ %10, %1 ]
  %14 = getelementptr inbounds %struct.__ptcb, %struct.__ptcb* %13, i64 0, i32 0
  %15 = load void (i8*)*, void (i8*)** %14, align 8, !tbaa !21
  %16 = getelementptr inbounds %struct.__ptcb, %struct.__ptcb* %13, i64 0, i32 1
  %17 = load i8*, i8** %16, align 8, !tbaa !23
  %18 = getelementptr inbounds %struct.__ptcb, %struct.__ptcb* %13, i64 0, i32 2
  %19 = load %struct.__ptcb*, %struct.__ptcb** %18, align 8, !tbaa !24
  store %struct.__ptcb* %19, %struct.__ptcb** %9, align 8, !tbaa !20
  tail call void %15(i8* noundef %17) #11
  %20 = load %struct.__ptcb*, %struct.__ptcb** %9, align 8, !tbaa !20
  %21 = icmp eq %struct.__ptcb* %20, null
  br i1 %21, label %22, label %12

22:                                               ; preds = %12, %1
  tail call void (...) @__pthread_tsd_run_dtors() #11
  call void @__block_app_sigs(i8* noundef nonnull %5) #11
  %23 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %4, i64 0, i32 8
  %24 = call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %23, i32 2, i32 1) #10, !srcloc !13
  %25 = icmp eq i32 %24, 3
  br i1 %25, label %26, label %31

26:                                               ; preds = %22
  %27 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %4, i64 0, i32 13
  %28 = load i8*, i8** %27, align 8, !tbaa !25
  %29 = icmp eq i8* %28, null
  br i1 %29, label %31, label %30

30:                                               ; preds = %26
  call void @__vm_wait() #11
  br label %31

31:                                               ; preds = %30, %26, %22
  %32 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %4, i64 0, i32 25, i64 0
  call void @__lock(i32* noundef nonnull %32) #11
  call void @__tl_lock() #12
  %33 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %4, i64 0, i32 3
  %34 = load %struct.__pthread*, %struct.__pthread** %33, align 8, !tbaa !26
  %35 = icmp eq %struct.__pthread* %34, %4
  br i1 %35, label %36, label %37

36:                                               ; preds = %31
  call void @__tl_unlock() #12
  call void @__unlock(i32* noundef nonnull %32) #11
  store volatile i32 %24, i32* %23, align 8, !tbaa !27
  call void @__restore_sigs(i8* noundef nonnull %5) #11
  call void @exit(i32 noundef 0) #13
  unreachable

37:                                               ; preds = %31
  call void @__vm_lock() #11
  %38 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %4, i64 0, i32 21, i32 0
  %39 = load volatile i8*, i8** %38, align 8, !tbaa !28
  %40 = bitcast i8* %39 to i8**
  %41 = icmp ne i8* %39, null
  %42 = icmp ne i8** %38, %40
  %43 = and i1 %41, %42
  br i1 %43, label %44, label %77

44:                                               ; preds = %37
  %45 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %4, i64 0, i32 21, i32 2
  br label %46

46:                                               ; preds = %44, %71
  %47 = phi i8** [ %40, %44 ], [ %73, %71 ]
  %48 = phi i8* [ %39, %44 ], [ %72, %71 ]
  %49 = getelementptr inbounds i8, i8* %48, i64 -32
  %50 = getelementptr inbounds i8, i8* %48, i64 -24
  %51 = bitcast i8* %50 to i32*
  %52 = load volatile i32, i32* %51, align 8, !tbaa !29
  %53 = bitcast i8* %49 to i32*
  %54 = load i32, i32* %53, align 8, !tbaa !29
  store volatile i8* %48, i8** %45, align 8, !tbaa !30
  %55 = load volatile i8*, i8** %47, align 8, !tbaa !31
  store volatile i8* %55, i8** %38, align 8, !tbaa !28
  %56 = getelementptr inbounds i8, i8* %48, i64 -28
  %57 = bitcast i8* %56 to i32*
  %58 = call i32 asm sideeffect "xchg $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %57, i32 1073741824) #10, !srcloc !32
  store volatile i8* null, i8** %45, align 8, !tbaa !30
  %59 = icmp slt i32 %58, 0
  %60 = icmp ne i32 %52, 0
  %61 = select i1 %59, i1 true, i1 %60
  br i1 %61, label %62, label %71

62:                                               ; preds = %46
  %63 = and i32 %54, 128
  %64 = icmp eq i32 %63, 0
  %65 = ptrtoint i8* %56 to i64
  %66 = select i1 %64, i64 129, i64 1
  %67 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %65, i64 %66, i64 1) #10, !srcloc !15
  %68 = icmp eq i64 %67, -38
  br i1 %68, label %69, label %71

69:                                               ; preds = %62
  %70 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %65, i64 1, i64 1) #10, !srcloc !15
  br label %71

71:                                               ; preds = %69, %62, %46
  %72 = load volatile i8*, i8** %38, align 8, !tbaa !28
  %73 = bitcast i8* %72 to i8**
  %74 = icmp ne i8* %72, null
  %75 = icmp ne i8** %38, %73
  %76 = and i1 %74, %75
  br i1 %76, label %46, label %77

77:                                               ; preds = %71, %37
  call void @__vm_unlock() #11
  call void @__do_orphaned_stdio_locks() #11
  call void @__dl_thread_cleanup() #11
  %78 = load i32, i32* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 4), align 4, !tbaa !33
  %79 = add nsw i32 %78, -1
  store i32 %79, i32* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 4), align 4, !tbaa !33
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %81, label %82

81:                                               ; preds = %77
  store volatile i8 -1, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 3), align 1, !tbaa !36
  br label %82

82:                                               ; preds = %81, %77
  %83 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %4, i64 0, i32 2
  %84 = load %struct.__pthread*, %struct.__pthread** %83, align 8, !tbaa !37
  %85 = load %struct.__pthread*, %struct.__pthread** %33, align 8, !tbaa !26
  %86 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %85, i64 0, i32 2
  store %struct.__pthread* %84, %struct.__pthread** %86, align 8, !tbaa !37
  %87 = load %struct.__pthread*, %struct.__pthread** %83, align 8, !tbaa !37
  %88 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %87, i64 0, i32 3
  store %struct.__pthread* %85, %struct.__pthread** %88, align 8, !tbaa !26
  store %struct.__pthread* %4, %struct.__pthread** %33, align 8, !tbaa !26
  store %struct.__pthread* %4, %struct.__pthread** %83, align 8, !tbaa !37
  br i1 %25, label %89, label %103

89:                                               ; preds = %82
  %90 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %4, i64 0, i32 13
  %91 = load i8*, i8** %90, align 8, !tbaa !25
  %92 = icmp eq i8* %91, null
  br i1 %92, label %103, label %93

93:                                               ; preds = %89
  call void @__block_all_sigs(i8* noundef nonnull %5) #11
  %94 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %4, i64 0, i32 21, i32 1
  %95 = load i64, i64* %94, align 8, !tbaa !38
  %96 = icmp eq i64 %95, 0
  br i1 %96, label %99, label %97

97:                                               ; preds = %93
  %98 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 273, i64 0, i64 24) #10, !srcloc !39
  br label %99

99:                                               ; preds = %97, %93
  %100 = load i8*, i8** %90, align 8, !tbaa !25
  %101 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %4, i64 0, i32 14
  %102 = load i64, i64* %101, align 8, !tbaa !40
  call void @__unmapself(i8* noundef %100, i64 noundef %102) #11
  br label %103

103:                                              ; preds = %99, %89, %82
  call void asm sideeffect "mov $1, $0 ; lock ; orl $$0,(%rsp)", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %23, i32 0) #10, !srcloc !14
  %104 = ptrtoint i32* %23 to i64
  %105 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %104, i64 129, i64 1) #10, !srcloc !15
  %106 = icmp eq i64 %105, -38
  br i1 %106, label %107, label %109

107:                                              ; preds = %103
  %108 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %104, i64 1, i64 1) #10, !srcloc !15
  br label %109

109:                                              ; preds = %103, %107
  %110 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %4, i64 0, i32 6
  store i32 0, i32* %110, align 8, !tbaa !4
  call void @__unlock(i32* noundef nonnull %32) #11
  br label %111

111:                                              ; preds = %111, %109
  %112 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 60, i64 0) #10, !srcloc !41
  br label %111
}

; Function Attrs: optsize
declare hidden void @__block_app_sigs(i8* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden void @__vm_wait() local_unnamed_addr #3

; Function Attrs: optsize
declare hidden void @__lock(i32* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden void @__unlock(i32* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden void @__restore_sigs(i8* noundef) local_unnamed_addr #3

; Function Attrs: noreturn optsize
declare void @exit(i32 noundef) local_unnamed_addr #5

; Function Attrs: optsize
declare hidden void @__vm_lock() local_unnamed_addr #3

; Function Attrs: optsize
declare hidden void @__vm_unlock() local_unnamed_addr #3

; Function Attrs: optsize
declare hidden void @__block_all_sigs(i8* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden void @__unmapself(i8* noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: nounwind optsize strictfp
define hidden void @__do_cleanup_push(%struct.__ptcb* noundef %0) local_unnamed_addr #1 {
  %2 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #9, !srcloc !3
  %3 = inttoptr i64 %2 to %struct.__pthread*
  %4 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %3, i64 0, i32 19
  %5 = load %struct.__ptcb*, %struct.__ptcb** %4, align 8, !tbaa !20
  %6 = getelementptr inbounds %struct.__ptcb, %struct.__ptcb* %0, i64 0, i32 2
  store %struct.__ptcb* %5, %struct.__ptcb** %6, align 8, !tbaa !24
  store %struct.__ptcb* %0, %struct.__ptcb** %4, align 8, !tbaa !20
  ret void
}

; Function Attrs: nounwind optsize strictfp
define hidden void @__do_cleanup_pop(%struct.__ptcb* nocapture noundef readonly %0) local_unnamed_addr #1 {
  %2 = getelementptr inbounds %struct.__ptcb, %struct.__ptcb* %0, i64 0, i32 2
  %3 = load %struct.__ptcb*, %struct.__ptcb** %2, align 8, !tbaa !24
  %4 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #9, !srcloc !3
  %5 = inttoptr i64 %4 to %struct.__pthread*
  %6 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %5, i64 0, i32 19
  store %struct.__ptcb* %3, %struct.__ptcb** %6, align 8, !tbaa !20
  ret void
}

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__pthread_create(%struct.__pthread** noalias nocapture noundef writeonly %0, %struct.pthread_attr_t* noalias noundef %1, i8* (i8*)* noundef %2, i8* noalias noundef %3) #1 {
  %5 = alloca %struct.pthread_attr_t, align 8
  %6 = alloca %struct.__sigset_t, align 8
  %7 = alloca [1 x i64], align 8
  %8 = icmp eq %struct.pthread_attr_t* %1, inttoptr (i64 -1 to %struct.pthread_attr_t*)
  %9 = bitcast %struct.pthread_attr_t* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %9) #10
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(56) %9, i8 0, i64 56, i1 false) #14
  %10 = bitcast %struct.__sigset_t* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %10) #10
  %11 = load i8, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 0), align 8, !tbaa !42
  %12 = icmp eq i8 %11, 0
  br i1 %12, label %286, label %13

13:                                               ; preds = %4
  %14 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #9, !srcloc !3
  %15 = inttoptr i64 %14 to %struct.__pthread*
  %16 = load i8, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 1), align 1, !tbaa !43
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %18, label %61

18:                                               ; preds = %13
  %19 = tail call %struct._IO_FILE** @__ofl_lock() #11
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** %19, align 8, !tbaa !31
  %21 = icmp eq %struct._IO_FILE* %20, null
  br i1 %21, label %22, label %51

22:                                               ; preds = %57, %18
  tail call void @__ofl_unlock() #11
  %23 = load volatile %struct._IO_FILE*, %struct._IO_FILE** @__stdin_used, align 8, !tbaa !31
  %24 = icmp eq %struct._IO_FILE* %23, null
  br i1 %24, label %30, label %25

25:                                               ; preds = %22
  %26 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %23, i64 0, i32 19
  %27 = load volatile i32, i32* %26, align 4, !tbaa !44
  %28 = icmp slt i32 %27, 0
  br i1 %28, label %29, label %30

29:                                               ; preds = %25
  store volatile i32 0, i32* %26, align 4, !tbaa !44
  br label %30

30:                                               ; preds = %22, %25, %29
  %31 = load volatile %struct._IO_FILE*, %struct._IO_FILE** @__stdout_used, align 8, !tbaa !31
  %32 = icmp eq %struct._IO_FILE* %31, null
  br i1 %32, label %38, label %33

33:                                               ; preds = %30
  %34 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %31, i64 0, i32 19
  %35 = load volatile i32, i32* %34, align 4, !tbaa !44
  %36 = icmp slt i32 %35, 0
  br i1 %36, label %37, label %38

37:                                               ; preds = %33
  store volatile i32 0, i32* %34, align 4, !tbaa !44
  br label %38

38:                                               ; preds = %30, %33, %37
  %39 = load volatile %struct._IO_FILE*, %struct._IO_FILE** @__stderr_used, align 8, !tbaa !31
  %40 = icmp eq %struct._IO_FILE* %39, null
  br i1 %40, label %46, label %41

41:                                               ; preds = %38
  %42 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %39, i64 0, i32 19
  %43 = load volatile i32, i32* %42, align 4, !tbaa !44
  %44 = icmp slt i32 %43, 0
  br i1 %44, label %45, label %46

45:                                               ; preds = %41
  store volatile i32 0, i32* %42, align 4, !tbaa !44
  br label %46

46:                                               ; preds = %38, %41, %45
  %47 = getelementptr inbounds [1 x i64], [1 x i64]* %7, i64 0, i64 0
  store i64 12884901888, i64* %47, align 8, !tbaa !46
  %48 = ptrtoint [1 x i64]* %7 to i64
  %49 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 14, i64 1, i64 %48, i64 0, i64 8) #10, !srcloc !47
  %50 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %15, i64 0, i32 20
  store i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pthread_tsd_main, i64 0, i64 0), i8*** %50, align 8, !tbaa !48
  call void @__membarrier_init() #11
  store i8 1, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 1), align 1, !tbaa !43
  br label %61

51:                                               ; preds = %18, %57
  %52 = phi %struct._IO_FILE* [ %59, %57 ], [ %20, %18 ]
  %53 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %52, i64 0, i32 19
  %54 = load volatile i32, i32* %53, align 4, !tbaa !44
  %55 = icmp slt i32 %54, 0
  br i1 %55, label %56, label %57

56:                                               ; preds = %51
  store volatile i32 0, i32* %53, align 4, !tbaa !44
  br label %57

57:                                               ; preds = %51, %56
  %58 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %52, i64 0, i32 14
  %59 = load %struct._IO_FILE*, %struct._IO_FILE** %58, align 8, !tbaa !31
  %60 = icmp eq %struct._IO_FILE* %59, null
  br i1 %60, label %22, label %51

61:                                               ; preds = %46, %13
  %62 = ptrtoint %struct.pthread_attr_t* %1 to i64
  switch i64 %62, label %63 [
    i64 -1, label %65
    i64 0, label %65
  ]

63:                                               ; preds = %61
  %64 = bitcast %struct.pthread_attr_t* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 %9, i8* align 8 %64, i64 56, i1 true) #14, !tbaa.struct !49
  br label %65

65:                                               ; preds = %61, %61, %63
  call void @__acquire_ptc() #11
  switch i64 %62, label %73 [
    i64 -1, label %66
    i64 0, label %66
  ]

66:                                               ; preds = %65, %65
  %67 = load i32, i32* @__default_stacksize, align 4, !tbaa !12
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %5, i64 0, i32 0, i32 0, i64 0
  store i64 %68, i64* %69, align 8, !tbaa !29
  %70 = load i32, i32* @__default_guardsize, align 4, !tbaa !12
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %5, i64 0, i32 0, i32 0, i64 1
  store i64 %71, i64* %72, align 8, !tbaa !29
  br label %73

73:                                               ; preds = %65, %66
  %74 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %5, i64 0, i32 0, i32 0, i64 2
  %75 = load i64, i64* %74, align 8, !tbaa !29
  %76 = icmp eq i64 %75, 0
  br i1 %76, label %102, label %77

77:                                               ; preds = %73
  %78 = load i64, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 7), align 8, !tbaa !50
  %79 = load volatile i64, i64* @__pthread_tsd_size, align 8, !tbaa !46
  %80 = add i64 %79, %78
  %81 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %5, i64 0, i32 0, i32 0, i64 0
  %82 = load i64, i64* %81, align 8, !tbaa !29
  %83 = and i64 %75, -16
  %84 = inttoptr i64 %83 to i8*
  %85 = sub i64 %75, %82
  %86 = inttoptr i64 %85 to i8*
  %87 = lshr i64 %82, 3
  %88 = icmp ult i64 %80, %87
  %89 = icmp ult i64 %80, 2048
  %90 = and i1 %89, %88
  br i1 %90, label %94, label %91

91:                                               ; preds = %77
  %92 = add i64 %80, 4095
  %93 = and i64 %92, -4096
  br label %130

94:                                               ; preds = %77
  %95 = load volatile i64, i64* @__pthread_tsd_size, align 8, !tbaa !46
  %96 = sub i64 0, %95
  %97 = getelementptr inbounds i8, i8* %84, i64 %96
  %98 = sub i64 0, %78
  %99 = getelementptr inbounds i8, i8* %97, i64 %98
  %100 = call i8* @memset(i8* noundef %99, i32 noundef 0, i64 noundef %80) #11
  %101 = icmp eq i64 %83, 0
  br i1 %101, label %130, label %156

102:                                              ; preds = %73
  %103 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %5, i64 0, i32 0, i32 0, i64 1
  %104 = load i64, i64* %103, align 8, !tbaa !29
  %105 = add i64 %104, 4095
  %106 = and i64 %105, -4096
  %107 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %5, i64 0, i32 0, i32 0, i64 0
  %108 = load i64, i64* %107, align 8, !tbaa !29
  %109 = load i64, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 7), align 8, !tbaa !50
  %110 = load volatile i64, i64* @__pthread_tsd_size, align 8, !tbaa !46
  %111 = add i64 %108, 4095
  %112 = add i64 %111, %109
  %113 = add i64 %112, %110
  %114 = and i64 %113, -4096
  %115 = add i64 %114, %106
  %116 = icmp eq i64 %106, 0
  br i1 %116, label %130, label %117

117:                                              ; preds = %102
  %118 = call i8* @__mmap(i8* noundef null, i64 noundef %115, i32 noundef 0, i32 noundef 34, i32 noundef -1, i64 noundef 0) #11
  %119 = icmp eq i8* %118, inttoptr (i64 -1 to i8*)
  br i1 %119, label %285, label %120

120:                                              ; preds = %117
  %121 = getelementptr inbounds i8, i8* %118, i64 %106
  %122 = call i32 @__mprotect(i8* noundef nonnull %121, i64 noundef %114, i32 noundef 3) #11
  %123 = icmp eq i32 %122, 0
  br i1 %123, label %136, label %124

124:                                              ; preds = %120
  %125 = tail call i32* @___errno_location() #15
  %126 = load i32, i32* %125, align 4, !tbaa !12
  %127 = icmp eq i32 %126, 38
  br i1 %127, label %136, label %128

128:                                              ; preds = %124
  %129 = call i32 @__munmap(i8* noundef %118, i64 noundef %115) #11
  br label %285

130:                                              ; preds = %94, %91, %102
  %131 = phi i8* [ null, %102 ], [ %84, %91 ], [ %99, %94 ]
  %132 = phi i8* [ undef, %102 ], [ %86, %91 ], [ %86, %94 ]
  %133 = phi i64 [ %115, %102 ], [ %93, %91 ], [ %82, %94 ]
  %134 = call i8* @__mmap(i8* noundef null, i64 noundef %133, i32 noundef 3, i32 noundef 34, i32 noundef -1, i64 noundef 0) #11
  %135 = icmp eq i8* %134, inttoptr (i64 -1 to i8*)
  br i1 %135, label %285, label %141

136:                                              ; preds = %124, %120
  %137 = getelementptr inbounds i8, i8* %118, i64 %115
  %138 = load volatile i64, i64* @__pthread_tsd_size, align 8, !tbaa !46
  %139 = sub i64 0, %138
  %140 = getelementptr inbounds i8, i8* %137, i64 %139
  br label %147

141:                                              ; preds = %130
  %142 = getelementptr inbounds i8, i8* %134, i64 %133
  %143 = load volatile i64, i64* @__pthread_tsd_size, align 8, !tbaa !46
  %144 = sub i64 0, %143
  %145 = getelementptr inbounds i8, i8* %142, i64 %144
  %146 = icmp eq i8* %131, null
  br i1 %146, label %147, label %156

147:                                              ; preds = %136, %141
  %148 = phi i8* [ %140, %136 ], [ %145, %141 ]
  %149 = phi i8* [ %118, %136 ], [ %134, %141 ]
  %150 = phi i64 [ %115, %136 ], [ %133, %141 ]
  %151 = phi i64 [ %106, %136 ], [ 0, %141 ]
  %152 = load i64, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 7), align 8, !tbaa !50
  %153 = sub i64 0, %152
  %154 = getelementptr inbounds i8, i8* %148, i64 %153
  %155 = getelementptr inbounds i8, i8* %149, i64 %151
  br label %156

156:                                              ; preds = %141, %147, %94
  %157 = phi i64 [ %82, %94 ], [ %133, %141 ], [ %150, %147 ]
  %158 = phi i64 [ 0, %94 ], [ 0, %141 ], [ %151, %147 ]
  %159 = phi i8* [ null, %94 ], [ %134, %141 ], [ %149, %147 ]
  %160 = phi i8* [ %99, %94 ], [ %131, %141 ], [ %154, %147 ]
  %161 = phi i8* [ %97, %94 ], [ %145, %141 ], [ %148, %147 ]
  %162 = phi i8* [ %86, %94 ], [ %132, %141 ], [ %155, %147 ]
  %163 = load i64, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 7), align 8, !tbaa !50
  %164 = sub i64 0, %163
  %165 = getelementptr inbounds i8, i8* %161, i64 %164
  %166 = call i8* @__copy_tls(i8* noundef %165) #11
  %167 = getelementptr inbounds i8, i8* %166, i64 72
  %168 = bitcast i8* %167 to i8**
  store i8* %159, i8** %168, align 8, !tbaa !25
  %169 = getelementptr inbounds i8, i8* %166, i64 80
  %170 = bitcast i8* %169 to i64*
  store i64 %157, i64* %170, align 8, !tbaa !40
  %171 = getelementptr inbounds i8, i8* %166, i64 88
  %172 = bitcast i8* %171 to i8**
  store i8* %160, i8** %172, align 8, !tbaa !51
  %173 = ptrtoint i8* %160 to i64
  %174 = ptrtoint i8* %162 to i64
  %175 = sub i64 %173, %174
  %176 = getelementptr inbounds i8, i8* %166, i64 96
  %177 = bitcast i8* %176 to i64*
  store i64 %175, i64* %177, align 8, !tbaa !52
  %178 = getelementptr inbounds i8, i8* %166, i64 104
  %179 = bitcast i8* %178 to i64*
  store i64 %158, i64* %179, align 8, !tbaa !53
  %180 = bitcast i8* %166 to i8**
  store i8* %166, i8** %180, align 8, !tbaa !54
  %181 = getelementptr inbounds i8, i8* %166, i64 128
  %182 = bitcast i8* %181 to i8**
  store i8* %161, i8** %182, align 8, !tbaa !48
  %183 = getelementptr inbounds i8, i8* %166, i64 168
  %184 = bitcast i8* %183 to %struct.__locale_struct**
  store %struct.__locale_struct* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 11), %struct.__locale_struct** %184, align 8, !tbaa !55
  %185 = bitcast %struct.pthread_attr_t* %5 to [14 x i32]*
  %186 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %5, i64 0, i32 0, i32 0, i64 3
  %187 = bitcast i64* %186 to i32*
  %188 = load i32, i32* %187, align 8, !tbaa !29
  %189 = icmp eq i32 %188, 0
  %190 = getelementptr inbounds i8, i8* %166, i64 56
  %191 = bitcast i8* %190 to i32*
  %192 = select i1 %189, i32 2, i32 3
  store volatile i32 %192, i32* %191, align 8, !tbaa !27
  %193 = getelementptr inbounds i8, i8* %166, i64 136
  %194 = bitcast i8* %193 to i8**
  store volatile i8* %193, i8** %194, align 8, !tbaa !28
  %195 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %15, i64 0, i32 4
  %196 = bitcast i64* %195 to <2 x i64>*
  %197 = load <2 x i64>, <2 x i64>* %196, align 8, !tbaa !46
  %198 = getelementptr inbounds i8, i8* %166, i64 32
  %199 = bitcast i8* %198 to <2 x i64>*
  store <2 x i64> %197, <2 x i64>* %199, align 8, !tbaa !46
  %200 = and i64 %173, 7
  %201 = sub nsw i64 0, %200
  %202 = getelementptr inbounds i8, i8* %160, i64 %201
  %203 = getelementptr inbounds i8, i8* %202, i64 -32
  %204 = bitcast i8* %203 to i8* (i8*)**
  store i8* (i8*)* %2, i8* (i8*)** %204, align 8, !tbaa !56
  %205 = getelementptr inbounds i8, i8* %203, i64 8
  %206 = bitcast i8* %205 to i8**
  store i8* %3, i8** %206, align 8, !tbaa !58
  %207 = getelementptr inbounds [14 x i32], [14 x i32]* %185, i64 0, i64 7
  %208 = load i32, i32* %207, align 4, !tbaa !29
  %209 = icmp ne i32 %208, 0
  %210 = zext i1 %209 to i32
  %211 = getelementptr inbounds i8, i8* %203, i64 16
  %212 = bitcast i8* %211 to i32*
  store volatile i32 %210, i32* %212, align 8, !tbaa !59
  call void @__block_app_sigs(i8* noundef nonnull %10) #11
  %213 = getelementptr inbounds i8, i8* %203, i64 24
  %214 = call i8* @memcpy(i8* noundef nonnull %213, i8* noundef nonnull %10, i64 noundef 8) #11
  %215 = bitcast i8* %213 to i64*
  %216 = load i64, i64* %215, align 8, !tbaa !46
  %217 = and i64 %216, -4294967297
  store i64 %217, i64* %215, align 8, !tbaa !46
  call void @__tl_lock() #12
  %218 = load i32, i32* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 4), align 4, !tbaa !33
  %219 = add nsw i32 %218, 1
  store i32 %219, i32* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 4), align 4, !tbaa !33
  %220 = icmp eq i32 %218, 0
  br i1 %220, label %221, label %222

221:                                              ; preds = %156
  store volatile i8 1, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 3), align 1, !tbaa !36
  br label %222

222:                                              ; preds = %221, %156
  %223 = select i1 %8, i32 (i8*)* @start_c11, i32 (i8*)* @start
  %224 = getelementptr inbounds i8, i8* %166, i64 48
  %225 = bitcast i8* %224 to i32*
  %226 = call i32 (i32 (i8*)*, i8*, i32, i8*, ...) @__clone(i32 (i8*)* noundef nonnull %223, i8* noundef nonnull %203, i32 noundef 8195840, i8* noundef nonnull %203, i8* noundef nonnull %224, i8* noundef nonnull %166, i32* noundef nonnull @__thread_list_lock) #11
  %227 = icmp slt i32 %226, 0
  br i1 %227, label %268, label %228

228:                                              ; preds = %222
  %229 = load i32, i32* %207, align 4, !tbaa !29
  %230 = icmp eq i32 %229, 0
  br i1 %230, label %255, label %231

231:                                              ; preds = %228
  %232 = load i32, i32* %225, align 8, !tbaa !4
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %5, i64 0, i32 0, i32 0, i64 4
  %235 = bitcast i64* %234 to i32*
  %236 = load i32, i32* %235, align 8, !tbaa !29
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds [14 x i32], [14 x i32]* %185, i64 0, i64 9
  %239 = ptrtoint i32* %238 to i64
  %240 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 144, i64 %233, i64 %237, i64 %239) #10, !srcloc !15
  %241 = trunc i64 %240 to i32
  %242 = icmp eq i32 %241, 0
  %243 = select i1 %242, i32 0, i32 3
  %244 = call i32 asm sideeffect "xchg $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %212, i32 %243) #10, !srcloc !32
  %245 = icmp eq i32 %244, 2
  br i1 %245, label %246, label %252

246:                                              ; preds = %231
  %247 = ptrtoint i8* %211 to i64
  %248 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %247, i64 129, i64 1) #10, !srcloc !15
  %249 = icmp eq i64 %248, -38
  br i1 %249, label %250, label %252

250:                                              ; preds = %246
  %251 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %247, i64 1, i64 1) #10, !srcloc !15
  br label %252

252:                                              ; preds = %250, %246, %231
  br i1 %242, label %255, label %253

253:                                              ; preds = %252
  call void @__wait(i32* noundef nonnull %212, i32* noundef null, i32 noundef 3, i32 noundef 0) #11
  %254 = icmp sgt i32 %241, -1
  br i1 %254, label %255, label %268

255:                                              ; preds = %228, %252, %253
  %256 = phi i32 [ %241, %253 ], [ %226, %228 ], [ 0, %252 ]
  %257 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %15, i64 0, i32 3
  %258 = load %struct.__pthread*, %struct.__pthread** %257, align 8, !tbaa !26
  %259 = getelementptr inbounds i8, i8* %166, i64 24
  %260 = bitcast i8* %259 to %struct.__pthread**
  store %struct.__pthread* %258, %struct.__pthread** %260, align 8, !tbaa !26
  %261 = getelementptr inbounds i8, i8* %166, i64 16
  %262 = bitcast i8* %261 to %struct.__pthread**
  store %struct.__pthread* %15, %struct.__pthread** %262, align 8, !tbaa !37
  %263 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %258, i64 0, i32 2
  %264 = bitcast %struct.__pthread** %263 to i8**
  store i8* %166, i8** %264, align 8, !tbaa !37
  %265 = load %struct.__pthread*, %struct.__pthread** %262, align 8, !tbaa !37
  %266 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %265, i64 0, i32 3
  %267 = bitcast %struct.__pthread** %266 to i8**
  store i8* %166, i8** %267, align 8, !tbaa !26
  br label %274

268:                                              ; preds = %222, %253
  %269 = phi i32 [ %241, %253 ], [ -11, %222 ]
  %270 = load i32, i32* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 4), align 4, !tbaa !33
  %271 = add nsw i32 %270, -1
  store i32 %271, i32* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 4), align 4, !tbaa !33
  %272 = icmp eq i32 %271, 0
  br i1 %272, label %273, label %274

273:                                              ; preds = %268
  store volatile i8 0, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 3), align 1, !tbaa !36
  br label %274

274:                                              ; preds = %268, %273, %255
  %275 = phi i32 [ %269, %268 ], [ %269, %273 ], [ %256, %255 ]
  call void @__tl_unlock() #12
  call void @__restore_sigs(i8* noundef nonnull %10) #11
  call void @__release_ptc() #11
  %276 = icmp slt i32 %275, 0
  br i1 %276, label %277, label %283

277:                                              ; preds = %274
  %278 = icmp eq i8* %159, null
  br i1 %278, label %281, label %279

279:                                              ; preds = %277
  %280 = call i32 @__munmap(i8* noundef nonnull %159, i64 noundef %157) #11
  br label %281

281:                                              ; preds = %279, %277
  %282 = sub nsw i32 0, %275
  br label %286

283:                                              ; preds = %274
  %284 = bitcast %struct.__pthread** %0 to i8**
  store i8* %166, i8** %284, align 8, !tbaa !31
  br label %286

285:                                              ; preds = %130, %117, %128
  call void @__release_ptc() #11
  br label %286

286:                                              ; preds = %4, %285, %283, %281
  %287 = phi i32 [ %282, %281 ], [ 0, %283 ], [ 11, %285 ], [ 38, %4 ]
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %10) #10
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %9) #10
  ret i32 %287
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: optsize
declare hidden %struct._IO_FILE** @__ofl_lock() local_unnamed_addr #3

; Function Attrs: optsize
declare hidden void @__ofl_unlock() local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #7

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden i8* @__mmap(i8* noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden i32 @__mprotect(i8* noundef, i64 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #8

; Function Attrs: optsize
declare hidden i32 @__munmap(i8* noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden i8* @__copy_tls(i8* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden i32 @__clone(i32 (i8*)* noundef, i8* noundef, i32 noundef, i8* noundef, ...) local_unnamed_addr #3

; Function Attrs: noreturn nounwind optsize strictfp
define internal i32 @start_c11(i8* nocapture noundef readonly %0) #4 {
  %2 = bitcast i8* %0 to i32 (i8*)**
  %3 = load i32 (i8*)*, i32 (i8*)** %2, align 8, !tbaa !56
  %4 = getelementptr inbounds i8, i8* %0, i64 8
  %5 = bitcast i8* %4 to i8**
  %6 = load i8*, i8** %5, align 8, !tbaa !58
  %7 = tail call i32 %3(i8* noundef %6) #11
  %8 = sext i32 %7 to i64
  %9 = inttoptr i64 %8 to i8*
  tail call void @__pthread_exit(i8* noundef %9) #16
  unreachable
}

; Function Attrs: noreturn nounwind optsize strictfp
define internal i32 @start(i8* noundef %0) #4 {
  %2 = getelementptr inbounds i8, i8* %0, i64 16
  %3 = bitcast i8* %2 to i32*
  %4 = load volatile i32, i32* %3, align 8, !tbaa !59
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %18, label %6

6:                                                ; preds = %1
  %7 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %3, i32 1, i32 2) #10, !srcloc !13
  %8 = icmp eq i32 %7, 1
  br i1 %8, label %9, label %10

9:                                                ; preds = %6
  tail call void @__wait(i32* noundef nonnull %3, i32* noundef null, i32 noundef 2, i32 noundef 1) #11
  br label %10

10:                                               ; preds = %9, %6
  %11 = load volatile i32, i32* %3, align 8, !tbaa !59
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %18, label %13

13:                                               ; preds = %10
  %14 = ptrtoint i8* %2 to i64
  %15 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 218, i64 %14) #10, !srcloc !41
  br label %16

16:                                               ; preds = %16, %13
  %17 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 60, i64 0) #10, !srcloc !41
  br label %16

18:                                               ; preds = %10, %1
  %19 = getelementptr inbounds i8, i8* %0, i64 24
  %20 = ptrtoint i8* %19 to i64
  %21 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 14, i64 2, i64 %20, i64 0, i64 8) #10, !srcloc !47
  %22 = bitcast i8* %0 to i8* (i8*)**
  %23 = load i8* (i8*)*, i8* (i8*)** %22, align 8, !tbaa !56
  %24 = getelementptr inbounds i8, i8* %0, i64 8
  %25 = bitcast i8* %24 to i8**
  %26 = load i8*, i8** %25, align 8, !tbaa !58
  %27 = tail call i8* %23(i8* noundef %26) #11
  tail call void @__pthread_exit(i8* noundef %27) #16
  unreachable
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #7 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #8 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nounwind readnone strictfp }
attributes #10 = { nounwind strictfp }
attributes #11 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #12 = { nobuiltin optsize strictfp "no-builtins" }
attributes #13 = { nobuiltin noreturn nounwind optsize strictfp "no-builtins" }
attributes #14 = { strictfp }
attributes #15 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #16 = { nobuiltin noreturn optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 258044}
!4 = !{!5, !10, i64 48}
!5 = !{!"__pthread", !6, i64 0, !6, i64 8, !6, i64 16, !6, i64 24, !9, i64 32, !9, i64 40, !10, i64 48, !10, i64 52, !10, i64 56, !10, i64 60, !7, i64 64, !7, i64 65, !7, i64 66, !7, i64 66, !6, i64 72, !9, i64 80, !6, i64 88, !9, i64 96, !9, i64 104, !6, i64 112, !6, i64 120, !6, i64 128, !11, i64 136, !10, i64 160, !10, i64 164, !6, i64 168, !7, i64 176, !6, i64 184, !6, i64 192}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"long", !7, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = !{!"", !6, i64 0, !9, i64 8, !6, i64 16}
!12 = !{!10, !10, i64 0}
!13 = !{i64 255020}
!14 = !{i64 256730}
!15 = !{i64 231988}
!16 = !{i64 256890}
!17 = !{!5, !7, i64 64}
!18 = !{!5, !7, i64 65}
!19 = !{!5, !6, i64 112}
!20 = !{!5, !6, i64 120}
!21 = !{!22, !6, i64 0}
!22 = !{!"__ptcb", !6, i64 0, !6, i64 8, !6, i64 16}
!23 = !{!22, !6, i64 8}
!24 = !{!22, !6, i64 16}
!25 = !{!5, !6, i64 72}
!26 = !{!5, !6, i64 24}
!27 = !{!5, !10, i64 56}
!28 = !{!5, !6, i64 136}
!29 = !{!7, !7, i64 0}
!30 = !{!5, !6, i64 152}
!31 = !{!6, !6, i64 0}
!32 = !{i64 255420}
!33 = !{!34, !10, i64 4}
!34 = !{!"__libc", !7, i64 0, !7, i64 1, !7, i64 2, !7, i64 3, !10, i64 4, !6, i64 8, !6, i64 16, !9, i64 24, !9, i64 32, !9, i64 40, !9, i64 48, !35, i64 56}
!35 = !{!"__locale_struct", !7, i64 0}
!36 = !{!34, !7, i64 3}
!37 = !{!5, !6, i64 16}
!38 = !{!5, !9, i64 144}
!39 = !{i64 231776}
!40 = !{!5, !9, i64 80}
!41 = !{i64 231590}
!42 = !{!34, !7, i64 0}
!43 = !{!34, !7, i64 1}
!44 = !{!45, !10, i64 140}
!45 = !{!"_IO_FILE", !10, i64 0, !6, i64 8, !6, i64 16, !6, i64 24, !6, i64 32, !6, i64 40, !6, i64 48, !6, i64 56, !6, i64 64, !6, i64 72, !6, i64 80, !6, i64 88, !9, i64 96, !6, i64 104, !6, i64 112, !10, i64 120, !10, i64 124, !9, i64 128, !10, i64 136, !10, i64 140, !10, i64 144, !6, i64 152, !9, i64 160, !6, i64 168, !6, i64 176, !6, i64 184, !9, i64 192, !9, i64 200, !6, i64 208, !6, i64 216, !6, i64 224}
!46 = !{!9, !9, i64 0}
!47 = !{i64 232258}
!48 = !{!5, !6, i64 128}
!49 = !{i64 0, i64 56, !29, i64 0, i64 56, !29, i64 0, i64 56, !29}
!50 = !{!34, !9, i64 24}
!51 = !{!5, !6, i64 88}
!52 = !{!5, !9, i64 96}
!53 = !{!5, !9, i64 104}
!54 = !{!5, !6, i64 0}
!55 = !{!5, !6, i64 168}
!56 = !{!57, !6, i64 0}
!57 = !{!"start_args", !6, i64 0, !6, i64 8, !10, i64 16, !7, i64 24}
!58 = !{!57, !6, i64 8}
!59 = !{!57, !10, i64 16}
