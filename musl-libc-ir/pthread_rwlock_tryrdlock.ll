; ModuleID = 'src/thread/pthread_rwlock_tryrdlock.c'
source_filename = "src/thread/pthread_rwlock_tryrdlock.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_rwlock_t = type { %union.anon }
%union.anon = type { [7 x i8*] }

@pthread_rwlock_tryrdlock = weak alias i32 (%struct.pthread_rwlock_t*), i32 (%struct.pthread_rwlock_t*)* @__pthread_rwlock_tryrdlock

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__pthread_rwlock_tryrdlock(%struct.pthread_rwlock_t* noundef %0) #0 {
  %2 = bitcast %struct.pthread_rwlock_t* %0 to i32*
  br label %3

3:                                                ; preds = %6, %1
  %4 = load volatile i32, i32* %2, align 8, !tbaa !3
  %5 = and i32 %4, 2147483647
  switch i32 %5, label %6 [
    i32 2147483647, label %10
    i32 2147483646, label %12
  ]

6:                                                ; preds = %3
  %7 = add nsw i32 %4, 1
  %8 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %2, i32 %4, i32 %7) #1, !srcloc !6
  %9 = icmp eq i32 %8, %4
  br i1 %9, label %10, label %3

10:                                               ; preds = %3, %6
  %11 = phi i32 [ 0, %6 ], [ 16, %3 ]
  br label %12

12:                                               ; preds = %3, %10
  %13 = phi i32 [ %11, %10 ], [ 11, %3 ]
  ret i32 %13
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{i64 231291}
