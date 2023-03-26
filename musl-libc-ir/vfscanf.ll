; ModuleID = 'src/stdio/vfscanf.c'
source_filename = "src/stdio/vfscanf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.__mbstate_t = type { i32, i32 }

@__isoc99_vfscanf = weak alias i32 (%struct._IO_FILE*, i8*, %struct.__va_list_tag*), i32 (%struct._IO_FILE*, i8*, %struct.__va_list_tag*)* @vfscanf

; Function Attrs: nounwind optsize strictfp
define i32 @vfscanf(%struct._IO_FILE* noalias noundef %0, i8* noalias nocapture noundef readonly %1, %struct.__va_list_tag* noundef %2) #0 {
  %4 = alloca [1 x %struct.__va_list_tag], align 16
  %5 = alloca %struct.__mbstate_t, align 4
  %6 = alloca [257 x i8], align 16
  %7 = alloca i32, align 4
  %8 = alloca i8, align 1
  %9 = bitcast %struct.__mbstate_t* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %9) #5
  %10 = getelementptr inbounds [257 x i8], [257 x i8]* %6, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 257, i8* nonnull %10) #5
  %11 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %11) #5
  %12 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 19
  %13 = load volatile i32, i32* %12, align 4, !tbaa !3
  %14 = icmp sgt i32 %13, -1
  br i1 %14, label %15, label %17

15:                                               ; preds = %3
  %16 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull %0) #6
  br label %17

17:                                               ; preds = %3, %15
  %18 = phi i32 [ %16, %15 ], [ 0, %3 ]
  %19 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  %20 = load i8*, i8** %19, align 8, !tbaa !10
  %21 = icmp eq i8* %20, null
  br i1 %21, label %22, label %26

22:                                               ; preds = %17
  %23 = tail call i32 @__toread(%struct._IO_FILE* noundef nonnull %0) #6
  %24 = load i8*, i8** %19, align 8, !tbaa !10
  %25 = icmp eq i8* %24, null
  br i1 %25, label %672, label %26

26:                                               ; preds = %17, %22
  %27 = load i8, i8* %1, align 1, !tbaa !11
  %28 = icmp eq i8 %27, 0
  br i1 %28, label %684, label %29

29:                                               ; preds = %26
  %30 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 25
  %31 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 26
  %32 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 27
  %33 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 11
  %34 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %35 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %36 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %37 = bitcast [1 x %struct.__va_list_tag]* %4 to i8*
  %38 = bitcast %struct.__va_list_tag* %2 to i8*
  %39 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %4, i64 0, i64 0, i32 0
  %40 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %4, i64 0, i64 0, i32 2
  %41 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %4, i64 0, i64 0, i32 3
  %42 = getelementptr inbounds [257 x i8], [257 x i8]* %6, i64 0, i64 94
  %43 = getelementptr inbounds [257 x i8], [257 x i8]* %6, i64 0, i64 46
  %44 = getelementptr inbounds [257 x i8], [257 x i8]* %6, i64 0, i64 10
  %45 = getelementptr inbounds [257 x i8], [257 x i8]* %6, i64 0, i64 11
  %46 = getelementptr inbounds [257 x i8], [257 x i8]* %6, i64 0, i64 12
  %47 = getelementptr inbounds [257 x i8], [257 x i8]* %6, i64 0, i64 13
  %48 = getelementptr inbounds [257 x i8], [257 x i8]* %6, i64 0, i64 14
  %49 = getelementptr inbounds [257 x i8], [257 x i8]* %6, i64 0, i64 33
  %50 = getelementptr inbounds %struct.__mbstate_t, %struct.__mbstate_t* %5, i64 0, i32 0
  %51 = getelementptr inbounds %struct.__mbstate_t, %struct.__mbstate_t* %5, i64 0, i32 1
  br label %52

52:                                               ; preds = %29, %652
  %53 = phi i8 [ %27, %29 ], [ %659, %652 ]
  %54 = phi i64 [ 0, %29 ], [ %657, %652 ]
  %55 = phi i8* [ %1, %29 ], [ %658, %652 ]
  %56 = phi i32 [ 0, %29 ], [ %655, %652 ]
  %57 = phi i32* [ undef, %29 ], [ %654, %652 ]
  %58 = phi i8* [ undef, %29 ], [ %653, %652 ]
  %59 = zext i8 %53 to i32
  %60 = icmp ne i8 %53, 32
  %61 = add nsw i32 %59, -14
  %62 = icmp ult i32 %61, -5
  %63 = and i1 %60, %62
  br i1 %63, label %102, label %64

64:                                               ; preds = %52, %64
  %65 = phi i8* [ %66, %64 ], [ %55, %52 ]
  %66 = getelementptr inbounds i8, i8* %65, i64 1
  %67 = load i8, i8* %66, align 1, !tbaa !11
  %68 = zext i8 %67 to i32
  %69 = icmp ne i8 %67, 32
  %70 = add nsw i32 %68, -14
  %71 = icmp ult i32 %70, -5
  %72 = and i1 %69, %71
  br i1 %72, label %73, label %64

73:                                               ; preds = %64
  call void @__shlim(%struct._IO_FILE* noundef %0, i64 noundef 0) #6
  br label %74

74:                                               ; preds = %86, %73
  %75 = load i8*, i8** %19, align 8, !tbaa !10
  %76 = load i8*, i8** %30, align 8, !tbaa !12
  %77 = icmp eq i8* %75, %76
  br i1 %77, label %82, label %78

78:                                               ; preds = %74
  %79 = getelementptr inbounds i8, i8* %75, i64 1
  store i8* %79, i8** %19, align 8, !tbaa !10
  %80 = load i8, i8* %75, align 1, !tbaa !11
  %81 = zext i8 %80 to i32
  br label %84

82:                                               ; preds = %74
  %83 = call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #6
  br label %84

84:                                               ; preds = %82, %78
  %85 = phi i32 [ %81, %78 ], [ %83, %82 ]
  switch i32 %85, label %87 [
    i32 32, label %86
    i32 13, label %86
    i32 12, label %86
    i32 11, label %86
    i32 10, label %86
    i32 9, label %86
  ]

86:                                               ; preds = %84, %84, %84, %84, %84, %84
  br label %74

87:                                               ; preds = %84
  %88 = load i64, i64* %31, align 8, !tbaa !13
  %89 = icmp sgt i64 %88, -1
  %90 = load i8*, i8** %19, align 8, !tbaa !10
  br i1 %89, label %91, label %93

91:                                               ; preds = %87
  %92 = getelementptr inbounds i8, i8* %90, i64 -1
  store i8* %92, i8** %19, align 8, !tbaa !10
  br label %93

93:                                               ; preds = %87, %91
  %94 = phi i8* [ %92, %91 ], [ %90, %87 ]
  %95 = load i64, i64* %32, align 8, !tbaa !14
  %96 = load i8*, i8** %33, align 8, !tbaa !15
  %97 = ptrtoint i8* %94 to i64
  %98 = ptrtoint i8* %96 to i64
  %99 = add i64 %95, %54
  %100 = add i64 %99, %97
  %101 = sub i64 %100, %98
  br label %652

