; ModuleID = 'src/string/memccpy.c'
source_filename = "src/string/memccpy.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind strictfp
define i8* @memccpy(i8* noalias noundef %0, i8* noalias noundef %1, i32 noundef %2, i64 noundef %3) local_unnamed_addr #0 {
  %5 = and i32 %2, 255
  %6 = ptrtoint i8* %1 to i64
  %7 = ptrtoint i8* %0 to i64
  %8 = xor i64 %6, %7
  %9 = and i64 %8, 7
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %11, label %147

11:                                               ; preds = %4
  %12 = and i64 %6, 7
  %13 = icmp ne i64 %12, 0
  %14 = icmp ne i64 %3, 0
  %15 = and i1 %13, %14
  br i1 %15, label %16, label %114

16:                                               ; preds = %11
  %17 = trunc i32 %2 to i8
  %18 = load i8, i8* %1, align 1, !tbaa !3
  store i8 %18, i8* %0, align 1, !tbaa !3
  %19 = icmp eq i8 %18, %17
  br i1 %19, label %20, label %23

20:                                               ; preds = %104, %92, %80, %68, %56, %44, %32, %16
  %21 = phi i8* [ %0, %16 ], [ %26, %32 ], [ %38, %44 ], [ %50, %56 ], [ %62, %68 ], [ %74, %80 ], [ %86, %92 ], [ %98, %104 ]
  %22 = getelementptr inbounds i8, i8* %21, i64 1
  br label %171

23:                                               ; preds = %16
  %24 = add i64 %3, -1
  %25 = getelementptr inbounds i8, i8* %1, i64 1
  %26 = getelementptr inbounds i8, i8* %0, i64 1
  %27 = ptrtoint i8* %25 to i64
  %28 = and i64 %27, 7
  %29 = icmp ne i64 %28, 0
  %30 = icmp ne i64 %24, 0
  %31 = and i1 %29, %30
  br i1 %31, label %32, label %114

32:                                               ; preds = %23
  %33 = load i8, i8* %25, align 1, !tbaa !3
  store i8 %33, i8* %26, align 1, !tbaa !3
  %34 = icmp eq i8 %33, %17
  br i1 %34, label %20, label %35

35:                                               ; preds = %32
  %36 = add i64 %3, -2
  %37 = getelementptr inbounds i8, i8* %1, i64 2
  %38 = getelementptr inbounds i8, i8* %0, i64 2
  %39 = ptrtoint i8* %37 to i64
  %40 = and i64 %39, 7
  %41 = icmp ne i64 %40, 0
  %42 = icmp ne i64 %36, 0
  %43 = and i1 %41, %42
  br i1 %43, label %44, label %114

44:                                               ; preds = %35
  %45 = load i8, i8* %37, align 1, !tbaa !3
  store i8 %45, i8* %38, align 1, !tbaa !3
  %46 = icmp eq i8 %45, %17
  br i1 %46, label %20, label %47

47:                                               ; preds = %44
  %48 = add i64 %3, -3
  %49 = getelementptr inbounds i8, i8* %1, i64 3
  %50 = getelementptr inbounds i8, i8* %0, i64 3
  %51 = ptrtoint i8* %49 to i64
  %52 = and i64 %51, 7
  %53 = icmp ne i64 %52, 0
  %54 = icmp ne i64 %48, 0
  %55 = and i1 %53, %54
  br i1 %55, label %56, label %114

56:                                               ; preds = %47
  %57 = load i8, i8* %49, align 1, !tbaa !3
  store i8 %57, i8* %50, align 1, !tbaa !3
  %58 = icmp eq i8 %57, %17
  br i1 %58, label %20, label %59

59:                                               ; preds = %56
  %60 = add i64 %3, -4
  %61 = getelementptr inbounds i8, i8* %1, i64 4
  %62 = getelementptr inbounds i8, i8* %0, i64 4
  %63 = ptrtoint i8* %61 to i64
  %64 = and i64 %63, 7
  %65 = icmp ne i64 %64, 0
  %66 = icmp ne i64 %60, 0
  %67 = and i1 %65, %66
  br i1 %67, label %68, label %114

