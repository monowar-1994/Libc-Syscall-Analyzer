; ModuleID = 'src/thread/pthread_rwlock_trywrlock.c'
source_filename = "src/thread/pthread_rwlock_trywrlock.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_rwlock_t = type { %union.anon }
%union.anon = type { [7 x i8*] }

@pthread_rwlock_trywrlock = weak alias i32 (%struct.pthread_rwlock_t*), i32 (%struct.pthread_rwlock_t*)* @__pthread_rwlock_trywrlock

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__pthread_rwlock_trywrlock(%struct.pthread_rwlock_t* noundef %0) #0 {
  %2 = bitcast %struct.pthread_rwlock_t* %0 to i32*
  %3 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* elementtype(i32) %2, i32 0, i32 2147483647) #1, !srcloc !3
  %4 = icmp eq i32 %3, 0
  %5 = select i1 %4, i32 0, i32 16
  ret i32 %5
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 231147}
