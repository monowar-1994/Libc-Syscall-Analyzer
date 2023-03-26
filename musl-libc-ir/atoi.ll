; ModuleID = 'src/stdlib/atoi.c'
source_filename = "src/stdlib/atoi.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind optsize readonly strictfp
define i32 @atoi(i8* nocapture noundef readonly %0) local_unnamed_addr #0 {
  br label %2

2:                                                ; preds = %2, %1
  %3 = phi i8* [ %0, %1 ], [ %10, %2 ]
  %4 = load i8, i8* %3, align 1, !tbaa !3
  %5 = sext i8 %4 to i32
  %6 = icmp ne i8 %4, 32
  %7 = add nsw i32 %5, -14
  %8 = icmp ult i32 %7, -5
  %9 = and i1 %6, %8
  %10 = getelementptr inbounds i8, i8* %3, i64 1
  br i1 %9, label %11, label %2

11:                                               ; preds = %2
  %12 = sext i8 %4 to i32
  switch i32 %12, label %18 [
    i32 45, label %13
    i32 43, label %14
  ]

13:                                               ; preds = %11
  br label %14

14:                                               ; preds = %11, %13
  %15 = phi i32 [ 0, %11 ], [ 1, %13 ]
  %16 = load i8, i8* %10, align 1, !tbaa !3
  %17 = sext i8 %16 to i32
  br label %18

18:                                               ; preds = %14, %11
  %19 = phi i32 [ %17, %14 ], [ %12, %11 ]
  %20 = phi i8* [ %10, %14 ], [ %3, %11 ]
  %21 = phi i32 [ %15, %14 ], [ 0, %11 ]
  %22 = add nsw i32 %19, -48
  %23 = icmp ult i32 %22, 10
  br i1 %23, label %24, label %35

24:                                               ; preds = %18, %24
  %25 = phi i32 [ %33, %24 ], [ %22, %18 ]
  %26 = phi i32 [ %30, %24 ], [ 0, %18 ]
  %27 = phi i8* [ %29, %24 ], [ %20, %18 ]
  %28 = mul nsw i32 %26, 10
  %29 = getelementptr inbounds i8, i8* %27, i64 1
  %30 = sub nsw i32 %28, %25
  %31 = load i8, i8* %29, align 1, !tbaa !3
  %32 = sext i8 %31 to i32
  %33 = add nsw i32 %32, -48
  %34 = icmp ult i32 %33, 10
  br i1 %34, label %24, label %35

35:                                               ; preds = %24, %18
  %36 = phi i32 [ 0, %18 ], [ %30, %24 ]
  %37 = icmp eq i32 %21, 0
  %38 = sub nsw i32 0, %36
  %39 = select i1 %37, i32 %38, i32 %36
  ret i32 %39
}

attributes #0 = { nofree norecurse nosync nounwind optsize readonly strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
