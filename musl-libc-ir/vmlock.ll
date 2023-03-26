; ModuleID = 'src/thread/vmlock.c'
source_filename = "src/thread/vmlock.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@vmlock = internal global [2 x i32] zeroinitializer, align 4
@__vmlock_lockptr = hidden local_unnamed_addr constant i32* getelementptr inbounds ([2 x i32], [2 x i32]* @vmlock, i64 0, i64 0), align 8

; Function Attrs: nounwind optsize strictfp
define hidden void @__vm_wait() local_unnamed_addr #0 {
  %1 = load volatile i32, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @vmlock, i64 0, i64 0), align 4, !tbaa !3
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %7, label %3

3:                                                ; preds = %0, %3
  %4 = phi i32 [ %5, %3 ], [ %1, %0 ]
  tail call void @__wait(i32* noundef getelementptr inbounds ([2 x i32], [2 x i32]* @vmlock, i64 0, i64 0), i32* noundef getelementptr inbounds ([2 x i32], [2 x i32]* @vmlock, i64 0, i64 1), i32 noundef %4, i32 noundef 1) #2
  %5 = load volatile i32, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @vmlock, i64 0, i64 0), align 4, !tbaa !3
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %3

7:                                                ; preds = %3, %0
  ret void
}

; Function Attrs: optsize
declare hidden void @__wait(i32* noundef, i32* noundef, i32 noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define hidden void @__vm_lock() local_unnamed_addr #0 {
  tail call void asm sideeffect "lock ; incl $0", "=*m,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* elementtype(i32) getelementptr inbounds ([2 x i32], [2 x i32]* @vmlock, i64 0, i64 0), i32* elementtype(i32) getelementptr inbounds ([2 x i32], [2 x i32]* @vmlock, i64 0, i64 0)) #3, !srcloc !7
  ret void
}

; Function Attrs: nounwind optsize strictfp
define hidden void @__vm_unlock() local_unnamed_addr #0 {
  %1 = tail call i32 asm sideeffect "lock ; xadd $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* elementtype(i32) getelementptr inbounds ([2 x i32], [2 x i32]* @vmlock, i64 0, i64 0), i32 -1) #3, !srcloc !8
  %2 = icmp eq i32 %1, 1
  br i1 %2, label %3, label %11

3:                                                ; preds = %0
  %4 = load volatile i32, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @vmlock, i64 0, i64 1), align 4, !tbaa !3
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %11, label %6

6:                                                ; preds = %3
  %7 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 ptrtoint ([2 x i32]* @vmlock to i64), i64 129, i64 2147483647) #3, !srcloc !9
  %8 = icmp eq i64 %7, -38
  br i1 %8, label %9, label %11

9:                                                ; preds = %6
  %10 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 ptrtoint ([2 x i32]* @vmlock to i64), i64 1, i64 2147483647) #3, !srcloc !9
  br label %11

11:                                               ; preds = %9, %6, %3, %0
  ret void
}

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
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{i64 232688}
!8 = !{i64 231869}
!9 = !{i64 204190}
