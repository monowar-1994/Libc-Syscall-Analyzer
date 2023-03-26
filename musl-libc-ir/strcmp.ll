; ModuleID = 'src/string/strcmp.c'
source_filename = "src/string/strcmp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind readonly strictfp
define i32 @strcmp(i8* nocapture noundef readonly %0, i8* nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = load i8, i8* %0, align 1, !tbaa !3
  %4 = load i8, i8* %1, align 1, !tbaa !3
  %5 = icmp ne i8 %3, %4
  %6 = icmp eq i8 %3, 0
  %7 = or i1 %6, %5
  br i1 %7, label %18, label %8

8:                                                ; preds = %2, %8
  %9 = phi i8* [ %12, %8 ], [ %1, %2 ]
  %10 = phi i8* [ %11, %8 ], [ %0, %2 ]
  %11 = getelementptr inbounds i8, i8* %10, i64 1
  %12 = getelementptr inbounds i8, i8* %9, i64 1
  %13 = load i8, i8* %11, align 1, !tbaa !3
  %14 = load i8, i8* %12, align 1, !tbaa !3
  %15 = icmp ne i8 %13, %14
  %16 = icmp eq i8 %13, 0
  %17 = or i1 %16, %15
  br i1 %17, label %18, label %8

18:                                               ; preds = %8, %2
  %19 = phi i8 [ %3, %2 ], [ %13, %8 ]
  %20 = phi i8 [ %4, %2 ], [ %14, %8 ]
  %21 = zext i8 %19 to i32
  %22 = zext i8 %20 to i32
  %23 = sub nsw i32 %21, %22
  ret i32 %23
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
