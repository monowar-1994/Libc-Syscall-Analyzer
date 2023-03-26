; ModuleID = 'src/process/posix_spawn.c'
source_filename = "src/process/posix_spawn.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.posix_spawn_file_actions_t = type { [2 x i32], i8*, [16 x i32] }
%struct.posix_spawnattr_t = type { i32, i32, %struct.__sigset_t, %struct.__sigset_t, i32, i32, i8*, [56 x i8] }
%struct.__sigset_t = type { [16 x i64] }
%struct.args = type { [2 x i32], %struct.__sigset_t, i8*, %struct.posix_spawn_file_actions_t*, %struct.posix_spawnattr_t*, i8**, i8** }
%struct.sigaction = type { %union.anon, %struct.__sigset_t, i32, void ()* }
%union.anon = type { void (i32)* }
%struct.fdop = type { %struct.fdop*, %struct.fdop*, i32, i32, i32, i32, i32, [0 x i8] }

@__abort_lock = external hidden global [1 x i32], align 4

; Function Attrs: nounwind optsize strictfp
define i32 @posix_spawn(i32* noalias noundef writeonly %0, i8* noalias noundef %1, %struct.posix_spawn_file_actions_t* noundef %2, %struct.posix_spawnattr_t* noalias noundef %3, i8** noalias noundef %4, i8** noalias noundef %5) local_unnamed_addr #0 {
  %7 = alloca [5120 x i8], align 16
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.args, align 8
  %11 = alloca %struct.posix_spawnattr_t, align 8
  %12 = alloca <2 x i64>, align 16
  %13 = alloca i32, align 4
  %14 = getelementptr inbounds [5120 x i8], [5120 x i8]* %7, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 5120, i8* nonnull %14) #7
  %15 = bitcast i32* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %15) #7
  store i32 0, i32* %8, align 4, !tbaa !3
  %16 = bitcast i32* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %16) #7
  %17 = bitcast %struct.args* %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 176, i8* nonnull %17) #7
  %18 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %9) #8
  %19 = getelementptr inbounds %struct.args, %struct.args* %10, i64 0, i32 2
  store i8* %1, i8** %19, align 8, !tbaa !7
  %20 = getelementptr inbounds %struct.args, %struct.args* %10, i64 0, i32 3
  store %struct.posix_spawn_file_actions_t* %2, %struct.posix_spawn_file_actions_t** %20, align 8, !tbaa !11
  %21 = icmp eq %struct.posix_spawnattr_t* %3, null
  br i1 %21, label %22, label %24

22:                                               ; preds = %6
  %23 = bitcast %struct.posix_spawnattr_t* %11 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(336) %23, i8 0, i64 336, i1 false) #9
  br label %24

24:                                               ; preds = %6, %22
  %25 = phi %struct.posix_spawnattr_t* [ %11, %22 ], [ %3, %6 ]
  %26 = getelementptr inbounds %struct.args, %struct.args* %10, i64 0, i32 4
  store %struct.posix_spawnattr_t* %25, %struct.posix_spawnattr_t** %26, align 8, !tbaa !12
  %27 = getelementptr inbounds %struct.args, %struct.args* %10, i64 0, i32 5
  store i8** %4, i8*** %27, align 8, !tbaa !13
  %28 = getelementptr inbounds %struct.args, %struct.args* %10, i64 0, i32 6
  store i8** %5, i8*** %28, align 8, !tbaa !14
  store <2 x i64> <i64 -1, i64 -1>, <2 x i64>* %12, align 16, !tbaa !15
  %29 = bitcast <2 x i64>* %12 to %struct.__sigset_t*
  %30 = getelementptr inbounds %struct.args, %struct.args* %10, i64 0, i32 1
  %31 = call i32 @pthread_sigmask(i32 noundef 0, %struct.__sigset_t* noundef nonnull %29, %struct.__sigset_t* noundef nonnull %30) #8
  call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @__abort_lock, i64 0, i64 0)) #8
  %32 = getelementptr inbounds %struct.args, %struct.args* %10, i64 0, i32 0, i64 0
  %33 = call i32 @pipe2(i32* noundef nonnull %32, i32 noundef 524288) #8
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %38, label %35

35:                                               ; preds = %24
  call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @__abort_lock, i64 0, i64 0)) #8
  %36 = tail call i32* @___errno_location() #10
  %37 = load i32, i32* %36, align 4, !tbaa !3
  store i32 %37, i32* %8, align 4, !tbaa !3
  br label %62

