; ModuleID = 'src/thread/pthread_cancel.c'
source_filename = "src/thread/pthread_cancel.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.siginfo_t = type { i32, i32, i32, %union.anon.0 }
%union.anon.0 = type { %struct.anon.1, [80 x i8] }
%struct.anon.1 = type { %union.anon.2, %union.anon.5 }
%union.anon.2 = type { %struct.anon.3 }
%struct.anon.3 = type { i32, i32 }
%union.anon.5 = type { %struct.anon.6 }
%struct.anon.6 = type { i32, i64, i64 }
%struct.__sigset_t = type { [16 x i64] }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.sigaction = type { %union.anon, %struct.__sigset_t, i32, void ()* }
%union.anon = type { void (i32)* }

@pthread_cancel.init = internal unnamed_addr global i1 false, align 4
@__const.init_cancellation.sa = private unnamed_addr constant { { void (i32, %struct.siginfo_t*, i8*)* }, %struct.__sigset_t, i32, void ()* } { { void (i32, %struct.siginfo_t*, i8*)* } { void (i32, %struct.siginfo_t*, i8*)* @cancel_handler }, %struct.__sigset_t zeroinitializer, i32 268435460, void ()* null }, align 8
@__cp_begin = external hidden constant [1 x i8], align 1
@__cp_end = external hidden constant [1 x i8], align 1
@__cp_cancel = external hidden constant [1 x i8], align 1

; Function Attrs: nounwind optsize strictfp
define hidden i64 @__cancel() local_unnamed_addr #0 {
  %1 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !3
  %2 = inttoptr i64 %1 to %struct.__pthread*
  %3 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %2, i64 0, i32 10
  %4 = load volatile i8, i8* %3, align 8, !tbaa !4
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %10, label %6

6:                                                ; preds = %0
  %7 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %2, i64 0, i32 11
  %8 = load volatile i8, i8* %7, align 1, !tbaa !12
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %11, label %10

10:                                               ; preds = %6, %0
  tail call void @pthread_exit(i8* noundef nonnull inttoptr (i64 -1 to i8*)) #7
  unreachable

11:                                               ; preds = %6
  store volatile i8 1, i8* %3, align 8, !tbaa !4
  ret i64 -125
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: noreturn optsize
declare void @pthread_exit(i8* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define hidden i64 @__syscall_cp_c(i64 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6) local_unnamed_addr #0 {
  %8 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !3
  %9 = inttoptr i64 %8 to %struct.__pthread*
  %10 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %9, i64 0, i32 10
  %11 = load volatile i8, i8* %10, align 8, !tbaa !4
  %12 = icmp eq i8 %11, 0
  br i1 %12, label %19, label %13

13:                                               ; preds = %7
  %14 = icmp eq i8 %11, 1
  %15 = icmp eq i64 %0, 3
  %16 = or i1 %15, %14
  br i1 %16, label %17, label %19

17:                                               ; preds = %13
  %18 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},{r8},{r9},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6) #8, !srcloc !13
  br label %41

19:                                               ; preds = %13, %7
  %20 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %9, i64 0, i32 9
  %21 = bitcast i32* %20 to i8*
  %22 = tail call i64 @__syscall_cp_asm(i8* noundef nonnull %21, i64 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6) #9
  %23 = icmp eq i64 %22, -4
  %24 = icmp ne i64 %0, 3
  %25 = and i1 %24, %23
  br i1 %25, label %26, label %41

26:                                               ; preds = %19
  %27 = load volatile i32, i32* %20, align 4, !tbaa !14
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %41, label %29

29:                                               ; preds = %26
  %30 = load volatile i8, i8* %10, align 8, !tbaa !4
  %31 = icmp eq i8 %30, 1
  br i1 %31, label %41, label %32

32:                                               ; preds = %29
  %33 = load volatile i8, i8* %10, align 8, !tbaa !4
  %34 = icmp eq i8 %33, 0
  br i1 %34, label %39, label %35

35:                                               ; preds = %32
  %36 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %9, i64 0, i32 11
  %37 = load volatile i8, i8* %36, align 1, !tbaa !12
  %38 = icmp eq i8 %37, 0
  br i1 %38, label %40, label %39

