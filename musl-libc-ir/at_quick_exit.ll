; ModuleID = 'src/exit/at_quick_exit.c'
source_filename = "src/exit/at_quick_exit.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@lock = internal global [1 x i32] zeroinitializer, align 4
@__at_quick_exit_lockptr = hidden local_unnamed_addr constant i32* getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0), align 8
@count = internal unnamed_addr global i32 0, align 4
@funcs = internal unnamed_addr global [32 x void ()*] zeroinitializer, align 16

; Function Attrs: nounwind optsize strictfp
define hidden void @__funcs_on_quick_exit() local_unnamed_addr #0 {
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #2
  %1 = load i32, i32* @count, align 4, !tbaa !3
  %2 = icmp sgt i32 %1, 0
  br i1 %2, label %3, label %11

3:                                                ; preds = %0, %3
  %4 = phi i32 [ %9, %3 ], [ %1, %0 ]
  %5 = add nsw i32 %4, -1
  store i32 %5, i32* @count, align 4, !tbaa !3
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds [32 x void ()*], [32 x void ()*]* @funcs, i64 0, i64 %6
  %8 = load void ()*, void ()** %7, align 8, !tbaa !7
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #2
  tail call void %8() #2
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #2
  %9 = load i32, i32* @count, align 4, !tbaa !3
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %3, label %11

11:                                               ; preds = %3, %0
  ret void
}

; Function Attrs: optsize
declare hidden void @__lock(i32* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__unlock(i32* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i32 @at_quick_exit(void ()* noundef %0) local_unnamed_addr #0 {
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #2
  %2 = load i32, i32* @count, align 4, !tbaa !3
  %3 = icmp eq i32 %2, 32
  br i1 %3, label %8, label %4

4:                                                ; preds = %1
  %5 = add nsw i32 %2, 1
  store i32 %5, i32* @count, align 4, !tbaa !3
  %6 = sext i32 %2 to i64
  %7 = getelementptr inbounds [32 x void ()*], [32 x void ()*]* @funcs, i64 0, i64 %6
  store void ()* %0, void ()** %7, align 8, !tbaa !7
  br label %8

8:                                                ; preds = %1, %4
  %9 = phi i32 [ 0, %4 ], [ -1, %1 ]
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #2
  ret i32 %9
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"any pointer", !5, i64 0}
