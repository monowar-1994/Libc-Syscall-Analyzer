; ModuleID = 'src/thread/sem_trywait.c'
source_filename = "src/thread/sem_trywait.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sem_t = type { [8 x i32] }

; Function Attrs: nounwind optsize strictfp
define i32 @sem_trywait(%struct.sem_t* noundef %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.sem_t, %struct.sem_t* %0, i64 0, i32 0, i64 0
  %3 = getelementptr inbounds %struct.sem_t, %struct.sem_t* %0, i64 0, i32 0, i64 1
  br label %4

4:                                                ; preds = %13, %1
  %5 = load volatile i32, i32* %2, align 4, !tbaa !3
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %19

7:                                                ; preds = %4
  %8 = add nsw i32 %5, -1
  %9 = icmp eq i32 %5, 1
  br i1 %9, label %10, label %13

10:                                               ; preds = %7
  %11 = load volatile i32, i32* %3, align 4, !tbaa !3
  %12 = icmp ne i32 %11, 0
  br label %13

13:                                               ; preds = %10, %7
  %14 = phi i1 [ false, %7 ], [ %12, %10 ]
  %15 = sext i1 %14 to i32
  %16 = add nsw i32 %8, %15
  %17 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %2, i32 %5, i32 %16) #2, !srcloc !7
  %18 = icmp eq i32 %17, %5
  br i1 %18, label %21, label %4

19:                                               ; preds = %4
  %20 = tail call i32* @___errno_location() #3
  store i32 11, i32* %20, align 4, !tbaa !3
  br label %21

21:                                               ; preds = %13, %19
  %22 = phi i32 [ -1, %19 ], [ 0, %13 ]
  ret i32 %22
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind strictfp }
attributes #3 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{i64 260543}