68:                                               ; preds = %59
  %69 = load i8, i8* %61, align 1, !tbaa !3
  store i8 %69, i8* %62, align 1, !tbaa !3
  %70 = icmp eq i8 %69, %17
  br i1 %70, label %20, label %71

71:                                               ; preds = %68
  %72 = add i64 %3, -5
  %73 = getelementptr inbounds i8, i8* %1, i64 5
  %74 = getelementptr inbounds i8, i8* %0, i64 5
  %75 = ptrtoint i8* %73 to i64
  %76 = and i64 %75, 7
  %77 = icmp ne i64 %76, 0
  %78 = icmp ne i64 %72, 0
  %79 = and i1 %77, %78
  br i1 %79, label %80, label %114

80:                                               ; preds = %71
  %81 = load i8, i8* %73, align 1, !tbaa !3
  store i8 %81, i8* %74, align 1, !tbaa !3
  %82 = icmp eq i8 %81, %17
  br i1 %82, label %20, label %83

83:                                               ; preds = %80
  %84 = add i64 %3, -6
  %85 = getelementptr inbounds i8, i8* %1, i64 6
  %86 = getelementptr inbounds i8, i8* %0, i64 6
  %87 = ptrtoint i8* %85 to i64
  %88 = and i64 %87, 7
  %89 = icmp ne i64 %88, 0
  %90 = icmp ne i64 %84, 0
  %91 = and i1 %89, %90
  br i1 %91, label %92, label %114

92:                                               ; preds = %83
  %93 = load i8, i8* %85, align 1, !tbaa !3
  store i8 %93, i8* %86, align 1, !tbaa !3
  %94 = icmp eq i8 %93, %17
  br i1 %94, label %20, label %95

95:                                               ; preds = %92
  %96 = add i64 %3, -7
  %97 = getelementptr inbounds i8, i8* %1, i64 7
  %98 = getelementptr inbounds i8, i8* %0, i64 7
  %99 = ptrtoint i8* %97 to i64
  %100 = and i64 %99, 7
  %101 = icmp ne i64 %100, 0
  %102 = icmp ne i64 %96, 0
  %103 = and i1 %101, %102
  br i1 %103, label %104, label %114

104:                                              ; preds = %95
  %105 = load i8, i8* %97, align 1, !tbaa !3
  store i8 %105, i8* %98, align 1, !tbaa !3
  %106 = icmp eq i8 %105, %17
  br i1 %106, label %20, label %107

107:                                              ; preds = %104
  %108 = add i64 %3, -8
  %109 = getelementptr inbounds i8, i8* %1, i64 8
  %110 = getelementptr inbounds i8, i8* %0, i64 8
  %111 = ptrtoint i8* %109 to i64
  %112 = and i64 %111, 7
  %113 = icmp ne i64 %112, 0
  br label %114

114:                                              ; preds = %23, %35, %47, %59, %71, %83, %95, %107, %11
  %115 = phi i64 [ %3, %11 ], [ %24, %23 ], [ %36, %35 ], [ %48, %47 ], [ %60, %59 ], [ %72, %71 ], [ %84, %83 ], [ %96, %95 ], [ %108, %107 ]
  %116 = phi i8* [ %0, %11 ], [ %26, %23 ], [ %38, %35 ], [ %50, %47 ], [ %62, %59 ], [ %74, %71 ], [ %86, %83 ], [ %98, %95 ], [ %110, %107 ]
  %117 = phi i8* [ %1, %11 ], [ %25, %23 ], [ %37, %35 ], [ %49, %47 ], [ %61, %59 ], [ %73, %71 ], [ %85, %83 ], [ %97, %95 ], [ %109, %107 ]
  %118 = phi i1 [ %13, %11 ], [ %29, %23 ], [ %41, %35 ], [ %53, %47 ], [ %65, %59 ], [ %77, %71 ], [ %89, %83 ], [ %101, %95 ], [ %113, %107 ]
  br i1 %118, label %167, label %119

