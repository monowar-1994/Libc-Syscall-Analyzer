; ModuleID = 'src/mq/mq_notify.c'
source_filename = "src/mq/mq_notify.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sigevent = type { %union.sigval, i32, i32, %union.anon }
%union.sigval = type { i8* }
%union.anon = type { %struct.anon, [32 x i8] }
%struct.anon = type { void (i8*)*, %struct.pthread_attr_t* }
%struct.pthread_attr_t = type { %union.anon.0 }
%union.anon.0 = type { [7 x i64] }
%struct.args = type { %struct.pthread_barrier_t, i32, %struct.sigevent* }
%struct.pthread_barrier_t = type { %union.anon.1 }
%union.anon.1 = type { [4 x i8*] }
%struct.__pthread = type opaque
%struct.pthread_barrierattr_t = type { i32 }

@mq_notify.zeros = internal constant [32 x i8] zeroinitializer, align 16

; Function Attrs: nounwind optsize strictfp
define i32 @mq_notify(i32 noundef %0, %struct.sigevent* noundef %1) local_unnamed_addr #0 {
  %3 = alloca %struct.args, align 8
  %4 = alloca %struct.pthread_attr_t, align 8
  %5 = alloca %struct.__pthread*, align 8
  %6 = alloca %struct.sigevent, align 8
  %7 = bitcast %struct.args* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %7) #6
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(48) %7, i8 0, i64 40, i1 false) #7
  %8 = getelementptr inbounds %struct.args, %struct.args* %3, i64 0, i32 2
  store %struct.sigevent* %1, %struct.sigevent** %8, align 8, !tbaa !3
  %9 = bitcast %struct.pthread_attr_t* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %9) #6
  %10 = bitcast %struct.__pthread** %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %10) #6
  %11 = bitcast %struct.sigevent* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %11) #6
  %12 = icmp eq %struct.sigevent* %1, null
  br i1 %12, label %17, label %13

13:                                               ; preds = %2
  %14 = getelementptr inbounds %struct.sigevent, %struct.sigevent* %1, i64 0, i32 2
  %15 = load i32, i32* %14, align 4, !tbaa !10
  %16 = icmp eq i32 %15, 2
  br i1 %16, label %23, label %17

17:                                               ; preds = %13, %2
  %18 = sext i32 %0 to i64
  %19 = ptrtoint %struct.sigevent* %1 to i64
  %20 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 244, i64 %18, i64 %19) #6, !srcloc !12
  %21 = tail call i64 @__syscall_ret(i64 noundef %20) #8
  %22 = trunc i64 %21 to i32
  br label %61

23:                                               ; preds = %13
  %24 = tail call i32 @socket(i32 noundef 16, i32 noundef 524291, i32 noundef 0) #8
  %25 = icmp slt i32 %24, 0
  br i1 %25, label %61, label %26

26:                                               ; preds = %23
  %27 = getelementptr inbounds %struct.args, %struct.args* %3, i64 0, i32 1
  store i32 %24, i32* %27, align 8, !tbaa !13
  %28 = getelementptr inbounds %struct.sigevent, %struct.sigevent* %1, i64 0, i32 3, i32 0, i32 1
  %29 = load %struct.pthread_attr_t*, %struct.pthread_attr_t** %28, align 8, !tbaa !14
  %30 = icmp eq %struct.pthread_attr_t* %29, null
  br i1 %30, label %33, label %31

31:                                               ; preds = %26
  %32 = bitcast %struct.pthread_attr_t* %29 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 %9, i8* align 8 %32, i64 56, i1 true) #7, !tbaa.struct !15
  br label %35

33:                                               ; preds = %26
  %34 = call i32 @pthread_attr_init(%struct.pthread_attr_t* noundef nonnull %4) #8
  br label %35

35:                                               ; preds = %33, %31
  %36 = call i32 @pthread_attr_setdetachstate(%struct.pthread_attr_t* noundef nonnull %4, i32 noundef 1) #8
  %37 = getelementptr inbounds %struct.args, %struct.args* %3, i64 0, i32 0
  %38 = call i32 @pthread_barrier_init(%struct.pthread_barrier_t* noundef nonnull %37, %struct.pthread_barrierattr_t* noundef null, i32 noundef 2) #8
  %39 = call i32 @pthread_create(%struct.__pthread** noundef nonnull %5, %struct.pthread_attr_t* noundef nonnull %4, i8* (i8*)* noundef nonnull @start, i8* noundef nonnull %7) #8
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %45, label %41

41:                                               ; preds = %35
  %42 = zext i32 %24 to i64
  %43 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 3, i64 %42) #6, !srcloc !16
  %44 = tail call i32* @___errno_location() #9
  store i32 11, i32* %44, align 4, !tbaa !17
  br label %61

