; ModuleID = 'src/string/stpncpy.c'
source_filename = "src/string/stpncpy.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@stpncpy = weak alias i8* (i8*, i8*, i64), i8* (i8*, i8*, i64)* @__stpncpy

; Function Attrs: nounwind strictfp
define hidden i8* @__stpncpy(i8* noalias noundef %0, i8* noalias noundef %1, i64 noundef %2) #0 {
  %4 = ptrtoint i8* %1 to i64
  %5 = ptrtoint i8* %0 to i64
  %6 = xor i64 %4, %5
  %7 = and i64 %6, 7
  %8 = icmp eq i64 %7, 0
  br i1 %8, label %9, label %139

9:                                                ; preds = %3
  %10 = and i64 %4, 7
  %11 = icmp ne i64 %10, 0
  %12 = icmp ne i64 %2, 0
  %13 = and i1 %11, %12
  br i1 %13, label %14, label %106

14:                                               ; preds = %9
  %15 = load i8, i8* %1, align 1, !tbaa !3
  store i8 %15, i8* %0, align 1, !tbaa !3
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %155, label %17

17:                                               ; preds = %14
  %18 = add i64 %2, -1
  %19 = getelementptr inbounds i8, i8* %1, i64 1
  %20 = getelementptr inbounds i8, i8* %0, i64 1
  %21 = ptrtoint i8* %19 to i64
  %22 = and i64 %21, 7
  %23 = icmp ne i64 %22, 0
  %24 = icmp ne i64 %18, 0
  %25 = and i1 %23, %24
  br i1 %25, label %26, label %106

26:                                               ; preds = %17
  %27 = load i8, i8* %19, align 1, !tbaa !3
  store i8 %27, i8* %20, align 1, !tbaa !3
  %28 = icmp eq i8 %27, 0
  br i1 %28, label %155, label %29

29:                                               ; preds = %26
  %30 = add i64 %2, -2
  %31 = getelementptr inbounds i8, i8* %1, i64 2
  %32 = getelementptr inbounds i8, i8* %0, i64 2
  %33 = ptrtoint i8* %31 to i64
  %34 = and i64 %33, 7
  %35 = icmp ne i64 %34, 0
  %36 = icmp ne i64 %30, 0
  %37 = and i1 %35, %36
  br i1 %37, label %38, label %106

38:                                               ; preds = %29
  %39 = load i8, i8* %31, align 1, !tbaa !3
  store i8 %39, i8* %32, align 1, !tbaa !3
  %40 = icmp eq i8 %39, 0
  br i1 %40, label %155, label %41

41:                                               ; preds = %38
  %42 = add i64 %2, -3
  %43 = getelementptr inbounds i8, i8* %1, i64 3
  %44 = getelementptr inbounds i8, i8* %0, i64 3
  %45 = ptrtoint i8* %43 to i64
  %46 = and i64 %45, 7
  %47 = icmp ne i64 %46, 0
  %48 = icmp ne i64 %42, 0
  %49 = and i1 %47, %48
  br i1 %49, label %50, label %106

50:                                               ; preds = %41
  %51 = load i8, i8* %43, align 1, !tbaa !3
  store i8 %51, i8* %44, align 1, !tbaa !3
  %52 = icmp eq i8 %51, 0
  br i1 %52, label %155, label %53

53:                                               ; preds = %50
  %54 = add i64 %2, -4
  %55 = getelementptr inbounds i8, i8* %1, i64 4
  %56 = getelementptr inbounds i8, i8* %0, i64 4
  %57 = ptrtoint i8* %55 to i64
  %58 = and i64 %57, 7
  %59 = icmp ne i64 %58, 0
  %60 = icmp ne i64 %54, 0
  %61 = and i1 %59, %60
  br i1 %61, label %62, label %106

62:                                               ; preds = %53
  %63 = load i8, i8* %55, align 1, !tbaa !3
  store i8 %63, i8* %56, align 1, !tbaa !3
  %64 = icmp eq i8 %63, 0
  br i1 %64, label %155, label %65

