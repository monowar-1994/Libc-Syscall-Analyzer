; ModuleID = 'src/string/wcscspn.c'
source_filename = "src/string/wcscspn.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind strictfp
define i64 @wcscspn(i32* noundef %0, i32* noundef %1) local_unnamed_addr #0 {
  %3 = load i32, i32* %1, align 4, !tbaa !3
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %7

5:                                                ; preds = %2
  %6 = tail call i64 @wcslen(i32* noundef %0) #2
  br label %39

7:                                                ; preds = %2
  %8 = getelementptr inbounds i32, i32* %1, i64 1
  %9 = load i32, i32* %8, align 4, !tbaa !3
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %14, label %11

11:                                               ; preds = %7
  %12 = load i32, i32* %0, align 4, !tbaa !3
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %33, label %24

14:                                               ; preds = %7
  %15 = tail call i32* @wcschr(i32* noundef %0, i32 noundef %3) #2
  %16 = icmp eq i32* %15, null
  br i1 %16, label %22, label %17

17:                                               ; preds = %14
  %18 = ptrtoint i32* %15 to i64
  %19 = ptrtoint i32* %0 to i64
  %20 = sub i64 %18, %19
  %21 = ashr exact i64 %20, 2
  br label %39

22:                                               ; preds = %14
  %23 = tail call i64 @wcslen(i32* noundef %0) #2
  br label %39

24:                                               ; preds = %11, %29
  %25 = phi i32 [ %31, %29 ], [ %12, %11 ]
  %26 = phi i32* [ %30, %29 ], [ %0, %11 ]
  %27 = tail call i32* @wcschr(i32* noundef nonnull %1, i32 noundef %25) #2
  %28 = icmp eq i32* %27, null
  br i1 %28, label %29, label %33

29:                                               ; preds = %24
  %30 = getelementptr inbounds i32, i32* %26, i64 1
  %31 = load i32, i32* %30, align 4, !tbaa !3
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %24

33:                                               ; preds = %24, %29, %11
  %34 = phi i32* [ %0, %11 ], [ %30, %29 ], [ %26, %24 ]
  %35 = ptrtoint i32* %34 to i64
  %36 = ptrtoint i32* %0 to i64
  %37 = sub i64 %35, %36
  %38 = ashr exact i64 %37, 2
  br label %39

39:                                               ; preds = %17, %22, %33, %5
  %40 = phi i64 [ %38, %33 ], [ %6, %5 ], [ %21, %17 ], [ %23, %22 ]
  ret i64 %40
}

declare i64 @wcslen(i32* noundef) local_unnamed_addr #1

declare i32* @wcschr(i32* noundef, i32 noundef) local_unnamed_addr #1

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
