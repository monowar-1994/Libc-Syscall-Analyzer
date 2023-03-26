; ModuleID = 'src/thread/pthread_key_create.c'
source_filename = "src/thread/pthread_key_create.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.pthread_rwlock_t = type { %union.anon }
%union.anon = type { [7 x i8*] }
%struct.__sigset_t = type { [16 x i64] }

@__pthread_tsd_size = hidden local_unnamed_addr global i64 1024, align 8
@__pthread_tsd_main = hidden global [128 x i8*] zeroinitializer, align 16
@next_key = internal unnamed_addr global i32 0, align 4
@keys = internal unnamed_addr global [128 x void (i8*)*] zeroinitializer, align 16
@key_lock = internal global { { [14 x i32] } } zeroinitializer, align 8

@__tl_lock = weak hidden alias void (), void ()* @dummy_0
@__tl_unlock = weak hidden alias void (), void ()* @dummy_0
@pthread_key_create = weak alias i32 (i32*, void (i8*)*), i32 (i32*, void (i8*)*)* @__pthread_key_create
@pthread_key_delete = weak alias i32 (i32), i32 (i32)* @__pthread_key_delete

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal void @dummy_0() #0 {
  ret void
}

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__pthread_key_create(i32* nocapture noundef writeonly %0, void (i8*)* noundef %1) #1 {
  %3 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #4, !srcloc !3
  %4 = inttoptr i64 %3 to %struct.__pthread*
  %5 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %4, i64 0, i32 20
  %6 = load i8**, i8*** %5, align 8, !tbaa !4
  %7 = icmp eq i8** %6, null
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  store i8** getelementptr inbounds ([128 x i8*], [128 x i8*]* @__pthread_tsd_main, i64 0, i64 0), i8*** %5, align 8, !tbaa !4
  br label %9

9:                                                ; preds = %8, %2
  %10 = icmp eq void (i8*)* %1, null
  %11 = select i1 %10, void (i8*)* @nodtor, void (i8*)* %1
  %12 = tail call i32 @__pthread_rwlock_wrlock(%struct.pthread_rwlock_t* noundef bitcast ({ { [14 x i32] } }* @key_lock to %struct.pthread_rwlock_t*)) #5
  %13 = load i32, i32* @next_key, align 4, !tbaa !12
  br label %14

14:                                               ; preds = %21, %9
  %15 = phi i32 [ %13, %9 ], [ %23, %21 ]
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds [128 x void (i8*)*], [128 x void (i8*)*]* @keys, i64 0, i64 %16
  %18 = load void (i8*)*, void (i8*)** %17, align 8, !tbaa !13
  %19 = icmp eq void (i8*)* %18, null
  br i1 %19, label %20, label %21

20:                                               ; preds = %14
  store i32 %15, i32* %0, align 4, !tbaa !12
  store i32 %15, i32* @next_key, align 4, !tbaa !12
  store void (i8*)* %11, void (i8*)** %17, align 8, !tbaa !13
  br label %25

21:                                               ; preds = %14
  %22 = add i32 %15, 1
  %23 = and i32 %22, 127
  %24 = icmp eq i32 %23, %13
  br i1 %24, label %25, label %14

25:                                               ; preds = %21, %20
  %26 = phi i32 [ 0, %20 ], [ 11, %21 ]
  %27 = tail call i32 @__pthread_rwlock_unlock(%struct.pthread_rwlock_t* noundef bitcast ({ { [14 x i32] } }* @key_lock to %struct.pthread_rwlock_t*)) #5
  ret i32 %26
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal void @nodtor(i8* nocapture noundef %0) #0 {
  ret void
}

; Function Attrs: optsize
declare hidden i32 @__pthread_rwlock_wrlock(%struct.pthread_rwlock_t* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden i32 @__pthread_rwlock_unlock(%struct.pthread_rwlock_t* noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__pthread_key_delete(i32 noundef %0) #1 {
  %2 = alloca %struct.__sigset_t, align 8
  %3 = bitcast %struct.__sigset_t* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %3) #6
  %4 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #4, !srcloc !3
  %5 = inttoptr i64 %4 to %struct.__pthread*
  call void @__block_app_sigs(i8* noundef nonnull %3) #5
  %6 = call i32 @__pthread_rwlock_wrlock(%struct.pthread_rwlock_t* noundef bitcast ({ { [14 x i32] } }* @key_lock to %struct.pthread_rwlock_t*)) #5
  call void @__tl_lock() #5
  %7 = zext i32 %0 to i64
  br label %8

8:                                                ; preds = %8, %1
  %9 = phi %struct.__pthread* [ %5, %1 ], [ %14, %8 ]
  %10 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %9, i64 0, i32 20
  %11 = load i8**, i8*** %10, align 8, !tbaa !4
  %12 = getelementptr inbounds i8*, i8** %11, i64 %7
  store i8* null, i8** %12, align 8, !tbaa !13
  %13 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %9, i64 0, i32 3
  %14 = load %struct.__pthread*, %struct.__pthread** %13, align 8, !tbaa !14
  %15 = icmp eq %struct.__pthread* %14, %5
  br i1 %15, label %16, label %8

16:                                               ; preds = %8
  call void @__tl_unlock() #5
  %17 = getelementptr inbounds [128 x void (i8*)*], [128 x void (i8*)*]* @keys, i64 0, i64 %7
  store void (i8*)* null, void (i8*)** %17, align 8, !tbaa !13
  %18 = call i32 @__pthread_rwlock_unlock(%struct.pthread_rwlock_t* noundef bitcast ({ { [14 x i32] } }* @key_lock to %struct.pthread_rwlock_t*)) #5
  call void @__restore_sigs(i8* noundef nonnull %3) #5
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %3) #6
  ret i32 0
}

