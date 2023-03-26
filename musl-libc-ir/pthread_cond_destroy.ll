; ModuleID = 'src/thread/pthread_cond_destroy.c'
source_filename = "src/thread/pthread_cond_destroy.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_cond_t = type { %union.anon }
%union.anon = type { [6 x i8*] }

; Function Attrs: nounwind optsize strictfp
define i32 @pthread_cond_destroy(%struct.pthread_cond_t* noundef %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.pthread_cond_t, %struct.pthread_cond_t* %0, i64 0, i32 0, i32 0, i64 0
  %3 = load i8*, i8** %2, align 8, !tbaa !3
  %4 = icmp eq i8* %3, null
  br i1 %4, label %27, label %5

5:                                                ; preds = %1
  %6 = bitcast %struct.pthread_cond_t* %0 to [12 x i32]*
  %7 = getelementptr inbounds [12 x i32], [12 x i32]* %6, i64 0, i64 3
  %8 = load volatile i32, i32* %7, align 4, !tbaa !3
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %27, label %10

10:                                               ; preds = %5
  tail call void asm sideeffect "lock ; or $1, $0", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %7, i32 -2147483648) #2, !srcloc !6
  %11 = getelementptr inbounds %struct.pthread_cond_t, %struct.pthread_cond_t* %0, i64 0, i32 0, i32 0, i64 1
  %12 = bitcast i8** %11 to i32*
  tail call void asm sideeffect "lock ; incl $0", "=*m,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %12, i32* nonnull elementtype(i32) %12) #2, !srcloc !7
  %13 = ptrtoint i8** %11 to i64
  %14 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %13, i64 1, i64 2147483647) #2, !srcloc !8
  %15 = icmp eq i64 %14, -38
  br i1 %15, label %16, label %18

16:                                               ; preds = %10
  %17 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %13, i64 1, i64 2147483647) #2, !srcloc !8
  br label %18

18:                                               ; preds = %10, %16
  %19 = load volatile i32, i32* %7, align 4, !tbaa !3
  %20 = and i32 %19, 2147483647
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %27, label %22

22:                                               ; preds = %18, %22
  %23 = phi i32 [ %24, %22 ], [ %19, %18 ]
  tail call void @__wait(i32* noundef nonnull %7, i32* noundef null, i32 noundef %23, i32 noundef 0) #3
  %24 = load volatile i32, i32* %7, align 4, !tbaa !3
  %25 = and i32 %24, 2147483647
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %22

27:                                               ; preds = %22, %18, %5, %1
  ret i32 0
}

; Function Attrs: optsize
declare hidden void @__wait(i32* noundef, i32* noundef, i32 noundef, i32 noundef) local_unnamed_addr #1

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
!6 = !{i64 232150}
!7 = !{i64 232641}
!8 = !{i64 204143}
