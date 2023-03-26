; ModuleID = 'src/signal/sigaction.c'
source_filename = "src/signal/sigaction.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.sigaction = type { %union.anon, %struct.__sigset_t, i32, void ()* }
%union.anon = type { void (i32)* }
%struct.__sigset_t = type { [16 x i64] }
%struct.k_sigaction = type { void (i32)*, i64, void ()*, [2 x i32] }

@handler_set = internal global [1 x i64] zeroinitializer, align 8
@__libc = external hidden local_unnamed_addr global %struct.__libc, align 8
@unmask_done = internal unnamed_addr global i1 false, align 4
@__eintr_valid_flag = hidden global i32 0, align 4
@__abort_lock = external hidden global [1 x i32], align 4

@sigaction = weak alias i32 (i32, %struct.sigaction*, %struct.sigaction*), i32 (i32, %struct.sigaction*, %struct.sigaction*)* @__sigaction

; Function Attrs: nounwind optsize strictfp
define hidden void @__get_handler_set(%struct.__sigset_t* noundef %0) local_unnamed_addr #0 {
  %2 = bitcast %struct.__sigset_t* %0 to i8*
  %3 = tail call i8* @memcpy(i8* noundef %2, i8* noundef bitcast ([1 x i64]* @handler_set to i8*), i64 noundef 8) #4
  ret void
}

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__libc_sigaction(i32 noundef %0, %struct.sigaction* noalias noundef %1, %struct.sigaction* noalias noundef %2) local_unnamed_addr #0 {
  %4 = alloca %struct.k_sigaction, align 8
  %5 = alloca %struct.k_sigaction, align 8
  %6 = alloca [1 x i64], align 8
  %7 = bitcast %struct.k_sigaction* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %7) #5
  %8 = bitcast %struct.k_sigaction* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %8) #5
  %9 = icmp eq %struct.sigaction* %1, null
  br i1 %9, label %50, label %10

10:                                               ; preds = %3
  %11 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %1, i64 0, i32 0, i32 0
  %12 = load void (i32)*, void (i32)** %11, align 8, !tbaa !3
  %13 = icmp ugt void (i32)* %12, inttoptr (i64 1 to void (i32)*)
  br i1 %13, label %14, label %35

14:                                               ; preds = %10
  %15 = add nsw i32 %0, -1
  %16 = sext i32 %15 to i64
  %17 = lshr i64 %16, 6
  %18 = getelementptr inbounds [1 x i64], [1 x i64]* @handler_set, i64 0, i64 %17
  %19 = and i64 %16, 63
  %20 = shl nuw i64 1, %19
  tail call void asm sideeffect "lock ; or $1, $0", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull elementtype(i64) %18, i64 %20) #5, !srcloc !6
  %21 = load i8, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 1), align 1, !tbaa !7
  %22 = icmp ne i8 %21, 0
  %23 = load i1, i1* @unmask_done, align 4
  %24 = select i1 %22, i1 true, i1 %23
  br i1 %24, label %29, label %25

25:                                               ; preds = %14
  %26 = getelementptr inbounds [1 x i64], [1 x i64]* %6, i64 0, i64 0
  store i64 12884901888, i64* %26, align 8, !tbaa !13
  %27 = ptrtoint [1 x i64]* %6 to i64
  %28 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 14, i64 1, i64 %27, i64 0, i64 8) #5, !srcloc !14
  store i1 true, i1* @unmask_done, align 4
  br label %29

29:                                               ; preds = %25, %14
  %30 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %1, i64 0, i32 2
  %31 = load i32, i32* %30, align 8, !tbaa !15
  %32 = and i32 %31, 268435456
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %35

34:                                               ; preds = %29
  call void asm sideeffect "mov $1, $0 ; lock ; orl $$0,(%rsp)", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) @__eintr_valid_flag, i32 1) #5, !srcloc !18
  br label %35

35:                                               ; preds = %29, %34, %10
  %36 = load void (i32)*, void (i32)** %11, align 8, !tbaa !3
  %37 = getelementptr inbounds %struct.k_sigaction, %struct.k_sigaction* %4, i64 0, i32 0
  store void (i32)* %36, void (i32)** %37, align 8, !tbaa !19
  %38 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %1, i64 0, i32 2
  %39 = load i32, i32* %38, align 8, !tbaa !15
  %40 = or i32 %39, 67108864
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds %struct.k_sigaction, %struct.k_sigaction* %4, i64 0, i32 1
  store i64 %41, i64* %42, align 8, !tbaa !21
  %43 = getelementptr inbounds %struct.k_sigaction, %struct.k_sigaction* %4, i64 0, i32 2
  store void ()* bitcast (void (...)* @__restore_rt to void ()*), void ()** %43, align 8, !tbaa !22
  %44 = getelementptr inbounds %struct.k_sigaction, %struct.k_sigaction* %4, i64 0, i32 3
  %45 = bitcast [2 x i32]* %44 to i8*
  %46 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %1, i64 0, i32 1
  %47 = bitcast %struct.__sigset_t* %46 to i8*
  %48 = call i8* @memcpy(i8* noundef nonnull %45, i8* noundef nonnull %47, i64 noundef 8) #4
  %49 = ptrtoint %struct.k_sigaction* %4 to i64
  br label %50

