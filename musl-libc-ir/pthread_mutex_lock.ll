; ModuleID = 'src/thread/pthread_mutex_lock.c'
source_filename = "src/thread/pthread_mutex_lock.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_mutex_t = type { %union.anon }
%union.anon = type { [5 x i8*] }
%struct.timespec = type { i64, i64 }

@pthread_mutex_lock = weak alias i32 (%struct.pthread_mutex_t*), i32 (%struct.pthread_mutex_t*)* @__pthread_mutex_lock

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__pthread_mutex_lock(%struct.pthread_mutex_t* noundef %0) #0 {
  %2 = bitcast %struct.pthread_mutex_t* %0 to i32*
  %3 = load i32, i32* %2, align 8, !tbaa !3
  %4 = and i32 %3, 15
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %11

6:                                                ; preds = %1
  %7 = bitcast %struct.pthread_mutex_t* %0 to [10 x i32]*
  %8 = getelementptr inbounds [10 x i32], [10 x i32]* %7, i64 0, i64 1
  %9 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %8, i32 0, i32 16) #2, !srcloc !6
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %13, label %11

11:                                               ; preds = %6, %1
  %12 = tail call i32 @__pthread_mutex_timedlock(%struct.pthread_mutex_t* noundef nonnull %0, %struct.timespec* noundef null) #3
  br label %13

13:                                               ; preds = %6, %11
  %14 = phi i32 [ %12, %11 ], [ 0, %6 ]
  ret i32 %14
}

; Function Attrs: optsize
declare hidden i32 @__pthread_mutex_timedlock(%struct.pthread_mutex_t* noundef, %struct.timespec* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind strictfp }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{i64 231198}
