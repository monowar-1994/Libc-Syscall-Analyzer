; ModuleID = 'src/network/dn_skipname.c'
source_filename = "src/network/dn_skipname.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind optsize readonly strictfp
define i32 @dn_skipname(i8* noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = icmp ult i8* %0, %1
  br i1 %3, label %4, label %36

4:                                                ; preds = %2
  %5 = ptrtoint i8* %1 to i64
  br label %6

6:                                                ; preds = %27, %4
  %7 = phi i8* [ %0, %4 ], [ %33, %27 ]
  %8 = load i8, i8* %7, align 1, !tbaa !3
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %10, label %16

10:                                               ; preds = %6
  %11 = ptrtoint i8* %7 to i64
  %12 = ptrtoint i8* %0 to i64
  %13 = sub i64 %11, %12
  %14 = trunc i64 %13 to i32
  %15 = add i32 %14, 1
  br label %36

16:                                               ; preds = %6
  %17 = icmp ugt i8 %8, -65
  br i1 %17, label %18, label %27

18:                                               ; preds = %16
  %19 = getelementptr inbounds i8, i8* %7, i64 1
  %20 = icmp ult i8* %19, %1
  br i1 %20, label %21, label %36

21:                                               ; preds = %18
  %22 = ptrtoint i8* %7 to i64
  %23 = ptrtoint i8* %0 to i64
  %24 = sub i64 %22, %23
  %25 = trunc i64 %24 to i32
  %26 = add i32 %25, 2
  br label %36

27:                                               ; preds = %16
  %28 = zext i8 %8 to i64
  %29 = ptrtoint i8* %7 to i64
  %30 = sub i64 %5, %29
  %31 = icmp sgt i64 %30, %28
  %32 = add nuw nsw i64 %28, 1
  %33 = getelementptr inbounds i8, i8* %7, i64 %32
  %34 = icmp ult i8* %33, %1
  %35 = select i1 %31, i1 %34, i1 false
  br i1 %35, label %6, label %36

36:                                               ; preds = %27, %2, %18, %21, %10
  %37 = phi i32 [ %26, %21 ], [ %15, %10 ], [ -1, %18 ], [ -1, %2 ], [ -1, %27 ]
  ret i32 %37
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
