; ModuleID = 'src/thread/synccall.c'
source_filename = "src/thread/synccall.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sigaction = type { %union.anon, %struct.__sigset_t, i32, void ()* }
%union.anon = type { void (i32)* }
%struct.__sigset_t = type { [16 x i64] }
%struct.sem_t = type { [8 x i32] }
%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon.11, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon.11 = type { i8*, i64, i8* }

@__const.__synccall.sa = private unnamed_addr constant %struct.sigaction { %union.anon { void (i32)* @handler }, %struct.__sigset_t zeroinitializer, i32 268435456, void ()* null }, align 8
@target_sem = internal global %struct.sem_t zeroinitializer, align 4
@caller_sem = internal global %struct.sem_t zeroinitializer, align 4
@__libc = external hidden local_unnamed_addr global %struct.__libc, align 8
@callback = internal unnamed_addr global void (i8*)* null, align 8
@context = internal unnamed_addr global i8* null, align 8
@target_tid = internal unnamed_addr global i32 0, align 4

@__tl_lock = weak hidden alias void (), void ()* @dummy_0
@__tl_unlock = weak hidden alias void (), void ()* @dummy_0

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal void @dummy_0() #0 {
  ret void
}

; Function Attrs: nounwind optsize strictfp
define hidden void @__synccall(void (i8*)* noundef %0, i8* noundef %1) local_unnamed_addr #1 {
  %3 = alloca %struct.__sigset_t, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.sigaction, align 8
  %6 = bitcast %struct.__sigset_t* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %6) #6
  %7 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %7) #6
  %8 = bitcast %struct.sigaction* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 152, i8* nonnull %8) #6
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(152) %8, i8* noundef nonnull align 8 dereferenceable(152) bitcast (%struct.sigaction* @__const.__synccall.sa to i8*), i64 152, i1 false) #7
  %9 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !3
  %10 = inttoptr i64 %9 to %struct.__pthread*
  call void @__block_app_sigs(i8* noundef nonnull %6) #9
  call void @__tl_lock() #9
  call void @__block_all_sigs(i8* noundef null) #9
  %11 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %4) #9
  %12 = call i32 @sem_init(%struct.sem_t* noundef nonnull @target_sem, i32 noundef 0, i32 noundef 0) #9
  %13 = call i32 @sem_init(%struct.sem_t* noundef nonnull @caller_sem, i32 noundef 0, i32 noundef 0) #9
  %14 = load i32, i32* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 4), align 4, !tbaa !4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %61, label %16

16:                                               ; preds = %2
  %17 = call i64 asm sideeffect "syscall", "={ax},{ax},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 186) #6, !srcloc !12
  %18 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %10, i64 0, i32 6
  %19 = load i32, i32* %18, align 8, !tbaa !13
  %20 = sext i32 %19 to i64
  %21 = icmp eq i64 %17, %20
  br i1 %21, label %22, label %61

22:                                               ; preds = %16
  store void (i8*)* %0, void (i8*)** @callback, align 8, !tbaa !16
  store i8* %1, i8** @context, align 8, !tbaa !16
  %23 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %5, i64 0, i32 1
  %24 = bitcast %struct.__sigset_t* %23 to i8*
  %25 = call i8* @memset(i8* noundef nonnull %24, i32 noundef -1, i64 noundef 128) #9
  %26 = call i32 @__libc_sigaction(i32 noundef 34, %struct.sigaction* noundef nonnull %5, %struct.sigaction* noundef null) #9
  %27 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %10, i64 0, i32 3
  %28 = load %struct.__pthread*, %struct.__pthread** %27, align 8, !tbaa !17
  %29 = icmp eq %struct.__pthread* %28, %10
  br i1 %29, label %30, label %31

30:                                               ; preds = %22
  store i32 0, i32* @target_tid, align 4, !tbaa !18
  br label %62

31:                                               ; preds = %22, %43
  %32 = phi %struct.__pthread* [ %47, %43 ], [ %28, %22 ]
  %33 = phi i32 [ %45, %43 ], [ 0, %22 ]
  %34 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %32, i64 0, i32 6
  %35 = load i32, i32* %34, align 8, !tbaa !13
  store i32 %35, i32* @target_tid, align 4, !tbaa !18
  br label %36