102:                                              ; preds = %52
  %103 = icmp eq i8 %53, 37
  br i1 %103, label %104, label %107

104:                                              ; preds = %102
  %105 = getelementptr inbounds i8, i8* %55, i64 1
  %106 = load i8, i8* %105, align 1, !tbaa !11
  switch i8 %106, label %162 [
    i8 37, label %107
    i8 42, label %160
  ]

107:                                              ; preds = %104, %102
  call void @__shlim(%struct._IO_FILE* noundef %0, i64 noundef 0) #6
  %108 = load i8, i8* %55, align 1, !tbaa !11
  %109 = icmp eq i8 %108, 37
  br i1 %109, label %110, label %123

110:                                              ; preds = %107, %122
  %111 = load i8*, i8** %19, align 8, !tbaa !10
  %112 = load i8*, i8** %30, align 8, !tbaa !12
  %113 = icmp eq i8* %111, %112
  br i1 %113, label %118, label %114

114:                                              ; preds = %110
  %115 = getelementptr inbounds i8, i8* %111, i64 1
  store i8* %115, i8** %19, align 8, !tbaa !10
  %116 = load i8, i8* %111, align 1, !tbaa !11
  %117 = zext i8 %116 to i32
  br label %120

118:                                              ; preds = %110
  %119 = call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #6
  br label %120

120:                                              ; preds = %118, %114
  %121 = phi i32 [ %117, %114 ], [ %119, %118 ]
  switch i32 %121, label %133 [
    i32 32, label %122
    i32 13, label %122
    i32 12, label %122
    i32 11, label %122
    i32 10, label %122
    i32 9, label %122
  ]

122:                                              ; preds = %120, %120, %120, %120, %120, %120
  br label %110

123:                                              ; preds = %107
  %124 = load i8*, i8** %19, align 8, !tbaa !10
  %125 = load i8*, i8** %30, align 8, !tbaa !12
  %126 = icmp eq i8* %124, %125
  br i1 %126, label %131, label %127

127:                                              ; preds = %123
  %128 = getelementptr inbounds i8, i8* %124, i64 1
  store i8* %128, i8** %19, align 8, !tbaa !10
  %129 = load i8, i8* %124, align 1, !tbaa !11
  %130 = zext i8 %129 to i32
  br label %135

131:                                              ; preds = %123
  %132 = call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #6
  br label %135

133:                                              ; preds = %120
  %134 = getelementptr inbounds i8, i8* %55, i64 1
  br label %135

135:                                              ; preds = %133, %127, %131
  %136 = phi i32 [ %130, %127 ], [ %132, %131 ], [ %121, %133 ]
  %137 = phi i8* [ %55, %127 ], [ %55, %131 ], [ %134, %133 ]
  %138 = load i8, i8* %137, align 1, !tbaa !11
  %139 = zext i8 %138 to i32
  %140 = icmp eq i32 %136, %139
  br i1 %140, label %151, label %141

141:                                              ; preds = %135
  %142 = load i64, i64* %31, align 8, !tbaa !13
  %143 = icmp sgt i64 %142, -1
  br i1 %143, label %144, label %147

144:                                              ; preds = %141
  %145 = load i8*, i8** %19, align 8, !tbaa !10
  %146 = getelementptr inbounds i8, i8* %145, i64 -1
  store i8* %146, i8** %19, align 8, !tbaa !10
  br label %147

147:                                              ; preds = %141, %144
  %148 = icmp sgt i32 %136, -1
  %149 = icmp ne i32 %56, 0
  %150 = select i1 %148, i1 true, i1 %149
  br i1 %150, label %684, label %672

151:                                              ; preds = %135
  %152 = load i64, i64* %32, align 8, !tbaa !14
  %153 = load i8*, i8** %19, align 8, !tbaa !10
  %154 = load i8*, i8** %33, align 8, !tbaa !15
  %155 = ptrtoint i8* %153 to i64
  %156 = ptrtoint i8* %154 to i64
  %157 = add i64 %152, %54
  %158 = add i64 %157, %155
  %159 = sub i64 %158, %156
  br label %652

160:                                              ; preds = %104
  %161 = getelementptr inbounds i8, i8* %55, i64 2
  br label %220

162:                                              ; preds = %104
  %163 = zext i8 %106 to i32
  %164 = add nsw i32 %163, -48
  %165 = icmp ult i32 %164, 10
  br i1 %165, label %166, label %205

166:                                              ; preds = %162
  %167 = getelementptr inbounds i8, i8* %55, i64 2
  %168 = load i8, i8* %167, align 1, !tbaa !11
  %169 = icmp eq i8 %168, 36
  br i1 %169, label %170, label %205

170:                                              ; preds = %166
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %37) #5
  call void @llvm.va_copy(i8* nonnull %37, i8* %38) #5
  %171 = icmp ugt i32 %164, 1
  %172 = load i32, i32* %39, align 16
  br i1 %171, label %173, label %189

173:                                              ; preds = %170
  %174 = load i8*, i8** %40, align 8
  br label %175

175:                                              ; preds = %184, %173
  %176 = phi i8* [ %174, %173 ], [ %185, %184 ]
  %177 = phi i32 [ %172, %173 ], [ %186, %184 ]
  %178 = phi i32 [ %164, %173 ], [ %187, %184 ]
  %179 = icmp ult i32 %177, 41
  br i1 %179, label %180, label %182

180:                                              ; preds = %175
  %181 = add nuw nsw i32 %177, 8
  store i32 %181, i32* %39, align 16
  br label %184

182:                                              ; preds = %175
  %183 = getelementptr i8, i8* %176, i64 8
  store i8* %183, i8** %40, align 8
  br label %184

184:                                              ; preds = %182, %180
  %185 = phi i8* [ %183, %182 ], [ %176, %180 ]
  %186 = phi i32 [ %177, %182 ], [ %181, %180 ]
  %187 = add i32 %178, -1
  %188 = icmp ugt i32 %187, 1
  br i1 %188, label %175, label %189

189:                                              ; preds = %184, %170
  %190 = phi i32 [ %172, %170 ], [ %186, %184 ]
  %191 = icmp ult i32 %190, 41
  br i1 %191, label %192, label %197

192:                                              ; preds = %189
  %193 = load i8*, i8** %41, align 16
  %194 = zext i32 %190 to i64
  %195 = getelementptr i8, i8* %193, i64 %194
  %196 = add nuw nsw i32 %190, 8
  store i32 %196, i32* %39, align 16
  br label %200

197:                                              ; preds = %189
  %198 = load i8*, i8** %40, align 8
  %199 = getelementptr i8, i8* %198, i64 8
  store i8* %199, i8** %40, align 8
  br label %200

