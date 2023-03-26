; ModuleID = 'ldso/dynlink.c'
source_filename = "ldso/dynlink.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.debug = type { i32, i8*, void ()*, i32, i8* }
%struct.pthread_rwlock_t = type { %union.anon }
%union.anon = type { [7 x i8*] }
%struct.pthread_mutex_t = type { %union.anon.0 }
%union.anon.0 = type { [5 x i8*] }
%struct.dso = type { i8*, i8*, i64*, %struct.dso*, %struct.dso*, %struct.Elf64_Phdr*, i32, i64, %struct.Elf64_Sym*, i32*, i32*, i16*, i8*, %struct.dso*, %struct.dso*, i64*, i64, i8*, i64, i64, i64, i8, i8, i8, i8, i8, i8, %struct.dso**, %struct.dso*, i64, i64, %struct.__pthread*, i8*, i8*, %struct.tls_module, i64, i64, i64, i64*, i8*, %struct.td_index*, %struct.dso*, i8*, %struct.fdpic_loadmap*, %struct.funcdesc*, i64*, [0 x i8] }
%struct.Elf64_Phdr = type { i32, i32, i64, i64, i64, i64, i64, i64 }
%struct.Elf64_Sym = type { i32, i8, i8, i16, i64, i64 }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.td_index = type { [2 x i64], %struct.td_index* }
%struct.fdpic_loadmap = type { i16, i16, [0 x %struct.fdpic_loadseg] }
%struct.fdpic_loadseg = type { i64, i64, i64 }
%struct.funcdesc = type { i8*, i64* }
%struct.pthread_cond_t = type { %union.anon.1 }
%union.anon.1 = type { [6 x i8*] }
%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.builtin_tls = type { i8, %struct.__pthread, [16 x i8*] }
%struct.__jmp_buf_tag = type { [8 x i64], i64, [16 x i64] }
%struct.Elf64_Ehdr = type { [16 x i8], i16, i16, i32, i64, i64, i64, i32, i16, i16, i16, i16, i16, i16 }
%struct.__sigset_t = type { [16 x i64] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct.Dl_info = type { i8*, i8*, i8*, i8* }
%struct.dl_phdr_info = type { i64, i8*, %struct.Elf64_Phdr*, i16, i64, i64, i64, i8* }

@debug = internal global %struct.debug zeroinitializer, align 8
@_dl_debug_addr = local_unnamed_addr global %struct.debug* @debug, align 8
@__init_array_start = hidden constant void ()* null, align 8
@__fini_array_start = hidden constant void ()* null, align 8
@lock = internal global %struct.pthread_rwlock_t zeroinitializer, align 8
@init_fini_lock = internal global %struct.pthread_mutex_t zeroinitializer, align 8
@shutting_down = internal unnamed_addr global i1 false, align 4
@fini_head = internal unnamed_addr global %struct.dso* null, align 8
@ctor_cond = internal global %struct.pthread_cond_t zeroinitializer, align 8
@main_ctor_queue = internal unnamed_addr global %struct.dso** null, align 8
@__malloc_replaced = external hidden local_unnamed_addr global i32, align 4
@builtin_ctor_queue = internal global [4 x %struct.dso*] zeroinitializer, align 16
@ldso = internal global %struct.dso zeroinitializer, align 8
@.str = private unnamed_addr constant [8 x i8] c"libc.so\00", align 1
@apply_addends_to = internal unnamed_addr global i64* null, align 8
@saved_addends = internal unnamed_addr global i64* null, align 8
@head = internal unnamed_addr global %struct.dso* null, align 8
@.str.1 = private unnamed_addr constant [8 x i8] c"__dls2b\00", align 1
@__hwcap = external hidden local_unnamed_addr global i64, align 8
@__libc = external hidden local_unnamed_addr global %struct.__libc, align 8
@tls_align = internal unnamed_addr global i64 8, align 8
@builtin_tls = internal global [1 x %struct.builtin_tls] zeroinitializer, align 16
@.str.2 = private unnamed_addr constant [7 x i8] c"__dls3\00", align 1
@__dls3.app = internal global %struct.dso zeroinitializer, align 8
@__dls3.vdso = internal global %struct.dso zeroinitializer, align 8
@__environ = external local_unnamed_addr global i8**, align 8
@__sysinfo = external hidden local_unnamed_addr global i64, align 8
@.str.3 = private unnamed_addr constant [16 x i8] c"LD_LIBRARY_PATH\00", align 1
@env_path = internal unnamed_addr global i8* null, align 8
@.str.4 = private unnamed_addr constant [11 x i8] c"LD_PRELOAD\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"/proc/\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"ldd\00", align 1
@ldd_mode = internal unnamed_addr global i1 false, align 4
@.str.7 = private unnamed_addr constant [5 x i8] c"list\00", align 1
@.str.8 = private unnamed_addr constant [13 x i8] c"library-path\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"preload\00", align 1
@.str.10 = private unnamed_addr constant [6 x i8] c"argv0\00", align 1
@.str.11 = private unnamed_addr constant [90 x i8] c"musl libc (x86_64)\0AVersion %s\0ADynamic Program Loader\0AUsage: %s [options] [--] pathname%s\0A\00", align 1
@__libc_version = external hidden constant [0 x i8], align 1
@.str.12 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.13 = private unnamed_addr constant [8 x i8] c" [args]\00", align 1
@.str.14 = private unnamed_addr constant [24 x i8] c"%s: cannot load %s: %s\0A\00", align 1
@.str.15 = private unnamed_addr constant [37 x i8] c"%s: %s: Not a valid dynamic program\0A\00", align 1
@.str.16 = private unnamed_addr constant [10 x i8] c"\09%s (%p)\0A\00", align 1
@tls_tail = internal unnamed_addr global %struct.tls_module* null, align 8
@tls_cnt = internal unnamed_addr global i64 0, align 8
@tls_offset = internal unnamed_addr global i64 0, align 8
@syms_tail = internal unnamed_addr global %struct.dso* null, align 8
@tail = internal unnamed_addr global %struct.dso* null, align 8
@no_deps = internal constant [1 x %struct.dso*] zeroinitializer, align 8
@.str.17 = private unnamed_addr constant [16 x i8] c"linux-gate.so.1\00", align 1
@.str.18 = private unnamed_addr constant [54 x i8] c"%s: Error getting %zu bytes thread-local storage: %m\0A\00", align 1
@static_tls_cnt = internal unnamed_addr global i64 0, align 8
@ldso_fail = internal unnamed_addr global i1 false, align 4
@.str.19 = private unnamed_addr constant [7 x i8] c"malloc\00", align 1
@.str.20 = private unnamed_addr constant [14 x i8] c"aligned_alloc\00", align 1
@__aligned_alloc_replaced = external hidden local_unnamed_addr global i32, align 4
@runtime = internal unnamed_addr global i1 false, align 4
@.str.21 = private unnamed_addr constant [40 x i8] c"Cannot dlopen while program is exiting.\00", align 1
@lazy_head = internal unnamed_addr global %struct.dso* null, align 8
@noload = internal unnamed_addr global i32 0, align 4
@rtld_fail = internal unnamed_addr global [1 x %struct.__jmp_buf_tag]* null, align 8
@.str.22 = private unnamed_addr constant [33 x i8] c"Library %s is not already loaded\00", align 1
@.str.23 = private unnamed_addr constant [36 x i8] c"Error loading shared library %s: %m\00", align 1
@gencnt = internal unnamed_addr global i64 0, align 8
@.str.24 = private unnamed_addr constant [26 x i8] c"Invalid library handle %p\00", align 1
@__default_stacksize = external hidden local_unnamed_addr global i32, align 4
@.str.25 = private unnamed_addr constant [49 x i8] c"Error relocating %s: RELRO protection failed: %m\00", align 1
@.str.26 = private unnamed_addr constant [42 x i8] c"Error relocating %s: %s: symbol not found\00", align 1
@.str.27 = private unnamed_addr constant [79 x i8] c"Error relocating %s: %s: initial-exec TLS resolves to dynamic definition in %s\00", align 1
@.str.28 = private unnamed_addr constant [52 x i8] c"Error relocating %s: cannot allocate TLSDESC for %s\00", align 1
@.str.29 = private unnamed_addr constant [8 x i8] c"(local)\00", align 1
@.str.30 = private unnamed_addr constant [52 x i8] c"Error relocating %s: unsupported relocation type %d\00", align 1
@builtin_deps = internal global [2 x %struct.dso*] zeroinitializer, align 16
@.str.31 = private unnamed_addr constant [34 x i8] c"Error loading dependencies for %s\00", align 1
@.str.32 = private unnamed_addr constant [51 x i8] c"Error loading shared library %s: %m (needed by %s)\00", align 1
@.str.33 = private unnamed_addr constant [40 x i8] c"Error allocating constructor queue: %m\0A\00", align 1
@.str.34 = private unnamed_addr constant [55 x i8] c"State of %s is inconsistent due to multithreaded fork\0A\00", align 1
@load_library.reserved = internal constant [29 x i8] c"c.pthread.rt.m.dl.util.xnet.\00", align 16
@load_library.reported = internal unnamed_addr global i32 0, align 4
@.str.35 = private unnamed_addr constant [16 x i8] c"\09%s => %s (%p)\0A\00", align 1
@sys_path = internal unnamed_addr global i8* null, align 8
@.str.36 = private unnamed_addr constant [29 x i8] c"%.*s/etc/ld-musl-x86_64.path\00", align 1
@.str.37 = private unnamed_addr constant [29 x i8] c"/lib:/usr/local/lib:/usr/lib\00", align 1
@.str.38 = private unnamed_addr constant [18 x i8] c"__libc_start_main\00", align 1
@.str.39 = private unnamed_addr constant [6 x i8] c"stdin\00", align 1
@.str.40 = private unnamed_addr constant [3 x i8] c":\0A\00", align 1
@.str.41 = private unnamed_addr constant [8 x i8] c"%.*s/%s\00", align 1
@.str.42 = private unnamed_addr constant [8 x i8] c"$ORIGIN\00", align 1
@.str.43 = private unnamed_addr constant [10 x i8] c"${ORIGIN}\00", align 1
@.str.44 = private unnamed_addr constant [15 x i8] c"/proc/self/exe\00", align 1
@.str.45 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.46 = private unnamed_addr constant [36 x i8] c"Error recording dependencies for %s\00", align 1
@.str.47 = private unnamed_addr constant [43 x i8] c"Error preparing lazy relocation for %s: %m\00", align 1
@.str.48 = private unnamed_addr constant [21 x i8] c"Symbol not found: %s\00", align 1
@.str.49 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

@__init_array_end = weak hidden alias void ()*, void ()** @__init_array_start
@__fini_array_end = weak hidden alias void ()*, void ()** @__fini_array_start
@_dl_debug_state = weak alias void (), void ()* @dl_debug_state

; Function Attrs: nounwind optsize strictfp
define hidden void @__libc_exit_fini() local_unnamed_addr #0 {
  %1 = alloca [32 x i64], align 16
  %2 = bitcast [32 x i64]* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %2) #14
  %3 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !3
  %4 = inttoptr i64 %3 to %struct.__pthread*
  %5 = tail call i32 @pthread_rwlock_wrlock(%struct.pthread_rwlock_t* noundef nonnull @lock) #16
  %6 = tail call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* noundef nonnull @init_fini_lock) #16
  store i1 true, i1* @shutting_down, align 4
  %7 = tail call i32 @pthread_rwlock_unlock(%struct.pthread_rwlock_t* noundef nonnull @lock) #16
  %8 = load %struct.dso*, %struct.dso** @fini_head, align 8, !tbaa !4
  %9 = icmp eq %struct.dso* %8, null
  br i1 %9, label %72, label %10

10:                                               ; preds = %0
  %11 = getelementptr inbounds [32 x i64], [32 x i64]* %1, i64 0, i64 0
  %12 = getelementptr inbounds [32 x i64], [32 x i64]* %1, i64 0, i64 28
  %13 = getelementptr inbounds [32 x i64], [32 x i64]* %1, i64 0, i64 26
  %14 = getelementptr inbounds [32 x i64], [32 x i64]* %1, i64 0, i64 13
  br label %15

15:                                               ; preds = %10, %68
  %16 = phi %struct.dso* [ %8, %10 ], [ %70, %68 ]
  %17 = getelementptr inbounds %struct.dso, %struct.dso* %16, i64 0, i32 31
  %18 = load %struct.__pthread*, %struct.__pthread** %17, align 8, !tbaa !4
  %19 = icmp eq %struct.__pthread* %18, null
  %20 = icmp eq %struct.__pthread* %18, %4
  %21 = select i1 %19, i1 true, i1 %20
  br i1 %21, label %28, label %22

22:                                               ; preds = %15, %22
  %23 = tail call i32 @pthread_cond_wait(%struct.pthread_cond_t* noundef nonnull @ctor_cond, %struct.pthread_mutex_t* noundef nonnull @init_fini_lock) #16
  %24 = load %struct.__pthread*, %struct.__pthread** %17, align 8, !tbaa !4
  %25 = icmp eq %struct.__pthread* %24, null
  %26 = icmp eq %struct.__pthread* %24, %4
  %27 = select i1 %25, i1 true, i1 %26
  br i1 %27, label %28, label %22

28:                                               ; preds = %22, %15
  %29 = getelementptr inbounds %struct.dso, %struct.dso* %16, i64 0, i32 22
  %30 = load i8, i8* %29, align 1, !tbaa !8
  %31 = icmp eq i8 %30, 0
  br i1 %31, label %68, label %32

32:                                               ; preds = %28
  %33 = getelementptr inbounds %struct.dso, %struct.dso* %16, i64 0, i32 2
  %34 = load i64*, i64** %33, align 8, !tbaa !4
  call fastcc void @decode_vec(i64* noundef %34, i64* noundef nonnull %11) #17
  %35 = load i64, i64* %11, align 16, !tbaa !9
  %36 = and i64 %35, 67108864
  %37 = icmp eq i64 %36, 0
  br i1 %37, label %57, label %38

38:                                               ; preds = %32
  %39 = load i64, i64* %12, align 16, !tbaa !9
  %40 = lshr i64 %39, 3
  %41 = icmp ult i64 %39, 8
  br i1 %41, label %57, label %42

42:                                               ; preds = %38
  %43 = getelementptr inbounds %struct.dso, %struct.dso* %16, i64 0, i32 0
  %44 = load i8*, i8** %43, align 8, !tbaa !4
  %45 = load i64, i64* %13, align 16, !tbaa !9
  %46 = getelementptr inbounds i8, i8* %44, i64 %45
  %47 = bitcast i8* %46 to i64*
  %48 = getelementptr inbounds i64, i64* %47, i64 %40
  br label %49

49:                                               ; preds = %42, %49
  %50 = phi i64* [ %53, %49 ], [ %48, %42 ]
  %51 = phi i64 [ %52, %49 ], [ %40, %42 ]
  %52 = add nsw i64 %51, -1
  %53 = getelementptr inbounds i64, i64* %50, i64 -1
  %54 = load i64, i64* %53, align 8, !tbaa !9
  %55 = inttoptr i64 %54 to void ()*
  tail call void %55() #16
  %56 = icmp eq i64 %52, 0
  br i1 %56, label %57, label %49

57:                                               ; preds = %49, %38, %32
  %58 = and i64 %35, 8192
  %59 = icmp ne i64 %58, 0
  %60 = load i64, i64* %14, align 8
  %61 = icmp ne i64 %60, 0
  %62 = select i1 %59, i1 %61, i1 false
  br i1 %62, label %63, label %68

63:                                               ; preds = %57
  %64 = getelementptr inbounds %struct.dso, %struct.dso* %16, i64 0, i32 0
  %65 = load i8*, i8** %64, align 8, !tbaa !4
  %66 = getelementptr inbounds i8, i8* %65, i64 %60
  %67 = bitcast i8* %66 to void (...)*
  tail call void (...) %67() #16
  br label %68

68:                                               ; preds = %57, %63, %28
  %69 = getelementptr inbounds %struct.dso, %struct.dso* %16, i64 0, i32 41
  %70 = load %struct.dso*, %struct.dso** %69, align 8, !tbaa !4
  %71 = icmp eq %struct.dso* %70, null
  br i1 %71, label %72, label %15

72:                                               ; preds = %68, %0
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %2) #14
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @pthread_rwlock_wrlock(%struct.pthread_rwlock_t* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @pthread_mutex_lock(%struct.pthread_mutex_t* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @pthread_rwlock_unlock(%struct.pthread_rwlock_t* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @pthread_cond_wait(%struct.pthread_cond_t* noundef, %struct.pthread_mutex_t* noundef) local_unnamed_addr #2

; Function Attrs: nofree norecurse nosync nounwind optsize strictfp
define internal fastcc void @decode_vec(i64* nocapture noundef readonly %0, i64* nocapture noundef %1) unnamed_addr #3 {
  br label %3

3:                                                ; preds = %3, %2
  %4 = phi i64 [ 0, %2 ], [ %7, %3 ]
  %5 = getelementptr inbounds i64, i64* %1, i64 %4
  %6 = bitcast i64* %5 to <2 x i64>*
  store <2 x i64> zeroinitializer, <2 x i64>* %6, align 8, !tbaa !9
  %7 = add nuw i64 %4, 2
  %8 = icmp eq i64 %7, 32
  br i1 %8, label %9, label %3, !llvm.loop !11

9:                                                ; preds = %3
  %10 = load i64, i64* %0, align 8, !tbaa !9
  %11 = icmp eq i64 %10, 0
  br i1 %11, label %29, label %12

12:                                               ; preds = %9, %25
  %13 = phi i64 [ %27, %25 ], [ %10, %9 ]
  %14 = phi i64* [ %26, %25 ], [ %0, %9 ]
  %15 = add i64 %13, -1
  %16 = icmp ult i64 %15, 31
  br i1 %16, label %17, label %25

17:                                               ; preds = %12
  %18 = shl nuw nsw i64 1, %13
  %19 = load i64, i64* %1, align 8, !tbaa !9
  %20 = or i64 %19, %18
  store i64 %20, i64* %1, align 8, !tbaa !9
  %21 = getelementptr inbounds i64, i64* %14, i64 1
  %22 = load i64, i64* %21, align 8, !tbaa !9
  %23 = load i64, i64* %14, align 8, !tbaa !9
  %24 = getelementptr inbounds i64, i64* %1, i64 %23
  store i64 %22, i64* %24, align 8, !tbaa !9
  br label %25

25:                                               ; preds = %12, %17
  %26 = getelementptr inbounds i64, i64* %14, i64 2
  %27 = load i64, i64* %26, align 8, !tbaa !9
  %28 = icmp eq i64 %27, 0
  br i1 %28, label %29, label %12

29:                                               ; preds = %25, %9
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define hidden void @__ldso_atfork(i32 noundef %0) local_unnamed_addr #0 {
  %2 = icmp slt i32 %0, 0
  br i1 %2, label %3, label %6

3:                                                ; preds = %1
  %4 = tail call i32 @pthread_rwlock_wrlock(%struct.pthread_rwlock_t* noundef nonnull @lock) #16
  %5 = tail call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* noundef nonnull @init_fini_lock) #16
  br label %9

6:                                                ; preds = %1
  %7 = tail call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* noundef nonnull @init_fini_lock) #16
  %8 = tail call i32 @pthread_rwlock_unlock(%struct.pthread_rwlock_t* noundef nonnull @lock) #16
  br label %9

9:                                                ; preds = %6, %3
  ret void
}

; Function Attrs: optsize
declare i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define hidden void @__libc_start_init() local_unnamed_addr #0 {
  %1 = load %struct.dso**, %struct.dso*** @main_ctor_queue, align 8, !tbaa !4
  tail call fastcc void @do_init_fini(%struct.dso** noundef %1) #17
  %2 = load i32, i32* @__malloc_replaced, align 4, !tbaa !13
  %3 = icmp eq i32 %2, 0
  %4 = load %struct.dso**, %struct.dso*** @main_ctor_queue, align 8
  %5 = icmp ne %struct.dso** %4, getelementptr inbounds ([4 x %struct.dso*], [4 x %struct.dso*]* @builtin_ctor_queue, i64 0, i64 0)
  %6 = select i1 %3, i1 %5, i1 false
  br i1 %6, label %7, label %9

7:                                                ; preds = %0
  %8 = bitcast %struct.dso** %4 to i8*
  tail call void @__libc_free(i8* noundef %8) #16
  br label %9

9:                                                ; preds = %7, %0
  store %struct.dso** null, %struct.dso*** @main_ctor_queue, align 8, !tbaa !4
  ret void
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @do_init_fini(%struct.dso** nocapture noundef readonly %0) unnamed_addr #0 {
  %2 = alloca [32 x i64], align 16
  %3 = bitcast [32 x i64]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %3) #14
  %4 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !3
  %5 = inttoptr i64 %4 to %struct.__pthread*
  %6 = tail call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* noundef nonnull @init_fini_lock) #16
  %7 = load %struct.dso*, %struct.dso** %0, align 8, !tbaa !4
  %8 = icmp eq %struct.dso* %7, null
  br i1 %8, label %83, label %9

9:                                                ; preds = %1
  %10 = getelementptr inbounds [32 x i64], [32 x i64]* %2, i64 0, i64 0
  %11 = getelementptr inbounds [32 x i64], [32 x i64]* %2, i64 0, i64 12
  %12 = getelementptr inbounds [32 x i64], [32 x i64]* %2, i64 0, i64 27
  %13 = getelementptr inbounds [32 x i64], [32 x i64]* %2, i64 0, i64 25
  br label %14

14:                                               ; preds = %9, %78
  %15 = phi %struct.dso* [ %7, %9 ], [ %81, %78 ]
  %16 = phi i64 [ 0, %9 ], [ %79, %78 ]
  %17 = getelementptr inbounds %struct.dso, %struct.dso* %15, i64 0, i32 31
  br label %18

18:                                               ; preds = %14, %27
  %19 = load %struct.__pthread*, %struct.__pthread** %17, align 8, !tbaa !4
  %20 = icmp eq %struct.__pthread* %19, null
  br i1 %20, label %25, label %21

21:                                               ; preds = %18
  %22 = icmp ne %struct.__pthread* %19, %5
  %23 = load i1, i1* @shutting_down, align 4
  %24 = select i1 %22, i1 true, i1 %23
  br i1 %24, label %27, label %78

25:                                               ; preds = %18
  %26 = load i1, i1* @shutting_down, align 4
  br i1 %26, label %27, label %29

27:                                               ; preds = %21, %25
  %28 = tail call i32 @pthread_cond_wait(%struct.pthread_cond_t* noundef nonnull @ctor_cond, %struct.pthread_mutex_t* noundef nonnull @init_fini_lock) #16
  br label %18

29:                                               ; preds = %25
  %30 = getelementptr inbounds %struct.dso, %struct.dso* %15, i64 0, i32 22
  %31 = load i8, i8* %30, align 1, !tbaa !8
  %32 = icmp eq i8 %31, 0
  br i1 %32, label %33, label %78

33:                                               ; preds = %29
  store %struct.__pthread* %5, %struct.__pthread** %17, align 8, !tbaa !4
  %34 = getelementptr inbounds %struct.dso, %struct.dso* %15, i64 0, i32 2
  %35 = load i64*, i64** %34, align 8, !tbaa !4
  call fastcc void @decode_vec(i64* noundef %35, i64* noundef nonnull %10) #17
  %36 = load i64, i64* %10, align 16, !tbaa !9
  %37 = and i64 %36, 67117056
  %38 = icmp eq i64 %37, 0
  br i1 %38, label %42, label %39

39:                                               ; preds = %33
  %40 = load %struct.dso*, %struct.dso** @fini_head, align 8, !tbaa !4
  %41 = getelementptr inbounds %struct.dso, %struct.dso* %15, i64 0, i32 41
  store %struct.dso* %40, %struct.dso** %41, align 8, !tbaa !4
  store %struct.dso* %15, %struct.dso** @fini_head, align 8, !tbaa !4
  br label %42

42:                                               ; preds = %39, %33
  %43 = tail call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* noundef nonnull @init_fini_lock) #16
  %44 = and i64 %36, 4096
  %45 = icmp ne i64 %44, 0
  %46 = load i64, i64* %11, align 16
  %47 = icmp ne i64 %46, 0
  %48 = select i1 %45, i1 %47, i1 false
  br i1 %48, label %49, label %54

49:                                               ; preds = %42
  %50 = getelementptr inbounds %struct.dso, %struct.dso* %15, i64 0, i32 0
  %51 = load i8*, i8** %50, align 8, !tbaa !4
  %52 = getelementptr inbounds i8, i8* %51, i64 %46
  %53 = bitcast i8* %52 to void (...)*
  tail call void (...) %53() #16
  br label %54

54:                                               ; preds = %49, %42
  %55 = and i64 %36, 33554432
  %56 = icmp eq i64 %55, 0
  br i1 %56, label %75, label %57

57:                                               ; preds = %54
  %58 = load i64, i64* %12, align 8, !tbaa !9
  %59 = icmp ult i64 %58, 8
  br i1 %59, label %75, label %60

60:                                               ; preds = %57
  %61 = getelementptr inbounds %struct.dso, %struct.dso* %15, i64 0, i32 0
  %62 = load i8*, i8** %61, align 8, !tbaa !4
  %63 = load i64, i64* %13, align 8, !tbaa !9
  %64 = getelementptr inbounds i8, i8* %62, i64 %63
  %65 = bitcast i8* %64 to i64*
  %66 = lshr i64 %58, 3
  br label %67

67:                                               ; preds = %60, %67
  %68 = phi i64* [ %71, %67 ], [ %65, %60 ]
  %69 = phi i64 [ %70, %67 ], [ %66, %60 ]
  %70 = add nsw i64 %69, -1
  %71 = getelementptr inbounds i64, i64* %68, i64 1
  %72 = load i64, i64* %68, align 8, !tbaa !9
  %73 = inttoptr i64 %72 to void ()*
  tail call void %73() #16
  %74 = icmp eq i64 %70, 0
  br i1 %74, label %75, label %67

75:                                               ; preds = %67, %57, %54
  %76 = tail call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* noundef nonnull @init_fini_lock) #16
  store %struct.__pthread* null, %struct.__pthread** %17, align 8, !tbaa !4
  store i8 1, i8* %30, align 1, !tbaa !8
  %77 = tail call i32 @pthread_cond_broadcast(%struct.pthread_cond_t* noundef nonnull @ctor_cond) #16
  br label %78

78:                                               ; preds = %21, %29, %75
  %79 = add i64 %16, 1
  %80 = getelementptr inbounds %struct.dso*, %struct.dso** %0, i64 %79
  %81 = load %struct.dso*, %struct.dso** %80, align 8, !tbaa !4
  %82 = icmp eq %struct.dso* %81, null
  br i1 %82, label %83, label %14

83:                                               ; preds = %78, %1
  %84 = tail call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* noundef nonnull @init_fini_lock) #16
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %3) #14
  ret void
}

; Function Attrs: optsize
declare hidden void @__libc_free(i8* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal void @dl_debug_state() #4 {
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define hidden void @__init_tls(i64* nocapture noundef %0) local_unnamed_addr #4 {
  ret void
}

; Function Attrs: nounwind optsize strictfp
define hidden void @__dls2(i8* noundef %0, i64* noundef %1) local_unnamed_addr #0 {
  %3 = alloca [32 x i64], align 16
  %4 = getelementptr inbounds i64, i64* %1, i64 1
  %5 = load i64, i64* %1, align 8, !tbaa !9
  %6 = getelementptr inbounds i64, i64* %4, i64 %5
  br label %7

7:                                                ; preds = %7, %2
  %8 = phi i64* [ %6, %2 ], [ %9, %7 ]
  %9 = getelementptr inbounds i64, i64* %8, i64 1
  %10 = load i64, i64* %9, align 8, !tbaa !9
  %11 = icmp eq i64 %10, 0
  br i1 %11, label %12, label %7

12:                                               ; preds = %7
  store i8* %0, i8** getelementptr inbounds (%struct.dso, %struct.dso* @ldso, i64 0, i32 0), align 8, !tbaa !4
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i8** getelementptr inbounds (%struct.dso, %struct.dso* @ldso, i64 0, i32 42), align 8, !tbaa !4
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i8** getelementptr inbounds (%struct.dso, %struct.dso* @ldso, i64 0, i32 1), align 8, !tbaa !4
  %13 = getelementptr inbounds i8, i8* %0, i64 56
  %14 = bitcast i8* %13 to i16*
  %15 = load i16, i16* %14, align 8, !tbaa !15
  %16 = zext i16 %15 to i32
  store i32 %16, i32* getelementptr inbounds (%struct.dso, %struct.dso* @ldso, i64 0, i32 6), align 8, !tbaa !13
  %17 = getelementptr inbounds i8, i8* %0, i64 32
  %18 = bitcast i8* %17 to i64*
  %19 = load i64, i64* %18, align 8, !tbaa !18
  %20 = getelementptr inbounds i8, i8* %0, i64 %19
  store i8* %20, i8** bitcast (%struct.Elf64_Phdr** getelementptr inbounds (%struct.dso, %struct.dso* @ldso, i64 0, i32 5) to i8**), align 8, !tbaa !4
  %21 = getelementptr inbounds i8, i8* %0, i64 54
  %22 = bitcast i8* %21 to i16*
  %23 = load i16, i16* %22, align 2, !tbaa !19
  %24 = zext i16 %23 to i64
  store i64 %24, i64* getelementptr inbounds (%struct.dso, %struct.dso* @ldso, i64 0, i32 7), align 8, !tbaa !9
  tail call fastcc void @kernel_mapped_dso(%struct.dso* noundef nonnull @ldso) #17
  tail call fastcc void @decode_dyn(%struct.dso* noundef nonnull @ldso) #17
  %25 = bitcast [32 x i64]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %25) #14
  %26 = load i64*, i64** getelementptr inbounds (%struct.dso, %struct.dso* @ldso, i64 0, i32 2), align 8, !tbaa !4
  %27 = getelementptr inbounds [32 x i64], [32 x i64]* %3, i64 0, i64 0
  call fastcc void @decode_vec(i64* noundef %26, i64* noundef nonnull %27) #17
  %28 = load i8*, i8** getelementptr inbounds (%struct.dso, %struct.dso* @ldso, i64 0, i32 0), align 8, !tbaa !4
  %29 = getelementptr inbounds [32 x i64], [32 x i64]* %3, i64 0, i64 17
  %30 = load i64, i64* %29, align 8, !tbaa !9
  %31 = getelementptr inbounds i8, i8* %28, i64 %30
  %32 = getelementptr inbounds [32 x i64], [32 x i64]* %3, i64 0, i64 18
  %33 = load i64, i64* %32, align 16, !tbaa !9
  store i8* %31, i8** bitcast (i64** @apply_addends_to to i8**), align 8, !tbaa !4
  %34 = icmp eq i64 %33, 0
  br i1 %34, label %53, label %35

35:                                               ; preds = %12
  %36 = bitcast i8* %31 to i64*
  br label %37

37:                                               ; preds = %35, %37
  %38 = phi i64* [ %47, %37 ], [ %36, %35 ]
  %39 = phi i64 [ %48, %37 ], [ %33, %35 ]
  %40 = phi i64 [ %46, %37 ], [ 0, %35 ]
  %41 = getelementptr inbounds i64, i64* %38, i64 1
  %42 = load i64, i64* %41, align 8, !tbaa !9
  %43 = and i64 %42, 2147483647
  %44 = icmp ne i64 %43, 8
  %45 = zext i1 %44 to i64
  %46 = add i64 %40, %45
  %47 = getelementptr inbounds i64, i64* %38, i64 2
  %48 = add i64 %39, -16
  %49 = icmp eq i64 %48, 0
  br i1 %49, label %50, label %37

50:                                               ; preds = %37
  %51 = icmp ugt i64 %46, 4095
  br i1 %51, label %52, label %53

52:                                               ; preds = %50
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #14, !srcloc !20
  br label %53

53:                                               ; preds = %12, %52, %50
  %54 = phi i64 [ %46, %52 ], [ %46, %50 ], [ 0, %12 ]
  %55 = getelementptr inbounds i64, i64* %8, i64 2
  %56 = add i64 %54, 1
  %57 = tail call i8* @llvm.stacksave() #18
  %58 = alloca i64, i64 %56, align 16
  store i64* %58, i64** @saved_addends, align 8, !tbaa !4
  store %struct.dso* @ldso, %struct.dso** @head, align 8, !tbaa !4
  call fastcc void @reloc_all(%struct.dso* noundef nonnull @ldso) #17
  store i8 0, i8* getelementptr inbounds (%struct.dso, %struct.dso* @ldso, i64 0, i32 21), align 8, !tbaa !8
  %59 = call fastcc { %struct.Elf64_Sym*, %struct.dso* } @find_sym(%struct.dso* noundef nonnull @ldso, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 noundef 0) #17
  %60 = extractvalue { %struct.Elf64_Sym*, %struct.dso* } %59, 0
  %61 = load i8*, i8** getelementptr inbounds (%struct.dso, %struct.dso* @ldso, i64 0, i32 0), align 8, !tbaa !4
  %62 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %60, i64 0, i32 4
  %63 = load i64, i64* %62, align 8, !tbaa !21
  %64 = getelementptr inbounds i8, i8* %61, i64 %63
  %65 = bitcast i8* %64 to void (i64*, i64*)*
  call void %65(i64* noundef nonnull %1, i64* noundef nonnull %55) #16
  call void @llvm.stackrestore(i8* %57) #18
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %25) #14
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind optsize strictfp
define internal fastcc void @kernel_mapped_dso(%struct.dso* nocapture noundef %0) unnamed_addr #3 {
  %2 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 6
  %3 = load i32, i32* %2, align 8, !tbaa !13
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %73, label %5

5:                                                ; preds = %1
  %6 = sext i32 %3 to i64
  %7 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 5
  %8 = load %struct.Elf64_Phdr*, %struct.Elf64_Phdr** %7, align 8, !tbaa !4
  %9 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 36
  %10 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 37
  %11 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 0
  %12 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 2
  %13 = bitcast i64** %12 to i8**
  %14 = load i1, i1* @runtime, align 4
  %15 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 7
  %16 = load i64, i64* %15, align 8, !tbaa !9
  br label %17

17:                                               ; preds = %5, %66
  %18 = phi i64 [ %6, %5 ], [ %22, %66 ]
  %19 = phi %struct.Elf64_Phdr* [ %8, %5 ], [ %71, %66 ]
  %20 = phi i64 [ 0, %5 ], [ %68, %66 ]
  %21 = phi i64 [ -1, %5 ], [ %67, %66 ]
  %22 = add i64 %18, -1
  %23 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %19, i64 0, i32 0
  %24 = load i32, i32* %23, align 8, !tbaa !23
  switch i32 %24, label %39 [
    i32 2, label %25
    i32 1685382482, label %30
  ]

25:                                               ; preds = %17
  %26 = load i8*, i8** %11, align 8, !tbaa !4
  %27 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %19, i64 0, i32 3
  %28 = load i64, i64* %27, align 8, !tbaa !25
  %29 = getelementptr inbounds i8, i8* %26, i64 %28
  store i8* %29, i8** %13, align 8, !tbaa !4
  br label %66

30:                                               ; preds = %17
  %31 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %19, i64 0, i32 3
  %32 = load i64, i64* %31, align 8, !tbaa !25
  %33 = and i64 %32, -4096
  store i64 %33, i64* %9, align 8, !tbaa !9
  %34 = load i64, i64* %31, align 8, !tbaa !25
  %35 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %19, i64 0, i32 6
  %36 = load i64, i64* %35, align 8, !tbaa !26
  %37 = add i64 %36, %34
  %38 = and i64 %37, -4096
  store i64 %38, i64* %10, align 8, !tbaa !9
  br label %66

39:                                               ; preds = %17
  %40 = icmp ne i32 %24, 1685382481
  %41 = select i1 %40, i1 true, i1 %14
  br i1 %41, label %53, label %42

42:                                               ; preds = %39
  %43 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %19, i64 0, i32 6
  %44 = load i64, i64* %43, align 8, !tbaa !26
  %45 = load i32, i32* @__default_stacksize, align 4, !tbaa !13
  %46 = zext i32 %45 to i64
  %47 = icmp ugt i64 %44, %46
  br i1 %47, label %48, label %66

48:                                               ; preds = %42
  %49 = icmp ult i64 %44, 8388608
  %50 = select i1 %49, i64 %44, i64 8388608
  %51 = trunc i64 %50 to i32
  store i32 %51, i32* @__default_stacksize, align 4, !tbaa !13
  %52 = load i32, i32* %23, align 8, !tbaa !23
  br label %53

53:                                               ; preds = %48, %39
  %54 = phi i32 [ %24, %39 ], [ %52, %48 ]
  %55 = icmp eq i32 %54, 1
  br i1 %55, label %56, label %66

56:                                               ; preds = %53
  %57 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %19, i64 0, i32 3
  %58 = load i64, i64* %57, align 8, !tbaa !25
  %59 = icmp ult i64 %58, %21
  %60 = select i1 %59, i64 %58, i64 %21
  %61 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %19, i64 0, i32 6
  %62 = load i64, i64* %61, align 8, !tbaa !26
  %63 = add i64 %62, %58
  %64 = icmp ugt i64 %63, %20
  %65 = select i1 %64, i64 %63, i64 %20
  br label %66

66:                                               ; preds = %30, %42, %25, %56, %53
  %67 = phi i64 [ %21, %53 ], [ %60, %56 ], [ %21, %25 ], [ %21, %42 ], [ %21, %30 ]
  %68 = phi i64 [ %20, %53 ], [ %65, %56 ], [ %20, %25 ], [ %20, %42 ], [ %20, %30 ]
  %69 = bitcast %struct.Elf64_Phdr* %19 to i8*
  %70 = getelementptr inbounds i8, i8* %69, i64 %16
  %71 = bitcast i8* %70 to %struct.Elf64_Phdr*
  %72 = icmp eq i64 %22, 0
  br i1 %72, label %73, label %17

73:                                               ; preds = %66, %1
  %74 = phi i64 [ -1, %1 ], [ %67, %66 ]
  %75 = phi i64 [ 0, %1 ], [ %68, %66 ]
  %76 = and i64 %74, -4096
  %77 = add i64 %75, 4095
  %78 = and i64 %77, -4096
  %79 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 0
  %80 = load i8*, i8** %79, align 8, !tbaa !4
  %81 = getelementptr inbounds i8, i8* %80, i64 %76
  %82 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 17
  store i8* %81, i8** %82, align 8, !tbaa !4
  %83 = sub i64 %78, %76
  %84 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 18
  store i64 %83, i64* %84, align 8, !tbaa !9
  %85 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 23
  store i8 1, i8* %85, align 2, !tbaa !8
  ret void
}

; Function Attrs: nofree nosync nounwind optsize strictfp
define internal fastcc void @decode_dyn(%struct.dso* nocapture noundef %0) unnamed_addr #5 {
  %2 = alloca [32 x i64], align 16
  %3 = bitcast [32 x i64]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %3) #14
  %4 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 2
  %5 = load i64*, i64** %4, align 8, !tbaa !4
  %6 = getelementptr inbounds [32 x i64], [32 x i64]* %2, i64 0, i64 0
  call fastcc void @decode_vec(i64* noundef %5, i64* noundef nonnull %6) #17
  %7 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 0
  %8 = load i8*, i8** %7, align 8, !tbaa !4
  %9 = getelementptr inbounds [32 x i64], [32 x i64]* %2, i64 0, i64 6
  %10 = load i64, i64* %9, align 16, !tbaa !9
  %11 = getelementptr inbounds i8, i8* %8, i64 %10
  %12 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 8
  %13 = bitcast %struct.Elf64_Sym** %12 to i8**
  store i8* %11, i8** %13, align 8, !tbaa !4
  %14 = getelementptr inbounds [32 x i64], [32 x i64]* %2, i64 0, i64 5
  %15 = load i64, i64* %14, align 8, !tbaa !9
  %16 = getelementptr inbounds i8, i8* %8, i64 %15
  %17 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 12
  store i8* %16, i8** %17, align 8, !tbaa !4
  %18 = load i64, i64* %6, align 16, !tbaa !9
  %19 = and i64 %18, 16
  %20 = icmp eq i64 %19, 0
  br i1 %20, label %27, label %21

21:                                               ; preds = %1
  %22 = getelementptr inbounds [32 x i64], [32 x i64]* %2, i64 0, i64 4
  %23 = load i64, i64* %22, align 16, !tbaa !9
  %24 = getelementptr inbounds i8, i8* %8, i64 %23
  %25 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 9
  %26 = bitcast i32** %25 to i8**
  store i8* %24, i8** %26, align 8, !tbaa !4
  br label %27

27:                                               ; preds = %21, %1
  %28 = and i64 %18, 32768
  %29 = icmp eq i64 %28, 0
  br i1 %29, label %35, label %30

30:                                               ; preds = %27
  %31 = getelementptr inbounds [32 x i64], [32 x i64]* %2, i64 0, i64 15
  %32 = load i64, i64* %31, align 8, !tbaa !9
  %33 = getelementptr inbounds i8, i8* %16, i64 %32
  %34 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 32
  store i8* %33, i8** %34, align 8, !tbaa !4
  br label %35

35:                                               ; preds = %30, %27
  %36 = and i64 %18, 536870912
  %37 = icmp eq i64 %36, 0
  br i1 %37, label %43, label %38

38:                                               ; preds = %35
  %39 = getelementptr inbounds [32 x i64], [32 x i64]* %2, i64 0, i64 29
  %40 = load i64, i64* %39, align 8, !tbaa !9
  %41 = getelementptr inbounds i8, i8* %16, i64 %40
  %42 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 32
  store i8* %41, i8** %42, align 8, !tbaa !4
  br label %43

43:                                               ; preds = %38, %35
  %44 = and i64 %18, 8
  %45 = icmp eq i64 %44, 0
  br i1 %45, label %52, label %46

46:                                               ; preds = %43
  %47 = getelementptr inbounds [32 x i64], [32 x i64]* %2, i64 0, i64 3
  %48 = load i64, i64* %47, align 8, !tbaa !9
  %49 = getelementptr inbounds i8, i8* %8, i64 %48
  %50 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 45
  %51 = bitcast i64** %50 to i8**
  store i8* %49, i8** %51, align 8, !tbaa !4
  br label %52

52:                                               ; preds = %46, %43
  %53 = load i64*, i64** %4, align 8, !tbaa !4
  %54 = load i64, i64* %53, align 8, !tbaa !9
  %55 = icmp eq i64 %54, 1879047925
  br i1 %55, label %64, label %56

56:                                               ; preds = %52, %60
  %57 = phi i64 [ %62, %60 ], [ %54, %52 ]
  %58 = phi i64* [ %61, %60 ], [ %53, %52 ]
  %59 = icmp eq i64 %57, 0
  br i1 %59, label %71, label %60

60:                                               ; preds = %56
  %61 = getelementptr inbounds i64, i64* %58, i64 2
  %62 = load i64, i64* %61, align 8, !tbaa !9
  %63 = icmp eq i64 %62, 1879047925
  br i1 %63, label %64, label %56

64:                                               ; preds = %60, %52
  %65 = phi i64* [ %53, %52 ], [ %61, %60 ]
  %66 = getelementptr inbounds i64, i64* %65, i64 1
  %67 = load i64, i64* %66, align 8, !tbaa !9
  %68 = getelementptr inbounds i8, i8* %8, i64 %67
  %69 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 10
  %70 = bitcast i32** %69 to i8**
  store i8* %68, i8** %70, align 8, !tbaa !4
  br label %71

71:                                               ; preds = %56, %64
  %72 = icmp eq i64 %54, 1879048176
  br i1 %72, label %81, label %73

73:                                               ; preds = %71, %77
  %74 = phi i64 [ %79, %77 ], [ %54, %71 ]
  %75 = phi i64* [ %78, %77 ], [ %53, %71 ]
  %76 = icmp eq i64 %74, 0
  br i1 %76, label %88, label %77

77:                                               ; preds = %73
  %78 = getelementptr inbounds i64, i64* %75, i64 2
  %79 = load i64, i64* %78, align 8, !tbaa !9
  %80 = icmp eq i64 %79, 1879048176
  br i1 %80, label %81, label %73

81:                                               ; preds = %77, %71
  %82 = phi i64* [ %53, %71 ], [ %78, %77 ]
  %83 = getelementptr inbounds i64, i64* %82, i64 1
  %84 = load i64, i64* %83, align 8, !tbaa !9
  %85 = getelementptr inbounds i8, i8* %8, i64 %84
  %86 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 11
  %87 = bitcast i16** %86 to i8**
  store i8* %85, i8** %87, align 8, !tbaa !4
  br label %88

88:                                               ; preds = %73, %81
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %3) #14
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare i8* @llvm.stacksave() #6

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @reloc_all(%struct.dso* noundef %0) unnamed_addr #0 {
  %2 = alloca [32 x i64], align 16
  %3 = bitcast [32 x i64]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %3) #14
  %4 = icmp eq %struct.dso* %0, null
  br i1 %4, label %71, label %5

5:                                                ; preds = %1
  %6 = getelementptr inbounds [32 x i64], [32 x i64]* %2, i64 0, i64 0
  %7 = getelementptr inbounds [32 x i64], [32 x i64]* %2, i64 0, i64 23
  %8 = getelementptr inbounds [32 x i64], [32 x i64]* %2, i64 0, i64 2
  %9 = getelementptr inbounds [32 x i64], [32 x i64]* %2, i64 0, i64 20
  %10 = getelementptr inbounds [32 x i64], [32 x i64]* %2, i64 0, i64 17
  %11 = getelementptr inbounds [32 x i64], [32 x i64]* %2, i64 0, i64 18
  %12 = getelementptr inbounds [32 x i64], [32 x i64]* %2, i64 0, i64 7
  %13 = getelementptr inbounds [32 x i64], [32 x i64]* %2, i64 0, i64 8
  br label %14

14:                                               ; preds = %5, %67
  %15 = phi %struct.dso* [ %0, %5 ], [ %69, %67 ]
  %16 = getelementptr inbounds %struct.dso, %struct.dso* %15, i64 0, i32 21
  %17 = load i8, i8* %16, align 8, !tbaa !8
  %18 = icmp eq i8 %17, 0
  br i1 %18, label %19, label %67

19:                                               ; preds = %14
  %20 = getelementptr inbounds %struct.dso, %struct.dso* %15, i64 0, i32 2
  %21 = load i64*, i64** %20, align 8, !tbaa !4
  call fastcc void @decode_vec(i64* noundef %21, i64* noundef nonnull %6) #17
  %22 = getelementptr inbounds %struct.dso, %struct.dso* %15, i64 0, i32 0
  %23 = load i8*, i8** %22, align 8, !tbaa !4
  %24 = load i64, i64* %7, align 8, !tbaa !9
  %25 = getelementptr inbounds i8, i8* %23, i64 %24
  %26 = bitcast i8* %25 to i64*
  %27 = load i64, i64* %8, align 16, !tbaa !9
  %28 = load i64, i64* %9, align 16, !tbaa !9
  %29 = icmp eq i64 %28, 7
  %30 = select i1 %29, i64 3, i64 2
  tail call fastcc void @do_relocs(%struct.dso* noundef nonnull %15, i64* noundef %26, i64 noundef %27, i64 noundef %30) #17
  %31 = load i8*, i8** %22, align 8, !tbaa !4
  %32 = load i64, i64* %10, align 8, !tbaa !9
  %33 = getelementptr inbounds i8, i8* %31, i64 %32
  %34 = bitcast i8* %33 to i64*
  %35 = load i64, i64* %11, align 16, !tbaa !9
  tail call fastcc void @do_relocs(%struct.dso* noundef nonnull %15, i64* noundef %34, i64 noundef %35, i64 noundef 2) #17
  %36 = load i8*, i8** %22, align 8, !tbaa !4
  %37 = load i64, i64* %12, align 8, !tbaa !9
  %38 = getelementptr inbounds i8, i8* %36, i64 %37
  %39 = bitcast i8* %38 to i64*
  %40 = load i64, i64* %13, align 16, !tbaa !9
  tail call fastcc void @do_relocs(%struct.dso* noundef nonnull %15, i64* noundef %39, i64 noundef %40, i64 noundef 3) #17
  %41 = load %struct.dso*, %struct.dso** @head, align 8, !tbaa !4
  %42 = icmp eq %struct.dso* %41, @ldso
  br i1 %42, label %66, label %43

43:                                               ; preds = %19
  %44 = getelementptr inbounds %struct.dso, %struct.dso* %15, i64 0, i32 36
  %45 = load i64, i64* %44, align 8, !tbaa !9
  %46 = getelementptr inbounds %struct.dso, %struct.dso* %15, i64 0, i32 37
  %47 = load i64, i64* %46, align 8, !tbaa !9
  %48 = icmp eq i64 %47, %45
  br i1 %48, label %66, label %49

49:                                               ; preds = %43
  %50 = load i8*, i8** %22, align 8, !tbaa !4
  %51 = getelementptr inbounds i8, i8* %50, i64 %45
  %52 = sub i64 %47, %45
  %53 = tail call i32 @mprotect(i8* noundef %51, i64 noundef %52, i32 noundef 1) #16
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %66, label %55

55:                                               ; preds = %49
  %56 = tail call i32* @___errno_location() #19
  %57 = load i32, i32* %56, align 4, !tbaa !13
  %58 = icmp eq i32 %57, 38
  br i1 %58, label %66, label %59

59:                                               ; preds = %55
  %60 = getelementptr inbounds %struct.dso, %struct.dso* %15, i64 0, i32 1
  %61 = load i8*, i8** %60, align 8, !tbaa !4
  tail call void (i8*, ...) @error(i8* noundef getelementptr inbounds ([49 x i8], [49 x i8]* @.str.25, i64 0, i64 0), i8* noundef %61) #17
  %62 = load i1, i1* @runtime, align 4
  br i1 %62, label %63, label %66

63:                                               ; preds = %59
  %64 = load [1 x %struct.__jmp_buf_tag]*, [1 x %struct.__jmp_buf_tag]** @rtld_fail, align 8, !tbaa !4
  %65 = getelementptr inbounds [1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* %64, i64 0, i64 0
  tail call void @longjmp(%struct.__jmp_buf_tag* noundef %65, i32 noundef 1) #20
  unreachable

66:                                               ; preds = %59, %55, %49, %43, %19
  store i8 1, i8* %16, align 8, !tbaa !8
  br label %67

67:                                               ; preds = %14, %66
  %68 = getelementptr inbounds %struct.dso, %struct.dso* %15, i64 0, i32 3
  %69 = load %struct.dso*, %struct.dso** %68, align 8, !tbaa !4
  %70 = icmp eq %struct.dso* %69, null
  br i1 %70, label %71, label %14

71:                                               ; preds = %67, %1
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %3) #14
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind optsize readonly strictfp
define internal fastcc { %struct.Elf64_Sym*, %struct.dso* } @find_sym(%struct.dso* noundef %0, i8* nocapture noundef readonly %1, i32 noundef %2) unnamed_addr #7 {
  %4 = load i8, i8* %1, align 1, !tbaa !8
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %16, label %6

6:                                                ; preds = %3, %6
  %7 = phi i8 [ %14, %6 ], [ %4, %3 ]
  %8 = phi i32 [ %12, %6 ], [ 5381, %3 ]
  %9 = phi i8* [ %13, %6 ], [ %1, %3 ]
  %10 = zext i8 %7 to i32
  %11 = mul i32 %8, 33
  %12 = add i32 %11, %10
  %13 = getelementptr inbounds i8, i8* %9, i64 1
  %14 = load i8, i8* %13, align 1, !tbaa !8
  %15 = icmp eq i8 %14, 0
  br i1 %15, label %16, label %6

16:                                               ; preds = %6, %3
  %17 = phi i32 [ 5381, %3 ], [ %12, %6 ]
  %18 = lshr i32 %17, 6
  %19 = and i32 %17, 63
  %20 = zext i32 %19 to i64
  %21 = shl nuw i64 1, %20
  %22 = icmp eq %struct.dso* %0, null
  br i1 %22, label %236, label %23

23:                                               ; preds = %16
  %24 = icmp eq i32 %2, 0
  br label %25

25:                                               ; preds = %231, %23
  %26 = phi %struct.dso* [ %0, %23 ], [ %234, %231 ]
  %27 = phi i32 [ 0, %23 ], [ %232, %231 ]
  %28 = getelementptr inbounds %struct.dso, %struct.dso* %26, i64 0, i32 10
  %29 = load i32*, i32** %28, align 8, !tbaa !4
  %30 = icmp eq i32* %29, null
  br i1 %30, label %120, label %31

31:                                               ; preds = %25
  %32 = getelementptr inbounds i32, i32* %29, i64 4
  %33 = bitcast i32* %32 to i64*
  %34 = getelementptr inbounds i32, i32* %29, i64 2
  %35 = load i32, i32* %34, align 4, !tbaa !13
  %36 = add i32 %35, 67108863
  %37 = and i32 %36, %18
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds i64, i64* %33, i64 %38
  %40 = load i64, i64* %39, align 8, !tbaa !9
  %41 = and i64 %40, %21
  %42 = icmp eq i64 %41, 0
  br i1 %42, label %231, label %43

43:                                               ; preds = %31
  %44 = getelementptr inbounds i32, i32* %29, i64 3
  %45 = load i32, i32* %44, align 4, !tbaa !13
  %46 = lshr i32 %17, %45
  %47 = and i32 %46, 63
  %48 = zext i32 %47 to i64
  %49 = shl nuw i64 1, %48
  %50 = and i64 %49, %40
  %51 = icmp eq i64 %50, 0
  br i1 %51, label %231, label %52

52:                                               ; preds = %43
  %53 = load i32, i32* %29, align 4, !tbaa !13
  %54 = zext i32 %35 to i64
  %55 = shl nuw nsw i64 %54, 1
  %56 = getelementptr inbounds i32, i32* %32, i64 %55
  %57 = urem i32 %17, %53
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32* %56, i64 %58
  %60 = load i32, i32* %59, align 4, !tbaa !13
  %61 = icmp eq i32 %60, 0
  br i1 %61, label %231, label %62

62:                                               ; preds = %52
  %63 = zext i32 %53 to i64
  %64 = getelementptr inbounds i32, i32* %56, i64 %63
  %65 = getelementptr inbounds i32, i32* %29, i64 1
  %66 = load i32, i32* %65, align 4, !tbaa !13
  %67 = sub i32 %60, %66
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32* %64, i64 %68
  %70 = getelementptr inbounds %struct.dso, %struct.dso* %26, i64 0, i32 11
  %71 = getelementptr inbounds %struct.dso, %struct.dso* %26, i64 0, i32 12
  %72 = getelementptr inbounds %struct.dso, %struct.dso* %26, i64 0, i32 8
  br label %73

73:                                               ; preds = %118, %62
  %74 = phi i32 [ %60, %62 ], [ %119, %118 ]
  %75 = phi i32* [ %69, %62 ], [ %76, %118 ]
  %76 = getelementptr inbounds i32, i32* %75, i64 1
  %77 = load i32, i32* %75, align 4, !tbaa !13
  %78 = xor i32 %77, %17
  %79 = icmp ult i32 %78, 2
  br i1 %79, label %80, label %115

80:                                               ; preds = %73
  %81 = load i16*, i16** %70, align 8, !tbaa !4
  %82 = icmp eq i16* %81, null
  %83 = zext i32 %74 to i64
  br i1 %82, label %88, label %84

84:                                               ; preds = %80
  %85 = getelementptr inbounds i16, i16* %81, i64 %83
  %86 = load i16, i16* %85, align 2, !tbaa !27
  %87 = icmp sgt i16 %86, -1
  br i1 %87, label %88, label %115

88:                                               ; preds = %84, %80
  %89 = load i8*, i8** %71, align 8, !tbaa !4
  %90 = load %struct.Elf64_Sym*, %struct.Elf64_Sym** %72, align 8, !tbaa !4
  %91 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %90, i64 %83, i32 0
  %92 = load i32, i32* %91, align 8, !tbaa !28
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds i8, i8* %89, i64 %93
  %95 = load i8, i8* %94, align 1, !tbaa !8
  %96 = icmp ne i8 %4, %95
  %97 = or i1 %5, %96
  br i1 %97, label %108, label %98

98:                                               ; preds = %88, %98
  %99 = phi i8* [ %102, %98 ], [ %94, %88 ]
  %100 = phi i8* [ %101, %98 ], [ %1, %88 ]
  %101 = getelementptr inbounds i8, i8* %100, i64 1
  %102 = getelementptr inbounds i8, i8* %99, i64 1
  %103 = load i8, i8* %101, align 1, !tbaa !8
  %104 = load i8, i8* %102, align 1, !tbaa !8
  %105 = icmp ne i8 %103, %104
  %106 = icmp eq i8 %103, 0
  %107 = or i1 %106, %105
  br i1 %107, label %108, label %98

108:                                              ; preds = %98, %88
  %109 = phi i8 [ %4, %88 ], [ %103, %98 ]
  %110 = phi i8 [ %95, %88 ], [ %104, %98 ]
  %111 = icmp eq i8 %109, %110
  br i1 %111, label %112, label %115

112:                                              ; preds = %108
  %113 = zext i32 %74 to i64
  %114 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %90, i64 %113
  br label %194

115:                                              ; preds = %108, %84, %73
  %116 = and i32 %77, 1
  %117 = icmp eq i32 %116, 0
  br i1 %117, label %118, label %231

118:                                              ; preds = %115
  %119 = add i32 %74, 1
  br label %73

120:                                              ; preds = %25
  %121 = icmp ne i32 %27, 0
  %122 = select i1 %121, i1 true, i1 %5
  br i1 %122, label %138, label %123

123:                                              ; preds = %120, %123
  %124 = phi i8 [ %134, %123 ], [ %4, %120 ]
  %125 = phi i32 [ %133, %123 ], [ 0, %120 ]
  %126 = phi i8* [ %128, %123 ], [ %1, %120 ]
  %127 = shl i32 %125, 4
  %128 = getelementptr inbounds i8, i8* %126, i64 1
  %129 = zext i8 %124 to i32
  %130 = add i32 %127, %129
  %131 = lshr i32 %130, 24
  %132 = and i32 %131, 240
  %133 = xor i32 %132, %130
  %134 = load i8, i8* %128, align 1, !tbaa !8
  %135 = icmp eq i8 %134, 0
  br i1 %135, label %136, label %123

136:                                              ; preds = %123
  %137 = and i32 %133, 268435455
  br label %138

138:                                              ; preds = %136, %120
  %139 = phi i32 [ %27, %120 ], [ %137, %136 ]
  %140 = getelementptr inbounds %struct.dso, %struct.dso* %26, i64 0, i32 8
  %141 = load %struct.Elf64_Sym*, %struct.Elf64_Sym** %140, align 8, !tbaa !4
  %142 = getelementptr inbounds %struct.dso, %struct.dso* %26, i64 0, i32 9
  %143 = load i32*, i32** %142, align 8, !tbaa !4
  %144 = getelementptr inbounds %struct.dso, %struct.dso* %26, i64 0, i32 12
  %145 = load i8*, i8** %144, align 8, !tbaa !4
  %146 = load i32, i32* %143, align 4, !tbaa !13
  %147 = urem i32 %139, %146
  %148 = add i32 %147, 2
  %149 = zext i32 %148 to i64
  %150 = getelementptr inbounds i32, i32* %143, i64 %149
  %151 = load i32, i32* %150, align 4, !tbaa !13
  %152 = icmp eq i32 %151, 0
  br i1 %152, label %231, label %153

153:                                              ; preds = %138
  %154 = getelementptr inbounds %struct.dso, %struct.dso* %26, i64 0, i32 11
  %155 = load i16*, i16** %154, align 8, !tbaa !4
  %156 = icmp eq i16* %155, null
  %157 = add i32 %146, 2
  %158 = zext i32 %157 to i64
  br label %159

159:                                              ; preds = %189, %153
  %160 = phi i32 [ %151, %153 ], [ %192, %189 ]
  %161 = zext i32 %160 to i64
  br i1 %156, label %166, label %162

162:                                              ; preds = %159
  %163 = getelementptr inbounds i16, i16* %155, i64 %161
  %164 = load i16, i16* %163, align 2, !tbaa !27
  %165 = icmp sgt i16 %164, -1
  br i1 %165, label %166, label %189

166:                                              ; preds = %162, %159
  %167 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %141, i64 %161
  %168 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %167, i64 0, i32 0
  %169 = load i32, i32* %168, align 8, !tbaa !28
  %170 = zext i32 %169 to i64
  %171 = getelementptr inbounds i8, i8* %145, i64 %170
  %172 = load i8, i8* %171, align 1, !tbaa !8
  %173 = icmp ne i8 %4, %172
  %174 = or i1 %5, %173
  br i1 %174, label %185, label %175

175:                                              ; preds = %166, %175
  %176 = phi i8* [ %179, %175 ], [ %171, %166 ]
  %177 = phi i8* [ %178, %175 ], [ %1, %166 ]
  %178 = getelementptr inbounds i8, i8* %177, i64 1
  %179 = getelementptr inbounds i8, i8* %176, i64 1
  %180 = load i8, i8* %178, align 1, !tbaa !8
  %181 = load i8, i8* %179, align 1, !tbaa !8
  %182 = icmp ne i8 %180, %181
  %183 = icmp eq i8 %180, 0
  %184 = or i1 %183, %182
  br i1 %184, label %185, label %175

185:                                              ; preds = %175, %166
  %186 = phi i8 [ %4, %166 ], [ %180, %175 ]
  %187 = phi i8 [ %172, %166 ], [ %181, %175 ]
  %188 = icmp eq i8 %186, %187
  br i1 %188, label %194, label %189

189:                                              ; preds = %185, %162
  %190 = add nuw nsw i64 %161, %158
  %191 = getelementptr inbounds i32, i32* %143, i64 %190
  %192 = load i32, i32* %191, align 4, !tbaa !13
  %193 = icmp eq i32 %192, 0
  br i1 %193, label %231, label %159

194:                                              ; preds = %185, %112
  %195 = phi i32 [ %27, %112 ], [ %139, %185 ]
  %196 = phi %struct.Elf64_Sym* [ %114, %112 ], [ %167, %185 ]
  %197 = icmp eq %struct.Elf64_Sym* %196, null
  br i1 %197, label %231, label %198

198:                                              ; preds = %194
  %199 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %196, i64 0, i32 3
  %200 = load i16, i16* %199, align 2, !tbaa !29
  %201 = icmp eq i16 %200, 0
  br i1 %201, label %206, label %202

202:                                              ; preds = %198
  %203 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %196, i64 0, i32 1
  %204 = load i8, i8* %203, align 4, !tbaa !30
  %205 = and i8 %204, 15
  br label %212

206:                                              ; preds = %198
  br i1 %24, label %207, label %231

207:                                              ; preds = %206
  %208 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %196, i64 0, i32 1
  %209 = load i8, i8* %208, align 4, !tbaa !30
  %210 = and i8 %209, 15
  %211 = icmp eq i8 %210, 6
  br i1 %211, label %231, label %212

212:                                              ; preds = %202, %207
  %213 = phi i8 [ %205, %202 ], [ %210, %207 ]
  %214 = phi i8 [ %204, %202 ], [ %209, %207 ]
  %215 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %196, i64 0, i32 4
  %216 = load i64, i64* %215, align 8, !tbaa !21
  %217 = icmp ne i64 %216, 0
  %218 = icmp eq i8 %213, 6
  %219 = select i1 %217, i1 true, i1 %218
  br i1 %219, label %220, label %231

220:                                              ; preds = %212
  %221 = zext i8 %214 to i32
  %222 = and i32 %221, 15
  %223 = shl nuw nsw i32 1, %222
  %224 = and i32 %223, 103
  %225 = icmp eq i32 %224, 0
  br i1 %225, label %231, label %226

226:                                              ; preds = %220
  %227 = lshr i32 %221, 4
  %228 = shl nuw nsw i32 1, %227
  %229 = and i32 %228, 1030
  %230 = icmp eq i32 %229, 0
  br i1 %230, label %231, label %236

231:                                              ; preds = %115, %189, %226, %220, %212, %207, %206, %194, %138, %52, %43, %31
  %232 = phi i32 [ %195, %226 ], [ %195, %194 ], [ %195, %207 ], [ %195, %206 ], [ %195, %220 ], [ %27, %31 ], [ %27, %43 ], [ %27, %52 ], [ %139, %138 ], [ %195, %212 ], [ %139, %189 ], [ %27, %115 ]
  %233 = getelementptr inbounds %struct.dso, %struct.dso* %26, i64 0, i32 13
  %234 = load %struct.dso*, %struct.dso** %233, align 8, !tbaa !4
  %235 = icmp eq %struct.dso* %234, null
  br i1 %235, label %236, label %25

236:                                              ; preds = %226, %231, %16
  %237 = phi %struct.dso* [ null, %16 ], [ null, %231 ], [ %26, %226 ]
  %238 = phi %struct.Elf64_Sym* [ null, %16 ], [ null, %231 ], [ %196, %226 ]
  %239 = insertvalue { %struct.Elf64_Sym*, %struct.dso* } poison, %struct.Elf64_Sym* %238, 0
  %240 = insertvalue { %struct.Elf64_Sym*, %struct.dso* } %239, %struct.dso* %237, 1
  ret { %struct.Elf64_Sym*, %struct.dso* } %240
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.stackrestore(i8*) #6

; Function Attrs: nounwind optsize strictfp
define void @__dls2b(i64* noundef %0, i64* noundef %1) local_unnamed_addr #0 {
  %3 = load i64, i64* %1, align 8, !tbaa !9
  %4 = icmp eq i64 %3, 16
  br i1 %4, label %13, label %5

5:                                                ; preds = %2, %9
  %6 = phi i64 [ %11, %9 ], [ %3, %2 ]
  %7 = phi i64* [ %10, %9 ], [ %1, %2 ]
  %8 = icmp eq i64 %6, 0
  br i1 %8, label %17, label %9

9:                                                ; preds = %5
  %10 = getelementptr inbounds i64, i64* %7, i64 2
  %11 = load i64, i64* %10, align 8, !tbaa !9
  %12 = icmp eq i64 %11, 16
  br i1 %12, label %13, label %5

13:                                               ; preds = %9, %2
  %14 = phi i64* [ %1, %2 ], [ %10, %9 ]
  %15 = getelementptr inbounds i64, i64* %14, i64 1
  %16 = load i64, i64* %15, align 8, !tbaa !9
  store i64 %16, i64* @__hwcap, align 8, !tbaa !9
  br label %17

17:                                               ; preds = %5, %13
  store i64* %1, i64** getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 5), align 8, !tbaa !31
  store i64 336, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 7), align 8, !tbaa !34
  %18 = load i64, i64* @tls_align, align 8, !tbaa !9
  store i64 %18, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 8), align 8, !tbaa !35
  %19 = tail call i8* @__copy_tls(i8* noundef getelementptr inbounds ([1 x %struct.builtin_tls], [1 x %struct.builtin_tls]* @builtin_tls, i64 0, i64 0, i32 0)) #16
  %20 = tail call i32 @__init_tp(i8* noundef %19) #16
  %21 = icmp slt i32 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %17
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #14, !srcloc !20
  br label %23

23:                                               ; preds = %22, %17
  %24 = tail call fastcc { %struct.Elf64_Sym*, %struct.dso* } @find_sym(%struct.dso* noundef nonnull @ldso, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i32 noundef 0) #17
  %25 = extractvalue { %struct.Elf64_Sym*, %struct.dso* } %24, 0
  %26 = load i8*, i8** getelementptr inbounds (%struct.dso, %struct.dso* @ldso, i64 0, i32 0), align 8, !tbaa !4
  %27 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %25, i64 0, i32 4
  %28 = load i64, i64* %27, align 8, !tbaa !21
  %29 = getelementptr inbounds i8, i8* %26, i64 %28
  %30 = bitcast i8* %29 to void (i64*, i64*)*
  tail call void %30(i64* noundef %0, i64* noundef nonnull %1) #16
  ret void
}

; Function Attrs: optsize
declare hidden i32 @__init_tp(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i8* @__copy_tls(i8* noundef) local_unnamed_addr #2

; Function Attrs: noreturn nounwind optsize strictfp
define void @__dls3(i64* noundef %0, i64* nocapture noundef readonly %1) local_unnamed_addr #8 {
  %3 = alloca [32 x i64], align 16
  %4 = bitcast [32 x i64]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %4) #14
  %5 = load i64, i64* %0, align 8, !tbaa !9
  %6 = getelementptr inbounds i64, i64* %0, i64 1
  %7 = bitcast i64* %6 to i8**
  %8 = shl i64 %5, 32
  %9 = ashr exact i64 %8, 32
  %10 = getelementptr inbounds i64, i64* %6, i64 %9
  %11 = getelementptr inbounds i64, i64* %10, i64 1
  store i64* %11, i64** bitcast (i8*** @__environ to i64**), align 8, !tbaa !4
  %12 = getelementptr inbounds [32 x i64], [32 x i64]* %3, i64 0, i64 0
  call fastcc void @decode_vec(i64* noundef %1, i64* noundef nonnull %12) #17
  %13 = load i64, i64* %1, align 8, !tbaa !9
  %14 = icmp eq i64 %13, 32
  br i1 %14, label %23, label %15

15:                                               ; preds = %2, %19
  %16 = phi i64 [ %21, %19 ], [ %13, %2 ]
  %17 = phi i64* [ %20, %19 ], [ %1, %2 ]
  %18 = icmp eq i64 %16, 0
  br i1 %18, label %27, label %19

19:                                               ; preds = %15
  %20 = getelementptr inbounds i64, i64* %17, i64 2
  %21 = load i64, i64* %20, align 8, !tbaa !9
  %22 = icmp eq i64 %21, 32
  br i1 %22, label %23, label %15

23:                                               ; preds = %19, %2
  %24 = phi i64* [ %1, %2 ], [ %20, %19 ]
  %25 = getelementptr inbounds i64, i64* %24, i64 1
  %26 = load i64, i64* %25, align 8, !tbaa !9
  store i64 %26, i64* @__sysinfo, align 8, !tbaa !9
  br label %29

27:                                               ; preds = %15
  %28 = load i64, i64* @__sysinfo, align 8, !tbaa !9
  br label %29

29:                                               ; preds = %27, %23
  %30 = phi i64 [ %28, %27 ], [ %26, %23 ]
  %31 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !3
  %32 = inttoptr i64 %31 to %struct.__pthread*
  %33 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %32, i64 0, i32 4
  store i64 %30, i64* %33, align 8, !tbaa !36
  %34 = getelementptr inbounds [32 x i64], [32 x i64]* %3, i64 0, i64 6
  %35 = load i64, i64* %34, align 16, !tbaa !9
  store i64 %35, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 10), align 8, !tbaa !39
  %36 = load i64, i64* %12, align 16, !tbaa !9
  %37 = and i64 %36, 30720
  %38 = icmp eq i64 %37, 30720
  br i1 %38, label %39, label %51

39:                                               ; preds = %29
  %40 = getelementptr inbounds [32 x i64], [32 x i64]* %3, i64 0, i64 11
  %41 = load i64, i64* %40, align 8, !tbaa !9
  %42 = getelementptr inbounds [32 x i64], [32 x i64]* %3, i64 0, i64 12
  %43 = load i64, i64* %42, align 16, !tbaa !9
  %44 = icmp eq i64 %41, %43
  br i1 %44, label %45, label %51

45:                                               ; preds = %39
  %46 = getelementptr inbounds [32 x i64], [32 x i64]* %3, i64 0, i64 13
  %47 = load i64, i64* %46, align 8, !tbaa !9
  %48 = getelementptr inbounds [32 x i64], [32 x i64]* %3, i64 0, i64 14
  %49 = load i64, i64* %48, align 16, !tbaa !9
  %50 = icmp eq i64 %47, %49
  br i1 %50, label %52, label %51

51:                                               ; preds = %45, %39, %29
  store i8 1, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 2), align 2, !tbaa !40
  br label %60

52:                                               ; preds = %45
  %53 = getelementptr inbounds [32 x i64], [32 x i64]* %3, i64 0, i64 23
  %54 = load i64, i64* %53, align 8, !tbaa !9
  %55 = icmp ne i64 %54, 0
  %56 = zext i1 %55 to i8
  store i8 %56, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 2), align 2, !tbaa !40
  br i1 %55, label %60, label %57

57:                                               ; preds = %52
  %58 = tail call i8* @getenv(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)) #16
  store i8* %58, i8** @env_path, align 8, !tbaa !4
  %59 = tail call i8* @getenv(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i64 0, i64 0)) #16
  br label %60

60:                                               ; preds = %51, %57, %52
  %61 = phi i8* [ null, %52 ], [ %59, %57 ], [ null, %51 ]
  %62 = getelementptr inbounds [32 x i64], [32 x i64]* %3, i64 0, i64 3
  %63 = load i64, i64* %62, align 8, !tbaa !9
  %64 = load %struct.Elf64_Phdr*, %struct.Elf64_Phdr** getelementptr inbounds (%struct.dso, %struct.dso* @ldso, i64 0, i32 5), align 8, !tbaa !4
  %65 = ptrtoint %struct.Elf64_Phdr* %64 to i64
  %66 = icmp eq i64 %63, %65
  br i1 %66, label %132, label %67

67:                                               ; preds = %60
  %68 = inttoptr i64 %63 to %struct.Elf64_Phdr*
  store %struct.Elf64_Phdr* %68, %struct.Elf64_Phdr** getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.app, i64 0, i32 5), align 8, !tbaa !4
  %69 = getelementptr inbounds [32 x i64], [32 x i64]* %3, i64 0, i64 5
  %70 = load i64, i64* %69, align 8, !tbaa !9
  %71 = trunc i64 %70 to i32
  store i32 %71, i32* getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.app, i64 0, i32 6), align 8, !tbaa !13
  %72 = getelementptr inbounds [32 x i64], [32 x i64]* %3, i64 0, i64 4
  %73 = load i64, i64* %72, align 16, !tbaa !9
  store i64 %73, i64* getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.app, i64 0, i32 7), align 8, !tbaa !9
  %74 = icmp eq i64 %70, 0
  br i1 %74, label %106, label %75

75:                                               ; preds = %67, %98
  %76 = phi i64 [ %101, %98 ], [ %70, %67 ]
  %77 = phi i64 [ %100, %98 ], [ 0, %67 ]
  %78 = phi i64 [ %99, %98 ], [ 0, %67 ]
  %79 = phi %struct.Elf64_Phdr* [ %104, %98 ], [ %68, %67 ]
  %80 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %79, i64 0, i32 0
  %81 = load i32, i32* %80, align 8, !tbaa !23
  switch i32 %81, label %98 [
    i32 6, label %82
    i32 3, label %87
    i32 7, label %90
  ]

82:                                               ; preds = %75
  %83 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %79, i64 0, i32 3
  %84 = load i64, i64* %83, align 8, !tbaa !25
  %85 = sub i64 %63, %84
  %86 = inttoptr i64 %85 to i8*
  store i8* %86, i8** getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.app, i64 0, i32 0), align 8, !tbaa !4
  br label %98

87:                                               ; preds = %75
  %88 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %79, i64 0, i32 3
  %89 = load i64, i64* %88, align 8, !tbaa !25
  br label %98

90:                                               ; preds = %75
  %91 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %79, i64 0, i32 3
  %92 = load i64, i64* %91, align 8, !tbaa !25
  %93 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %79, i64 0, i32 5
  %94 = bitcast i64* %93 to <2 x i64>*
  %95 = load <2 x i64>, <2 x i64>* %94, align 8, !tbaa !9
  store <2 x i64> %95, <2 x i64>* bitcast (i64* getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.app, i64 0, i32 34, i32 2) to <2 x i64>*), align 8, !tbaa !9
  %96 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %79, i64 0, i32 7
  %97 = load i64, i64* %96, align 8, !tbaa !41
  store i64 %97, i64* getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.app, i64 0, i32 34, i32 4), align 8, !tbaa !42
  br label %98

98:                                               ; preds = %75, %82, %90, %87
  %99 = phi i64 [ %78, %82 ], [ %78, %87 ], [ %92, %90 ], [ %78, %75 ]
  %100 = phi i64 [ %77, %82 ], [ %89, %87 ], [ %77, %90 ], [ %77, %75 ]
  %101 = add i64 %76, -1
  %102 = bitcast %struct.Elf64_Phdr* %79 to i8*
  %103 = getelementptr inbounds i8, i8* %102, i64 %73
  %104 = bitcast i8* %103 to %struct.Elf64_Phdr*
  %105 = icmp eq i64 %101, 0
  br i1 %105, label %106, label %75

106:                                              ; preds = %98, %67
  %107 = phi i64 [ 0, %67 ], [ %99, %98 ]
  %108 = phi i64 [ 0, %67 ], [ %100, %98 ]
  %109 = load i64, i64* getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.app, i64 0, i32 34, i32 3), align 8, !tbaa !44
  %110 = icmp eq i64 %109, 0
  br i1 %110, label %114, label %111

111:                                              ; preds = %106
  %112 = load i8*, i8** getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.app, i64 0, i32 0), align 8, !tbaa !4
  %113 = getelementptr inbounds i8, i8* %112, i64 %107
  store i8* %113, i8** getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.app, i64 0, i32 34, i32 1), align 8, !tbaa !45
  br label %114

114:                                              ; preds = %111, %106
  %115 = icmp eq i64 %108, 0
  br i1 %115, label %119, label %116

116:                                              ; preds = %114
  %117 = load i8*, i8** getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.app, i64 0, i32 0), align 8, !tbaa !4
  %118 = getelementptr inbounds i8, i8* %117, i64 %108
  store i8* %118, i8** getelementptr inbounds (%struct.dso, %struct.dso* @ldso, i64 0, i32 1), align 8, !tbaa !4
  br label %119

119:                                              ; preds = %116, %114
  %120 = and i64 %36, 2147483648
  %121 = icmp eq i64 %120, 0
  br i1 %121, label %128, label %122

122:                                              ; preds = %119
  %123 = getelementptr inbounds [32 x i64], [32 x i64]* %3, i64 0, i64 31
  %124 = load i64, i64* %123, align 8, !tbaa !9
  %125 = inttoptr i64 %124 to i8*
  %126 = tail call i32 @strncmp(i8* noundef %125, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), i64 noundef 6) #16
  %127 = icmp eq i32 %126, 0
  br i1 %127, label %128, label %130

128:                                              ; preds = %122, %119
  %129 = load i8*, i8** %7, align 8, !tbaa !4
  br label %130

130:                                              ; preds = %122, %128
  %131 = phi i8* [ %129, %128 ], [ %125, %122 ]
  store i8* %131, i8** getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.app, i64 0, i32 1), align 8, !tbaa !4
  tail call fastcc void @kernel_mapped_dso(%struct.dso* noundef nonnull @__dls3.app) #17
  br label %309

132:                                              ; preds = %60
  %133 = load i8*, i8** %7, align 8, !tbaa !4
  %134 = tail call i64 @strlen(i8* noundef %133) #16
  %135 = icmp ugt i64 %134, 2
  br i1 %135, label %136, label %154

136:                                              ; preds = %132
  %137 = getelementptr inbounds i8, i8* %133, i64 %134
  %138 = getelementptr inbounds i8, i8* %137, i64 -3
  %139 = load i8, i8* %138, align 1, !tbaa !8
  %140 = icmp eq i8 %139, 108
  br i1 %140, label %141, label %154

141:                                              ; preds = %136, %141
  %142 = phi i8* [ %145, %141 ], [ getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i64 0, i64 0), %136 ]
  %143 = phi i8* [ %144, %141 ], [ %138, %136 ]
  %144 = getelementptr inbounds i8, i8* %143, i64 1
  %145 = getelementptr inbounds i8, i8* %142, i64 1
  %146 = load i8, i8* %144, align 1, !tbaa !8
  %147 = load i8, i8* %145, align 1, !tbaa !8
  %148 = icmp ne i8 %146, %147
  %149 = icmp eq i8 %146, 0
  %150 = or i1 %149, %148
  br i1 %150, label %151, label %141

151:                                              ; preds = %141
  %152 = icmp eq i8 %146, %147
  br i1 %152, label %153, label %154

153:                                              ; preds = %151
  store i1 true, i1* @ldd_mode, align 4
  br label %154

154:                                              ; preds = %136, %153, %151, %132
  %155 = getelementptr inbounds i64, i64* %0, i64 2
  %156 = bitcast i64* %155 to i8**
  %157 = load i8*, i8** %156, align 8, !tbaa !4
  %158 = icmp eq i8* %157, null
  br i1 %158, label %227, label %159

159:                                              ; preds = %154, %220
  %160 = phi i8* [ %224, %220 ], [ %157, %154 ]
  %161 = phi i8* [ %223, %220 ], [ %61, %154 ]
  %162 = phi i8* [ %222, %220 ], [ null, %154 ]
  %163 = phi i8** [ %221, %220 ], [ %156, %154 ]
  %164 = load i8, i8* %160, align 1, !tbaa !8
  %165 = icmp eq i8 %164, 45
  br i1 %165, label %166, label %236

166:                                              ; preds = %159
  %167 = getelementptr inbounds i8, i8* %160, i64 1
  %168 = load i8, i8* %167, align 1, !tbaa !8
  %169 = icmp eq i8 %168, 45
  br i1 %169, label %170, label %236

170:                                              ; preds = %166
  %171 = getelementptr inbounds i8, i8* %160, i64 2
  %172 = getelementptr inbounds i8*, i8** %163, i64 1
  store i8* inttoptr (i64 -1 to i8*), i8** %163, align 8, !tbaa !4
  %173 = load i8, i8* %171, align 1, !tbaa !8
  %174 = icmp eq i8 %173, 0
  br i1 %174, label %244, label %175

175:                                              ; preds = %170
  %176 = tail call i32 @memcmp(i8* noundef nonnull %171, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 noundef 5) #16
  %177 = icmp eq i32 %176, 0
  br i1 %177, label %178, label %179

178:                                              ; preds = %175
  store i1 true, i1* @ldd_mode, align 4
  br label %220

179:                                              ; preds = %175
  %180 = tail call i32 @memcmp(i8* noundef nonnull %171, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.8, i64 0, i64 0), i64 noundef 12) #16
  %181 = icmp eq i32 %180, 0
  br i1 %181, label %182, label %192

182:                                              ; preds = %179
  %183 = getelementptr inbounds i8, i8* %160, i64 14
  %184 = load i8, i8* %183, align 1, !tbaa !8
  switch i8 %184, label %226 [
    i8 61, label %185
    i8 0, label %187
  ]

185:                                              ; preds = %182
  %186 = getelementptr inbounds i8, i8* %160, i64 15
  store i8* %186, i8** @env_path, align 8, !tbaa !4
  br label %220

187:                                              ; preds = %182
  %188 = load i8*, i8** %172, align 8, !tbaa !4
  %189 = icmp eq i8* %188, null
  br i1 %189, label %227, label %190

190:                                              ; preds = %187
  %191 = getelementptr inbounds i8*, i8** %163, i64 2
  store i8* %188, i8** @env_path, align 8, !tbaa !4
  br label %220

192:                                              ; preds = %179
  %193 = tail call i32 @memcmp(i8* noundef nonnull %171, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i64 noundef 7) #16
  %194 = icmp eq i32 %193, 0
  br i1 %194, label %195, label %206

195:                                              ; preds = %192
  %196 = getelementptr inbounds i8, i8* %160, i64 9
  %197 = load i8, i8* %196, align 1, !tbaa !8
  switch i8 %197, label %226 [
    i8 61, label %198
    i8 0, label %200
  ]

198:                                              ; preds = %195
  %199 = getelementptr inbounds i8, i8* %160, i64 10
  br label %220

200:                                              ; preds = %195
  %201 = load i8*, i8** %172, align 8, !tbaa !4
  %202 = icmp eq i8* %201, null
  %203 = getelementptr inbounds i8*, i8** %163, i64 2
  %204 = select i1 %202, i8** %172, i8** %203
  %205 = select i1 %202, i8* %161, i8* %201
  br label %220

206:                                              ; preds = %192
  %207 = tail call i32 @memcmp(i8* noundef nonnull %171, i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.10, i64 0, i64 0), i64 noundef 5) #16
  %208 = icmp eq i32 %207, 0
  br i1 %208, label %209, label %226

209:                                              ; preds = %206
  %210 = getelementptr inbounds i8, i8* %160, i64 7
  %211 = load i8, i8* %210, align 1, !tbaa !8
  switch i8 %211, label %226 [
    i8 61, label %212
    i8 0, label %214
  ]

212:                                              ; preds = %209
  %213 = getelementptr inbounds i8, i8* %160, i64 8
  br label %220

214:                                              ; preds = %209
  %215 = load i8*, i8** %172, align 8, !tbaa !4
  %216 = icmp eq i8* %215, null
  %217 = getelementptr inbounds i8*, i8** %163, i64 2
  %218 = select i1 %216, i8** %172, i8** %217
  %219 = select i1 %216, i8* %162, i8* %215
  br label %220

220:                                              ; preds = %214, %200, %190, %185, %212, %198, %178
  %221 = phi i8** [ %218, %214 ], [ %204, %200 ], [ %172, %178 ], [ %191, %190 ], [ %172, %185 ], [ %172, %198 ], [ %172, %212 ]
  %222 = phi i8* [ %219, %214 ], [ %162, %200 ], [ %162, %178 ], [ %162, %190 ], [ %162, %185 ], [ %162, %198 ], [ %213, %212 ]
  %223 = phi i8* [ %161, %214 ], [ %205, %200 ], [ %161, %178 ], [ %161, %190 ], [ %161, %185 ], [ %199, %198 ], [ %161, %212 ]
  %224 = load i8*, i8** %221, align 8, !tbaa !4
  %225 = icmp eq i8* %224, null
  br i1 %225, label %227, label %159

226:                                              ; preds = %206, %209, %195, %182
  store i8* null, i8** %172, align 8, !tbaa !4
  br label %227

227:                                              ; preds = %220, %187, %226, %154
  %228 = phi i8** [ %156, %154 ], [ %172, %226 ], [ %172, %187 ], [ %221, %220 ]
  %229 = ptrtoint i8** %228 to i64
  %230 = ptrtoint i64* %6 to i64
  %231 = sub i64 %229, %230
  %232 = ashr exact i64 %231, 3
  %233 = sub nsw i64 %9, %232
  %234 = inttoptr i64 %233 to i8*
  %235 = getelementptr inbounds i8*, i8** %228, i64 -1
  store i8* %234, i8** %235, align 8, !tbaa !4
  br label %253

236:                                              ; preds = %159, %166
  %237 = ptrtoint i8** %163 to i64
  %238 = ptrtoint i64* %6 to i64
  %239 = sub i64 %237, %238
  %240 = ashr exact i64 %239, 3
  %241 = sub nsw i64 %9, %240
  %242 = inttoptr i64 %241 to i8*
  %243 = getelementptr inbounds i8*, i8** %163, i64 -1
  store i8* %242, i8** %243, align 8, !tbaa !4
  br label %257

244:                                              ; preds = %170
  %245 = load i8*, i8** %172, align 8, !tbaa !4
  %246 = ptrtoint i8** %172 to i64
  %247 = ptrtoint i64* %6 to i64
  %248 = sub i64 %246, %247
  %249 = ashr exact i64 %248, 3
  %250 = sub nsw i64 %9, %249
  %251 = inttoptr i64 %250 to i8*
  store i8* %251, i8** %163, align 8, !tbaa !4
  %252 = icmp eq i8* %245, null
  br i1 %252, label %253, label %257

253:                                              ; preds = %227, %244
  %254 = load i1, i1* @ldd_mode, align 4
  %255 = select i1 %254, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.13, i64 0, i64 0)
  %256 = tail call i32 (i32, i8*, ...) @dprintf(i32 noundef 2, i8* noundef getelementptr inbounds ([90 x i8], [90 x i8]* @.str.11, i64 0, i64 0), i8* noundef getelementptr inbounds ([0 x i8], [0 x i8]* @__libc_version, i64 0, i64 0), i8* noundef %133, i8* noundef %255) #16
  tail call void @_exit(i32 noundef 1) #20
  unreachable

257:                                              ; preds = %236, %244
  %258 = phi i8** [ %163, %236 ], [ %172, %244 ]
  %259 = phi i8* [ %160, %236 ], [ %245, %244 ]
  %260 = tail call i32 (i8*, i32, ...) @open(i8* noundef nonnull %259, i32 noundef 0) #16
  %261 = icmp slt i32 %260, 0
  br i1 %261, label %262, label %268

262:                                              ; preds = %257
  %263 = load i8*, i8** %258, align 8, !tbaa !4
  %264 = tail call i32* @___errno_location() #19
  %265 = load i32, i32* %264, align 4, !tbaa !13
  %266 = tail call i8* @strerror(i32 noundef %265) #16
  %267 = tail call i32 (i32, i8*, ...) @dprintf(i32 noundef 2, i8* noundef getelementptr inbounds ([24 x i8], [24 x i8]* @.str.14, i64 0, i64 0), i8* noundef %133, i8* noundef %263, i8* noundef %266) #16
  tail call void @_exit(i32 noundef 1) #20
  unreachable

268:                                              ; preds = %257
  %269 = tail call fastcc i8* @map_library(i32 noundef %260, %struct.dso* noundef nonnull @__dls3.app) #17
  %270 = icmp eq i8* %269, null
  br i1 %270, label %271, label %274

271:                                              ; preds = %268
  %272 = load i8*, i8** %258, align 8, !tbaa !4
  %273 = tail call i32 (i32, i8*, ...) @dprintf(i32 noundef 2, i8* noundef getelementptr inbounds ([37 x i8], [37 x i8]* @.str.15, i64 0, i64 0), i8* noundef %133, i8* noundef %272) #16
  tail call void @_exit(i32 noundef 1) #20
  unreachable

274:                                              ; preds = %268
  %275 = tail call i32 @close(i32 noundef %260) #16
  store i8* %133, i8** getelementptr inbounds (%struct.dso, %struct.dso* @ldso, i64 0, i32 1), align 8, !tbaa !4
  %276 = load i8*, i8** %258, align 8, !tbaa !4
  store i8* %276, i8** getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.app, i64 0, i32 1), align 8, !tbaa !4
  %277 = load i8*, i8** getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.app, i64 0, i32 0), align 8, !tbaa !4
  %278 = getelementptr inbounds i8, i8* %269, i64 24
  %279 = bitcast i8* %278 to i64*
  %280 = load i64, i64* %279, align 8, !tbaa !46
  %281 = getelementptr inbounds i8, i8* %277, i64 %280
  %282 = ptrtoint i8* %281 to i64
  %283 = getelementptr inbounds [32 x i64], [32 x i64]* %3, i64 0, i64 9
  store i64 %282, i64* %283, align 8, !tbaa !9
  %284 = load i1, i1* @ldd_mode, align 4
  br i1 %284, label %285, label %309

285:                                              ; preds = %274
  %286 = load i32, i32* getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.app, i64 0, i32 6), align 8, !tbaa !13
  %287 = icmp eq i32 %286, 0
  br i1 %287, label %305, label %288

288:                                              ; preds = %285
  %289 = load %struct.Elf64_Phdr*, %struct.Elf64_Phdr** getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.app, i64 0, i32 5), align 8, !tbaa !4
  %290 = sext i32 %286 to i64
  br label %291

291:                                              ; preds = %288, %301
  %292 = phi i8* [ %133, %288 ], [ %302, %301 ]
  %293 = phi i64 [ 0, %288 ], [ %303, %301 ]
  %294 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %289, i64 %293, i32 0
  %295 = load i32, i32* %294, align 8, !tbaa !23
  %296 = icmp eq i32 %295, 3
  br i1 %296, label %297, label %301

297:                                              ; preds = %291
  %298 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %289, i64 %293, i32 3
  %299 = load i64, i64* %298, align 8, !tbaa !25
  %300 = getelementptr inbounds i8, i8* %277, i64 %299
  store i8* %300, i8** getelementptr inbounds (%struct.dso, %struct.dso* @ldso, i64 0, i32 1), align 8, !tbaa !4
  br label %301

301:                                              ; preds = %291, %297
  %302 = phi i8* [ %292, %291 ], [ %300, %297 ]
  %303 = add nuw i64 %293, 1
  %304 = icmp eq i64 %303, %290
  br i1 %304, label %305, label %291

305:                                              ; preds = %301, %285
  %306 = phi i8* [ %133, %285 ], [ %302, %301 ]
  %307 = load i8*, i8** getelementptr inbounds (%struct.dso, %struct.dso* @ldso, i64 0, i32 0), align 8, !tbaa !4
  %308 = tail call i32 (i32, i8*, ...) @dprintf(i32 noundef 1, i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.16, i64 0, i64 0), i8* noundef %306, i8* noundef %307) #16
  br label %309

309:                                              ; preds = %274, %305, %130
  %310 = phi i8** [ %7, %130 ], [ %258, %305 ], [ %258, %274 ]
  %311 = phi i8* [ null, %130 ], [ %162, %305 ], [ %162, %274 ]
  %312 = phi i8* [ %61, %130 ], [ %161, %305 ], [ %161, %274 ]
  %313 = load i64, i64* getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.app, i64 0, i32 34, i32 3), align 8, !tbaa !44
  %314 = icmp eq i64 %313, 0
  br i1 %314, label %329, label %315

315:                                              ; preds = %309
  store %struct.tls_module* getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.app, i64 0, i32 34), %struct.tls_module** @tls_tail, align 8, !tbaa !4
  store %struct.tls_module* getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.app, i64 0, i32 34), %struct.tls_module** getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 6), align 8, !tbaa !47
  store i64 1, i64* @tls_cnt, align 8, !tbaa !9
  store i64 1, i64* getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.app, i64 0, i32 35), align 8, !tbaa !9
  %316 = load i8*, i8** getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.app, i64 0, i32 34, i32 1), align 8, !tbaa !45
  %317 = ptrtoint i8* %316 to i64
  %318 = add i64 %313, %317
  %319 = sub i64 0, %318
  %320 = load i64, i64* getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.app, i64 0, i32 34, i32 4), align 8, !tbaa !42
  %321 = add i64 %320, -1
  %322 = and i64 %321, %319
  %323 = add i64 %322, %313
  store i64 %323, i64* getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.app, i64 0, i32 34, i32 5), align 8, !tbaa !48
  store i64 %323, i64* @tls_offset, align 8, !tbaa !9
  %324 = load i64, i64* @tls_align, align 8, !tbaa !9
  %325 = sub i64 0, %324
  %326 = sub i64 0, %320
  %327 = and i64 %325, %326
  %328 = sub i64 0, %327
  store i64 %328, i64* @tls_align, align 8, !tbaa !9
  br label %329

329:                                              ; preds = %315, %309
  tail call fastcc void @decode_dyn(%struct.dso* noundef nonnull @__dls3.app) #17
  store %struct.dso* @__dls3.app, %struct.dso** @syms_tail, align 8, !tbaa !4
  store %struct.dso* @__dls3.app, %struct.dso** @tail, align 8, !tbaa !4
  store %struct.dso* @__dls3.app, %struct.dso** @head, align 8, !tbaa !4
  tail call fastcc void @reclaim_gaps(%struct.dso* noundef nonnull @__dls3.app) #17
  tail call fastcc void @reclaim_gaps(%struct.dso* noundef nonnull @ldso) #17
  store %struct.dso** getelementptr inbounds ([1 x %struct.dso*], [1 x %struct.dso*]* @no_deps, i64 0, i64 0), %struct.dso*** getelementptr inbounds (%struct.dso, %struct.dso* @ldso, i64 0, i32 27), align 8, !tbaa !4
  %330 = icmp eq i8* %312, null
  br i1 %330, label %371, label %331

331:                                              ; preds = %329
  %332 = load i8, i8* %312, align 1, !tbaa !8
  %333 = icmp eq i8 %332, 0
  br i1 %333, label %371, label %334

334:                                              ; preds = %331, %346
  %335 = phi i8 [ %347, %346 ], [ %332, %331 ]
  %336 = phi i8* [ %348, %346 ], [ %312, %331 ]
  %337 = freeze i8 %335
  %338 = sext i8 %337 to i32
  %339 = add nsw i32 %338, -9
  %340 = icmp ult i32 %339, 5
  br i1 %340, label %342, label %341

341:                                              ; preds = %334
  switch i8 %337, label %349 [
    i8 58, label %342
    i8 32, label %342
    i8 0, label %365
  ]

342:                                              ; preds = %341, %341, %334
  %343 = getelementptr inbounds i8, i8* %336, i64 1
  %344 = load i8, i8* %343, align 1, !tbaa !8
  %345 = icmp eq i8 %344, 0
  br i1 %345, label %365, label %346

346:                                              ; preds = %342, %365
  %347 = phi i8 [ %344, %342 ], [ %368, %365 ]
  %348 = phi i8* [ %343, %342 ], [ %367, %365 ]
  br label %334

349:                                              ; preds = %341, %357
  %350 = phi i8 [ %359, %357 ], [ %337, %341 ]
  %351 = phi i8* [ %358, %357 ], [ %336, %341 ]
  %352 = freeze i8 %350
  %353 = sext i8 %352 to i32
  %354 = add nsw i32 %353, -9
  %355 = icmp ult i32 %354, 5
  br i1 %355, label %363, label %356

356:                                              ; preds = %349
  switch i8 %352, label %357 [
    i8 58, label %361
    i8 32, label %361
  ]

357:                                              ; preds = %356
  %358 = getelementptr inbounds i8, i8* %351, i64 1
  %359 = load i8, i8* %358, align 1, !tbaa !8
  %360 = icmp eq i8 %359, 0
  br i1 %360, label %365, label %349

361:                                              ; preds = %356, %356
  %362 = freeze i8 %350
  br label %365

363:                                              ; preds = %349
  %364 = freeze i8 %350
  br label %365

365:                                              ; preds = %361, %363, %357, %341, %342
  %366 = phi i8* [ %343, %342 ], [ %336, %341 ], [ %336, %357 ], [ %336, %363 ], [ %336, %361 ]
  %367 = phi i8* [ %343, %342 ], [ %336, %341 ], [ %351, %361 ], [ %351, %363 ], [ %358, %357 ]
  %368 = phi i8 [ 0, %342 ], [ %337, %341 ], [ %362, %361 ], [ %364, %363 ], [ 0, %357 ]
  store i8 0, i8* %367, align 1, !tbaa !8
  %369 = tail call fastcc %struct.dso* @load_library(i8* noundef nonnull %366, %struct.dso* noundef null) #16
  store i8 %368, i8* %367, align 1, !tbaa !8
  %370 = icmp eq i8 %368, 0
  br i1 %370, label %371, label %346

371:                                              ; preds = %365, %331, %329
  tail call fastcc void @load_deps(%struct.dso* noundef nonnull @__dls3.app) #17
  %372 = load %struct.dso*, %struct.dso** @head, align 8, !tbaa !4
  %373 = icmp eq %struct.dso* %372, null
  br i1 %373, label %376, label %374

374:                                              ; preds = %371
  %375 = load %struct.dso*, %struct.dso** @syms_tail, align 8, !tbaa !4
  br label %392

376:                                              ; preds = %402, %371
  %377 = load i64, i64* %1, align 8, !tbaa !9
  %378 = icmp eq i64 %377, 33
  br i1 %378, label %387, label %379

379:                                              ; preds = %376, %383
  %380 = phi i64 [ %385, %383 ], [ %377, %376 ]
  %381 = phi i64* [ %384, %383 ], [ %1, %376 ]
  %382 = icmp eq i64 %380, 0
  br i1 %382, label %449, label %383

383:                                              ; preds = %379
  %384 = getelementptr inbounds i64, i64* %381, i64 2
  %385 = load i64, i64* %384, align 8, !tbaa !9
  %386 = icmp eq i64 %385, 33
  br i1 %386, label %387, label %379

387:                                              ; preds = %383, %376
  %388 = phi i64* [ %1, %376 ], [ %384, %383 ]
  %389 = getelementptr inbounds i64, i64* %388, i64 1
  %390 = load i64, i64* %389, align 8, !tbaa !9
  %391 = icmp eq i64 %390, 0
  br i1 %391, label %449, label %407

392:                                              ; preds = %374, %402
  %393 = phi %struct.dso* [ %405, %402 ], [ %372, %374 ]
  %394 = phi %struct.dso* [ %403, %402 ], [ %375, %374 ]
  %395 = getelementptr inbounds %struct.dso, %struct.dso* %393, i64 0, i32 13
  %396 = load %struct.dso*, %struct.dso** %395, align 8, !tbaa !4
  %397 = icmp ne %struct.dso* %396, null
  %398 = icmp eq %struct.dso* %394, %393
  %399 = select i1 %397, i1 true, i1 %398
  br i1 %399, label %402, label %400

400:                                              ; preds = %392
  %401 = getelementptr inbounds %struct.dso, %struct.dso* %394, i64 0, i32 13
  store %struct.dso* %393, %struct.dso** %401, align 8, !tbaa !4
  store %struct.dso* %393, %struct.dso** @syms_tail, align 8, !tbaa !4
  br label %402

402:                                              ; preds = %392, %400
  %403 = phi %struct.dso* [ %394, %392 ], [ %393, %400 ]
  %404 = getelementptr inbounds %struct.dso, %struct.dso* %393, i64 0, i32 3
  %405 = load %struct.dso*, %struct.dso** %404, align 8, !tbaa !4
  %406 = icmp eq %struct.dso* %405, null
  br i1 %406, label %376, label %392

407:                                              ; preds = %387
  %408 = inttoptr i64 %390 to %struct.Elf64_Ehdr*
  %409 = getelementptr inbounds %struct.Elf64_Ehdr, %struct.Elf64_Ehdr* %408, i64 0, i32 5
  %410 = load i64, i64* %409, align 8, !tbaa !18
  %411 = add i64 %410, %390
  %412 = inttoptr i64 %411 to %struct.Elf64_Phdr*
  store %struct.Elf64_Phdr* %412, %struct.Elf64_Phdr** getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.vdso, i64 0, i32 5), align 8, !tbaa !4
  %413 = getelementptr inbounds %struct.Elf64_Ehdr, %struct.Elf64_Ehdr* %408, i64 0, i32 10
  %414 = load i16, i16* %413, align 8, !tbaa !15
  %415 = zext i16 %414 to i32
  store i32 %415, i32* getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.vdso, i64 0, i32 6), align 8, !tbaa !13
  %416 = getelementptr inbounds %struct.Elf64_Ehdr, %struct.Elf64_Ehdr* %408, i64 0, i32 9
  %417 = load i16, i16* %416, align 2, !tbaa !19
  %418 = zext i16 %417 to i64
  store i64 %418, i64* getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.vdso, i64 0, i32 7), align 8, !tbaa !9
  %419 = icmp eq i16 %414, 0
  br i1 %419, label %446, label %420

420:                                              ; preds = %407
  %421 = zext i16 %414 to i64
  br label %422

422:                                              ; preds = %420, %440
  %423 = phi i64 [ %441, %440 ], [ %421, %420 ]
  %424 = phi %struct.Elf64_Phdr* [ %444, %440 ], [ %412, %420 ]
  %425 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %424, i64 0, i32 0
  %426 = load i32, i32* %425, align 8, !tbaa !23
  switch i32 %426, label %440 [
    i32 2, label %427
    i32 1, label %432
  ]

427:                                              ; preds = %422
  %428 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %424, i64 0, i32 2
  %429 = load i64, i64* %428, align 8, !tbaa !49
  %430 = add i64 %429, %390
  %431 = inttoptr i64 %430 to i64*
  store i64* %431, i64** getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.vdso, i64 0, i32 2), align 8, !tbaa !4
  br label %440

432:                                              ; preds = %422
  %433 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %424, i64 0, i32 3
  %434 = load i64, i64* %433, align 8, !tbaa !25
  %435 = sub i64 %390, %434
  %436 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %424, i64 0, i32 2
  %437 = load i64, i64* %436, align 8, !tbaa !49
  %438 = add i64 %435, %437
  %439 = inttoptr i64 %438 to i8*
  store i8* %439, i8** getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.vdso, i64 0, i32 0), align 8, !tbaa !4
  br label %440

440:                                              ; preds = %422, %427, %432
  %441 = add nsw i64 %423, -1
  %442 = bitcast %struct.Elf64_Phdr* %424 to i8*
  %443 = getelementptr inbounds i8, i8* %442, i64 %418
  %444 = bitcast i8* %443 to %struct.Elf64_Phdr*
  %445 = icmp eq i64 %441, 0
  br i1 %445, label %446, label %422

446:                                              ; preds = %440, %407
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i64 0, i64 0), i8** getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.vdso, i64 0, i32 1), align 8, !tbaa !4
  store i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.17, i64 0, i64 0), i8** getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.vdso, i64 0, i32 42), align 8, !tbaa !4
  store i8 1, i8* getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.vdso, i64 0, i32 21), align 8, !tbaa !8
  store %struct.dso** getelementptr inbounds ([1 x %struct.dso*], [1 x %struct.dso*]* @no_deps, i64 0, i64 0), %struct.dso*** getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.vdso, i64 0, i32 27), align 8, !tbaa !4
  tail call fastcc void @decode_dyn(%struct.dso* noundef nonnull @__dls3.vdso) #17
  %447 = load %struct.dso*, %struct.dso** @tail, align 8, !tbaa !4
  store %struct.dso* %447, %struct.dso** getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.vdso, i64 0, i32 4), align 8, !tbaa !4
  %448 = getelementptr inbounds %struct.dso, %struct.dso* %447, i64 0, i32 3
  store %struct.dso* @__dls3.vdso, %struct.dso** %448, align 8, !tbaa !4
  store %struct.dso* @__dls3.vdso, %struct.dso** @tail, align 8, !tbaa !4
  br label %449

449:                                              ; preds = %379, %446, %387
  %450 = load i64*, i64** getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.app, i64 0, i32 2), align 8, !tbaa !4
  br label %451

451:                                              ; preds = %458, %449
  %452 = phi i64 [ 0, %449 ], [ %459, %458 ]
  %453 = getelementptr inbounds i64, i64* %450, i64 %452
  %454 = load i64, i64* %453, align 8, !tbaa !9
  switch i64 %454, label %458 [
    i64 0, label %460
    i64 21, label %455
  ]

455:                                              ; preds = %451
  %456 = or i64 %452, 1
  %457 = getelementptr inbounds i64, i64* %450, i64 %456
  store i64 ptrtoint (%struct.debug* @debug to i64), i64* %457, align 8, !tbaa !9
  br label %458

458:                                              ; preds = %451, %455
  %459 = add i64 %452, 2
  br label %451

460:                                              ; preds = %451
  %461 = tail call fastcc %struct.dso** @queue_ctors(%struct.dso* noundef nonnull @__dls3.app) #17
  store %struct.dso** %461, %struct.dso*** @main_ctor_queue, align 8, !tbaa !4
  %462 = load i64, i64* @tls_cnt, align 8, !tbaa !9
  store i64 %462, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 9), align 8, !tbaa !50
  %463 = load i64, i64* @tls_align, align 8, !tbaa !9
  store i64 %463, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 8), align 8, !tbaa !35
  %464 = shl i64 %462, 3
  %465 = load i64, i64* @tls_offset, align 8, !tbaa !9
  %466 = shl i64 %463, 1
  %467 = add i64 %464, 207
  %468 = add i64 %467, %463
  %469 = add i64 %468, %466
  %470 = add i64 %469, %465
  %471 = sub i64 0, %463
  %472 = and i64 %470, %471
  store i64 %472, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 7), align 8, !tbaa !34
  %473 = icmp ugt i64 %472, 336
  %474 = icmp ugt i64 %463, 8
  %475 = select i1 %473, i1 true, i1 %474
  br i1 %475, label %476, label %485

476:                                              ; preds = %460
  %477 = tail call i8* @__libc_calloc(i64 noundef %472, i64 noundef 1) #16
  %478 = icmp eq i8* %477, null
  br i1 %478, label %481, label %479

479:                                              ; preds = %476
  %480 = load i64, i64* @tls_cnt, align 8, !tbaa !9
  br label %485

481:                                              ; preds = %476
  %482 = load i8*, i8** %310, align 8, !tbaa !4
  %483 = load i64, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 7), align 8, !tbaa !34
  %484 = tail call i32 (i32, i8*, ...) @dprintf(i32 noundef 2, i8* noundef getelementptr inbounds ([54 x i8], [54 x i8]* @.str.18, i64 0, i64 0), i8* noundef %482, i64 noundef %483) #16
  tail call void @_exit(i32 noundef 127) #20
  unreachable

485:                                              ; preds = %479, %460
  %486 = phi i64 [ %480, %479 ], [ %462, %460 ]
  %487 = phi i8* [ %477, %479 ], [ getelementptr inbounds ([1 x %struct.builtin_tls], [1 x %struct.builtin_tls]* @builtin_tls, i64 0, i64 0, i32 0), %460 ]
  store i64 %486, i64* @static_tls_cnt, align 8, !tbaa !9
  %488 = load %struct.dso*, %struct.dso** getelementptr inbounds (%struct.dso, %struct.dso* @__dls3.app, i64 0, i32 3), align 8, !tbaa !4
  tail call fastcc void @reloc_all(%struct.dso* noundef %488) #17
  tail call fastcc void @reloc_all(%struct.dso* noundef nonnull @__dls3.app) #17
  %489 = icmp eq i8* %487, getelementptr inbounds ([1 x %struct.builtin_tls], [1 x %struct.builtin_tls]* @builtin_tls, i64 0, i64 0, i32 0)
  br i1 %489, label %495, label %490

490:                                              ; preds = %485
  %491 = tail call i8* @__copy_tls(i8* noundef %487) #16
  %492 = tail call i32 @__init_tp(i8* noundef %491) #16
  %493 = icmp slt i32 %492, 0
  br i1 %493, label %494, label %502

494:                                              ; preds = %490
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #14, !srcloc !20
  br label %502

495:                                              ; preds = %485
  %496 = load i64, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 7), align 8, !tbaa !34
  store i64 336, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 7), align 8, !tbaa !34
  %497 = tail call i8* @__copy_tls(i8* noundef getelementptr inbounds ([1 x %struct.builtin_tls], [1 x %struct.builtin_tls]* @builtin_tls, i64 0, i64 0, i32 0)) #16
  %498 = inttoptr i64 %31 to i8*
  %499 = icmp eq i8* %497, %498
  br i1 %499, label %501, label %500

500:                                              ; preds = %495
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #14, !srcloc !20
  br label %501

501:                                              ; preds = %500, %495
  store i64 %496, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 7), align 8, !tbaa !34
  br label %502

502:                                              ; preds = %490, %494, %501
  %503 = load i1, i1* @ldso_fail, align 4
  br i1 %503, label %504, label %505

504:                                              ; preds = %502
  tail call void @_exit(i32 noundef 127) #20
  unreachable

505:                                              ; preds = %502
  %506 = load i1, i1* @ldd_mode, align 4
  br i1 %506, label %507, label %508

507:                                              ; preds = %505
  tail call void @_exit(i32 noundef 0) #20
  unreachable

508:                                              ; preds = %505
  %509 = load %struct.dso*, %struct.dso** @head, align 8, !tbaa !4
  %510 = tail call fastcc { %struct.Elf64_Sym*, %struct.dso* } @find_sym(%struct.dso* noundef %509, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i64 0, i64 0), i32 noundef 1) #17
  %511 = extractvalue { %struct.Elf64_Sym*, %struct.dso* } %510, 1
  %512 = icmp eq %struct.dso* %511, @ldso
  br i1 %512, label %514, label %513

513:                                              ; preds = %508
  store i32 1, i32* @__malloc_replaced, align 4, !tbaa !13
  br label %514

514:                                              ; preds = %513, %508
  %515 = tail call fastcc { %struct.Elf64_Sym*, %struct.dso* } @find_sym(%struct.dso* noundef %509, i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.20, i64 0, i64 0), i32 noundef 1) #17
  %516 = extractvalue { %struct.Elf64_Sym*, %struct.dso* } %515, 1
  %517 = icmp eq %struct.dso* %516, @ldso
  br i1 %517, label %519, label %518

518:                                              ; preds = %514
  store i32 1, i32* @__aligned_alloc_replaced, align 4, !tbaa !13
  br label %519

519:                                              ; preds = %518, %514
  store i1 true, i1* @runtime, align 4
  store i32 1, i32* getelementptr inbounds (%struct.debug, %struct.debug* @debug, i64 0, i32 0), align 8, !tbaa !51
  store void ()* @dl_debug_state, void ()** getelementptr inbounds (%struct.debug, %struct.debug* @debug, i64 0, i32 2), align 8, !tbaa !53
  store %struct.dso* %509, %struct.dso** bitcast (i8** getelementptr inbounds (%struct.debug, %struct.debug* @debug, i64 0, i32 1) to %struct.dso**), align 8, !tbaa !54
  %520 = load i8*, i8** getelementptr inbounds (%struct.dso, %struct.dso* @ldso, i64 0, i32 0), align 8, !tbaa !4
  store i8* %520, i8** getelementptr inbounds (%struct.debug, %struct.debug* @debug, i64 0, i32 4), align 8, !tbaa !55
  store i32 0, i32* getelementptr inbounds (%struct.debug, %struct.debug* @debug, i64 0, i32 3), align 8, !tbaa !56
  tail call void @_dl_debug_state() #16
  %521 = icmp eq i8* %311, null
  br i1 %521, label %523, label %522

522:                                              ; preds = %519
  store i8* %311, i8** %310, align 8, !tbaa !4
  br label %523

523:                                              ; preds = %522, %519
  %524 = tail call i32* @___errno_location() #19
  store i32 0, i32* %524, align 4, !tbaa !13
  %525 = getelementptr inbounds [32 x i64], [32 x i64]* %3, i64 0, i64 9
  %526 = load i64, i64* %525, align 8, !tbaa !9
  %527 = inttoptr i64 %526 to i8*
  %528 = getelementptr inbounds i8*, i8** %310, i64 -1
  tail call void asm sideeffect "mov $1,%rsp ; jmp *$0", "r,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i8* %527, i8** nonnull %528) #14, !srcloc !57
  br label %529

529:                                              ; preds = %529, %523
  br label %529
}

; Function Attrs: optsize
declare i8* @getenv(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @strncmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @memcmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @dprintf(i32 noundef, i8* noundef, ...) local_unnamed_addr #2

; Function Attrs: noreturn optsize
declare void @_exit(i32 noundef) local_unnamed_addr #9

; Function Attrs: optsize
declare i32 @open(i8* noundef, i32 noundef, ...) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @strerror(i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #10

; Function Attrs: nounwind optsize strictfp
define internal fastcc i8* @map_library(i32 noundef %0, %struct.dso* nocapture noundef %1) unnamed_addr #0 {
  %3 = alloca [15 x %struct.Elf64_Ehdr], align 16
  %4 = getelementptr inbounds [15 x %struct.Elf64_Ehdr], [15 x %struct.Elf64_Ehdr]* %3, i64 0, i64 0, i32 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 960, i8* nonnull %4) #14
  %5 = call i64 @read(i32 noundef %0, i8* noundef nonnull %4, i64 noundef 960) #16
  %6 = icmp slt i64 %5, 0
  br i1 %6, label %313, label %7

7:                                                ; preds = %2
  %8 = icmp ult i64 %5, 64
  br i1 %8, label %306, label %9

9:                                                ; preds = %7
  %10 = getelementptr inbounds [15 x %struct.Elf64_Ehdr], [15 x %struct.Elf64_Ehdr]* %3, i64 0, i64 0, i32 1
  %11 = load i16, i16* %10, align 16, !tbaa !58
  %12 = and i16 %11, -2
  %13 = icmp eq i16 %12, 2
  br i1 %13, label %14, label %306

14:                                               ; preds = %9
  %15 = getelementptr inbounds [15 x %struct.Elf64_Ehdr], [15 x %struct.Elf64_Ehdr]* %3, i64 0, i64 0, i32 9
  %16 = load i16, i16* %15, align 2, !tbaa !19
  %17 = zext i16 %16 to i64
  %18 = getelementptr inbounds [15 x %struct.Elf64_Ehdr], [15 x %struct.Elf64_Ehdr]* %3, i64 0, i64 0, i32 10
  %19 = load i16, i16* %18, align 8, !tbaa !15
  %20 = zext i16 %19 to i64
  %21 = mul nuw nsw i64 %20, %17
  %22 = icmp ugt i64 %21, 896
  br i1 %22, label %23, label %33

23:                                               ; preds = %14
  %24 = call i8* @__libc_malloc(i64 noundef %21) #16
  %25 = icmp eq i8* %24, null
  br i1 %25, label %313, label %26

26:                                               ; preds = %23
  %27 = getelementptr inbounds [15 x %struct.Elf64_Ehdr], [15 x %struct.Elf64_Ehdr]* %3, i64 0, i64 0, i32 5
  %28 = load i64, i64* %27, align 16, !tbaa !18
  %29 = call i64 @pread(i32 noundef %0, i8* noundef nonnull %24, i64 noundef %21, i64 noundef %28) #16
  %30 = icmp slt i64 %29, 0
  br i1 %30, label %310, label %31

31:                                               ; preds = %26
  %32 = icmp eq i64 %29, %21
  br i1 %32, label %46, label %306

33:                                               ; preds = %14
  %34 = getelementptr inbounds [15 x %struct.Elf64_Ehdr], [15 x %struct.Elf64_Ehdr]* %3, i64 0, i64 0, i32 5
  %35 = load i64, i64* %34, align 16, !tbaa !18
  %36 = add i64 %35, %21
  %37 = icmp ugt i64 %36, %5
  br i1 %37, label %38, label %44

38:                                               ; preds = %33
  %39 = getelementptr inbounds [15 x %struct.Elf64_Ehdr], [15 x %struct.Elf64_Ehdr]* %3, i64 0, i64 1, i32 0, i64 0
  %40 = call i64 @pread(i32 noundef %0, i8* noundef nonnull %39, i64 noundef %21, i64 noundef %35) #16
  %41 = icmp slt i64 %40, 0
  br i1 %41, label %310, label %42

42:                                               ; preds = %38
  %43 = icmp eq i64 %40, %21
  br i1 %43, label %46, label %306

44:                                               ; preds = %33
  %45 = getelementptr inbounds [15 x %struct.Elf64_Ehdr], [15 x %struct.Elf64_Ehdr]* %3, i64 0, i64 0, i32 0, i64 %35
  br label %46

46:                                               ; preds = %42, %31, %44
  %47 = phi i8* [ %45, %44 ], [ %24, %31 ], [ %39, %42 ]
  %48 = phi i8* [ null, %44 ], [ %24, %31 ], [ null, %42 ]
  %49 = bitcast i8* %47 to %struct.Elf64_Phdr*
  %50 = bitcast i8* %47 to i32*
  %51 = load i16, i16* %18, align 8, !tbaa !15
  %52 = icmp eq i16 %51, 0
  br i1 %52, label %306, label %53

53:                                               ; preds = %46
  %54 = zext i16 %51 to i64
  %55 = getelementptr inbounds %struct.dso, %struct.dso* %1, i64 0, i32 36
  %56 = getelementptr inbounds %struct.dso, %struct.dso* %1, i64 0, i32 37
  %57 = getelementptr inbounds %struct.dso, %struct.dso* %1, i64 0, i32 34, i32 4
  %58 = getelementptr inbounds %struct.dso, %struct.dso* %1, i64 0, i32 34, i32 2
  %59 = load i1, i1* @runtime, align 4
  %60 = load i16, i16* %15, align 2, !tbaa !19
  %61 = zext i16 %60 to i64
  %62 = bitcast i64* %58 to <2 x i64>*
  br label %63

63:                                               ; preds = %53, %132
  %64 = phi i64 [ %54, %53 ], [ %139, %132 ]
  %65 = phi i64 [ 0, %53 ], [ %133, %132 ]
  %66 = phi i64 [ 0, %53 ], [ %134, %132 ]
  %67 = phi i64 [ -1, %53 ], [ %138, %132 ]
  %68 = phi i32 [ undef, %53 ], [ %137, %132 ]
  %69 = phi %struct.Elf64_Phdr* [ %49, %53 ], [ %142, %132 ]
  %70 = phi i64 [ 0, %53 ], [ %136, %132 ]
  %71 = phi i64 [ undef, %53 ], [ %135, %132 ]
  %72 = phi i32* [ %50, %53 ], [ %143, %132 ]
  %73 = load i32, i32* %72, align 8, !tbaa !23
  switch i32 %73, label %94 [
    i32 2, label %74
    i32 7, label %77
    i32 1685382482, label %85
  ]

74:                                               ; preds = %63
  %75 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %69, i64 0, i32 3
  %76 = load i64, i64* %75, align 8, !tbaa !25
  br label %132

77:                                               ; preds = %63
  %78 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %69, i64 0, i32 3
  %79 = load i64, i64* %78, align 8, !tbaa !25
  %80 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %69, i64 0, i32 7
  %81 = load i64, i64* %80, align 8, !tbaa !41
  store i64 %81, i64* %57, align 8, !tbaa !42
  %82 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %69, i64 0, i32 5
  %83 = bitcast i64* %82 to <2 x i64>*
  %84 = load <2 x i64>, <2 x i64>* %83, align 8, !tbaa !9
  store <2 x i64> %84, <2 x i64>* %62, align 8, !tbaa !9
  br label %132

85:                                               ; preds = %63
  %86 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %69, i64 0, i32 3
  %87 = load i64, i64* %86, align 8, !tbaa !25
  %88 = and i64 %87, -4096
  store i64 %88, i64* %55, align 8, !tbaa !9
  %89 = load i64, i64* %86, align 8, !tbaa !25
  %90 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %69, i64 0, i32 6
  %91 = load i64, i64* %90, align 8, !tbaa !26
  %92 = add i64 %91, %89
  %93 = and i64 %92, -4096
  store i64 %93, i64* %56, align 8, !tbaa !9
  br label %132

94:                                               ; preds = %63
  %95 = icmp ne i32 %73, 1685382481
  %96 = select i1 %95, i1 true, i1 %59
  br i1 %96, label %108, label %97

97:                                               ; preds = %94
  %98 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %69, i64 0, i32 6
  %99 = load i64, i64* %98, align 8, !tbaa !26
  %100 = load i32, i32* @__default_stacksize, align 4, !tbaa !13
  %101 = zext i32 %100 to i64
  %102 = icmp ugt i64 %99, %101
  br i1 %102, label %103, label %132

103:                                              ; preds = %97
  %104 = icmp ult i64 %99, 8388608
  %105 = select i1 %104, i64 %99, i64 8388608
  %106 = trunc i64 %105 to i32
  store i32 %106, i32* @__default_stacksize, align 4, !tbaa !13
  %107 = load i32, i32* %72, align 8, !tbaa !23
  br label %108

108:                                              ; preds = %103, %94
  %109 = phi i32 [ %73, %94 ], [ %107, %103 ]
  %110 = icmp eq i32 %109, 1
  br i1 %110, label %111, label %132

111:                                              ; preds = %108
  %112 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %69, i64 0, i32 3
  %113 = load i64, i64* %112, align 8, !tbaa !25
  %114 = icmp ult i64 %113, %67
  br i1 %114, label %115, label %123

115:                                              ; preds = %111
  %116 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %69, i64 0, i32 2
  %117 = load i64, i64* %116, align 8, !tbaa !49
  %118 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %69, i64 0, i32 1
  %119 = load i32, i32* %118, align 4, !tbaa !59
  %120 = trunc i32 %119 to i3
  %121 = call i3 @llvm.bitreverse.i3(i3 %120)
  %122 = zext i3 %121 to i32
  br label %123

123:                                              ; preds = %115, %111
  %124 = phi i64 [ %117, %115 ], [ %71, %111 ]
  %125 = phi i32 [ %122, %115 ], [ %68, %111 ]
  %126 = phi i64 [ %113, %115 ], [ %67, %111 ]
  %127 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %69, i64 0, i32 6
  %128 = load i64, i64* %127, align 8, !tbaa !26
  %129 = add i64 %128, %113
  %130 = icmp ugt i64 %129, %70
  %131 = select i1 %130, i64 %129, i64 %70
  br label %132

132:                                              ; preds = %77, %85, %97, %74, %123, %108
  %133 = phi i64 [ %65, %108 ], [ %65, %123 ], [ %65, %74 ], [ %79, %77 ], [ %65, %85 ], [ %65, %97 ]
  %134 = phi i64 [ %66, %108 ], [ %66, %123 ], [ %76, %74 ], [ %66, %77 ], [ %66, %85 ], [ %66, %97 ]
  %135 = phi i64 [ %71, %108 ], [ %124, %123 ], [ %71, %74 ], [ %71, %77 ], [ %71, %85 ], [ %71, %97 ]
  %136 = phi i64 [ %70, %108 ], [ %131, %123 ], [ %70, %74 ], [ %70, %77 ], [ %70, %85 ], [ %70, %97 ]
  %137 = phi i32 [ %68, %108 ], [ %125, %123 ], [ %68, %74 ], [ %68, %77 ], [ %68, %85 ], [ %68, %97 ]
  %138 = phi i64 [ %67, %108 ], [ %126, %123 ], [ %67, %74 ], [ %67, %77 ], [ %67, %85 ], [ %67, %97 ]
  %139 = add nsw i64 %64, -1
  %140 = bitcast %struct.Elf64_Phdr* %69 to i8*
  %141 = getelementptr inbounds i8, i8* %140, i64 %61
  %142 = bitcast i8* %141 to %struct.Elf64_Phdr*
  %143 = bitcast i8* %141 to i32*
  %144 = icmp eq i64 %139, 0
  br i1 %144, label %145, label %63

145:                                              ; preds = %132
  %146 = icmp eq i64 %134, 0
  br i1 %146, label %306, label %147

147:                                              ; preds = %145
  %148 = add i64 %136, 4095
  %149 = and i64 %148, -4096
  %150 = and i64 %138, -4096
  %151 = and i64 %135, -4096
  %152 = sub i64 %149, %150
  %153 = add i64 %152, %151
  %154 = inttoptr i64 %150 to i8*
  %155 = call i8* @mmap(i8* noundef %154, i64 noundef %153, i32 noundef %137, i32 noundef 2, i32 noundef %0, i64 noundef %151) #16
  %156 = icmp eq i8* %155, inttoptr (i64 -1 to i8*)
  br i1 %156, label %310, label %157

157:                                              ; preds = %147
  %158 = getelementptr inbounds %struct.dso, %struct.dso* %1, i64 0, i32 17
  store i8* %155, i8** %158, align 8, !tbaa !4
  %159 = getelementptr inbounds %struct.dso, %struct.dso* %1, i64 0, i32 18
  store i64 %153, i64* %159, align 8, !tbaa !9
  %160 = load i16, i16* %10, align 16, !tbaa !58
  %161 = icmp eq i16 %160, 3
  %162 = icmp eq i64 %150, 0
  %163 = select i1 %161, i1 true, i1 %162
  %164 = icmp eq i8* %155, %154
  %165 = select i1 %163, i1 true, i1 %164
  br i1 %165, label %168, label %166

166:                                              ; preds = %157
  %167 = tail call i32* @___errno_location() #19
  store i32 16, i32* %167, align 4, !tbaa !13
  br label %309

168:                                              ; preds = %157
  %169 = sub i64 0, %150
  %170 = getelementptr inbounds i8, i8* %155, i64 %169
  %171 = getelementptr inbounds %struct.dso, %struct.dso* %1, i64 0, i32 5
  store %struct.Elf64_Phdr* null, %struct.Elf64_Phdr** %171, align 8, !tbaa !4
  %172 = getelementptr inbounds %struct.dso, %struct.dso* %1, i64 0, i32 6
  store i32 0, i32* %172, align 8, !tbaa !13
  %173 = load i16, i16* %18, align 8, !tbaa !15
  %174 = icmp eq i16 %173, 0
  br i1 %174, label %181, label %175

175:                                              ; preds = %168
  %176 = zext i16 %173 to i64
  %177 = getelementptr inbounds [15 x %struct.Elf64_Ehdr], [15 x %struct.Elf64_Ehdr]* %3, i64 0, i64 0, i32 5
  %178 = bitcast %struct.Elf64_Phdr** %171 to i8**
  %179 = getelementptr inbounds %struct.dso, %struct.dso* %1, i64 0, i32 7
  %180 = ptrtoint i8* %170 to i64
  br label %184

181:                                              ; preds = %274, %168
  %182 = getelementptr inbounds i8, i8* %170, i64 %134
  %183 = bitcast i8* %182 to i64*
  br label %283

184:                                              ; preds = %175, %274
  %185 = phi i64 [ %176, %175 ], [ %275, %274 ]
  %186 = phi %struct.Elf64_Phdr* [ %49, %175 ], [ %280, %274 ]
  %187 = phi i32* [ %50, %175 ], [ %281, %274 ]
  %188 = load i32, i32* %187, align 8, !tbaa !23
  %189 = icmp eq i32 %188, 1
  br i1 %189, label %190, label %274

190:                                              ; preds = %184
  %191 = load %struct.Elf64_Phdr*, %struct.Elf64_Phdr** %171, align 8, !tbaa !4
  %192 = icmp eq %struct.Elf64_Phdr* %191, null
  br i1 %192, label %193, label %214

193:                                              ; preds = %190
  %194 = load i64, i64* %177, align 16, !tbaa !18
  %195 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %186, i64 0, i32 2
  %196 = load i64, i64* %195, align 8, !tbaa !49
  %197 = icmp ult i64 %194, %196
  br i1 %197, label %214, label %198

198:                                              ; preds = %193
  %199 = add i64 %194, %21
  %200 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %186, i64 0, i32 5
  %201 = load i64, i64* %200, align 8, !tbaa !60
  %202 = add i64 %201, %196
  %203 = icmp ugt i64 %199, %202
  br i1 %203, label %214, label %204

204:                                              ; preds = %198
  %205 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %186, i64 0, i32 3
  %206 = load i64, i64* %205, align 8, !tbaa !25
  %207 = getelementptr inbounds i8, i8* %170, i64 %206
  %208 = sub i64 %194, %196
  %209 = getelementptr inbounds i8, i8* %207, i64 %208
  store i8* %209, i8** %178, align 8, !tbaa !4
  %210 = load i16, i16* %18, align 8, !tbaa !15
  %211 = zext i16 %210 to i32
  store i32 %211, i32* %172, align 8, !tbaa !13
  %212 = load i16, i16* %15, align 2, !tbaa !19
  %213 = zext i16 %212 to i64
  store i64 %213, i64* %179, align 8, !tbaa !9
  br label %214

214:                                              ; preds = %204, %198, %193, %190
  %215 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %186, i64 0, i32 3
  %216 = load i64, i64* %215, align 8, !tbaa !25
  %217 = and i64 %216, -4096
  %218 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %186, i64 0, i32 6
  %219 = load i64, i64* %218, align 8, !tbaa !26
  %220 = add i64 %216, 4095
  %221 = add i64 %220, %219
  %222 = and i64 %221, -4096
  %223 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %186, i64 0, i32 1
  %224 = load i32, i32* %223, align 4, !tbaa !59
  %225 = trunc i32 %224 to i3
  %226 = call i3 @llvm.bitreverse.i3(i3 %225)
  %227 = zext i3 %226 to i32
  %228 = icmp eq i64 %217, %150
  br i1 %228, label %243, label %229

229:                                              ; preds = %214
  %230 = getelementptr inbounds i8, i8* %170, i64 %217
  %231 = sub i64 %222, %217
  %232 = icmp eq i64 %231, 0
  br i1 %232, label %238, label %233

233:                                              ; preds = %229
  %234 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %186, i64 0, i32 2
  %235 = load i64, i64* %234, align 8, !tbaa !49
  %236 = and i64 %235, -4096
  %237 = call i8* @mmap(i8* noundef %230, i64 noundef %231, i32 noundef %227, i32 noundef 18, i32 noundef %0, i64 noundef %236) #16
  br label %238

238:                                              ; preds = %229, %233
  %239 = phi i8* [ %237, %233 ], [ %230, %229 ]
  %240 = icmp eq i8* %239, inttoptr (i64 -1 to i8*)
  br i1 %240, label %309, label %241

241:                                              ; preds = %238
  %242 = load i64, i64* %218, align 8, !tbaa !26
  br label %243

243:                                              ; preds = %241, %214
  %244 = phi i64 [ %242, %241 ], [ %219, %214 ]
  %245 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %186, i64 0, i32 5
  %246 = load i64, i64* %245, align 8, !tbaa !60
  %247 = icmp ugt i64 %244, %246
  br i1 %247, label %248, label %274

248:                                              ; preds = %243
  %249 = load i32, i32* %223, align 4, !tbaa !59
  %250 = and i32 %249, 2
  %251 = icmp eq i32 %250, 0
  br i1 %251, label %274, label %252

252:                                              ; preds = %248
  %253 = load i64, i64* %215, align 8, !tbaa !25
  %254 = add i64 %246, %180
  %255 = add i64 %254, %253
  %256 = add i64 %255, 4095
  %257 = and i64 %256, -4096
  %258 = inttoptr i64 %255 to i8*
  %259 = sub i64 0, %255
  %260 = and i64 %259, 4095
  %261 = call i8* @memset(i8* noundef %258, i32 noundef 0, i64 noundef %260) #16
  %262 = sub i64 %257, %180
  %263 = icmp ult i64 %262, %222
  br i1 %263, label %264, label %274

264:                                              ; preds = %252
  %265 = inttoptr i64 %257 to i8*
  %266 = add i64 %222, %180
  %267 = sub i64 %266, %257
  %268 = icmp eq i64 %267, 0
  br i1 %268, label %271, label %269

269:                                              ; preds = %264
  %270 = call i8* @mmap(i8* noundef %265, i64 noundef %267, i32 noundef %227, i32 noundef 50, i32 noundef -1, i64 noundef 0) #16
  br label %271

271:                                              ; preds = %264, %269
  %272 = phi i8* [ %270, %269 ], [ %265, %264 ]
  %273 = icmp eq i8* %272, inttoptr (i64 -1 to i8*)
  br i1 %273, label %309, label %274

274:                                              ; preds = %271, %252, %243, %248, %184
  %275 = add nsw i64 %185, -1
  %276 = bitcast %struct.Elf64_Phdr* %186 to i8*
  %277 = load i16, i16* %15, align 2, !tbaa !19
  %278 = zext i16 %277 to i64
  %279 = getelementptr inbounds i8, i8* %276, i64 %278
  %280 = bitcast i8* %279 to %struct.Elf64_Phdr*
  %281 = bitcast i8* %279 to i32*
  %282 = icmp eq i64 %275, 0
  br i1 %282, label %181, label %184

283:                                              ; preds = %181, %294
  %284 = phi i64 [ %295, %294 ], [ 0, %181 ]
  %285 = getelementptr inbounds i64, i64* %183, i64 %284
  %286 = load i64, i64* %285, align 8, !tbaa !9
  switch i64 %286, label %294 [
    i64 0, label %296
    i64 22, label %287
  ]

287:                                              ; preds = %283
  %288 = call i32 @mprotect(i8* noundef nonnull %155, i64 noundef %153, i32 noundef 7) #16
  %289 = icmp eq i32 %288, 0
  br i1 %289, label %296, label %290

290:                                              ; preds = %287
  %291 = tail call i32* @___errno_location() #19
  %292 = load i32, i32* %291, align 4, !tbaa !13
  %293 = icmp eq i32 %292, 38
  br i1 %293, label %296, label %309

294:                                              ; preds = %283
  %295 = add i64 %284, 2
  br label %283

296:                                              ; preds = %283, %290, %287
  %297 = getelementptr inbounds %struct.dso, %struct.dso* %1, i64 0, i32 0
  store i8* %170, i8** %297, align 8, !tbaa !4
  %298 = getelementptr inbounds %struct.dso, %struct.dso* %1, i64 0, i32 2
  %299 = bitcast i64** %298 to i8**
  store i8* %182, i8** %299, align 8, !tbaa !4
  %300 = getelementptr inbounds %struct.dso, %struct.dso* %1, i64 0, i32 34, i32 3
  %301 = load i64, i64* %300, align 8, !tbaa !44
  %302 = icmp eq i64 %301, 0
  br i1 %302, label %310, label %303

303:                                              ; preds = %296
  %304 = getelementptr inbounds i8, i8* %170, i64 %133
  %305 = getelementptr inbounds %struct.dso, %struct.dso* %1, i64 0, i32 34, i32 1
  store i8* %304, i8** %305, align 8, !tbaa !45
  br label %310

306:                                              ; preds = %46, %9, %145, %42, %31, %7
  %307 = phi i8* [ null, %7 ], [ %24, %31 ], [ %48, %145 ], [ null, %42 ], [ null, %9 ], [ %48, %46 ]
  %308 = tail call i32* @___errno_location() #19
  store i32 8, i32* %308, align 4, !tbaa !13
  br label %310

309:                                              ; preds = %238, %271, %290, %166
  call fastcc void @unmap_library(%struct.dso* noundef %1) #17
  br label %310

310:                                              ; preds = %309, %306, %26, %147, %38, %296, %303
  %311 = phi i8* [ %48, %303 ], [ %48, %296 ], [ %48, %309 ], [ null, %38 ], [ %48, %147 ], [ %24, %26 ], [ %307, %306 ]
  %312 = phi i8* [ %155, %303 ], [ %155, %296 ], [ null, %309 ], [ null, %38 ], [ null, %147 ], [ null, %26 ], [ null, %306 ]
  call void @__libc_free(i8* noundef %311) #16
  br label %313

313:                                              ; preds = %310, %23, %2
  %314 = phi i8* [ null, %2 ], [ null, %23 ], [ %312, %310 ]
  call void @llvm.lifetime.end.p0i8(i64 960, i8* nonnull %4) #14
  ret i8* %314
}

; Function Attrs: optsize
declare i32 @close(i32 noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @reclaim_gaps(%struct.dso* nocapture noundef readonly %0) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 6
  %3 = load i32, i32* %2, align 8, !tbaa !13
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %38, label %5

5:                                                ; preds = %1
  %6 = sext i32 %3 to i64
  %7 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 5
  %8 = load %struct.Elf64_Phdr*, %struct.Elf64_Phdr** %7, align 8, !tbaa !4
  %9 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 7
  br label %10

10:                                               ; preds = %5, %32
  %11 = phi i64 [ %6, %5 ], [ %13, %32 ]
  %12 = phi %struct.Elf64_Phdr* [ %8, %5 ], [ %36, %32 ]
  %13 = add i64 %11, -1
  %14 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %12, i64 0, i32 0
  %15 = load i32, i32* %14, align 8, !tbaa !23
  %16 = icmp eq i32 %15, 1
  br i1 %16, label %17, label %32

17:                                               ; preds = %10
  %18 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %12, i64 0, i32 1
  %19 = load i32, i32* %18, align 4, !tbaa !59
  %20 = and i32 %19, 6
  %21 = icmp eq i32 %20, 6
  br i1 %21, label %22, label %32

22:                                               ; preds = %17
  %23 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %12, i64 0, i32 3
  %24 = load i64, i64* %23, align 8, !tbaa !25
  %25 = and i64 %24, -4096
  tail call fastcc void @reclaim(%struct.dso* noundef nonnull %0, i64 noundef %25, i64 noundef %24) #17
  %26 = load i64, i64* %23, align 8, !tbaa !25
  %27 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %12, i64 0, i32 6
  %28 = load i64, i64* %27, align 8, !tbaa !26
  %29 = add i64 %28, %26
  %30 = add i64 %29, 4095
  %31 = and i64 %30, -4096
  tail call fastcc void @reclaim(%struct.dso* noundef nonnull %0, i64 noundef %29, i64 noundef %31) #17
  br label %32

32:                                               ; preds = %17, %10, %22
  %33 = bitcast %struct.Elf64_Phdr* %12 to i8*
  %34 = load i64, i64* %9, align 8, !tbaa !9
  %35 = getelementptr inbounds i8, i8* %33, i64 %34
  %36 = bitcast i8* %35 to %struct.Elf64_Phdr*
  %37 = icmp eq i64 %13, 0
  br i1 %37, label %38, label %10

38:                                               ; preds = %32, %1
  ret void
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @load_deps(%struct.dso* noundef %0) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 27
  %3 = load %struct.dso**, %struct.dso*** %2, align 8, !tbaa !4
  %4 = icmp eq %struct.dso** %3, null
  %5 = icmp ne %struct.dso* %0, null
  %6 = and i1 %5, %4
  br i1 %6, label %7, label %116

7:                                                ; preds = %1, %113
  %8 = phi %struct.dso** [ %115, %113 ], [ null, %1 ]
  %9 = phi %struct.dso* [ %111, %113 ], [ %0, %1 ]
  %10 = getelementptr inbounds %struct.dso, %struct.dso* %9, i64 0, i32 27
  %11 = icmp eq %struct.dso** %8, null
  br i1 %11, label %12, label %109

12:                                               ; preds = %7
  %13 = load %struct.dso*, %struct.dso** @head, align 8, !tbaa !4
  %14 = icmp eq %struct.dso* %13, %9
  br i1 %14, label %15, label %22

15:                                               ; preds = %12, %15
  %16 = phi i64 [ %21, %15 ], [ 0, %12 ]
  %17 = phi %struct.dso* [ %19, %15 ], [ %9, %12 ]
  %18 = getelementptr inbounds %struct.dso, %struct.dso* %17, i64 0, i32 3
  %19 = load %struct.dso*, %struct.dso** %18, align 8, !tbaa !4
  %20 = icmp eq %struct.dso* %19, null
  %21 = add i64 %16, 1
  br i1 %20, label %22, label %15

22:                                               ; preds = %15, %12
  %23 = phi i64 [ 0, %12 ], [ %16, %15 ]
  %24 = getelementptr inbounds %struct.dso, %struct.dso* %9, i64 0, i32 2
  %25 = load i64*, i64** %24, align 8, !tbaa !4
  br label %26

26:                                               ; preds = %33, %22
  %27 = phi i64 [ %23, %22 ], [ %34, %33 ]
  %28 = phi i64 [ 0, %22 ], [ %35, %33 ]
  %29 = getelementptr inbounds i64, i64* %25, i64 %28
  %30 = load i64, i64* %29, align 8, !tbaa !9
  switch i64 %30, label %33 [
    i64 0, label %36
    i64 1, label %31
  ]

31:                                               ; preds = %26
  %32 = add i64 %27, 1
  br label %33

33:                                               ; preds = %31, %26
  %34 = phi i64 [ %32, %31 ], [ %27, %26 ]
  %35 = add i64 %28, 2
  br label %26

36:                                               ; preds = %26
  %37 = icmp ult i64 %27, 2
  %38 = select i1 %14, i1 %37, i1 false
  br i1 %38, label %39, label %41

39:                                               ; preds = %36
  %40 = bitcast %struct.dso*** %10 to i8**
  store i8* bitcast ([2 x %struct.dso*]* @builtin_deps to i8*), i8** %40, align 8, !tbaa !4
  br label %53

41:                                               ; preds = %36
  %42 = add i64 %27, 1
  %43 = tail call i8* @__libc_calloc(i64 noundef %42, i64 noundef 8) #16
  %44 = bitcast %struct.dso*** %10 to i8**
  store i8* %43, i8** %44, align 8, !tbaa !4
  %45 = icmp eq i8* %43, null
  br i1 %45, label %46, label %53

46:                                               ; preds = %41
  %47 = getelementptr inbounds %struct.dso, %struct.dso* %9, i64 0, i32 1
  %48 = load i8*, i8** %47, align 8, !tbaa !4
  tail call void (i8*, ...) @error(i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str.31, i64 0, i64 0), i8* noundef %48) #16
  %49 = load i1, i1* @runtime, align 4
  br i1 %49, label %50, label %53

50:                                               ; preds = %46
  %51 = load [1 x %struct.__jmp_buf_tag]*, [1 x %struct.__jmp_buf_tag]** @rtld_fail, align 8, !tbaa !4
  %52 = getelementptr inbounds [1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* %51, i64 0, i64 0
  tail call void @longjmp(%struct.__jmp_buf_tag* noundef %52, i32 noundef 1) #20
  unreachable

53:                                               ; preds = %46, %41, %39
  %54 = load %struct.dso*, %struct.dso** @head, align 8, !tbaa !4
  %55 = icmp eq %struct.dso* %54, %9
  br i1 %55, label %56, label %69

56:                                               ; preds = %53
  %57 = getelementptr inbounds %struct.dso, %struct.dso* %9, i64 0, i32 3
  %58 = load %struct.dso*, %struct.dso** %57, align 8, !tbaa !4
  %59 = icmp eq %struct.dso* %58, null
  br i1 %59, label %69, label %60

60:                                               ; preds = %56, %60
  %61 = phi %struct.dso* [ %67, %60 ], [ %58, %56 ]
  %62 = phi i64 [ %64, %60 ], [ 0, %56 ]
  %63 = load %struct.dso**, %struct.dso*** %10, align 8, !tbaa !4
  %64 = add i64 %62, 1
  %65 = getelementptr inbounds %struct.dso*, %struct.dso** %63, i64 %62
  store %struct.dso* %61, %struct.dso** %65, align 8, !tbaa !4
  %66 = getelementptr inbounds %struct.dso, %struct.dso* %61, i64 0, i32 3
  %67 = load %struct.dso*, %struct.dso** %66, align 8, !tbaa !4
  %68 = icmp eq %struct.dso* %67, null
  br i1 %68, label %69, label %60

69:                                               ; preds = %60, %56, %53
  %70 = phi i64 [ 0, %53 ], [ 0, %56 ], [ %64, %60 ]
  %71 = getelementptr inbounds %struct.dso, %struct.dso* %9, i64 0, i32 12
  %72 = getelementptr inbounds %struct.dso, %struct.dso* %9, i64 0, i32 1
  br label %73

73:                                               ; preds = %102, %69
  %74 = phi i64 [ %70, %69 ], [ %103, %102 ]
  %75 = phi i64 [ 0, %69 ], [ %104, %102 ]
  %76 = load i64*, i64** %24, align 8, !tbaa !4
  %77 = getelementptr inbounds i64, i64* %76, i64 %75
  %78 = load i64, i64* %77, align 8, !tbaa !9
  switch i64 %78, label %102 [
    i64 0, label %105
    i64 1, label %79
  ]

79:                                               ; preds = %73
  %80 = load i8*, i8** %71, align 8, !tbaa !4
  %81 = or i64 %75, 1
  %82 = getelementptr inbounds i64, i64* %76, i64 %81
  %83 = load i64, i64* %82, align 8, !tbaa !9
  %84 = getelementptr inbounds i8, i8* %80, i64 %83
  %85 = tail call fastcc %struct.dso* @load_library(i8* noundef %84, %struct.dso* noundef nonnull %9) #16
  %86 = icmp eq %struct.dso* %85, null
  br i1 %86, label %87, label %98

87:                                               ; preds = %79
  %88 = load i8*, i8** %71, align 8, !tbaa !4
  %89 = load i64*, i64** %24, align 8, !tbaa !4
  %90 = getelementptr inbounds i64, i64* %89, i64 %81
  %91 = load i64, i64* %90, align 8, !tbaa !9
  %92 = getelementptr inbounds i8, i8* %88, i64 %91
  %93 = load i8*, i8** %72, align 8, !tbaa !4
  tail call void (i8*, ...) @error(i8* noundef getelementptr inbounds ([51 x i8], [51 x i8]* @.str.32, i64 0, i64 0), i8* noundef %92, i8* noundef %93) #16
  %94 = load i1, i1* @runtime, align 4
  br i1 %94, label %95, label %102

95:                                               ; preds = %87
  %96 = load [1 x %struct.__jmp_buf_tag]*, [1 x %struct.__jmp_buf_tag]** @rtld_fail, align 8, !tbaa !4
  %97 = getelementptr inbounds [1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* %96, i64 0, i64 0
  tail call void @longjmp(%struct.__jmp_buf_tag* noundef %97, i32 noundef 1) #20
  unreachable

98:                                               ; preds = %79
  %99 = load %struct.dso**, %struct.dso*** %10, align 8, !tbaa !4
  %100 = add i64 %74, 1
  %101 = getelementptr inbounds %struct.dso*, %struct.dso** %99, i64 %74
  store %struct.dso* %85, %struct.dso** %101, align 8, !tbaa !4
  br label %102

102:                                              ; preds = %98, %87, %73
  %103 = phi i64 [ %74, %73 ], [ %100, %98 ], [ %74, %87 ]
  %104 = add i64 %75, 2
  br label %73

105:                                              ; preds = %73
  %106 = load %struct.dso**, %struct.dso*** %10, align 8, !tbaa !4
  %107 = getelementptr inbounds %struct.dso*, %struct.dso** %106, i64 %74
  store %struct.dso* null, %struct.dso** %107, align 8, !tbaa !4
  %108 = getelementptr inbounds %struct.dso, %struct.dso* %9, i64 0, i32 29
  store i64 %74, i64* %108, align 8, !tbaa !9
  br label %109

109:                                              ; preds = %7, %105
  %110 = getelementptr inbounds %struct.dso, %struct.dso* %9, i64 0, i32 3
  %111 = load %struct.dso*, %struct.dso** %110, align 8, !tbaa !4
  %112 = icmp eq %struct.dso* %111, null
  br i1 %112, label %116, label %113

113:                                              ; preds = %109
  %114 = getelementptr inbounds %struct.dso, %struct.dso* %111, i64 0, i32 27
  %115 = load %struct.dso**, %struct.dso*** %114, align 8, !tbaa !4
  br label %7

116:                                              ; preds = %109, %1
  ret void
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc %struct.dso** @queue_ctors(%struct.dso* noundef %0) unnamed_addr #0 {
  %2 = load i1, i1* @ldd_mode, align 4
  br i1 %2, label %143, label %3

3:                                                ; preds = %1
  %4 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 25
  %5 = load i8, i8* %4, align 4, !tbaa !8
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %12, label %7

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 27
  %9 = load %struct.dso**, %struct.dso*** %8, align 8, !tbaa !4
  %10 = load %struct.dso*, %struct.dso** %9, align 8, !tbaa !4
  %11 = icmp eq %struct.dso* %10, null
  br i1 %11, label %26, label %15

12:                                               ; preds = %3
  %13 = load %struct.dso*, %struct.dso** @head, align 8, !tbaa !4
  %14 = icmp eq %struct.dso* %13, null
  br i1 %14, label %37, label %29

15:                                               ; preds = %7, %15
  %16 = phi %struct.dso* [ %22, %15 ], [ %10, %7 ]
  %17 = phi i64 [ %19, %15 ], [ 0, %7 ]
  %18 = getelementptr inbounds %struct.dso, %struct.dso* %16, i64 0, i32 24
  store i8 0, i8* %18, align 1, !tbaa !8
  %19 = add i64 %17, 1
  %20 = load %struct.dso**, %struct.dso*** %8, align 8, !tbaa !4
  %21 = getelementptr inbounds %struct.dso*, %struct.dso** %20, i64 %19
  %22 = load %struct.dso*, %struct.dso** %21, align 8, !tbaa !4
  %23 = icmp eq %struct.dso* %22, null
  br i1 %23, label %24, label %15

24:                                               ; preds = %15
  %25 = add i64 %17, 2
  br label %26

26:                                               ; preds = %24, %7
  %27 = phi i64 [ 1, %7 ], [ %25, %24 ]
  %28 = load %struct.dso*, %struct.dso** @head, align 8, !tbaa !4
  br label %37

29:                                               ; preds = %12, %29
  %30 = phi %struct.dso* [ %35, %29 ], [ %13, %12 ]
  %31 = phi i64 [ %33, %29 ], [ 0, %12 ]
  %32 = getelementptr inbounds %struct.dso, %struct.dso* %30, i64 0, i32 24
  store i8 0, i8* %32, align 1, !tbaa !8
  %33 = add i64 %31, 1
  %34 = getelementptr inbounds %struct.dso, %struct.dso* %30, i64 0, i32 3
  %35 = load %struct.dso*, %struct.dso** %34, align 8, !tbaa !4
  %36 = icmp eq %struct.dso* %35, null
  br i1 %36, label %37, label %29

37:                                               ; preds = %29, %12, %26
  %38 = phi %struct.dso* [ %28, %26 ], [ null, %12 ], [ %13, %29 ]
  %39 = phi i64 [ %27, %26 ], [ 0, %12 ], [ %33, %29 ]
  %40 = add i64 %39, 1
  %41 = icmp eq %struct.dso* %38, %0
  %42 = icmp ult i64 %40, 5
  %43 = select i1 %41, i1 %42, i1 false
  br i1 %43, label %53, label %44

44:                                               ; preds = %37
  %45 = tail call i8* @__libc_calloc(i64 noundef %40, i64 noundef 8) #16
  %46 = bitcast i8* %45 to %struct.dso**
  %47 = icmp eq i8* %45, null
  br i1 %47, label %48, label %53

48:                                               ; preds = %44
  tail call void (i8*, ...) @error(i8* noundef getelementptr inbounds ([40 x i8], [40 x i8]* @.str.33, i64 0, i64 0)) #17
  %49 = load i1, i1* @runtime, align 4
  br i1 %49, label %50, label %143

50:                                               ; preds = %48
  %51 = load [1 x %struct.__jmp_buf_tag]*, [1 x %struct.__jmp_buf_tag]** @rtld_fail, align 8, !tbaa !4
  %52 = getelementptr inbounds [1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* %51, i64 0, i64 0
  tail call void @longjmp(%struct.__jmp_buf_tag* noundef %52, i32 noundef 1) #20
  unreachable

53:                                               ; preds = %37, %44
  %54 = phi %struct.dso** [ %46, %44 ], [ getelementptr inbounds ([4 x %struct.dso*], [4 x %struct.dso*]* @builtin_ctor_queue, i64 0, i64 0), %37 ]
  %55 = getelementptr inbounds %struct.dso*, %struct.dso** %54, i64 %39
  store %struct.dso* %0, %struct.dso** %55, align 8, !tbaa !4
  %56 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 30
  store i64 0, i64* %56, align 8, !tbaa !9
  %57 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 24
  store i8 1, i8* %57, align 1, !tbaa !8
  %58 = icmp eq i64 %39, -1
  br i1 %58, label %59, label %60

59:                                               ; preds = %53
  store %struct.dso* null, %struct.dso** %54, align 8, !tbaa !4
  br label %143

60:                                               ; preds = %53, %103
  %61 = phi i64 [ %104, %103 ], [ %39, %53 ]
  %62 = phi i64 [ %106, %103 ], [ 0, %53 ]
  %63 = add nuw i64 %61, 1
  %64 = getelementptr inbounds %struct.dso*, %struct.dso** %54, i64 %61
  %65 = load %struct.dso*, %struct.dso** %64, align 8, !tbaa !4
  %66 = getelementptr inbounds %struct.dso, %struct.dso* %65, i64 0, i32 30
  %67 = load i64, i64* %66, align 8, !tbaa !9
  %68 = getelementptr inbounds %struct.dso, %struct.dso* %65, i64 0, i32 29
  %69 = load i64, i64* %68, align 8, !tbaa !9
  %70 = icmp ult i64 %67, %69
  br i1 %70, label %71, label %103

71:                                               ; preds = %60, %95
  %72 = phi i64 [ %96, %95 ], [ %67, %60 ]
  %73 = phi i64* [ %99, %95 ], [ %66, %60 ]
  %74 = phi %struct.dso* [ %98, %95 ], [ %65, %60 ]
  %75 = phi i64 [ %97, %95 ], [ %63, %60 ]
  %76 = getelementptr inbounds %struct.dso, %struct.dso* %74, i64 0, i32 27
  %77 = load %struct.dso**, %struct.dso*** %76, align 8, !tbaa !4
  %78 = getelementptr inbounds %struct.dso*, %struct.dso** %77, i64 %72
  %79 = load %struct.dso*, %struct.dso** %78, align 8, !tbaa !4
  %80 = getelementptr inbounds %struct.dso, %struct.dso* %79, i64 0, i32 24
  %81 = load i8, i8* %80, align 1, !tbaa !8
  %82 = icmp eq i8 %81, 0
  br i1 %82, label %87, label %83

83:                                               ; preds = %71
  %84 = add nuw i64 %72, 1
  store i64 %84, i64* %73, align 8, !tbaa !9
  %85 = getelementptr inbounds %struct.dso, %struct.dso* %74, i64 0, i32 30
  %86 = load i64, i64* %85, align 8, !tbaa !9
  br label %95

87:                                               ; preds = %71
  %88 = add i64 %75, -1
  %89 = getelementptr inbounds %struct.dso*, %struct.dso** %54, i64 %88
  store %struct.dso* %74, %struct.dso** %89, align 8, !tbaa !4
  %90 = load %struct.dso**, %struct.dso*** %76, align 8, !tbaa !4
  %91 = getelementptr inbounds %struct.dso*, %struct.dso** %90, i64 %72
  %92 = load %struct.dso*, %struct.dso** %91, align 8, !tbaa !4
  %93 = getelementptr inbounds %struct.dso, %struct.dso* %92, i64 0, i32 30
  store i64 0, i64* %93, align 8, !tbaa !9
  %94 = getelementptr inbounds %struct.dso, %struct.dso* %92, i64 0, i32 24
  store i8 1, i8* %94, align 1, !tbaa !8
  br label %95

95:                                               ; preds = %87, %83
  %96 = phi i64 [ %86, %83 ], [ 0, %87 ]
  %97 = phi i64 [ %75, %83 ], [ %88, %87 ]
  %98 = phi %struct.dso* [ %74, %83 ], [ %92, %87 ]
  %99 = getelementptr inbounds %struct.dso, %struct.dso* %98, i64 0, i32 30
  %100 = getelementptr inbounds %struct.dso, %struct.dso* %98, i64 0, i32 29
  %101 = load i64, i64* %100, align 8, !tbaa !9
  %102 = icmp ult i64 %96, %101
  br i1 %102, label %71, label %103

103:                                              ; preds = %95, %60
  %104 = phi i64 [ %63, %60 ], [ %97, %95 ]
  %105 = phi %struct.dso* [ %65, %60 ], [ %98, %95 ]
  %106 = add i64 %62, 1
  %107 = getelementptr inbounds %struct.dso*, %struct.dso** %54, i64 %62
  store %struct.dso* %105, %struct.dso** %107, align 8, !tbaa !4
  %108 = icmp ult i64 %104, %40
  br i1 %108, label %60, label %109

109:                                              ; preds = %103
  %110 = getelementptr inbounds %struct.dso*, %struct.dso** %54, i64 %106
  store %struct.dso* null, %struct.dso** %110, align 8, !tbaa !4
  %111 = icmp eq i64 %106, 0
  br i1 %111, label %143, label %115

112:                                              ; preds = %115
  br i1 %111, label %143, label %113

113:                                              ; preds = %112
  %114 = bitcast %struct.dso** %54 to i8*
  br label %122

115:                                              ; preds = %109, %115
  %116 = phi i64 [ %120, %115 ], [ 0, %109 ]
  %117 = getelementptr inbounds %struct.dso*, %struct.dso** %54, i64 %116
  %118 = load %struct.dso*, %struct.dso** %117, align 8, !tbaa !4
  %119 = getelementptr inbounds %struct.dso, %struct.dso* %118, i64 0, i32 24
  store i8 0, i8* %119, align 1, !tbaa !8
  %120 = add nuw i64 %116, 1
  %121 = icmp eq i64 %116, %62
  br i1 %121, label %112, label %115

122:                                              ; preds = %113, %140
  %123 = phi i64 [ 0, %113 ], [ %141, %140 ]
  %124 = getelementptr inbounds %struct.dso*, %struct.dso** %54, i64 %123
  %125 = load %struct.dso*, %struct.dso** %124, align 8, !tbaa !4
  %126 = getelementptr inbounds %struct.dso, %struct.dso* %125, i64 0, i32 31
  %127 = load %struct.__pthread*, %struct.__pthread** %126, align 8, !tbaa !4
  %128 = icmp eq %struct.__pthread* %127, null
  br i1 %128, label %140, label %129

129:                                              ; preds = %122
  %130 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %127, i64 0, i32 6
  %131 = load i32, i32* %130, align 8, !tbaa !61
  %132 = icmp slt i32 %131, 0
  br i1 %132, label %133, label %140

133:                                              ; preds = %129
  %134 = getelementptr inbounds %struct.dso, %struct.dso* %125, i64 0, i32 1
  %135 = load i8*, i8** %134, align 8, !tbaa !4
  tail call void (i8*, ...) @error(i8* noundef getelementptr inbounds ([55 x i8], [55 x i8]* @.str.34, i64 0, i64 0), i8* noundef %135) #17
  tail call void @__libc_free(i8* noundef nonnull %114) #16
  %136 = load i1, i1* @runtime, align 4
  br i1 %136, label %137, label %140

137:                                              ; preds = %133
  %138 = load [1 x %struct.__jmp_buf_tag]*, [1 x %struct.__jmp_buf_tag]** @rtld_fail, align 8, !tbaa !4
  %139 = getelementptr inbounds [1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* %138, i64 0, i64 0
  tail call void @longjmp(%struct.__jmp_buf_tag* noundef %139, i32 noundef 1) #20
  unreachable

140:                                              ; preds = %122, %129, %133
  %141 = add nuw i64 %123, 1
  %142 = icmp eq i64 %123, %62
  br i1 %142, label %143, label %122

143:                                              ; preds = %140, %109, %59, %112, %48, %1
  %144 = phi %struct.dso** [ null, %1 ], [ null, %48 ], [ %54, %112 ], [ %54, %59 ], [ %54, %109 ], [ %54, %140 ]
  ret %struct.dso** %144
}

; Function Attrs: optsize
declare hidden i8* @__libc_calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define i8* @dlopen(i8* noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = alloca %struct.__sigset_t, align 8
  %4 = alloca %struct.dso*, align 8
  %5 = alloca i32, align 4
  %6 = alloca [1 x %struct.__jmp_buf_tag], align 16
  %7 = alloca %struct.dso**, align 8
  %8 = bitcast %struct.dso** %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %8)
  %9 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %9) #14
  %10 = bitcast [1 x %struct.__jmp_buf_tag]* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 200, i8* nonnull %10) #14
  %11 = bitcast %struct.dso*** %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %11)
  store volatile %struct.dso** null, %struct.dso*** %7, align 8, !tbaa !4
  %12 = icmp eq i8* %0, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %2
  %14 = load i8*, i8** bitcast (%struct.dso** @head to i8**), align 8, !tbaa !4
  br label %509

15:                                               ; preds = %2
  %16 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %5) #16
  %17 = call i32 @pthread_rwlock_wrlock(%struct.pthread_rwlock_t* noundef nonnull @lock) #16
  call void @__inhibit_ptc() #16
  store i32 1, i32* getelementptr inbounds (%struct.debug, %struct.debug* @debug, i64 0, i32 3), align 8, !tbaa !56
  call void @_dl_debug_state() #16
  store volatile %struct.dso* null, %struct.dso** %4, align 8, !tbaa !4
  %18 = load i1, i1* @shutting_down, align 4
  br i1 %18, label %19, label %20

19:                                               ; preds = %15
  call void (i8*, ...) @error(i8* noundef getelementptr inbounds ([40 x i8], [40 x i8]* @.str.21, i64 0, i64 0)) #17
  br label %490

20:                                               ; preds = %15
  %21 = load %struct.tls_module*, %struct.tls_module** @tls_tail, align 8, !tbaa !4
  %22 = load i64, i64* @tls_cnt, align 8, !tbaa !9
  %23 = load i64, i64* @tls_offset, align 8, !tbaa !9
  %24 = load i64, i64* @tls_align, align 8, !tbaa !9
  %25 = load %struct.dso*, %struct.dso** @lazy_head, align 8, !tbaa !4
  %26 = load %struct.dso*, %struct.dso** @syms_tail, align 8, !tbaa !4
  %27 = load %struct.dso*, %struct.dso** @tail, align 8, !tbaa !4
  %28 = and i32 %1, 4
  store i32 %28, i32* @noload, align 4, !tbaa !13
  store [1 x %struct.__jmp_buf_tag]* %6, [1 x %struct.__jmp_buf_tag]** @rtld_fail, align 8, !tbaa !4
  %29 = getelementptr inbounds [1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* %6, i64 0, i64 0
  %30 = call i32 @setjmp(%struct.__jmp_buf_tag* noundef nonnull %29) #21
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %103, label %32

32:                                               ; preds = %20
  %33 = icmp eq %struct.dso* %26, null
  br i1 %33, label %39, label %34

34:                                               ; preds = %32, %34
  %35 = phi %struct.dso* [ %37, %34 ], [ %26, %32 ]
  %36 = getelementptr inbounds %struct.dso, %struct.dso* %35, i64 0, i32 13
  %37 = load %struct.dso*, %struct.dso** %36, align 8, !tbaa !4
  store %struct.dso* null, %struct.dso** %36, align 8, !tbaa !4
  %38 = icmp eq %struct.dso* %37, null
  br i1 %38, label %39, label %34

39:                                               ; preds = %34, %32
  store %struct.dso* %26, %struct.dso** @syms_tail, align 8, !tbaa !4
  %40 = getelementptr inbounds %struct.dso, %struct.dso* %27, i64 0, i32 3
  %41 = load %struct.dso*, %struct.dso** %40, align 8, !tbaa !4
  store volatile %struct.dso* %41, %struct.dso** %4, align 8, !tbaa !4
  %42 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %43 = icmp eq %struct.dso* %42, null
  br i1 %43, label %94, label %44

44:                                               ; preds = %39, %84
  %45 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %46 = getelementptr inbounds %struct.dso, %struct.dso* %45, i64 0, i32 3
  %47 = load %struct.dso*, %struct.dso** %46, align 8, !tbaa !4
  %48 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %49 = getelementptr inbounds %struct.dso, %struct.dso* %48, i64 0, i32 40
  %50 = load %struct.td_index*, %struct.td_index** %49, align 8, !tbaa !4
  %51 = icmp eq %struct.td_index* %50, null
  br i1 %51, label %68, label %52

52:                                               ; preds = %44, %52
  %53 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %54 = getelementptr inbounds %struct.dso, %struct.dso* %53, i64 0, i32 40
  %55 = load %struct.td_index*, %struct.td_index** %54, align 8, !tbaa !4
  %56 = getelementptr inbounds %struct.td_index, %struct.td_index* %55, i64 0, i32 1
  %57 = load %struct.td_index*, %struct.td_index** %56, align 8, !tbaa !62
  %58 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %59 = getelementptr inbounds %struct.dso, %struct.dso* %58, i64 0, i32 40
  %60 = bitcast %struct.td_index** %59 to i8**
  %61 = load i8*, i8** %60, align 8, !tbaa !4
  call void @__libc_free(i8* noundef %61) #16
  %62 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %63 = getelementptr inbounds %struct.dso, %struct.dso* %62, i64 0, i32 40
  store %struct.td_index* %57, %struct.td_index** %63, align 8, !tbaa !4
  %64 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %65 = getelementptr inbounds %struct.dso, %struct.dso* %64, i64 0, i32 40
  %66 = load %struct.td_index*, %struct.td_index** %65, align 8, !tbaa !4
  %67 = icmp eq %struct.td_index* %66, null
  br i1 %67, label %68, label %52

68:                                               ; preds = %52, %44
  %69 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %70 = getelementptr inbounds %struct.dso, %struct.dso* %69, i64 0, i32 44
  %71 = bitcast %struct.funcdesc** %70 to i8**
  %72 = load i8*, i8** %71, align 8, !tbaa !4
  call void @__libc_free(i8* noundef %72) #16
  %73 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %74 = getelementptr inbounds %struct.dso, %struct.dso* %73, i64 0, i32 33
  %75 = load i8*, i8** %74, align 8, !tbaa !4
  %76 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %77 = getelementptr inbounds %struct.dso, %struct.dso* %76, i64 0, i32 32
  %78 = load i8*, i8** %77, align 8, !tbaa !4
  %79 = icmp eq i8* %75, %78
  br i1 %79, label %84, label %80

80:                                               ; preds = %68
  %81 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %82 = getelementptr inbounds %struct.dso, %struct.dso* %81, i64 0, i32 33
  %83 = load i8*, i8** %82, align 8, !tbaa !4
  call void @__libc_free(i8* noundef %83) #16
  br label %84

84:                                               ; preds = %80, %68
  %85 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %86 = getelementptr inbounds %struct.dso, %struct.dso* %85, i64 0, i32 27
  %87 = bitcast %struct.dso*** %86 to i8**
  %88 = load i8*, i8** %87, align 8, !tbaa !4
  call void @__libc_free(i8* noundef %88) #16
  %89 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  call fastcc void @unmap_library(%struct.dso* noundef %89) #17
  %90 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %91 = bitcast %struct.dso* %90 to i8*
  call void @__libc_free(i8* noundef %91) #16
  store volatile %struct.dso* %47, %struct.dso** %4, align 8, !tbaa !4
  %92 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %93 = icmp eq %struct.dso* %92, null
  br i1 %93, label %94, label %44

94:                                               ; preds = %84, %39
  %95 = load volatile %struct.dso**, %struct.dso*** %7, align 8, !tbaa !4
  %96 = bitcast %struct.dso** %95 to i8*
  call void @__libc_free(i8* noundef %96) #16
  store volatile %struct.dso** null, %struct.dso*** %7, align 8, !tbaa !4
  %97 = icmp eq %struct.tls_module* %21, null
  br i1 %97, label %98, label %99

98:                                               ; preds = %94
  store %struct.tls_module* null, %struct.tls_module** getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 6), align 8, !tbaa !47
  br label %101

99:                                               ; preds = %94
  store %struct.tls_module* %21, %struct.tls_module** @tls_tail, align 8, !tbaa !4
  %100 = getelementptr inbounds %struct.tls_module, %struct.tls_module* %21, i64 0, i32 0
  br label %101

101:                                              ; preds = %98, %99
  %102 = phi %struct.tls_module** [ @tls_tail, %98 ], [ %100, %99 ]
  store %struct.tls_module* null, %struct.tls_module** %102, align 8, !tbaa !4
  store i64 %22, i64* @tls_cnt, align 8, !tbaa !9
  store i64 %23, i64* @tls_offset, align 8, !tbaa !9
  store i64 %24, i64* @tls_align, align 8, !tbaa !9
  store %struct.dso* %25, %struct.dso** @lazy_head, align 8, !tbaa !4
  store %struct.dso* %27, %struct.dso** @tail, align 8, !tbaa !4
  store %struct.dso* null, %struct.dso** %40, align 8, !tbaa !4
  store volatile %struct.dso* null, %struct.dso** %4, align 8, !tbaa !4
  br label %490

103:                                              ; preds = %20
  %104 = load %struct.dso*, %struct.dso** @head, align 8, !tbaa !4
  %105 = call fastcc %struct.dso* @load_library(i8* noundef nonnull %0, %struct.dso* noundef %104) #17
  store volatile %struct.dso* %105, %struct.dso** %4, align 8, !tbaa !4
  %106 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %107 = icmp eq %struct.dso* %106, null
  br i1 %107, label %108, label %112

108:                                              ; preds = %103
  %109 = load i32, i32* @noload, align 4, !tbaa !13
  %110 = icmp eq i32 %109, 0
  %111 = select i1 %110, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.23, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.22, i64 0, i64 0)
  call void (i8*, ...) @error(i8* noundef %111, i8* noundef nonnull %0) #17
  br label %490

112:                                              ; preds = %103
  %113 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  call fastcc void @load_deps(%struct.dso* noundef %113) #17
  %114 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %115 = load i32, i32* @__malloc_replaced, align 4, !tbaa !13
  %116 = icmp eq i32 %115, 0
  br i1 %116, label %121, label %117

117:                                              ; preds = %112
  %118 = getelementptr inbounds %struct.dso, %struct.dso* %114, i64 0, i32 26
  %119 = load i8, i8* %118, align 1, !tbaa !8
  %120 = icmp eq i8 %119, 0
  br i1 %120, label %126, label %121

121:                                              ; preds = %117, %112
  %122 = getelementptr inbounds %struct.dso, %struct.dso* %114, i64 0, i32 27
  %123 = load %struct.dso**, %struct.dso*** %122, align 8, !tbaa !4
  %124 = icmp eq %struct.dso** %123, getelementptr inbounds ([2 x %struct.dso*], [2 x %struct.dso*]* @builtin_deps, i64 0, i64 0)
  %125 = zext i1 %124 to i32
  br label %126

126:                                              ; preds = %121, %117
  %127 = phi i32 [ 1, %117 ], [ %125, %121 ]
  %128 = getelementptr inbounds %struct.dso, %struct.dso* %114, i64 0, i32 25
  %129 = load i8, i8* %128, align 4, !tbaa !8
  %130 = icmp eq i8 %129, 0
  br i1 %130, label %131, label %254

131:                                              ; preds = %126
  %132 = getelementptr inbounds %struct.dso, %struct.dso* %114, i64 0, i32 29
  %133 = load i64, i64* %132, align 8, !tbaa !9
  %134 = getelementptr inbounds %struct.dso, %struct.dso* %114, i64 0, i32 27
  %135 = load %struct.dso**, %struct.dso*** %134, align 8, !tbaa !4
  %136 = load %struct.dso*, %struct.dso** %135, align 8, !tbaa !4
  %137 = icmp eq %struct.dso* %136, null
  br i1 %137, label %245, label %144

138:                                              ; preds = %144
  %139 = load %struct.dso*, %struct.dso** %149, align 8, !tbaa !4
  %140 = icmp eq %struct.dso* %139, null
  br i1 %140, label %245, label %141

141:                                              ; preds = %138
  %142 = bitcast %struct.dso*** %134 to i8**
  %143 = getelementptr inbounds %struct.dso, %struct.dso* %114, i64 0, i32 1
  br label %153

144:                                              ; preds = %131, %144
  %145 = phi %struct.dso* [ %151, %144 ], [ %136, %131 ]
  %146 = phi i64 [ %148, %144 ], [ 0, %131 ]
  %147 = getelementptr inbounds %struct.dso, %struct.dso* %145, i64 0, i32 24
  store i8 1, i8* %147, align 1, !tbaa !8
  %148 = add i64 %146, 1
  %149 = load %struct.dso**, %struct.dso*** %134, align 8, !tbaa !4
  %150 = getelementptr inbounds %struct.dso*, %struct.dso** %149, i64 %148
  %151 = load %struct.dso*, %struct.dso** %150, align 8, !tbaa !4
  %152 = icmp eq %struct.dso* %151, null
  br i1 %152, label %138, label %144

153:                                              ; preds = %237, %141
  %154 = phi %struct.dso** [ %149, %141 ], [ %241, %237 ]
  %155 = phi %struct.dso* [ %139, %141 ], [ %243, %237 ]
  %156 = phi i32 [ %127, %141 ], [ %239, %237 ]
  %157 = phi i64 [ 0, %141 ], [ %240, %237 ]
  %158 = phi i64 [ %133, %141 ], [ %238, %237 ]
  %159 = bitcast %struct.dso** %154 to i8*
  %160 = getelementptr inbounds %struct.dso, %struct.dso* %155, i64 0, i32 29
  %161 = load i64, i64* %160, align 8, !tbaa !9
  %162 = icmp eq i64 %161, 0
  br i1 %162, label %178, label %163

163:                                              ; preds = %153
  %164 = getelementptr inbounds %struct.dso, %struct.dso* %155, i64 0, i32 27
  %165 = load %struct.dso**, %struct.dso*** %164, align 8, !tbaa !4
  br label %166

166:                                              ; preds = %166, %163
  %167 = phi i64 [ 0, %163 ], [ %175, %166 ]
  %168 = phi i64 [ 0, %163 ], [ %176, %166 ]
  %169 = getelementptr inbounds %struct.dso*, %struct.dso** %165, i64 %168
  %170 = load %struct.dso*, %struct.dso** %169, align 8, !tbaa !4
  %171 = getelementptr inbounds %struct.dso, %struct.dso* %170, i64 0, i32 24
  %172 = load i8, i8* %171, align 1, !tbaa !8
  %173 = icmp eq i8 %172, 0
  %174 = zext i1 %173 to i64
  %175 = add i64 %167, %174
  %176 = add nuw i64 %168, 1
  %177 = icmp eq i64 %176, %161
  br i1 %177, label %178, label %166

178:                                              ; preds = %166, %153
  %179 = phi i64 [ 0, %153 ], [ %175, %166 ]
  %180 = icmp eq i32 %156, 0
  %181 = add i64 %179, %158
  %182 = shl i64 %181, 3
  %183 = add i64 %182, 8
  br i1 %180, label %184, label %187

184:                                              ; preds = %178
  %185 = call i8* @__libc_realloc(i8* noundef %159, i64 noundef %183) #16
  %186 = icmp eq i8* %185, null
  br i1 %186, label %190, label %201

187:                                              ; preds = %178
  %188 = call i8* @__libc_malloc(i64 noundef %183) #16
  %189 = icmp eq i8* %188, null
  br i1 %189, label %190, label %196

190:                                              ; preds = %187, %184
  %191 = load i8*, i8** %143, align 8, !tbaa !4
  call void (i8*, ...) @error(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.46, i64 0, i64 0), i8* noundef %191) #16
  %192 = load i1, i1* @runtime, align 4
  br i1 %192, label %193, label %237

193:                                              ; preds = %190
  %194 = load [1 x %struct.__jmp_buf_tag]*, [1 x %struct.__jmp_buf_tag]** @rtld_fail, align 8, !tbaa !4
  %195 = getelementptr inbounds [1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* %194, i64 0, i64 0
  call void @longjmp(%struct.__jmp_buf_tag* noundef %195, i32 noundef 1) #20
  unreachable

196:                                              ; preds = %187
  %197 = load i8*, i8** %142, align 8, !tbaa !4
  %198 = shl i64 %158, 3
  %199 = add i64 %198, 8
  %200 = call i8* @memcpy(i8* noundef nonnull %188, i8* noundef %197, i64 noundef %199) #16
  br label %201

201:                                              ; preds = %196, %184
  %202 = phi i8* [ %188, %196 ], [ %185, %184 ]
  store i8* %202, i8** %142, align 8, !tbaa !4
  %203 = load i64, i64* %160, align 8, !tbaa !9
  %204 = icmp eq i64 %203, 0
  %205 = bitcast i8* %202 to %struct.dso**
  br i1 %204, label %233, label %206

206:                                              ; preds = %201
  %207 = getelementptr inbounds %struct.dso, %struct.dso* %155, i64 0, i32 27
  br label %208

208:                                              ; preds = %226, %206
  %209 = phi i64 [ %203, %206 ], [ %227, %226 ]
  %210 = phi i64 [ %158, %206 ], [ %228, %226 ]
  %211 = phi i64 [ 0, %206 ], [ %229, %226 ]
  %212 = load %struct.dso**, %struct.dso*** %207, align 8, !tbaa !4
  %213 = getelementptr inbounds %struct.dso*, %struct.dso** %212, i64 %211
  %214 = load %struct.dso*, %struct.dso** %213, align 8, !tbaa !4
  %215 = getelementptr inbounds %struct.dso, %struct.dso* %214, i64 0, i32 24
  %216 = load i8, i8* %215, align 1, !tbaa !8
  %217 = icmp eq i8 %216, 0
  br i1 %217, label %218, label %226

218:                                              ; preds = %208
  store i8 1, i8* %215, align 1, !tbaa !8
  %219 = load %struct.dso**, %struct.dso*** %207, align 8, !tbaa !4
  %220 = getelementptr inbounds %struct.dso*, %struct.dso** %219, i64 %211
  %221 = load %struct.dso*, %struct.dso** %220, align 8, !tbaa !4
  %222 = load %struct.dso**, %struct.dso*** %134, align 8, !tbaa !4
  %223 = add i64 %210, 1
  %224 = getelementptr inbounds %struct.dso*, %struct.dso** %222, i64 %210
  store %struct.dso* %221, %struct.dso** %224, align 8, !tbaa !4
  %225 = load i64, i64* %160, align 8, !tbaa !9
  br label %226

226:                                              ; preds = %218, %208
  %227 = phi i64 [ %209, %208 ], [ %225, %218 ]
  %228 = phi i64 [ %210, %208 ], [ %223, %218 ]
  %229 = add nuw i64 %211, 1
  %230 = icmp ult i64 %229, %227
  br i1 %230, label %208, label %231

231:                                              ; preds = %226
  %232 = load %struct.dso**, %struct.dso*** %134, align 8, !tbaa !4
  br label %233

233:                                              ; preds = %231, %201
  %234 = phi %struct.dso** [ %205, %201 ], [ %232, %231 ]
  %235 = phi i64 [ %158, %201 ], [ %228, %231 ]
  %236 = getelementptr inbounds %struct.dso*, %struct.dso** %234, i64 %235
  store %struct.dso* null, %struct.dso** %236, align 8, !tbaa !4
  br label %237

237:                                              ; preds = %233, %190
  %238 = phi i64 [ %235, %233 ], [ %158, %190 ]
  %239 = phi i32 [ 0, %233 ], [ %156, %190 ]
  %240 = add i64 %157, 1
  %241 = load %struct.dso**, %struct.dso*** %134, align 8, !tbaa !4
  %242 = getelementptr inbounds %struct.dso*, %struct.dso** %241, i64 %240
  %243 = load %struct.dso*, %struct.dso** %242, align 8, !tbaa !4
  %244 = icmp eq %struct.dso* %243, null
  br i1 %244, label %245, label %153

245:                                              ; preds = %237, %138, %131
  store i8 1, i8* %128, align 4, !tbaa !8
  %246 = load %struct.dso*, %struct.dso** @head, align 8, !tbaa !4
  %247 = icmp eq %struct.dso* %246, null
  br i1 %247, label %254, label %248

248:                                              ; preds = %245, %248
  %249 = phi %struct.dso* [ %252, %248 ], [ %246, %245 ]
  %250 = getelementptr inbounds %struct.dso, %struct.dso* %249, i64 0, i32 24
  store i8 0, i8* %250, align 1, !tbaa !8
  %251 = getelementptr inbounds %struct.dso, %struct.dso* %249, i64 0, i32 3
  %252 = load %struct.dso*, %struct.dso** %251, align 8, !tbaa !4
  %253 = icmp eq %struct.dso* %252, null
  br i1 %253, label %254, label %248

254:                                              ; preds = %248, %126, %245
  %255 = call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* noundef nonnull @init_fini_lock) #16
  %256 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %257 = getelementptr inbounds %struct.dso, %struct.dso* %256, i64 0, i32 22
  %258 = load i8, i8* %257, align 1, !tbaa !8
  %259 = call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* noundef nonnull @init_fini_lock) #16
  %260 = icmp eq i8 %258, 0
  br i1 %260, label %261, label %264

261:                                              ; preds = %254
  %262 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %263 = call fastcc %struct.dso** @queue_ctors(%struct.dso* noundef %262) #17
  store volatile %struct.dso** %263, %struct.dso*** %7, align 8, !tbaa !4
  br label %264

264:                                              ; preds = %261, %254
  %265 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %266 = getelementptr inbounds %struct.dso, %struct.dso* %265, i64 0, i32 21
  %267 = load i8, i8* %266, align 8, !tbaa !8
  %268 = icmp ne i8 %267, 0
  %269 = and i32 %1, 1
  %270 = icmp eq i32 %269, 0
  %271 = or i1 %270, %268
  br i1 %271, label %303, label %272

272:                                              ; preds = %264
  %273 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  call fastcc void @prepare_lazy(%struct.dso* noundef %273) #17
  %274 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %275 = getelementptr inbounds %struct.dso, %struct.dso* %274, i64 0, i32 27
  %276 = load %struct.dso**, %struct.dso*** %275, align 8, !tbaa !4
  %277 = load %struct.dso*, %struct.dso** %276, align 8, !tbaa !4
  %278 = icmp eq %struct.dso* %277, null
  br i1 %278, label %303, label %279

279:                                              ; preds = %272, %295
  %280 = phi i64 [ %296, %295 ], [ 0, %272 ]
  %281 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %282 = getelementptr inbounds %struct.dso, %struct.dso* %281, i64 0, i32 27
  %283 = load %struct.dso**, %struct.dso*** %282, align 8, !tbaa !4
  %284 = getelementptr inbounds %struct.dso*, %struct.dso** %283, i64 %280
  %285 = load %struct.dso*, %struct.dso** %284, align 8, !tbaa !4
  %286 = getelementptr inbounds %struct.dso, %struct.dso* %285, i64 0, i32 21
  %287 = load i8, i8* %286, align 8, !tbaa !8
  %288 = icmp eq i8 %287, 0
  br i1 %288, label %289, label %295

289:                                              ; preds = %279
  %290 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %291 = getelementptr inbounds %struct.dso, %struct.dso* %290, i64 0, i32 27
  %292 = load %struct.dso**, %struct.dso*** %291, align 8, !tbaa !4
  %293 = getelementptr inbounds %struct.dso*, %struct.dso** %292, i64 %280
  %294 = load %struct.dso*, %struct.dso** %293, align 8, !tbaa !4
  call fastcc void @prepare_lazy(%struct.dso* noundef %294) #17
  br label %295

295:                                              ; preds = %279, %289
  %296 = add i64 %280, 1
  %297 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %298 = getelementptr inbounds %struct.dso, %struct.dso* %297, i64 0, i32 27
  %299 = load %struct.dso**, %struct.dso*** %298, align 8, !tbaa !4
  %300 = getelementptr inbounds %struct.dso*, %struct.dso** %299, i64 %296
  %301 = load %struct.dso*, %struct.dso** %300, align 8, !tbaa !4
  %302 = icmp eq %struct.dso* %301, null
  br i1 %302, label %303, label %279

303:                                              ; preds = %295, %272, %264
  %304 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %305 = getelementptr inbounds %struct.dso, %struct.dso* %304, i64 0, i32 21
  %306 = load i8, i8* %305, align 8, !tbaa !8
  %307 = icmp ne i8 %306, 0
  %308 = and i32 %1, 256
  %309 = icmp eq i32 %308, 0
  %310 = and i1 %309, %307
  br i1 %310, label %350, label %311

311:                                              ; preds = %303
  %312 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %313 = getelementptr inbounds %struct.dso, %struct.dso* %312, i64 0, i32 13
  %314 = load %struct.dso*, %struct.dso** %313, align 8, !tbaa !4
  %315 = icmp eq %struct.dso* %314, null
  br i1 %315, label %316, label %321

316:                                              ; preds = %311
  %317 = load %struct.dso*, %struct.dso** @syms_tail, align 8, !tbaa !4
  %318 = icmp eq %struct.dso* %317, %312
  br i1 %318, label %321, label %319

319:                                              ; preds = %316
  %320 = getelementptr inbounds %struct.dso, %struct.dso* %317, i64 0, i32 13
  store %struct.dso* %312, %struct.dso** %320, align 8, !tbaa !4
  store %struct.dso* %312, %struct.dso** @syms_tail, align 8, !tbaa !4
  br label %321

321:                                              ; preds = %311, %316, %319
  %322 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %323 = getelementptr inbounds %struct.dso, %struct.dso* %322, i64 0, i32 27
  %324 = load %struct.dso**, %struct.dso*** %323, align 8, !tbaa !4
  %325 = load %struct.dso*, %struct.dso** %324, align 8, !tbaa !4
  %326 = icmp eq %struct.dso* %325, null
  br i1 %326, label %350, label %327

327:                                              ; preds = %321, %342
  %328 = phi i64 [ %343, %342 ], [ 0, %321 ]
  %329 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %330 = getelementptr inbounds %struct.dso, %struct.dso* %329, i64 0, i32 27
  %331 = load %struct.dso**, %struct.dso*** %330, align 8, !tbaa !4
  %332 = getelementptr inbounds %struct.dso*, %struct.dso** %331, i64 %328
  %333 = load %struct.dso*, %struct.dso** %332, align 8, !tbaa !4
  %334 = getelementptr inbounds %struct.dso, %struct.dso* %333, i64 0, i32 13
  %335 = load %struct.dso*, %struct.dso** %334, align 8, !tbaa !4
  %336 = icmp eq %struct.dso* %335, null
  br i1 %336, label %337, label %342

337:                                              ; preds = %327
  %338 = load %struct.dso*, %struct.dso** @syms_tail, align 8, !tbaa !4
  %339 = icmp eq %struct.dso* %338, %333
  br i1 %339, label %342, label %340

340:                                              ; preds = %337
  %341 = getelementptr inbounds %struct.dso, %struct.dso* %338, i64 0, i32 13
  store %struct.dso* %333, %struct.dso** %341, align 8, !tbaa !4
  store %struct.dso* %333, %struct.dso** @syms_tail, align 8, !tbaa !4
  br label %342

342:                                              ; preds = %327, %337, %340
  %343 = add i64 %328, 1
  %344 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %345 = getelementptr inbounds %struct.dso, %struct.dso* %344, i64 0, i32 27
  %346 = load %struct.dso**, %struct.dso*** %345, align 8, !tbaa !4
  %347 = getelementptr inbounds %struct.dso*, %struct.dso** %346, i64 %343
  %348 = load %struct.dso*, %struct.dso** %347, align 8, !tbaa !4
  %349 = icmp eq %struct.dso* %348, null
  br i1 %349, label %350, label %327

350:                                              ; preds = %342, %321, %303
  %351 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %352 = getelementptr inbounds %struct.dso, %struct.dso* %351, i64 0, i32 21
  %353 = load i8, i8* %352, align 8, !tbaa !8
  %354 = icmp eq i8 %353, 0
  br i1 %354, label %355, label %357

355:                                              ; preds = %350
  %356 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  call fastcc void @reloc_all(%struct.dso* noundef %356) #17
  br label %357

357:                                              ; preds = %355, %350
  br i1 %309, label %358, label %366

358:                                              ; preds = %357
  %359 = icmp eq %struct.dso* %26, null
  br i1 %359, label %365, label %360

360:                                              ; preds = %358, %360
  %361 = phi %struct.dso* [ %363, %360 ], [ %26, %358 ]
  %362 = getelementptr inbounds %struct.dso, %struct.dso* %361, i64 0, i32 13
  %363 = load %struct.dso*, %struct.dso** %362, align 8, !tbaa !4
  store %struct.dso* null, %struct.dso** %362, align 8, !tbaa !4
  %364 = icmp eq %struct.dso* %363, null
  br i1 %364, label %365, label %360

365:                                              ; preds = %360, %358
  store %struct.dso* %26, %struct.dso** @syms_tail, align 8, !tbaa !4
  br label %366

366:                                              ; preds = %365, %357
  %367 = load %struct.dso*, %struct.dso** @lazy_head, align 8, !tbaa !4
  store %struct.dso* null, %struct.dso** @lazy_head, align 8, !tbaa !4
  %368 = icmp eq %struct.dso* %367, null
  br i1 %368, label %387, label %369

369:                                              ; preds = %366, %385
  %370 = phi %struct.dso* [ %372, %385 ], [ %367, %366 ]
  %371 = getelementptr inbounds %struct.dso, %struct.dso* %370, i64 0, i32 14
  %372 = load %struct.dso*, %struct.dso** %371, align 8, !tbaa !4
  %373 = getelementptr inbounds %struct.dso, %struct.dso* %370, i64 0, i32 16
  %374 = load i64, i64* %373, align 8, !tbaa !9
  %375 = mul i64 %374, 24
  store i64 0, i64* %373, align 8, !tbaa !9
  %376 = getelementptr inbounds %struct.dso, %struct.dso* %370, i64 0, i32 15
  %377 = load i64*, i64** %376, align 8, !tbaa !4
  call fastcc void @do_relocs(%struct.dso* noundef nonnull %370, i64* noundef %377, i64 noundef %375, i64 noundef 3) #16
  %378 = load i64, i64* %373, align 8, !tbaa !9
  %379 = icmp eq i64 %378, 0
  br i1 %379, label %382, label %380

380:                                              ; preds = %369
  %381 = load %struct.dso*, %struct.dso** @lazy_head, align 8, !tbaa !4
  store %struct.dso* %381, %struct.dso** %371, align 8, !tbaa !4
  store %struct.dso* %370, %struct.dso** @lazy_head, align 8, !tbaa !4
  br label %385

382:                                              ; preds = %369
  %383 = bitcast i64** %376 to i8**
  %384 = load i8*, i8** %383, align 8, !tbaa !4
  call void @__libc_free(i8* noundef %384) #16
  store i64* null, i64** %376, align 8, !tbaa !4
  store %struct.dso* null, %struct.dso** %371, align 8, !tbaa !4
  br label %385

385:                                              ; preds = %382, %380
  %386 = icmp eq %struct.dso* %372, null
  br i1 %386, label %387, label %369

387:                                              ; preds = %385, %366
  %388 = load i64, i64* @tls_cnt, align 8, !tbaa !9
  store i64 %388, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 9), align 8, !tbaa !50
  %389 = load i64, i64* @tls_align, align 8, !tbaa !9
  store i64 %389, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 8), align 8, !tbaa !35
  %390 = shl i64 %388, 3
  %391 = load i64, i64* @tls_offset, align 8, !tbaa !9
  %392 = shl i64 %389, 1
  %393 = add i64 %390, 207
  %394 = add i64 %393, %389
  %395 = add i64 %394, %392
  %396 = add i64 %395, %391
  %397 = sub i64 0, %389
  %398 = and i64 %396, %397
  store i64 %398, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 7), align 8, !tbaa !34
  %399 = icmp eq i64 %388, %22
  br i1 %399, label %490, label %400

400:                                              ; preds = %387
  %401 = bitcast %struct.__sigset_t* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %401) #14
  %402 = call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !3
  %403 = inttoptr i64 %402 to %struct.__pthread*
  %404 = load i8*, i8** bitcast (%struct.tls_module** @tls_tail to i8**), align 8, !tbaa !4
  %405 = add i64 %388, 1
  %406 = getelementptr inbounds i8, i8* %404, i64 72
  %407 = bitcast i8* %406 to i64**
  %408 = load i64*, i64** %407, align 8, !tbaa !4
  %409 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %403, i64 0, i32 1
  %410 = load i64*, i64** %409, align 8, !tbaa !64
  %411 = load i64, i64* %410, align 8, !tbaa !9
  call void @__block_app_sigs(i8* noundef nonnull %401) #16
  call void @__tl_lock() #16
  %412 = shl i64 %411, 3
  %413 = add i64 %412, 8
  br label %414

414:                                              ; preds = %414, %400
  %415 = phi %struct.__pthread* [ %403, %400 ], [ %427, %414 ]
  %416 = phi i64 [ 0, %400 ], [ %425, %414 ]
  %417 = mul nsw i64 %416, %405
  %418 = getelementptr inbounds i64, i64* %408, i64 %417
  %419 = bitcast i64* %418 to i8*
  %420 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %415, i64 0, i32 1
  %421 = bitcast i64** %420 to i8**
  %422 = load i8*, i8** %421, align 8, !tbaa !64
  %423 = call i8* @memcpy(i8* noundef %419, i8* noundef %422, i64 noundef %413) #16
  %424 = load i64, i64* @tls_cnt, align 8, !tbaa !9
  store i64 %424, i64* %418, align 8, !tbaa !9
  %425 = add i64 %416, 1
  %426 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %415, i64 0, i32 3
  %427 = load %struct.__pthread*, %struct.__pthread** %426, align 8, !tbaa !65
  %428 = icmp eq i64 %425, 0
  %429 = icmp ne %struct.__pthread* %427, %403
  %430 = select i1 %428, i1 true, i1 %429
  br i1 %430, label %414, label %431

431:                                              ; preds = %414, %473
  %432 = phi %struct.dso** [ %474, %473 ], [ @head, %414 ]
  %433 = load %struct.dso*, %struct.dso** %432, align 8, !tbaa !4
  %434 = getelementptr inbounds %struct.dso, %struct.dso* %433, i64 0, i32 35
  %435 = load i64, i64* %434, align 8, !tbaa !9
  %436 = icmp ugt i64 %435, %411
  br i1 %436, label %437, label %473

437:                                              ; preds = %431
  %438 = getelementptr inbounds %struct.dso, %struct.dso* %433, i64 0, i32 39
  %439 = load i8*, i8** %438, align 8, !tbaa !4
  %440 = getelementptr inbounds %struct.dso, %struct.dso* %433, i64 0, i32 34, i32 1
  %441 = getelementptr inbounds %struct.dso, %struct.dso* %433, i64 0, i32 34, i32 4
  %442 = getelementptr inbounds %struct.dso, %struct.dso* %433, i64 0, i32 34, i32 2
  %443 = getelementptr inbounds %struct.dso, %struct.dso* %433, i64 0, i32 34, i32 3
  %444 = load i64, i64* %441, align 8, !tbaa !42
  br label %445

445:                                              ; preds = %445, %437
  %446 = phi i64 [ %444, %437 ], [ %464, %445 ]
  %447 = phi i8* [ %439, %437 ], [ %466, %445 ]
  %448 = phi i64 [ 0, %437 ], [ %467, %445 ]
  %449 = load i8*, i8** %440, align 8, !tbaa !45
  %450 = ptrtoint i8* %449 to i64
  %451 = ptrtoint i8* %447 to i64
  %452 = sub i64 %450, %451
  %453 = add i64 %446, -1
  %454 = and i64 %452, %453
  %455 = getelementptr inbounds i8, i8* %447, i64 %454
  %456 = load i64, i64* %442, align 8, !tbaa !66
  %457 = call i8* @memcpy(i8* noundef %455, i8* noundef %449, i64 noundef %456) #16
  %458 = ptrtoint i8* %455 to i64
  %459 = mul nsw i64 %448, %405
  %460 = getelementptr inbounds i64, i64* %408, i64 %459
  %461 = load i64, i64* %434, align 8, !tbaa !9
  %462 = getelementptr inbounds i64, i64* %460, i64 %461
  store i64 %458, i64* %462, align 8, !tbaa !9
  %463 = load i64, i64* %443, align 8, !tbaa !44
  %464 = load i64, i64* %441, align 8, !tbaa !42
  %465 = add i64 %464, %463
  %466 = getelementptr inbounds i8, i8* %447, i64 %465
  %467 = add nuw i64 %448, 1
  %468 = icmp eq i64 %448, %416
  br i1 %468, label %469, label %445

469:                                              ; preds = %445
  %470 = load i64, i64* %434, align 8, !tbaa !9
  %471 = load i64, i64* @tls_cnt, align 8, !tbaa !9
  %472 = icmp eq i64 %470, %471
  br i1 %472, label %475, label %473

473:                                              ; preds = %469, %431
  %474 = getelementptr inbounds %struct.dso, %struct.dso* %433, i64 0, i32 3
  br label %431

475:                                              ; preds = %469
  %476 = call i32 @__membarrier(i32 noundef 8, i32 noundef 0) #16
  br label %477

477:                                              ; preds = %477, %475
  %478 = phi %struct.__pthread* [ %403, %475 ], [ %485, %477 ]
  %479 = phi i64 [ 0, %475 ], [ %483, %477 ]
  %480 = mul nsw i64 %479, %405
  %481 = getelementptr inbounds i64, i64* %408, i64 %480
  %482 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %478, i64 0, i32 1
  store i64* %481, i64** %482, align 8, !tbaa !64
  %483 = add i64 %479, 1
  %484 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %478, i64 0, i32 3
  %485 = load %struct.__pthread*, %struct.__pthread** %484, align 8, !tbaa !65
  %486 = icmp eq i64 %483, 0
  %487 = icmp ne %struct.__pthread* %485, %403
  %488 = select i1 %486, i1 true, i1 %487
  br i1 %488, label %477, label %489

489:                                              ; preds = %477
  call void @__tl_unlock() #16
  call void @__restore_sigs(i8* noundef nonnull %401) #16
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %401) #14
  br label %490

490:                                              ; preds = %387, %489, %108, %101, %19
  store i32 0, i32* getelementptr inbounds (%struct.debug, %struct.debug* @debug, i64 0, i32 3), align 8, !tbaa !56
  call void @_dl_debug_state() #16
  call void @__release_ptc() #16
  %491 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %492 = icmp eq %struct.dso* %491, null
  br i1 %492, label %496, label %493

493:                                              ; preds = %490
  %494 = load i64, i64* @gencnt, align 8, !tbaa !67
  %495 = add i64 %494, 1
  store i64 %495, i64* @gencnt, align 8, !tbaa !67
  br label %496

496:                                              ; preds = %493, %490
  %497 = call i32 @pthread_rwlock_unlock(%struct.pthread_rwlock_t* noundef nonnull @lock) #16
  %498 = load volatile %struct.dso**, %struct.dso*** %7, align 8, !tbaa !4
  %499 = icmp eq %struct.dso** %498, null
  br i1 %499, label %504, label %500

500:                                              ; preds = %496
  %501 = load volatile %struct.dso**, %struct.dso*** %7, align 8, !tbaa !4
  call fastcc void @do_init_fini(%struct.dso** noundef %501) #17
  %502 = load volatile %struct.dso**, %struct.dso*** %7, align 8, !tbaa !4
  %503 = bitcast %struct.dso** %502 to i8*
  call void @__libc_free(i8* noundef %503) #16
  br label %504

504:                                              ; preds = %500, %496
  %505 = load i32, i32* %5, align 4, !tbaa !13
  %506 = call i32 @pthread_setcancelstate(i32 noundef %505, i32* noundef null) #16
  %507 = load volatile %struct.dso*, %struct.dso** %4, align 8, !tbaa !4
  %508 = bitcast %struct.dso* %507 to i8*
  br label %509

509:                                              ; preds = %504, %13
  %510 = phi i8* [ %508, %504 ], [ %14, %13 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %11)
  call void @llvm.lifetime.end.p0i8(i64 200, i8* nonnull %10) #14
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %9) #14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %8)
  ret i8* %510
}

; Function Attrs: optsize
declare i32 @pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__inhibit_ptc() local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal void @error(i8* noundef %0, ...) unnamed_addr #0 {
  %2 = alloca [1 x %struct.__va_list_tag], align 16
  %3 = bitcast [1 x %struct.__va_list_tag]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %3) #14
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0
  call void @llvm.va_start(i8* nonnull %3) #18
  %5 = load i1, i1* @runtime, align 4
  br i1 %5, label %9, label %6

6:                                                ; preds = %1
  %7 = call i32 @vdprintf(i32 noundef 2, i8* noundef %0, %struct.__va_list_tag* noundef nonnull %4) #16
  %8 = call i32 (i32, i8*, ...) @dprintf(i32 noundef 2, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.49, i64 0, i64 0)) #16
  store i1 true, i1* @ldso_fail, align 4
  br label %10

9:                                                ; preds = %1
  call void @__dl_vseterr(i8* noundef %0, %struct.__va_list_tag* noundef nonnull %4) #16
  br label %10

10:                                               ; preds = %9, %6
  call void @llvm.va_end(i8* nonnull %3) #18
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %3) #14
  ret void
}

; Function Attrs: optsize returns_twice
declare i32 @setjmp(%struct.__jmp_buf_tag* noundef) local_unnamed_addr #11

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @unmap_library(%struct.dso* nocapture noundef readonly %0) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 43
  %3 = load %struct.fdpic_loadmap*, %struct.fdpic_loadmap** %2, align 8, !tbaa !4
  %4 = icmp eq %struct.fdpic_loadmap* %3, null
  br i1 %4, label %31, label %5

5:                                                ; preds = %1
  %6 = getelementptr inbounds %struct.fdpic_loadmap, %struct.fdpic_loadmap* %3, i64 0, i32 1
  %7 = load i16, i16* %6, align 2, !tbaa !27
  %8 = icmp eq i16 %7, 0
  br i1 %8, label %28, label %9

9:                                                ; preds = %5, %21
  %10 = phi %struct.fdpic_loadmap* [ %22, %21 ], [ %3, %5 ]
  %11 = phi i64 [ %23, %21 ], [ 0, %5 ]
  %12 = getelementptr inbounds %struct.fdpic_loadmap, %struct.fdpic_loadmap* %10, i64 0, i32 2, i64 %11, i32 2
  %13 = load i64, i64* %12, align 8, !tbaa !69
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %21, label %15

15:                                               ; preds = %9
  %16 = getelementptr inbounds %struct.fdpic_loadmap, %struct.fdpic_loadmap* %10, i64 0, i32 2, i64 %11, i32 0
  %17 = load i64, i64* %16, align 8, !tbaa !71
  %18 = inttoptr i64 %17 to i8*
  %19 = tail call i32 @munmap(i8* noundef %18, i64 noundef %13) #16
  %20 = load %struct.fdpic_loadmap*, %struct.fdpic_loadmap** %2, align 8, !tbaa !4
  br label %21

21:                                               ; preds = %9, %15
  %22 = phi %struct.fdpic_loadmap* [ %10, %9 ], [ %20, %15 ]
  %23 = add nuw nsw i64 %11, 1
  %24 = getelementptr inbounds %struct.fdpic_loadmap, %struct.fdpic_loadmap* %22, i64 0, i32 1
  %25 = load i16, i16* %24, align 2, !tbaa !27
  %26 = zext i16 %25 to i64
  %27 = icmp ult i64 %23, %26
  br i1 %27, label %9, label %28

28:                                               ; preds = %21, %5
  %29 = phi %struct.fdpic_loadmap* [ %3, %5 ], [ %22, %21 ]
  %30 = bitcast %struct.fdpic_loadmap* %29 to i8*
  tail call void @__libc_free(i8* noundef %30) #16
  br label %41

31:                                               ; preds = %1
  %32 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 17
  %33 = load i8*, i8** %32, align 8, !tbaa !4
  %34 = icmp eq i8* %33, null
  br i1 %34, label %41, label %35

35:                                               ; preds = %31
  %36 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 18
  %37 = load i64, i64* %36, align 8, !tbaa !9
  %38 = icmp eq i64 %37, 0
  br i1 %38, label %41, label %39

39:                                               ; preds = %35
  %40 = tail call i32 @munmap(i8* noundef nonnull %33, i64 noundef %37) #16
  br label %41

41:                                               ; preds = %31, %35, %39, %28
  ret void
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc %struct.dso* @load_library(i8* noundef %0, %struct.dso* noundef %1) unnamed_addr #0 {
  %3 = alloca [512 x i8], align 16
  %4 = alloca %struct.dso, align 8
  %5 = alloca %struct.stat, align 16
  %6 = getelementptr inbounds [512 x i8], [512 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 512, i8* nonnull %6) #14
  %7 = bitcast %struct.dso* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 368, i8* nonnull %7) #14
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(368) %7, i8 0, i64 368, i1 false) #18
  %8 = bitcast %struct.stat* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %8) #14
  %9 = load i8, i8* %0, align 1, !tbaa !8
  switch i8 %9, label %52 [
    i8 0, label %10
    i8 108, label %12
  ]

10:                                               ; preds = %2
  %11 = tail call i32* @___errno_location() #19
  store i32 22, i32* %11, align 4, !tbaa !13
  br label %504

12:                                               ; preds = %2
  %13 = getelementptr inbounds i8, i8* %0, i64 1
  %14 = load i8, i8* %13, align 1, !tbaa !8
  %15 = icmp eq i8 %14, 105
  br i1 %15, label %16, label %52

16:                                               ; preds = %12
  %17 = getelementptr inbounds i8, i8* %0, i64 2
  %18 = load i8, i8* %17, align 1, !tbaa !8
  %19 = icmp eq i8 %18, 98
  br i1 %19, label %20, label %52

20:                                               ; preds = %16
  %21 = getelementptr inbounds i8, i8* %0, i64 3
  br label %22

22:                                               ; preds = %20, %26
  %23 = phi i8* [ %28, %26 ], [ getelementptr inbounds ([29 x i8], [29 x i8]* @load_library.reserved, i64 0, i64 0), %20 ]
  %24 = load i8, i8* %23, align 1, !tbaa !8
  %25 = icmp eq i8 %24, 0
  br i1 %25, label %52, label %26

26:                                               ; preds = %22
  %27 = tail call i8* @strchr(i8* noundef nonnull %23, i32 noundef 46) #16
  %28 = getelementptr inbounds i8, i8* %27, i64 1
  %29 = ptrtoint i8* %28 to i64
  %30 = ptrtoint i8* %23 to i64
  %31 = sub i64 %29, %30
  %32 = tail call i32 @strncmp(i8* noundef nonnull %21, i8* noundef nonnull %23, i64 noundef %31) #16
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %22

34:                                               ; preds = %26
  %35 = ptrtoint i8* %23 to i64
  %36 = load i8, i8* %23, align 1, !tbaa !8
  %37 = icmp eq i8 %36, 0
  br i1 %37, label %52, label %38

38:                                               ; preds = %34
  %39 = load i1, i1* @ldd_mode, align 4
  br i1 %39, label %40, label %52

40:                                               ; preds = %38
  %41 = trunc i64 %35 to i32
  %42 = sub i32 %41, ptrtoint ([29 x i8]* @load_library.reserved to i32)
  %43 = shl nuw i32 1, %42
  %44 = load i32, i32* @load_library.reported, align 4, !tbaa !13
  %45 = and i32 %44, %43
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %52

47:                                               ; preds = %40
  %48 = or i32 %44, %43
  store i32 %48, i32* @load_library.reported, align 4, !tbaa !13
  %49 = load i8*, i8** getelementptr inbounds (%struct.dso, %struct.dso* @ldso, i64 0, i32 1), align 8, !tbaa !4
  %50 = load i8*, i8** getelementptr inbounds (%struct.dso, %struct.dso* @ldso, i64 0, i32 0), align 8, !tbaa !4
  %51 = tail call i32 (i32, i8*, ...) @dprintf(i32 noundef 1, i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.35, i64 0, i64 0), i8* noundef nonnull %0, i8* noundef %49, i8* noundef %50) #16
  br label %52

52:                                               ; preds = %22, %34, %40, %47, %38, %2, %16, %12
  %53 = phi i1 [ true, %34 ], [ false, %40 ], [ false, %47 ], [ false, %38 ], [ true, %2 ], [ true, %16 ], [ true, %12 ], [ true, %22 ]
  %54 = load i8*, i8** getelementptr inbounds (%struct.dso, %struct.dso* @ldso, i64 0, i32 1), align 8, !tbaa !4
  %55 = load i8, i8* %0, align 1, !tbaa !8
  %56 = load i8, i8* %54, align 1, !tbaa !8
  %57 = icmp ne i8 %55, %56
  %58 = icmp eq i8 %55, 0
  %59 = or i1 %58, %57
  br i1 %59, label %70, label %60

60:                                               ; preds = %52, %60
  %61 = phi i8* [ %64, %60 ], [ %54, %52 ]
  %62 = phi i8* [ %63, %60 ], [ %0, %52 ]
  %63 = getelementptr inbounds i8, i8* %62, i64 1
  %64 = getelementptr inbounds i8, i8* %61, i64 1
  %65 = load i8, i8* %63, align 1, !tbaa !8
  %66 = load i8, i8* %64, align 1, !tbaa !8
  %67 = icmp ne i8 %65, %66
  %68 = icmp eq i8 %65, 0
  %69 = or i1 %68, %67
  br i1 %69, label %70, label %60

70:                                               ; preds = %60, %52
  %71 = phi i8 [ %55, %52 ], [ %65, %60 ]
  %72 = phi i8 [ %56, %52 ], [ %66, %60 ]
  %73 = icmp ne i8 %71, %72
  %74 = and i1 %53, %73
  br i1 %74, label %81, label %75

75:                                               ; preds = %70
  %76 = load %struct.dso*, %struct.dso** getelementptr inbounds (%struct.dso, %struct.dso* @ldso, i64 0, i32 4), align 8, !tbaa !4
  %77 = icmp eq %struct.dso* %76, null
  br i1 %77, label %78, label %504

78:                                               ; preds = %75
  %79 = load %struct.dso*, %struct.dso** @tail, align 8, !tbaa !4
  %80 = getelementptr inbounds %struct.dso, %struct.dso* %79, i64 0, i32 3
  store %struct.dso* @ldso, %struct.dso** %80, align 8, !tbaa !4
  store %struct.dso* %79, %struct.dso** getelementptr inbounds (%struct.dso, %struct.dso* @ldso, i64 0, i32 4), align 8, !tbaa !4
  store %struct.dso* @ldso, %struct.dso** @tail, align 8, !tbaa !4
  br label %504

81:                                               ; preds = %70
  %82 = tail call i8* @strchr(i8* noundef nonnull %0, i32 noundef 47) #16
  %83 = icmp eq i8* %82, null
  br i1 %83, label %86, label %84

84:                                               ; preds = %81
  %85 = tail call i32 (i8*, i32, ...) @open(i8* noundef nonnull %0, i32 noundef 524288) #16
  br label %320

86:                                               ; preds = %81
  %87 = load %struct.dso*, %struct.dso** @head, align 8, !tbaa !4
  %88 = getelementptr inbounds %struct.dso, %struct.dso* %87, i64 0, i32 3
  %89 = load %struct.dso*, %struct.dso** %88, align 8, !tbaa !4
  %90 = icmp eq %struct.dso* %89, null
  br i1 %90, label %120, label %91

91:                                               ; preds = %86, %116
  %92 = phi %struct.dso* [ %118, %116 ], [ %89, %86 ]
  %93 = getelementptr inbounds %struct.dso, %struct.dso* %92, i64 0, i32 42
  %94 = load i8*, i8** %93, align 8, !tbaa !4
  %95 = icmp eq i8* %94, null
  br i1 %95, label %116, label %96

96:                                               ; preds = %91
  %97 = load i8, i8* %94, align 1, !tbaa !8
  %98 = load i8, i8* %0, align 1, !tbaa !8
  %99 = icmp ne i8 %97, %98
  %100 = icmp eq i8 %97, 0
  %101 = or i1 %100, %99
  br i1 %101, label %112, label %102

102:                                              ; preds = %96, %102
  %103 = phi i8* [ %106, %102 ], [ %0, %96 ]
  %104 = phi i8* [ %105, %102 ], [ %94, %96 ]
  %105 = getelementptr inbounds i8, i8* %104, i64 1
  %106 = getelementptr inbounds i8, i8* %103, i64 1
  %107 = load i8, i8* %105, align 1, !tbaa !8
  %108 = load i8, i8* %106, align 1, !tbaa !8
  %109 = icmp ne i8 %107, %108
  %110 = icmp eq i8 %107, 0
  %111 = or i1 %110, %109
  br i1 %111, label %112, label %102

112:                                              ; preds = %102, %96
  %113 = phi i8 [ %97, %96 ], [ %107, %102 ]
  %114 = phi i8 [ %98, %96 ], [ %108, %102 ]
  %115 = icmp eq i8 %113, %114
  br i1 %115, label %504, label %116

116:                                              ; preds = %91, %112
  %117 = getelementptr inbounds %struct.dso, %struct.dso* %92, i64 0, i32 3
  %118 = load %struct.dso*, %struct.dso** %117, align 8, !tbaa !4
  %119 = icmp eq %struct.dso* %118, null
  br i1 %119, label %120, label %91

120:                                              ; preds = %116, %86
  %121 = tail call i64 @strlen(i8* noundef nonnull %0) #16
  %122 = icmp ugt i64 %121, 255
  br i1 %122, label %504, label %123

123:                                              ; preds = %120
  %124 = load i8*, i8** @env_path, align 8, !tbaa !4
  %125 = icmp eq i8* %124, null
  br i1 %125, label %128, label %126

126:                                              ; preds = %123
  %127 = call fastcc i32 @path_open(i8* noundef nonnull %0, i8* noundef nonnull %124, i8* noundef nonnull %6) #17
  br label %128

128:                                              ; preds = %126, %123
  %129 = phi i32 [ %127, %126 ], [ -1, %123 ]
  %130 = icmp eq i32 %129, -1
  %131 = icmp ne %struct.dso* %1, null
  %132 = and i1 %130, %131
  br i1 %132, label %133, label %249

133:                                              ; preds = %128, %242
  %134 = phi %struct.dso* [ %245, %242 ], [ %1, %128 ]
  %135 = getelementptr inbounds %struct.dso, %struct.dso* %134, i64 0, i32 33
  %136 = load i8*, i8** %135, align 8, !tbaa !4
  %137 = icmp eq i8* %136, null
  br i1 %137, label %138, label %235

138:                                              ; preds = %133
  %139 = getelementptr inbounds %struct.dso, %struct.dso* %134, i64 0, i32 32
  %140 = load i8*, i8** %139, align 8, !tbaa !4
  %141 = icmp eq i8* %140, null
  br i1 %141, label %235, label %142

142:                                              ; preds = %138
  %143 = call i8* @strchr(i8* noundef nonnull %140, i32 noundef 36) #16
  %144 = icmp eq i8* %143, null
  %145 = load i8*, i8** %139, align 8, !tbaa !4
  br i1 %144, label %146, label %147

146:                                              ; preds = %142
  store i8* %145, i8** %135, align 8, !tbaa !4
  br label %235

147:                                              ; preds = %142
  %148 = call i8* @strchr(i8* noundef %145, i32 noundef 36) #16
  %149 = icmp eq i8* %148, null
  br i1 %149, label %165, label %150

150:                                              ; preds = %147, %158
  %151 = phi i8* [ %161, %158 ], [ %148, %147 ]
  %152 = phi i64 [ %160, %158 ], [ 0, %147 ]
  %153 = call i32 @strncmp(i8* noundef nonnull %151, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.42, i64 0, i64 0), i64 noundef 7) #16
  %154 = icmp eq i32 %153, 0
  br i1 %154, label %158, label %155

155:                                              ; preds = %150
  %156 = call i32 @strncmp(i8* noundef nonnull %151, i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.43, i64 0, i64 0), i64 noundef 9) #16
  %157 = icmp eq i32 %156, 0
  br i1 %157, label %158, label %235

158:                                              ; preds = %155, %150
  %159 = getelementptr inbounds i8, i8* %151, i64 1
  %160 = add i64 %152, 1
  %161 = call i8* @strchr(i8* noundef nonnull %159, i32 noundef 36) #16
  %162 = icmp eq i8* %161, null
  br i1 %162, label %163, label %150

163:                                              ; preds = %158
  %164 = icmp ugt i64 %160, 2251799813685247
  br i1 %164, label %235, label %165

165:                                              ; preds = %163, %147
  %166 = phi i64 [ %160, %163 ], [ 0, %147 ]
  %167 = getelementptr inbounds %struct.dso, %struct.dso* %134, i64 0, i32 23
  %168 = load i8, i8* %167, align 2, !tbaa !8
  %169 = icmp eq i8 %168, 0
  br i1 %169, label %183, label %170

170:                                              ; preds = %165
  %171 = load i8, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 2), align 2, !tbaa !40
  %172 = icmp eq i8 %171, 0
  br i1 %172, label %173, label %235

173:                                              ; preds = %170
  %174 = call i64 @readlink(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.44, i64 0, i64 0), i8* noundef nonnull %6, i64 noundef 512) #16
  %175 = icmp eq i64 %174, -1
  br i1 %175, label %176, label %179

176:                                              ; preds = %173
  %177 = tail call i32* @___errno_location() #19
  %178 = load i32, i32* %177, align 4, !tbaa !13
  switch i32 %178, label %236 [
    i32 2, label %235
    i32 20, label %235
    i32 13, label %235
  ]

179:                                              ; preds = %173
  %180 = icmp ugt i64 %174, 511
  br i1 %180, label %235, label %181

181:                                              ; preds = %179
  %182 = getelementptr inbounds [512 x i8], [512 x i8]* %3, i64 0, i64 %174
  store i8 0, i8* %182, align 1, !tbaa !8
  br label %186

183:                                              ; preds = %165
  %184 = getelementptr inbounds %struct.dso, %struct.dso* %134, i64 0, i32 1
  %185 = load i8*, i8** %184, align 8, !tbaa !4
  br label %186

186:                                              ; preds = %183, %181
  %187 = phi i8* [ %6, %181 ], [ %185, %183 ]
  %188 = call i8* @strrchr(i8* noundef %187, i32 noundef 47) #16
  %189 = icmp eq i8* %188, null
  %190 = ptrtoint i8* %188 to i64
  %191 = ptrtoint i8* %187 to i64
  %192 = sub i64 %190, %191
  %193 = select i1 %189, i64 1, i64 %192
  %194 = select i1 %189, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.45, i64 0, i64 0), i8* %187
  %195 = load i8, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 2), align 2, !tbaa !40
  %196 = icmp eq i8 %195, 0
  br i1 %196, label %200, label %197

197:                                              ; preds = %186
  %198 = load i8, i8* %194, align 1, !tbaa !8
  %199 = icmp eq i8 %198, 47
  br i1 %199, label %200, label %235

200:                                              ; preds = %197, %186
  %201 = load i8*, i8** %139, align 8, !tbaa !4
  %202 = call i64 @strlen(i8* noundef %201) #16
  %203 = mul i64 %193, %166
  %204 = add i64 %203, 1
  %205 = add i64 %204, %202
  %206 = call i8* @__libc_malloc(i64 noundef %205) #16
  store i8* %206, i8** %135, align 8, !tbaa !4
  %207 = icmp eq i8* %206, null
  br i1 %207, label %504, label %208

208:                                              ; preds = %200
  %209 = load i8*, i8** %139, align 8, !tbaa !4
  %210 = call i8* @strchr(i8* noundef %209, i32 noundef 36) #16
  %211 = icmp eq i8* %210, null
  br i1 %211, label %231, label %212

212:                                              ; preds = %208, %212
  %213 = phi i8* [ %229, %212 ], [ %210, %208 ]
  %214 = phi i8* [ %222, %212 ], [ %206, %208 ]
  %215 = phi i8* [ %228, %212 ], [ %209, %208 ]
  %216 = ptrtoint i8* %213 to i64
  %217 = ptrtoint i8* %215 to i64
  %218 = sub i64 %216, %217
  %219 = call i8* @memcpy(i8* noundef %214, i8* noundef %215, i64 noundef %218) #16
  %220 = getelementptr inbounds i8, i8* %214, i64 %218
  %221 = call i8* @memcpy(i8* noundef %220, i8* noundef %194, i64 noundef %193) #16
  %222 = getelementptr inbounds i8, i8* %220, i64 %193
  %223 = getelementptr inbounds i8, i8* %213, i64 7
  %224 = getelementptr inbounds i8, i8* %213, i64 1
  %225 = load i8, i8* %224, align 1, !tbaa !8
  %226 = icmp eq i8 %225, 123
  %227 = select i1 %226, i64 2, i64 0
  %228 = getelementptr inbounds i8, i8* %223, i64 %227
  %229 = call i8* @strchr(i8* noundef nonnull %228, i32 noundef 36) #16
  %230 = icmp eq i8* %229, null
  br i1 %230, label %231, label %212

231:                                              ; preds = %212, %208
  %232 = phi i8* [ %209, %208 ], [ %228, %212 ]
  %233 = phi i8* [ %206, %208 ], [ %222, %212 ]
  %234 = call i8* @strcpy(i8* noundef %233, i8* noundef %232) #16
  br label %235

235:                                              ; preds = %155, %231, %146, %138, %133, %163, %170, %179, %197, %176, %176, %176
  br label %236

236:                                              ; preds = %176, %235
  %237 = phi i32 [ -2, %176 ], [ -1, %235 ]
  %238 = load i8*, i8** %135, align 8, !tbaa !4
  %239 = icmp eq i8* %238, null
  br i1 %239, label %242, label %240

240:                                              ; preds = %236
  %241 = call fastcc i32 @path_open(i8* noundef nonnull %0, i8* noundef nonnull %238, i8* noundef nonnull %6) #17
  br label %242

242:                                              ; preds = %236, %240
  %243 = phi i32 [ %241, %240 ], [ %237, %236 ]
  %244 = getelementptr inbounds %struct.dso, %struct.dso* %134, i64 0, i32 28
  %245 = load %struct.dso*, %struct.dso** %244, align 8, !tbaa !4
  %246 = icmp eq i32 %243, -1
  %247 = icmp ne %struct.dso* %245, null
  %248 = select i1 %246, i1 %247, i1 false
  br i1 %248, label %133, label %249

249:                                              ; preds = %242, %128
  %250 = phi i32 [ %129, %128 ], [ %243, %242 ]
  %251 = phi i1 [ %130, %128 ], [ %246, %242 ]
  br i1 %251, label %252, label %320

252:                                              ; preds = %249
  %253 = load i8*, i8** @sys_path, align 8, !tbaa !4
  %254 = icmp eq i8* %253, null
  br i1 %254, label %255, label %317

255:                                              ; preds = %252
  %256 = load i8*, i8** getelementptr inbounds (%struct.dso, %struct.dso* @ldso, i64 0, i32 1), align 8, !tbaa !4
  %257 = load i8, i8* %256, align 1, !tbaa !8
  %258 = icmp eq i8 %257, 47
  br i1 %258, label %259, label %276

259:                                              ; preds = %255, %265
  %260 = phi i8 [ %269, %265 ], [ 47, %255 ]
  %261 = phi i8* [ %268, %265 ], [ %256, %255 ]
  %262 = phi i8* [ %266, %265 ], [ %256, %255 ]
  %263 = phi i8* [ %267, %265 ], [ %256, %255 ]
  switch i8 %260, label %265 [
    i8 0, label %270
    i8 47, label %264
  ]

264:                                              ; preds = %259
  br label %265

265:                                              ; preds = %259, %264
  %266 = phi i8* [ %261, %264 ], [ %262, %259 ]
  %267 = phi i8* [ %262, %264 ], [ %263, %259 ]
  %268 = getelementptr inbounds i8, i8* %261, i64 1
  %269 = load i8, i8* %268, align 1, !tbaa !8
  br label %259

270:                                              ; preds = %259
  %271 = ptrtoint i8* %263 to i64
  %272 = ptrtoint i8* %256 to i64
  %273 = sub i64 %271, %272
  %274 = icmp ult i64 %273, 4096
  %275 = select i1 %274, i8* %256, i8* null
  br label %276

276:                                              ; preds = %270, %255
  %277 = phi i8* [ %275, %270 ], [ null, %255 ]
  %278 = phi i64 [ %273, %270 ], [ undef, %255 ]
  %279 = icmp eq i8* %277, null
  %280 = select i1 %279, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i64 0, i64 0), i8* %277
  %281 = select i1 %279, i64 0, i64 %278
  %282 = add i64 %281, 26
  %283 = call i8* @llvm.stacksave() #18
  %284 = alloca i8, i64 %282, align 16
  %285 = trunc i64 %281 to i32
  %286 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef nonnull %284, i64 noundef %282, i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @.str.36, i64 0, i64 0), i32 noundef %285, i8* noundef %280) #16
  %287 = call i32 (i8*, i32, ...) @open(i8* noundef nonnull %284, i32 noundef 524288) #16
  %288 = icmp sgt i32 %287, -1
  br i1 %288, label %289, label %308

289:                                              ; preds = %276
  %290 = call i32 @fstat(i32 noundef %287, %struct.stat* noundef nonnull %5) #16
  %291 = icmp eq i32 %290, 0
  %292 = getelementptr inbounds %struct.stat, %struct.stat* %5, i64 0, i32 8
  %293 = load i64, i64* %292, align 16
  %294 = select i1 %291, i64 %293, i64 0
  %295 = add i64 %294, 1
  %296 = call i8* @__libc_malloc(i64 noundef %295) #16
  store i8* %296, i8** @sys_path, align 8, !tbaa !4
  %297 = icmp eq i8* %296, null
  br i1 %297, label %304, label %298

298:                                              ; preds = %289
  %299 = getelementptr inbounds i8, i8* %296, i64 %294
  store i8 0, i8* %299, align 1, !tbaa !8
  %300 = call fastcc i64 @read_loop(i32 noundef %287, i8* noundef nonnull %296, i64 noundef %294) #17
  %301 = icmp slt i64 %300, 0
  br i1 %301, label %302, label %306

302:                                              ; preds = %298
  %303 = load i8*, i8** @sys_path, align 8, !tbaa !4
  br label %304

304:                                              ; preds = %302, %289
  %305 = phi i8* [ %303, %302 ], [ null, %289 ]
  call void @__libc_free(i8* noundef %305) #16
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i64 0, i64 0), i8** @sys_path, align 8, !tbaa !4
  br label %306

306:                                              ; preds = %304, %298
  %307 = call i32 @close(i32 noundef %287) #16
  br label %313

308:                                              ; preds = %276
  %309 = tail call i32* @___errno_location() #19
  %310 = load i32, i32* %309, align 4, !tbaa !13
  %311 = icmp eq i32 %310, 2
  br i1 %311, label %313, label %312

312:                                              ; preds = %308
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i64 0, i64 0), i8** @sys_path, align 8, !tbaa !4
  call void @llvm.stackrestore(i8* %283) #18
  br label %317

313:                                              ; preds = %306, %308
  %314 = load i8*, i8** @sys_path, align 8, !tbaa !4
  call void @llvm.stackrestore(i8* %283) #18
  %315 = icmp eq i8* %314, null
  br i1 %315, label %316, label %317

316:                                              ; preds = %313
  store i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.37, i64 0, i64 0), i8** @sys_path, align 8, !tbaa !4
  br label %317

317:                                              ; preds = %252, %312, %316, %313
  %318 = phi i8* [ %253, %252 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i64 0, i64 0), %312 ], [ getelementptr inbounds ([29 x i8], [29 x i8]* @.str.37, i64 0, i64 0), %316 ], [ %314, %313 ]
  %319 = call fastcc i32 @path_open(i8* noundef nonnull %0, i8* noundef nonnull %318, i8* noundef nonnull %6) #17
  br label %320

320:                                              ; preds = %249, %317, %84
  %321 = phi i32 [ %85, %84 ], [ %319, %317 ], [ %250, %249 ]
  %322 = phi i8* [ %0, %84 ], [ %6, %317 ], [ %6, %249 ]
  %323 = icmp slt i32 %321, 0
  br i1 %323, label %504, label %324

324:                                              ; preds = %320
  %325 = call i32 @fstat(i32 noundef %321, %struct.stat* noundef nonnull %5) #16
  %326 = icmp slt i32 %325, 0
  br i1 %326, label %327, label %329

327:                                              ; preds = %324
  %328 = call i32 @close(i32 noundef %321) #16
  br label %504

329:                                              ; preds = %324
  %330 = load %struct.dso*, %struct.dso** @head, align 8, !tbaa !4
  %331 = getelementptr inbounds %struct.dso, %struct.dso* %330, i64 0, i32 3
  %332 = load %struct.dso*, %struct.dso** %331, align 8, !tbaa !4
  %333 = icmp eq %struct.dso* %332, null
  br i1 %333, label %365, label %334

334:                                              ; preds = %329
  %335 = getelementptr inbounds %struct.stat, %struct.stat* %5, i64 0, i32 0
  %336 = load i64, i64* %335, align 16, !tbaa !72
  %337 = getelementptr inbounds %struct.stat, %struct.stat* %5, i64 0, i32 1
  %338 = load i64, i64* %337, align 8
  br label %339

339:                                              ; preds = %334, %361
  %340 = phi %struct.dso* [ %332, %334 ], [ %363, %361 ]
  %341 = getelementptr inbounds %struct.dso, %struct.dso* %340, i64 0, i32 19
  %342 = load i64, i64* %341, align 8, !tbaa !9
  %343 = icmp eq i64 %342, %336
  br i1 %343, label %344, label %361

344:                                              ; preds = %339
  %345 = getelementptr inbounds %struct.dso, %struct.dso* %340, i64 0, i32 20
  %346 = load i64, i64* %345, align 8, !tbaa !9
  %347 = icmp eq i64 %346, %338
  br i1 %347, label %348, label %361

348:                                              ; preds = %344
  %349 = getelementptr inbounds %struct.dso, %struct.dso* %340, i64 0, i32 42
  %350 = load i8*, i8** %349, align 8, !tbaa !4
  %351 = icmp ne i8* %350, null
  %352 = icmp eq i8* %322, %0
  %353 = or i1 %352, %351
  br i1 %353, label %359, label %354

354:                                              ; preds = %348
  %355 = getelementptr inbounds %struct.dso, %struct.dso* %340, i64 0, i32 1
  %356 = load i8*, i8** %355, align 8, !tbaa !4
  %357 = call i8* @strrchr(i8* noundef %356, i32 noundef 47) #16
  %358 = getelementptr inbounds i8, i8* %357, i64 1
  store i8* %358, i8** %349, align 8, !tbaa !4
  br label %359

359:                                              ; preds = %354, %348
  %360 = call i32 @close(i32 noundef %321) #16
  br label %504

361:                                              ; preds = %339, %344
  %362 = getelementptr inbounds %struct.dso, %struct.dso* %340, i64 0, i32 3
  %363 = load %struct.dso*, %struct.dso** %362, align 8, !tbaa !4
  %364 = icmp eq %struct.dso* %363, null
  br i1 %364, label %365, label %339

365:                                              ; preds = %361, %329
  %366 = load i32, i32* @noload, align 4, !tbaa !13
  %367 = icmp eq i32 %366, 0
  br i1 %367, label %368, label %372

368:                                              ; preds = %365
  %369 = call fastcc i8* @map_library(i32 noundef %321, %struct.dso* noundef nonnull %4) #17
  %370 = icmp eq i8* %369, null
  %371 = call i32 @close(i32 noundef %321) #16
  br i1 %370, label %504, label %374

372:                                              ; preds = %365
  %373 = call i32 @close(i32 noundef %321) #16
  br label %504

374:                                              ; preds = %368
  call fastcc void @decode_dyn(%struct.dso* noundef nonnull %4) #17
  %375 = call fastcc { %struct.Elf64_Sym*, %struct.dso* } @find_sym(%struct.dso* noundef nonnull %4, i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.38, i64 0, i64 0), i32 noundef 1) #17
  %376 = extractvalue { %struct.Elf64_Sym*, %struct.dso* } %375, 0
  %377 = icmp eq %struct.Elf64_Sym* %376, null
  br i1 %377, label %384, label %378

378:                                              ; preds = %374
  %379 = call fastcc { %struct.Elf64_Sym*, %struct.dso* } @find_sym(%struct.dso* noundef nonnull %4, i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.39, i64 0, i64 0), i32 noundef 1) #17
  %380 = extractvalue { %struct.Elf64_Sym*, %struct.dso* } %379, 0
  %381 = icmp eq %struct.Elf64_Sym* %380, null
  br i1 %381, label %384, label %382

382:                                              ; preds = %378
  call fastcc void @unmap_library(%struct.dso* noundef nonnull %4) #17
  %383 = call fastcc %struct.dso* @load_library(i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), %struct.dso* noundef %1) #17
  br label %504

384:                                              ; preds = %378, %374
  %385 = load i1, i1* @runtime, align 4
  br i1 %385, label %387, label %386

386:                                              ; preds = %384
  call fastcc void @reclaim_gaps(%struct.dso* noundef nonnull %4) #17
  br label %387

387:                                              ; preds = %386, %384
  %388 = call i64 @strlen(i8* noundef %322) #16
  %389 = add i64 %388, 369
  %390 = load i1, i1* @runtime, align 4
  %391 = getelementptr inbounds %struct.dso, %struct.dso* %4, i64 0, i32 34, i32 1
  %392 = load i8*, i8** %391, align 8
  %393 = icmp ne i8* %392, null
  %394 = select i1 %390, i1 %393, i1 false
  br i1 %394, label %395, label %413

395:                                              ; preds = %387
  %396 = getelementptr inbounds %struct.dso, %struct.dso* %4, i64 0, i32 34, i32 3
  %397 = load i64, i64* %396, align 8, !tbaa !44
  %398 = getelementptr inbounds %struct.dso, %struct.dso* %4, i64 0, i32 34, i32 4
  %399 = load i64, i64* %398, align 8, !tbaa !42
  %400 = load i64, i64* @tls_cnt, align 8, !tbaa !9
  %401 = shl i64 %400, 3
  %402 = add i64 %397, 24
  %403 = add i64 %402, %399
  %404 = add i64 %403, %401
  %405 = load i32, i32* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 4), align 4, !tbaa !75
  %406 = add nsw i32 %405, 1
  %407 = sext i32 %406 to i64
  %408 = udiv i64 9223372036854775807, %404
  %409 = icmp ult i64 %408, %407
  %410 = mul i64 %404, %407
  %411 = add i64 %410, %389
  %412 = select i1 %409, i64 -1, i64 %411
  br label %413

413:                                              ; preds = %395, %387
  %414 = phi i64 [ %407, %395 ], [ 0, %387 ]
  %415 = phi i64 [ %412, %395 ], [ %389, %387 ]
  %416 = call i8* @__libc_calloc(i64 noundef 1, i64 noundef %415) #16
  %417 = bitcast i8* %416 to %struct.dso*
  %418 = icmp eq i8* %416, null
  br i1 %418, label %419, label %420

419:                                              ; preds = %413
  call fastcc void @unmap_library(%struct.dso* noundef nonnull %4) #17
  br label %504

420:                                              ; preds = %413
  %421 = call i8* @memcpy(i8* noundef nonnull %416, i8* noundef nonnull %7, i64 noundef 368) #16
  %422 = getelementptr inbounds i8, i8* %416, i64 152
  %423 = bitcast %struct.stat* %5 to <2 x i64>*
  %424 = load <2 x i64>, <2 x i64>* %423, align 16, !tbaa !9
  %425 = bitcast i8* %422 to <2 x i64>*
  store <2 x i64> %424, <2 x i64>* %425, align 8, !tbaa !9
  %426 = getelementptr inbounds i8, i8* %416, i64 184
  %427 = bitcast i8* %426 to %struct.dso**
  store %struct.dso* %1, %struct.dso** %427, align 8, !tbaa !4
  %428 = getelementptr inbounds i8, i8* %416, i64 368
  %429 = getelementptr inbounds i8, i8* %416, i64 8
  %430 = bitcast i8* %429 to i8**
  store i8* %428, i8** %430, align 8, !tbaa !4
  %431 = load i1, i1* @runtime, align 4
  %432 = zext i1 %431 to i8
  %433 = getelementptr inbounds i8, i8* %416, i64 173
  store i8 %432, i8* %433, align 1, !tbaa !8
  %434 = call i8* @strcpy(i8* noundef nonnull %428, i8* noundef %322) #16
  %435 = icmp eq i8* %322, %0
  br i1 %435, label %442, label %436

436:                                              ; preds = %420
  %437 = load i8*, i8** %430, align 8, !tbaa !4
  %438 = call i8* @strrchr(i8* noundef %437, i32 noundef 47) #16
  %439 = getelementptr inbounds i8, i8* %438, i64 1
  %440 = getelementptr inbounds i8, i8* %416, i64 336
  %441 = bitcast i8* %440 to i8**
  store i8* %439, i8** %441, align 8, !tbaa !4
  br label %442

442:                                              ; preds = %436, %420
  %443 = getelementptr inbounds i8, i8* %416, i64 232
  %444 = getelementptr inbounds i8, i8* %416, i64 240
  %445 = bitcast i8* %444 to i8**
  %446 = load i8*, i8** %445, align 8, !tbaa !45
  %447 = icmp eq i8* %446, null
  br i1 %447, label %493, label %448

448:                                              ; preds = %442
  %449 = load i64, i64* @tls_cnt, align 8, !tbaa !9
  %450 = add i64 %449, 1
  store i64 %450, i64* @tls_cnt, align 8, !tbaa !9
  %451 = getelementptr inbounds i8, i8* %416, i64 280
  %452 = bitcast i8* %451 to i64*
  store i64 %450, i64* %452, align 8, !tbaa !9
  %453 = load i64, i64* @tls_align, align 8, !tbaa !9
  %454 = sub i64 0, %453
  %455 = getelementptr inbounds i8, i8* %416, i64 264
  %456 = bitcast i8* %455 to i64*
  %457 = load i64, i64* %456, align 8, !tbaa !42
  %458 = sub i64 0, %457
  %459 = and i64 %458, %454
  %460 = sub i64 0, %459
  store i64 %460, i64* @tls_align, align 8, !tbaa !9
  %461 = getelementptr inbounds i8, i8* %416, i64 256
  %462 = bitcast i8* %461 to i64*
  %463 = load i64, i64* %462, align 8, !tbaa !44
  %464 = load i64, i64* @tls_offset, align 8, !tbaa !9
  %465 = add i64 %457, -1
  %466 = add i64 %465, %463
  %467 = add i64 %466, %464
  %468 = ptrtoint i8* %446 to i64
  %469 = add i64 %467, %468
  %470 = and i64 %469, %465
  %471 = sub i64 %467, %470
  store i64 %471, i64* @tls_offset, align 8, !tbaa !9
  %472 = getelementptr inbounds i8, i8* %416, i64 272
  %473 = bitcast i8* %472 to i64*
  store i64 %471, i64* %473, align 8, !tbaa !48
  %474 = load i8*, i8** %430, align 8, !tbaa !4
  %475 = call i64 @strlen(i8* noundef %474) #16
  %476 = getelementptr inbounds i8, i8* %474, i64 %475
  %477 = getelementptr inbounds i8, i8* %476, i64 8
  %478 = ptrtoint i8* %477 to i64
  %479 = and i64 %478, -8
  %480 = inttoptr i64 %479 to i64*
  %481 = getelementptr inbounds i8, i8* %416, i64 304
  %482 = bitcast i8* %481 to i64**
  store i64* %480, i64** %482, align 8, !tbaa !4
  %483 = load i64, i64* @tls_cnt, align 8, !tbaa !9
  %484 = add i64 %483, 1
  %485 = mul i64 %484, %414
  %486 = getelementptr inbounds i64, i64* %480, i64 %485
  %487 = getelementptr inbounds i8, i8* %416, i64 312
  %488 = bitcast i8* %487 to i64**
  store i64* %486, i64** %488, align 8, !tbaa !4
  %489 = load %struct.tls_module*, %struct.tls_module** @tls_tail, align 8, !tbaa !4
  %490 = icmp eq %struct.tls_module* %489, null
  %491 = bitcast %struct.tls_module* %489 to i8**
  %492 = select i1 %490, i8** bitcast (%struct.tls_module** getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 6) to i8**), i8** %491
  store i8* %443, i8** %492, align 8, !tbaa !4
  store i8* %443, i8** bitcast (%struct.tls_module** @tls_tail to i8**), align 8, !tbaa !4
  br label %493

493:                                              ; preds = %448, %442
  %494 = load %struct.dso*, %struct.dso** @tail, align 8, !tbaa !4
  %495 = getelementptr inbounds %struct.dso, %struct.dso* %494, i64 0, i32 3
  %496 = bitcast %struct.dso** %495 to i8**
  store i8* %416, i8** %496, align 8, !tbaa !4
  %497 = getelementptr inbounds i8, i8* %416, i64 32
  %498 = bitcast i8* %497 to %struct.dso**
  store %struct.dso* %494, %struct.dso** %498, align 8, !tbaa !4
  store i8* %416, i8** bitcast (%struct.dso** @tail to i8**), align 8, !tbaa !4
  %499 = load i1, i1* @ldd_mode, align 4
  br i1 %499, label %500, label %504

500:                                              ; preds = %493
  %501 = bitcast i8* %416 to i8**
  %502 = load i8*, i8** %501, align 8, !tbaa !4
  %503 = call i32 (i32, i8*, ...) @dprintf(i32 noundef 1, i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.35, i64 0, i64 0), i8* noundef nonnull %0, i8* noundef %322, i8* noundef %502) #16
  br label %504

504:                                              ; preds = %112, %200, %493, %500, %368, %372, %320, %120, %75, %78, %419, %382, %359, %327, %10
  %505 = phi %struct.dso* [ null, %327 ], [ %340, %359 ], [ %383, %382 ], [ null, %419 ], [ null, %10 ], [ @ldso, %78 ], [ @ldso, %75 ], [ null, %120 ], [ null, %320 ], [ null, %372 ], [ null, %368 ], [ %417, %500 ], [ %417, %493 ], [ null, %200 ], [ %92, %112 ]
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %8) #14
  call void @llvm.lifetime.end.p0i8(i64 368, i8* nonnull %7) #14
  call void @llvm.lifetime.end.p0i8(i64 512, i8* nonnull %6) #14
  ret %struct.dso* %505
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @prepare_lazy(%struct.dso* noundef %0) unnamed_addr #0 {
  %2 = alloca [32 x i64], align 16
  %3 = bitcast [32 x i64]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %3) #14
  %4 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 2
  %5 = load i64*, i64** %4, align 8, !tbaa !4
  %6 = getelementptr inbounds [32 x i64], [32 x i64]* %2, i64 0, i64 0
  call fastcc void @decode_vec(i64* noundef %5, i64* noundef nonnull %6) #17
  %7 = load i64*, i64** %4, align 8, !tbaa !4
  %8 = load i64, i64* %7, align 8, !tbaa !9
  %9 = icmp eq i64 %8, 1879048187
  br i1 %9, label %18, label %10

10:                                               ; preds = %1, %14
  %11 = phi i64 [ %16, %14 ], [ %8, %1 ]
  %12 = phi i64* [ %15, %14 ], [ %7, %1 ]
  %13 = icmp eq i64 %11, 0
  br i1 %13, label %23, label %14

14:                                               ; preds = %10
  %15 = getelementptr inbounds i64, i64* %12, i64 2
  %16 = load i64, i64* %15, align 8, !tbaa !9
  %17 = icmp eq i64 %16, 1879048187
  br i1 %17, label %18, label %10

18:                                               ; preds = %14, %1
  %19 = phi i64* [ %7, %1 ], [ %15, %14 ]
  %20 = getelementptr inbounds i64, i64* %19, i64 1
  %21 = load i64, i64* %20, align 8, !tbaa !9
  %22 = and i64 %21, 1
  br label %23

23:                                               ; preds = %10, %18
  %24 = phi i64 [ %22, %18 ], [ 0, %10 ]
  %25 = getelementptr inbounds [32 x i64], [32 x i64]* %2, i64 0, i64 24
  %26 = load i64, i64* %25, align 16, !tbaa !9
  %27 = icmp eq i64 %26, 0
  br i1 %27, label %28, label %60

28:                                               ; preds = %23
  %29 = getelementptr inbounds [32 x i64], [32 x i64]* %2, i64 0, i64 30
  %30 = load i64, i64* %29, align 16, !tbaa !9
  %31 = and i64 %30, 8
  %32 = icmp eq i64 %31, 0
  %33 = icmp eq i64 %24, 0
  %34 = select i1 %32, i1 %33, i1 false
  br i1 %34, label %35, label %60

35:                                               ; preds = %28
  %36 = getelementptr inbounds [32 x i64], [32 x i64]* %2, i64 0, i64 18
  %37 = load i64, i64* %36, align 16, !tbaa !9
  %38 = lshr i64 %37, 1
  %39 = getelementptr inbounds [32 x i64], [32 x i64]* %2, i64 0, i64 8
  %40 = load i64, i64* %39, align 16, !tbaa !9
  %41 = udiv i64 %40, 3
  %42 = getelementptr inbounds [32 x i64], [32 x i64]* %2, i64 0, i64 2
  %43 = load i64, i64* %42, align 16, !tbaa !9
  %44 = lshr i64 %43, 1
  %45 = add nuw i64 %38, 1
  %46 = add nuw i64 %45, %41
  %47 = add i64 %46, %44
  %48 = tail call i8* @__libc_calloc(i64 noundef %47, i64 noundef 24) #16
  %49 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 15
  %50 = bitcast i64** %49 to i8**
  store i8* %48, i8** %50, align 8, !tbaa !4
  %51 = icmp eq i8* %48, null
  br i1 %51, label %52, label %57

52:                                               ; preds = %35
  %53 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 1
  %54 = load i8*, i8** %53, align 8, !tbaa !4
  tail call void (i8*, ...) @error(i8* noundef getelementptr inbounds ([43 x i8], [43 x i8]* @.str.47, i64 0, i64 0), i8* noundef %54) #17
  %55 = load [1 x %struct.__jmp_buf_tag]*, [1 x %struct.__jmp_buf_tag]** @rtld_fail, align 8, !tbaa !4
  %56 = getelementptr inbounds [1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* %55, i64 0, i64 0
  tail call void @longjmp(%struct.__jmp_buf_tag* noundef %56, i32 noundef 1) #20
  unreachable

57:                                               ; preds = %35
  %58 = load %struct.dso*, %struct.dso** @lazy_head, align 8, !tbaa !4
  %59 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 14
  store %struct.dso* %58, %struct.dso** %59, align 8, !tbaa !4
  store %struct.dso* %0, %struct.dso** @lazy_head, align 8, !tbaa !4
  br label %60

60:                                               ; preds = %23, %28, %57
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %3) #14
  ret void
}

; Function Attrs: optsize
declare hidden void @__release_ptc() local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__dl_invalid_handle(i8* noundef %0) local_unnamed_addr #0 {
  %2 = load %struct.dso*, %struct.dso** @head, align 8, !tbaa !4
  %3 = icmp eq %struct.dso* %2, null
  br i1 %3, label %12, label %8

4:                                                ; preds = %8
  %5 = getelementptr inbounds %struct.dso, %struct.dso* %9, i64 0, i32 3
  %6 = load %struct.dso*, %struct.dso** %5, align 8, !tbaa !4
  %7 = icmp eq %struct.dso* %6, null
  br i1 %7, label %12, label %8

8:                                                ; preds = %1, %4
  %9 = phi %struct.dso* [ %6, %4 ], [ %2, %1 ]
  %10 = bitcast %struct.dso* %9 to i8*
  %11 = icmp eq i8* %10, %0
  br i1 %11, label %13, label %4

12:                                               ; preds = %4, %1
  tail call void (i8*, ...) @error(i8* noundef getelementptr inbounds ([26 x i8], [26 x i8]* @.str.24, i64 0, i64 0), i8* noundef %0) #17
  br label %13

13:                                               ; preds = %8, %12
  %14 = phi i32 [ 1, %12 ], [ 0, %8 ]
  ret i32 %14
}

; Function Attrs: nounwind optsize strictfp
define i32 @dladdr(i8* noundef %0, %struct.Dl_info* nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = ptrtoint i8* %0 to i64
  %4 = tail call i32 @pthread_rwlock_rdlock(%struct.pthread_rwlock_t* noundef nonnull @lock) #16
  %5 = tail call fastcc i8* @addr2dso(i64 noundef %3) #17
  %6 = tail call i32 @pthread_rwlock_unlock(%struct.pthread_rwlock_t* noundef nonnull @lock) #16
  %7 = icmp eq i8* %5, null
  br i1 %7, label %146, label %8

8:                                                ; preds = %2
  %9 = getelementptr inbounds i8, i8* %5, i64 64
  %10 = bitcast i8* %9 to %struct.Elf64_Sym**
  %11 = load %struct.Elf64_Sym*, %struct.Elf64_Sym** %10, align 8, !tbaa !4
  %12 = getelementptr inbounds i8, i8* %5, i64 96
  %13 = bitcast i8* %12 to i8**
  %14 = load i8*, i8** %13, align 8, !tbaa !4
  %15 = getelementptr inbounds i8, i8* %5, i64 72
  %16 = bitcast i8* %15 to i32**
  %17 = load i32*, i32** %16, align 8, !tbaa !4
  %18 = icmp eq i32* %17, null
  br i1 %18, label %23, label %19

19:                                               ; preds = %8
  %20 = getelementptr inbounds i32, i32* %17, i64 1
  %21 = load i32, i32* %20, align 4, !tbaa !13
  %22 = zext i32 %21 to i64
  br label %63

23:                                               ; preds = %8
  %24 = getelementptr inbounds i8, i8* %5, i64 80
  %25 = bitcast i8* %24 to i32**
  %26 = load i32*, i32** %25, align 8, !tbaa !4
  %27 = getelementptr inbounds i32, i32* %26, i64 4
  %28 = getelementptr inbounds i32, i32* %26, i64 2
  %29 = load i32, i32* %28, align 4, !tbaa !13
  %30 = zext i32 %29 to i64
  %31 = shl nuw nsw i64 %30, 1
  %32 = getelementptr inbounds i32, i32* %27, i64 %31
  %33 = load i32, i32* %26, align 4, !tbaa !13
  %34 = zext i32 %33 to i64
  %35 = icmp eq i32 %33, 0
  br i1 %35, label %118, label %36

36:                                               ; preds = %23, %36
  %37 = phi i64 [ %44, %36 ], [ 0, %23 ]
  %38 = phi i64 [ %43, %36 ], [ 0, %23 ]
  %39 = getelementptr inbounds i32, i32* %32, i64 %37
  %40 = load i32, i32* %39, align 4, !tbaa !13
  %41 = zext i32 %40 to i64
  %42 = icmp ult i64 %38, %41
  %43 = select i1 %42, i64 %41, i64 %38
  %44 = add nuw nsw i64 %37, 1
  %45 = icmp eq i64 %44, %34
  br i1 %45, label %46, label %36

46:                                               ; preds = %36
  %47 = icmp eq i64 %43, 0
  br i1 %47, label %118, label %48

48:                                               ; preds = %46
  %49 = getelementptr inbounds i32, i32* %32, i64 %34
  %50 = getelementptr inbounds i32, i32* %26, i64 1
  %51 = load i32, i32* %50, align 4, !tbaa !13
  %52 = zext i32 %51 to i64
  %53 = sub i64 %43, %52
  %54 = getelementptr inbounds i32, i32* %49, i64 %53
  br label %55

55:                                               ; preds = %55, %48
  %56 = phi i64 [ %43, %48 ], [ %58, %55 ]
  %57 = phi i32* [ %54, %48 ], [ %59, %55 ]
  %58 = add i64 %56, 1
  %59 = getelementptr inbounds i32, i32* %57, i64 1
  %60 = load i32, i32* %57, align 4, !tbaa !13
  %61 = and i32 %60, 1
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %55, label %63

63:                                               ; preds = %55, %19
  %64 = phi i64 [ %22, %19 ], [ %58, %55 ]
  %65 = trunc i64 %64 to i32
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %118, label %67

67:                                               ; preds = %63
  %68 = bitcast i8* %5 to i8**
  br label %69

69:                                               ; preds = %67, %101
  %70 = phi %struct.Elf64_Sym* [ %102, %101 ], [ undef, %67 ]
  %71 = phi i32 [ %105, %101 ], [ %65, %67 ]
  %72 = phi %struct.Elf64_Sym* [ %106, %101 ], [ %11, %67 ]
  %73 = phi i64 [ %103, %101 ], [ 0, %67 ]
  %74 = phi i64 [ %104, %101 ], [ -1, %67 ]
  %75 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %72, i64 0, i32 4
  %76 = load i64, i64* %75, align 8, !tbaa !21
  %77 = icmp eq i64 %76, 0
  br i1 %77, label %101, label %78

78:                                               ; preds = %69
  %79 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %72, i64 0, i32 1
  %80 = load i8, i8* %79, align 4, !tbaa !30
  %81 = zext i8 %80 to i32
  %82 = and i32 %81, 15
  %83 = shl nuw nsw i32 1, %82
  %84 = and i32 %83, 103
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %101, label %86

86:                                               ; preds = %78
  %87 = lshr i32 %81, 4
  %88 = shl nuw nsw i32 1, %87
  %89 = and i32 %88, 1030
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %101, label %91

91:                                               ; preds = %86
  %92 = load i8*, i8** %68, align 8, !tbaa !4
  %93 = getelementptr inbounds i8, i8* %92, i64 %76
  %94 = ptrtoint i8* %93 to i64
  %95 = icmp ule i8* %93, %0
  %96 = icmp ult i64 %73, %94
  %97 = select i1 %95, i1 %96, i1 false
  br i1 %97, label %98, label %101

98:                                               ; preds = %91
  %99 = sub i64 %3, %94
  %100 = icmp eq i8* %93, %0
  br i1 %100, label %110, label %101

101:                                              ; preds = %91, %98, %69, %78, %86
  %102 = phi %struct.Elf64_Sym* [ %72, %98 ], [ %70, %86 ], [ %70, %78 ], [ %70, %69 ], [ %70, %91 ]
  %103 = phi i64 [ %94, %98 ], [ %73, %86 ], [ %73, %78 ], [ %73, %69 ], [ %73, %91 ]
  %104 = phi i64 [ %99, %98 ], [ %74, %86 ], [ %74, %78 ], [ %74, %69 ], [ %74, %91 ]
  %105 = add i32 %71, -1
  %106 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %72, i64 1
  %107 = icmp eq i32 %105, 0
  br i1 %107, label %108, label %69

108:                                              ; preds = %101
  %109 = icmp eq i64 %103, 0
  br i1 %109, label %118, label %110

110:                                              ; preds = %98, %108
  %111 = phi i64 [ %104, %108 ], [ %99, %98 ]
  %112 = phi i64 [ %103, %108 ], [ %3, %98 ]
  %113 = phi %struct.Elf64_Sym* [ %102, %108 ], [ %72, %98 ]
  %114 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %113, i64 0, i32 5
  %115 = load i64, i64* %114, align 8, !tbaa !76
  %116 = add i64 %115, -1
  %117 = icmp ugt i64 %111, %116
  br i1 %117, label %118, label %128

118:                                              ; preds = %110, %23, %46, %63, %108
  %119 = getelementptr inbounds i8, i8* %5, i64 8
  %120 = bitcast i8* %119 to i8**
  %121 = load i8*, i8** %120, align 8, !tbaa !4
  %122 = getelementptr inbounds %struct.Dl_info, %struct.Dl_info* %1, i64 0, i32 0
  store i8* %121, i8** %122, align 8, !tbaa !77
  %123 = getelementptr inbounds i8, i8* %5, i64 136
  %124 = bitcast i8* %123 to i8**
  %125 = load i8*, i8** %124, align 8, !tbaa !4
  %126 = getelementptr inbounds %struct.Dl_info, %struct.Dl_info* %1, i64 0, i32 1
  store i8* %125, i8** %126, align 8, !tbaa !79
  %127 = getelementptr inbounds %struct.Dl_info, %struct.Dl_info* %1, i64 0, i32 2
  store i8* null, i8** %127, align 8, !tbaa !80
  br label %143

128:                                              ; preds = %110
  %129 = getelementptr inbounds i8, i8* %5, i64 8
  %130 = bitcast i8* %129 to i8**
  %131 = load i8*, i8** %130, align 8, !tbaa !4
  %132 = getelementptr inbounds %struct.Dl_info, %struct.Dl_info* %1, i64 0, i32 0
  store i8* %131, i8** %132, align 8, !tbaa !77
  %133 = getelementptr inbounds i8, i8* %5, i64 136
  %134 = bitcast i8* %133 to i8**
  %135 = load i8*, i8** %134, align 8, !tbaa !4
  %136 = getelementptr inbounds %struct.Dl_info, %struct.Dl_info* %1, i64 0, i32 1
  store i8* %135, i8** %136, align 8, !tbaa !79
  %137 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %113, i64 0, i32 0
  %138 = load i32, i32* %137, align 8, !tbaa !28
  %139 = zext i32 %138 to i64
  %140 = getelementptr inbounds i8, i8* %14, i64 %139
  %141 = getelementptr inbounds %struct.Dl_info, %struct.Dl_info* %1, i64 0, i32 2
  store i8* %140, i8** %141, align 8, !tbaa !80
  %142 = inttoptr i64 %112 to i8*
  br label %143

143:                                              ; preds = %118, %128
  %144 = phi i8* [ %142, %128 ], [ null, %118 ]
  %145 = getelementptr inbounds %struct.Dl_info, %struct.Dl_info* %1, i64 0, i32 3
  store i8* %144, i8** %145, align 8, !tbaa !81
  br label %146

146:                                              ; preds = %143, %2
  %147 = phi i32 [ 0, %2 ], [ 1, %143 ]
  ret i32 %147
}

; Function Attrs: optsize
declare i32 @pthread_rwlock_rdlock(%struct.pthread_rwlock_t* noundef) local_unnamed_addr #2

; Function Attrs: nofree norecurse nosync nounwind optsize readonly strictfp
define internal fastcc i8* @addr2dso(i64 noundef %0) unnamed_addr #7 {
  %2 = load %struct.dso*, %struct.dso** @head, align 8, !tbaa !4
  %3 = icmp eq %struct.dso* %2, null
  br i1 %3, label %52, label %4

4:                                                ; preds = %1, %48
  %5 = phi %struct.dso* [ %50, %48 ], [ %2, %1 ]
  %6 = getelementptr inbounds %struct.dso, %struct.dso* %5, i64 0, i32 6
  %7 = load i32, i32* %6, align 8, !tbaa !13
  %8 = getelementptr inbounds %struct.dso, %struct.dso* %5, i64 0, i32 7
  %9 = load i64, i64* %8, align 8, !tbaa !9
  %10 = icmp eq i32 %7, 0
  br i1 %10, label %40, label %11

11:                                               ; preds = %4
  %12 = sext i32 %7 to i64
  %13 = getelementptr inbounds %struct.dso, %struct.dso* %5, i64 0, i32 0
  %14 = load i8*, i8** %13, align 8, !tbaa !4
  %15 = ptrtoint i8* %14 to i64
  %16 = getelementptr inbounds %struct.dso, %struct.dso* %5, i64 0, i32 5
  %17 = load %struct.Elf64_Phdr*, %struct.Elf64_Phdr** %16, align 8, !tbaa !4
  br label %18

18:                                               ; preds = %11, %35
  %19 = phi i64 [ %12, %11 ], [ %21, %35 ]
  %20 = phi %struct.Elf64_Phdr* [ %17, %11 ], [ %38, %35 ]
  %21 = add i64 %19, -1
  %22 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %20, i64 0, i32 0
  %23 = load i32, i32* %22, align 8, !tbaa !23
  %24 = icmp eq i32 %23, 1
  br i1 %24, label %25, label %35

25:                                               ; preds = %18
  %26 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %20, i64 0, i32 3
  %27 = load i64, i64* %26, align 8, !tbaa !25
  %28 = add i64 %27, %15
  %29 = sub i64 %0, %28
  %30 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %20, i64 0, i32 6
  %31 = load i64, i64* %30, align 8, !tbaa !26
  %32 = icmp ult i64 %29, %31
  br i1 %32, label %33, label %35

33:                                               ; preds = %25
  %34 = bitcast %struct.dso* %5 to i8*
  br label %52

35:                                               ; preds = %25, %18
  %36 = bitcast %struct.Elf64_Phdr* %20 to i8*
  %37 = getelementptr inbounds i8, i8* %36, i64 %9
  %38 = bitcast i8* %37 to %struct.Elf64_Phdr*
  %39 = icmp eq i64 %21, 0
  br i1 %39, label %40, label %18

40:                                               ; preds = %35, %4
  %41 = getelementptr inbounds %struct.dso, %struct.dso* %5, i64 0, i32 17
  %42 = load i8*, i8** %41, align 8, !tbaa !4
  %43 = ptrtoint i8* %42 to i64
  %44 = sub i64 %0, %43
  %45 = getelementptr inbounds %struct.dso, %struct.dso* %5, i64 0, i32 18
  %46 = load i64, i64* %45, align 8, !tbaa !9
  %47 = icmp ult i64 %44, %46
  br i1 %47, label %52, label %48

48:                                               ; preds = %40
  %49 = getelementptr inbounds %struct.dso, %struct.dso* %5, i64 0, i32 3
  %50 = load %struct.dso*, %struct.dso** %49, align 8, !tbaa !4
  %51 = icmp eq %struct.dso* %50, null
  br i1 %51, label %52, label %4

52:                                               ; preds = %40, %48, %1, %33
  %53 = phi i8* [ %34, %33 ], [ null, %1 ], [ null, %48 ], [ null, %40 ]
  ret i8* %53
}

; Function Attrs: nounwind optsize strictfp
define hidden i8* @__dlsym(i8* noalias noundef %0, i8* noalias noundef %1, i8* noalias noundef %2) local_unnamed_addr #0 {
  %4 = alloca [2 x i64], align 8
  %5 = tail call i32 @pthread_rwlock_rdlock(%struct.pthread_rwlock_t* noundef nonnull @lock) #16
  %6 = bitcast i8* %0 to %struct.dso*
  %7 = bitcast [2 x i64]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %7)
  %8 = load %struct.dso*, %struct.dso** @head, align 8, !tbaa !4
  %9 = icmp eq %struct.dso* %8, %6
  %10 = icmp eq i8* %0, null
  %11 = or i1 %10, %9
  br i1 %11, label %32, label %12

12:                                               ; preds = %3
  %13 = icmp eq i8* %0, inttoptr (i64 -1 to i8*)
  br i1 %13, label %14, label %22

14:                                               ; preds = %12
  %15 = ptrtoint i8* %2 to i64
  %16 = tail call fastcc i8* @addr2dso(i64 noundef %15) #16
  %17 = bitcast i8* %16 to %struct.dso*
  %18 = icmp eq i8* %16, null
  %19 = select i1 %18, %struct.dso* %8, %struct.dso* %17
  %20 = getelementptr inbounds %struct.dso, %struct.dso* %19, i64 0, i32 3
  %21 = load %struct.dso*, %struct.dso** %20, align 8, !tbaa !4
  br label %32

22:                                               ; preds = %12
  %23 = icmp eq %struct.dso* %8, null
  br i1 %23, label %31, label %28

24:                                               ; preds = %28
  %25 = getelementptr inbounds %struct.dso, %struct.dso* %29, i64 0, i32 3
  %26 = load %struct.dso*, %struct.dso** %25, align 8, !tbaa !4
  %27 = icmp eq %struct.dso* %26, null
  br i1 %27, label %31, label %28

28:                                               ; preds = %22, %24
  %29 = phi %struct.dso* [ %26, %24 ], [ %8, %22 ]
  %30 = icmp eq %struct.dso* %29, %6
  br i1 %30, label %32, label %24

31:                                               ; preds = %24, %22
  tail call void (i8*, ...) @error(i8* noundef getelementptr inbounds ([26 x i8], [26 x i8]* @.str.24, i64 0, i64 0), i8* noundef %0) #16
  br label %280

32:                                               ; preds = %28, %14, %3
  %33 = phi i1 [ true, %3 ], [ true, %14 ], [ false, %28 ]
  %34 = phi %struct.dso* [ %8, %3 ], [ %21, %14 ], [ %6, %28 ]
  %35 = load i8, i8* %1, align 1, !tbaa !8
  %36 = icmp eq i8 %35, 0
  br i1 %36, label %47, label %37

37:                                               ; preds = %32, %37
  %38 = phi i8 [ %45, %37 ], [ %35, %32 ]
  %39 = phi i32 [ %43, %37 ], [ 5381, %32 ]
  %40 = phi i8* [ %44, %37 ], [ %1, %32 ]
  %41 = zext i8 %38 to i32
  %42 = mul i32 %39, 33
  %43 = add i32 %42, %41
  %44 = getelementptr inbounds i8, i8* %40, i64 1
  %45 = load i8, i8* %44, align 1, !tbaa !8
  %46 = icmp eq i8 %45, 0
  br i1 %46, label %47, label %37

47:                                               ; preds = %37, %32
  %48 = phi i32 [ 5381, %32 ], [ %43, %37 ]
  %49 = lshr i32 %48, 6
  %50 = and i32 %48, 63
  %51 = zext i32 %50 to i64
  %52 = shl nuw i64 1, %51
  br i1 %33, label %56, label %53

53:                                               ; preds = %47
  %54 = getelementptr inbounds %struct.dso, %struct.dso* %34, i64 0, i32 27
  %55 = load %struct.dso**, %struct.dso*** %54, align 8, !tbaa !4
  br label %58

56:                                               ; preds = %47
  %57 = icmp eq %struct.dso* %34, null
  br i1 %57, label %268, label %58

58:                                               ; preds = %56, %53
  %59 = phi %struct.dso** [ %55, %53 ], [ null, %56 ]
  %60 = xor i1 %33, true
  %61 = zext i1 %60 to i64
  br label %62

62:                                               ; preds = %261, %58
  %63 = phi %struct.dso** [ %59, %58 ], [ %264, %261 ]
  %64 = phi %struct.dso* [ %34, %58 ], [ %266, %261 ]
  %65 = phi i32 [ 0, %58 ], [ %262, %261 ]
  %66 = getelementptr inbounds %struct.dso, %struct.dso* %64, i64 0, i32 10
  %67 = load i32*, i32** %66, align 8, !tbaa !4
  %68 = icmp eq i32* %67, null
  br i1 %68, label %158, label %69

69:                                               ; preds = %62
  %70 = getelementptr inbounds i32, i32* %67, i64 4
  %71 = bitcast i32* %70 to i64*
  %72 = getelementptr inbounds i32, i32* %67, i64 2
  %73 = load i32, i32* %72, align 4, !tbaa !13
  %74 = add i32 %73, 67108863
  %75 = and i32 %74, %49
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds i64, i64* %71, i64 %76
  %78 = load i64, i64* %77, align 8, !tbaa !9
  %79 = and i64 %78, %52
  %80 = icmp eq i64 %79, 0
  br i1 %80, label %261, label %81

81:                                               ; preds = %69
  %82 = getelementptr inbounds i32, i32* %67, i64 3
  %83 = load i32, i32* %82, align 4, !tbaa !13
  %84 = lshr i32 %48, %83
  %85 = and i32 %84, 63
  %86 = zext i32 %85 to i64
  %87 = shl nuw i64 1, %86
  %88 = and i64 %87, %78
  %89 = icmp eq i64 %88, 0
  br i1 %89, label %261, label %90

90:                                               ; preds = %81
  %91 = load i32, i32* %67, align 4, !tbaa !13
  %92 = zext i32 %73 to i64
  %93 = shl nuw nsw i64 %92, 1
  %94 = getelementptr inbounds i32, i32* %70, i64 %93
  %95 = urem i32 %48, %91
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds i32, i32* %94, i64 %96
  %98 = load i32, i32* %97, align 4, !tbaa !13
  %99 = icmp eq i32 %98, 0
  br i1 %99, label %261, label %100

100:                                              ; preds = %90
  %101 = zext i32 %91 to i64
  %102 = getelementptr inbounds i32, i32* %94, i64 %101
  %103 = getelementptr inbounds i32, i32* %67, i64 1
  %104 = load i32, i32* %103, align 4, !tbaa !13
  %105 = sub i32 %98, %104
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32* %102, i64 %106
  %108 = getelementptr inbounds %struct.dso, %struct.dso* %64, i64 0, i32 11
  %109 = getelementptr inbounds %struct.dso, %struct.dso* %64, i64 0, i32 12
  %110 = getelementptr inbounds %struct.dso, %struct.dso* %64, i64 0, i32 8
  br label %111

111:                                              ; preds = %156, %100
  %112 = phi i32 [ %98, %100 ], [ %157, %156 ]
  %113 = phi i32* [ %107, %100 ], [ %114, %156 ]
  %114 = getelementptr inbounds i32, i32* %113, i64 1
  %115 = load i32, i32* %113, align 4, !tbaa !13
  %116 = xor i32 %115, %48
  %117 = icmp ult i32 %116, 2
  br i1 %117, label %118, label %153

118:                                              ; preds = %111
  %119 = load i16*, i16** %108, align 8, !tbaa !4
  %120 = icmp eq i16* %119, null
  %121 = zext i32 %112 to i64
  br i1 %120, label %126, label %122

122:                                              ; preds = %118
  %123 = getelementptr inbounds i16, i16* %119, i64 %121
  %124 = load i16, i16* %123, align 2, !tbaa !27
  %125 = icmp sgt i16 %124, -1
  br i1 %125, label %126, label %153

126:                                              ; preds = %122, %118
  %127 = load i8*, i8** %109, align 8, !tbaa !4
  %128 = load %struct.Elf64_Sym*, %struct.Elf64_Sym** %110, align 8, !tbaa !4
  %129 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %128, i64 %121, i32 0
  %130 = load i32, i32* %129, align 8, !tbaa !28
  %131 = zext i32 %130 to i64
  %132 = getelementptr inbounds i8, i8* %127, i64 %131
  %133 = load i8, i8* %132, align 1, !tbaa !8
  %134 = icmp ne i8 %35, %133
  %135 = or i1 %36, %134
  br i1 %135, label %146, label %136

136:                                              ; preds = %126, %136
  %137 = phi i8* [ %140, %136 ], [ %132, %126 ]
  %138 = phi i8* [ %139, %136 ], [ %1, %126 ]
  %139 = getelementptr inbounds i8, i8* %138, i64 1
  %140 = getelementptr inbounds i8, i8* %137, i64 1
  %141 = load i8, i8* %139, align 1, !tbaa !8
  %142 = load i8, i8* %140, align 1, !tbaa !8
  %143 = icmp ne i8 %141, %142
  %144 = icmp eq i8 %141, 0
  %145 = or i1 %144, %143
  br i1 %145, label %146, label %136

146:                                              ; preds = %136, %126
  %147 = phi i8 [ %35, %126 ], [ %141, %136 ]
  %148 = phi i8 [ %133, %126 ], [ %142, %136 ]
  %149 = icmp eq i8 %147, %148
  br i1 %149, label %150, label %153

150:                                              ; preds = %146
  %151 = zext i32 %112 to i64
  %152 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %128, i64 %151
  br label %232

153:                                              ; preds = %146, %122, %111
  %154 = and i32 %115, 1
  %155 = icmp eq i32 %154, 0
  br i1 %155, label %156, label %261

156:                                              ; preds = %153
  %157 = add i32 %112, 1
  br label %111

158:                                              ; preds = %62
  %159 = icmp ne i32 %65, 0
  %160 = select i1 %159, i1 true, i1 %36
  br i1 %160, label %176, label %161

161:                                              ; preds = %158, %161
  %162 = phi i8 [ %172, %161 ], [ %35, %158 ]
  %163 = phi i32 [ %171, %161 ], [ 0, %158 ]
  %164 = phi i8* [ %166, %161 ], [ %1, %158 ]
  %165 = shl i32 %163, 4
  %166 = getelementptr inbounds i8, i8* %164, i64 1
  %167 = zext i8 %162 to i32
  %168 = add i32 %165, %167
  %169 = lshr i32 %168, 24
  %170 = and i32 %169, 240
  %171 = xor i32 %170, %168
  %172 = load i8, i8* %166, align 1, !tbaa !8
  %173 = icmp eq i8 %172, 0
  br i1 %173, label %174, label %161

174:                                              ; preds = %161
  %175 = and i32 %171, 268435455
  br label %176

176:                                              ; preds = %174, %158
  %177 = phi i32 [ %65, %158 ], [ %175, %174 ]
  %178 = getelementptr inbounds %struct.dso, %struct.dso* %64, i64 0, i32 8
  %179 = load %struct.Elf64_Sym*, %struct.Elf64_Sym** %178, align 8, !tbaa !4
  %180 = getelementptr inbounds %struct.dso, %struct.dso* %64, i64 0, i32 9
  %181 = load i32*, i32** %180, align 8, !tbaa !4
  %182 = getelementptr inbounds %struct.dso, %struct.dso* %64, i64 0, i32 12
  %183 = load i8*, i8** %182, align 8, !tbaa !4
  %184 = load i32, i32* %181, align 4, !tbaa !13
  %185 = urem i32 %177, %184
  %186 = add i32 %185, 2
  %187 = zext i32 %186 to i64
  %188 = getelementptr inbounds i32, i32* %181, i64 %187
  %189 = load i32, i32* %188, align 4, !tbaa !13
  %190 = icmp eq i32 %189, 0
  br i1 %190, label %261, label %191

191:                                              ; preds = %176
  %192 = getelementptr inbounds %struct.dso, %struct.dso* %64, i64 0, i32 11
  %193 = load i16*, i16** %192, align 8, !tbaa !4
  %194 = icmp eq i16* %193, null
  %195 = add i32 %184, 2
  %196 = zext i32 %195 to i64
  br label %197

197:                                              ; preds = %227, %191
  %198 = phi i32 [ %189, %191 ], [ %230, %227 ]
  %199 = zext i32 %198 to i64
  br i1 %194, label %204, label %200

200:                                              ; preds = %197
  %201 = getelementptr inbounds i16, i16* %193, i64 %199
  %202 = load i16, i16* %201, align 2, !tbaa !27
  %203 = icmp sgt i16 %202, -1
  br i1 %203, label %204, label %227

204:                                              ; preds = %200, %197
  %205 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %179, i64 %199
  %206 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %205, i64 0, i32 0
  %207 = load i32, i32* %206, align 8, !tbaa !28
  %208 = zext i32 %207 to i64
  %209 = getelementptr inbounds i8, i8* %183, i64 %208
  %210 = load i8, i8* %209, align 1, !tbaa !8
  %211 = icmp ne i8 %35, %210
  %212 = or i1 %36, %211
  br i1 %212, label %223, label %213

213:                                              ; preds = %204, %213
  %214 = phi i8* [ %217, %213 ], [ %209, %204 ]
  %215 = phi i8* [ %216, %213 ], [ %1, %204 ]
  %216 = getelementptr inbounds i8, i8* %215, i64 1
  %217 = getelementptr inbounds i8, i8* %214, i64 1
  %218 = load i8, i8* %216, align 1, !tbaa !8
  %219 = load i8, i8* %217, align 1, !tbaa !8
  %220 = icmp ne i8 %218, %219
  %221 = icmp eq i8 %218, 0
  %222 = or i1 %221, %220
  br i1 %222, label %223, label %213

223:                                              ; preds = %213, %204
  %224 = phi i8 [ %35, %204 ], [ %218, %213 ]
  %225 = phi i8 [ %210, %204 ], [ %219, %213 ]
  %226 = icmp eq i8 %224, %225
  br i1 %226, label %232, label %227

227:                                              ; preds = %223, %200
  %228 = add nuw nsw i64 %199, %196
  %229 = getelementptr inbounds i32, i32* %181, i64 %228
  %230 = load i32, i32* %229, align 4, !tbaa !13
  %231 = icmp eq i32 %230, 0
  br i1 %231, label %261, label %197

232:                                              ; preds = %223, %150
  %233 = phi i32 [ %65, %150 ], [ %177, %223 ]
  %234 = phi %struct.Elf64_Sym* [ %152, %150 ], [ %205, %223 ]
  %235 = icmp eq %struct.Elf64_Sym* %234, null
  br i1 %235, label %261, label %236

236:                                              ; preds = %232
  %237 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %234, i64 0, i32 3
  %238 = load i16, i16* %237, align 2, !tbaa !29
  %239 = icmp eq i16 %238, 0
  %240 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %234, i64 0, i32 1
  %241 = load i8, i8* %240, align 4, !tbaa !30
  %242 = and i8 %241, 15
  %243 = icmp eq i8 %242, 6
  %244 = select i1 %239, i1 %243, i1 false
  br i1 %244, label %261, label %245

245:                                              ; preds = %236
  %246 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %234, i64 0, i32 4
  %247 = load i64, i64* %246, align 8, !tbaa !21
  %248 = icmp ne i64 %247, 0
  %249 = select i1 %248, i1 true, i1 %243
  br i1 %249, label %250, label %261

250:                                              ; preds = %245
  %251 = zext i8 %241 to i32
  %252 = and i32 %251, 15
  %253 = shl nuw nsw i32 1, %252
  %254 = and i32 %253, 103
  %255 = icmp eq i32 %254, 0
  br i1 %255, label %261, label %256

256:                                              ; preds = %250
  %257 = lshr i32 %251, 4
  %258 = shl nuw nsw i32 1, %257
  %259 = and i32 %258, 1030
  %260 = icmp eq i32 %259, 0
  br i1 %260, label %261, label %269

261:                                              ; preds = %153, %227, %256, %250, %245, %236, %232, %176, %90, %81, %69
  %262 = phi i32 [ %233, %256 ], [ %233, %232 ], [ %233, %250 ], [ %65, %69 ], [ %65, %81 ], [ %65, %90 ], [ %177, %176 ], [ %233, %245 ], [ %233, %236 ], [ %177, %227 ], [ %65, %153 ]
  %263 = getelementptr inbounds %struct.dso, %struct.dso* %64, i64 0, i32 13
  %264 = getelementptr %struct.dso*, %struct.dso** %63, i64 %61
  %265 = select i1 %33, %struct.dso** %263, %struct.dso** %63
  %266 = load %struct.dso*, %struct.dso** %265, align 8, !tbaa !4
  %267 = icmp eq %struct.dso* %266, null
  br i1 %267, label %268, label %62

268:                                              ; preds = %261, %56
  tail call void (i8*, ...) @error(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.48, i64 0, i64 0), i8* noundef nonnull %1) #16
  br label %280

269:                                              ; preds = %256
  br i1 %243, label %270, label %276

270:                                              ; preds = %269
  %271 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i64 0, i64 0
  %272 = getelementptr inbounds %struct.dso, %struct.dso* %64, i64 0, i32 35
  %273 = load i64, i64* %272, align 8, !tbaa !9
  store i64 %273, i64* %271, align 8, !tbaa !9
  %274 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i64 0, i64 1
  store i64 %247, i64* %274, align 8, !tbaa !9
  %275 = call i8* @__tls_get_addr(i64* noundef nonnull %271) #16
  br label %280

276:                                              ; preds = %269
  %277 = getelementptr inbounds %struct.dso, %struct.dso* %64, i64 0, i32 0
  %278 = load i8*, i8** %277, align 8, !tbaa !4
  %279 = getelementptr inbounds i8, i8* %278, i64 %247
  br label %280

280:                                              ; preds = %31, %268, %270, %276
  %281 = phi i8* [ null, %31 ], [ %275, %270 ], [ %279, %276 ], [ null, %268 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %7)
  %282 = call i32 @pthread_rwlock_unlock(%struct.pthread_rwlock_t* noundef nonnull @lock) #16
  ret i8* %281
}

; Function Attrs: nounwind optsize strictfp
define hidden i8* @__dlsym_redir_time64(i8* noalias noundef %0, i8* noalias noundef %1, i8* noalias noundef %2) local_unnamed_addr #0 {
  %4 = tail call i8* @__dlsym(i8* noundef %0, i8* noundef %1, i8* noundef %2) #17
  ret i8* %4
}

; Function Attrs: nounwind optsize strictfp
define i32 @dl_iterate_phdr(i32 (%struct.dl_phdr_info*, i64, i8*)* nocapture noundef readonly %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = alloca %struct.dl_phdr_info, align 8
  %4 = alloca [2 x i64], align 8
  %5 = bitcast %struct.dl_phdr_info* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %5) #14
  %6 = load %struct.dso*, %struct.dso** @head, align 8, !tbaa !4
  %7 = icmp eq %struct.dso* %6, null
  br i1 %7, label %47, label %8

8:                                                ; preds = %2
  %9 = getelementptr inbounds %struct.dl_phdr_info, %struct.dl_phdr_info* %3, i64 0, i32 0
  %10 = getelementptr inbounds %struct.dl_phdr_info, %struct.dl_phdr_info* %3, i64 0, i32 1
  %11 = getelementptr inbounds %struct.dl_phdr_info, %struct.dl_phdr_info* %3, i64 0, i32 2
  %12 = getelementptr inbounds %struct.dl_phdr_info, %struct.dl_phdr_info* %3, i64 0, i32 3
  %13 = getelementptr inbounds %struct.dl_phdr_info, %struct.dl_phdr_info* %3, i64 0, i32 4
  %14 = getelementptr inbounds %struct.dl_phdr_info, %struct.dl_phdr_info* %3, i64 0, i32 5
  %15 = getelementptr inbounds %struct.dl_phdr_info, %struct.dl_phdr_info* %3, i64 0, i32 6
  %16 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i64 0, i64 0
  %17 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i64 0, i64 1
  %18 = getelementptr inbounds %struct.dl_phdr_info, %struct.dl_phdr_info* %3, i64 0, i32 7
  br label %19

19:                                               ; preds = %8, %41
  %20 = phi %struct.dso* [ %6, %8 ], [ %44, %41 ]
  %21 = getelementptr inbounds %struct.dso, %struct.dso* %20, i64 0, i32 0
  %22 = load i8*, i8** %21, align 8, !tbaa !4
  %23 = ptrtoint i8* %22 to i64
  store i64 %23, i64* %9, align 8, !tbaa !82
  %24 = getelementptr inbounds %struct.dso, %struct.dso* %20, i64 0, i32 1
  %25 = load i8*, i8** %24, align 8, !tbaa !4
  store i8* %25, i8** %10, align 8, !tbaa !84
  %26 = getelementptr inbounds %struct.dso, %struct.dso* %20, i64 0, i32 5
  %27 = load %struct.Elf64_Phdr*, %struct.Elf64_Phdr** %26, align 8, !tbaa !4
  store %struct.Elf64_Phdr* %27, %struct.Elf64_Phdr** %11, align 8, !tbaa !85
  %28 = getelementptr inbounds %struct.dso, %struct.dso* %20, i64 0, i32 6
  %29 = load i32, i32* %28, align 8, !tbaa !13
  %30 = trunc i32 %29 to i16
  store i16 %30, i16* %12, align 8, !tbaa !86
  %31 = load i64, i64* @gencnt, align 8, !tbaa !67
  store i64 %31, i64* %13, align 8, !tbaa !87
  store i64 0, i64* %14, align 8, !tbaa !88
  %32 = getelementptr inbounds %struct.dso, %struct.dso* %20, i64 0, i32 35
  %33 = load i64, i64* %32, align 8, !tbaa !9
  store i64 %33, i64* %15, align 8, !tbaa !89
  %34 = icmp eq i64 %33, 0
  br i1 %34, label %37, label %35

35:                                               ; preds = %19
  store i64 %33, i64* %16, align 8, !tbaa !9
  store i64 0, i64* %17, align 8, !tbaa !9
  %36 = call i8* @__tls_get_addr(i64* noundef nonnull %16) #16
  br label %37

37:                                               ; preds = %19, %35
  %38 = phi i8* [ %36, %35 ], [ null, %19 ]
  store i8* %38, i8** %18, align 8, !tbaa !90
  %39 = call i32 %0(%struct.dl_phdr_info* noundef nonnull %3, i64 noundef 64, i8* noundef %1) #16
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %47

41:                                               ; preds = %37
  %42 = call i32 @pthread_rwlock_rdlock(%struct.pthread_rwlock_t* noundef nonnull @lock) #16
  %43 = getelementptr inbounds %struct.dso, %struct.dso* %20, i64 0, i32 3
  %44 = load %struct.dso*, %struct.dso** %43, align 8, !tbaa !4
  %45 = call i32 @pthread_rwlock_unlock(%struct.pthread_rwlock_t* noundef nonnull @lock) #16
  %46 = icmp eq %struct.dso* %44, null
  br i1 %46, label %47, label %19

47:                                               ; preds = %41, %37, %2
  %48 = phi i32 [ 0, %2 ], [ %39, %37 ], [ 0, %41 ]
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %5) #14
  ret i32 %48
}

; Function Attrs: optsize
declare i8* @__tls_get_addr(i64* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @pthread_cond_broadcast(%struct.pthread_cond_t* noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @do_relocs(%struct.dso* noundef %0, i64* nocapture noundef readonly %1, i64 noundef %2, i64 noundef %3) unnamed_addr #0 {
  %5 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 0
  %6 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 8
  %7 = load %struct.Elf64_Sym*, %struct.Elf64_Sym** %6, align 8, !tbaa !4
  %8 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 12
  %9 = load i8*, i8** %8, align 8, !tbaa !4
  %10 = icmp eq %struct.dso* %0, @ldso
  %11 = load i64*, i64** @apply_addends_to, align 8
  %12 = icmp ne i64* %11, %1
  %13 = xor i1 %10, true
  %14 = select i1 %13, i1 true, i1 %12
  %15 = icmp eq i64 %2, 0
  br i1 %15, label %242, label %16

16:                                               ; preds = %4
  %17 = load i8*, i8** %5, align 8, !tbaa !4
  %18 = icmp ugt i64 %3, 2
  %19 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 15
  %20 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 1
  %21 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 16
  %22 = ptrtoint i8* %17 to i64
  %23 = icmp ult i64 %3, 3
  %24 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 40
  %25 = bitcast %struct.td_index** %24 to i8**
  %26 = mul i64 %3, -8
  br label %27

27:                                               ; preds = %16, %236
  %28 = phi i64* [ %1, %16 ], [ %239, %236 ]
  %29 = phi i64 [ %2, %16 ], [ %240, %236 ]
  %30 = phi i8* [ undef, %16 ], [ %238, %236 ]
  %31 = phi i32 [ 0, %16 ], [ %237, %236 ]
  %32 = getelementptr inbounds i64, i64* %28, i64 1
  %33 = load i64, i64* %32, align 8, !tbaa !9
  %34 = and i64 %33, 2147483647
  %35 = icmp eq i64 %34, 8
  %36 = select i1 %10, i1 %35, i1 false
  br i1 %36, label %236, label %37

37:                                               ; preds = %27
  %38 = getelementptr inbounds i64, i64* %28, i64 1
  %39 = trunc i64 %33 to i32
  %40 = and i32 %39, 2147483647
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %236, label %42

42:                                               ; preds = %37
  %43 = load i8*, i8** %5, align 8, !tbaa !4
  %44 = load i64, i64* %28, align 8, !tbaa !9
  %45 = getelementptr inbounds i8, i8* %43, i64 %44
  %46 = bitcast i8* %45 to i64*
  br i1 %18, label %47, label %50

47:                                               ; preds = %42
  %48 = getelementptr inbounds i64, i64* %28, i64 2
  %49 = load i64, i64* %48, align 8, !tbaa !9
  br label %76

50:                                               ; preds = %42
  %51 = and i32 %39, 2147483646
  %52 = icmp eq i32 %51, 6
  %53 = icmp eq i32 %40, 5
  %54 = or i1 %52, %53
  br i1 %54, label %76, label %55

55:                                               ; preds = %50
  br i1 %14, label %74, label %56

56:                                               ; preds = %55
  %57 = load %struct.dso*, %struct.dso** @head, align 8, !tbaa !4
  %58 = icmp eq %struct.dso* %57, @ldso
  br i1 %58, label %64, label %59

59:                                               ; preds = %56
  %60 = load i64*, i64** @saved_addends, align 8, !tbaa !4
  %61 = sext i32 %31 to i64
  %62 = getelementptr inbounds i64, i64* %60, i64 %61
  %63 = load i64, i64* %62, align 8, !tbaa !9
  br label %70

64:                                               ; preds = %56
  %65 = load i64, i64* %46, align 8, !tbaa !9
  %66 = load i64*, i64** @saved_addends, align 8, !tbaa !4
  %67 = sext i32 %31 to i64
  %68 = getelementptr inbounds i64, i64* %66, i64 %67
  store i64 %65, i64* %68, align 8, !tbaa !9
  %69 = load i64, i64* %38, align 8, !tbaa !9
  br label %70

70:                                               ; preds = %59, %64
  %71 = phi i64 [ %33, %59 ], [ %69, %64 ]
  %72 = phi i64 [ %63, %59 ], [ %65, %64 ]
  %73 = add nsw i32 %31, 1
  br label %76

74:                                               ; preds = %55
  %75 = load i64, i64* %46, align 8, !tbaa !9
  br label %76

76:                                               ; preds = %50, %74, %70, %47
  %77 = phi i64 [ %33, %47 ], [ %71, %70 ], [ %33, %74 ], [ %33, %50 ]
  %78 = phi i64 [ %49, %47 ], [ %72, %70 ], [ %75, %74 ], [ 0, %50 ]
  %79 = phi i32 [ %31, %47 ], [ %73, %70 ], [ %31, %74 ], [ %31, %50 ]
  %80 = icmp ult i64 %77, 4294967296
  br i1 %80, label %149, label %81

81:                                               ; preds = %76
  %82 = ashr i64 %77, 32
  %83 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %7, i64 %82
  %84 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %83, i64 0, i32 0
  %85 = load i32, i32* %84, align 8, !tbaa !28
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds i8, i8* %9, i64 %86
  %88 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %7, i64 %82, i32 1
  %89 = load i8, i8* %88, align 4, !tbaa !30
  %90 = icmp ult i8 %89, 16
  br i1 %90, label %141, label %91

91:                                               ; preds = %81
  %92 = icmp eq i32 %40, 5
  %93 = load %struct.dso*, %struct.dso** @head, align 8
  %94 = getelementptr inbounds %struct.dso, %struct.dso* %93, i64 0, i32 13
  %95 = select i1 %92, %struct.dso** %94, %struct.dso** @head
  %96 = load %struct.dso*, %struct.dso** %95, align 8, !tbaa !4
  %97 = icmp eq i32 %40, 7
  %98 = zext i1 %97 to i32
  %99 = tail call fastcc { %struct.Elf64_Sym*, %struct.dso* } @find_sym(%struct.dso* noundef %96, i8* noundef %87, i32 noundef %98) #17
  %100 = extractvalue { %struct.Elf64_Sym*, %struct.dso* } %99, 0
  %101 = extractvalue { %struct.Elf64_Sym*, %struct.dso* } %99, 1
  %102 = icmp eq %struct.Elf64_Sym* %100, null
  br i1 %102, label %106, label %103

103:                                              ; preds = %91
  %104 = getelementptr inbounds %struct.dso, %struct.dso* %101, i64 0, i32 0
  %105 = load i8*, i8** %104, align 8, !tbaa !4
  br label %141

106:                                              ; preds = %91
  %107 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %7, i64 %82, i32 3
  %108 = load i16, i16* %107, align 2, !tbaa !29
  %109 = icmp eq i16 %108, 0
  %110 = and i8 %89, -16
  %111 = icmp eq i8 %110, 32
  %112 = select i1 %109, i1 %111, i1 false
  br i1 %112, label %149, label %113

113:                                              ; preds = %106
  %114 = load i64*, i64** %19, align 8, !tbaa !4
  %115 = icmp ne i64* %114, null
  %116 = and i32 %39, 2147483646
  %117 = icmp eq i32 %116, 6
  %118 = select i1 %115, i1 %117, i1 false
  br i1 %118, label %119, label %135

119:                                              ; preds = %113
  %120 = load i64, i64* %28, align 8, !tbaa !9
  %121 = load i64, i64* %21, align 8, !tbaa !9
  %122 = mul i64 %121, 3
  %123 = getelementptr inbounds i64, i64* %114, i64 %122
  store i64 %120, i64* %123, align 8, !tbaa !9
  %124 = load i64, i64* %38, align 8, !tbaa !9
  %125 = load i64, i64* %21, align 8, !tbaa !9
  %126 = mul i64 %125, 3
  %127 = add i64 %126, 1
  %128 = getelementptr inbounds i64, i64* %114, i64 %127
  store i64 %124, i64* %128, align 8, !tbaa !9
  %129 = load i64, i64* %21, align 8, !tbaa !9
  %130 = mul i64 %129, 3
  %131 = add i64 %130, 2
  %132 = getelementptr inbounds i64, i64* %114, i64 %131
  store i64 %78, i64* %132, align 8, !tbaa !9
  %133 = load i64, i64* %21, align 8, !tbaa !9
  %134 = add i64 %133, 1
  store i64 %134, i64* %21, align 8, !tbaa !9
  br label %236

135:                                              ; preds = %113
  %136 = load i8*, i8** %20, align 8, !tbaa !4
  tail call void (i8*, ...) @error(i8* noundef getelementptr inbounds ([42 x i8], [42 x i8]* @.str.26, i64 0, i64 0), i8* noundef %136, i8* noundef %87) #17
  %137 = load i1, i1* @runtime, align 4
  br i1 %137, label %138, label %236

138:                                              ; preds = %135
  %139 = load [1 x %struct.__jmp_buf_tag]*, [1 x %struct.__jmp_buf_tag]** @rtld_fail, align 8, !tbaa !4
  %140 = getelementptr inbounds [1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* %139, i64 0, i64 0
  tail call void @longjmp(%struct.__jmp_buf_tag* noundef %140, i32 noundef 1) #20
  unreachable

141:                                              ; preds = %103, %81
  %142 = phi i8* [ %105, %103 ], [ %43, %81 ]
  %143 = phi %struct.Elf64_Sym* [ %100, %103 ], [ %83, %81 ]
  %144 = phi %struct.dso* [ %101, %103 ], [ %0, %81 ]
  %145 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %143, i64 0, i32 4
  %146 = load i64, i64* %145, align 8, !tbaa !21
  %147 = getelementptr inbounds i8, i8* %142, i64 %146
  %148 = ptrtoint i8* %147 to i64
  br label %149

149:                                              ; preds = %106, %76, %141
  %150 = phi i64 [ %148, %141 ], [ 0, %76 ], [ 0, %106 ]
  %151 = phi %struct.dso* [ %144, %141 ], [ %0, %76 ], [ %101, %106 ]
  %152 = phi i8* [ %87, %141 ], [ %30, %76 ], [ %87, %106 ]
  %153 = phi %struct.Elf64_Sym* [ %83, %141 ], [ null, %76 ], [ %83, %106 ]
  %154 = phi i64 [ %146, %141 ], [ 0, %76 ], [ 0, %106 ]
  switch i32 %40, label %230 [
    i32 18, label %155
    i32 36, label %191
    i32 1, label %166
    i32 6, label %166
    i32 7, label %166
    i32 16, label %181
    i32 8, label %168
    i32 17, label %184
    i32 5, label %170
    i32 2, label %175
  ]

155:                                              ; preds = %149
  %156 = getelementptr inbounds %struct.dso, %struct.dso* %151, i64 0, i32 35
  %157 = load i64, i64* %156, align 8, !tbaa !9
  %158 = load i64, i64* @static_tls_cnt, align 8, !tbaa !9
  %159 = icmp ugt i64 %157, %158
  br i1 %159, label %160, label %186

160:                                              ; preds = %155
  %161 = load i8*, i8** %20, align 8, !tbaa !4
  %162 = getelementptr inbounds %struct.dso, %struct.dso* %151, i64 0, i32 1
  %163 = load i8*, i8** %162, align 8, !tbaa !4
  tail call void (i8*, ...) @error(i8* noundef getelementptr inbounds ([79 x i8], [79 x i8]* @.str.27, i64 0, i64 0), i8* noundef %161, i8* noundef %152, i8* noundef %163) #17
  %164 = load [1 x %struct.__jmp_buf_tag]*, [1 x %struct.__jmp_buf_tag]** @rtld_fail, align 8, !tbaa !4
  %165 = getelementptr inbounds [1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* %164, i64 0, i64 0
  tail call void @longjmp(%struct.__jmp_buf_tag* noundef %165, i32 noundef 1) #20
  unreachable

166:                                              ; preds = %149, %149, %149
  %167 = add i64 %150, %78
  store i64 %167, i64* %46, align 8, !tbaa !9
  br label %236

168:                                              ; preds = %149
  %169 = add i64 %78, %22
  store i64 %169, i64* %46, align 8, !tbaa !9
  br label %236

170:                                              ; preds = %149
  %171 = inttoptr i64 %150 to i8*
  %172 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %153, i64 0, i32 5
  %173 = load i64, i64* %172, align 8, !tbaa !76
  %174 = tail call i8* @memcpy(i8* noundef %45, i8* noundef %171, i64 noundef %173) #16
  br label %236

175:                                              ; preds = %149
  %176 = add i64 %150, %78
  %177 = ptrtoint i8* %45 to i64
  %178 = sub i64 %176, %177
  %179 = trunc i64 %178 to i32
  %180 = bitcast i8* %45 to i32*
  store i32 %179, i32* %180, align 4, !tbaa !13
  br label %236

181:                                              ; preds = %149
  %182 = getelementptr inbounds %struct.dso, %struct.dso* %151, i64 0, i32 35
  %183 = load i64, i64* %182, align 8, !tbaa !9
  store i64 %183, i64* %46, align 8, !tbaa !9
  br label %236

184:                                              ; preds = %149
  %185 = add i64 %154, %78
  store i64 %185, i64* %46, align 8, !tbaa !9
  br label %236

186:                                              ; preds = %155
  %187 = getelementptr inbounds %struct.dso, %struct.dso* %151, i64 0, i32 34, i32 5
  %188 = load i64, i64* %187, align 8, !tbaa !48
  %189 = add i64 %154, %78
  %190 = sub i64 %189, %188
  store i64 %190, i64* %46, align 8, !tbaa !9
  br label %236

191:                                              ; preds = %149
  br i1 %23, label %192, label %196

192:                                              ; preds = %191
  %193 = getelementptr inbounds i8, i8* %45, i64 8
  %194 = bitcast i8* %193 to i64*
  %195 = load i64, i64* %194, align 8, !tbaa !9
  br label %196

196:                                              ; preds = %192, %191
  %197 = phi i64 [ %195, %192 ], [ %78, %191 ]
  %198 = getelementptr inbounds %struct.dso, %struct.dso* %151, i64 0, i32 35
  %199 = load i64, i64* %198, align 8, !tbaa !9
  %200 = load i64, i64* @static_tls_cnt, align 8, !tbaa !9
  %201 = icmp ugt i64 %199, %200
  br i1 %201, label %202, label %223

202:                                              ; preds = %196
  %203 = tail call i8* @__libc_malloc(i64 noundef 24) #16
  %204 = icmp eq i8* %203, null
  br i1 %204, label %205, label %211

205:                                              ; preds = %202
  %206 = load i8*, i8** %20, align 8, !tbaa !4
  %207 = icmp eq %struct.Elf64_Sym* %153, null
  %208 = select i1 %207, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.29, i64 0, i64 0), i8* %152
  tail call void (i8*, ...) @error(i8* noundef getelementptr inbounds ([52 x i8], [52 x i8]* @.str.28, i64 0, i64 0), i8* noundef %206, i8* noundef %208) #17
  %209 = load [1 x %struct.__jmp_buf_tag]*, [1 x %struct.__jmp_buf_tag]** @rtld_fail, align 8, !tbaa !4
  %210 = getelementptr inbounds [1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* %209, i64 0, i64 0
  tail call void @longjmp(%struct.__jmp_buf_tag* noundef %210, i32 noundef 1) #20
  unreachable

211:                                              ; preds = %202
  %212 = load %struct.td_index*, %struct.td_index** %24, align 8, !tbaa !4
  %213 = getelementptr inbounds i8, i8* %203, i64 16
  %214 = bitcast i8* %213 to %struct.td_index**
  store %struct.td_index* %212, %struct.td_index** %214, align 8, !tbaa !62
  store i8* %203, i8** %25, align 8, !tbaa !4
  %215 = load i64, i64* %198, align 8, !tbaa !9
  %216 = bitcast i8* %203 to i64*
  store i64 %215, i64* %216, align 8, !tbaa !9
  %217 = add i64 %197, %154
  %218 = getelementptr inbounds i8, i8* %203, i64 8
  %219 = bitcast i8* %218 to i64*
  store i64 %217, i64* %219, align 8, !tbaa !9
  store i64 ptrtoint (i64 (...)* @__tlsdesc_dynamic to i64), i64* %46, align 8, !tbaa !9
  %220 = ptrtoint i8* %203 to i64
  %221 = getelementptr inbounds i8, i8* %45, i64 8
  %222 = bitcast i8* %221 to i64*
  store i64 %220, i64* %222, align 8, !tbaa !9
  br label %236

223:                                              ; preds = %196
  store i64 ptrtoint (i64 (...)* @__tlsdesc_static to i64), i64* %46, align 8, !tbaa !9
  %224 = getelementptr inbounds %struct.dso, %struct.dso* %151, i64 0, i32 34, i32 5
  %225 = load i64, i64* %224, align 8, !tbaa !48
  %226 = add i64 %197, %154
  %227 = sub i64 %226, %225
  %228 = getelementptr inbounds i8, i8* %45, i64 8
  %229 = bitcast i8* %228 to i64*
  store i64 %227, i64* %229, align 8, !tbaa !9
  br label %236

230:                                              ; preds = %149
  %231 = load i8*, i8** %20, align 8, !tbaa !4
  tail call void (i8*, ...) @error(i8* noundef getelementptr inbounds ([52 x i8], [52 x i8]* @.str.30, i64 0, i64 0), i8* noundef %231, i32 noundef %40) #17
  %232 = load i1, i1* @runtime, align 4
  br i1 %232, label %233, label %236

233:                                              ; preds = %230
  %234 = load [1 x %struct.__jmp_buf_tag]*, [1 x %struct.__jmp_buf_tag]** @rtld_fail, align 8, !tbaa !4
  %235 = getelementptr inbounds [1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* %234, i64 0, i64 0
  tail call void @longjmp(%struct.__jmp_buf_tag* noundef %235, i32 noundef 1) #20
  unreachable

236:                                              ; preds = %27, %166, %168, %170, %175, %181, %184, %186, %223, %211, %230, %135, %37, %119
  %237 = phi i32 [ %31, %37 ], [ %79, %230 ], [ %79, %211 ], [ %79, %223 ], [ %79, %186 ], [ %79, %184 ], [ %79, %181 ], [ %79, %175 ], [ %79, %170 ], [ %79, %168 ], [ %79, %166 ], [ %79, %119 ], [ %79, %135 ], [ %31, %27 ]
  %238 = phi i8* [ %30, %37 ], [ %152, %230 ], [ %152, %211 ], [ %152, %223 ], [ %152, %186 ], [ %152, %184 ], [ %152, %181 ], [ %152, %175 ], [ %152, %170 ], [ %152, %168 ], [ %152, %166 ], [ %87, %119 ], [ %87, %135 ], [ %30, %27 ]
  %239 = getelementptr inbounds i64, i64* %28, i64 %3
  %240 = add i64 %29, %26
  %241 = icmp eq i64 %240, 0
  br i1 %241, label %242, label %27

242:                                              ; preds = %236, %4
  ret void
}

; Function Attrs: optsize
declare i32 @mprotect(i8* noundef, i64 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: noreturn optsize
declare void @longjmp(%struct.__jmp_buf_tag* noundef, i32 noundef) local_unnamed_addr #9

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i8* @__libc_malloc(i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i64 @__tlsdesc_dynamic(...) #2

; Function Attrs: optsize
declare hidden i64 @__tlsdesc_static(...) #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #12

; Function Attrs: optsize
declare i64 @read(i32 noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @pread(i32 noundef, i8* noundef, i64 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @mmap(i8* noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @reclaim(%struct.dso* nocapture noundef readonly %0, i64 noundef %1, i64 noundef %2) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 36
  %5 = load i64, i64* %4, align 8, !tbaa !9
  %6 = icmp ugt i64 %5, %1
  br i1 %6, label %12, label %7

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 37
  %9 = load i64, i64* %8, align 8, !tbaa !9
  %10 = icmp ugt i64 %9, %1
  %11 = select i1 %10, i64 %9, i64 %1
  br label %12

12:                                               ; preds = %7, %3
  %13 = phi i64 [ %1, %3 ], [ %11, %7 ]
  %14 = icmp ugt i64 %5, %2
  br i1 %14, label %20, label %15

15:                                               ; preds = %12
  %16 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 37
  %17 = load i64, i64* %16, align 8, !tbaa !9
  %18 = icmp ugt i64 %17, %2
  %19 = select i1 %18, i64 %5, i64 %2
  br label %20

20:                                               ; preds = %15, %12
  %21 = phi i64 [ %2, %12 ], [ %19, %15 ]
  %22 = icmp ugt i64 %21, %13
  br i1 %22, label %23, label %28

23:                                               ; preds = %20
  %24 = getelementptr inbounds %struct.dso, %struct.dso* %0, i64 0, i32 0
  %25 = load i8*, i8** %24, align 8, !tbaa !4
  %26 = getelementptr inbounds i8, i8* %25, i64 %13
  %27 = getelementptr inbounds i8, i8* %25, i64 %21
  tail call void @__malloc_donate(i8* noundef %26, i8* noundef nonnull %27) #16
  br label %28

28:                                               ; preds = %20, %23
  ret void
}

; Function Attrs: optsize
declare hidden void @__malloc_donate(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @munmap(i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @strchr(i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @path_open(i8* noundef %0, i8* noundef %1, i8* noundef %2) unnamed_addr #0 {
  %4 = tail call i64 @strspn(i8* noundef %1, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.40, i64 0, i64 0)) #16
  %5 = getelementptr inbounds i8, i8* %1, i64 %4
  %6 = tail call i64 @strcspn(i8* noundef %5, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.40, i64 0, i64 0)) #16
  %7 = add i64 %6, -2147483648
  %8 = icmp ult i64 %7, -2147483647
  br i1 %8, label %28, label %9

9:                                                ; preds = %3, %21
  %10 = phi i64 [ %25, %21 ], [ %6, %3 ]
  %11 = phi i8* [ %24, %21 ], [ %5, %3 ]
  %12 = trunc i64 %10 to i32
  %13 = tail call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef %2, i64 noundef 512, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.41, i64 0, i64 0), i32 noundef %12, i8* noundef %11, i8* noundef %0) #16
  %14 = icmp ult i32 %13, 512
  br i1 %14, label %15, label %21

15:                                               ; preds = %9
  %16 = tail call i32 (i8*, i32, ...) @open(i8* noundef %2, i32 noundef 524288) #16
  %17 = icmp sgt i32 %16, -1
  br i1 %17, label %28, label %18

18:                                               ; preds = %15
  %19 = tail call i32* @___errno_location() #19
  %20 = load i32, i32* %19, align 4, !tbaa !13
  switch i32 %20, label %28 [
    i32 2, label %21
    i32 20, label %21
    i32 13, label %21
    i32 36, label %21
  ]

21:                                               ; preds = %18, %18, %18, %18, %9
  %22 = getelementptr inbounds i8, i8* %11, i64 %10
  %23 = tail call i64 @strspn(i8* noundef %22, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.40, i64 0, i64 0)) #16
  %24 = getelementptr inbounds i8, i8* %22, i64 %23
  %25 = tail call i64 @strcspn(i8* noundef %24, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.40, i64 0, i64 0)) #16
  %26 = add i64 %25, -2147483648
  %27 = icmp ult i64 %26, -2147483647
  br i1 %27, label %28, label %9

28:                                               ; preds = %21, %15, %18, %3
  %29 = phi i32 [ -1, %3 ], [ -2, %18 ], [ %16, %15 ], [ -1, %21 ]
  ret i32 %29
}

; Function Attrs: optsize
declare i32 @snprintf(i8* noundef, i64 noundef, i8* noundef, ...) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @fstat(i32 noundef, %struct.stat* noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc i64 @read_loop(i32 noundef %0, i8* noundef %1, i64 noundef %2) unnamed_addr #0 {
  %4 = icmp eq i64 %2, 0
  br i1 %4, label %22, label %5

5:                                                ; preds = %3, %19
  %6 = phi i64 [ %20, %19 ], [ 0, %3 ]
  %7 = getelementptr inbounds i8, i8* %1, i64 %6
  %8 = sub i64 %2, %6
  %9 = tail call i64 @read(i32 noundef %0, i8* noundef %7, i64 noundef %8) #16
  %10 = icmp slt i64 %9, 0
  br i1 %10, label %11, label %15

11:                                               ; preds = %5
  %12 = tail call i32* @___errno_location() #19
  %13 = load i32, i32* %12, align 4, !tbaa !13
  %14 = icmp eq i32 %13, 4
  br i1 %14, label %19, label %22

15:                                               ; preds = %5
  %16 = icmp eq i64 %9, 0
  br i1 %16, label %22, label %17

17:                                               ; preds = %15
  %18 = add i64 %9, %6
  br label %19

19:                                               ; preds = %11, %17
  %20 = phi i64 [ %18, %17 ], [ %6, %11 ]
  %21 = icmp ult i64 %20, %2
  br i1 %21, label %5, label %22

22:                                               ; preds = %19, %11, %15, %3
  %23 = phi i64 [ 0, %3 ], [ %6, %15 ], [ -1, %11 ], [ %2, %19 ]
  ret i64 %23
}

; Function Attrs: optsize
declare i8* @strrchr(i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @strcpy(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @strspn(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @strcspn(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @readlink(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i8* @__libc_realloc(i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__block_app_sigs(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__tl_lock() local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__membarrier(i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__tl_unlock() local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__restore_sigs(i8* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #6

; Function Attrs: optsize
declare i32 @vdprintf(i32 noundef, i8* noundef, %struct.__va_list_tag* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #6

; Function Attrs: optsize
declare hidden void @__dl_vseterr(i8* noundef, %struct.__va_list_tag* noundef) local_unnamed_addr #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i3 @llvm.bitreverse.i3(i3) #13

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree norecurse nosync nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nosync nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree nosync nounwind willreturn }
attributes #7 = { nofree norecurse nosync nounwind optsize readonly strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { noreturn nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { noreturn optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { optsize returns_twice "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #13 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #14 = { nounwind strictfp }
attributes #15 = { nounwind readnone strictfp }
attributes #16 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #17 = { nobuiltin optsize strictfp "no-builtins" }
attributes #18 = { strictfp }
attributes #19 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #20 = { nobuiltin noreturn nounwind optsize strictfp "no-builtins" }
attributes #21 = { nobuiltin nounwind optsize returns_twice strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 542636}
!4 = !{!5, !5, i64 0}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!6, !6, i64 0}
!9 = !{!10, !10, i64 0}
!10 = !{!"long", !6, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.isvectorized", i32 1}
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !6, i64 0}
!15 = !{!16, !17, i64 56}
!16 = !{!"", !6, i64 0, !17, i64 16, !17, i64 18, !14, i64 20, !10, i64 24, !10, i64 32, !10, i64 40, !14, i64 48, !17, i64 52, !17, i64 54, !17, i64 56, !17, i64 58, !17, i64 60, !17, i64 62}
!17 = !{!"short", !6, i64 0}
!18 = !{!16, !10, i64 32}
!19 = !{!16, !17, i64 54}
!20 = !{i64 541688}
!21 = !{!22, !10, i64 8}
!22 = !{!"", !14, i64 0, !6, i64 4, !6, i64 5, !17, i64 6, !10, i64 8, !10, i64 16}
!23 = !{!24, !14, i64 0}
!24 = !{!"", !14, i64 0, !14, i64 4, !10, i64 8, !10, i64 16, !10, i64 24, !10, i64 32, !10, i64 40, !10, i64 48}
!25 = !{!24, !10, i64 16}
!26 = !{!24, !10, i64 40}
!27 = !{!17, !17, i64 0}
!28 = !{!22, !14, i64 0}
!29 = !{!22, !17, i64 6}
!30 = !{!22, !6, i64 4}
!31 = !{!32, !5, i64 8}
!32 = !{!"__libc", !6, i64 0, !6, i64 1, !6, i64 2, !6, i64 3, !14, i64 4, !5, i64 8, !5, i64 16, !10, i64 24, !10, i64 32, !10, i64 40, !10, i64 48, !33, i64 56}
!33 = !{!"__locale_struct", !6, i64 0}
!34 = !{!32, !10, i64 24}
!35 = !{!32, !10, i64 32}
!36 = !{!37, !10, i64 32}
!37 = !{!"__pthread", !5, i64 0, !5, i64 8, !5, i64 16, !5, i64 24, !10, i64 32, !10, i64 40, !14, i64 48, !14, i64 52, !14, i64 56, !14, i64 60, !6, i64 64, !6, i64 65, !6, i64 66, !6, i64 66, !5, i64 72, !10, i64 80, !5, i64 88, !10, i64 96, !10, i64 104, !5, i64 112, !5, i64 120, !5, i64 128, !38, i64 136, !14, i64 160, !14, i64 164, !5, i64 168, !6, i64 176, !5, i64 184, !5, i64 192}
!38 = !{!"", !5, i64 0, !10, i64 8, !5, i64 16}
!39 = !{!32, !10, i64 48}
!40 = !{!32, !6, i64 2}
!41 = !{!24, !10, i64 48}
!42 = !{!43, !10, i64 32}
!43 = !{!"tls_module", !5, i64 0, !5, i64 8, !10, i64 16, !10, i64 24, !10, i64 32, !10, i64 40}
!44 = !{!43, !10, i64 24}
!45 = !{!43, !5, i64 8}
!46 = !{!16, !10, i64 24}
!47 = !{!32, !5, i64 16}
!48 = !{!43, !10, i64 40}
!49 = !{!24, !10, i64 8}
!50 = !{!32, !10, i64 40}
!51 = !{!52, !14, i64 0}
!52 = !{!"debug", !14, i64 0, !5, i64 8, !5, i64 16, !14, i64 24, !5, i64 32}
!53 = !{!52, !5, i64 16}
!54 = !{!52, !5, i64 8}
!55 = !{!52, !5, i64 32}
!56 = !{!52, !14, i64 24}
!57 = !{i64 2148040882}
!58 = !{!16, !17, i64 16}
!59 = !{!24, !14, i64 4}
!60 = !{!24, !10, i64 32}
!61 = !{!37, !14, i64 48}
!62 = !{!63, !5, i64 16}
!63 = !{!"td_index", !6, i64 0, !5, i64 16}
!64 = !{!37, !5, i64 8}
!65 = !{!37, !5, i64 24}
!66 = !{!43, !10, i64 16}
!67 = !{!68, !68, i64 0}
!68 = !{!"long long", !6, i64 0}
!69 = !{!70, !10, i64 16}
!70 = !{!"fdpic_loadseg", !10, i64 0, !10, i64 8, !10, i64 16}
!71 = !{!70, !10, i64 0}
!72 = !{!73, !10, i64 0}
!73 = !{!"stat", !10, i64 0, !10, i64 8, !10, i64 16, !14, i64 24, !14, i64 28, !14, i64 32, !14, i64 36, !10, i64 40, !10, i64 48, !10, i64 56, !10, i64 64, !74, i64 72, !74, i64 88, !74, i64 104, !6, i64 120}
!74 = !{!"timespec", !10, i64 0, !10, i64 8}
!75 = !{!32, !14, i64 4}
!76 = !{!22, !10, i64 16}
!77 = !{!78, !5, i64 0}
!78 = !{!"", !5, i64 0, !5, i64 8, !5, i64 16, !5, i64 24}
!79 = !{!78, !5, i64 8}
!80 = !{!78, !5, i64 16}
!81 = !{!78, !5, i64 24}
!82 = !{!83, !10, i64 0}
!83 = !{!"dl_phdr_info", !10, i64 0, !5, i64 8, !5, i64 16, !17, i64 24, !68, i64 32, !68, i64 40, !10, i64 48, !5, i64 56}
!84 = !{!83, !5, i64 8}
!85 = !{!83, !5, i64 16}
!86 = !{!83, !17, i64 24}
!87 = !{!83, !68, i64 32}
!88 = !{!83, !68, i64 40}
!89 = !{!83, !10, i64 48}
!90 = !{!83, !5, i64 56}
