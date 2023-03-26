; ModuleID = 'src/string/strverscmp.c'
source_filename = "src/string/strverscmp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind readonly strictfp
define i32 @strverscmp(i8* nocapture noundef readonly %0, i8* nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = load i8, i8* %0, align 1, !tbaa !3
  %4 = load i8, i8* %1, align 1, !tbaa !3
  %5 = icmp eq i8 %3, %4
  br i1 %5, label %6, label %29

6:                                                ; preds = %2, %12
  %7 = phi i8 [ %22, %12 ], [ %3, %2 ]
  %8 = phi i32 [ %20, %12 ], [ 1, %2 ]
  %9 = phi i64 [ %19, %12 ], [ 0, %2 ]
  %10 = phi i64 [ %18, %12 ], [ 0, %2 ]
  %11 = icmp eq i8 %7, 0
  br i1 %11, label %86, label %12

12:                                               ; preds = %6
  %13 = zext i8 %7 to i32
  %14 = add nsw i32 %13, -48
  %15 = icmp ult i32 %14, 10
  %16 = icmp eq i8 %7, 48
  %17 = select i1 %16, i32 %8, i32 0
  %18 = add i64 %10, 1
  %19 = select i1 %15, i64 %9, i64 %18
  %20 = select i1 %15, i32 %17, i32 1
  %21 = getelementptr inbounds i8, i8* %0, i64 %18
  %22 = load i8, i8* %21, align 1, !tbaa !3
  %23 = getelementptr inbounds i8, i8* %1, i64 %18
  %24 = load i8, i8* %23, align 1, !tbaa !3
  %25 = icmp eq i8 %22, %24
  br i1 %25, label %6, label %26

26:                                               ; preds = %12
  %27 = getelementptr inbounds i8, i8* %0, i64 %19
  %28 = load i8, i8* %27, align 1, !tbaa !3
  br label %29

29:                                               ; preds = %26, %2
  %30 = phi i8 [ %3, %2 ], [ %28, %26 ]
  %31 = phi i8 [ %3, %2 ], [ %22, %26 ]
  %32 = phi i64 [ 0, %2 ], [ %18, %26 ]
  %33 = phi i64 [ 0, %2 ], [ %19, %26 ]
  %34 = phi i32 [ 1, %2 ], [ %20, %26 ]
  %35 = phi i8 [ %4, %2 ], [ %24, %26 ]
  %36 = zext i8 %31 to i32
  %37 = icmp eq i8 %30, 48
  br i1 %37, label %66, label %38

38:                                               ; preds = %29
  %39 = getelementptr inbounds i8, i8* %1, i64 %33
  %40 = load i8, i8* %39, align 1, !tbaa !3
  %41 = icmp eq i8 %40, 48
  br i1 %41, label %66, label %42

42:                                               ; preds = %38
  %43 = add nsw i32 %36, -48
  %44 = icmp ult i32 %43, 10
  br i1 %44, label %45, label %59

45:                                               ; preds = %42, %52
  %46 = phi i64 [ %53, %52 ], [ %32, %42 ]
  %47 = getelementptr inbounds i8, i8* %1, i64 %46
  %48 = load i8, i8* %47, align 1, !tbaa !3
  %49 = zext i8 %48 to i32
  %50 = add nsw i32 %49, -48
  %51 = icmp ult i32 %50, 10
  br i1 %51, label %52, label %86

52:                                               ; preds = %45
  %53 = add i64 %46, 1
  %54 = getelementptr inbounds i8, i8* %0, i64 %53
  %55 = load i8, i8* %54, align 1, !tbaa !3
  %56 = zext i8 %55 to i32
  %57 = add nsw i32 %56, -48
  %58 = icmp ult i32 %57, 10
  br i1 %58, label %45, label %59

59:                                               ; preds = %52, %42
  %60 = phi i64 [ %32, %42 ], [ %53, %52 ]
  %61 = getelementptr inbounds i8, i8* %1, i64 %60
  %62 = load i8, i8* %61, align 1, !tbaa !3
  %63 = zext i8 %62 to i32
  %64 = add nsw i32 %63, -48
  %65 = icmp ult i32 %64, 10
  br i1 %65, label %86, label %83

66:                                               ; preds = %38, %29
  %67 = icmp ne i32 %34, 0
  %68 = icmp ult i64 %33, %32
  %69 = select i1 %67, i1 %68, i1 false
  br i1 %69, label %70, label %83

70:                                               ; preds = %66
  %71 = add nsw i32 %36, -48
  %72 = icmp ult i32 %71, 10
  %73 = zext i8 %35 to i32
  %74 = add nsw i32 %73, -48
  %75 = icmp ult i32 %74, 10
  %76 = select i1 %72, i1 true, i1 %75
  br i1 %76, label %77, label %83

77:                                               ; preds = %70
  %78 = add i8 %31, -48
  %79 = zext i8 %78 to i32
  %80 = add i8 %35, -48
  %81 = zext i8 %80 to i32
  %82 = sub nsw i32 %79, %81
  br label %86

83:                                               ; preds = %70, %66, %59
  %84 = zext i8 %35 to i32
  %85 = sub nsw i32 %36, %84
  br label %86

86:                                               ; preds = %6, %45, %59, %83, %77
  %87 = phi i32 [ %85, %83 ], [ %82, %77 ], [ -1, %59 ], [ 1, %45 ], [ 0, %6 ]
  ret i32 %87
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
