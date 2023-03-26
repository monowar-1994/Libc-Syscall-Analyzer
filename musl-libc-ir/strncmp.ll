; ModuleID = 'src/string/strncmp.c'
source_filename = "src/string/strncmp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind readonly strictfp
define i32 @strncmp(i8* nocapture noundef readonly %0, i8* nocapture noundef readonly %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = icmp eq i64 %2, 0
  br i1 %4, label %32, label %5

5:                                                ; preds = %3
  %6 = load i8, i8* %0, align 1, !tbaa !3
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %25, label %8

8:                                                ; preds = %5, %20
  %9 = phi i8 [ %23, %20 ], [ %6, %5 ]
  %10 = phi i64 [ %13, %20 ], [ %2, %5 ]
  %11 = phi i8* [ %22, %20 ], [ %1, %5 ]
  %12 = phi i8* [ %21, %20 ], [ %0, %5 ]
  %13 = add i64 %10, -1
  %14 = load i8, i8* %11, align 1, !tbaa !3
  %15 = icmp ne i8 %14, 0
  %16 = icmp ne i64 %13, 0
  %17 = select i1 %15, i1 %16, i1 false
  %18 = icmp eq i8 %9, %14
  %19 = select i1 %17, i1 %18, i1 false
  br i1 %19, label %20, label %25

20:                                               ; preds = %8
  %21 = getelementptr inbounds i8, i8* %12, i64 1
  %22 = getelementptr inbounds i8, i8* %11, i64 1
  %23 = load i8, i8* %21, align 1, !tbaa !3
  %24 = icmp eq i8 %23, 0
  br i1 %24, label %25, label %8

25:                                               ; preds = %8, %20, %5
  %26 = phi i8* [ %1, %5 ], [ %22, %20 ], [ %11, %8 ]
  %27 = phi i8 [ 0, %5 ], [ 0, %20 ], [ %9, %8 ]
  %28 = zext i8 %27 to i32
  %29 = load i8, i8* %26, align 1, !tbaa !3
  %30 = zext i8 %29 to i32
  %31 = sub nsw i32 %28, %30
  br label %32

32:                                               ; preds = %3, %25
  %33 = phi i32 [ %31, %25 ], [ 0, %3 ]
  ret i32 %33
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