38:                                               ; preds = %24
  %39 = getelementptr inbounds [5120 x i8], [5120 x i8]* %7, i64 0, i64 5120
  %40 = call i32 (i32 (i8*)*, i8*, i32, i8*, ...) @__clone(i32 (i8*)* noundef nonnull @child, i8* noundef nonnull %39, i32 noundef 16657, i8* noundef nonnull %17) #8
  %41 = getelementptr inbounds %struct.args, %struct.args* %10, i64 0, i32 0, i64 1
  %42 = load i32, i32* %41, align 4, !tbaa !3
  %43 = call i32 @close(i32 noundef %42) #8
  call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @__abort_lock, i64 0, i64 0)) #8
  %44 = icmp sgt i32 %40, 0
  br i1 %44, label %45, label %52

45:                                               ; preds = %38
  %46 = load i32, i32* %32, align 8, !tbaa !3
  %47 = call i64 @read(i32 noundef %46, i8* noundef nonnull %15, i64 noundef 4) #8
  %48 = icmp eq i64 %47, 4
  br i1 %48, label %50, label %49

49:                                               ; preds = %45
  store i32 0, i32* %8, align 4, !tbaa !3
  br label %54

50:                                               ; preds = %45
  store i32 0, i32* %13, align 4, !tbaa !3
  %51 = call i32 @waitpid(i32 noundef %40, i32* noundef nonnull %13, i32 noundef 0) #8
  br label %54

52:                                               ; preds = %38
  %53 = sub nsw i32 0, %40
  store i32 %53, i32* %8, align 4, !tbaa !3
  br label %54

54:                                               ; preds = %49, %50, %52
  %55 = load i32, i32* %32, align 8, !tbaa !3
  %56 = call i32 @close(i32 noundef %55) #8
  %57 = load i32, i32* %8, align 4, !tbaa !3
  %58 = icmp eq i32 %57, 0
  %59 = icmp ne i32* %0, null
  %60 = and i1 %59, %58
  br i1 %60, label %61, label %62

61:                                               ; preds = %54
  store i32 %40, i32* %0, align 4, !tbaa !3
  br label %62

62:                                               ; preds = %54, %61, %35
  %63 = call i32 @pthread_sigmask(i32 noundef 2, %struct.__sigset_t* noundef nonnull %30, %struct.__sigset_t* noundef null) #8
  %64 = load i32, i32* %9, align 4, !tbaa !3
  %65 = call i32 @pthread_setcancelstate(i32 noundef %64, i32* noundef null) #8
  %66 = load i32, i32* %8, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 176, i8* nonnull %17) #7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %16) #7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %15) #7
  call void @llvm.lifetime.end.p0i8(i64 5120, i8* nonnull %14) #7
  ret i32 %66
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: optsize
declare i32 @pthread_sigmask(i32 noundef, %struct.__sigset_t* noundef, %struct.__sigset_t* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__lock(i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @pipe2(i32* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__unlock(i32* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #4

; Function Attrs: optsize
declare hidden i32 @__clone(i32 (i8*)* noundef, i8* noundef, i32 noundef, i8* noundef, ...) local_unnamed_addr #2

; Function Attrs: noreturn nounwind optsize strictfp
define internal i32 @child(i8* noundef %0) #5 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.sigaction, align 8
  %4 = alloca %struct.__sigset_t, align 8
  %5 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %5) #7
  %6 = bitcast %struct.sigaction* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 152, i8* nonnull %6) #7
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(152) %6, i8 0, i64 152, i1 false) #9
  %7 = getelementptr inbounds i8, i8* %0, i64 4
  %8 = bitcast i8* %7 to i32*
  %9 = load i32, i32* %8, align 4, !tbaa !3
  %10 = getelementptr inbounds i8, i8* %0, i64 144
  %11 = bitcast i8* %10 to %struct.posix_spawn_file_actions_t**
  %12 = load %struct.posix_spawn_file_actions_t*, %struct.posix_spawn_file_actions_t** %11, align 8, !tbaa !11
  %13 = getelementptr inbounds i8, i8* %0, i64 152
  %14 = bitcast i8* %13 to %struct.posix_spawnattr_t**
  %15 = load %struct.posix_spawnattr_t*, %struct.posix_spawnattr_t** %14, align 8, !tbaa !12
  %16 = bitcast %struct.__sigset_t* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %16) #7
  %17 = bitcast i8* %0 to i32*
  %18 = load i32, i32* %17, align 8, !tbaa !3
  %19 = tail call i32 @close(i32 noundef %18) #8
  call void @__get_handler_set(%struct.__sigset_t* noundef nonnull %4) #8
  %20 = getelementptr inbounds %struct.posix_spawnattr_t, %struct.posix_spawnattr_t* %15, i64 0, i32 0
  %21 = getelementptr inbounds %struct.posix_spawnattr_t, %struct.posix_spawnattr_t* %15, i64 0, i32 2
  %22 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %3, i64 0, i32 0, i32 0
  br label %23