45:                                               ; preds = %35
  %46 = call i32 @pthread_barrier_wait(%struct.pthread_barrier_t* noundef nonnull %37) #8
  %47 = call i32 @pthread_barrier_destroy(%struct.pthread_barrier_t* noundef nonnull %37) #8
  %48 = getelementptr inbounds %struct.sigevent, %struct.sigevent* %6, i64 0, i32 2
  store i32 2, i32* %48, align 4, !tbaa !10
  %49 = getelementptr inbounds %struct.sigevent, %struct.sigevent* %6, i64 0, i32 1
  store i32 %24, i32* %49, align 8, !tbaa !18
  %50 = getelementptr inbounds %struct.sigevent, %struct.sigevent* %6, i64 0, i32 0, i32 0
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @mq_notify.zeros, i64 0, i64 0), i8** %50, align 8, !tbaa !14
  %51 = sext i32 %0 to i64
  %52 = ptrtoint %struct.sigevent* %6 to i64
  %53 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 244, i64 %51, i64 %52) #6, !srcloc !12
  %54 = call i64 @__syscall_ret(i64 noundef %53) #8
  %55 = icmp slt i64 %54, 0
  br i1 %55, label %56, label %61

56:                                               ; preds = %45
  %57 = load %struct.__pthread*, %struct.__pthread** %5, align 8, !tbaa !19
  %58 = call i32 @pthread_cancel(%struct.__pthread* noundef %57) #8
  %59 = zext i32 %24 to i64
  %60 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 3, i64 %59) #6, !srcloc !16
  br label %61

61:                                               ; preds = %45, %23, %56, %41, %17
  %62 = phi i32 [ %22, %17 ], [ -1, %41 ], [ -1, %56 ], [ -1, %23 ], [ 0, %45 ]
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %11) #6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %10) #6
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %9) #6
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %7) #6
  ret i32 %62
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: optsize
declare i32 @pthread_attr_init(%struct.pthread_attr_t* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @pthread_attr_setdetachstate(%struct.pthread_attr_t* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @pthread_barrier_init(%struct.pthread_barrier_t* noundef, %struct.pthread_barrierattr_t* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @pthread_create(%struct.__pthread** noundef, %struct.pthread_attr_t* noundef, i8* (i8*)* noundef, i8* noundef) local_unnamed_addr #3

; Function Attrs: nounwind optsize strictfp
define internal i8* @start(i8* noundef %0) #0 {
  %2 = alloca [32 x i8], align 16
  %3 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %3) #6
  %4 = getelementptr inbounds i8, i8* %0, i64 32
  %5 = bitcast i8* %4 to i32*
  %6 = load i32, i32* %5, align 8, !tbaa !13
  %7 = getelementptr inbounds i8, i8* %0, i64 40
  %8 = bitcast i8* %7 to %struct.sigevent**
  %9 = load %struct.sigevent*, %struct.sigevent** %8, align 8, !tbaa !3
  %10 = getelementptr inbounds %struct.sigevent, %struct.sigevent* %9, i64 0, i32 3, i32 0, i32 0
  %11 = load void (i8*)*, void (i8*)** %10, align 8, !tbaa !14
  %12 = getelementptr inbounds %struct.sigevent, %struct.sigevent* %9, i64 0, i32 0, i32 0
  %13 = load i8*, i8** %12, align 8, !tbaa.struct !20
  %14 = bitcast i8* %0 to %struct.pthread_barrier_t*
  %15 = tail call i32 @pthread_barrier_wait(%struct.pthread_barrier_t* noundef %14) #8
  %16 = call i64 @recv(i32 noundef %6, i8* noundef nonnull %3, i64 noundef 32, i32 noundef 16640) #8
  %17 = call i32 @close(i32 noundef %6) #8
  %18 = icmp eq i64 %16, 32
  %19 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 31
  %20 = load i8, i8* %19, align 1
  %21 = icmp eq i8 %20, 1
  %22 = select i1 %18, i1 %21, i1 false
  br i1 %22, label %23, label %24

23:                                               ; preds = %1
  call void %11(i8* %13) #8
  br label %24

24:                                               ; preds = %23, %1
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %3) #6
  ret i8* null
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #5

; Function Attrs: optsize
declare i32 @pthread_barrier_wait(%struct.pthread_barrier_t* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @pthread_barrier_destroy(%struct.pthread_barrier_t* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @pthread_cancel(%struct.__pthread* noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i64 @recv(i32 noundef, i8* noundef, i64 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @close(i32 noundef) local_unnamed_addr #3

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #5 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind strictfp }
attributes #7 = { strictfp }
attributes #8 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #9 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !9, i64 40}
!4 = !{!"args", !5, i64 0, !8, i64 32, !9, i64 40}
!5 = !{!"", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"int", !6, i64 0}
!9 = !{!"any pointer", !6, i64 0}
!10 = !{!11, !8, i64 12}
!11 = !{!"sigevent", !6, i64 0, !8, i64 8, !8, i64 12, !6, i64 16}
!12 = !{i64 191598}
!13 = !{!4, !8, i64 32}
!14 = !{!6, !6, i64 0}
!15 = !{i64 0, i64 56, !14, i64 0, i64 56, !14, i64 0, i64 56, !14}
!16 = !{i64 191412}
!17 = !{!8, !8, i64 0}
!18 = !{!11, !8, i64 8}
!19 = !{!9, !9, i64 0}
!20 = !{i64 0, i64 4, !17, i64 0, i64 8, !19}
