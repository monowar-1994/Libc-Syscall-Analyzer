; ModuleID = 'src/string/strlcpy.c'
source_filename = "src/string/strlcpy.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind strictfp
define i64 @strlcpy(i8* noundef %0, i8* noundef %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = add i64 %2, -1
  %5 = icmp eq i64 %2, 0
  br i1 %5, label %6, label %8

6:                                                ; preds = %3
  %7 = ptrtoint i8* %0 to i64
  br label %167

8:                                                ; preds = %3
  %9 = ptrtoint i8* %1 to i64
  %10 = ptrtoint i8* %0 to i64
  %11 = xor i64 %9, %10
  %12 = and i64 %11, 7
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %14, label %147

14:                                               ; preds = %8
  %15 = and i64 %9, 7
  %16 = icmp ne i64 %15, 0
  %17 = icmp ne i64 %4, 0
  %18 = and i1 %16, %17
  br i1 %18, label %19, label %111

19:                                               ; preds = %14
  %20 = load i8, i8* %1, align 1, !tbaa !3
  store i8 %20, i8* %0, align 1, !tbaa !3
  %21 = icmp eq i8 %20, 0
  br i1 %21, label %116, label %22

22:                                               ; preds = %19
  %23 = add i64 %2, -2
  %24 = getelementptr inbounds i8, i8* %1, i64 1
  %25 = getelementptr inbounds i8, i8* %0, i64 1
  %26 = ptrtoint i8* %24 to i64
  %27 = and i64 %26, 7
  %28 = icmp ne i64 %27, 0
  %29 = icmp ne i64 %23, 0
  %30 = and i1 %28, %29
  br i1 %30, label %31, label %111

31:                                               ; preds = %22
  %32 = load i8, i8* %24, align 1, !tbaa !3
  store i8 %32, i8* %25, align 1, !tbaa !3
  %33 = icmp eq i8 %32, 0
  br i1 %33, label %116, label %34

34:                                               ; preds = %31
  %35 = add i64 %2, -3
  %36 = getelementptr inbounds i8, i8* %1, i64 2
  %37 = getelementptr inbounds i8, i8* %0, i64 2
  %38 = ptrtoint i8* %36 to i64
  %39 = and i64 %38, 7
  %40 = icmp ne i64 %39, 0
  %41 = icmp ne i64 %35, 0
  %42 = and i1 %40, %41
  br i1 %42, label %43, label %111

43:                                               ; preds = %34
  %44 = load i8, i8* %36, align 1, !tbaa !3
  store i8 %44, i8* %37, align 1, !tbaa !3
  %45 = icmp eq i8 %44, 0
  br i1 %45, label %116, label %46

46:                                               ; preds = %43
  %47 = add i64 %2, -4
  %48 = getelementptr inbounds i8, i8* %1, i64 3
  %49 = getelementptr inbounds i8, i8* %0, i64 3
  %50 = ptrtoint i8* %48 to i64
  %51 = and i64 %50, 7
  %52 = icmp ne i64 %51, 0
  %53 = icmp ne i64 %47, 0
  %54 = and i1 %52, %53
  br i1 %54, label %55, label %111

55:                                               ; preds = %46
  %56 = load i8, i8* %48, align 1, !tbaa !3
  store i8 %56, i8* %49, align 1, !tbaa !3
  %57 = icmp eq i8 %56, 0
  br i1 %57, label %116, label %58

58:                                               ; preds = %55
  %59 = add i64 %2, -5
  %60 = getelementptr inbounds i8, i8* %1, i64 4
  %61 = getelementptr inbounds i8, i8* %0, i64 4
  %62 = ptrtoint i8* %60 to i64
  %63 = and i64 %62, 7
  %64 = icmp ne i64 %63, 0
  %65 = icmp ne i64 %59, 0
  %66 = and i1 %64, %65
  br i1 %66, label %67, label %111

67:                                               ; preds = %58
  %68 = load i8, i8* %60, align 1, !tbaa !3
  store i8 %68, i8* %61, align 1, !tbaa !3
  %69 = icmp eq i8 %68, 0
  br i1 %69, label %116, label %70

70:                                               ; preds = %67
  %71 = add i64 %2, -6
  %72 = getelementptr inbounds i8, i8* %1, i64 5
  %73 = getelementptr inbounds i8, i8* %0, i64 5
  %74 = ptrtoint i8* %72 to i64
  %75 = and i64 %74, 7
  %76 = icmp ne i64 %75, 0
  %77 = icmp ne i64 %71, 0
  %78 = and i1 %76, %77
  br i1 %78, label %79, label %111

79:                                               ; preds = %70
  %80 = load i8, i8* %72, align 1, !tbaa !3
  store i8 %80, i8* %73, align 1, !tbaa !3
  %81 = icmp eq i8 %80, 0
  br i1 %81, label %116, label %82

82:                                               ; preds = %79
  %83 = add i64 %2, -7
  %84 = getelementptr inbounds i8, i8* %1, i64 6
  %85 = getelementptr inbounds i8, i8* %0, i64 6
  %86 = ptrtoint i8* %84 to i64
  %87 = and i64 %86, 7
  %88 = icmp ne i64 %87, 0
  %89 = icmp ne i64 %83, 0
  %90 = and i1 %88, %89
  br i1 %90, label %91, label %111

91:                                               ; preds = %82
  %92 = load i8, i8* %84, align 1, !tbaa !3
  store i8 %92, i8* %85, align 1, !tbaa !3
  %93 = icmp eq i8 %92, 0
  br i1 %93, label %116, label %94

94:                                               ; preds = %91
  %95 = add i64 %2, -8
  %96 = getelementptr inbounds i8, i8* %1, i64 7
  %97 = getelementptr inbounds i8, i8* %0, i64 7
  %98 = ptrtoint i8* %96 to i64
  %99 = and i64 %98, 7
  %100 = icmp ne i64 %99, 0
  %101 = icmp ne i64 %95, 0
  %102 = and i1 %100, %101
  br i1 %102, label %103, label %111

103:                                              ; preds = %94
  %104 = load i8, i8* %96, align 1, !tbaa !3
  store i8 %104, i8* %97, align 1, !tbaa !3
  %105 = icmp eq i8 %104, 0
  br i1 %105, label %116, label %106

106:                                              ; preds = %103
  %107 = add i64 %2, -9
  %108 = getelementptr inbounds i8, i8* %1, i64 8
  %109 = getelementptr inbounds i8, i8* %0, i64 8
  %110 = icmp ne i64 %107, 0
  br label %111

111:                                              ; preds = %22, %34, %46, %58, %70, %82, %94, %106, %14
  %112 = phi i8* [ %1, %14 ], [ %24, %22 ], [ %36, %34 ], [ %48, %46 ], [ %60, %58 ], [ %72, %70 ], [ %84, %82 ], [ %96, %94 ], [ %108, %106 ]
  %113 = phi i64 [ %4, %14 ], [ %23, %22 ], [ %35, %34 ], [ %47, %46 ], [ %59, %58 ], [ %71, %70 ], [ %83, %82 ], [ %95, %94 ], [ %107, %106 ]
  %114 = phi i8* [ %0, %14 ], [ %25, %22 ], [ %37, %34 ], [ %49, %46 ], [ %61, %58 ], [ %73, %70 ], [ %85, %82 ], [ %97, %94 ], [ %109, %106 ]
  %115 = phi i1 [ %17, %14 ], [ %29, %22 ], [ %41, %34 ], [ %53, %46 ], [ %65, %58 ], [ %77, %70 ], [ %89, %82 ], [ %101, %94 ], [ %110, %106 ]
  br i1 %115, label %116, label %163

116:                                              ; preds = %19, %31, %43, %55, %67, %79, %91, %103, %111
  %117 = phi i8* [ %114, %111 ], [ %0, %19 ], [ %25, %31 ], [ %37, %43 ], [ %49, %55 ], [ %61, %67 ], [ %73, %79 ], [ %85, %91 ], [ %97, %103 ]
  %118 = phi i64 [ %113, %111 ], [ %4, %19 ], [ %23, %31 ], [ %35, %43 ], [ %47, %55 ], [ %59, %67 ], [ %71, %79 ], [ %83, %91 ], [ %95, %103 ]
  %119 = phi i8* [ %112, %111 ], [ %1, %19 ], [ %24, %31 ], [ %36, %43 ], [ %48, %55 ], [ %60, %67 ], [ %72, %79 ], [ %84, %91 ], [ %96, %103 ]
  %120 = load i8, i8* %119, align 1, !tbaa !3
  %121 = icmp eq i8 %120, 0
  br i1 %121, label %147, label %122

122:                                              ; preds = %116
  %123 = bitcast i8* %117 to i64*
  %124 = bitcast i8* %119 to i64*
  %125 = icmp ugt i64 %118, 7
  br i1 %125, label %126, label %141

126:                                              ; preds = %122, %136
  %127 = phi i64* [ %138, %136 ], [ %124, %122 ]
  %128 = phi i64* [ %139, %136 ], [ %123, %122 ]
  %129 = phi i64 [ %137, %136 ], [ %118, %122 ]
  %130 = load i64, i64* %127, align 8, !tbaa !3
  %131 = add i64 %130, -72340172838076673
  %132 = and i64 %130, -9187201950435737472
  %133 = xor i64 %132, -9187201950435737472
  %134 = and i64 %133, %131
  %135 = icmp eq i64 %134, 0
  br i1 %135, label %136, label %141

136:                                              ; preds = %126
  store i64 %130, i64* %128, align 8, !tbaa !6
  %137 = add i64 %129, -8
  %138 = getelementptr inbounds i64, i64* %127, i64 1
  %139 = getelementptr inbounds i64, i64* %128, i64 1
  %140 = icmp ugt i64 %137, 7
  br i1 %140, label %126, label %141

141:                                              ; preds = %126, %136, %122
  %142 = phi i64 [ %118, %122 ], [ %137, %136 ], [ %129, %126 ]
  %143 = phi i64* [ %123, %122 ], [ %139, %136 ], [ %128, %126 ]
  %144 = phi i64* [ %124, %122 ], [ %138, %136 ], [ %127, %126 ]
  %145 = bitcast i64* %143 to i8*
  %146 = bitcast i64* %144 to i8*
  br label %147

147:                                              ; preds = %116, %141, %8
  %148 = phi i8* [ %146, %141 ], [ %119, %116 ], [ %1, %8 ]
  %149 = phi i64 [ %142, %141 ], [ %118, %116 ], [ %4, %8 ]
  %150 = phi i8* [ %145, %141 ], [ %117, %116 ], [ %0, %8 ]
  %151 = icmp eq i64 %149, 0
  br i1 %151, label %163, label %152

152:                                              ; preds = %147, %158
  %153 = phi i8* [ %161, %158 ], [ %150, %147 ]
  %154 = phi i64 [ %159, %158 ], [ %149, %147 ]
  %155 = phi i8* [ %160, %158 ], [ %148, %147 ]
  %156 = load i8, i8* %155, align 1, !tbaa !3
  store i8 %156, i8* %153, align 1, !tbaa !3
  %157 = icmp eq i8 %156, 0
  br i1 %157, label %163, label %158

158:                                              ; preds = %152
  %159 = add i64 %154, -1
  %160 = getelementptr inbounds i8, i8* %155, i64 1
  %161 = getelementptr inbounds i8, i8* %153, i64 1
  %162 = icmp eq i64 %159, 0
  br i1 %162, label %163, label %152

163:                                              ; preds = %152, %158, %111, %147
  %164 = phi i8* [ %148, %147 ], [ %112, %111 ], [ %160, %158 ], [ %155, %152 ]
  %165 = phi i8* [ %150, %147 ], [ %114, %111 ], [ %161, %158 ], [ %153, %152 ]
  store i8 0, i8* %165, align 1, !tbaa !3
  %166 = ptrtoint i8* %165 to i64
  br label %167

167:                                              ; preds = %6, %163
  %168 = phi i64 [ %7, %6 ], [ %166, %163 ]
  %169 = phi i64 [ %7, %6 ], [ %10, %163 ]
  %170 = phi i8* [ %1, %6 ], [ %164, %163 ]
  %171 = sub i64 %168, %169
  %172 = tail call i64 @strlen(i8* noundef %170) #2
  %173 = add i64 %171, %172
  ret i64 %173
}

declare i64 @strlen(i8* noundef) local_unnamed_addr #1

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
!6 = !{!7, !7, i64 0}
!7 = !{!"long", !4, i64 0}