65:                                               ; preds = %62
  %66 = add i64 %2, -5
  %67 = getelementptr inbounds i8, i8* %1, i64 5
  %68 = getelementptr inbounds i8, i8* %0, i64 5
  %69 = ptrtoint i8* %67 to i64
  %70 = and i64 %69, 7
  %71 = icmp ne i64 %70, 0
  %72 = icmp ne i64 %66, 0
  %73 = and i1 %71, %72
  br i1 %73, label %74, label %106

74:                                               ; preds = %65
  %75 = load i8, i8* %67, align 1, !tbaa !3
  store i8 %75, i8* %68, align 1, !tbaa !3
  %76 = icmp eq i8 %75, 0
  br i1 %76, label %155, label %77

77:                                               ; preds = %74
  %78 = add i64 %2, -6
  %79 = getelementptr inbounds i8, i8* %1, i64 6
  %80 = getelementptr inbounds i8, i8* %0, i64 6
  %81 = ptrtoint i8* %79 to i64
  %82 = and i64 %81, 7
  %83 = icmp ne i64 %82, 0
  %84 = icmp ne i64 %78, 0
  %85 = and i1 %83, %84
  br i1 %85, label %86, label %106

86:                                               ; preds = %77
  %87 = load i8, i8* %79, align 1, !tbaa !3
  store i8 %87, i8* %80, align 1, !tbaa !3
  %88 = icmp eq i8 %87, 0
  br i1 %88, label %155, label %89

89:                                               ; preds = %86
  %90 = add i64 %2, -7
  %91 = getelementptr inbounds i8, i8* %1, i64 7
  %92 = getelementptr inbounds i8, i8* %0, i64 7
  %93 = ptrtoint i8* %91 to i64
  %94 = and i64 %93, 7
  %95 = icmp ne i64 %94, 0
  %96 = icmp ne i64 %90, 0
  %97 = and i1 %95, %96
  br i1 %97, label %98, label %106

98:                                               ; preds = %89
  %99 = load i8, i8* %91, align 1, !tbaa !3
  store i8 %99, i8* %92, align 1, !tbaa !3
  %100 = icmp eq i8 %99, 0
  br i1 %100, label %155, label %101

101:                                              ; preds = %98
  %102 = add i64 %2, -8
  %103 = getelementptr inbounds i8, i8* %1, i64 8
  %104 = getelementptr inbounds i8, i8* %0, i64 8
  %105 = icmp ne i64 %102, 0
  br label %106

106:                                              ; preds = %17, %29, %41, %53, %65, %77, %89, %101, %9
  %107 = phi i8* [ %0, %9 ], [ %20, %17 ], [ %32, %29 ], [ %44, %41 ], [ %56, %53 ], [ %68, %65 ], [ %80, %77 ], [ %92, %89 ], [ %104, %101 ]
  %108 = phi i8* [ %1, %9 ], [ %19, %17 ], [ %31, %29 ], [ %43, %41 ], [ %55, %53 ], [ %67, %65 ], [ %79, %77 ], [ %91, %89 ], [ %103, %101 ]
  %109 = phi i64 [ %2, %9 ], [ %18, %17 ], [ %30, %29 ], [ %42, %41 ], [ %54, %53 ], [ %66, %65 ], [ %78, %77 ], [ %90, %89 ], [ %102, %101 ]
  %110 = phi i1 [ %12, %9 ], [ %24, %17 ], [ %36, %29 ], [ %48, %41 ], [ %60, %53 ], [ %72, %65 ], [ %84, %77 ], [ %96, %89 ], [ %105, %101 ]
  br i1 %110, label %111, label %155

111:                                              ; preds = %106
  %112 = load i8, i8* %108, align 1, !tbaa !3
  %113 = icmp eq i8 %112, 0
  br i1 %113, label %155, label %114