39:                                               ; preds = %35, %32
  tail call void @pthread_exit(i8* noundef nonnull inttoptr (i64 -1 to i8*)) #7
  unreachable

40:                                               ; preds = %35
  store volatile i8 1, i8* %10, align 8, !tbaa !4
  br label %41

41:                                               ; preds = %19, %26, %29, %40, %17
  %42 = phi i64 [ %18, %17 ], [ -125, %40 ], [ -4, %29 ], [ -4, %26 ], [ %22, %19 ]
  ret i64 %42
}

; Function Attrs: optsize
declare hidden i64 @__syscall_cp_asm(i8* noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: nounwind optsize strictfp
define hidden void @__testcancel() local_unnamed_addr #0 {
  %1 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !3
  %2 = inttoptr i64 %1 to %struct.__pthread*
  %3 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %2, i64 0, i32 9
  %4 = load volatile i32, i32* %3, align 4, !tbaa !14
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %19, label %6

6:                                                ; preds = %0
  %7 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %2, i64 0, i32 10
  %8 = load volatile i8, i8* %7, align 8, !tbaa !4
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %10, label %19

10:                                               ; preds = %6
  %11 = load volatile i8, i8* %7, align 8, !tbaa !4
  %12 = icmp eq i8 %11, 0
  br i1 %12, label %17, label %13

13:                                               ; preds = %10
  %14 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %2, i64 0, i32 11
  %15 = load volatile i8, i8* %14, align 1, !tbaa !12
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %18, label %17

17:                                               ; preds = %13, %10
  tail call void @pthread_exit(i8* noundef nonnull inttoptr (i64 -1 to i8*)) #7
  unreachable

18:                                               ; preds = %13
  store volatile i8 1, i8* %7, align 8, !tbaa !4
  br label %19

19:                                               ; preds = %18, %6, %0
  ret void
}

; Function Attrs: nounwind optsize strictfp
define i32 @pthread_cancel(%struct.__pthread* noundef %0) local_unnamed_addr #0 {
  %2 = alloca %struct.sigaction, align 8
  %3 = load i1, i1* @pthread_cancel.init, align 4
  br i1 %3, label %10, label %4

4:                                                ; preds = %1
  %5 = bitcast %struct.sigaction* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 152, i8* nonnull %5) #8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(152) %5, i8* noundef nonnull align 8 dereferenceable(152) bitcast ({ { void (i32, %struct.siginfo_t*, i8*)* }, %struct.__sigset_t, i32, void ()* }* @__const.init_cancellation.sa to i8*), i64 152, i1 false) #8
  %6 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %2, i64 0, i32 1
  %7 = bitcast %struct.__sigset_t* %6 to i8*
  %8 = call i8* @memset(i8* noundef nonnull %7, i32 noundef -1, i64 noundef 8) #9
  %9 = call i32 @__libc_sigaction(i32 noundef 33, %struct.sigaction* noundef nonnull %2, %struct.sigaction* noundef null) #9
  call void @llvm.lifetime.end.p0i8(i64 152, i8* nonnull %5) #8
  store i1 true, i1* @pthread_cancel.init, align 4
  br label %10

10:                                               ; preds = %4, %1
  %11 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %0, i64 0, i32 9
  call void asm sideeffect "mov $1, $0 ; lock ; orl $$0,(%rsp)", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %11, i32 1) #8, !srcloc !15
  %12 = tail call %struct.__pthread* @pthread_self() #10
  %13 = icmp eq %struct.__pthread* %12, %0
  br i1 %13, label %14, label %23

14:                                               ; preds = %10
  %15 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %0, i64 0, i32 10
  %16 = load volatile i8, i8* %15, align 8, !tbaa !4
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %18, label %25

18:                                               ; preds = %14
  %19 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %0, i64 0, i32 11
  %20 = load volatile i8, i8* %19, align 1, !tbaa !12
  %21 = icmp eq i8 %20, 0
  br i1 %21, label %25, label %22

22:                                               ; preds = %18
  call void @pthread_exit(i8* noundef nonnull inttoptr (i64 -1 to i8*)) #7
  unreachable

