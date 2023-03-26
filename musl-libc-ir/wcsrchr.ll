; ModuleID = 'src/string/wcsrchr.c'
source_filename = "src/string/wcsrchr.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind strictfp
define i32* @wcsrchr(i32* noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = tail call i64 @wcslen(i32* noundef %0) #2
  %4 = icmp slt i64 %3, 0
  br i1 %4, label %14, label %5

5:                                                ; preds = %2
  %6 = getelementptr inbounds i32, i32* %0, i64 %3
  br label %7

7:                                                ; preds = %5, %11
  %8 = phi i32* [ %12, %11 ], [ %6, %5 ]
  %9 = load i32, i32* %8, align 4, !tbaa !3
  %10 = icmp eq i32 %9, %1
  br i1 %10, label %14, label %11

11:                                               ; preds = %7
  %12 = getelementptr inbounds i32, i32* %8, i64 -1
  %13 = icmp ult i32* %12, %0
  br i1 %13, label %14, label %7

14:                                               ; preds = %7, %11, %2
  %15 = phi i32* [ null, %2 ], [ null, %11 ], [ %8, %7 ]
  ret i32* %15
}

declare i64 @wcslen(i32* noundef) local_unnamed_addr #1

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
