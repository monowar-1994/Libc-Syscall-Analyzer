; ModuleID = 'src/stdlib/atoll.c'
source_filename = "src/stdlib/atoll.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind optsize readonly strictfp
define i64 @atoll(i8* nocapture noundef readonly %0) local_unnamed_addr #0 {
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
  br i1 %23, label %24, label %36

24:                                               ; preds = %18, %24
  %25 = phi i32 [ %34, %24 ], [ %22, %18 ]
  %26 = phi i64 [ %31, %24 ], [ 0, %18 ]
  %27 = phi i8* [ %29, %24 ], [ %20, %18 ]
  %28 = mul nsw i64 %26, 10
  %29 = getelementptr inbounds i8, i8* %27, i64 1
  %30 = zext i32 %25 to i64
  %31 = sub nsw i64 %28, %30
  %32 = load i8, i8* %29, align 1, !tbaa !3
  %33 = sext i8 %32 to i32
  %34 = add nsw i32 %33, -48
  %35 = icmp ult i32 %34, 10
  br i1 %35, label %24, label %36

36:                                               ; preds = %24, %18
  %37 = phi i64 [ 0, %18 ], [ %31, %24 ]
  %38 = icmp eq i32 %21, 0
  %39 = sub nsw i64 0, %37
  %40 = select i1 %38, i64 %39, i64 %37
  ret i64 %40
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