23:                                               ; preds = %1, %46
  %24 = phi i32 [ 1, %1 ], [ %47, %46 ]
  %25 = load i32, i32* %20, align 8, !tbaa !17
  %26 = and i32 %25, 4
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %32, label %28

28:                                               ; preds = %23
  %29 = call i32 @sigismember(%struct.__sigset_t* noundef nonnull %21, i32 noundef %24) #8
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %32, label %31

31:                                               ; preds = %28
  store void (i32)* null, void (i32)** %22, align 8, !tbaa !19
  br label %44

32:                                               ; preds = %28, %23
  %33 = call i32 @sigismember(%struct.__sigset_t* noundef nonnull %4, i32 noundef %24) #8
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %46, label %35

35:                                               ; preds = %32
  %36 = add nsw i32 %24, -32
  %37 = icmp ult i32 %36, 3
  br i1 %37, label %38, label %39

38:                                               ; preds = %35
  store void (i32)* inttoptr (i64 1 to void (i32)*), void (i32)** %22, align 8, !tbaa !19
  br label %44

39:                                               ; preds = %35
  %40 = call i32 @__libc_sigaction(i32 noundef %24, %struct.sigaction* noundef null, %struct.sigaction* noundef nonnull %3) #8
  %41 = load void (i32)*, void (i32)** %22, align 8, !tbaa !19
  %42 = icmp eq void (i32)* %41, inttoptr (i64 1 to void (i32)*)
  br i1 %42, label %46, label %43

43:                                               ; preds = %39
  store void (i32)* null, void (i32)** %22, align 8, !tbaa !19
  br label %44

44:                                               ; preds = %43, %38, %31
  %45 = call i32 @__libc_sigaction(i32 noundef %24, %struct.sigaction* noundef nonnull %3, %struct.sigaction* noundef null) #8
  br label %46

46:                                               ; preds = %32, %39, %44
  %47 = add nuw nsw i32 %24, 1
  %48 = icmp eq i32 %47, 65
  br i1 %48, label %49, label %23

49:                                               ; preds = %46
  %50 = load i32, i32* %20, align 8, !tbaa !17
  %51 = and i32 %50, 128
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %59, label %53

53:                                               ; preds = %49
  %54 = call i64 asm sideeffect "syscall", "={ax},{ax},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 112) #7, !srcloc !20
  %55 = trunc i64 %54 to i32
  %56 = icmp slt i32 %55, 0
  br i1 %56, label %187, label %57

57:                                               ; preds = %53
  %58 = load i32, i32* %20, align 8, !tbaa !17
  br label %59

59:                                               ; preds = %57, %49
  %60 = phi i32 [ %58, %57 ], [ %50, %49 ]
  %61 = and i32 %60, 2
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %72, label %63

63:                                               ; preds = %59
  %64 = getelementptr inbounds %struct.posix_spawnattr_t, %struct.posix_spawnattr_t* %15, i64 0, i32 1
  %65 = load i32, i32* %64, align 4, !tbaa !21
  %66 = sext i32 %65 to i64
  %67 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 109, i64 0, i64 %66) #7, !srcloc !22
  %68 = trunc i64 %67 to i32
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %70, label %187

70:                                               ; preds = %63
  %71 = load i32, i32* %20, align 8, !tbaa !17
  br label %72

72:                                               ; preds = %70, %59
  %73 = phi i32 [ %71, %70 ], [ %60, %59 ]
  %74 = and i32 %73, 1
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %86, label %76

76:                                               ; preds = %72
  %77 = call i64 asm sideeffect "syscall", "={ax},{ax},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 104) #7, !srcloc !20
  %78 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 106, i64 %77) #7, !srcloc !23
  %79 = trunc i64 %78 to i32
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %81, label %187

