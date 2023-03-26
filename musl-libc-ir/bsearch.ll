; ModuleID = 'src/stdlib/bsearch.c'
source_filename = "src/stdlib/bsearch.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i8* @bsearch(i8* noundef %0, i8* noundef %1, i64 noundef %2, i64 noundef %3, i32 (i8*, i8*)* nocapture noundef readonly %4) local_unnamed_addr #0 {
  %6 = icmp eq i64 %2, 0
  br i1 %6, label %25, label %7

7:                                                ; preds = %5, %21
  %8 = phi i8* [ %23, %21 ], [ %1, %5 ]
  %9 = phi i64 [ %22, %21 ], [ %2, %5 ]
  %10 = lshr i64 %9, 1
  %11 = mul i64 %10, %3
  %12 = getelementptr inbounds i8, i8* %8, i64 %11
  %13 = tail call i32 %4(i8* noundef %0, i8* noundef %12) #1
  %14 = icmp slt i32 %13, 0
  br i1 %14, label %21, label %15

15:                                               ; preds = %7
  %16 = icmp eq i32 %13, 0
  br i1 %16, label %25, label %17

17:                                               ; preds = %15
  %18 = getelementptr inbounds i8, i8* %12, i64 %3
  %19 = xor i64 %10, -1
  %20 = add i64 %9, %19
  br label %21

21:                                               ; preds = %7, %17
  %22 = phi i64 [ %20, %17 ], [ %10, %7 ]
  %23 = phi i8* [ %18, %17 ], [ %8, %7 ]
  %24 = icmp eq i64 %22, 0
  br i1 %24, label %25, label %7

25:                                               ; preds = %15, %21, %5
  %26 = phi i8* [ null, %5 ], [ null, %21 ], [ %12, %15 ]
  ret i8* %26
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
