; ModuleID = 'src/thread/mtx_lock.c'
source_filename = "src/thread/mtx_lock.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.mtx_t = type { %union.anon }
%union.anon = type { [5 x i8*] }
%struct.timespec = type { i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @mtx_lock(%struct.mtx_t* noundef %0) local_unnamed_addr #0 {
  %2 = bitcast %struct.mtx_t* %0 to i32*
  %3 = load i32, i32* %2, align 8, !tbaa !3
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %10

5:                                                ; preds = %1
  %6 = bitcast %struct.mtx_t* %0 to [10 x i32]*
  %7 = getelementptr inbounds [10 x i32], [10 x i32]* %6, i64 0, i64 1
  %8 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %7, i32 0, i32 16) #2, !srcloc !6
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %12, label %10

10:                                               ; preds = %5, %1
  %11 = tail call i32 @mtx_timedlock(%struct.mtx_t* noundef nonnull %0, %struct.timespec* noundef null) #3
  br label %12

12:                                               ; preds = %5, %10
  %13 = phi i32 [ %11, %10 ], [ 0, %5 ]
  ret i32 %13
}

; Function Attrs: optsize
declare i32 @mtx_timedlock(%struct.mtx_t* noundef, %struct.timespec* noundef) local_unnamed_addr #1

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
!6 = !{i64 231280}
