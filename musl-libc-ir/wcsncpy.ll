; ModuleID = 'src/string/wcsncpy.c'
source_filename = "src/string/wcsncpy.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind strictfp
define i32* @wcsncpy(i32* noalias noundef returned %0, i32* noalias nocapture noundef readonly %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = icmp eq i64 %2, 0
  br i1 %4, label %16, label %5

5:                                                ; preds = %3, %11
  %6 = phi i32* [ %14, %11 ], [ %0, %3 ]
  %7 = phi i64 [ %12, %11 ], [ %2, %3 ]
  %8 = phi i32* [ %13, %11 ], [ %1, %3 ]
  %9 = load i32, i32* %8, align 4, !tbaa !3
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %16, label %11

11:                                               ; preds = %5
  %12 = add i64 %7, -1
  %13 = getelementptr inbounds i32, i32* %8, i64 1
  %14 = getelementptr inbounds i32, i32* %6, i64 1
  store i32 %9, i32* %6, align 4, !tbaa !3
  %15 = icmp eq i64 %12, 0
  br i1 %15, label %16, label %5

16:                                               ; preds = %5, %11, %3
  %17 = phi i64 [ 0, %3 ], [ 0, %11 ], [ %7, %5 ]
  %18 = phi i32* [ %0, %3 ], [ %14, %11 ], [ %6, %5 ]
  %19 = tail call i32* @wmemset(i32* noundef %18, i32 noundef 0, i64 noundef %17) #2
  ret i32* %0
}

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) local_unnamed_addr #1

attributes #0 = { nounwind strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
