; ModuleID = 'src/thread/pthread_rwlock_timedwrlock.c'
source_filename = "src/thread/pthread_rwlock_timedwrlock.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_rwlock_t = type { %union.anon }
%union.anon = type { [7 x i8*] }
%struct.timespec = type { i64, i64 }

@pthread_rwlock_timedwrlock = weak alias i32 (%struct.pthread_rwlock_t*, %struct.timespec*), i32 (%struct.pthread_rwlock_t*, %struct.timespec*)* @__pthread_rwlock_timedwrlock

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__pthread_rwlock_timedwrlock(%struct.pthread_rwlock_t* noalias noundef %0, %struct.timespec* noalias noundef %1) #0 {
  %3 = tail call i32 @pthread_rwlock_trywrlock(%struct.pthread_rwlock_t* noundef %0) #2
  %4 = icmp eq i32 %3, 16
  br i1 %4, label %5, label %39

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
  %20 = tail call i32 @__pthread_rwlock_trywrlock(%struct.pthread_rwlock_t* noundef nonnull %0) #2
  %21 = icmp eq i32 %20, 16
  br i1 %21, label %22, label %39

22:                                               ; preds = %19
  %23 = getelementptr inbounds %struct.pthread_rwlock_t, %struct.pthread_rwlock_t* %0, i64 0, i32 0, i32 0, i64 1
  %24 = bitcast i8** %23 to i32*
  br label %25

25:                                               ; preds = %22, %28
  %26 = load volatile i32, i32* %6, align 8, !tbaa !3
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %31

28:                                               ; preds = %25, %31
  %29 = tail call i32 @__pthread_rwlock_trywrlock(%struct.pthread_rwlock_t* noundef nonnull %0) #2
  %30 = icmp eq i32 %29, 16
  br i1 %30, label %25, label %39

31:                                               ; preds = %25
  %32 = or i32 %26, -2147483648
  tail call void asm sideeffect "lock ; incl $0", "=*m,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %8, i32* nonnull elementtype(i32) %8) #3, !srcloc !7
  %33 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %6, i32 %26, i32 %32) #3, !srcloc !8
  %34 = load i32, i32* %24, align 8, !tbaa !3
  %35 = xor i32 %34, 128
  %36 = tail call i32 @__timedwait(i32* noundef nonnull %6, i32 noundef %32, i32 noundef 0, %struct.timespec* noundef %1, i32 noundef %35) #2
  tail call void asm sideeffect "lock ; decl $0", "=*m,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %8, i32* nonnull elementtype(i32) %8) #3, !srcloc !9
  %37 = and i32 %36, -5
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %28, label %39

39:                                               ; preds = %28, %31, %19, %2
  %40 = phi i32 [ %3, %2 ], [ %20, %19 ], [ %29, %28 ], [ %36, %31 ]
  ret i32 %40
}

; Function Attrs: optsize
declare i32 @pthread_rwlock_trywrlock(%struct.pthread_rwlock_t* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i32 @__pthread_rwlock_trywrlock(%struct.pthread_rwlock_t* noundef) local_unnamed_addr #1

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
!6 = !{i64 233577}
!7 = !{i64 233013}
!8 = !{i64 231608}
!9 = !{i64 233159}
