; ModuleID = 'src/network/hstrerror.c'
source_filename = "src/network/hstrerror.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@msgs = internal constant [84 x i8] c"Host not found\00Try again\00Non-recoverable error\00Address not available\00\00Unknown error\00", align 16

; Function Attrs: nounwind optsize strictfp
define i8* @hstrerror(i32 noundef %0) local_unnamed_addr #0 {
  %2 = add nsw i32 %0, -1
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %18, label %4

4:                                                ; preds = %1, %14
  %5 = phi i32 [ %16, %14 ], [ %2, %1 ]
  %6 = phi i8* [ %15, %14 ], [ getelementptr inbounds ([84 x i8], [84 x i8]* @msgs, i64 0, i64 0), %1 ]
  %7 = load i8, i8* %6, align 1, !tbaa !3
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %18, label %9

9:                                                ; preds = %4, %9
  %10 = phi i8* [ %11, %9 ], [ %6, %4 ]
  %11 = getelementptr inbounds i8, i8* %10, i64 1
  %12 = load i8, i8* %11, align 1, !tbaa !3
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %14, label %9

14:                                               ; preds = %9
  %15 = getelementptr inbounds i8, i8* %10, i64 2
  %16 = add nsw i32 %5, -1
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %4

18:                                               ; preds = %4, %14, %1
  %19 = phi i8* [ getelementptr inbounds ([84 x i8], [84 x i8]* @msgs, i64 0, i64 0), %1 ], [ %15, %14 ], [ %6, %4 ]
  %20 = load i8, i8* %19, align 1, !tbaa !3
  %21 = icmp eq i8 %20, 0
  %22 = zext i1 %21 to i64
  %23 = getelementptr i8, i8* %19, i64 %22
  %24 = tail call i8* @__lctrans_cur(i8* noundef nonnull %23) #2
  ret i8* %24
}

; Function Attrs: optsize
declare hidden i8* @__lctrans_cur(i8* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
