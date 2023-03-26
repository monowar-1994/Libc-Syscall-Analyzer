; ModuleID = 'src/string/wcsspn.c'
source_filename = "src/string/wcsspn.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind strictfp
define i64 @wcsspn(i32* noundef %0, i32* noundef %1) local_unnamed_addr #0 {
  %3 = load i32, i32* %0, align 4, !tbaa !3
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %14, label %5

5:                                                ; preds = %2, %10
  %6 = phi i32 [ %12, %10 ], [ %3, %2 ]
  %7 = phi i32* [ %11, %10 ], [ %0, %2 ]
  %8 = tail call i32* @wcschr(i32* noundef %1, i32 noundef %6) #2
  %9 = icmp eq i32* %8, null
  br i1 %9, label %14, label %10

10:                                               ; preds = %5
  %11 = getelementptr inbounds i32, i32* %7, i64 1
  %12 = load i32, i32* %11, align 4, !tbaa !3
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %5

14:                                               ; preds = %5, %10, %2
  %15 = phi i32* [ %0, %2 ], [ %11, %10 ], [ %7, %5 ]
  %16 = ptrtoint i32* %15 to i64
  %17 = ptrtoint i32* %0 to i64
  %18 = sub i64 %16, %17
  %19 = ashr exact i64 %18, 2
  ret i64 %19
}

declare i32* @wcschr(i32* noundef, i32 noundef) local_unnamed_addr #1

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
