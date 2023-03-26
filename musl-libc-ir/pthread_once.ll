; ModuleID = 'src/thread/pthread_once.c'
source_filename = "src/thread/pthread_once.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }

@pthread_once = weak alias i32 (i32*, void ()*), i32 (i32*, void ()*)* @__pthread_once

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__pthread_once_full(i32* noundef %0, void ()* nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = alloca %struct.__ptcb, align 8
  br label %4

4:                                                ; preds = %20, %2
  %5 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* elementtype(i32) %0, i32 0, i32 1) #3, !srcloc !3
  switch i32 %5, label %20 [
    i32 0, label %6
    i32 1, label %17
    i32 3, label %19
    i32 2, label %21
  ]

6:                                                ; preds = %4
  %7 = bitcast %struct.__ptcb* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %7) #3
  %8 = bitcast i32* %0 to i8*
  call void @_pthread_cleanup_push(%struct.__ptcb* noundef nonnull %3, void (i8*)* noundef nonnull @undo, i8* noundef %8) #4
  call void %1() #4
  call void @_pthread_cleanup_pop(%struct.__ptcb* noundef nonnull %3, i32 noundef 0) #4
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %7) #3
  %9 = call i32 asm sideeffect "xchg $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* elementtype(i32) %0, i32 2) #3, !srcloc !4
  %10 = icmp eq i32 %9, 3
  br i1 %10, label %11, label %21

11:                                               ; preds = %6
  %12 = ptrtoint i32* %0 to i64
  %13 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %12, i64 129, i64 2147483647) #3, !srcloc !5
  %14 = icmp eq i64 %13, -38
  br i1 %14, label %15, label %21

15:                                               ; preds = %11
  %16 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %12, i64 1, i64 2147483647) #3, !srcloc !5
  br label %21

17:                                               ; preds = %4
  %18 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* elementtype(i32) %0, i32 1, i32 3) #3, !srcloc !3
  br label %19

19:                                               ; preds = %4, %17
  tail call void @__wait(i32* noundef %0, i32* noundef null, i32 noundef 3, i32 noundef 1) #4
  br label %20

20:                                               ; preds = %19, %4
  br label %4

21:                                               ; preds = %4, %15, %11, %6
  ret i32 0
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare void @_pthread_cleanup_push(%struct.__ptcb* noundef, void (i8*)* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal void @undo(i8* noundef %0) #0 {
  %2 = bitcast i8* %0 to i32*
  %3 = tail call i32 asm sideeffect "xchg $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* elementtype(i32) %2, i32 0) #3, !srcloc !4
  %4 = icmp eq i32 %3, 3
  br i1 %4, label %5, label %11

5:                                                ; preds = %1
  %6 = ptrtoint i8* %0 to i64
  %7 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %6, i64 129, i64 2147483647) #3, !srcloc !5
  %8 = icmp eq i64 %7, -38
  br i1 %8, label %9, label %11

9:                                                ; preds = %5
  %10 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %6, i64 1, i64 2147483647) #3, !srcloc !5
  br label %11

11:                                               ; preds = %9, %5, %1
  ret void
}

; Function Attrs: optsize
declare void @_pthread_cleanup_pop(%struct.__ptcb* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden void @__wait(i32* noundef, i32* noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__pthread_once(i32* noundef %0, void ()* nocapture noundef readonly %1) #0 {
  %3 = load volatile i32, i32* %0, align 4, !tbaa !6
  %4 = icmp eq i32 %3, 2
  br i1 %4, label %5, label %6

5:                                                ; preds = %2
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !10
  br label %8

6:                                                ; preds = %2
  %7 = tail call i32 @__pthread_once_full(i32* noundef nonnull %0, void ()* noundef %1) #5
  br label %8

8:                                                ; preds = %6, %5
  ret i32 0
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 232214}
!4 = !{i64 232614}
!5 = !{i64 205121}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{i64 234084}
