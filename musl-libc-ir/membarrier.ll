; ModuleID = 'src/linux/membarrier.c'
source_filename = "src/linux/membarrier.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sem_t = type { [8 x i32] }
%struct.sigaction = type { %union.anon, %struct.__sigset_t, i32, void ()* }
%union.anon = type { void (i32)* }
%struct.__sigset_t = type { [16 x i64] }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque

@barrier_sem = internal global %struct.sem_t zeroinitializer, align 4
@__const.__membarrier.sa = private unnamed_addr constant %struct.sigaction { %union.anon { void (i32)* @bcast_barrier }, %struct.__sigset_t zeroinitializer, i32 268435456, void ()* null }, align 8

@__tl_lock = weak hidden alias void (), void ()* @dummy_0
@__tl_unlock = weak hidden alias void (), void ()* @dummy_0
@membarrier = weak alias i32 (i32, i32), i32 (i32, i32)* @__membarrier

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal void @dummy_0() #0 {
  ret void
}

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__membarrier(i32 noundef %0, i32 noundef %1) #1 {
  %3 = alloca %struct.__sigset_t, align 8
  %4 = alloca %struct.sigaction, align 8
  %5 = sext i32 %0 to i64
  %6 = sext i32 %1 to i64
  %7 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 324, i64 %5, i64 %6) #5, !srcloc !3
  %8 = trunc i64 %7 to i32
  %9 = icmp eq i32 %8, 0
  %10 = icmp ne i32 %0, 8
  %11 = or i1 %10, %9
  %12 = icmp ne i32 %1, 0
  %13 = or i1 %12, %11
  br i1 %13, label %53, label %14

14:                                               ; preds = %2
  %15 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !4
  %16 = inttoptr i64 %15 to %struct.__pthread*
  %17 = bitcast %struct.__sigset_t* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %17) #5
  call void @__block_app_sigs(i8* noundef nonnull %17) #7
  call void @__tl_lock() #7
  %18 = call i32 @sem_init(%struct.sem_t* noundef nonnull @barrier_sem, i32 noundef 0, i32 noundef 0) #7
  %19 = bitcast %struct.sigaction* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 152, i8* nonnull %19) #5
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(152) %19, i8* noundef nonnull align 8 dereferenceable(152) bitcast (%struct.sigaction* @__const.__membarrier.sa to i8*), i64 152, i1 false) #8
  %20 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %4, i64 0, i32 1
  %21 = bitcast %struct.__sigset_t* %20 to i8*
  %22 = call i8* @memset(i8* noundef nonnull %21, i32 noundef -1, i64 noundef 128) #7
  %23 = call i32 @__libc_sigaction(i32 noundef 34, %struct.sigaction* noundef nonnull %4, %struct.sigaction* noundef null) #7
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %50

25:                                               ; preds = %14
  %26 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %16, i64 0, i32 3
  %27 = load %struct.__pthread*, %struct.__pthread** %26, align 8, !tbaa !5
  %28 = icmp eq %struct.__pthread* %27, %16
  br i1 %28, label %47, label %32

29:                                               ; preds = %32
  %30 = load %struct.__pthread*, %struct.__pthread** %26, align 8, !tbaa !5
  %31 = icmp eq %struct.__pthread* %30, %16
  br i1 %31, label %47, label %41

32:                                               ; preds = %25, %32
  %33 = phi %struct.__pthread* [ %39, %32 ], [ %27, %25 ]
  %34 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %33, i64 0, i32 6
  %35 = load i32, i32* %34, align 8, !tbaa !13
  %36 = sext i32 %35 to i64
  %37 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 200, i64 %36, i64 34) #5, !srcloc !3
  %38 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %33, i64 0, i32 3
  %39 = load %struct.__pthread*, %struct.__pthread** %38, align 8, !tbaa !5
  %40 = icmp eq %struct.__pthread* %39, %16
  br i1 %40, label %29, label %32

41:                                               ; preds = %29, %41
  %42 = phi %struct.__pthread* [ %45, %41 ], [ %30, %29 ]
  %43 = call i32 @sem_wait(%struct.sem_t* noundef nonnull @barrier_sem) #7
  %44 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %42, i64 0, i32 3
  %45 = load %struct.__pthread*, %struct.__pthread** %44, align 8, !tbaa !5
  %46 = icmp eq %struct.__pthread* %45, %16
  br i1 %46, label %47, label %41

47:                                               ; preds = %41, %25, %29
  %48 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %4, i64 0, i32 0, i32 0
  store void (i32)* inttoptr (i64 1 to void (i32)*), void (i32)** %48, align 8, !tbaa !14
  %49 = call i32 @__libc_sigaction(i32 noundef 34, %struct.sigaction* noundef nonnull %4, %struct.sigaction* noundef null) #7
  br label %50

50:                                               ; preds = %47, %14
  %51 = phi i64 [ %7, %14 ], [ 0, %47 ]
  %52 = call i32 @sem_destroy(%struct.sem_t* noundef nonnull @barrier_sem) #7
  call void @__tl_unlock() #7
  call void @__restore_sigs(i8* noundef nonnull %17) #7
  call void @llvm.lifetime.end.p0i8(i64 152, i8* nonnull %19) #5
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %17) #5
  br label %53

53:                                               ; preds = %50, %2
  %54 = phi i64 [ %7, %2 ], [ %51, %50 ]
  %55 = shl i64 %54, 32
  %56 = ashr exact i64 %55, 32
  %57 = call i64 @__syscall_ret(i64 noundef %56) #7
  %58 = trunc i64 %57 to i32
  ret i32 %58
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: optsize
declare hidden void @__block_app_sigs(i8* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @sem_init(%struct.sem_t* noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: nounwind optsize strictfp
define internal void @bcast_barrier(i32 noundef %0) #1 {
  %2 = tail call i32 @sem_post(%struct.sem_t* noundef nonnull @barrier_sem) #7
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden i32 @__libc_sigaction(i32 noundef, %struct.sigaction* noundef, %struct.sigaction* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @sem_wait(%struct.sem_t* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @sem_destroy(%struct.sem_t* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden void @__restore_sigs(i8* noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #3

; Function Attrs: nounwind optsize strictfp
define hidden void @__membarrier_init() local_unnamed_addr #1 {
  %1 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 324, i64 16, i64 0) #5, !srcloc !3
  ret void
}

; Function Attrs: optsize
declare i32 @sem_post(%struct.sem_t* noundef) local_unnamed_addr #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #5 = { nounwind strictfp }
attributes #6 = { nounwind readnone strictfp }
attributes #7 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #8 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 251276}
!4 = !{i64 281605}
!5 = !{!6, !7, i64 24}
!6 = !{!"__pthread", !7, i64 0, !7, i64 8, !7, i64 16, !7, i64 24, !10, i64 32, !10, i64 40, !11, i64 48, !11, i64 52, !11, i64 56, !11, i64 60, !8, i64 64, !8, i64 65, !8, i64 66, !8, i64 66, !7, i64 72, !10, i64 80, !7, i64 88, !10, i64 96, !10, i64 104, !7, i64 112, !7, i64 120, !7, i64 128, !12, i64 136, !11, i64 160, !11, i64 164, !7, i64 168, !8, i64 176, !7, i64 184, !7, i64 192}
!7 = !{!"any pointer", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"long", !8, i64 0}
!11 = !{!"int", !8, i64 0}
!12 = !{!"", !7, i64 0, !10, i64 8, !7, i64 16}
!13 = !{!6, !11, i64 48}
!14 = !{!8, !8, i64 0}