; Function Attrs: optsize
declare hidden void @__block_app_sigs(i8* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden void @__restore_sigs(i8* noundef) local_unnamed_addr #3

; Function Attrs: nounwind optsize strictfp
define hidden void @__pthread_tsd_run_dtors() local_unnamed_addr #1 {
  %1 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #4, !srcloc !3
  %2 = inttoptr i64 %1 to %struct.__pthread*
  %3 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %2, i64 0, i32 12
  %4 = load i8, i8* %3, align 2
  %5 = and i8 %4, 1
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %40, label %7

7:                                                ; preds = %0
  %8 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %2, i64 0, i32 20
  br label %9

9:                                                ; preds = %7, %32
  %10 = phi i32 [ 0, %7 ], [ %34, %32 ]
  %11 = tail call i32 @__pthread_rwlock_rdlock(%struct.pthread_rwlock_t* noundef bitcast ({ { [14 x i32] } }* @key_lock to %struct.pthread_rwlock_t*)) #5
  %12 = load i8, i8* %3, align 2
  %13 = and i8 %12, -2
  store i8 %13, i8* %3, align 2
  br label %14

14:                                               ; preds = %9, %29
  %15 = phi i64 [ 0, %9 ], [ %30, %29 ]
  %16 = load i8**, i8*** %8, align 8, !tbaa !4
  %17 = getelementptr inbounds i8*, i8** %16, i64 %15
  %18 = load i8*, i8** %17, align 8, !tbaa !13
  %19 = getelementptr inbounds [128 x void (i8*)*], [128 x void (i8*)*]* @keys, i64 0, i64 %15
  %20 = load void (i8*)*, void (i8*)** %19, align 8, !tbaa !13
  store i8* null, i8** %17, align 8, !tbaa !13
  %21 = icmp ne i8* %18, null
  %22 = icmp ne void (i8*)* %20, null
  %23 = select i1 %21, i1 %22, i1 false
  %24 = icmp ne void (i8*)* %20, @nodtor
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %29

26:                                               ; preds = %14
  %27 = tail call i32 @__pthread_rwlock_unlock(%struct.pthread_rwlock_t* noundef bitcast ({ { [14 x i32] } }* @key_lock to %struct.pthread_rwlock_t*)) #5
  tail call void %20(i8* noundef nonnull %18) #5
  %28 = tail call i32 @__pthread_rwlock_rdlock(%struct.pthread_rwlock_t* noundef bitcast ({ { [14 x i32] } }* @key_lock to %struct.pthread_rwlock_t*)) #5
  br label %29

29:                                               ; preds = %26, %14
  %30 = add nuw nsw i64 %15, 1
  %31 = icmp eq i64 %30, 128
  br i1 %31, label %32, label %14

32:                                               ; preds = %29
  %33 = tail call i32 @__pthread_rwlock_unlock(%struct.pthread_rwlock_t* noundef bitcast ({ { [14 x i32] } }* @key_lock to %struct.pthread_rwlock_t*)) #5
  %34 = add nuw nsw i32 %10, 1
  %35 = load i8, i8* %3, align 2
  %36 = and i8 %35, 1
  %37 = icmp ne i8 %36, 0
  %38 = icmp ult i32 %10, 3
  %39 = select i1 %37, i1 %38, i1 false
  br i1 %39, label %9, label %40

40:                                               ; preds = %32, %0
  ret void
}

; Function Attrs: optsize
declare hidden i32 @__pthread_rwlock_rdlock(%struct.pthread_rwlock_t* noundef) local_unnamed_addr #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readnone strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 235975}
!4 = !{!5, !6, i64 128}
!5 = !{!"__pthread", !6, i64 0, !6, i64 8, !6, i64 16, !6, i64 24, !9, i64 32, !9, i64 40, !10, i64 48, !10, i64 52, !10, i64 56, !10, i64 60, !7, i64 64, !7, i64 65, !7, i64 66, !7, i64 66, !6, i64 72, !9, i64 80, !6, i64 88, !9, i64 96, !9, i64 104, !6, i64 112, !6, i64 120, !6, i64 128, !11, i64 136, !10, i64 160, !10, i64 164, !6, i64 168, !7, i64 176, !6, i64 184, !6, i64 192}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"long", !7, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = !{!"", !6, i64 0, !9, i64 8, !6, i64 16}
!12 = !{!10, !10, i64 0}
!13 = !{!6, !6, i64 0}
!14 = !{!5, !6, i64 24}