36:                                               ; preds = %41, %31
  %37 = phi i32 [ %42, %41 ], [ %35, %31 ]
  %38 = sext i32 %37 to i64
  %39 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 200, i64 %38, i64 34) #6, !srcloc !19
  %40 = trunc i64 %39 to i32
  switch i32 %40, label %50 [
    i32 -11, label %41
    i32 0, label %43
  ]

41:                                               ; preds = %36
  %42 = load i32, i32* %34, align 8, !tbaa !13
  br label %36

43:                                               ; preds = %36
  %44 = call i32 @sem_wait(%struct.sem_t* noundef nonnull @caller_sem) #9
  %45 = add nuw nsw i32 %33, 1
  %46 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %32, i64 0, i32 3
  %47 = load %struct.__pthread*, %struct.__pthread** %46, align 8, !tbaa !17
  %48 = icmp eq %struct.__pthread* %47, %10
  br i1 %48, label %49, label %31

49:                                               ; preds = %43
  store i32 0, i32* @target_tid, align 4, !tbaa !18
  br label %52

50:                                               ; preds = %36
  store void (i8*)* @dummy, void (i8*)** @callback, align 8, !tbaa !16
  store i32 0, i32* @target_tid, align 4, !tbaa !18
  %51 = icmp eq i32 %33, 0
  br i1 %51, label %62, label %52

52:                                               ; preds = %49, %50
  %53 = phi void (i8*)* [ %0, %49 ], [ @dummy, %50 ]
  %54 = phi i32 [ %45, %49 ], [ %33, %50 ]
  br label %55

55:                                               ; preds = %52, %55
  %56 = phi i32 [ %59, %55 ], [ 0, %52 ]
  %57 = call i32 @sem_post(%struct.sem_t* noundef nonnull @target_sem) #9
  %58 = call i32 @sem_wait(%struct.sem_t* noundef nonnull @caller_sem) #9
  %59 = add nuw i32 %56, 1
  %60 = icmp eq i32 %59, %54
  br i1 %60, label %62, label %55

61:                                               ; preds = %16, %2
  call void %0(i8* noundef %1) #9
  br label %79

62:                                               ; preds = %55, %50, %30
  %63 = phi void (i8*)* [ %0, %30 ], [ @dummy, %50 ], [ %53, %55 ]
  %64 = phi i32 [ 0, %30 ], [ 0, %50 ], [ %54, %55 ]
  %65 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %5, i64 0, i32 0, i32 0
  store void (i32)* inttoptr (i64 1 to void (i32)*), void (i32)** %65, align 8, !tbaa !20
  %66 = call i32 @__libc_sigaction(i32 noundef 34, %struct.sigaction* noundef nonnull %5, %struct.sigaction* noundef null) #9
  call void %63(i8* noundef %1) #9
  %67 = icmp eq i32 %64, 0
  br i1 %67, label %79, label %69

68:                                               ; preds = %69
  br i1 %67, label %79, label %74

69:                                               ; preds = %62, %69
  %70 = phi i32 [ %72, %69 ], [ 0, %62 ]
  %71 = call i32 @sem_post(%struct.sem_t* noundef nonnull @target_sem) #9
  %72 = add nuw i32 %70, 1
  %73 = icmp eq i32 %72, %64
  br i1 %73, label %68, label %69

74:                                               ; preds = %68, %74
  %75 = phi i32 [ %77, %74 ], [ 0, %68 ]
  %76 = call i32 @sem_wait(%struct.sem_t* noundef nonnull @caller_sem) #9
  %77 = add nuw i32 %75, 1
  %78 = icmp eq i32 %77, %64
  br i1 %78, label %79, label %74

