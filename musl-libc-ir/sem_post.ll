; ModuleID = 'src/thread/sem_post.c'
source_filename = "src/thread/sem_post.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sem_t = type { [8 x i32] }

; Function Attrs: nounwind optsize strictfp
define i32 @sem_post(%struct.sem_t* noundef %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.sem_t, %struct.sem_t* %0, i64 0, i32 0, i64 2
  %3 = load volatile i32, i32* %2, align 4, !tbaa !3
  %4 = getelementptr inbounds %struct.sem_t, %struct.sem_t* %0, i64 0, i32 0, i64 0
  %5 = getelementptr inbounds %struct.sem_t, %struct.sem_t* %0, i64 0, i32 0, i64 1
  br label %6

6:                                                ; preds = %12, %1
  %7 = load volatile i32, i32* %4, align 4, !tbaa !3
  %8 = load volatile i32, i32* %5, align 4, !tbaa !3
  %9 = icmp eq i32 %7, 2147483647
  br i1 %9, label %10, label %12

10:                                               ; preds = %6
  %11 = tail call i32* @___errno_location() #2
  store i32 75, i32* %11, align 4, !tbaa !3
  br label %30

12:                                               ; preds = %6
  %13 = add nsw i32 %7, 1
  %14 = lshr i32 %7, 31
  %15 = add nsw i32 %13, %14
  %16 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %4, i32 %7, i32 %15) #3, !srcloc !7
  %17 = icmp eq i32 %16, %7
  br i1 %17, label %18, label %6

18:                                               ; preds = %12
  %19 = icmp slt i32 %7, 0
  %20 = icmp ne i32 %8, 0
  %21 = select i1 %19, i1 true, i1 %20
  br i1 %21, label %22, label %30

22:                                               ; preds = %18
  %23 = icmp eq i32 %3, 0
  %24 = ptrtoint %struct.sem_t* %0 to i64
  %25 = select i1 %23, i64 1, i64 129
  %26 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %24, i64 %25, i64 1) #3, !srcloc !8
  %27 = icmp eq i64 %26, -38
  br i1 %27, label %28, label %30

28:                                               ; preds = %22
  %29 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %24, i64 1, i64 1) #3, !srcloc !8
  br label %30

30:                                               ; preds = %28, %22, %18, %10
  %31 = phi i32 [ -1, %10 ], [ 0, %18 ], [ 0, %22 ], [ 0, %28 ]
  ret i32 %31
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
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
!7 = !{i64 260655}
!8 = !{i64 233562}