200:                                              ; preds = %192, %197
  %201 = phi i8* [ %195, %192 ], [ %198, %197 ]
  %202 = bitcast i8* %201 to i8**
  %203 = load i8*, i8** %202, align 8
  call void @llvm.va_end(i8* nonnull %37) #5
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %37) #5
  %204 = getelementptr inbounds i8, i8* %55, i64 3
  br label %220

205:                                              ; preds = %166, %162
  %206 = load i32, i32* %34, align 8
  %207 = icmp ult i32 %206, 41
  br i1 %207, label %208, label %213

208:                                              ; preds = %205
  %209 = load i8*, i8** %36, align 8
  %210 = zext i32 %206 to i64
  %211 = getelementptr i8, i8* %209, i64 %210
  %212 = add nuw nsw i32 %206, 8
  store i32 %212, i32* %34, align 8
  br label %216

213:                                              ; preds = %205
  %214 = load i8*, i8** %35, align 8
  %215 = getelementptr i8, i8* %214, i64 8
  store i8* %215, i8** %35, align 8
  br label %216

216:                                              ; preds = %213, %208
  %217 = phi i8* [ %211, %208 ], [ %214, %213 ]
  %218 = bitcast i8* %217 to i8**
  %219 = load i8*, i8** %218, align 8
  br label %220

220:                                              ; preds = %200, %216, %160
  %221 = phi i8* [ null, %160 ], [ %203, %200 ], [ %219, %216 ]
  %222 = phi i8* [ %161, %160 ], [ %204, %200 ], [ %105, %216 ]
  %223 = load i8, i8* %222, align 1, !tbaa !11
  %224 = zext i8 %223 to i32
  %225 = add nsw i32 %224, -48
  %226 = icmp ult i32 %225, 10
  br i1 %226, label %227, label %239

227:                                              ; preds = %220, %227
  %228 = phi i32 [ %236, %227 ], [ %224, %220 ]
  %229 = phi i32 [ %233, %227 ], [ 0, %220 ]
  %230 = phi i8* [ %234, %227 ], [ %222, %220 ]
  %231 = mul nsw i32 %229, 10
  %232 = add nsw i32 %228, -48
  %233 = add i32 %232, %231
  %234 = getelementptr inbounds i8, i8* %230, i64 1
  %235 = load i8, i8* %234, align 1, !tbaa !11
  %236 = zext i8 %235 to i32
  %237 = add nsw i32 %236, -48
  %238 = icmp ult i32 %237, 10
  br i1 %238, label %227, label %239

239:                                              ; preds = %227, %220
  %240 = phi i8* [ %222, %220 ], [ %234, %227 ]
  %241 = phi i32 [ 0, %220 ], [ %233, %227 ]
  %242 = phi i8 [ %223, %220 ], [ %235, %227 ]
  %243 = icmp eq i8 %242, 109
  br i1 %243, label %244, label %249

244:                                              ; preds = %239
  %245 = icmp ne i8* %221, null
  %246 = zext i1 %245 to i32
  %247 = getelementptr inbounds i8, i8* %240, i64 1
  %248 = load i8, i8* %247, align 1, !tbaa !11
  br label %249

249:                                              ; preds = %239, %244
  %250 = phi i8 [ %248, %244 ], [ %242, %239 ]
  %251 = phi i8* [ null, %244 ], [ %58, %239 ]
  %252 = phi i32* [ null, %244 ], [ %57, %239 ]
  %253 = phi i8* [ %247, %244 ], [ %240, %239 ]
  %254 = phi i32 [ %246, %244 ], [ 0, %239 ]
  %255 = getelementptr inbounds i8, i8* %253, i64 1
  switch i8 %250, label %667 [
    i8 104, label %256
    i8 108, label %262
    i8 106, label %271
    i8 122, label %268
    i8 116, label %268
    i8 76, label %269
    i8 100, label %270
    i8 105, label %270
    i8 111, label %270
    i8 117, label %270
    i8 120, label %270
    i8 97, label %270
    i8 101, label %270
    i8 102, label %270
    i8 103, label %270
    i8 65, label %270
    i8 69, label %270
    i8 70, label %270
    i8 71, label %270
    i8 88, label %270
    i8 115, label %270
    i8 99, label %270
    i8 91, label %270
    i8 83, label %270
    i8 67, label %270
    i8 112, label %270
    i8 110, label %270
  ]

256:                                              ; preds = %249
  %257 = load i8, i8* %255, align 1, !tbaa !11
  %258 = icmp eq i8 %257, 104
  %259 = getelementptr inbounds i8, i8* %253, i64 2
  %260 = select i1 %258, i8* %259, i8* %255
  %261 = select i1 %258, i32 -2, i32 -1
  br label %271

262:                                              ; preds = %249
  %263 = load i8, i8* %255, align 1, !tbaa !11
  %264 = icmp eq i8 %263, 108
  %265 = getelementptr inbounds i8, i8* %253, i64 2
  %266 = select i1 %264, i8* %265, i8* %255
  %267 = select i1 %264, i32 3, i32 1
  br label %271

268:                                              ; preds = %249, %249
  br label %271

269:                                              ; preds = %249
  br label %271

270:                                              ; preds = %249, %249, %249, %249, %249, %249, %249, %249, %249, %249, %249, %249, %249, %249, %249, %249, %249, %249, %249, %249, %249
  br label %271

271:                                              ; preds = %262, %256, %249, %270, %269, %268
  %272 = phi i8* [ %253, %270 ], [ %255, %269 ], [ %255, %268 ], [ %255, %249 ], [ %260, %256 ], [ %266, %262 ]
  %273 = phi i32 [ 0, %270 ], [ 2, %269 ], [ 1, %268 ], [ 3, %249 ], [ %261, %256 ], [ %267, %262 ]
  %274 = load i8, i8* %272, align 1, !tbaa !11
  %275 = zext i8 %274 to i32
  %276 = and i32 %275, 47
  %277 = icmp eq i32 %276, 3
  %278 = or i32 %275, 32
  %279 = select i1 %277, i32 %278, i32 %275
  %280 = select i1 %277, i32 1, i32 %273
  %281 = trunc i32 %279 to i8
  switch i8 %281, label %300 [
    i8 99, label %282
    i8 91, label %329
    i8 110, label %285
  ]

282:                                              ; preds = %271
  %283 = icmp sgt i32 %241, 1
  %284 = select i1 %283, i32 %241, i32 1
  br label %329

285:                                              ; preds = %271
  %286 = icmp eq i8* %221, null
  br i1 %286, label %652, label %287

287:                                              ; preds = %285
  switch i32 %280, label %652 [
    i32 -2, label %288
    i32 -1, label %290
    i32 0, label %293
    i32 1, label %296
    i32 3, label %298
  ]

288:                                              ; preds = %287
  %289 = trunc i64 %54 to i8
  store i8 %289, i8* %221, align 1, !tbaa !11
  br label %652

290:                                              ; preds = %287
  %291 = trunc i64 %54 to i16
  %292 = bitcast i8* %221 to i16*
  store i16 %291, i16* %292, align 2, !tbaa !16
  br label %652

