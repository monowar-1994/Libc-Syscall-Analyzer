; ModuleID = 'src/string/stpcpy.c'
source_filename = "src/string/stpcpy.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@stpcpy = weak alias i8* (i8*, i8*), i8* (i8*, i8*)* @__stpcpy

; Function Attrs: nofree norecurse nosync nounwind strictfp
define hidden i8* @__stpcpy(i8* noalias noundef %0, i8* noalias noundef %1) #0 {
  %3 = ptrtoint i8* %1 to i64
  %4 = ptrtoint i8* %0 to i64
  %5 = xor i64 %3, %4
  %6 = and i64 %5, 7
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %108

8:                                                ; preds = %2
  %9 = and i64 %3, 7
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %80, label %11

11:                                               ; preds = %8
  %12 = load i8, i8* %1, align 1, !tbaa !3
  store i8 %12, i8* %0, align 1, !tbaa !3
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %120, label %14

14:                                               ; preds = %11
  %15 = getelementptr inbounds i8, i8* %1, i64 1
  %16 = getelementptr inbounds i8, i8* %0, i64 1
  %17 = ptrtoint i8* %15 to i64
  %18 = and i64 %17, 7
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %80, label %20

20:                                               ; preds = %14
  %21 = load i8, i8* %15, align 1, !tbaa !3
  store i8 %21, i8* %16, align 1, !tbaa !3
  %22 = icmp eq i8 %21, 0
  br i1 %22, label %120, label %23

23:                                               ; preds = %20
  %24 = getelementptr inbounds i8, i8* %1, i64 2
  %25 = getelementptr inbounds i8, i8* %0, i64 2
  %26 = ptrtoint i8* %24 to i64
  %27 = and i64 %26, 7
  %28 = icmp eq i64 %27, 0
  br i1 %28, label %80, label %29

29:                                               ; preds = %23
  %30 = load i8, i8* %24, align 1, !tbaa !3
  store i8 %30, i8* %25, align 1, !tbaa !3
  %31 = icmp eq i8 %30, 0
  br i1 %31, label %120, label %32

32:                                               ; preds = %29
  %33 = getelementptr inbounds i8, i8* %1, i64 3
  %34 = getelementptr inbounds i8, i8* %0, i64 3
  %35 = ptrtoint i8* %33 to i64
  %36 = and i64 %35, 7
  %37 = icmp eq i64 %36, 0
  br i1 %37, label %80, label %38

38:                                               ; preds = %32
  %39 = load i8, i8* %33, align 1, !tbaa !3
  store i8 %39, i8* %34, align 1, !tbaa !3
  %40 = icmp eq i8 %39, 0
  br i1 %40, label %120, label %41

41:                                               ; preds = %38
  %42 = getelementptr inbounds i8, i8* %1, i64 4
  %43 = getelementptr inbounds i8, i8* %0, i64 4
  %44 = ptrtoint i8* %42 to i64
  %45 = and i64 %44, 7
  %46 = icmp eq i64 %45, 0
  br i1 %46, label %80, label %47

47:                                               ; preds = %41
  %48 = load i8, i8* %42, align 1, !tbaa !3
  store i8 %48, i8* %43, align 1, !tbaa !3
  %49 = icmp eq i8 %48, 0
  br i1 %49, label %120, label %50

50:                                               ; preds = %47
  %51 = getelementptr inbounds i8, i8* %1, i64 5
  %52 = getelementptr inbounds i8, i8* %0, i64 5
  %53 = ptrtoint i8* %51 to i64
  %54 = and i64 %53, 7
  %55 = icmp eq i64 %54, 0
  br i1 %55, label %80, label %56

56:                                               ; preds = %50
  %57 = load i8, i8* %51, align 1, !tbaa !3
  store i8 %57, i8* %52, align 1, !tbaa !3
  %58 = icmp eq i8 %57, 0
  br i1 %58, label %120, label %59

59:                                               ; preds = %56
  %60 = getelementptr inbounds i8, i8* %1, i64 6
  %61 = getelementptr inbounds i8, i8* %0, i64 6
  %62 = ptrtoint i8* %60 to i64
  %63 = and i64 %62, 7
  %64 = icmp eq i64 %63, 0
  br i1 %64, label %80, label %65

65:                                               ; preds = %59
  %66 = load i8, i8* %60, align 1, !tbaa !3
  store i8 %66, i8* %61, align 1, !tbaa !3
  %67 = icmp eq i8 %66, 0
  br i1 %67, label %120, label %68

