; ModuleID = 'src/string/wcschr.c'
source_filename = "src/string/wcschr.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind strictfp
define i32* @wcschr(i32* noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp eq i32 %1, 0
  br i1 %3, label %4, label %7

4:                                                ; preds = %2
  %5 = tail call i64 @wcslen(i32* noundef %0) #2
  %6 = getelementptr inbounds i32, i32* %0, i64 %5
  br label %16

7:                                                ; preds = %2, %7
  %8 = phi i32* [ %13, %7 ], [ %0, %2 ]
  %9 = load i32, i32* %8, align 4, !tbaa !3
  %10 = icmp eq i32 %9, 0
  %11 = icmp eq i32 %9, %1
  %12 = or i1 %10, %11
  %13 = getelementptr inbounds i32, i32* %8, i64 1
  br i1 %12, label %14, label %7

14:                                               ; preds = %7
  %15 = select i1 %10, i32* null, i32* %8
  br label %16

16:                                               ; preds = %14, %4
  %17 = phi i32* [ %15, %14 ], [ %6, %4 ]
  ret i32* %17
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
