; ModuleID = 'src/thread/pthread_rwlock_unlock.c'
source_filename = "src/thread/pthread_rwlock_unlock.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_rwlock_t = type { %union.anon }
%union.anon = type { [7 x i8*] }

@pthread_rwlock_unlock = weak alias i32 (%struct.pthread_rwlock_t*), i32 (%struct.pthread_rwlock_t*)* @__pthread_rwlock_unlock

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__pthread_rwlock_unlock(%struct.pthread_rwlock_t* noundef %0) #0 {
  %2 = bitcast %struct.pthread_rwlock_t* %0 to [14 x i32]*
  %3 = getelementptr inbounds %struct.pthread_rwlock_t, %struct.pthread_rwlock_t* %0, i64 0, i32 0, i32 0, i64 1
  %4 = bitcast i8** %3 to i32*
  %5 = load i32, i32* %4, align 8, !tbaa !3
  %6 = bitcast %struct.pthread_rwlock_t* %0 to i32*
  %7 = getelementptr inbounds [14 x i32], [14 x i32]* %2, i64 0, i64 1
  br label %8

8:                                                ; preds = %8, %1
  %9 = load volatile i32, i32* %6, align 8, !tbaa !3
  %10 = and i32 %9, 2147483647
  %11 = load volatile i32, i32* %7, align 4, !tbaa !3
  %12 = icmp eq i32 %10, 2147483647
  %13 = icmp eq i32 %10, 1
  %14 = or i1 %12, %13
  %15 = add nsw i32 %9, -1
  %16 = select i1 %14, i32 0, i32 %15
  %17 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %6, i32 %9, i32 %16) #1, !srcloc !6
  %18 = icmp eq i32 %17, %9
  br i1 %18, label %19, label %8

19:                                               ; preds = %8
  %20 = icmp eq i32 %16, 0
  br i1 %20, label %21, label %34

21:                                               ; preds = %19
  %22 = icmp ne i32 %11, 0
  %23 = icmp slt i32 %9, 0
  %24 = or i1 %23, %22
  br i1 %24, label %25, label %34

25:                                               ; preds = %21
  %26 = icmp eq i32 %5, 128
  %27 = ptrtoint %struct.pthread_rwlock_t* %0 to i64
  %28 = select i1 %26, i64 1, i64 129
  %29 = zext i32 %10 to i64
  %30 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %27, i64 %28, i64 %29) #1, !srcloc !7
  %31 = icmp eq i64 %30, -38
  br i1 %31, label %32, label %34

32:                                               ; preds = %25
  %33 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %27, i64 1, i64 %29) #1, !srcloc !7
  br label %34

34:                                               ; preds = %32, %25, %21, %19
  ret i32 0
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
!6 = !{i64 231396}
!7 = !{i64 204303}
