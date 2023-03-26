; ModuleID = 'src/string/memchr.c'
source_filename = "src/string/memchr.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind readonly strictfp
define i8* @memchr(i8* noundef %0, i32 noundef %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = and i32 %1, 255
  %5 = ptrtoint i8* %0 to i64
  %6 = and i64 %5, 7
  %7 = icmp ne i64 %6, 0
  %8 = icmp ne i64 %2, 0
  %9 = and i1 %7, %8
  br i1 %9, label %10, label %95

10:                                               ; preds = %3
  %11 = trunc i32 %1 to i8
  %12 = load i8, i8* %0, align 1, !tbaa !3
  %13 = icmp eq i8 %12, %11
  br i1 %13, label %99, label %14

14:                                               ; preds = %10
  %15 = getelementptr inbounds i8, i8* %0, i64 1
  %16 = add i64 %2, -1
  %17 = ptrtoint i8* %15 to i64
  %18 = and i64 %17, 7
  %19 = icmp ne i64 %18, 0
  %20 = icmp ne i64 %16, 0
  %21 = and i1 %19, %20
  br i1 %21, label %22, label %95

22:                                               ; preds = %14
  %23 = load i8, i8* %15, align 1, !tbaa !3
  %24 = icmp eq i8 %23, %11
  br i1 %24, label %99, label %25

25:                                               ; preds = %22
  %26 = getelementptr inbounds i8, i8* %0, i64 2
  %27 = add i64 %2, -2
  %28 = ptrtoint i8* %26 to i64
  %29 = and i64 %28, 7
  %30 = icmp ne i64 %29, 0
  %31 = icmp ne i64 %27, 0
  %32 = and i1 %30, %31
  br i1 %32, label %33, label %95

33:                                               ; preds = %25
  %34 = load i8, i8* %26, align 1, !tbaa !3
  %35 = icmp eq i8 %34, %11
  br i1 %35, label %99, label %36

36:                                               ; preds = %33
  %37 = getelementptr inbounds i8, i8* %0, i64 3
  %38 = add i64 %2, -3
  %39 = ptrtoint i8* %37 to i64
  %40 = and i64 %39, 7
  %41 = icmp ne i64 %40, 0
  %42 = icmp ne i64 %38, 0
  %43 = and i1 %41, %42
  br i1 %43, label %44, label %95

44:                                               ; preds = %36
  %45 = load i8, i8* %37, align 1, !tbaa !3
  %46 = icmp eq i8 %45, %11
  br i1 %46, label %99, label %47

47:                                               ; preds = %44
  %48 = getelementptr inbounds i8, i8* %0, i64 4
  %49 = add i64 %2, -4
  %50 = ptrtoint i8* %48 to i64
  %51 = and i64 %50, 7
  %52 = icmp ne i64 %51, 0
  %53 = icmp ne i64 %49, 0
  %54 = and i1 %52, %53
  br i1 %54, label %55, label %95

55:                                               ; preds = %47
  %56 = load i8, i8* %48, align 1, !tbaa !3
  %57 = icmp eq i8 %56, %11
  br i1 %57, label %99, label %58

58:                                               ; preds = %55
  %59 = getelementptr inbounds i8, i8* %0, i64 5
  %60 = add i64 %2, -5
  %61 = ptrtoint i8* %59 to i64
  %62 = and i64 %61, 7
  %63 = icmp ne i64 %62, 0
  %64 = icmp ne i64 %60, 0
  %65 = and i1 %63, %64
  br i1 %65, label %66, label %95

66:                                               ; preds = %58
  %67 = load i8, i8* %59, align 1, !tbaa !3
  %68 = icmp eq i8 %67, %11
  br i1 %68, label %99, label %69

69:                                               ; preds = %66
  %70 = getelementptr inbounds i8, i8* %0, i64 6
  %71 = add i64 %2, -6
  %72 = ptrtoint i8* %70 to i64
  %73 = and i64 %72, 7
  %74 = icmp ne i64 %73, 0
  %75 = icmp ne i64 %71, 0
  %76 = and i1 %74, %75
  br i1 %76, label %77, label %95

77:                                               ; preds = %69
  %78 = load i8, i8* %70, align 1, !tbaa !3
  %79 = icmp eq i8 %78, %11
  br i1 %79, label %99, label %80

80:                                               ; preds = %77
  %81 = getelementptr inbounds i8, i8* %0, i64 7
  %82 = add i64 %2, -7
  %83 = ptrtoint i8* %81 to i64
  %84 = and i64 %83, 7
  %85 = icmp ne i64 %84, 0
  %86 = icmp ne i64 %82, 0
  %87 = and i1 %85, %86
  br i1 %87, label %88, label %95

88:                                               ; preds = %80
  %89 = load i8, i8* %81, align 1, !tbaa !3
  %90 = icmp eq i8 %89, %11
  br i1 %90, label %99, label %91

91:                                               ; preds = %88
  %92 = getelementptr inbounds i8, i8* %0, i64 8
  %93 = add i64 %2, -8
  %94 = icmp ne i64 %93, 0
  br label %95

95:                                               ; preds = %14, %25, %36, %47, %58, %69, %80, %91, %3
  %96 = phi i64 [ %2, %3 ], [ %16, %14 ], [ %27, %25 ], [ %38, %36 ], [ %49, %47 ], [ %60, %58 ], [ %71, %69 ], [ %82, %80 ], [ %93, %91 ]
  %97 = phi i8* [ %0, %3 ], [ %15, %14 ], [ %26, %25 ], [ %37, %36 ], [ %48, %47 ], [ %59, %58 ], [ %70, %69 ], [ %81, %80 ], [ %92, %91 ]
  %98 = phi i1 [ %8, %3 ], [ %20, %14 ], [ %31, %25 ], [ %42, %36 ], [ %53, %47 ], [ %64, %58 ], [ %75, %69 ], [ %86, %80 ], [ %94, %91 ]
  br i1 %98, label %99, label %143

99:                                               ; preds = %10, %22, %33, %44, %55, %66, %77, %88, %95
  %100 = phi i8* [ %97, %95 ], [ %0, %10 ], [ %15, %22 ], [ %26, %33 ], [ %37, %44 ], [ %48, %55 ], [ %59, %66 ], [ %70, %77 ], [ %81, %88 ]
  %101 = phi i64 [ %96, %95 ], [ %2, %10 ], [ %16, %22 ], [ %27, %33 ], [ %38, %44 ], [ %49, %55 ], [ %60, %66 ], [ %71, %77 ], [ %82, %88 ]
  %102 = load i8, i8* %100, align 1, !tbaa !3
  %103 = trunc i32 %1 to i8
  %104 = icmp eq i8 %102, %103
  br i1 %104, label %128, label %105

105:                                              ; preds = %99
  %106 = zext i32 %4 to i64
  %107 = mul nuw i64 %106, 72340172838076673
  %108 = bitcast i8* %100 to i64*
  %109 = icmp ugt i64 %101, 7
  br i1 %109, label %110, label %124

110:                                              ; preds = %105, %120
  %111 = phi i64* [ %121, %120 ], [ %108, %105 ]
  %112 = phi i64 [ %122, %120 ], [ %101, %105 ]
  %113 = load i64, i64* %111, align 8, !tbaa !3
  %114 = xor i64 %113, %107
  %115 = add i64 %114, -72340172838076673
  %116 = and i64 %114, -9187201950435737472
  %117 = xor i64 %116, -9187201950435737472
  %118 = and i64 %117, %115
  %119 = icmp eq i64 %118, 0
  br i1 %119, label %120, label %124

120:                                              ; preds = %110
  %121 = getelementptr inbounds i64, i64* %111, i64 1
  %122 = add i64 %112, -8
  %123 = icmp ugt i64 %122, 7
  br i1 %123, label %110, label %124

124:                                              ; preds = %110, %120, %105
  %125 = phi i64 [ %101, %105 ], [ %122, %120 ], [ %112, %110 ]
  %126 = phi i64* [ %108, %105 ], [ %121, %120 ], [ %111, %110 ]
  %127 = bitcast i64* %126 to i8*
  br label %128

128:                                              ; preds = %124, %99
  %129 = phi i64 [ %125, %124 ], [ %101, %99 ]
  %130 = phi i8* [ %127, %124 ], [ %100, %99 ]
  %131 = icmp eq i64 %129, 0
  br i1 %131, label %143, label %132

132:                                              ; preds = %128
  %133 = trunc i32 %1 to i8
  br label %134

134:                                              ; preds = %132, %139
  %135 = phi i8* [ %130, %132 ], [ %140, %139 ]
  %136 = phi i64 [ %129, %132 ], [ %141, %139 ]
  %137 = load i8, i8* %135, align 1, !tbaa !3
  %138 = icmp eq i8 %137, %133
  br i1 %138, label %143, label %139

139:                                              ; preds = %134
  %140 = getelementptr inbounds i8, i8* %135, i64 1
  %141 = add i64 %136, -1
  %142 = icmp eq i64 %141, 0
  br i1 %142, label %143, label %134

143:                                              ; preds = %134, %139, %95, %128
  %144 = phi i8* [ null, %128 ], [ null, %95 ], [ null, %139 ], [ %135, %134 ]
  ret i8* %144
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
