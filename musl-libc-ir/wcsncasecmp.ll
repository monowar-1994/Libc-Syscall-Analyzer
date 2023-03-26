; ModuleID = 'src/string/wcsncasecmp.c'
source_filename = "src/string/wcsncasecmp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind strictfp
define i32 @wcsncasecmp(i32* nocapture noundef readonly %0, i32* nocapture noundef readonly %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = icmp eq i64 %2, 0
  br i1 %4, label %39, label %5

5:                                                ; preds = %3
  %6 = load i32, i32* %0, align 4, !tbaa !3
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %32, label %8

8:                                                ; preds = %5, %27
  %9 = phi i32 [ %30, %27 ], [ %6, %5 ]
  %10 = phi i64 [ %13, %27 ], [ %2, %5 ]
  %11 = phi i32* [ %29, %27 ], [ %1, %5 ]
  %12 = phi i32* [ %28, %27 ], [ %0, %5 ]
  %13 = add i64 %10, -1
  %14 = load i32, i32* %11, align 4, !tbaa !3
  %15 = icmp ne i32 %14, 0
  %16 = icmp ne i64 %13, 0
  %17 = select i1 %15, i1 %16, i1 false
  br i1 %17, label %18, label %32

18:                                               ; preds = %8
  %19 = icmp eq i32 %9, %14
  br i1 %19, label %27, label %20

20:                                               ; preds = %18
  %21 = tail call i32 @towlower(i32 noundef %9) #2
  %22 = load i32, i32* %11, align 4, !tbaa !3
  %23 = tail call i32 @towlower(i32 noundef %22) #2
  %24 = icmp eq i32 %21, %23
  br i1 %24, label %27, label %25

25:                                               ; preds = %20
  %26 = load i32, i32* %12, align 4, !tbaa !3
  br label %32

27:                                               ; preds = %18, %20
  %28 = getelementptr inbounds i32, i32* %12, i64 1
  %29 = getelementptr inbounds i32, i32* %11, i64 1
  %30 = load i32, i32* %28, align 4, !tbaa !3
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %8

32:                                               ; preds = %8, %27, %25, %5
  %33 = phi i32 [ 0, %5 ], [ %26, %25 ], [ %9, %8 ], [ 0, %27 ]
  %34 = phi i32* [ %1, %5 ], [ %11, %25 ], [ %11, %8 ], [ %29, %27 ]
  %35 = tail call i32 @towlower(i32 noundef %33) #2
  %36 = load i32, i32* %34, align 4, !tbaa !3
  %37 = tail call i32 @towlower(i32 noundef %36) #2
  %38 = sub i32 %35, %37
  br label %39

39:                                               ; preds = %3, %32
  %40 = phi i32 [ %38, %32 ], [ 0, %3 ]
  ret i32 %40
}

declare i32 @towlower(i32 noundef) local_unnamed_addr #1

attributes #0 = { nounwind strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