114:                                              ; preds = %111
  %115 = bitcast i8* %107 to i64*
  %116 = bitcast i8* %108 to i64*
  %117 = icmp ugt i64 %109, 7
  br i1 %117, label %118, label %133

118:                                              ; preds = %114, %128
  %119 = phi i64* [ %130, %128 ], [ %116, %114 ]
  %120 = phi i64* [ %131, %128 ], [ %115, %114 ]
  %121 = phi i64 [ %129, %128 ], [ %109, %114 ]
  %122 = load i64, i64* %119, align 8, !tbaa !3
  %123 = add i64 %122, -72340172838076673
  %124 = and i64 %122, -9187201950435737472
  %125 = xor i64 %124, -9187201950435737472
  %126 = and i64 %125, %123
  %127 = icmp eq i64 %126, 0
  br i1 %127, label %128, label %133

128:                                              ; preds = %118
  store i64 %122, i64* %120, align 8, !tbaa !3
  %129 = add i64 %121, -8
  %130 = getelementptr inbounds i64, i64* %119, i64 1
  %131 = getelementptr inbounds i64, i64* %120, i64 1
  %132 = icmp ugt i64 %129, 7
  br i1 %132, label %118, label %133

133:                                              ; preds = %118, %128, %114
  %134 = phi i64 [ %109, %114 ], [ %129, %128 ], [ %121, %118 ]
  %135 = phi i64* [ %115, %114 ], [ %131, %128 ], [ %120, %118 ]
  %136 = phi i64* [ %116, %114 ], [ %130, %128 ], [ %119, %118 ]
  %137 = bitcast i64* %135 to i8*
  %138 = bitcast i64* %136 to i8*
  br label %139

139:                                              ; preds = %133, %3
  %140 = phi i8* [ %137, %133 ], [ %0, %3 ]
  %141 = phi i8* [ %138, %133 ], [ %1, %3 ]
  %142 = phi i64 [ %134, %133 ], [ %2, %3 ]
  %143 = icmp eq i64 %142, 0
  br i1 %143, label %155, label %144

144:                                              ; preds = %139, %150
  %145 = phi i64 [ %151, %150 ], [ %142, %139 ]
  %146 = phi i8* [ %152, %150 ], [ %141, %139 ]
  %147 = phi i8* [ %153, %150 ], [ %140, %139 ]
  %148 = load i8, i8* %146, align 1, !tbaa !3
  store i8 %148, i8* %147, align 1, !tbaa !3
  %149 = icmp eq i8 %148, 0
  br i1 %149, label %155, label %150

150:                                              ; preds = %144
  %151 = add i64 %145, -1
  %152 = getelementptr inbounds i8, i8* %146, i64 1
  %153 = getelementptr inbounds i8, i8* %147, i64 1
  %154 = icmp eq i64 %151, 0
  br i1 %154, label %155, label %144

155:                                              ; preds = %14, %26, %38, %50, %62, %74, %86, %98, %150, %144, %139, %106, %111
  %156 = phi i8* [ %107, %111 ], [ %107, %106 ], [ %140, %139 ], [ %153, %150 ], [ %147, %144 ], [ %0, %14 ], [ %20, %26 ], [ %32, %38 ], [ %44, %50 ], [ %56, %62 ], [ %68, %74 ], [ %80, %86 ], [ %92, %98 ]
  %157 = phi i64 [ %109, %111 ], [ 0, %106 ], [ 0, %139 ], [ 0, %150 ], [ %145, %144 ], [ %2, %14 ], [ %18, %26 ], [ %30, %38 ], [ %42, %50 ], [ %54, %62 ], [ %66, %74 ], [ %78, %86 ], [ %90, %98 ]
  %158 = tail call i8* @memset(i8* noundef %156, i32 noundef 0, i64 noundef %157) #2
  ret i8* %156
}

declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #1

attributes #0 = { nounwind strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
