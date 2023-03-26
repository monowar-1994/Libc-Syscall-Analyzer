; ModuleID = 'src/unistd/pipe2.c'
source_filename = "src/unistd/pipe2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @pipe2(i32* noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp eq i32 %1, 0
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  %5 = tail call i32 @pipe(i32* noundef %0) #2
  br label %42

6:                                                ; preds = %2
  %7 = ptrtoint i32* %0 to i64
  %8 = sext i32 %1 to i64
  %9 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 293, i64 %7, i64 %8) #3, !srcloc !3
  %10 = trunc i64 %9 to i32
  %11 = icmp eq i32 %10, -38
  br i1 %11, label %17, label %12

12:                                               ; preds = %6
  %13 = shl i64 %9, 32
  %14 = ashr exact i64 %13, 32
  %15 = tail call i64 @__syscall_ret(i64 noundef %14) #2
  %16 = trunc i64 %15 to i32
  br label %42

17:                                               ; preds = %6
  %18 = tail call i32 @pipe(i32* noundef %0) #2
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %42

20:                                               ; preds = %17
  %21 = and i32 %1, 524288
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %31, label %23

23:                                               ; preds = %20
  %24 = load i32, i32* %0, align 4, !tbaa !4
  %25 = sext i32 %24 to i64
  %26 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %25, i64 2, i64 1) #3, !srcloc !8
  %27 = getelementptr inbounds i32, i32* %0, i64 1
  %28 = load i32, i32* %27, align 4, !tbaa !4
  %29 = sext i32 %28 to i64
  %30 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %29, i64 2, i64 1) #3, !srcloc !8
  br label %31

31:                                               ; preds = %23, %20
  %32 = and i32 %1, 2048
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %42, label %34

34:                                               ; preds = %31
  %35 = load i32, i32* %0, align 4, !tbaa !4
  %36 = sext i32 %35 to i64
  %37 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %36, i64 4, i64 2048) #3, !srcloc !8
  %38 = getelementptr inbounds i32, i32* %0, i64 1
  %39 = load i32, i32* %38, align 4, !tbaa !4
  %40 = sext i32 %39 to i64
  %41 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %40, i64 4, i64 2048) #3, !srcloc !8
  br label %42

42:                                               ; preds = %12, %17, %34, %31, %4
  %43 = phi i32 [ %5, %4 ], [ %16, %12 ], [ %18, %17 ], [ 0, %34 ], [ 0, %31 ]
  ret i32 %43
}

; Function Attrs: optsize
declare i32 @pipe(i32* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #3 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 92183}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{i64 92395}
