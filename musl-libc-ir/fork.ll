; ModuleID = 'src/process/fork.c'
source_filename = "src/process/fork.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.__sigset_t = type { [16 x i64] }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }

@dummy_lockptr = internal constant i32* null, align 8
@__libc = external hidden global %struct.__libc, align 8
@atfork_locks = internal unnamed_addr constant [11 x i32**] [i32** @__at_quick_exit_lockptr, i32** @__atexit_lockptr, i32** @__dlerror_lockptr, i32** @__gettext_lockptr, i32** @__locale_lockptr, i32** @__random_lockptr, i32** @__sem_open_lockptr, i32** @__stdio_ofl_lockptr, i32** @__syslog_lockptr, i32** @__timezone_lockptr, i32** @__bump_lockptr], align 16

@__at_quick_exit_lockptr = weak hidden alias i32*, i32** @dummy_lockptr
@__atexit_lockptr = weak hidden alias i32*, i32** @dummy_lockptr
@__dlerror_lockptr = weak hidden alias i32*, i32** @dummy_lockptr
@__gettext_lockptr = weak hidden alias i32*, i32** @dummy_lockptr
@__locale_lockptr = weak hidden alias i32*, i32** @dummy_lockptr
@__random_lockptr = weak hidden alias i32*, i32** @dummy_lockptr
@__sem_open_lockptr = weak hidden alias i32*, i32** @dummy_lockptr
@__stdio_ofl_lockptr = weak hidden alias i32*, i32** @dummy_lockptr
@__syslog_lockptr = weak hidden alias i32*, i32** @dummy_lockptr
@__timezone_lockptr = weak hidden alias i32*, i32** @dummy_lockptr
@__bump_lockptr = weak hidden alias i32*, i32** @dummy_lockptr
@__vmlock_lockptr = weak hidden alias i32*, i32** @dummy_lockptr
@__fork_handler = weak hidden alias void (i32), void (i32)* @dummy
@__malloc_atfork = weak hidden alias void (i32), void (i32)* @dummy
@__ldso_atfork = weak hidden alias void (i32), void (i32)* @dummy
@__tl_lock = weak hidden alias void (), void ()* @dummy_0
@__tl_unlock = weak hidden alias void (), void ()* @dummy_0

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal void @dummy(i32 noundef %0) #0 {
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal void @dummy_0() #0 {
  ret void
}

; Function Attrs: nounwind optsize strictfp
define i32 @fork() local_unnamed_addr #1 {
  %1 = alloca %struct.__sigset_t, align 8
  %2 = bitcast %struct.__sigset_t* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %2) #5
  tail call void @__fork_handler(i32 noundef -1) #6
  call void @__block_app_sigs(i8* noundef nonnull %2) #6
  %3 = load volatile i8, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 3), align 1, !tbaa !3
  %4 = icmp sgt i8 %3, 0
  br i1 %4, label %5, label %17

5:                                                ; preds = %0
  call void @__ldso_atfork(i32 noundef -1) #6
  call void @__inhibit_ptc() #6
  br label %7

6:                                                ; preds = %14
  call void @__malloc_atfork(i32 noundef -1) #6
  call void @__tl_lock() #6
  br label %17

7:                                                ; preds = %5, %14
  %8 = phi i64 [ 0, %5 ], [ %15, %14 ]
  %9 = getelementptr inbounds [11 x i32**], [11 x i32**]* @atfork_locks, i64 0, i64 %8
  %10 = load i32**, i32*** %9, align 8, !tbaa !11
  %11 = load i32*, i32** %10, align 8, !tbaa !11
  %12 = icmp eq i32* %11, null
  br i1 %12, label %14, label %13

13:                                               ; preds = %7
  call void @__lock(i32* noundef nonnull %11) #6
  br label %14

14:                                               ; preds = %7, %13
  %15 = add nuw nsw i64 %8, 1
  %16 = icmp eq i64 %15, 11
  br i1 %16, label %6, label %7

17:                                               ; preds = %6, %0
  %18 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !12
  %19 = inttoptr i64 %18 to %struct.__pthread*
  %20 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %19, i64 0, i32 3
  %21 = load %struct.__pthread*, %struct.__pthread** %20, align 8, !tbaa !13
  %22 = call i32 @_Fork() #6
  %23 = tail call i32* @___errno_location() #8
  %24 = load i32, i32* %23, align 4, !tbaa !16
  br i1 %4, label %25, label %55

25:                                               ; preds = %17
  %26 = icmp eq i32 %22, 0
  br i1 %26, label %27, label %40

27:                                               ; preds = %25
  %28 = icmp eq %struct.__pthread* %21, %19
  br i1 %28, label %29, label %32