293:                                              ; preds = %287
  %294 = trunc i64 %54 to i32
  %295 = bitcast i8* %221 to i32*
  store i32 %294, i32* %295, align 4, !tbaa !18
  br label %652

296:                                              ; preds = %287
  %297 = bitcast i8* %221 to i64*
  store i64 %54, i64* %297, align 8, !tbaa !19
  br label %652

298:                                              ; preds = %287
  %299 = bitcast i8* %221 to i64*
  store i64 %54, i64* %299, align 8, !tbaa !20
  br label %652

300:                                              ; preds = %271
  call void @__shlim(%struct._IO_FILE* noundef %0, i64 noundef 0) #6
  br label %301

301:                                              ; preds = %313, %300
  %302 = load i8*, i8** %19, align 8, !tbaa !10
  %303 = load i8*, i8** %30, align 8, !tbaa !12
  %304 = icmp eq i8* %302, %303
  br i1 %304, label %309, label %305

305:                                              ; preds = %301
  %306 = getelementptr inbounds i8, i8* %302, i64 1
  store i8* %306, i8** %19, align 8, !tbaa !10
  %307 = load i8, i8* %302, align 1, !tbaa !11
  %308 = zext i8 %307 to i32
  br label %311

309:                                              ; preds = %301
  %310 = call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #6
  br label %311

311:                                              ; preds = %309, %305
  %312 = phi i32 [ %308, %305 ], [ %310, %309 ]
  switch i32 %312, label %314 [
    i32 32, label %313
    i32 13, label %313
    i32 12, label %313
    i32 11, label %313
    i32 10, label %313
    i32 9, label %313
  ]

313:                                              ; preds = %311, %311, %311, %311, %311, %311
  br label %301

314:                                              ; preds = %311
  %315 = load i64, i64* %31, align 8, !tbaa !13
  %316 = icmp sgt i64 %315, -1
  %317 = load i8*, i8** %19, align 8, !tbaa !10
  br i1 %316, label %318, label %320

318:                                              ; preds = %314
  %319 = getelementptr inbounds i8, i8* %317, i64 -1
  store i8* %319, i8** %19, align 8, !tbaa !10
  br label %320

320:                                              ; preds = %314, %318
  %321 = phi i8* [ %319, %318 ], [ %317, %314 ]
  %322 = load i64, i64* %32, align 8, !tbaa !14
  %323 = load i8*, i8** %33, align 8, !tbaa !15
  %324 = ptrtoint i8* %321 to i64
  %325 = ptrtoint i8* %323 to i64
  %326 = add i64 %322, %54
  %327 = add i64 %326, %324
  %328 = sub i64 %327, %325
  br label %329

329:                                              ; preds = %320, %282, %271
  %330 = phi i64 [ %328, %320 ], [ %54, %271 ], [ %54, %282 ]
  %331 = phi i32 [ %241, %320 ], [ %241, %271 ], [ %284, %282 ]
  %332 = sext i32 %331 to i64
  call void @__shlim(%struct._IO_FILE* noundef %0, i64 noundef %332) #6
  %333 = load i8*, i8** %19, align 8, !tbaa !10
  %334 = load i8*, i8** %30, align 8, !tbaa !12
  %335 = icmp eq i8* %333, %334
  br i1 %335, label %338, label %336

336:                                              ; preds = %329
  %337 = getelementptr inbounds i8, i8* %333, i64 1
  store i8* %337, i8** %19, align 8, !tbaa !10
  br label %341

338:                                              ; preds = %329
  %339 = call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #6
  %340 = icmp slt i32 %339, 0
  br i1 %340, label %667, label %341

341:                                              ; preds = %336, %338
  %342 = load i64, i64* %31, align 8, !tbaa !13
  %343 = icmp sgt i64 %342, -1
  br i1 %343, label %344, label %347

344:                                              ; preds = %341
  %345 = load i8*, i8** %19, align 8, !tbaa !10
  %346 = getelementptr inbounds i8, i8* %345, i64 -1
  store i8* %346, i8** %19, align 8, !tbaa !10
  br label %347

347:                                              ; preds = %341, %344
  switch i8 %281, label %637 [
    i8 115, label %348
    i8 99, label %348
    i8 91, label %348
    i8 112, label %585
    i8 88, label %585
    i8 120, label %585
    i8 111, label %582
    i8 100, label %583
    i8 117, label %583
    i8 105, label %584
    i8 97, label %617
    i8 65, label %617
    i8 101, label %617
    i8 69, label %617
    i8 102, label %617
    i8 70, label %617
    i8 103, label %617
    i8 71, label %617
  ]

348:                                              ; preds = %347, %347, %347
  %349 = icmp eq i32 %279, 99
  %350 = and i32 %279, 239
  %351 = icmp eq i32 %350, 99
  br i1 %351, label %352, label %356

352:                                              ; preds = %348
  %353 = icmp eq i32 %279, 115
  %354 = call i8* @memset(i8* noundef nonnull %10, i32 noundef -1, i64 noundef 257) #6
  store i8 0, i8* %10, align 16, !tbaa !11
  br i1 %353, label %355, label %405

355:                                              ; preds = %352
  store i8 0, i8* %44, align 2, !tbaa !11
  store i8 0, i8* %45, align 1, !tbaa !11
  store i8 0, i8* %46, align 4, !tbaa !11
  store i8 0, i8* %47, align 1, !tbaa !11
  store i8 0, i8* %48, align 2, !tbaa !11
  store i8 0, i8* %49, align 1, !tbaa !11
  br label %405

356:                                              ; preds = %348
  %357 = getelementptr inbounds i8, i8* %272, i64 1
  %358 = load i8, i8* %357, align 1, !tbaa !11
  %359 = icmp eq i8 %358, 94
  %360 = getelementptr inbounds i8, i8* %272, i64 2
  %361 = zext i1 %359 to i32
  %362 = select i1 %359, i8* %360, i8* %357
  %363 = call i8* @memset(i8* noundef nonnull %10, i32 noundef %361, i64 noundef 257) #6
  store i8 0, i8* %10, align 16, !tbaa !11
  %364 = load i8, i8* %362, align 1, !tbaa !11
  switch i8 %364, label %365 [
    i8 45, label %368
    i8 93, label %372
  ]

365:                                              ; preds = %356
  %366 = xor i1 %359, true
  %367 = zext i1 %366 to i8
  br label %376

368:                                              ; preds = %356
  %369 = getelementptr inbounds i8, i8* %362, i64 1
  %370 = xor i1 %359, true
  %371 = zext i1 %370 to i8
  store i8 %371, i8* %43, align 2, !tbaa !11
  br label %376

372:                                              ; preds = %356
  %373 = getelementptr inbounds i8, i8* %362, i64 1
  %374 = xor i1 %359, true
  %375 = zext i1 %374 to i8
  store i8 %375, i8* %42, align 2, !tbaa !11
  br label %376

376:                                              ; preds = %365, %372, %368
  %377 = phi i8 [ %367, %365 ], [ %375, %372 ], [ %371, %368 ]
  %378 = phi i8* [ %362, %365 ], [ %373, %372 ], [ %369, %368 ]
  br label %379

