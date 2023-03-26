; ModuleID = 'src/string/swab.c'
source_filename = "src/string/swab.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind strictfp
define void @swab(i8* noalias nocapture noundef readonly %0, i8* noalias nocapture noundef writeonly %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = icmp sgt i64 %2, 1
  br i1 %4, label %5, label %17

5:                                                ; preds = %3, %5
  %6 = phi i8* [ %13, %5 ], [ %1, %3 ]
  %7 = phi i8* [ %14, %5 ], [ %0, %3 ]
  %8 = phi i64 [ %15, %5 ], [ %2, %3 ]
  %9 = getelementptr inbounds i8, i8* %7, i64 1
  %10 = load i8, i8* %9, align 1, !tbaa !3
  store i8 %10, i8* %6, align 1, !tbaa !3
  %11 = load i8, i8* %7, align 1, !tbaa !3
  %12 = getelementptr inbounds i8, i8* %6, i64 1
  store i8 %11, i8* %12, align 1, !tbaa !3
  %13 = getelementptr inbounds i8, i8* %6, i64 2
  %14 = getelementptr inbounds i8, i8* %7, i64 2
  %15 = add nsw i64 %8, -2
  %16 = icmp ugt i64 %8, 3
  br i1 %16, label %5, label %17

17:                                               ; preds = %5, %3
  ret void
}

attributes #0 = { nofree norecurse nosync nounwind strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