29:                                               ; preds = %32, %27
  %30 = load i32*, i32** @__vmlock_lockptr, align 8, !tbaa !11
  %31 = icmp eq i32* %30, null
  br i1 %31, label %40, label %38

32:                                               ; preds = %27, %32
  %33 = phi %struct.__pthread* [ %36, %32 ], [ %21, %27 ]
  %34 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %33, i64 0, i32 6
  store i32 -1, i32* %34, align 8, !tbaa !17
  %35 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %33, i64 0, i32 3
  %36 = load %struct.__pthread*, %struct.__pthread** %35, align 8, !tbaa !13
  %37 = icmp eq %struct.__pthread* %36, %19
  br i1 %37, label %29, label %32

38:                                               ; preds = %29
  store volatile i32 0, i32* %30, align 4, !tbaa !16
  %39 = getelementptr inbounds i32, i32* %30, i64 1
  store volatile i32 0, i32* %39, align 4, !tbaa !16
  br label %40

40:                                               ; preds = %29, %38, %25
  call void @__tl_unlock() #6
  %41 = zext i1 %26 to i32
  call void @__malloc_atfork(i32 noundef %41) #6
  br label %43

42:                                               ; preds = %52
  call void @__release_ptc() #6
  call void @__ldso_atfork(i32 noundef %41) #6
  br label %55

43:                                               ; preds = %40, %52
  %44 = phi i64 [ 0, %40 ], [ %53, %52 ]
  %45 = getelementptr inbounds [11 x i32**], [11 x i32**]* @atfork_locks, i64 0, i64 %44
  %46 = load i32**, i32*** %45, align 8, !tbaa !11
  %47 = load i32*, i32** %46, align 8, !tbaa !11
  %48 = icmp eq i32* %47, null
  br i1 %48, label %52, label %49

49:                                               ; preds = %43
  br i1 %26, label %51, label %50

50:                                               ; preds = %49
  call void @__unlock(i32* noundef nonnull %47) #6
  br label %52

51:                                               ; preds = %49
  store volatile i32 0, i32* %47, align 4, !tbaa !16
  br label %52

52:                                               ; preds = %43, %51, %50
  %53 = add nuw nsw i64 %44, 1
  %54 = icmp eq i64 %53, 11
  br i1 %54, label %42, label %43

55:                                               ; preds = %17, %42
  call void @__restore_sigs(i8* noundef nonnull %2) #6
  %56 = icmp eq i32 %22, 0
  %57 = zext i1 %56 to i32
  call void @__fork_handler(i32 noundef %57) #6
  %58 = icmp slt i32 %22, 0
  br i1 %58, label %59, label %60

59:                                               ; preds = %55
  store i32 %24, i32* %23, align 4, !tbaa !16
  br label %60

60:                                               ; preds = %59, %55
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %2) #5
  ret i32 %22
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: optsize
declare hidden void @__block_app_sigs(i8* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden void @__inhibit_ptc() local_unnamed_addr #3

; Function Attrs: optsize
declare hidden void @__lock(i32* noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: optsize
declare i32 @_Fork() local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #4

; Function Attrs: optsize
declare hidden void @__unlock(i32* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden void @__release_ptc() local_unnamed_addr #3

; Function Attrs: optsize
declare hidden void @__restore_sigs(i8* noundef) local_unnamed_addr #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #7 = { nounwind readnone strictfp }
attributes #8 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 3}
!4 = !{!"__libc", !5, i64 0, !5, i64 1, !5, i64 2, !5, i64 3, !7, i64 4, !8, i64 8, !8, i64 16, !9, i64 24, !9, i64 32, !9, i64 40, !9, i64 48, !10, i64 56}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!"int", !5, i64 0}
!8 = !{!"any pointer", !5, i64 0}
!9 = !{!"long", !5, i64 0}
!10 = !{!"__locale_struct", !5, i64 0}
!11 = !{!8, !8, i64 0}
!12 = !{i64 261960}
!13 = !{!14, !8, i64 24}
!14 = !{!"__pthread", !8, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !9, i64 32, !9, i64 40, !7, i64 48, !7, i64 52, !7, i64 56, !7, i64 60, !5, i64 64, !5, i64 65, !5, i64 66, !5, i64 66, !8, i64 72, !9, i64 80, !8, i64 88, !9, i64 96, !9, i64 104, !8, i64 112, !8, i64 120, !8, i64 128, !15, i64 136, !7, i64 160, !7, i64 164, !8, i64 168, !5, i64 176, !8, i64 184, !8, i64 192}
!15 = !{!"", !8, i64 0, !9, i64 8, !8, i64 16}
!16 = !{!7, !7, i64 0}
!17 = !{!14, !7, i64 48}