79:                                               ; preds = %74, %62, %61, %68
  %80 = call i32 @sem_destroy(%struct.sem_t* noundef nonnull @caller_sem) #9
  %81 = call i32 @sem_destroy(%struct.sem_t* noundef nonnull @target_sem) #9
  %82 = load i32, i32* %4, align 4, !tbaa !18
  %83 = call i32 @pthread_setcancelstate(i32 noundef %82, i32* noundef null) #9
  call void @__tl_unlock() #9
  call void @__restore_sigs(i8* noundef nonnull %6) #9
  call void @llvm.lifetime.end.p0i8(i64 152, i8* nonnull %8) #6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %7) #6
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %6) #6
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind optsize strictfp
define internal void @handler(i32 noundef %0) #1 {
  %2 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !3
  %3 = inttoptr i64 %2 to %struct.__pthread*
  %4 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %3, i64 0, i32 6
  %5 = load i32, i32* %4, align 8, !tbaa !13
  %6 = load i32, i32* @target_tid, align 4, !tbaa !18
  %7 = icmp eq i32 %5, %6
  br i1 %7, label %8, label %18

8:                                                ; preds = %1
  %9 = tail call i32* @___errno_location() #10
  %10 = load i32, i32* %9, align 4, !tbaa !18
  %11 = tail call i32 @sem_post(%struct.sem_t* noundef nonnull @caller_sem) #9
  %12 = tail call i32 @sem_wait(%struct.sem_t* noundef nonnull @target_sem) #9
  %13 = load void (i8*)*, void (i8*)** @callback, align 8, !tbaa !16
  %14 = load i8*, i8** @context, align 8, !tbaa !16
  tail call void %13(i8* noundef %14) #9
  %15 = tail call i32 @sem_post(%struct.sem_t* noundef nonnull @caller_sem) #9
  %16 = tail call i32 @sem_wait(%struct.sem_t* noundef nonnull @target_sem) #9
  %17 = tail call i32 @sem_post(%struct.sem_t* noundef nonnull @caller_sem) #9
  store i32 %10, i32* %9, align 4, !tbaa !18
  br label %18

18:                                               ; preds = %1, %8
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: optsize
declare hidden void @__block_app_sigs(i8* noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare hidden void @__block_all_sigs(i8* noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @sem_init(%struct.sem_t* noundef, i32 noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare hidden i32 @__libc_sigaction(i32 noundef, %struct.sigaction* noundef, %struct.sigaction* noundef) local_unnamed_addr #4

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal void @dummy(i8* nocapture noundef %0) #0 {
  ret void
}

; Function Attrs: optsize
declare i32 @sem_wait(%struct.sem_t* noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @sem_post(%struct.sem_t* noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @sem_destroy(%struct.sem_t* noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare hidden void @__restore_sigs(i8* noundef) local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #5

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #4 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind strictfp }
attributes #7 = { strictfp }
attributes #8 = { nounwind readnone strictfp }
attributes #9 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #10 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 237010}
!4 = !{!5, !8, i64 4}
!5 = !{!"__libc", !6, i64 0, !6, i64 1, !6, i64 2, !6, i64 3, !8, i64 4, !9, i64 8, !9, i64 16, !10, i64 24, !10, i64 32, !10, i64 40, !10, i64 48, !11, i64 56}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"int", !6, i64 0}
!9 = !{!"any pointer", !6, i64 0}
!10 = !{!"long", !6, i64 0}
!11 = !{!"__locale_struct", !6, i64 0}
!12 = !{i64 206327}
!13 = !{!14, !8, i64 48}
!14 = !{!"__pthread", !9, i64 0, !9, i64 8, !9, i64 16, !9, i64 24, !10, i64 32, !10, i64 40, !8, i64 48, !8, i64 52, !8, i64 56, !8, i64 60, !6, i64 64, !6, i64 65, !6, i64 66, !6, i64 66, !9, i64 72, !10, i64 80, !9, i64 88, !10, i64 96, !10, i64 104, !9, i64 112, !9, i64 120, !9, i64 128, !15, i64 136, !8, i64 160, !8, i64 164, !9, i64 168, !6, i64 176, !9, i64 184, !9, i64 192}
!15 = !{!"", !9, i64 0, !10, i64 8, !9, i64 16}
!16 = !{!9, !9, i64 0}
!17 = !{!14, !9, i64 24}
!18 = !{!8, !8, i64 0}
!19 = !{i64 206681}
!20 = !{!6, !6, i64 0}
