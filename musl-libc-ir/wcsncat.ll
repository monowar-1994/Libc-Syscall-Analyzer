; ModuleID = 'src/string/wcsncat.c'
source_filename = "src/string/wcsncat.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind strictfp
define i32* @wcsncat(i32* noalias noundef returned %0, i32* noalias nocapture noundef readonly %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = tail call i64 @wcslen(i32* noundef %0) #2
  %5 = getelementptr inbounds i32, i32* %0, i64 %4
  %6 = icmp eq i64 %2, 0
  br i1 %6, label %18, label %7

7:                                                ; preds = %3, %13
  %8 = phi i32* [ %16, %13 ], [ %5, %3 ]
  %9 = phi i64 [ %14, %13 ], [ %2, %3 ]
  %10 = phi i32* [ %15, %13 ], [ %1, %3 ]
  %11 = load i32, i32* %10, align 4, !tbaa !3
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %18, label %13

13:                                               ; preds = %7
  %14 = add i64 %9, -1
  %15 = getelementptr inbounds i32, i32* %10, i64 1
  %16 = getelementptr inbounds i32, i32* %8, i64 1
  store i32 %11, i32* %8, align 4, !tbaa !3
  %17 = icmp eq i64 %14, 0
  br i1 %17, label %18, label %7

18:                                               ; preds = %7, %13, %3
  %19 = phi i32* [ %5, %3 ], [ %16, %13 ], [ %8, %7 ]
  store i32 0, i32* %19, align 4, !tbaa !3
  ret i32* %0
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
