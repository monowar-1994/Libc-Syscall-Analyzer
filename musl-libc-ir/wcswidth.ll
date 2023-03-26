; ModuleID = 'src/ctype/wcswidth.c'
source_filename = "src/ctype/wcswidth.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @wcswidth(i32* nocapture noundef readonly %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = icmp eq i64 %1, 0
  br i1 %3, label %18, label %4

4:                                                ; preds = %2, %14
  %5 = phi i64 [ %8, %14 ], [ %1, %2 ]
  %6 = phi i32 [ %15, %14 ], [ 0, %2 ]
  %7 = phi i32* [ %16, %14 ], [ %0, %2 ]
  %8 = add i64 %5, -1
  %9 = load i32, i32* %7, align 4, !tbaa !3
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %18, label %11

11:                                               ; preds = %4
  %12 = tail call i32 @wcwidth(i32 noundef %9) #2
  %13 = icmp sgt i32 %12, -1
  br i1 %13, label %14, label %18

14:                                               ; preds = %11
  %15 = add nsw i32 %12, %6
  %16 = getelementptr inbounds i32, i32* %7, i64 1
  %17 = icmp eq i64 %8, 0
  br i1 %17, label %18, label %4

18:                                               ; preds = %14, %4, %11, %2
  %19 = phi i32 [ 0, %2 ], [ %6, %4 ], [ %15, %14 ], [ %12, %11 ]
  ret i32 %19
}

; Function Attrs: optsize
declare i32 @wcwidth(i32 noundef) local_unnamed_addr #1

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
