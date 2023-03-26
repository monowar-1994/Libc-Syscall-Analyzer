; ModuleID = 'src/thread/__wait.c'
source_filename = "src/thread/__wait.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define hidden void @__wait(i32* noundef %0, i32* noundef %1, i32 noundef %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = icmp eq i32 %3, 0
  %6 = select i1 %5, i64 0, i64 128
  %7 = icmp eq i32* %1, null
  br label %8

8:                                                ; preds = %4, %16
  %9 = phi i32 [ 99, %4 ], [ %17, %16 ]
  br i1 %7, label %13, label %10

10:                                               ; preds = %8
  %11 = load volatile i32, i32* %1, align 4, !tbaa !3
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %20

13:                                               ; preds = %8, %10
  %14 = load volatile i32, i32* %0, align 4, !tbaa !3
  %15 = icmp eq i32 %14, %2
  br i1 %15, label %16, label %38

16:                                               ; preds = %13
  tail call void asm sideeffect "pause", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !7
  %17 = add nsw i32 %9, -1
  %18 = icmp eq i32 %9, 0
  br i1 %18, label %19, label %8

19:                                               ; preds = %16
  br i1 %7, label %21, label %20

20:                                               ; preds = %10, %19
  tail call void asm sideeffect "lock ; incl $0", "=*m,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %1, i32* nonnull elementtype(i32) %1) #1, !srcloc !8
  br label %21

21:                                               ; preds = %20, %19
  %22 = phi i1 [ false, %20 ], [ true, %19 ]
  %23 = load volatile i32, i32* %0, align 4, !tbaa !3
  %24 = icmp eq i32 %23, %2
  br i1 %24, label %25, label %36

25:                                               ; preds = %21
  %26 = ptrtoint i32* %0 to i64
  %27 = sext i32 %2 to i64
  br label %28

28:                                               ; preds = %25, %33
  %29 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %26, i64 %6, i64 %27, i64 0) #1, !srcloc !9
  %30 = icmp eq i64 %29, -38
  br i1 %30, label %31, label %33

31:                                               ; preds = %28
  %32 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %26, i64 0, i64 %27, i64 0) #1, !srcloc !9
  br label %33

33:                                               ; preds = %31, %28
  %34 = load volatile i32, i32* %0, align 4, !tbaa !3
  %35 = icmp eq i32 %34, %2
  br i1 %35, label %28, label %36

36:                                               ; preds = %33, %21
  br i1 %22, label %38, label %37

37:                                               ; preds = %36
  tail call void asm sideeffect "lock ; decl $0", "=*m,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* elementtype(i32) %1, i32* elementtype(i32) %1) #1, !srcloc !10
  br label %38

38:                                               ; preds = %13, %36, %37
  ret void
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{i64 233347}
!8 = !{i64 232783}
!9 = !{i64 204555}
!10 = !{i64 232929}
