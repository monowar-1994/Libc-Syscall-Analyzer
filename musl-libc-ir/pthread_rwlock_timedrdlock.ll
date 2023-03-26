; ModuleID = 'src/thread/pthread_rwlock_timedrdlock.c'
source_filename = "src/thread/pthread_rwlock_timedrdlock.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_rwlock_t = type { %union.anon }
%union.anon = type { [7 x i8*] }
%struct.timespec = type { i64, i64 }

@pthread_rwlock_timedrdlock = weak alias i32 (%struct.pthread_rwlock_t*, %struct.timespec*), i32 (%struct.pthread_rwlock_t*, %struct.timespec*)* @__pthread_rwlock_timedrdlock

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__pthread_rwlock_timedrdlock(%struct.pthread_rwlock_t* noalias noundef %0, %struct.timespec* noalias noundef %1) #0 {
  %3 = tail call i32 @pthread_rwlock_tryrdlock(%struct.pthread_rwlock_t* noundef %0) #2
  %4 = icmp eq i32 %3, 16
  br i1 %4, label %5, label %40

5:                                                ; preds = %2
  %6 = bitcast %struct.pthread_rwlock_t* %0 to i32*
  %7 = bitcast %struct.pthread_rwlock_t* %0 to [14 x i32]*
  %8 = getelementptr inbounds [14 x i32], [14 x i32]* %7, i64 0, i64 1
  br label %9

9:                                                ; preds = %5, %16
  %10 = phi i32 [ 99, %5 ], [ %17, %16 ]
  %11 = load volatile i32, i32* %6, align 8, !tbaa !3
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %19, label %13

13:                                               ; preds = %9
  %14 = load volatile i32, i32* %8, align 4, !tbaa !3
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %19

16:                                               ; preds = %13
  tail call void asm sideeffect "pause", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !6
  %17 = add nsw i32 %10, -1
  %18 = icmp eq i32 %10, 0
  br i1 %18, label %19, label %9

19:                                               ; preds = %16, %9, %13
  %20 = tail call i32 @__pthread_rwlock_tryrdlock(%struct.pthread_rwlock_t* noundef nonnull %0) #2
  %21 = icmp eq i32 %20, 16
  br i1 %21, label %22, label %40

22:                                               ; preds = %19
  %23 = getelementptr inbounds %struct.pthread_rwlock_t, %struct.pthread_rwlock_t* %0, i64 0, i32 0, i32 0, i64 1
  %24 = bitcast i8** %23 to i32*
  br label %25

25:                                               ; preds = %22, %37
  %26 = load volatile i32, i32* %6, align 8, !tbaa !3
  %27 = and i32 %26, 2147483647
  %28 = icmp eq i32 %27, 2147483647
  br i1 %28, label %29, label %37

29:                                               ; preds = %25
  %30 = or i32 %26, -2147483648
  tail call void asm sideeffect "lock ; incl $0", "=*m,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %8, i32* nonnull elementtype(i32) %8) #3, !srcloc !7
  %31 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %6, i32 %26, i32 %30) #3, !srcloc !8
  %32 = load i32, i32* %24, align 8, !tbaa !3
  %33 = xor i32 %32, 128
  %34 = tail call i32 @__timedwait(i32* noundef nonnull %6, i32 noundef %30, i32 noundef 0, %struct.timespec* noundef %1, i32 noundef %33) #2
  tail call void asm sideeffect "lock ; decl $0", "=*m,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %8, i32* nonnull elementtype(i32) %8) #3, !srcloc !9
  %35 = and i32 %34, -5
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %40

37:                                               ; preds = %29, %25
  %38 = tail call i32 @__pthread_rwlock_tryrdlock(%struct.pthread_rwlock_t* noundef nonnull %0) #2
  %39 = icmp eq i32 %38, 16
  br i1 %39, label %25, label %40

40:                                               ; preds = %37, %29, %19, %2
  %41 = phi i32 [ %3, %2 ], [ %20, %19 ], [ %38, %37 ], [ %34, %29 ]
  ret i32 %41
}

; Function Attrs: optsize
declare i32 @pthread_rwlock_tryrdlock(%struct.pthread_rwlock_t* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i32 @__pthread_rwlock_tryrdlock(%struct.pthread_rwlock_t* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i32 @__timedwait(i32* noundef, i32 noundef, i32 noundef, %struct.timespec* noundef, i32 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #3 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{i64 233606}
!7 = !{i64 233042}
!8 = !{i64 231637}
!9 = !{i64 233188}