50:                                               ; preds = %35, %3
  %51 = phi i64 [ %49, %35 ], [ 0, %3 ]
  %52 = sext i32 %0 to i64
  %53 = icmp eq %struct.sigaction* %2, null
  %54 = ptrtoint %struct.k_sigaction* %5 to i64
  %55 = select i1 %53, i64 0, i64 %54
  %56 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 13, i64 %52, i64 %51, i64 %55, i64 8) #5, !srcloc !14
  %57 = trunc i64 %56 to i32
  %58 = icmp ne i32 %57, 0
  %59 = select i1 %53, i1 true, i1 %58
  br i1 %59, label %73, label %60

60:                                               ; preds = %50
  %61 = getelementptr inbounds %struct.k_sigaction, %struct.k_sigaction* %5, i64 0, i32 0
  %62 = load void (i32)*, void (i32)** %61, align 8, !tbaa !19
  %63 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %2, i64 0, i32 0, i32 0
  store void (i32)* %62, void (i32)** %63, align 8, !tbaa !3
  %64 = getelementptr inbounds %struct.k_sigaction, %struct.k_sigaction* %5, i64 0, i32 1
  %65 = load i64, i64* %64, align 8, !tbaa !21
  %66 = trunc i64 %65 to i32
  %67 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %2, i64 0, i32 2
  store i32 %66, i32* %67, align 8, !tbaa !15
  %68 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %2, i64 0, i32 1
  %69 = bitcast %struct.__sigset_t* %68 to i8*
  %70 = getelementptr inbounds %struct.k_sigaction, %struct.k_sigaction* %5, i64 0, i32 3
  %71 = bitcast [2 x i32]* %70 to i8*
  %72 = call i8* @memcpy(i8* noundef nonnull %69, i8* noundef nonnull %71, i64 noundef 8) #4
  br label %73

73:                                               ; preds = %60, %50
  %74 = shl i64 %56, 32
  %75 = ashr exact i64 %74, 32
  %76 = call i64 @__syscall_ret(i64 noundef %75) #4
  %77 = trunc i64 %76 to i32
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %8) #5
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %7) #5
  ret i32 %77
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: optsize
declare hidden void @__restore_rt(...) #1

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__sigaction(i32 noundef %0, %struct.sigaction* noalias noundef %1, %struct.sigaction* noalias noundef %2) #0 {
  %4 = alloca [1 x i64], align 8
  %5 = bitcast [1 x i64]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %5) #5
  %6 = add i32 %0, -32
  %7 = icmp ult i32 %6, 3
  %8 = add i32 %0, -65
  %9 = icmp ult i32 %8, -64
  %10 = or i1 %7, %9
  br i1 %10, label %11, label %13

11:                                               ; preds = %3
  %12 = tail call i32* @___errno_location() #6
  store i32 22, i32* %12, align 4, !tbaa !23
  br label %19

13:                                               ; preds = %3
  %14 = icmp eq i32 %0, 6
  br i1 %14, label %17, label %15

15:                                               ; preds = %13
  %16 = tail call i32 @__libc_sigaction(i32 noundef %0, %struct.sigaction* noundef %1, %struct.sigaction* noundef %2) #7
  br label %19

17:                                               ; preds = %13
  call void @__block_all_sigs(i8* noundef nonnull %5) #4
  call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @__abort_lock, i64 0, i64 0)) #4
  %18 = call i32 @__libc_sigaction(i32 noundef 6, %struct.sigaction* noundef %1, %struct.sigaction* noundef %2) #7
  call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @__abort_lock, i64 0, i64 0)) #4
  call void @__restore_sigs(i8* noundef nonnull %5) #4
  br label %19

19:                                               ; preds = %15, %17, %11
  %20 = phi i32 [ -1, %11 ], [ %18, %17 ], [ %16, %15 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %5) #5
  ret i32 %20
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare hidden void @__block_all_sigs(i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__lock(i32* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__unlock(i32* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__restore_sigs(i8* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nounwind strictfp }
attributes #6 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #7 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{i64 249690}
!7 = !{!8, !4, i64 1}
!8 = !{!"__libc", !4, i64 0, !4, i64 1, !4, i64 2, !4, i64 3, !9, i64 4, !10, i64 8, !10, i64 16, !11, i64 24, !11, i64 32, !11, i64 40, !11, i64 48, !12, i64 56}
!9 = !{!"int", !4, i64 0}
!10 = !{!"any pointer", !4, i64 0}
!11 = !{!"long", !4, i64 0}
!12 = !{!"__locale_struct", !4, i64 0}
!13 = !{!11, !11, i64 0}
!14 = !{i64 90086}
!15 = !{!16, !9, i64 136}
!16 = !{!"sigaction", !4, i64 0, !17, i64 8, !9, i64 136, !10, i64 144}
!17 = !{!"__sigset_t", !4, i64 0}
!18 = !{i64 250143}
!19 = !{!20, !10, i64 0}
!20 = !{!"k_sigaction", !10, i64 0, !11, i64 8, !10, i64 16, !4, i64 24}
!21 = !{!20, !11, i64 8}
!22 = !{!20, !10, i64 16}
!23 = !{!9, !9, i64 0}
