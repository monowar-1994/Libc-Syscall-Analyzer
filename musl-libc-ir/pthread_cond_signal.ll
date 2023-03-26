; ModuleID = 'src/thread/pthread_cond_signal.c'
source_filename = "src/thread/pthread_cond_signal.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_cond_t = type { %union.anon }
%union.anon = type { [6 x i8*] }

; Function Attrs: nounwind optsize strictfp
define i32 @pthread_cond_signal(%struct.pthread_cond_t* noundef %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.pthread_cond_t, %struct.pthread_cond_t* %0, i64 0, i32 0, i32 0, i64 0
  %3 = load i8*, i8** %2, align 8, !tbaa !3
  %4 = icmp eq i8* %3, null
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = tail call i32 @__private_cond_signal(%struct.pthread_cond_t* noundef nonnull %0, i32 noundef 1) #2
  br label %20

7:                                                ; preds = %1
  %8 = bitcast %struct.pthread_cond_t* %0 to [12 x i32]*
  %9 = getelementptr inbounds [12 x i32], [12 x i32]* %8, i64 0, i64 3
  %10 = load volatile i32, i32* %9, align 4, !tbaa !3
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %20, label %12

12:                                               ; preds = %7
  %13 = getelementptr inbounds %struct.pthread_cond_t, %struct.pthread_cond_t* %0, i64 0, i32 0, i32 0, i64 1
  %14 = bitcast i8** %13 to i32*
  tail call void asm sideeffect "lock ; incl $0", "=*m,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %14, i32* nonnull elementtype(i32) %14) #3, !srcloc !6
  %15 = ptrtoint i8** %13 to i64
  %16 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %15, i64 1, i64 1) #3, !srcloc !7
  %17 = icmp eq i64 %16, -38
  br i1 %17, label %18, label %20

18:                                               ; preds = %12
  %19 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %15, i64 1, i64 1) #3, !srcloc !7
  br label %20

20:                                               ; preds = %18, %12, %7, %5
  %21 = phi i32 [ %6, %5 ], [ 0, %7 ], [ 0, %12 ], [ 0, %18 ]
  ret i32 %21
}

; Function Attrs: optsize
declare hidden i32 @__private_cond_signal(%struct.pthread_cond_t* noundef, i32 noundef) local_unnamed_addr #1

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
!6 = !{i64 232553}
!7 = !{i64 204055}
