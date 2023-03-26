; ModuleID = 'src/thread/pthread_mutexattr_setprotocol.c'
source_filename = "src/thread/pthread_mutexattr_setprotocol.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_mutexattr_t = type { i32 }

@check_pi_result = internal global i32 -1, align 4

; Function Attrs: nounwind optsize strictfp
define i32 @pthread_mutexattr_setprotocol(%struct.pthread_mutexattr_t* nocapture noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  switch i32 %1, label %24 [
    i32 0, label %4
    i32 1, label %8
    i32 2, label %25
  ]

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct.pthread_mutexattr_t, %struct.pthread_mutexattr_t* %0, i64 0, i32 0
  %6 = load i32, i32* %5, align 4, !tbaa !3
  %7 = and i32 %6, -9
  store i32 %7, i32* %5, align 4, !tbaa !3
  br label %25

8:                                                ; preds = %2
  %9 = load volatile i32, i32* @check_pi_result, align 4, !tbaa !8
  %10 = icmp slt i32 %9, 0
  br i1 %10, label %11, label %17

11:                                               ; preds = %8
  %12 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %12) #2
  store volatile i32 0, i32* %3, align 4, !tbaa !8
  %13 = ptrtoint i32* %3 to i64
  %14 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %13, i64 6, i64 0, i64 0) #2, !srcloc !9
  %15 = trunc i64 %14 to i32
  %16 = sub i32 0, %15
  call void asm sideeffect "mov $1, $0 ; lock ; orl $$0,(%rsp)", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) @check_pi_result, i32 %16) #2, !srcloc !10
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %12) #2
  br label %17

17:                                               ; preds = %11, %8
  %18 = phi i32 [ %16, %11 ], [ %9, %8 ]
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %25

20:                                               ; preds = %17
  %21 = getelementptr inbounds %struct.pthread_mutexattr_t, %struct.pthread_mutexattr_t* %0, i64 0, i32 0
  %22 = load i32, i32* %21, align 4, !tbaa !3
  %23 = or i32 %22, 8
  store i32 %23, i32* %21, align 4, !tbaa !3
  br label %25

24:                                               ; preds = %2
  br label %25

25:                                               ; preds = %2, %17, %24, %20, %4
  %26 = phi i32 [ 22, %24 ], [ 0, %20 ], [ 0, %4 ], [ %18, %17 ], [ 95, %2 ]
  ret i32 %26
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"", !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!5, !5, i64 0}
!9 = !{i64 204666}
!10 = !{i64 233199}