81:                                               ; preds = %76
  %82 = call i64 asm sideeffect "syscall", "={ax},{ax},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 102) #7, !srcloc !20
  %83 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 105, i64 %82) #7, !srcloc !23
  %84 = trunc i64 %83 to i32
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %86, label %187

86:                                               ; preds = %81, %72
  %87 = icmp eq %struct.posix_spawn_file_actions_t* %12, null
  br i1 %87, label %191, label %88

88:                                               ; preds = %86
  %89 = getelementptr inbounds %struct.posix_spawn_file_actions_t, %struct.posix_spawn_file_actions_t* %12, i64 0, i32 1
  %90 = load i8*, i8** %89, align 8, !tbaa !24
  %91 = icmp eq i8* %90, null
  br i1 %91, label %191, label %92

92:                                               ; preds = %88
  %93 = bitcast i8* %90 to %struct.fdop*
  br label %94

94:                                               ; preds = %94, %92
  %95 = phi %struct.fdop* [ %93, %92 ], [ %97, %94 ]
  %96 = getelementptr inbounds %struct.fdop, %struct.fdop* %95, i64 0, i32 0
  %97 = load %struct.fdop*, %struct.fdop** %96, align 8, !tbaa !26
  %98 = icmp eq %struct.fdop* %97, null
  br i1 %98, label %99, label %94

99:                                               ; preds = %94, %179
  %100 = phi %struct.fdop* [ %181, %179 ], [ %95, %94 ]
  %101 = phi i32 [ %113, %179 ], [ %9, %94 ]
  %102 = getelementptr inbounds %struct.fdop, %struct.fdop* %100, i64 0, i32 3
  %103 = load i32, i32* %102, align 4, !tbaa !3
  %104 = icmp eq i32 %103, %101
  br i1 %104, label %105, label %112

105:                                              ; preds = %99
  %106 = sext i32 %101 to i64
  %107 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 32, i64 %106) #7, !srcloc !23
  %108 = trunc i64 %107 to i32
  %109 = icmp slt i32 %108, 0
  br i1 %109, label %183, label %110

110:                                              ; preds = %105
  %111 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 3, i64 %106) #7, !srcloc !23
  br label %112

112:                                              ; preds = %110, %99
  %113 = phi i32 [ %108, %110 ], [ %101, %99 ]
  %114 = getelementptr inbounds %struct.fdop, %struct.fdop* %100, i64 0, i32 2
  %115 = load i32, i32* %114, align 8, !tbaa !3
  switch i32 %115, label %179 [
    i32 1, label %116
    i32 2, label %120
    i32 3, label %141
    i32 4, label %167
    i32 5, label %173
  ]

116:                                              ; preds = %112
  %117 = load i32, i32* %102, align 4, !tbaa !3
  %118 = sext i32 %117 to i64
  %119 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 3, i64 %118) #7, !srcloc !23
  br label %179

120:                                              ; preds = %112
  %121 = getelementptr inbounds %struct.fdop, %struct.fdop* %100, i64 0, i32 4
  %122 = load i32, i32* %121, align 8, !tbaa !3
  %123 = icmp eq i32 %122, %113
  br i1 %123, label %187, label %124

124:                                              ; preds = %120
  %125 = load i32, i32* %102, align 4, !tbaa !3
  %126 = icmp eq i32 %122, %125
  %127 = sext i32 %122 to i64
  br i1 %126, label %133, label %128

128:                                              ; preds = %124
  %129 = sext i32 %125 to i64
  %130 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 33, i64 %127, i64 %129) #7, !srcloc !22
  %131 = trunc i64 %130 to i32
  store i32 %131, i32* %2, align 4, !tbaa !3
  %132 = icmp slt i32 %131, 0
  br i1 %132, label %183, label %179

133:                                              ; preds = %124
  %134 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %127, i64 1) #7, !srcloc !22
  %135 = shl i64 %134, 32
  %136 = ashr exact i64 %135, 32
  %137 = and i64 %136, -2
  %138 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %127, i64 2, i64 %137) #7, !srcloc !27
  %139 = trunc i64 %138 to i32
  store i32 %139, i32* %2, align 4, !tbaa !3
  %140 = icmp slt i32 %139, 0
  br i1 %140, label %183, label %179

