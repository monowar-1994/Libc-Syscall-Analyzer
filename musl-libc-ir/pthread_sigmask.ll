; ModuleID = 'src/thread/pthread_sigmask.c'
source_filename = "src/thread/pthread_sigmask.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__sigset_t = type { [16 x i64] }

; Function Attrs: nounwind optsize strictfp
define i32 @pthread_sigmask(i32 noundef %0, %struct.__sigset_t* noalias noundef %1, %struct.__sigset_t* noalias noundef %2) local_unnamed_addr #0 {
  %4 = icmp ne %struct.__sigset_t* %1, null
  %5 = icmp ugt i32 %0, 2
  %6 = and i1 %5, %4
  br i1 %6, label %21, label %7

7:                                                ; preds = %3
  %8 = sext i32 %0 to i64
  %9 = ptrtoint %struct.__sigset_t* %1 to i64
  %10 = ptrtoint %struct.__sigset_t* %2 to i64
  %11 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 14, i64 %8, i64 %9, i64 %10, i64 8) #1, !srcloc !3
  %12 = trunc i64 %11 to i32
  %13 = sub i32 0, %12
  %14 = icmp eq i32 %12, 0
  %15 = icmp ne %struct.__sigset_t* %2, null
  %16 = and i1 %15, %14
  br i1 %16, label %17, label %21

17:                                               ; preds = %7
  %18 = getelementptr inbounds %struct.__sigset_t, %struct.__sigset_t* %2, i64 0, i32 0, i64 0
  %19 = load i64, i64* %18, align 8, !tbaa !4
  %20 = and i64 %19, -15032385537
  store i64 %20, i64* %18, align 8, !tbaa !4
  br label %21

21:                                               ; preds = %7, %17, %3
  %22 = phi i32 [ 22, %3 ], [ 0, %17 ], [ %13, %7 ]
  ret i32 %22
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 73052}
!4 = !{!5, !5, i64 0}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
