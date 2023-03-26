; ModuleID = 'src/string/strlen.c'
source_filename = "src/string/strlen.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind readonly strictfp
define i64 @strlen(i8* noundef %0) local_unnamed_addr #0 {
  %2 = ptrtoint i8* %0 to i64
  %3 = and i64 %2, 7
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %66, label %5

5:                                                ; preds = %1
  %6 = load i8, i8* %0, align 1, !tbaa !3
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %87, label %8

8:                                                ; preds = %5
  %9 = getelementptr inbounds i8, i8* %0, i64 1
  %10 = ptrtoint i8* %9 to i64
  %11 = and i64 %10, 7
  %12 = icmp eq i64 %11, 0
  br i1 %12, label %66, label %13

13:                                               ; preds = %8
  %14 = load i8, i8* %9, align 1, !tbaa !3
  %15 = icmp eq i8 %14, 0
  br i1 %15, label %87, label %16

16:                                               ; preds = %13
  %17 = getelementptr inbounds i8, i8* %0, i64 2
  %18 = ptrtoint i8* %17 to i64
  %19 = and i64 %18, 7
  %20 = icmp eq i64 %19, 0
  br i1 %20, label %66, label %21

21:                                               ; preds = %16
  %22 = load i8, i8* %17, align 1, !tbaa !3
  %23 = icmp eq i8 %22, 0
  br i1 %23, label %87, label %24

24:                                               ; preds = %21
  %25 = getelementptr inbounds i8, i8* %0, i64 3
  %26 = ptrtoint i8* %25 to i64
  %27 = and i64 %26, 7
  %28 = icmp eq i64 %27, 0
  br i1 %28, label %66, label %29

29:                                               ; preds = %24
  %30 = load i8, i8* %25, align 1, !tbaa !3
  %31 = icmp eq i8 %30, 0
  br i1 %31, label %87, label %32

32:                                               ; preds = %29
  %33 = getelementptr inbounds i8, i8* %0, i64 4
  %34 = ptrtoint i8* %33 to i64
  %35 = and i64 %34, 7
  %36 = icmp eq i64 %35, 0
  br i1 %36, label %66, label %37

37:                                               ; preds = %32
  %38 = load i8, i8* %33, align 1, !tbaa !3
  %39 = icmp eq i8 %38, 0
  br i1 %39, label %87, label %40

40:                                               ; preds = %37
  %41 = getelementptr inbounds i8, i8* %0, i64 5
  %42 = ptrtoint i8* %41 to i64
  %43 = and i64 %42, 7
  %44 = icmp eq i64 %43, 0
  br i1 %44, label %66, label %45

45:                                               ; preds = %40
  %46 = load i8, i8* %41, align 1, !tbaa !3
  %47 = icmp eq i8 %46, 0
  br i1 %47, label %87, label %48

48:                                               ; preds = %45
  %49 = getelementptr inbounds i8, i8* %0, i64 6
  %50 = ptrtoint i8* %49 to i64
  %51 = and i64 %50, 7
  %52 = icmp eq i64 %51, 0
  br i1 %52, label %66, label %53

53:                                               ; preds = %48
  %54 = load i8, i8* %49, align 1, !tbaa !3
  %55 = icmp eq i8 %54, 0
  br i1 %55, label %87, label %56

56:                                               ; preds = %53
  %57 = getelementptr inbounds i8, i8* %0, i64 7
  %58 = ptrtoint i8* %57 to i64
  %59 = and i64 %58, 7
  %60 = icmp eq i64 %59, 0
  br i1 %60, label %66, label %61

61:                                               ; preds = %56
  %62 = load i8, i8* %57, align 1, !tbaa !3
  %63 = icmp eq i8 %62, 0
  br i1 %63, label %87, label %64

64:                                               ; preds = %61
  %65 = getelementptr inbounds i8, i8* %0, i64 8
  br label %66

66:                                               ; preds = %8, %16, %24, %32, %40, %48, %56, %64, %1
  %67 = phi i8* [ %0, %1 ], [ %9, %8 ], [ %17, %16 ], [ %25, %24 ], [ %33, %32 ], [ %41, %40 ], [ %49, %48 ], [ %57, %56 ], [ %65, %64 ]
  %68 = bitcast i8* %67 to i64*
  br label %69

69:                                               ; preds = %69, %66
  %70 = phi i64* [ %68, %66 ], [ %77, %69 ]
  %71 = load i64, i64* %70, align 8, !tbaa !3
  %72 = add i64 %71, -72340172838076673
  %73 = and i64 %71, -9187201950435737472
  %74 = xor i64 %73, -9187201950435737472
  %75 = and i64 %74, %72
  %76 = icmp eq i64 %75, 0
  %77 = getelementptr inbounds i64, i64* %70, i64 1
  br i1 %76, label %69, label %78

78:                                               ; preds = %69
  %79 = trunc i64 %71 to i8
  %80 = bitcast i64* %70 to i8*
  %81 = icmp eq i8 %79, 0
  br i1 %81, label %87, label %82

82:                                               ; preds = %78, %82
  %83 = phi i8* [ %84, %82 ], [ %80, %78 ]
  %84 = getelementptr inbounds i8, i8* %83, i64 1
  %85 = load i8, i8* %84, align 1, !tbaa !3
  %86 = icmp eq i8 %85, 0
  br i1 %86, label %87, label %82

87:                                               ; preds = %5, %13, %21, %29, %37, %45, %53, %61, %82, %78
  %88 = phi i8* [ %80, %78 ], [ %84, %82 ], [ %0, %5 ], [ %9, %13 ], [ %17, %21 ], [ %25, %29 ], [ %33, %37 ], [ %41, %45 ], [ %49, %53 ], [ %57, %61 ]
  %89 = ptrtoint i8* %88 to i64
  %90 = sub i64 %89, %2
  ret i64 %90
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