379:                                              ; preds = %398, %376
  %380 = phi i8* [ %378, %376 ], [ %404, %398 ]
  %381 = load i8, i8* %380, align 1, !tbaa !11
  switch i8 %381, label %398 [
    i8 93, label %405
    i8 0, label %667
    i8 45, label %382
  ]

382:                                              ; preds = %379
  %383 = getelementptr inbounds i8, i8* %380, i64 1
  %384 = load i8, i8* %383, align 1, !tbaa !11
  switch i8 %384, label %385 [
    i8 0, label %398
    i8 93, label %398
  ]

385:                                              ; preds = %382
  %386 = getelementptr inbounds i8, i8* %380, i64 -1
  %387 = load i8, i8* %386, align 1, !tbaa !11
  %388 = icmp ult i8 %387, %384
  br i1 %388, label %389, label %398

389:                                              ; preds = %385
  %390 = zext i8 %387 to i64
  br label %391

391:                                              ; preds = %389, %391
  %392 = phi i64 [ %390, %389 ], [ %393, %391 ]
  %393 = add nuw nsw i64 %392, 1
  %394 = getelementptr inbounds [257 x i8], [257 x i8]* %6, i64 0, i64 %393
  store i8 %377, i8* %394, align 1, !tbaa !11
  %395 = load i8, i8* %383, align 1, !tbaa !11
  %396 = zext i8 %395 to i64
  %397 = icmp ult i64 %393, %396
  br i1 %397, label %391, label %398

398:                                              ; preds = %391, %385, %382, %382, %379
  %399 = phi i8 [ 45, %382 ], [ %381, %379 ], [ 45, %382 ], [ %384, %385 ], [ %395, %391 ]
  %400 = phi i8* [ %380, %382 ], [ %380, %379 ], [ %380, %382 ], [ %383, %385 ], [ %383, %391 ]
  %401 = zext i8 %399 to i64
  %402 = add nuw nsw i64 %401, 1
  %403 = getelementptr inbounds [257 x i8], [257 x i8]* %6, i64 0, i64 %402
  store i8 %377, i8* %403, align 1, !tbaa !11
  %404 = getelementptr inbounds i8, i8* %400, i64 1
  br label %379

405:                                              ; preds = %379, %352, %355
  %406 = phi i8* [ %272, %355 ], [ %272, %352 ], [ %380, %379 ]
  %407 = add i32 %331, 1
  %408 = select i1 %349, i32 %407, i32 31
  %409 = zext i32 %408 to i64
  %410 = icmp eq i32 %280, 1
  %411 = icmp eq i32 %254, 0
  br i1 %410, label %412, label %467

412:                                              ; preds = %405
  br i1 %411, label %417, label %413

413:                                              ; preds = %412
  %414 = shl nuw nsw i64 %409, 2
  %415 = call i8* @malloc(i64 noundef %414) #6
  %416 = icmp eq i8* %415, null
  br i1 %416, label %667, label %417

417:                                              ; preds = %412, %413
  %418 = phi i8* [ %415, %413 ], [ %221, %412 ]
  store i32 0, i32* %50, align 4, !tbaa.struct !22
  store i32 0, i32* %51, align 4, !tbaa.struct !23
  %419 = xor i1 %411, true
  br label %420

420:                                              ; preds = %457, %417
  %421 = phi i8* [ %461, %457 ], [ %418, %417 ]
  %422 = phi i64 [ %454, %457 ], [ 0, %417 ]
  %423 = phi i64 [ %459, %457 ], [ %409, %417 ]
  %424 = bitcast i8* %421 to i32*
  %425 = icmp eq i8* %421, null
  br label %426

426:                                              ; preds = %420, %453
  %427 = phi i64 [ %454, %453 ], [ %422, %420 ]
  br label %428

428:                                              ; preds = %426, %445
  %429 = load i8*, i8** %19, align 8, !tbaa !10
  %430 = load i8*, i8** %30, align 8, !tbaa !12
  %431 = icmp eq i8* %429, %430
  br i1 %431, label %436, label %432

432:                                              ; preds = %428
  %433 = getelementptr inbounds i8, i8* %429, i64 1
  store i8* %433, i8** %19, align 8, !tbaa !10
  %434 = load i8, i8* %429, align 1, !tbaa !11
  %435 = zext i8 %434 to i32
  br label %438

436:                                              ; preds = %428
  %437 = call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #6
  br label %438

438:                                              ; preds = %436, %432
  %439 = phi i32 [ %435, %432 ], [ %437, %436 ]
  %440 = add nsw i32 %439, 1
  %441 = sext i32 %440 to i64
  %442 = getelementptr inbounds [257 x i8], [257 x i8]* %6, i64 0, i64 %441
  %443 = load i8, i8* %442, align 1, !tbaa !11
  %444 = icmp eq i8 %443, 0
  br i1 %444, label %463, label %445

445:                                              ; preds = %438
  %446 = trunc i32 %439 to i8
  store i8 %446, i8* %8, align 1, !tbaa !11
  %447 = call i64 @mbrtowc(i32* noundef nonnull %7, i8* noundef nonnull %8, i64 noundef 1, %struct.__mbstate_t* noundef nonnull %5) #6
  switch i64 %447, label %448 [
    i64 -1, label %661
    i64 -2, label %428
  ]

448:                                              ; preds = %445
  br i1 %425, label %453, label %449

449:                                              ; preds = %448
  %450 = load i32, i32* %7, align 4, !tbaa !18
  %451 = add i64 %427, 1
  %452 = getelementptr inbounds i32, i32* %424, i64 %427
  store i32 %450, i32* %452, align 4, !tbaa !18
  br label %453

453:                                              ; preds = %449, %448
  %454 = phi i64 [ %451, %449 ], [ %427, %448 ]
  %455 = icmp eq i64 %454, %423
  %456 = select i1 %419, i1 %455, i1 false
  br i1 %456, label %457, label %426

457:                                              ; preds = %453
  %458 = shl i64 %423, 1
  %459 = or i64 %458, 1
  %460 = shl i64 %459, 2
  %461 = call i8* @realloc(i8* noundef %421, i64 noundef %460) #6
  %462 = icmp eq i8* %461, null
  br i1 %462, label %663, label %420

463:                                              ; preds = %438
  %464 = bitcast i8* %421 to i32*
  %465 = call i32 @mbsinit(%struct.__mbstate_t* noundef nonnull %5) #6
  %466 = icmp eq i32 %465, 0
  br i1 %466, label %665, label %544

467:                                              ; preds = %405
  br i1 %411, label %503, label %468

468:                                              ; preds = %467
  %469 = call i8* @malloc(i64 noundef %409) #6
  %470 = icmp eq i8* %469, null
  br i1 %470, label %667, label %471

471:                                              ; preds = %468, %498
  %472 = phi i8* [ %501, %498 ], [ %469, %468 ]
  %473 = phi i64 [ %495, %498 ], [ 0, %468 ]
  %474 = phi i64 [ %500, %498 ], [ %409, %468 ]
  br label %475

