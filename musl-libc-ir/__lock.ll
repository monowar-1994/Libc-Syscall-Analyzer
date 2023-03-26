; ModuleID = 'src/thread/__lock.c'
source_filename = "src/thread/__lock.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque

@__libc = external hidden global %struct.__libc, align 8

; Function Attrs: nounwind optsize strictfp
define void @__lock(i32* noundef %0) local_unnamed_addr #0 {
  %2 = load volatile i8, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 3), align 1, !tbaa !3
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %42, label %4

4:                                                ; preds = %1
  %5 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* elementtype(i32) %0, i32 0, i32 -2147483647) #1, !srcloc !11
  %6 = icmp slt i8 %2, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %4
  store volatile i8 0, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 3), align 1, !tbaa !3
  br label %8

8:                                                ; preds = %7, %4
  %9 = icmp eq i32 %5, 0
  br i1 %9, label %42, label %13

10:                                               ; preds = %13
  %11 = add nuw nsw i32 %15, 1
  %12 = icmp eq i32 %11, 10
  br i1 %12, label %22, label %13

13:                                               ; preds = %8, %10
  %14 = phi i32 [ %20, %10 ], [ %5, %8 ]
  %15 = phi i32 [ %11, %10 ], [ 0, %8 ]
  %16 = icmp slt i32 %14, 0
  %17 = add nsw i32 %14, 2147483647
  %18 = select i1 %16, i32 %17, i32 %14
  %19 = add nsw i32 %18, -2147483647
  %20 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* elementtype(i32) %0, i32 %18, i32 %19) #1, !srcloc !11
  %21 = icmp eq i32 %20, %18
  br i1 %21, label %42, label %10

22:                                               ; preds = %10
  %23 = tail call i32 asm sideeffect "lock ; xadd $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* elementtype(i32) %0, i32 1) #1, !srcloc !12
  %24 = add nsw i32 %23, 1
  %25 = ptrtoint i32* %0 to i64
  br label %26

26:                                               ; preds = %37, %22
  %27 = phi i32 [ %24, %22 ], [ %40, %37 ]
  %28 = icmp slt i32 %27, 0
  br i1 %28, label %29, label %37

29:                                               ; preds = %26
  %30 = sext i32 %27 to i64
  %31 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %25, i64 128, i64 %30, i64 0) #1, !srcloc !13
  %32 = icmp eq i64 %31, -38
  br i1 %32, label %33, label %35

33:                                               ; preds = %29
  %34 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %25, i64 0, i64 %30, i64 0) #1, !srcloc !13
  br label %35

35:                                               ; preds = %29, %33
  %36 = add nsw i32 %27, 2147483647
  br label %37

37:                                               ; preds = %35, %26
  %38 = phi i32 [ %36, %35 ], [ %27, %26 ]
  %39 = or i32 %38, -2147483648
  %40 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* elementtype(i32) %0, i32 %38, i32 %39) #1, !srcloc !11
  %41 = icmp eq i32 %40, %38
  br i1 %41, label %42, label %26

42:                                               ; preds = %13, %37, %8, %1
  ret void
}

; Function Attrs: nounwind optsize strictfp
define void @__unlock(i32* noundef %0) local_unnamed_addr #0 {
  %2 = load volatile i32, i32* %0, align 4, !tbaa !14
  %3 = icmp slt i32 %2, 0
  br i1 %3, label %4, label %13

4:                                                ; preds = %1
  %5 = tail call i32 asm sideeffect "lock ; xadd $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %0, i32 2147483647) #1, !srcloc !12
  %6 = icmp eq i32 %5, -2147483647
  br i1 %6, label %13, label %7

7:                                                ; preds = %4
  %8 = ptrtoint i32* %0 to i64
  %9 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %8, i64 129, i64 1) #1, !srcloc !15
  %10 = icmp eq i64 %9, -38
  br i1 %10, label %11, label %13

11:                                               ; preds = %7
  %12 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %8, i64 1, i64 1) #1, !srcloc !15
  br label %13

13:                                               ; preds = %11, %7, %4, %1
  ret void
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 3}
!4 = !{!"__libc", !5, i64 0, !5, i64 1, !5, i64 2, !5, i64 3, !7, i64 4, !8, i64 8, !8, i64 16, !9, i64 24, !9, i64 32, !9, i64 40, !9, i64 48, !10, i64 56}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!"int", !5, i64 0}
!8 = !{!"any pointer", !5, i64 0}
!9 = !{!"long", !5, i64 0}
!10 = !{!"__locale_struct", !5, i64 0}
!11 = !{i64 232869}
!12 = !{i64 233455}
!13 = !{i64 206046}
!14 = !{!7, !7, i64 0}
!15 = !{i64 205776}
