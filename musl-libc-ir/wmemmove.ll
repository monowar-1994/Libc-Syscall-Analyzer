; ModuleID = 'src/string/wmemmove.c'
source_filename = "src/string/wmemmove.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind strictfp
define i32* @wmemmove(i32* noundef returned %0, i32* noundef %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = icmp eq i32* %0, %1
  br i1 %4, label %272, label %5

5:                                                ; preds = %3
  %6 = ptrtoint i32* %0 to i64
  %7 = ptrtoint i32* %1 to i64
  %8 = sub i64 %6, %7
  %9 = shl i64 %2, 2
  %10 = icmp ult i64 %8, %9
  %11 = icmp eq i64 %2, 0
  br i1 %10, label %126, label %12

12:                                               ; preds = %5
  br i1 %11, label %272, label %13

13:                                               ; preds = %12
  %14 = icmp ult i64 %2, 8
  br i1 %14, label %103, label %15

15:                                               ; preds = %13
  %16 = getelementptr i32, i32* %0, i64 %2
  %17 = getelementptr i32, i32* %1, i64 %2
  %18 = icmp ugt i32* %17, %0
  %19 = icmp ugt i32* %16, %1
  %20 = and i1 %18, %19
  br i1 %20, label %103, label %21

21:                                               ; preds = %15
  %22 = and i64 %2, -8
  %23 = and i64 %2, 7
  %24 = getelementptr i32, i32* %1, i64 %22
  %25 = getelementptr i32, i32* %0, i64 %22
  %26 = add i64 %22, -8
  %27 = lshr exact i64 %26, 3
  %28 = add nuw nsw i64 %27, 1
  %29 = and i64 %28, 3
  %30 = icmp ult i64 %26, 24
  br i1 %30, label %82, label %31

31:                                               ; preds = %21
  %32 = and i64 %28, 4611686018427387900
  br label %33

33:                                               ; preds = %33, %31
  %34 = phi i64 [ 0, %31 ], [ %79, %33 ]
  %35 = phi i64 [ 0, %31 ], [ %80, %33 ]
  %36 = getelementptr i32, i32* %1, i64 %34
  %37 = getelementptr i32, i32* %0, i64 %34
  %38 = bitcast i32* %36 to <4 x i32>*
  %39 = load <4 x i32>, <4 x i32>* %38, align 4, !tbaa !3, !alias.scope !7
  %40 = getelementptr i32, i32* %36, i64 4
  %41 = bitcast i32* %40 to <4 x i32>*
  %42 = load <4 x i32>, <4 x i32>* %41, align 4, !tbaa !3, !alias.scope !7
  %43 = bitcast i32* %37 to <4 x i32>*
  store <4 x i32> %39, <4 x i32>* %43, align 4, !tbaa !3, !alias.scope !10, !noalias !7
  %44 = getelementptr i32, i32* %37, i64 4
  %45 = bitcast i32* %44 to <4 x i32>*
  store <4 x i32> %42, <4 x i32>* %45, align 4, !tbaa !3, !alias.scope !10, !noalias !7
  %46 = or i64 %34, 8
  %47 = getelementptr i32, i32* %1, i64 %46
  %48 = getelementptr i32, i32* %0, i64 %46
  %49 = bitcast i32* %47 to <4 x i32>*
  %50 = load <4 x i32>, <4 x i32>* %49, align 4, !tbaa !3, !alias.scope !7
  %51 = getelementptr i32, i32* %47, i64 4
  %52 = bitcast i32* %51 to <4 x i32>*
  %53 = load <4 x i32>, <4 x i32>* %52, align 4, !tbaa !3, !alias.scope !7
  %54 = bitcast i32* %48 to <4 x i32>*
  store <4 x i32> %50, <4 x i32>* %54, align 4, !tbaa !3, !alias.scope !10, !noalias !7
  %55 = getelementptr i32, i32* %48, i64 4
  %56 = bitcast i32* %55 to <4 x i32>*
  store <4 x i32> %53, <4 x i32>* %56, align 4, !tbaa !3, !alias.scope !10, !noalias !7
  %57 = or i64 %34, 16
  %58 = getelementptr i32, i32* %1, i64 %57
  %59 = getelementptr i32, i32* %0, i64 %57
  %60 = bitcast i32* %58 to <4 x i32>*
  %61 = load <4 x i32>, <4 x i32>* %60, align 4, !tbaa !3, !alias.scope !7
  %62 = getelementptr i32, i32* %58, i64 4
  %63 = bitcast i32* %62 to <4 x i32>*
  %64 = load <4 x i32>, <4 x i32>* %63, align 4, !tbaa !3, !alias.scope !7
  %65 = bitcast i32* %59 to <4 x i32>*
  store <4 x i32> %61, <4 x i32>* %65, align 4, !tbaa !3, !alias.scope !10, !noalias !7
  %66 = getelementptr i32, i32* %59, i64 4
  %67 = bitcast i32* %66 to <4 x i32>*
  store <4 x i32> %64, <4 x i32>* %67, align 4, !tbaa !3, !alias.scope !10, !noalias !7
  %68 = or i64 %34, 24
  %69 = getelementptr i32, i32* %1, i64 %68
  %70 = getelementptr i32, i32* %0, i64 %68
  %71 = bitcast i32* %69 to <4 x i32>*
  %72 = load <4 x i32>, <4 x i32>* %71, align 4, !tbaa !3, !alias.scope !7
  %73 = getelementptr i32, i32* %69, i64 4
  %74 = bitcast i32* %73 to <4 x i32>*
  %75 = load <4 x i32>, <4 x i32>* %74, align 4, !tbaa !3, !alias.scope !7
  %76 = bitcast i32* %70 to <4 x i32>*
  store <4 x i32> %72, <4 x i32>* %76, align 4, !tbaa !3, !alias.scope !10, !noalias !7
  %77 = getelementptr i32, i32* %70, i64 4
  %78 = bitcast i32* %77 to <4 x i32>*
  store <4 x i32> %75, <4 x i32>* %78, align 4, !tbaa !3, !alias.scope !10, !noalias !7
  %79 = add nuw i64 %34, 32
  %80 = add i64 %35, 4
  %81 = icmp eq i64 %80, %32
  br i1 %81, label %82, label %33, !llvm.loop !12

82:                                               ; preds = %33, %21
  %83 = phi i64 [ 0, %21 ], [ %79, %33 ]
  %84 = icmp eq i64 %29, 0
  br i1 %84, label %101, label %85

85:                                               ; preds = %82, %85
  %86 = phi i64 [ %98, %85 ], [ %83, %82 ]
  %87 = phi i64 [ %99, %85 ], [ 0, %82 ]
  %88 = getelementptr i32, i32* %1, i64 %86
  %89 = getelementptr i32, i32* %0, i64 %86
  %90 = bitcast i32* %88 to <4 x i32>*
  %91 = load <4 x i32>, <4 x i32>* %90, align 4, !tbaa !3, !alias.scope !7
  %92 = getelementptr i32, i32* %88, i64 4
  %93 = bitcast i32* %92 to <4 x i32>*
  %94 = load <4 x i32>, <4 x i32>* %93, align 4, !tbaa !3, !alias.scope !7
  %95 = bitcast i32* %89 to <4 x i32>*
  store <4 x i32> %91, <4 x i32>* %95, align 4, !tbaa !3, !alias.scope !10, !noalias !7
  %96 = getelementptr i32, i32* %89, i64 4
  %97 = bitcast i32* %96 to <4 x i32>*
  store <4 x i32> %94, <4 x i32>* %97, align 4, !tbaa !3, !alias.scope !10, !noalias !7
  %98 = add nuw i64 %86, 8
  %99 = add i64 %87, 1
  %100 = icmp eq i64 %99, %29
  br i1 %100, label %101, label %85, !llvm.loop !14

101:                                              ; preds = %85, %82
  %102 = icmp eq i64 %22, %2
  br i1 %102, label %272, label %103

103:                                              ; preds = %15, %13, %101
  %104 = phi i64 [ %2, %15 ], [ %2, %13 ], [ %23, %101 ]
  %105 = phi i32* [ %1, %15 ], [ %1, %13 ], [ %24, %101 ]
  %106 = phi i32* [ %0, %15 ], [ %0, %13 ], [ %25, %101 ]
  %107 = add i64 %104, -1
  %108 = and i64 %104, 7
  %109 = icmp eq i64 %108, 0
  br i1 %109, label %121, label %110

110:                                              ; preds = %103, %110
  %111 = phi i64 [ %115, %110 ], [ %104, %103 ]
  %112 = phi i32* [ %116, %110 ], [ %105, %103 ]
  %113 = phi i32* [ %118, %110 ], [ %106, %103 ]
  %114 = phi i64 [ %119, %110 ], [ 0, %103 ]
  %115 = add i64 %111, -1
  %116 = getelementptr inbounds i32, i32* %112, i64 1
  %117 = load i32, i32* %112, align 4, !tbaa !3
  %118 = getelementptr inbounds i32, i32* %113, i64 1
  store i32 %117, i32* %113, align 4, !tbaa !3
  %119 = add i64 %114, 1
  %120 = icmp eq i64 %119, %108
  br i1 %120, label %121, label %110, !llvm.loop !16

121:                                              ; preds = %110, %103
  %122 = phi i64 [ %104, %103 ], [ %115, %110 ]
  %123 = phi i32* [ %105, %103 ], [ %116, %110 ]
  %124 = phi i32* [ %106, %103 ], [ %118, %110 ]
  %125 = icmp ult i64 %107, 7
  br i1 %125, label %272, label %242

126:                                              ; preds = %5
  br i1 %11, label %272, label %127

127:                                              ; preds = %126
  %128 = icmp ult i64 %2, 8
  br i1 %128, label %206, label %129

129:                                              ; preds = %127
  %130 = getelementptr i32, i32* %0, i64 %2
  %131 = getelementptr i32, i32* %1, i64 %2
  %132 = icmp ugt i32* %131, %0
  %133 = icmp ugt i32* %130, %1
  %134 = and i1 %132, %133
  br i1 %134, label %206, label %135

135:                                              ; preds = %129
  %136 = and i64 %2, -8
  %137 = and i64 %2, 7
  %138 = add i64 %136, -8
  %139 = lshr exact i64 %138, 3
  %140 = add nuw nsw i64 %139, 1
  %141 = and i64 %140, 1
  %142 = icmp eq i64 %138, 0
  br i1 %142, label %185, label %143

143:                                              ; preds = %135
  %144 = and i64 %140, 4611686018427387902
  br label %145

145:                                              ; preds = %145, %143
  %146 = phi i64 [ 0, %143 ], [ %180, %145 ]
  %147 = phi i64 [ 0, %143 ], [ %181, %145 ]
  %148 = xor i64 %146, -1
  %149 = add i64 %148, %2
  %150 = getelementptr inbounds i32, i32* %1, i64 %149
  %151 = getelementptr inbounds i32, i32* %150, i64 -3
  %152 = bitcast i32* %151 to <4 x i32>*
  %153 = load <4 x i32>, <4 x i32>* %152, align 4, !tbaa !3, !alias.scope !17
  %154 = getelementptr inbounds i32, i32* %150, i64 -4
  %155 = getelementptr inbounds i32, i32* %154, i64 -3
  %156 = bitcast i32* %155 to <4 x i32>*
  %157 = load <4 x i32>, <4 x i32>* %156, align 4, !tbaa !3, !alias.scope !17
  %158 = getelementptr inbounds i32, i32* %0, i64 %149
  %159 = getelementptr inbounds i32, i32* %158, i64 -3
  %160 = bitcast i32* %159 to <4 x i32>*
  store <4 x i32> %153, <4 x i32>* %160, align 4, !tbaa !3, !alias.scope !20, !noalias !17
  %161 = getelementptr inbounds i32, i32* %158, i64 -4
  %162 = getelementptr inbounds i32, i32* %161, i64 -3
  %163 = bitcast i32* %162 to <4 x i32>*
  store <4 x i32> %157, <4 x i32>* %163, align 4, !tbaa !3, !alias.scope !20, !noalias !17
  %164 = sub nuw nsw i64 -9, %146
  %165 = add i64 %164, %2
  %166 = getelementptr inbounds i32, i32* %1, i64 %165
  %167 = getelementptr inbounds i32, i32* %166, i64 -3
  %168 = bitcast i32* %167 to <4 x i32>*
  %169 = load <4 x i32>, <4 x i32>* %168, align 4, !tbaa !3, !alias.scope !17
  %170 = getelementptr inbounds i32, i32* %166, i64 -4
  %171 = getelementptr inbounds i32, i32* %170, i64 -3
  %172 = bitcast i32* %171 to <4 x i32>*
  %173 = load <4 x i32>, <4 x i32>* %172, align 4, !tbaa !3, !alias.scope !17
  %174 = getelementptr inbounds i32, i32* %0, i64 %165
  %175 = getelementptr inbounds i32, i32* %174, i64 -3
  %176 = bitcast i32* %175 to <4 x i32>*
  store <4 x i32> %169, <4 x i32>* %176, align 4, !tbaa !3, !alias.scope !20, !noalias !17
  %177 = getelementptr inbounds i32, i32* %174, i64 -4
  %178 = getelementptr inbounds i32, i32* %177, i64 -3
  %179 = bitcast i32* %178 to <4 x i32>*
  store <4 x i32> %173, <4 x i32>* %179, align 4, !tbaa !3, !alias.scope !20, !noalias !17
  %180 = add nuw i64 %146, 16
  %181 = add i64 %147, 2
  %182 = icmp eq i64 %181, %144
  br i1 %182, label %183, label %145, !llvm.loop !22

183:                                              ; preds = %145
  %184 = sub i64 -17, %146
  br label %185

185:                                              ; preds = %183, %135
  %186 = phi i64 [ -1, %135 ], [ %184, %183 ]
  %187 = icmp eq i64 %141, 0
  br i1 %187, label %204, label %188

188:                                              ; preds = %185
  %189 = add i64 %186, %2
  %190 = getelementptr inbounds i32, i32* %1, i64 %189
  %191 = getelementptr inbounds i32, i32* %190, i64 -3
  %192 = bitcast i32* %191 to <4 x i32>*
  %193 = load <4 x i32>, <4 x i32>* %192, align 4, !tbaa !3, !alias.scope !17
  %194 = getelementptr inbounds i32, i32* %190, i64 -4
  %195 = getelementptr inbounds i32, i32* %194, i64 -3
  %196 = bitcast i32* %195 to <4 x i32>*
  %197 = load <4 x i32>, <4 x i32>* %196, align 4, !tbaa !3, !alias.scope !17
  %198 = getelementptr inbounds i32, i32* %0, i64 %189
  %199 = getelementptr inbounds i32, i32* %198, i64 -3
  %200 = bitcast i32* %199 to <4 x i32>*
  store <4 x i32> %193, <4 x i32>* %200, align 4, !tbaa !3, !alias.scope !20, !noalias !17
  %201 = getelementptr inbounds i32, i32* %198, i64 -4
  %202 = getelementptr inbounds i32, i32* %201, i64 -3
  %203 = bitcast i32* %202 to <4 x i32>*
  store <4 x i32> %197, <4 x i32>* %203, align 4, !tbaa !3, !alias.scope !20, !noalias !17
  br label %204

204:                                              ; preds = %185, %188
  %205 = icmp eq i64 %136, %2
  br i1 %205, label %272, label %206

206:                                              ; preds = %129, %127, %204
  %207 = phi i64 [ %2, %129 ], [ %2, %127 ], [ %137, %204 ]
  %208 = add i64 %207, -1
  %209 = and i64 %207, 3
  %210 = icmp eq i64 %209, 0
  br i1 %210, label %220, label %211

211:                                              ; preds = %206, %211
  %212 = phi i64 [ %214, %211 ], [ %207, %206 ]
  %213 = phi i64 [ %218, %211 ], [ 0, %206 ]
  %214 = add i64 %212, -1
  %215 = getelementptr inbounds i32, i32* %1, i64 %214
  %216 = load i32, i32* %215, align 4, !tbaa !3
  %217 = getelementptr inbounds i32, i32* %0, i64 %214
  store i32 %216, i32* %217, align 4, !tbaa !3
  %218 = add i64 %213, 1
  %219 = icmp eq i64 %218, %209
  br i1 %219, label %220, label %211, !llvm.loop !23

220:                                              ; preds = %211, %206
  %221 = phi i64 [ %207, %206 ], [ %214, %211 ]
  %222 = icmp ult i64 %208, 3
  br i1 %222, label %272, label %223

223:                                              ; preds = %220, %223
  %224 = phi i64 [ %237, %223 ], [ %221, %220 ]
  %225 = add i64 %224, -1
  %226 = getelementptr inbounds i32, i32* %1, i64 %225
  %227 = load i32, i32* %226, align 4, !tbaa !3
  %228 = getelementptr inbounds i32, i32* %0, i64 %225
  store i32 %227, i32* %228, align 4, !tbaa !3
  %229 = add i64 %224, -2
  %230 = getelementptr inbounds i32, i32* %1, i64 %229
  %231 = load i32, i32* %230, align 4, !tbaa !3
  %232 = getelementptr inbounds i32, i32* %0, i64 %229
  store i32 %231, i32* %232, align 4, !tbaa !3
  %233 = add i64 %224, -3
  %234 = getelementptr inbounds i32, i32* %1, i64 %233
  %235 = load i32, i32* %234, align 4, !tbaa !3
  %236 = getelementptr inbounds i32, i32* %0, i64 %233
  store i32 %235, i32* %236, align 4, !tbaa !3
  %237 = add i64 %224, -4
  %238 = getelementptr inbounds i32, i32* %1, i64 %237
  %239 = load i32, i32* %238, align 4, !tbaa !3
  %240 = getelementptr inbounds i32, i32* %0, i64 %237
  store i32 %239, i32* %240, align 4, !tbaa !3
  %241 = icmp eq i64 %237, 0
  br i1 %241, label %272, label %223, !llvm.loop !24

242:                                              ; preds = %121, %242
  %243 = phi i64 [ %267, %242 ], [ %122, %121 ]
  %244 = phi i32* [ %268, %242 ], [ %123, %121 ]
  %245 = phi i32* [ %270, %242 ], [ %124, %121 ]
  %246 = getelementptr inbounds i32, i32* %244, i64 1
  %247 = load i32, i32* %244, align 4, !tbaa !3
  %248 = getelementptr inbounds i32, i32* %245, i64 1
  store i32 %247, i32* %245, align 4, !tbaa !3
  %249 = getelementptr inbounds i32, i32* %244, i64 2
  %250 = load i32, i32* %246, align 4, !tbaa !3
  %251 = getelementptr inbounds i32, i32* %245, i64 2
  store i32 %250, i32* %248, align 4, !tbaa !3
  %252 = getelementptr inbounds i32, i32* %244, i64 3
  %253 = load i32, i32* %249, align 4, !tbaa !3
  %254 = getelementptr inbounds i32, i32* %245, i64 3
  store i32 %253, i32* %251, align 4, !tbaa !3
  %255 = getelementptr inbounds i32, i32* %244, i64 4
  %256 = load i32, i32* %252, align 4, !tbaa !3
  %257 = getelementptr inbounds i32, i32* %245, i64 4
  store i32 %256, i32* %254, align 4, !tbaa !3
  %258 = getelementptr inbounds i32, i32* %244, i64 5
  %259 = load i32, i32* %255, align 4, !tbaa !3
  %260 = getelementptr inbounds i32, i32* %245, i64 5
  store i32 %259, i32* %257, align 4, !tbaa !3
  %261 = getelementptr inbounds i32, i32* %244, i64 6
  %262 = load i32, i32* %258, align 4, !tbaa !3
  %263 = getelementptr inbounds i32, i32* %245, i64 6
  store i32 %262, i32* %260, align 4, !tbaa !3
  %264 = getelementptr inbounds i32, i32* %244, i64 7
  %265 = load i32, i32* %261, align 4, !tbaa !3
  %266 = getelementptr inbounds i32, i32* %245, i64 7
  store i32 %265, i32* %263, align 4, !tbaa !3
  %267 = add i64 %243, -8
  %268 = getelementptr inbounds i32, i32* %244, i64 8
  %269 = load i32, i32* %264, align 4, !tbaa !3
  %270 = getelementptr inbounds i32, i32* %245, i64 8
  store i32 %269, i32* %266, align 4, !tbaa !3
  %271 = icmp eq i64 %267, 0
  br i1 %271, label %272, label %242, !llvm.loop !25

272:                                              ; preds = %121, %242, %220, %223, %101, %204, %12, %126, %3
  ret i32* %0
}

attributes #0 = { nofree norecurse nosync nounwind strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8}
!8 = distinct !{!8, !9}
!9 = distinct !{!9, !"LVerDomain"}
!10 = !{!11}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.isvectorized", i32 1}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !15}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !13}
!23 = distinct !{!23, !15}
!24 = distinct !{!24, !13}
!25 = distinct !{!25, !13}
