; ModuleID = 'src/thread/mtx_trylock.c'
source_filename = "src/thread/mtx_trylock.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.mtx_t = type { %union.anon }
%union.anon = type { [5 x i8*] }
%struct.pthread_mutex_t = type { %union.anon.0 }
%union.anon.0 = type { [5 x i8*] }

; Function Attrs: nounwind optsize strictfp
define i32 @mtx_trylock(%struct.mtx_t* noundef %0) local_unnamed_addr #0 {
  %2 = bitcast %struct.mtx_t* %0 to i32*
  %3 = load i32, i32* %2, align 8, !tbaa !3
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %11

5:                                                ; preds = %1
  %6 = bitcast %struct.mtx_t* %0 to [10 x i32]*
  %7 = getelementptr inbounds [10 x i32], [10 x i32]* %6, i64 0, i64 1
  %8 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %7, i32 0, i32 16) #2, !srcloc !6
  %9 = lshr i32 %8, 4
  %10 = and i32 %9, 1
  br label %18

11:                                               ; preds = %1
  %12 = bitcast %struct.mtx_t* %0 to %struct.pthread_mutex_t*
  %13 = tail call i32 @__pthread_mutex_trylock(%struct.pthread_mutex_t* noundef %12) #3
  %14 = icmp eq i32 %13, 16
  %15 = select i1 %14, i32 1, i32 2
  %16 = icmp eq i32 %13, 0
  %17 = select i1 %16, i32 0, i32 %15
  br label %18

18:                                               ; preds = %11, %5
  %19 = phi i32 [ %10, %5 ], [ %17, %11 ]
  ret i32 %19
}

; Function Attrs: optsize
declare hidden i32 @__pthread_mutex_trylock(%struct.pthread_mutex_t* noundef) local_unnamed_addr #1

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
!6 = !{i64 231299}