68:                                               ; preds = %65
  %69 = getelementptr inbounds i8, i8* %1, i64 7
  %70 = getelementptr inbounds i8, i8* %0, i64 7
  %71 = ptrtoint i8* %69 to i64
  %72 = and i64 %71, 7
  %73 = icmp eq i64 %72, 0
  br i1 %73, label %80, label %74

74:                                               ; preds = %68
  %75 = load i8, i8* %69, align 1, !tbaa !3
  store i8 %75, i8* %70, align 1, !tbaa !3
  %76 = icmp eq i8 %75, 0
  br i1 %76, label %120, label %77

77:                                               ; preds = %74
  %78 = getelementptr inbounds i8, i8* %1, i64 8
  %79 = getelementptr inbounds i8, i8* %0, i64 8
  br label %80

80:                                               ; preds = %14, %23, %32, %41, %50, %59, %68, %77, %8
  %81 = phi i8* [ %0, %8 ], [ %16, %14 ], [ %25, %23 ], [ %34, %32 ], [ %43, %41 ], [ %52, %50 ], [ %61, %59 ], [ %70, %68 ], [ %79, %77 ]
  %82 = phi i8* [ %1, %8 ], [ %15, %14 ], [ %24, %23 ], [ %33, %32 ], [ %42, %41 ], [ %51, %50 ], [ %60, %59 ], [ %69, %68 ], [ %78, %77 ]
  %83 = bitcast i8* %81 to i64*
  %84 = bitcast i8* %82 to i64*
  %85 = load i64, i64* %84, align 8, !tbaa !3
  %86 = add i64 %85, -72340172838076673
  %87 = and i64 %85, -9187201950435737472
  %88 = xor i64 %87, -9187201950435737472
  %89 = and i64 %88, %86
  %90 = icmp eq i64 %89, 0
  br i1 %90, label %91, label %103

91:                                               ; preds = %80, %91
  %92 = phi i64 [ %97, %91 ], [ %85, %80 ]
  %93 = phi i64* [ %95, %91 ], [ %84, %80 ]
  %94 = phi i64* [ %96, %91 ], [ %83, %80 ]
  %95 = getelementptr inbounds i64, i64* %93, i64 1
  %96 = getelementptr inbounds i64, i64* %94, i64 1
  store i64 %92, i64* %94, align 8, !tbaa !3
  %97 = load i64, i64* %95, align 8, !tbaa !3
  %98 = add i64 %97, -72340172838076673
  %99 = and i64 %97, -9187201950435737472
  %100 = xor i64 %99, -9187201950435737472
  %101 = and i64 %100, %98
  %102 = icmp eq i64 %101, 0
  br i1 %102, label %91, label %103

103:                                              ; preds = %91, %80
  %104 = phi i64* [ %83, %80 ], [ %96, %91 ]
  %105 = phi i64* [ %84, %80 ], [ %95, %91 ]
  %106 = bitcast i64* %104 to i8*
  %107 = bitcast i64* %105 to i8*
  br label %108

108:                                              ; preds = %103, %2
  %109 = phi i8* [ %106, %103 ], [ %0, %2 ]
  %110 = phi i8* [ %107, %103 ], [ %1, %2 ]
  %111 = load i8, i8* %110, align 1, !tbaa !3
  store i8 %111, i8* %109, align 1, !tbaa !3
  %112 = icmp eq i8 %111, 0
  br i1 %112, label %120, label %113

113:                                              ; preds = %108, %113
  %114 = phi i8* [ %116, %113 ], [ %110, %108 ]
  %115 = phi i8* [ %117, %113 ], [ %109, %108 ]
  %116 = getelementptr inbounds i8, i8* %114, i64 1
  %117 = getelementptr inbounds i8, i8* %115, i64 1
  %118 = load i8, i8* %116, align 1, !tbaa !3
  store i8 %118, i8* %117, align 1, !tbaa !3
  %119 = icmp eq i8 %118, 0
  br i1 %119, label %120, label %113

120:                                              ; preds = %11, %20, %29, %38, %47, %56, %65, %74, %113, %108
  %121 = phi i8* [ %109, %108 ], [ %117, %113 ], [ %0, %11 ], [ %16, %20 ], [ %25, %29 ], [ %34, %38 ], [ %43, %47 ], [ %52, %56 ], [ %61, %65 ], [ %70, %74 ]
  ret i8* %121
}

attributes #0 = { nofree norecurse nosync nounwind strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
