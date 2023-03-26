; ModuleID = 'src/search/lsearch.c'
source_filename = "src/search/lsearch.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i8* @lsearch(i8* noundef %0, i8* noundef %1, i64* nocapture noundef %2, i64 noundef %3, i32 (i8*, i8*)* nocapture noundef readonly %4) local_unnamed_addr #0 {
  %6 = load i64, i64* %2, align 8, !tbaa !3
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %17, label %10

8:                                                ; preds = %10
  %9 = icmp eq i64 %16, %6
  br i1 %9, label %17, label %10

10:                                               ; preds = %5, %8
  %11 = phi i64 [ %16, %8 ], [ 0, %5 ]
  %12 = mul nsw i64 %11, %3
  %13 = getelementptr inbounds i8, i8* %1, i64 %12
  %14 = tail call i32 %4(i8* noundef %0, i8* noundef %13) #2
  %15 = icmp eq i32 %14, 0
  %16 = add nuw i64 %11, 1
  br i1 %15, label %22, label %8

17:                                               ; preds = %8, %5
  %18 = add i64 %6, 1
  store i64 %18, i64* %2, align 8, !tbaa !3
  %19 = mul nsw i64 %6, %3
  %20 = getelementptr inbounds i8, i8* %1, i64 %19
  %21 = tail call i8* @memcpy(i8* noundef %20, i8* noundef %0, i64 noundef %3) #2
  br label %22

22:                                               ; preds = %10, %17
  %23 = phi i8* [ %21, %17 ], [ %13, %10 ]
  ret i8* %23
}

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i8* @lfind(i8* noundef %0, i8* noundef %1, i64* nocapture noundef readonly %2, i64 noundef %3, i32 (i8*, i8*)* nocapture noundef readonly %4) local_unnamed_addr #0 {
  %6 = load i64, i64* %2, align 8, !tbaa !3
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %17, label %10

8:                                                ; preds = %10
  %9 = icmp eq i64 %16, %6
  br i1 %9, label %17, label %10

10:                                               ; preds = %5, %8
  %11 = phi i64 [ %16, %8 ], [ 0, %5 ]
  %12 = mul nsw i64 %11, %3
  %13 = getelementptr inbounds i8, i8* %1, i64 %12
  %14 = tail call i32 %4(i8* noundef %0, i8* noundef %13) #2
  %15 = icmp eq i32 %14, 0
  %16 = add nuw i64 %11, 1
  br i1 %15, label %17, label %8

17:                                               ; preds = %10, %8, %5
  %18 = phi i8* [ null, %5 ], [ null, %8 ], [ %13, %10 ]
  ret i8* %18
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"long", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
