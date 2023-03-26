; ModuleID = 'src/thread/sem_timedwait.c'
source_filename = "src/thread/sem_timedwait.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sem_t = type { [8 x i32] }
%struct.timespec = type { i64, i64 }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }

; Function Attrs: nounwind optsize strictfp
define i32 @sem_timedwait(%struct.sem_t* noalias noundef %0, %struct.timespec* noalias noundef %1) local_unnamed_addr #0 {
  %3 = alloca %struct.__ptcb, align 8
  tail call void @pthread_testcancel() #4
  %4 = tail call i32 @sem_trywait(%struct.sem_t* noundef %0) #4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %33, label %6

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.sem_t, %struct.sem_t* %0, i64 0, i32 0, i64 0
  %8 = getelementptr inbounds %struct.sem_t, %struct.sem_t* %0, i64 0, i32 0, i64 1
  br label %9

9:                                                ; preds = %6, %16
  %10 = phi i32 [ 99, %6 ], [ %17, %16 ]
  %11 = load volatile i32, i32* %7, align 4, !tbaa !3
  %12 = icmp slt i32 %11, 1
  br i1 %12, label %13, label %19

13:                                               ; preds = %9
  %14 = load volatile i32, i32* %8, align 4, !tbaa !3
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %19

16:                                               ; preds = %13
  tail call void asm sideeffect "pause", "~{memory},~{dirflag},~{fpsr},~{flags}"() #5, !srcloc !7
  %17 = add nsw i32 %10, -1
  %18 = icmp eq i32 %10, 0
  br i1 %18, label %19, label %9

19:                                               ; preds = %16, %9, %13
  %20 = bitcast %struct.__ptcb* %3 to i8*
  %21 = bitcast i32* %8 to i8*
  %22 = getelementptr inbounds %struct.sem_t, %struct.sem_t* %0, i64 0, i32 0, i64 2
  br label %23

23:                                               ; preds = %26, %19
  %24 = call i32 @sem_trywait(%struct.sem_t* noundef nonnull %0) #4
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %33, label %26

26:                                               ; preds = %23
  call void asm sideeffect "lock ; incl $0", "=*m,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %8, i32* nonnull elementtype(i32) %8) #5, !srcloc !8
  %27 = call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %7, i32 0, i32 -1) #5, !srcloc !9
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %20) #5
  call void @_pthread_cleanup_push(%struct.__ptcb* noundef nonnull %3, void (i8*)* noundef nonnull @cleanup, i8* noundef nonnull %21) #4
  %28 = load volatile i32, i32* %22, align 4, !tbaa !3
  %29 = call i32 @__timedwait_cp(i32* noundef nonnull %7, i32 noundef -1, i32 noundef 0, %struct.timespec* noundef %1, i32 noundef %28) #4
  call void @_pthread_cleanup_pop(%struct.__ptcb* noundef nonnull %3, i32 noundef 1) #4
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %20) #5
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %23, label %31

31:                                               ; preds = %26
  %32 = tail call i32* @___errno_location() #6
  store i32 %29, i32* %32, align 4, !tbaa !3
  br label %33

33:                                               ; preds = %23, %31, %2
  %34 = phi i32 [ 0, %2 ], [ -1, %31 ], [ 0, %23 ]
  ret i32 %34
}

; Function Attrs: optsize
declare void @pthread_testcancel() local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @sem_trywait(%struct.sem_t* noundef) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: optsize
declare void @_pthread_cleanup_push(%struct.__ptcb* noundef, void (i8*)* noundef, i8* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define internal void @cleanup(i8* noundef %0) #0 {
  %2 = bitcast i8* %0 to i32*
  tail call void asm sideeffect "lock ; decl $0", "=*m,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* elementtype(i32) %2, i32* elementtype(i32) %2) #5, !srcloc !10
  ret void
}

; Function Attrs: optsize
declare hidden i32 @__timedwait_cp(i32* noundef, i32 noundef, i32 noundef, %struct.timespec* noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare void @_pthread_cleanup_pop(%struct.__ptcb* noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nounwind strictfp }
attributes #6 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{i64 262878}
!8 = !{i64 262314}
!9 = !{i64 260909}
!10 = !{i64 262460}