475:                                              ; preds = %471, %493
  %476 = phi i64 [ %495, %493 ], [ %473, %471 ]
  %477 = load i8*, i8** %19, align 8, !tbaa !10
  %478 = load i8*, i8** %30, align 8, !tbaa !12
  %479 = icmp eq i8* %477, %478
  br i1 %479, label %484, label %480

480:                                              ; preds = %475
  %481 = getelementptr inbounds i8, i8* %477, i64 1
  store i8* %481, i8** %19, align 8, !tbaa !10
  %482 = load i8, i8* %477, align 1, !tbaa !11
  %483 = zext i8 %482 to i32
  br label %486

484:                                              ; preds = %475
  %485 = call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #6
  br label %486

486:                                              ; preds = %484, %480
  %487 = phi i32 [ %483, %480 ], [ %485, %484 ]
  %488 = add nsw i32 %487, 1
  %489 = sext i32 %488 to i64
  %490 = getelementptr inbounds [257 x i8], [257 x i8]* %6, i64 0, i64 %489
  %491 = load i8, i8* %490, align 1, !tbaa !11
  %492 = icmp eq i8 %491, 0
  br i1 %492, label %544, label %493

493:                                              ; preds = %486
  %494 = trunc i32 %487 to i8
  %495 = add i64 %476, 1
  %496 = getelementptr inbounds i8, i8* %472, i64 %476
  store i8 %494, i8* %496, align 1, !tbaa !11
  %497 = icmp eq i64 %495, %474
  br i1 %497, label %498, label %475

498:                                              ; preds = %493
  %499 = shl i64 %474, 1
  %500 = or i64 %499, 1
  %501 = call i8* @realloc(i8* noundef nonnull %472, i64 noundef %500) #6
  %502 = icmp eq i8* %501, null
  br i1 %502, label %667, label %471

503:                                              ; preds = %467
  %504 = icmp eq i8* %221, null
  br i1 %504, label %527, label %505

505:                                              ; preds = %503, %523
  %506 = phi i64 [ %525, %523 ], [ 0, %503 ]
  %507 = load i8*, i8** %19, align 8, !tbaa !10
  %508 = load i8*, i8** %30, align 8, !tbaa !12
  %509 = icmp eq i8* %507, %508
  br i1 %509, label %514, label %510

510:                                              ; preds = %505
  %511 = getelementptr inbounds i8, i8* %507, i64 1
  store i8* %511, i8** %19, align 8, !tbaa !10
  %512 = load i8, i8* %507, align 1, !tbaa !11
  %513 = zext i8 %512 to i32
  br label %516

514:                                              ; preds = %505
  %515 = call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #6
  br label %516

516:                                              ; preds = %514, %510
  %517 = phi i32 [ %513, %510 ], [ %515, %514 ]
  %518 = add nsw i32 %517, 1
  %519 = sext i32 %518 to i64
  %520 = getelementptr inbounds [257 x i8], [257 x i8]* %6, i64 0, i64 %519
  %521 = load i8, i8* %520, align 1, !tbaa !11
  %522 = icmp eq i8 %521, 0
  br i1 %522, label %544, label %523

523:                                              ; preds = %516
  %524 = trunc i32 %517 to i8
  %525 = add i64 %506, 1
  %526 = getelementptr inbounds i8, i8* %221, i64 %506
  store i8 %524, i8* %526, align 1, !tbaa !11
  br label %505

527:                                              ; preds = %503, %537
  %528 = load i8*, i8** %19, align 8, !tbaa !10
  %529 = load i8*, i8** %30, align 8, !tbaa !12
  %530 = icmp eq i8* %528, %529
  br i1 %530, label %535, label %531

531:                                              ; preds = %527
  %532 = getelementptr inbounds i8, i8* %528, i64 1
  store i8* %532, i8** %19, align 8, !tbaa !10
  %533 = load i8, i8* %528, align 1, !tbaa !11
  %534 = zext i8 %533 to i32
  br label %537

535:                                              ; preds = %527
  %536 = call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #6
  br label %537

537:                                              ; preds = %535, %531
  %538 = phi i32 [ %534, %531 ], [ %536, %535 ]
  %539 = add nsw i32 %538, 1
  %540 = sext i32 %539 to i64
  %541 = getelementptr inbounds [257 x i8], [257 x i8]* %6, i64 0, i64 %540
  %542 = load i8, i8* %541, align 1, !tbaa !11
  %543 = icmp eq i8 %542, 0
  br i1 %543, label %544, label %527

544:                                              ; preds = %486, %516, %537, %463
  %545 = phi i8* [ null, %463 ], [ null, %537 ], [ %221, %516 ], [ %472, %486 ]
  %546 = phi i32* [ %464, %463 ], [ null, %537 ], [ null, %516 ], [ null, %486 ]
  %547 = phi i64 [ %427, %463 ], [ 0, %537 ], [ %506, %516 ], [ %476, %486 ]
  %548 = load i64, i64* %31, align 8, !tbaa !13
  %549 = icmp sgt i64 %548, -1
  %550 = load i8*, i8** %19, align 8, !tbaa !10
  br i1 %549, label %551, label %553

551:                                              ; preds = %544
  %552 = getelementptr inbounds i8, i8* %550, i64 -1
  store i8* %552, i8** %19, align 8, !tbaa !10
  br label %553

553:                                              ; preds = %544, %551
  %554 = phi i8* [ %552, %551 ], [ %550, %544 ]
  %555 = load i64, i64* %32, align 8, !tbaa !14
  %556 = load i8*, i8** %33, align 8, !tbaa !15
  %557 = ptrtoint i8* %554 to i64
  %558 = ptrtoint i8* %556 to i64
  %559 = sub i64 %557, %558
  %560 = add nsw i64 %559, %555
  %561 = icmp eq i64 %560, 0
  br i1 %561, label %676, label %562

562:                                              ; preds = %553
  %563 = xor i1 %349, true
  %564 = icmp eq i64 %560, %332
  %565 = select i1 %563, i1 true, i1 %564
  br i1 %565, label %566, label %676

566:                                              ; preds = %562
  %567 = icmp eq i32 %254, 0
  br i1 %567, label %573, label %568

568:                                              ; preds = %566
  br i1 %410, label %569, label %571

569:                                              ; preds = %568
  %570 = bitcast i8* %221 to i32**
  store i32* %546, i32** %570, align 8, !tbaa !24
  br label %573

571:                                              ; preds = %568
  %572 = bitcast i8* %221 to i8**
  store i8* %545, i8** %572, align 8, !tbaa !24
  br label %573

573:                                              ; preds = %569, %571, %566
  br i1 %349, label %637, label %574

574:                                              ; preds = %573
  %575 = icmp eq i32* %546, null
  br i1 %575, label %578, label %576

576:                                              ; preds = %574
  %577 = getelementptr inbounds i32, i32* %546, i64 %547
  store i32 0, i32* %577, align 4, !tbaa !18
  br label %578