23:                                               ; preds = %10
  %24 = call i32 @pthread_kill(%struct.__pthread* noundef %0, i32 noundef 33) #9
  br label %25

25:                                               ; preds = %14, %18, %23
  %26 = phi i32 [ %24, %23 ], [ 0, %18 ], [ 0, %14 ]
  ret i32 %26
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare %struct.__pthread* @pthread_self() local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @pthread_kill(%struct.__pthread* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: nounwind optsize strictfp
define internal void @cancel_handler(i32 noundef %0, %struct.siginfo_t* nocapture noundef readnone %1, i8* nocapture noundef %2) #0 {
  %4 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !3
  %5 = inttoptr i64 %4 to %struct.__pthread*
  %6 = getelementptr inbounds i8, i8* %2, i64 168
  %7 = bitcast i8* %6 to i64*
  %8 = load i64, i64* %7, align 8, !tbaa !16
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !18
  %9 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %5, i64 0, i32 9
  %10 = load volatile i32, i32* %9, align 4, !tbaa !14
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %34, label %12

12:                                               ; preds = %3
  %13 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %5, i64 0, i32 10
  %14 = load volatile i8, i8* %13, align 8, !tbaa !4
  %15 = icmp eq i8 %14, 1
  br i1 %15, label %34, label %16

16:                                               ; preds = %12
  %17 = getelementptr inbounds i8, i8* %2, i64 296
  %18 = bitcast i8* %17 to i64*
  %19 = load i64, i64* %18, align 8, !tbaa !19
  %20 = or i64 %19, 4294967296
  store i64 %20, i64* %18, align 8, !tbaa !19
  %21 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %5, i64 0, i32 11
  %22 = load volatile i8, i8* %21, align 1, !tbaa !12
  %23 = icmp eq i8 %22, 0
  br i1 %23, label %24, label %28

24:                                               ; preds = %16
  %25 = icmp uge i64 %8, ptrtoint ([1 x i8]* @__cp_begin to i64)
  %26 = icmp ult i64 %8, ptrtoint ([1 x i8]* @__cp_end to i64)
  %27 = and i1 %25, %26
  br i1 %27, label %28, label %29

28:                                               ; preds = %24, %16
  store i64 ptrtoint ([1 x i8]* @__cp_cancel to i64), i64* %7, align 8, !tbaa !16
  br label %34

29:                                               ; preds = %24
  %30 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %5, i64 0, i32 6
  %31 = load i32, i32* %30, align 8, !tbaa !20
  %32 = sext i32 %31 to i64
  %33 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 200, i64 %32, i64 33) #8, !srcloc !21
  br label %34

34:                                               ; preds = %3, %12, %29, %28
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden i32 @__libc_sigaction(i32 noundef, %struct.sigaction* noundef, %struct.sigaction* noundef) local_unnamed_addr #3

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { noreturn optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #6 = { nounwind readnone strictfp }
attributes #7 = { nobuiltin noreturn nounwind optsize strictfp "no-builtins" }
attributes #8 = { nounwind strictfp }
attributes #9 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #10 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 276840}
!4 = !{!5, !7, i64 64}
!5 = !{!"__pthread", !6, i64 0, !6, i64 8, !6, i64 16, !6, i64 24, !9, i64 32, !9, i64 40, !10, i64 48, !10, i64 52, !10, i64 56, !10, i64 60, !7, i64 64, !7, i64 65, !7, i64 66, !7, i64 66, !6, i64 72, !9, i64 80, !6, i64 88, !9, i64 96, !9, i64 104, !6, i64 112, !6, i64 120, !6, i64 128, !11, i64 136, !10, i64 160, !10, i64 164, !6, i64 168, !7, i64 176, !6, i64 184, !6, i64 192}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"long", !7, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = !{!"", !6, i64 0, !9, i64 8, !6, i64 16}
!12 = !{!5, !7, i64 65}
!13 = !{i64 251763}
!14 = !{!5, !10, i64 60}
!15 = !{i64 275526}
!16 = !{!17, !17, i64 0}
!17 = !{!"long long", !7, i64 0}
!18 = !{i64 275686}
!19 = !{!9, !9, i64 0}
!20 = !{!5, !10, i64 48}
!21 = !{i64 250572}
