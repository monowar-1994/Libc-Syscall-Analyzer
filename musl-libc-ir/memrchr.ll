; ModuleID = 'src/string/memrchr.c'
source_filename = "src/string/memrchr.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@memrchr = weak alias i8* (i8*, i32, i64), i8* (i8*, i32, i64)* @__memrchr

; Function Attrs: nofree norecurse nosync nounwind readonly strictfp
define hidden i8* @__memrchr(i8* noundef readonly %0, i32 noundef %1, i64 noundef %2) #0 {
  %4 = trunc i32 %1 to i8
  br label %5

5:                                                ; preds = %9, %3
  %6 = phi i64 [ %2, %3 ], [ %7, %9 ]
  %7 = add i64 %6, -1
  %8 = icmp eq i64 %6, 0
  br i1 %8, label %15, label %9

9:                                                ; preds = %5
  %10 = getelementptr inbounds i8, i8* %0, i64 %7
  %11 = load i8, i8* %10, align 1, !tbaa !3
  %12 = icmp eq i8 %11, %4
  br i1 %12, label %13, label %5

13:                                               ; preds = %9
  %14 = getelementptr inbounds i8, i8* %0, i64 %7
  br label %15

15:                                               ; preds = %5, %13
  %16 = phi i8* [ %14, %13 ], [ null, %5 ]
  ret i8* %16
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
