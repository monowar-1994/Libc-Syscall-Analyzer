; ModuleID = 'src/string/memcmp.c'
source_filename = "src/string/memcmp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind readonly strictfp
define i32 @memcmp(i8* nocapture noundef readonly %0, i8* nocapture noundef readonly %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = icmp eq i64 %2, 0
  br i1 %4, label %21, label %5

5:                                                ; preds = %3, %12
  %6 = phi i8* [ %15, %12 ], [ %1, %3 ]
  %7 = phi i8* [ %14, %12 ], [ %0, %3 ]
  %8 = phi i64 [ %13, %12 ], [ %2, %3 ]
  %9 = load i8, i8* %7, align 1, !tbaa !3
  %10 = load i8, i8* %6, align 1, !tbaa !3
  %11 = icmp eq i8 %9, %10
  br i1 %11, label %12, label %17

12:                                               ; preds = %5
  %13 = add i64 %8, -1
  %14 = getelementptr inbounds i8, i8* %7, i64 1
  %15 = getelementptr inbounds i8, i8* %6, i64 1
  %16 = icmp eq i64 %13, 0
  br i1 %16, label %21, label %5

17:                                               ; preds = %5
  %18 = zext i8 %9 to i32
  %19 = zext i8 %10 to i32
  %20 = sub nsw i32 %18, %19
  br label %21

21:                                               ; preds = %12, %3, %17
  %22 = phi i32 [ %20, %17 ], [ 0, %3 ], [ 0, %12 ]
  ret i32 %22
}

attributes #0 = { nofree norecurse nosync nounwind readonly strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