578:                                              ; preds = %576, %574
  %579 = icmp eq i8* %545, null
  br i1 %579, label %637, label %580

580:                                              ; preds = %578
  %581 = getelementptr inbounds i8, i8* %545, i64 %547
  store i8 0, i8* %581, align 1, !tbaa !11
  br label %637

582:                                              ; preds = %347
  br label %585

583:                                              ; preds = %347, %347
  br label %585

584:                                              ; preds = %347
  br label %585

585:                                              ; preds = %347, %347, %347, %584, %583, %582
  %586 = phi i32 [ 0, %584 ], [ 10, %583 ], [ 8, %582 ], [ 16, %347 ], [ 16, %347 ], [ 16, %347 ]
  %587 = call i64 @__intscan(%struct._IO_FILE* noundef nonnull %0, i32 noundef %586, i32 noundef 0, i64 noundef -1) #6
  %588 = load i64, i64* %32, align 8, !tbaa !14
  %589 = load i8*, i8** %19, align 8, !tbaa !10
  %590 = load i8*, i8** %33, align 8, !tbaa !15
  %591 = ptrtoint i8* %589 to i64
  %592 = ptrtoint i8* %590 to i64
  %593 = sub i64 %592, %591
  %594 = icmp eq i64 %588, %593
  br i1 %594, label %676, label %595

595:                                              ; preds = %585
  %596 = icmp eq i32 %279, 112
  %597 = icmp ne i8* %221, null
  %598 = select i1 %596, i1 %597, i1 false
  br i1 %598, label %599, label %602

599:                                              ; preds = %595
  %600 = inttoptr i64 %587 to i8*
  %601 = bitcast i8* %221 to i8**
  store i8* %600, i8** %601, align 8, !tbaa !24
  br label %637

602:                                              ; preds = %595
  %603 = icmp eq i8* %221, null
  br i1 %603, label %637, label %604

604:                                              ; preds = %602
  switch i32 %280, label %637 [
    i32 -2, label %605
    i32 -1, label %607
    i32 0, label %610
    i32 1, label %613
    i32 3, label %615
  ]

605:                                              ; preds = %604
  %606 = trunc i64 %587 to i8
  store i8 %606, i8* %221, align 1, !tbaa !11
  br label %637

607:                                              ; preds = %604
  %608 = trunc i64 %587 to i16
  %609 = bitcast i8* %221 to i16*
  store i16 %608, i16* %609, align 2, !tbaa !16
  br label %637

610:                                              ; preds = %604
  %611 = trunc i64 %587 to i32
  %612 = bitcast i8* %221 to i32*
  store i32 %611, i32* %612, align 4, !tbaa !18
  br label %637

613:                                              ; preds = %604
  %614 = bitcast i8* %221 to i64*
  store i64 %587, i64* %614, align 8, !tbaa !19
  br label %637

615:                                              ; preds = %604
  %616 = bitcast i8* %221 to i64*
  store i64 %587, i64* %616, align 8, !tbaa !20
  br label %637

617:                                              ; preds = %347, %347, %347, %347, %347, %347, %347, %347
  %618 = call x86_fp80 @__floatscan(%struct._IO_FILE* noundef nonnull %0, i32 noundef %280, i32 noundef 0) #6
  %619 = load i64, i64* %32, align 8, !tbaa !14
  %620 = load i8*, i8** %19, align 8, !tbaa !10
  %621 = load i8*, i8** %33, align 8, !tbaa !15
  %622 = ptrtoint i8* %620 to i64
  %623 = ptrtoint i8* %621 to i64
  %624 = sub i64 %623, %622
  %625 = icmp eq i64 %619, %624
  br i1 %625, label %676, label %626

626:                                              ; preds = %617
  %627 = icmp eq i8* %221, null
  br i1 %627, label %637, label %628

628:                                              ; preds = %626
  switch i32 %280, label %637 [
    i32 0, label %629
    i32 1, label %632
    i32 2, label %635
  ]

629:                                              ; preds = %628
  %630 = call float @llvm.experimental.constrained.fptrunc.f32.f80(x86_fp80 %618, metadata !"round.dynamic", metadata !"fpexcept.ignore") #7
  %631 = bitcast i8* %221 to float*
  store float %630, float* %631, align 4, !tbaa !25
  br label %637

632:                                              ; preds = %628
  %633 = call double @llvm.experimental.constrained.fptrunc.f64.f80(x86_fp80 %618, metadata !"round.dynamic", metadata !"fpexcept.ignore") #7
  %634 = bitcast i8* %221 to double*
  store double %633, double* %634, align 8, !tbaa !27
  br label %637

635:                                              ; preds = %628
  %636 = bitcast i8* %221 to x86_fp80*
  store x86_fp80 %618, x86_fp80* %636, align 16, !tbaa !29
  br label %637

637:                                              ; preds = %615, %613, %610, %607, %605, %604, %602, %626, %628, %635, %632, %629, %599, %573, %580, %578, %347
  %638 = phi i8* [ %251, %347 ], [ %251, %628 ], [ %251, %635 ], [ %251, %632 ], [ %251, %629 ], [ %251, %626 ], [ %251, %599 ], [ %545, %580 ], [ null, %578 ], [ %545, %573 ], [ %251, %602 ], [ %251, %604 ], [ %251, %605 ], [ %251, %607 ], [ %251, %610 ], [ %251, %613 ], [ %251, %615 ]
  %639 = phi i32* [ %252, %347 ], [ %252, %628 ], [ %252, %635 ], [ %252, %632 ], [ %252, %629 ], [ %252, %626 ], [ %252, %599 ], [ %546, %580 ], [ %546, %578 ], [ %546, %573 ], [ %252, %602 ], [ %252, %604 ], [ %252, %605 ], [ %252, %607 ], [ %252, %610 ], [ %252, %613 ], [ %252, %615 ]
  %640 = phi i8* [ %272, %347 ], [ %272, %628 ], [ %272, %635 ], [ %272, %632 ], [ %272, %629 ], [ %272, %626 ], [ %272, %599 ], [ %406, %580 ], [ %406, %578 ], [ %406, %573 ], [ %272, %602 ], [ %272, %604 ], [ %272, %605 ], [ %272, %607 ], [ %272, %610 ], [ %272, %613 ], [ %272, %615 ]
  %641 = load i64, i64* %32, align 8, !tbaa !14
  %642 = load i8*, i8** %19, align 8, !tbaa !10
  %643 = load i8*, i8** %33, align 8, !tbaa !15
  %644 = ptrtoint i8* %642 to i64
  %645 = ptrtoint i8* %643 to i64
  %646 = add i64 %641, %330
  %647 = add i64 %646, %644
  %648 = sub i64 %647, %645
  %649 = icmp ne i8* %221, null
  %650 = zext i1 %649 to i32
  %651 = add nsw i32 %56, %650
  br label %652