119:                                              ; preds = %114
  %120 = zext i32 %5 to i64
  %121 = mul nuw i64 %120, 72340172838076673
  %122 = bitcast i8* %116 to i64*
  %123 = bitcast i8* %117 to i64*
  %124 = icmp ugt i64 %115, 7
  br i1 %124, label %125, label %141

125:                                              ; preds = %119, %136
  %126 = phi i64* [ %138, %136 ], [ %123, %119 ]
  %127 = phi i64* [ %139, %136 ], [ %122, %119 ]
  %128 = phi i64 [ %137, %136 ], [ %115, %119 ]
  %129 = load i64, i64* %126, align 8, !tbaa !3
  %130 = xor i64 %129, %121
  %131 = add i64 %130, -72340172838076673
  %132 = and i64 %130, -9187201950435737472
  %133 = xor i64 %132, -9187201950435737472
  %134 = and i64 %133, %131
  %135 = icmp eq i64 %134, 0
  br i1 %135, label %136, label %141

136:                                              ; preds = %125
  store i64 %129, i64* %127, align 8, !tbaa !3
  %137 = add i64 %128, -8
  %138 = getelementptr inbounds i64, i64* %126, i64 1
  %139 = getelementptr inbounds i64, i64* %127, i64 1
  %140 = icmp ugt i64 %137, 7
  br i1 %140, label %125, label %141

141:                                              ; preds = %125, %136, %119
  %142 = phi i64 [ %115, %119 ], [ %137, %136 ], [ %128, %125 ]
  %143 = phi i64* [ %122, %119 ], [ %139, %136 ], [ %127, %125 ]
  %144 = phi i64* [ %123, %119 ], [ %138, %136 ], [ %126, %125 ]
  %145 = bitcast i64* %143 to i8*
  %146 = bitcast i64* %144 to i8*
  br label %147

147:                                              ; preds = %141, %4
  %148 = phi i64 [ %142, %141 ], [ %3, %4 ]
  %149 = phi i8* [ %145, %141 ], [ %0, %4 ]
  %150 = phi i8* [ %146, %141 ], [ %1, %4 ]
  %151 = icmp eq i64 %148, 0
  br i1 %151, label %170, label %152

152:                                              ; preds = %147
  %153 = trunc i32 %2 to i8
  br label %154

154:                                              ; preds = %152, %162
  %155 = phi i8* [ %150, %152 ], [ %164, %162 ]
  %156 = phi i8* [ %149, %152 ], [ %165, %162 ]
  %157 = phi i64 [ %148, %152 ], [ %163, %162 ]
  %158 = load i8, i8* %155, align 1, !tbaa !3
  store i8 %158, i8* %156, align 1, !tbaa !3
  %159 = icmp eq i8 %158, %153
  br i1 %159, label %160, label %162

160:                                              ; preds = %154
  %161 = getelementptr inbounds i8, i8* %156, i64 1
  br label %171

162:                                              ; preds = %154
  %163 = add i64 %157, -1
  %164 = getelementptr inbounds i8, i8* %155, i64 1
  %165 = getelementptr inbounds i8, i8* %156, i64 1
  %166 = icmp eq i64 %163, 0
  br i1 %166, label %170, label %154

167:                                              ; preds = %114
  %168 = icmp eq i64 %115, 0
  %169 = getelementptr inbounds i8, i8* %116, i64 1
  br i1 %168, label %170, label %171

170:                                              ; preds = %162, %147, %167
  br label %171

171:                                              ; preds = %20, %160, %167, %170
  %172 = phi i8* [ null, %170 ], [ %169, %167 ], [ %161, %160 ], [ %22, %20 ]
  ret i8* %172
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