141:                                              ; preds = %112
  %142 = getelementptr inbounds %struct.fdop, %struct.fdop* %100, i64 0, i32 7, i64 0
  %143 = ptrtoint i8* %142 to i64
  %144 = getelementptr inbounds %struct.fdop, %struct.fdop* %100, i64 0, i32 5
  %145 = load i32, i32* %144, align 4, !tbaa !3
  %146 = or i32 %145, 32768
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds %struct.fdop, %struct.fdop* %100, i64 0, i32 6
  %149 = load i32, i32* %148, align 8, !tbaa !3
  %150 = zext i32 %149 to i64
  %151 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 2, i64 %143, i64 %147, i64 %150) #7, !srcloc !27
  %152 = trunc i64 %151 to i32
  store i32 %152, i32* %2, align 4, !tbaa !3
  %153 = icmp slt i32 %152, 0
  br i1 %153, label %183, label %154

154:                                              ; preds = %141
  %155 = load i32, i32* %102, align 4, !tbaa !3
  %156 = icmp eq i32 %155, %152
  br i1 %156, label %179, label %157

157:                                              ; preds = %154
  %158 = and i64 %151, 4294967295
  %159 = sext i32 %155 to i64
  %160 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 33, i64 %158, i64 %159) #7, !srcloc !22
  %161 = trunc i64 %160 to i32
  store i32 %161, i32* %2, align 4, !tbaa !3
  %162 = icmp slt i32 %161, 0
  br i1 %162, label %183, label %163

163:                                              ; preds = %157
  %164 = shl i64 %151, 32
  %165 = ashr exact i64 %164, 32
  %166 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 3, i64 %165) #7, !srcloc !23
  br label %179

167:                                              ; preds = %112
  %168 = getelementptr inbounds %struct.fdop, %struct.fdop* %100, i64 0, i32 7, i64 0
  %169 = ptrtoint i8* %168 to i64
  %170 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 80, i64 %169) #7, !srcloc !23
  %171 = trunc i64 %170 to i32
  store i32 %171, i32* %2, align 4, !tbaa !3
  %172 = icmp slt i32 %171, 0
  br i1 %172, label %183, label %179

173:                                              ; preds = %112
  %174 = load i32, i32* %102, align 4, !tbaa !3
  %175 = sext i32 %174 to i64
  %176 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 81, i64 %175) #7, !srcloc !23
  %177 = trunc i64 %176 to i32
  store i32 %177, i32* %2, align 4, !tbaa !3
  %178 = icmp slt i32 %177, 0
  br i1 %178, label %183, label %179

179:                                              ; preds = %116, %112, %133, %128, %163, %154, %167, %173
  %180 = getelementptr inbounds %struct.fdop, %struct.fdop* %100, i64 0, i32 1
  %181 = load %struct.fdop*, %struct.fdop** %180, align 8, !tbaa !26
  %182 = icmp eq %struct.fdop* %181, null
  br i1 %182, label %191, label %99

183:                                              ; preds = %173, %167, %157, %141, %133, %128, %105
  %184 = phi i64 [ %107, %105 ], [ %130, %128 ], [ %138, %133 ], [ %151, %141 ], [ %160, %157 ], [ %170, %167 ], [ %176, %173 ]
  %185 = phi i32 [ %101, %105 ], [ %113, %128 ], [ %113, %133 ], [ %113, %141 ], [ %113, %157 ], [ %113, %167 ], [ %113, %173 ]
  %186 = trunc i64 %184 to i32
  br label %187

187:                                              ; preds = %120, %183, %76, %81, %63, %53
  %188 = phi i32 [ %55, %53 ], [ %68, %63 ], [ %84, %81 ], [ %79, %76 ], [ %186, %183 ], [ -9, %120 ]
  %189 = phi i32 [ %9, %53 ], [ %9, %63 ], [ %9, %81 ], [ %9, %76 ], [ %185, %183 ], [ %113, %120 ]
  %190 = sub nsw i32 0, %188
  store i32 %190, i32* %2, align 4, !tbaa !3
  br label %221