652:                                              ; preds = %298, %296, %293, %290, %288, %287, %285, %637, %151, %93
  %653 = phi i8* [ %58, %93 ], [ %58, %151 ], [ %638, %637 ], [ %251, %285 ], [ %251, %287 ], [ %251, %288 ], [ %251, %290 ], [ %251, %293 ], [ %251, %296 ], [ %251, %298 ]
  %654 = phi i32* [ %57, %93 ], [ %57, %151 ], [ %639, %637 ], [ %252, %285 ], [ %252, %287 ], [ %252, %288 ], [ %252, %290 ], [ %252, %293 ], [ %252, %296 ], [ %252, %298 ]
  %655 = phi i32 [ %56, %93 ], [ %56, %151 ], [ %651, %637 ], [ %56, %285 ], [ %56, %287 ], [ %56, %288 ], [ %56, %290 ], [ %56, %293 ], [ %56, %296 ], [ %56, %298 ]
  %656 = phi i8* [ %65, %93 ], [ %137, %151 ], [ %640, %637 ], [ %272, %285 ], [ %272, %287 ], [ %272, %288 ], [ %272, %290 ], [ %272, %293 ], [ %272, %296 ], [ %272, %298 ]
  %657 = phi i64 [ %101, %93 ], [ %159, %151 ], [ %648, %637 ], [ %54, %285 ], [ %54, %287 ], [ %54, %288 ], [ %54, %290 ], [ %54, %293 ], [ %54, %296 ], [ %54, %298 ]
  %658 = getelementptr inbounds i8, i8* %656, i64 1
  %659 = load i8, i8* %658, align 1, !tbaa !11
  %660 = icmp eq i8 %659, 0
  br i1 %660, label %684, label %52

661:                                              ; preds = %445
  %662 = bitcast i8* %421 to i32*
  br label %667

663:                                              ; preds = %457
  %664 = bitcast i8* %421 to i32*
  br label %667

665:                                              ; preds = %463
  %666 = bitcast i8* %421 to i32*
  br label %667

667:                                              ; preds = %665, %338, %249, %468, %413, %379, %498, %663, %661
  %668 = phi i8* [ null, %661 ], [ null, %663 ], [ %472, %498 ], [ %251, %379 ], [ null, %665 ], [ %251, %338 ], [ %251, %249 ], [ null, %468 ], [ null, %413 ]
  %669 = phi i32* [ %662, %661 ], [ %664, %663 ], [ null, %498 ], [ %252, %379 ], [ %666, %665 ], [ %252, %338 ], [ %252, %249 ], [ null, %468 ], [ null, %413 ]
  %670 = phi i32 [ %254, %661 ], [ 1, %663 ], [ 1, %498 ], [ %254, %379 ], [ %254, %665 ], [ %254, %338 ], [ %254, %249 ], [ 1, %468 ], [ 1, %413 ]
  %671 = icmp eq i32 %56, 0
  br i1 %671, label %672, label %676

672:                                              ; preds = %22, %147, %667
  %673 = phi i8* [ %58, %147 ], [ %668, %667 ], [ undef, %22 ]
  %674 = phi i32* [ %57, %147 ], [ %669, %667 ], [ undef, %22 ]
  %675 = phi i32 [ 0, %147 ], [ %670, %667 ], [ 0, %22 ]
  br label %676

676:                                              ; preds = %562, %617, %585, %553, %667, %672
  %677 = phi i8* [ %673, %672 ], [ %668, %667 ], [ %545, %562 ], [ %545, %553 ], [ %251, %585 ], [ %251, %617 ]
  %678 = phi i32* [ %674, %672 ], [ %669, %667 ], [ %546, %562 ], [ %546, %553 ], [ %252, %585 ], [ %252, %617 ]
  %679 = phi i32 [ -1, %672 ], [ %56, %667 ], [ %56, %553 ], [ %56, %585 ], [ %56, %617 ], [ %56, %562 ]
  %680 = phi i32 [ %675, %672 ], [ %670, %667 ], [ %254, %553 ], [ %254, %585 ], [ %254, %617 ], [ %254, %562 ]
  %681 = icmp eq i32 %680, 0
  br i1 %681, label %684, label %682

682:                                              ; preds = %676
  call void @free(i8* noundef %677) #6
  %683 = bitcast i32* %678 to i8*
  call void @free(i8* noundef %683) #6
  br label %684

684:                                              ; preds = %652, %26, %147, %682, %676
  %685 = phi i32 [ %679, %682 ], [ %679, %676 ], [ %56, %147 ], [ 0, %26 ], [ %655, %652 ]
  %686 = icmp eq i32 %18, 0
  br i1 %686, label %688, label %687

687:                                              ; preds = %684
  call void @__unlockfile(%struct._IO_FILE* noundef %0) #6
  br label %688

688:                                              ; preds = %684, %687
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %11) #5
  call void @llvm.lifetime.end.p0i8(i64 257, i8* nonnull %10) #5
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %9) #5
  ret i32 %685
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__toread(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__shlim(%struct._IO_FILE* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__shgetc(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @malloc(i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @mbrtowc(i32* noundef, i8* noundef, i64 noundef, %struct.__mbstate_t* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @realloc(i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @mbsinit(%struct.__mbstate_t* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i64 @__intscan(%struct._IO_FILE* noundef, i32 noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden x86_fp80 @__floatscan(%struct._IO_FILE* noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f80(x86_fp80, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fptrunc.f64.f80(x86_fp80, metadata, metadata) #3

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__unlockfile(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_copy(i8*, i8*) #4

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #4

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #4 = { mustprogress nofree nosync nounwind willreturn }
attributes #5 = { nounwind strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #7 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 140}
!4 = !{!"_IO_FILE", !5, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !9, i64 96, !8, i64 104, !8, i64 112, !5, i64 120, !5, i64 124, !9, i64 128, !5, i64 136, !5, i64 140, !5, i64 144, !8, i64 152, !9, i64 160, !8, i64 168, !8, i64 176, !8, i64 184, !9, i64 192, !9, i64 200, !8, i64 208, !8, i64 216, !8, i64 224}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{!4, !8, i64 8}
!11 = !{!6, !6, i64 0}
!12 = !{!4, !8, i64 184}
!13 = !{!4, !9, i64 192}
!14 = !{!4, !9, i64 200}
!15 = !{!4, !8, i64 88}
!16 = !{!17, !17, i64 0}
!17 = !{!"short", !6, i64 0}
!18 = !{!5, !5, i64 0}
!19 = !{!9, !9, i64 0}
!20 = !{!21, !21, i64 0}
!21 = !{!"long long", !6, i64 0}
!22 = !{i64 0, i64 4, !18, i64 4, i64 4, !18}
!23 = !{i64 0, i64 4, !18}
!24 = !{!8, !8, i64 0}
!25 = !{!26, !26, i64 0}
!26 = !{!"float", !6, i64 0}
!27 = !{!28, !28, i64 0}
!28 = !{!"double", !6, i64 0}
!29 = !{!30, !30, i64 0}
!30 = !{!"long double", !6, i64 0}
