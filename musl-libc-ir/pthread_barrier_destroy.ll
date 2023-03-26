; ModuleID = 'src/thread/pthread_barrier_destroy.c'
source_filename = "src/thread/pthread_barrier_destroy.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_barrier_t = type { %union.anon }
%union.anon = type { [4 x i8*] }

; Function Attrs: nounwind optsize strictfp
define i32 @pthread_barrier_destroy(%struct.pthread_barrier_t* noundef %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.pthread_barrier_t, %struct.pthread_barrier_t* %0, i64 0, i32 0, i32 0, i64 1
  %3 = bitcast i8** %2 to i32*
  %4 = load i32, i32* %3, align 8, !tbaa !3
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %6, label %20

6:                                                ; preds = %1
  %7 = bitcast %struct.pthread_barrier_t* %0 to i32*
  %8 = load volatile i32, i32* %7, align 8, !tbaa !3
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %19, label %10

10:                                               ; preds = %6
  tail call void asm sideeffect "lock ; or $1, $0", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %7, i32 -2147483648) #2, !srcloc !6
  %11 = load volatile i32, i32* %7, align 8, !tbaa !3
  %12 = and i32 %11, 2147483647
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %19, label %14

14:                                               ; preds = %10, %14
  %15 = phi i32 [ %16, %14 ], [ %11, %10 ]
  tail call void @__wait(i32* noundef nonnull %7, i32* noundef null, i32 noundef %15, i32 noundef 0) #3
  %16 = load volatile i32, i32* %7, align 8, !tbaa !3
  %17 = and i32 %16, 2147483647
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %14

19:                                               ; preds = %14, %10, %6
  tail call void @__vm_wait() #3
  br label %20

20:                                               ; preds = %19, %1
  ret i32 0
}

; Function Attrs: optsize
declare hidden void @__wait(i32* noundef, i32* noundef, i32 noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__vm_wait() local_unnamed_addr #1

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
!6 = !{i64 232114}