191:                                              ; preds = %179, %86, %88
  %192 = phi i32 [ %9, %88 ], [ %9, %86 ], [ %113, %179 ]
  %193 = sext i32 %192 to i64
  %194 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %193, i64 2, i64 1) #7, !srcloc !27
  %195 = load i32, i32* %20, align 8, !tbaa !17
  %196 = and i32 %195, 8
  %197 = icmp eq i32 %196, 0
  %198 = getelementptr inbounds %struct.posix_spawnattr_t, %struct.posix_spawnattr_t* %15, i64 0, i32 3
  %199 = getelementptr inbounds i8, i8* %0, i64 8
  %200 = bitcast i8* %199 to %struct.__sigset_t*
  %201 = select i1 %197, %struct.__sigset_t* %200, %struct.__sigset_t* %198
  %202 = call i32 @pthread_sigmask(i32 noundef 2, %struct.__sigset_t* noundef nonnull %201, %struct.__sigset_t* noundef null) #8
  %203 = getelementptr inbounds %struct.posix_spawnattr_t, %struct.posix_spawnattr_t* %15, i64 0, i32 6
  %204 = load i8*, i8** %203, align 8, !tbaa !28
  %205 = icmp eq i8* %204, null
  %206 = bitcast i8* %204 to i32 (i8*, i8**, i8**)*
  %207 = select i1 %205, i32 (i8*, i8**, i8**)* @execve, i32 (i8*, i8**, i8**)* %206
  %208 = getelementptr inbounds i8, i8* %0, i64 136
  %209 = bitcast i8* %208 to i8**
  %210 = load i8*, i8** %209, align 8, !tbaa !7
  %211 = getelementptr inbounds i8, i8* %0, i64 160
  %212 = bitcast i8* %211 to i8***
  %213 = load i8**, i8*** %212, align 8, !tbaa !13
  %214 = getelementptr inbounds i8, i8* %0, i64 168
  %215 = bitcast i8* %214 to i8***
  %216 = load i8**, i8*** %215, align 8, !tbaa !14
  %217 = call i32 %207(i8* noundef %210, i8** noundef %213, i8** noundef %216) #8
  %218 = tail call i32* @___errno_location() #10
  %219 = load i32, i32* %218, align 4, !tbaa !3
  store i32 %219, i32* %2, align 4, !tbaa !3
  %220 = icmp eq i32 %219, 0
  br i1 %220, label %228, label %221

221:                                              ; preds = %187, %191
  %222 = phi i32 [ %189, %187 ], [ %192, %191 ]
  %223 = sext i32 %222 to i64
  %224 = ptrtoint i32* %2 to i64
  br label %225

225:                                              ; preds = %221, %225
  %226 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 %223, i64 %224, i64 4) #7, !srcloc !27
  %227 = icmp slt i64 %226, 0
  br i1 %227, label %225, label %228

228:                                              ; preds = %225, %191
  call void @_exit(i32 noundef 127) #11
  unreachable
}

; Function Attrs: optsize
declare i32 @close(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @read(i32 noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @waitpid(i32 noundef, i32* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden void @__get_handler_set(%struct.__sigset_t* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @sigismember(%struct.__sigset_t* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__libc_sigaction(i32 noundef, %struct.sigaction* noundef, %struct.sigaction* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @execve(i8* noundef, i8** noundef, i8** noundef) local_unnamed_addr #2

; Function Attrs: noreturn optsize
declare void @_exit(i32 noundef) local_unnamed_addr #6

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #4 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind strictfp }
attributes #8 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #9 = { strictfp }
attributes #10 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #11 = { nobuiltin noreturn nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !10, i64 136}
!8 = !{!"args", !5, i64 0, !9, i64 8, !10, i64 136, !10, i64 144, !10, i64 152, !10, i64 160, !10, i64 168}
!9 = !{!"__sigset_t", !5, i64 0}
!10 = !{!"any pointer", !5, i64 0}
!11 = !{!8, !10, i64 144}
!12 = !{!8, !10, i64 152}
!13 = !{!8, !10, i64 160}
!14 = !{!8, !10, i64 168}
!15 = !{!16, !16, i64 0}
!16 = !{!"long long", !5, i64 0}
!17 = !{!18, !4, i64 0}
!18 = !{!"", !4, i64 0, !4, i64 4, !9, i64 8, !9, i64 136, !4, i64 264, !4, i64 268, !10, i64 272, !5, i64 280}
!19 = !{!5, !5, i64 0}
!20 = !{i64 197343}
!21 = !{!18, !4, i64 4}
!22 = !{i64 197697}
!23 = !{i64 197511}
!24 = !{!25, !10, i64 8}
!25 = !{!"", !5, i64 0, !10, i64 8, !5, i64 16}
!26 = !{!10, !10, i64 0}
!27 = !{i64 197909}
!28 = !{!18, !10, i64 272}
