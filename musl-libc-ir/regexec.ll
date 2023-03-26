; ModuleID = 'src/regex/regexec.c'
source_filename = "src/regex/regexec.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.re_pattern_buffer = type { i64, i8*, [4 x i8*], i64, i8 }
%struct.regmatch_t = type { i64, i64 }
%struct.tnfa = type { %struct.tnfa_transition*, i32, %struct.tnfa_transition*, %struct.tnfa_transition*, %struct.tre_submatch_data*, i8*, i32, i32, i32*, i32*, i32, i32, i32, i32, i32, i32, i32 }
%struct.tnfa_transition = type { i32, i32, %struct.tnfa_transition*, i32, i32*, i32, %union.anon, i64* }
%union.anon = type { i64 }
%struct.tre_submatch_data = type { i32, i32, i32* }
%struct.tre_mem_struct = type { %struct.tre_list*, %struct.tre_list*, i8*, i64, i32, i8** }
%struct.tre_list = type { i8*, %struct.tre_list* }
%struct.tre_backtrack_struct = type { %struct.tre_backtrack_item_t, %struct.tre_backtrack_struct*, %struct.tre_backtrack_struct* }
%struct.tre_backtrack_item_t = type { i64, i8*, %struct.tnfa_transition*, i32, i32, i64* }
%struct.tre_tnfa_reach_t = type { %struct.tnfa_transition*, i64* }
%struct.tre_reach_pos_t = type { i64, i64** }

; Function Attrs: nounwind optsize strictfp
define i32 @regexec(%struct.re_pattern_buffer* noalias nocapture noundef readonly %0, i8* noalias noundef %1, i64 noundef %2, %struct.regmatch_t* noalias nocapture noundef %3, i32 noundef %4) local_unnamed_addr #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %0, i64 0, i32 1
  %9 = bitcast i8** %8 to %struct.tnfa**
  %10 = load %struct.tnfa*, %struct.tnfa** %9, align 8, !tbaa !3
  %11 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %10, i64 0, i32 14
  %12 = load i32, i32* %11, align 8, !tbaa !9
  %13 = and i32 %12, 8
  %14 = icmp eq i32 %13, 0
  %15 = select i1 %14, i64 %2, i64 0
  %16 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %10, i64 0, i32 10
  %17 = load i32, i32* %16, align 8, !tbaa !12
  %18 = icmp sgt i32 %17, 0
  %19 = icmp ne i64 %15, 0
  %20 = and i1 %18, %19
  br i1 %20, label %21, label %27

21:                                               ; preds = %5
  %22 = zext i32 %17 to i64
  %23 = shl nuw nsw i64 %22, 3
  %24 = tail call i8* @malloc(i64 noundef %23) #5
  %25 = bitcast i8* %24 to i64*
  %26 = icmp eq i8* %24, null
  br i1 %26, label %1591, label %27

27:                                               ; preds = %21, %5
  %28 = phi i64* [ %25, %21 ], [ null, %5 ]
  %29 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %10, i64 0, i32 15
  %30 = load i32, i32* %29, align 4, !tbaa !13
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %858, label %32

32:                                               ; preds = %27
  %33 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %33) #6
  store i32 0, i32* %7, align 4, !tbaa !14
  %34 = and i32 %4, 1
  %35 = and i32 %4, 2
  %36 = load i32, i32* %11, align 8, !tbaa !9
  %37 = and i32 %36, 4
  %38 = tail call %struct.tre_mem_struct* @__tre_mem_new_impl(i32 noundef 0, i8* noundef null) #5
  %39 = icmp eq %struct.tre_mem_struct* %38, null
  br i1 %39, label %855, label %40

40:                                               ; preds = %32
  %41 = tail call i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef nonnull %38, i32 noundef 0, i8* noundef null, i32 noundef 0, i64 noundef 56) #5
  %42 = bitcast i8* %41 to %struct.tre_backtrack_struct*
  %43 = icmp eq i8* %41, null
  br i1 %43, label %838, label %44

44:                                               ; preds = %40
  %45 = getelementptr inbounds i8, i8* %41, i64 40
  %46 = bitcast i8* %45 to <2 x %struct.tre_backtrack_struct*>*
  store <2 x %struct.tre_backtrack_struct*> zeroinitializer, <2 x %struct.tre_backtrack_struct*>* %46, align 8, !tbaa !15
  %47 = load i32, i32* %16, align 8, !tbaa !12
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %55, label %49

49:                                               ; preds = %44
  %50 = sext i32 %47 to i64
  %51 = shl nsw i64 %50, 3
  %52 = tail call i8* @malloc(i64 noundef %51) #5
  %53 = bitcast i8* %52 to i64*
  %54 = icmp eq i8* %52, null
  br i1 %54, label %838, label %55

55:                                               ; preds = %49, %44
  %56 = phi i64* [ %53, %49 ], [ null, %44 ]
  %57 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %10, i64 0, i32 7
  %58 = load i32, i32* %57, align 4, !tbaa !16
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %66, label %60

60:                                               ; preds = %55
  %61 = zext i32 %58 to i64
  %62 = shl nuw nsw i64 %61, 4
  %63 = tail call i8* @malloc(i64 noundef %62) #5
  %64 = bitcast i8* %63 to %struct.regmatch_t*
  %65 = icmp eq i8* %63, null
  br i1 %65, label %839, label %66

66:                                               ; preds = %60, %55
  %67 = phi %struct.regmatch_t* [ %64, %60 ], [ null, %55 ]
  %68 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %10, i64 0, i32 13
  %69 = load i32, i32* %68, align 4, !tbaa !17
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %77, label %71

71:                                               ; preds = %66
  %72 = sext i32 %69 to i64
  %73 = shl nsw i64 %72, 2
  %74 = tail call i8* @malloc(i64 noundef %73) #5
  %75 = bitcast i8* %74 to i32*
  %76 = icmp eq i8* %74, null
  br i1 %76, label %839, label %77

77:                                               ; preds = %71, %66
  %78 = phi i32* [ %75, %71 ], [ null, %66 ]
  %79 = icmp eq i64* %28, null
  %80 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %10, i64 0, i32 2
  %81 = icmp eq i32 %34, 0
  %82 = icmp ne i32 %37, 0
  %83 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %10, i64 0, i32 3
  %84 = icmp ne i64* %28, null
  %85 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %10, i64 0, i32 8
  br label %86

86:                                               ; preds = %834, %77
  %87 = phi i32 [ 0, %77 ], [ %128, %834 ]
  %88 = phi %struct.tre_backtrack_struct* [ %42, %77 ], [ %791, %834 ]
  %89 = phi i64 [ -1, %77 ], [ %792, %834 ]
  %90 = phi i64 [ -1, %77 ], [ %119, %834 ]
  %91 = phi i64 [ 1, %77 ], [ %793, %834 ]
  %92 = phi i8* [ %1, %77 ], [ %127, %834 ]
  %93 = load i32, i32* %16, align 8, !tbaa !12
  %94 = icmp sgt i32 %93, 0
  br i1 %94, label %95, label %97

95:                                               ; preds = %86
  %96 = zext i32 %93 to i64
  br label %100

97:                                               ; preds = %105, %86
  %98 = load i32, i32* %68, align 4, !tbaa !17
  %99 = icmp sgt i32 %98, 0
  br i1 %99, label %108, label %117

100:                                              ; preds = %105, %95
  %101 = phi i64 [ 0, %95 ], [ %106, %105 ]
  %102 = getelementptr inbounds i64, i64* %56, i64 %101
  store i64 -1, i64* %102, align 8, !tbaa !18
  br i1 %79, label %105, label %103

103:                                              ; preds = %100
  %104 = getelementptr inbounds i64, i64* %28, i64 %101
  store i64 -1, i64* %104, align 8, !tbaa !18
  br label %105

105:                                              ; preds = %103, %100
  %106 = add nuw nsw i64 %101, 1
  %107 = icmp eq i64 %106, %96
  br i1 %107, label %97, label %100

108:                                              ; preds = %97, %108
  %109 = phi i64 [ %111, %108 ], [ 0, %97 ]
  %110 = getelementptr inbounds i32, i32* %78, i64 %109
  store i32 0, i32* %110, align 4, !tbaa !14
  %111 = add nuw nsw i64 %109, 1
  %112 = load i32, i32* %68, align 4, !tbaa !17
  %113 = sext i32 %112 to i64
  %114 = icmp slt i64 %111, %113
  br i1 %114, label %108, label %115

115:                                              ; preds = %108
  %116 = load i32, i32* %7, align 4, !tbaa !14
  br label %117

117:                                              ; preds = %115, %97
  %118 = phi i32 [ %116, %115 ], [ %87, %97 ]
  %119 = add nsw i64 %91, %90
  %120 = call i32 @mbtowc(i32* noundef nonnull %7, i8* noundef %92, i64 noundef 4) #5
  %121 = sext i32 %120 to i64
  %122 = icmp slt i32 %120, 1
  br i1 %122, label %123, label %125

123:                                              ; preds = %117
  %124 = icmp slt i32 %120, 0
  br i1 %124, label %839, label %125

125:                                              ; preds = %123, %117
  %126 = phi i64 [ %121, %117 ], [ 1, %123 ]
  %127 = getelementptr inbounds i8, i8* %92, i64 %126
  %128 = load i32, i32* %7, align 4, !tbaa !14
  %129 = load %struct.tnfa_transition*, %struct.tnfa_transition** %80, align 8, !tbaa !19
  %130 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %129, i64 0, i32 2
  %131 = load %struct.tnfa_transition*, %struct.tnfa_transition** %130, align 8, !tbaa !20
  %132 = icmp eq %struct.tnfa_transition* %131, null
  br i1 %132, label %361, label %133

133:                                              ; preds = %125
  %134 = icmp slt i64 %119, 1
  %135 = icmp eq i32 %118, 10
  %136 = select i1 %135, i1 %82, i1 false
  %137 = icmp eq i32 %118, 95
  %138 = icmp ne i64 %119, 0
  %139 = icmp eq i64 %119, 0
  %140 = and i1 %81, %134
  br label %141

141:                                              ; preds = %340, %133
  %142 = phi %struct.tnfa_transition** [ %130, %133 ], [ %345, %340 ]
  %143 = phi %struct.tnfa_transition* [ %129, %133 ], [ %344, %340 ]
  %144 = phi %struct.tre_backtrack_struct* [ %88, %133 ], [ %343, %340 ]
  %145 = phi i32* [ null, %133 ], [ %342, %340 ]
  %146 = phi %struct.tnfa_transition* [ null, %133 ], [ %341, %340 ]
  %147 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %143, i64 0, i32 5
  %148 = load i32, i32* %147, align 8, !tbaa !22
  %149 = icmp eq i32 %148, 0
  br i1 %149, label %246, label %150

150:                                              ; preds = %141
  %151 = and i32 %148, 1
  %152 = icmp eq i32 %151, 0
  %153 = select i1 %152, i1 true, i1 %140
  %154 = select i1 %153, i1 true, i1 %136
  br i1 %154, label %155, label %340

155:                                              ; preds = %150
  %156 = and i32 %148, 2
  %157 = icmp eq i32 %156, 0
  br i1 %157, label %165, label %158

158:                                              ; preds = %155
  %159 = load i32, i32* %7, align 4, !tbaa !14
  %160 = or i32 %159, %35
  %161 = icmp eq i32 %160, 0
  br i1 %161, label %165, label %162

162:                                              ; preds = %158
  %163 = icmp eq i32 %159, 10
  %164 = select i1 %163, i1 %82, i1 false
  br i1 %164, label %165, label %340

165:                                              ; preds = %162, %158, %155
  %166 = and i32 %148, 16
  %167 = icmp eq i32 %166, 0
  br i1 %167, label %178, label %168

168:                                              ; preds = %165
  br i1 %137, label %340, label %169

169:                                              ; preds = %168
  %170 = call i32 @iswalnum(i32 noundef %118) #5
  %171 = icmp eq i32 %170, 0
  br i1 %171, label %172, label %340

172:                                              ; preds = %169
  %173 = load i32, i32* %7, align 4, !tbaa !14
  %174 = icmp eq i32 %173, 95
  br i1 %174, label %178, label %175

175:                                              ; preds = %172
  %176 = call i32 @iswalnum(i32 noundef %173) #5
  %177 = icmp eq i32 %176, 0
  br i1 %177, label %340, label %178

178:                                              ; preds = %175, %172, %165
  %179 = load i32, i32* %147, align 8, !tbaa !22
  %180 = and i32 %179, 32
  %181 = icmp eq i32 %180, 0
  br i1 %181, label %198, label %182

182:                                              ; preds = %178
  br i1 %137, label %189, label %183

183:                                              ; preds = %182
  %184 = call i32 @iswalnum(i32 noundef %118) #5
  %185 = icmp eq i32 %184, 0
  %186 = load i32, i32* %7, align 4
  %187 = icmp eq i32 %186, 95
  %188 = select i1 %185, i1 true, i1 %187
  br i1 %188, label %340, label %192

189:                                              ; preds = %182
  %190 = load i32, i32* %7, align 4, !tbaa !14
  %191 = icmp eq i32 %190, 95
  br i1 %191, label %340, label %192

192:                                              ; preds = %189, %183
  %193 = phi i32 [ %186, %183 ], [ %190, %189 ]
  %194 = call i32 @iswalnum(i32 noundef %193) #5
  %195 = icmp eq i32 %194, 0
  br i1 %195, label %196, label %340

196:                                              ; preds = %192
  %197 = load i32, i32* %147, align 8, !tbaa !22
  br label %198

198:                                              ; preds = %196, %178
  %199 = phi i32 [ %197, %196 ], [ %179, %178 ]
  %200 = and i32 %199, 64
  %201 = icmp ne i32 %200, 0
  %202 = select i1 %201, i1 %138, i1 false
  %203 = load i32, i32* %7, align 4
  %204 = icmp ne i32 %203, 0
  %205 = select i1 %202, i1 %204, i1 false
  br i1 %205, label %206, label %222

206:                                              ; preds = %198
  br i1 %137, label %212, label %207

207:                                              ; preds = %206
  %208 = call i32 @iswalnum(i32 noundef %118) #5
  %209 = icmp ne i32 %208, 0
  %210 = load i32, i32* %7, align 4, !tbaa !14
  %211 = icmp eq i32 %210, 95
  br i1 %211, label %217, label %218

212:                                              ; preds = %206
  %213 = icmp eq i32 %203, 95
  br i1 %213, label %340, label %214

214:                                              ; preds = %212
  %215 = call i32 @iswalnum(i32 noundef %203) #5
  %216 = icmp eq i32 %215, 0
  br i1 %216, label %222, label %340

217:                                              ; preds = %207
  br i1 %209, label %340, label %222

218:                                              ; preds = %207
  %219 = call i32 @iswalnum(i32 noundef %210) #5
  %220 = icmp ne i32 %219, 0
  %221 = xor i1 %209, %220
  br i1 %221, label %222, label %340

222:                                              ; preds = %218, %217, %214, %198
  %223 = load i32, i32* %147, align 8, !tbaa !22
  %224 = and i32 %223, 128
  %225 = icmp eq i32 %224, 0
  br i1 %225, label %246, label %226

226:                                              ; preds = %222
  %227 = load i32, i32* %7, align 4
  %228 = icmp eq i32 %227, 0
  %229 = select i1 %139, i1 true, i1 %228
  br i1 %229, label %340, label %230

230:                                              ; preds = %226
  br i1 %137, label %236, label %231

231:                                              ; preds = %230
  %232 = call i32 @iswalnum(i32 noundef %118) #5
  %233 = icmp ne i32 %232, 0
  %234 = load i32, i32* %7, align 4, !tbaa !14
  %235 = icmp eq i32 %234, 95
  br i1 %235, label %241, label %242

236:                                              ; preds = %230
  %237 = icmp eq i32 %227, 95
  br i1 %237, label %246, label %238

238:                                              ; preds = %236
  %239 = call i32 @iswalnum(i32 noundef %227) #5
  %240 = icmp eq i32 %239, 0
  br i1 %240, label %340, label %246

241:                                              ; preds = %231
  br i1 %233, label %246, label %340

242:                                              ; preds = %231
  %243 = call i32 @iswalnum(i32 noundef %234) #5
  %244 = icmp ne i32 %243, 0
  %245 = xor i1 %233, %244
  br i1 %245, label %340, label %246

246:                                              ; preds = %242, %241, %238, %236, %222, %141
  %247 = icmp eq %struct.tnfa_transition* %146, null
  br i1 %247, label %248, label %252

248:                                              ; preds = %246
  %249 = load %struct.tnfa_transition*, %struct.tnfa_transition** %142, align 8, !tbaa !20
  %250 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %143, i64 0, i32 4
  %251 = load i32*, i32** %250, align 8, !tbaa !23
  br label %340

252:                                              ; preds = %246
  %253 = getelementptr inbounds %struct.tre_backtrack_struct, %struct.tre_backtrack_struct* %144, i64 0, i32 2
  %254 = load %struct.tre_backtrack_struct*, %struct.tre_backtrack_struct** %253, align 8, !tbaa !24
  %255 = icmp eq %struct.tre_backtrack_struct* %254, null
  br i1 %255, label %256, label %298

256:                                              ; preds = %252
  %257 = call i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef nonnull %38, i32 noundef 0, i8* noundef null, i32 noundef 0, i64 noundef 56) #5
  %258 = bitcast i8* %257 to %struct.tre_backtrack_struct*
  %259 = icmp eq i8* %257, null
  br i1 %259, label %260, label %272

260:                                              ; preds = %256
  call void @__tre_mem_destroy(%struct.tre_mem_struct* noundef nonnull %38) #5
  %261 = icmp eq i64* %56, null
  br i1 %261, label %264, label %262

262:                                              ; preds = %260
  %263 = bitcast i64* %56 to i8*
  call void @free(i8* noundef nonnull %263) #5
  br label %264

264:                                              ; preds = %262, %260
  %265 = icmp eq %struct.regmatch_t* %67, null
  br i1 %265, label %268, label %266

266:                                              ; preds = %264
  %267 = bitcast %struct.regmatch_t* %67 to i8*
  call void @free(i8* noundef nonnull %267) #5
  br label %268

268:                                              ; preds = %266, %264
  %269 = icmp eq i32* %78, null
  br i1 %269, label %855, label %270

270:                                              ; preds = %268
  %271 = bitcast i32* %78 to i8*
  call void @free(i8* noundef nonnull %271) #5
  br label %855

272:                                              ; preds = %256
  %273 = getelementptr inbounds i8, i8* %257, i64 40
  %274 = bitcast i8* %273 to %struct.tre_backtrack_struct**
  store %struct.tre_backtrack_struct* %144, %struct.tre_backtrack_struct** %274, align 8, !tbaa !27
  %275 = getelementptr inbounds i8, i8* %257, i64 48
  %276 = bitcast i8* %275 to %struct.tre_backtrack_struct**
  store %struct.tre_backtrack_struct* null, %struct.tre_backtrack_struct** %276, align 8, !tbaa !24
  %277 = load i32, i32* %16, align 8, !tbaa !12
  %278 = sext i32 %277 to i64
  %279 = shl nsw i64 %278, 3
  %280 = call i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef nonnull %38, i32 noundef 0, i8* noundef null, i32 noundef 0, i64 noundef %279) #5
  %281 = getelementptr inbounds i8, i8* %257, i64 32
  %282 = bitcast i8* %281 to i8**
  store i8* %280, i8** %282, align 8, !tbaa !28
  %283 = icmp eq i8* %280, null
  br i1 %283, label %284, label %296

284:                                              ; preds = %272
  call void @__tre_mem_destroy(%struct.tre_mem_struct* noundef nonnull %38) #5
  %285 = icmp eq i64* %56, null
  br i1 %285, label %288, label %286

286:                                              ; preds = %284
  %287 = bitcast i64* %56 to i8*
  call void @free(i8* noundef nonnull %287) #5
  br label %288

288:                                              ; preds = %286, %284
  %289 = icmp eq %struct.regmatch_t* %67, null
  br i1 %289, label %292, label %290

290:                                              ; preds = %288
  %291 = bitcast %struct.regmatch_t* %67 to i8*
  call void @free(i8* noundef nonnull %291) #5
  br label %292

292:                                              ; preds = %290, %288
  %293 = icmp eq i32* %78, null
  br i1 %293, label %855, label %294

294:                                              ; preds = %292
  %295 = bitcast i32* %78 to i8*
  call void @free(i8* noundef nonnull %295) #5
  br label %855

296:                                              ; preds = %272
  %297 = bitcast %struct.tre_backtrack_struct** %253 to i8**
  store i8* %257, i8** %297, align 8, !tbaa !24
  br label %298

298:                                              ; preds = %296, %252
  %299 = phi %struct.tre_backtrack_struct* [ %258, %296 ], [ %254, %252 ]
  %300 = getelementptr inbounds %struct.tre_backtrack_struct, %struct.tre_backtrack_struct* %299, i64 0, i32 0, i32 0
  store i64 %119, i64* %300, align 8, !tbaa !29
  %301 = getelementptr inbounds %struct.tre_backtrack_struct, %struct.tre_backtrack_struct* %299, i64 0, i32 0, i32 1
  store i8* %127, i8** %301, align 8, !tbaa !30
  %302 = load %struct.tnfa_transition*, %struct.tnfa_transition** %142, align 8, !tbaa !20
  %303 = getelementptr inbounds %struct.tre_backtrack_struct, %struct.tre_backtrack_struct* %299, i64 0, i32 0, i32 2
  store %struct.tnfa_transition* %302, %struct.tnfa_transition** %303, align 8, !tbaa !31
  %304 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %143, i64 0, i32 3
  %305 = load i32, i32* %304, align 8, !tbaa !32
  %306 = getelementptr inbounds %struct.tre_backtrack_struct, %struct.tre_backtrack_struct* %299, i64 0, i32 0, i32 3
  store i32 %305, i32* %306, align 8, !tbaa !33
  %307 = load i32, i32* %7, align 4, !tbaa !14
  %308 = getelementptr inbounds %struct.tre_backtrack_struct, %struct.tre_backtrack_struct* %299, i64 0, i32 0, i32 4
  store i32 %307, i32* %308, align 4, !tbaa !34
  %309 = load i32, i32* %16, align 8, !tbaa !12
  %310 = icmp sgt i32 %309, 0
  br i1 %310, label %311, label %322

311:                                              ; preds = %298
  %312 = getelementptr inbounds %struct.tre_backtrack_struct, %struct.tre_backtrack_struct* %299, i64 0, i32 0, i32 5
  %313 = load i64*, i64** %312, align 8, !tbaa !28
  %314 = zext i32 %309 to i64
  br label %315

315:                                              ; preds = %315, %311
  %316 = phi i64 [ 0, %311 ], [ %320, %315 ]
  %317 = getelementptr inbounds i64, i64* %56, i64 %316
  %318 = load i64, i64* %317, align 8, !tbaa !18
  %319 = getelementptr inbounds i64, i64* %313, i64 %316
  store i64 %318, i64* %319, align 8, !tbaa !18
  %320 = add nuw nsw i64 %316, 1
  %321 = icmp eq i64 %320, %314
  br i1 %321, label %322, label %315

322:                                              ; preds = %315, %298
  %323 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %143, i64 0, i32 4
  %324 = load i32*, i32** %323, align 8, !tbaa !23
  %325 = icmp eq i32* %324, null
  br i1 %325, label %340, label %326

326:                                              ; preds = %322
  %327 = load i32, i32* %324, align 4, !tbaa !14
  %328 = icmp sgt i32 %327, -1
  br i1 %328, label %329, label %340

329:                                              ; preds = %326
  %330 = getelementptr inbounds %struct.tre_backtrack_struct, %struct.tre_backtrack_struct* %299, i64 0, i32 0, i32 5
  %331 = load i64*, i64** %330, align 8, !tbaa !28
  br label %332

332:                                              ; preds = %332, %329
  %333 = phi i32 [ %327, %329 ], [ %338, %332 ]
  %334 = phi i32* [ %324, %329 ], [ %335, %332 ]
  %335 = getelementptr inbounds i32, i32* %334, i64 1
  %336 = zext i32 %333 to i64
  %337 = getelementptr inbounds i64, i64* %331, i64 %336
  store i64 %119, i64* %337, align 8, !tbaa !18
  %338 = load i32, i32* %335, align 4, !tbaa !14
  %339 = icmp sgt i32 %338, -1
  br i1 %339, label %332, label %340

340:                                              ; preds = %332, %326, %322, %248, %242, %241, %238, %226, %218, %217, %214, %212, %192, %189, %183, %175, %169, %168, %162, %150
  %341 = phi %struct.tnfa_transition* [ %146, %168 ], [ %146, %169 ], [ %146, %189 ], [ %146, %192 ], [ %146, %218 ], [ %146, %226 ], [ %146, %242 ], [ %249, %248 ], [ %146, %183 ], [ %146, %175 ], [ %146, %162 ], [ %146, %322 ], [ %146, %217 ], [ %146, %241 ], [ %146, %150 ], [ %146, %326 ], [ %146, %214 ], [ %146, %238 ], [ %146, %212 ], [ %146, %332 ]
  %342 = phi i32* [ %145, %168 ], [ %145, %169 ], [ %145, %189 ], [ %145, %192 ], [ %145, %218 ], [ %145, %226 ], [ %145, %242 ], [ %251, %248 ], [ %145, %183 ], [ %145, %175 ], [ %145, %162 ], [ %145, %322 ], [ %145, %217 ], [ %145, %241 ], [ %145, %150 ], [ %145, %326 ], [ %145, %214 ], [ %145, %238 ], [ %145, %212 ], [ %145, %332 ]
  %343 = phi %struct.tre_backtrack_struct* [ %144, %168 ], [ %144, %169 ], [ %144, %189 ], [ %144, %192 ], [ %144, %218 ], [ %144, %226 ], [ %144, %242 ], [ %144, %248 ], [ %144, %183 ], [ %144, %175 ], [ %144, %162 ], [ %299, %322 ], [ %144, %217 ], [ %144, %241 ], [ %144, %150 ], [ %299, %326 ], [ %144, %214 ], [ %144, %238 ], [ %144, %212 ], [ %299, %332 ]
  %344 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %143, i64 1
  %345 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %143, i64 1, i32 2
  %346 = load %struct.tnfa_transition*, %struct.tnfa_transition** %345, align 8, !tbaa !20
  %347 = icmp eq %struct.tnfa_transition* %346, null
  br i1 %347, label %348, label %141

348:                                              ; preds = %340
  %349 = icmp eq i32* %342, null
  br i1 %349, label %361, label %350

350:                                              ; preds = %348
  %351 = load i32, i32* %342, align 4, !tbaa !14
  %352 = icmp sgt i32 %351, -1
  br i1 %352, label %353, label %361

353:                                              ; preds = %350, %353
  %354 = phi i32 [ %359, %353 ], [ %351, %350 ]
  %355 = phi i32* [ %358, %353 ], [ %342, %350 ]
  %356 = zext i32 %354 to i64
  %357 = getelementptr inbounds i64, i64* %56, i64 %356
  store i64 %119, i64* %357, align 8, !tbaa !18
  %358 = getelementptr inbounds i32, i32* %355, i64 1
  %359 = load i32, i32* %358, align 4, !tbaa !14
  %360 = icmp sgt i32 %359, -1
  br i1 %360, label %353, label %361

361:                                              ; preds = %353, %350, %348, %125
  %362 = phi %struct.tre_backtrack_struct* [ %343, %348 ], [ %343, %350 ], [ %88, %125 ], [ %343, %353 ]
  %363 = phi %struct.tnfa_transition* [ %341, %348 ], [ %341, %350 ], [ null, %125 ], [ %341, %353 ]
  %364 = phi i32* [ null, %348 ], [ %342, %350 ], [ null, %125 ], [ %358, %353 ]
  %365 = icmp eq %struct.tnfa_transition* %363, null
  br i1 %365, label %789, label %366

366:                                              ; preds = %822, %361, %809
  %367 = phi %struct.tnfa_transition* [ %799, %809 ], [ %363, %361 ], [ %799, %822 ]
  %368 = phi i32* [ %790, %809 ], [ %364, %361 ], [ %790, %822 ]
  %369 = phi %struct.tre_backtrack_struct* [ %795, %809 ], [ %362, %361 ], [ %795, %822 ]
  %370 = phi i64 [ %792, %809 ], [ %89, %361 ], [ %792, %822 ]
  %371 = phi i64 [ %793, %809 ], [ %126, %361 ], [ %793, %822 ]
  %372 = phi i64 [ %811, %809 ], [ %119, %361 ], [ %811, %822 ]
  %373 = phi i8* [ %813, %809 ], [ %127, %361 ], [ %813, %822 ]
  br label %374

374:                                              ; preds = %771, %366
  %375 = phi %struct.tnfa_transition* [ %367, %366 ], [ %767, %771 ]
  %376 = phi i32* [ %368, %366 ], [ %772, %771 ]
  %377 = phi %struct.tre_backtrack_struct* [ %369, %366 ], [ %766, %771 ]
  %378 = phi i64 [ %371, %366 ], [ %491, %771 ]
  %379 = phi i64 [ %372, %366 ], [ %495, %771 ]
  %380 = phi i8* [ %373, %366 ], [ %493, %771 ]
  %381 = load %struct.tnfa_transition*, %struct.tnfa_transition** %83, align 8, !tbaa !35
  %382 = icmp eq %struct.tnfa_transition* %375, %381
  br i1 %382, label %383, label %427

383:                                              ; preds = %374
  %384 = icmp slt i64 %370, %379
  br i1 %384, label %414, label %385

385:                                              ; preds = %383
  %386 = icmp eq i64 %370, %379
  %387 = and i1 %84, %386
  br i1 %387, label %388, label %789

388:                                              ; preds = %385
  %389 = load i32, i32* %16, align 8, !tbaa !12
  %390 = load i32*, i32** %85, align 8, !tbaa !36
  %391 = icmp sgt i32 %389, 0
  br i1 %391, label %392, label %789

392:                                              ; preds = %388
  %393 = zext i32 %389 to i64
  br label %394

394:                                              ; preds = %411, %392
  %395 = phi i64 [ 0, %392 ], [ %412, %411 ]
  %396 = getelementptr inbounds i32, i32* %390, i64 %395
  %397 = load i32, i32* %396, align 4, !tbaa !37
  %398 = icmp eq i32 %397, 0
  %399 = getelementptr inbounds i64, i64* %56, i64 %395
  %400 = load i64, i64* %399, align 8, !tbaa !18
  %401 = getelementptr inbounds i64, i64* %28, i64 %395
  %402 = load i64, i64* %401, align 8, !tbaa !18
  br i1 %398, label %403, label %407

403:                                              ; preds = %394
  %404 = icmp slt i64 %400, %402
  br i1 %404, label %414, label %405

405:                                              ; preds = %403
  %406 = icmp sgt i64 %400, %402
  br i1 %406, label %784, label %411

407:                                              ; preds = %394
  %408 = icmp sgt i64 %400, %402
  br i1 %408, label %414, label %409

409:                                              ; preds = %407
  %410 = icmp slt i64 %400, %402
  br i1 %410, label %784, label %411

411:                                              ; preds = %409, %405
  %412 = add nuw nsw i64 %395, 1
  %413 = icmp eq i64 %412, %393
  br i1 %413, label %784, label %394

414:                                              ; preds = %407, %403, %383
  br i1 %79, label %789, label %415

415:                                              ; preds = %414
  %416 = load i32, i32* %16, align 8, !tbaa !12
  %417 = icmp sgt i32 %416, 0
  br i1 %417, label %418, label %789

418:                                              ; preds = %415
  %419 = zext i32 %416 to i64
  br label %420

420:                                              ; preds = %420, %418
  %421 = phi i64 [ 0, %418 ], [ %425, %420 ]
  %422 = getelementptr inbounds i64, i64* %56, i64 %421
  %423 = load i64, i64* %422, align 8, !tbaa !18
  %424 = getelementptr inbounds i64, i64* %28, i64 %421
  store i64 %423, i64* %424, align 8, !tbaa !18
  %425 = add nuw nsw i64 %421, 1
  %426 = icmp eq i64 %425, %419
  br i1 %426, label %789, label %420

427:                                              ; preds = %374
  %428 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %375, i64 0, i32 2
  %429 = load %struct.tnfa_transition*, %struct.tnfa_transition** %428, align 8, !tbaa !20
  %430 = icmp eq %struct.tnfa_transition* %429, null
  br i1 %430, label %478, label %431

431:                                              ; preds = %427
  %432 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %375, i64 0, i32 5
  %433 = load i32, i32* %432, align 8, !tbaa !22
  %434 = and i32 %433, 256
  %435 = icmp eq i32 %434, 0
  br i1 %435, label %478, label %436

436:                                              ; preds = %431
  %437 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %375, i64 0, i32 6
  %438 = bitcast %union.anon* %437 to i32*
  %439 = load i32, i32* %438, align 8, !tbaa !37
  %440 = add nsw i32 %439, 1
  %441 = sext i32 %440 to i64
  %442 = load i32, i32* %11, align 8, !tbaa !9
  %443 = and i32 %442, -9
  call fastcc void @tre_fill_pmatch(i64 noundef %441, %struct.regmatch_t* noundef %67, i32 noundef %443, %struct.tnfa* noundef nonnull %10, i64* noundef %56, i64 noundef %379) #5
  %444 = sext i32 %439 to i64
  %445 = getelementptr inbounds %struct.regmatch_t, %struct.regmatch_t* %67, i64 %444, i32 0
  %446 = load i64, i64* %445, align 8, !tbaa !38
  %447 = getelementptr inbounds %struct.regmatch_t, %struct.regmatch_t* %67, i64 %444, i32 1
  %448 = load i64, i64* %447, align 8, !tbaa !40
  %449 = sub nsw i64 %448, %446
  %450 = getelementptr inbounds i8, i8* %1, i64 %446
  %451 = getelementptr inbounds i8, i8* %380, i64 -1
  %452 = call i32 @strncmp(i8* noundef %450, i8* noundef nonnull %451, i64 noundef %449) #5
  %453 = icmp eq i32 %452, 0
  br i1 %453, label %454, label %785

454:                                              ; preds = %436
  %455 = icmp eq i64 %449, 0
  %456 = zext i1 %455 to i32
  %457 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %375, i64 0, i32 3
  %458 = load i32, i32* %457, align 8, !tbaa !32
  %459 = sext i32 %458 to i64
  br i1 %455, label %460, label %464

460:                                              ; preds = %454
  %461 = getelementptr inbounds i32, i32* %78, i64 %459
  %462 = load i32, i32* %461, align 4, !tbaa !14
  %463 = icmp eq i32 %462, 0
  br i1 %463, label %464, label %785

464:                                              ; preds = %460, %454
  %465 = getelementptr inbounds i32, i32* %78, i64 %459
  store i32 %456, i32* %465, align 4, !tbaa !14
  %466 = add nsw i64 %449, -1
  %467 = getelementptr inbounds i8, i8* %380, i64 %466
  %468 = add nsw i64 %466, %379
  %469 = load i32, i32* %7, align 4, !tbaa !14
  %470 = call i32 @mbtowc(i32* noundef nonnull %7, i8* noundef %467, i64 noundef 4) #5
  %471 = sext i32 %470 to i64
  %472 = icmp slt i32 %470, 1
  br i1 %472, label %473, label %475

473:                                              ; preds = %464
  %474 = icmp slt i32 %470, 0
  br i1 %474, label %839, label %475

475:                                              ; preds = %473, %464
  %476 = phi i64 [ %471, %464 ], [ 1, %473 ]
  %477 = getelementptr inbounds i8, i8* %467, i64 %476
  br label %490

478:                                              ; preds = %431, %427
  %479 = load i32, i32* %7, align 4, !tbaa !14
  %480 = icmp eq i32 %479, 0
  br i1 %480, label %785, label %481

481:                                              ; preds = %478
  %482 = call i32 @mbtowc(i32* noundef nonnull %7, i8* noundef %380, i64 noundef 4) #5
  %483 = sext i32 %482 to i64
  %484 = icmp slt i32 %482, 1
  br i1 %484, label %485, label %487

485:                                              ; preds = %481
  %486 = icmp slt i32 %482, 0
  br i1 %486, label %839, label %487

487:                                              ; preds = %485, %481
  %488 = phi i64 [ %483, %481 ], [ 1, %485 ]
  %489 = getelementptr inbounds i8, i8* %380, i64 %488
  br label %490

490:                                              ; preds = %487, %475
  %491 = phi i64 [ %488, %487 ], [ %476, %475 ]
  %492 = phi i64 [ %379, %487 ], [ %468, %475 ]
  %493 = phi i8* [ %489, %487 ], [ %477, %475 ]
  %494 = phi i32 [ %479, %487 ], [ %469, %475 ]
  %495 = add nsw i64 %492, %378
  %496 = load %struct.tnfa_transition*, %struct.tnfa_transition** %428, align 8, !tbaa !20
  %497 = icmp eq %struct.tnfa_transition* %496, null
  br i1 %497, label %764, label %498

498:                                              ; preds = %490
  %499 = icmp slt i64 %495, 1
  %500 = icmp eq i32 %494, 10
  %501 = select i1 %500, i1 %82, i1 false
  %502 = icmp eq i32 %494, 95
  %503 = icmp ne i64 %495, 0
  %504 = icmp eq i64 %495, 0
  %505 = and i1 %81, %499
  br label %506

506:                                              ; preds = %756, %498
  %507 = phi %struct.tnfa_transition** [ %428, %498 ], [ %761, %756 ]
  %508 = phi %struct.tnfa_transition* [ null, %498 ], [ %759, %756 ]
  %509 = phi %struct.tnfa_transition* [ %375, %498 ], [ %760, %756 ]
  %510 = phi %struct.tre_backtrack_struct* [ %377, %498 ], [ %758, %756 ]
  %511 = phi i32* [ %376, %498 ], [ %757, %756 ]
  %512 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %509, i64 0, i32 0
  %513 = load i32, i32* %512, align 8, !tbaa !41
  %514 = icmp ugt i32 %513, %494
  br i1 %514, label %756, label %515

515:                                              ; preds = %506
  %516 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %509, i64 0, i32 1
  %517 = load i32, i32* %516, align 4, !tbaa !42
  %518 = icmp ult i32 %517, %494
  br i1 %518, label %756, label %519

519:                                              ; preds = %515
  %520 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %509, i64 0, i32 5
  %521 = load i32, i32* %520, align 8, !tbaa !22
  %522 = icmp eq i32 %521, 0
  br i1 %522, label %662, label %523

523:                                              ; preds = %519
  %524 = and i32 %521, 1
  %525 = icmp eq i32 %524, 0
  %526 = select i1 %525, i1 true, i1 %505
  %527 = select i1 %526, i1 true, i1 %501
  br i1 %527, label %528, label %756

528:                                              ; preds = %523
  %529 = and i32 %521, 2
  %530 = icmp eq i32 %529, 0
  br i1 %530, label %538, label %531

531:                                              ; preds = %528
  %532 = load i32, i32* %7, align 4, !tbaa !14
  %533 = or i32 %532, %35
  %534 = icmp eq i32 %533, 0
  br i1 %534, label %538, label %535

535:                                              ; preds = %531
  %536 = icmp eq i32 %532, 10
  %537 = select i1 %536, i1 %82, i1 false
  br i1 %537, label %538, label %756

538:                                              ; preds = %535, %531, %528
  %539 = and i32 %521, 16
  %540 = icmp eq i32 %539, 0
  br i1 %540, label %551, label %541

541:                                              ; preds = %538
  br i1 %502, label %756, label %542

542:                                              ; preds = %541
  %543 = call i32 @iswalnum(i32 noundef %494) #5
  %544 = icmp eq i32 %543, 0
  br i1 %544, label %545, label %756

545:                                              ; preds = %542
  %546 = load i32, i32* %7, align 4, !tbaa !14
  %547 = icmp eq i32 %546, 95
  br i1 %547, label %551, label %548

548:                                              ; preds = %545
  %549 = call i32 @iswalnum(i32 noundef %546) #5
  %550 = icmp eq i32 %549, 0
  br i1 %550, label %756, label %551

551:                                              ; preds = %548, %545, %538
  %552 = load i32, i32* %520, align 8, !tbaa !22
  %553 = and i32 %552, 32
  %554 = icmp eq i32 %553, 0
  br i1 %554, label %571, label %555

555:                                              ; preds = %551
  br i1 %502, label %562, label %556

556:                                              ; preds = %555
  %557 = call i32 @iswalnum(i32 noundef %494) #5
  %558 = icmp eq i32 %557, 0
  %559 = load i32, i32* %7, align 4
  %560 = icmp eq i32 %559, 95
  %561 = select i1 %558, i1 true, i1 %560
  br i1 %561, label %756, label %565

562:                                              ; preds = %555
  %563 = load i32, i32* %7, align 4, !tbaa !14
  %564 = icmp eq i32 %563, 95
  br i1 %564, label %756, label %565

565:                                              ; preds = %562, %556
  %566 = phi i32 [ %559, %556 ], [ %563, %562 ]
  %567 = call i32 @iswalnum(i32 noundef %566) #5
  %568 = icmp eq i32 %567, 0
  br i1 %568, label %569, label %756

569:                                              ; preds = %565
  %570 = load i32, i32* %520, align 8, !tbaa !22
  br label %571

571:                                              ; preds = %569, %551
  %572 = phi i32 [ %570, %569 ], [ %552, %551 ]
  %573 = and i32 %572, 64
  %574 = icmp ne i32 %573, 0
  %575 = select i1 %574, i1 %503, i1 false
  %576 = load i32, i32* %7, align 4
  %577 = icmp ne i32 %576, 0
  %578 = select i1 %575, i1 %577, i1 false
  br i1 %578, label %579, label %595

579:                                              ; preds = %571
  br i1 %502, label %585, label %580

580:                                              ; preds = %579
  %581 = call i32 @iswalnum(i32 noundef %494) #5
  %582 = icmp ne i32 %581, 0
  %583 = load i32, i32* %7, align 4, !tbaa !14
  %584 = icmp eq i32 %583, 95
  br i1 %584, label %590, label %591

585:                                              ; preds = %579
  %586 = icmp eq i32 %576, 95
  br i1 %586, label %756, label %587

587:                                              ; preds = %585
  %588 = call i32 @iswalnum(i32 noundef %576) #5
  %589 = icmp eq i32 %588, 0
  br i1 %589, label %595, label %756

590:                                              ; preds = %580
  br i1 %582, label %756, label %595

591:                                              ; preds = %580
  %592 = call i32 @iswalnum(i32 noundef %583) #5
  %593 = icmp ne i32 %592, 0
  %594 = xor i1 %582, %593
  br i1 %594, label %595, label %756

595:                                              ; preds = %591, %590, %587, %571
  %596 = load i32, i32* %520, align 8, !tbaa !22
  %597 = and i32 %596, 128
  %598 = icmp eq i32 %597, 0
  br i1 %598, label %619, label %599

599:                                              ; preds = %595
  %600 = load i32, i32* %7, align 4
  %601 = icmp eq i32 %600, 0
  %602 = select i1 %504, i1 true, i1 %601
  br i1 %602, label %756, label %603

603:                                              ; preds = %599
  br i1 %502, label %609, label %604

604:                                              ; preds = %603
  %605 = call i32 @iswalnum(i32 noundef %494) #5
  %606 = icmp ne i32 %605, 0
  %607 = load i32, i32* %7, align 4, !tbaa !14
  %608 = icmp eq i32 %607, 95
  br i1 %608, label %614, label %615

609:                                              ; preds = %603
  %610 = icmp eq i32 %600, 95
  br i1 %610, label %619, label %611

611:                                              ; preds = %609
  %612 = call i32 @iswalnum(i32 noundef %600) #5
  %613 = icmp eq i32 %612, 0
  br i1 %613, label %756, label %619

614:                                              ; preds = %604
  br i1 %606, label %619, label %756

615:                                              ; preds = %604
  %616 = call i32 @iswalnum(i32 noundef %607) #5
  %617 = icmp ne i32 %616, 0
  %618 = xor i1 %606, %617
  br i1 %618, label %756, label %619

619:                                              ; preds = %615, %614, %611, %609, %595
  %620 = load i32, i32* %520, align 8, !tbaa !22
  %621 = and i32 %620, 4
  %622 = icmp eq i32 %621, 0
  br i1 %622, label %651, label %623

623:                                              ; preds = %619
  %624 = load i32, i32* %11, align 8, !tbaa !9
  %625 = and i32 %624, 2
  %626 = icmp eq i32 %625, 0
  br i1 %626, label %627, label %640

627:                                              ; preds = %623
  %628 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %509, i64 0, i32 6, i32 0
  %629 = load i64, i64* %628, align 8, !tbaa !37
  %630 = call i32 @iswctype(i32 noundef %494, i64 noundef %629) #5
  %631 = icmp eq i32 %630, 0
  br i1 %631, label %756, label %632

632:                                              ; preds = %627
  %633 = load i32, i32* %520, align 8, !tbaa !22
  %634 = and i32 %633, 4
  %635 = icmp eq i32 %634, 0
  br i1 %635, label %651, label %636

636:                                              ; preds = %632
  %637 = load i32, i32* %11, align 8, !tbaa !9
  %638 = and i32 %637, 2
  %639 = icmp eq i32 %638, 0
  br i1 %639, label %651, label %640

640:                                              ; preds = %623, %636
  %641 = call i32 @towlower(i32 noundef %494) #5
  %642 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %509, i64 0, i32 6, i32 0
  %643 = load i64, i64* %642, align 8, !tbaa !37
  %644 = call i32 @iswctype(i32 noundef %641, i64 noundef %643) #5
  %645 = icmp eq i32 %644, 0
  br i1 %645, label %646, label %651

646:                                              ; preds = %640
  %647 = call i32 @towupper(i32 noundef %494) #5
  %648 = load i64, i64* %642, align 8, !tbaa !37
  %649 = call i32 @iswctype(i32 noundef %647, i64 noundef %648) #5
  %650 = icmp eq i32 %649, 0
  br i1 %650, label %756, label %651

651:                                              ; preds = %646, %640, %636, %632, %619
  %652 = load i32, i32* %520, align 8, !tbaa !22
  %653 = and i32 %652, 8
  %654 = icmp eq i32 %653, 0
  br i1 %654, label %662, label %655

655:                                              ; preds = %651
  %656 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %509, i64 0, i32 7
  %657 = load i64*, i64** %656, align 8, !tbaa !43
  %658 = load i32, i32* %11, align 8, !tbaa !9
  %659 = and i32 %658, 2
  %660 = call fastcc i32 @tre_neg_char_classes_match(i64* noundef %657, i32 noundef %494, i32 noundef %659) #5
  %661 = icmp eq i32 %660, 0
  br i1 %661, label %662, label %756

662:                                              ; preds = %655, %651, %519
  %663 = icmp eq %struct.tnfa_transition* %508, null
  br i1 %663, label %664, label %668

664:                                              ; preds = %662
  %665 = load %struct.tnfa_transition*, %struct.tnfa_transition** %507, align 8, !tbaa !20
  %666 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %509, i64 0, i32 4
  %667 = load i32*, i32** %666, align 8, !tbaa !23
  br label %756

668:                                              ; preds = %662
  %669 = getelementptr inbounds %struct.tre_backtrack_struct, %struct.tre_backtrack_struct* %510, i64 0, i32 2
  %670 = load %struct.tre_backtrack_struct*, %struct.tre_backtrack_struct** %669, align 8, !tbaa !24
  %671 = icmp eq %struct.tre_backtrack_struct* %670, null
  br i1 %671, label %672, label %714

672:                                              ; preds = %668
  %673 = call i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef nonnull %38, i32 noundef 0, i8* noundef null, i32 noundef 0, i64 noundef 56) #5
  %674 = bitcast i8* %673 to %struct.tre_backtrack_struct*
  %675 = icmp eq i8* %673, null
  br i1 %675, label %676, label %688

676:                                              ; preds = %672
  call void @__tre_mem_destroy(%struct.tre_mem_struct* noundef nonnull %38) #5
  %677 = icmp eq i64* %56, null
  br i1 %677, label %680, label %678

678:                                              ; preds = %676
  %679 = bitcast i64* %56 to i8*
  call void @free(i8* noundef nonnull %679) #5
  br label %680

680:                                              ; preds = %678, %676
  %681 = icmp eq %struct.regmatch_t* %67, null
  br i1 %681, label %684, label %682

682:                                              ; preds = %680
  %683 = bitcast %struct.regmatch_t* %67 to i8*
  call void @free(i8* noundef nonnull %683) #5
  br label %684

684:                                              ; preds = %682, %680
  %685 = icmp eq i32* %78, null
  br i1 %685, label %855, label %686

686:                                              ; preds = %684
  %687 = bitcast i32* %78 to i8*
  call void @free(i8* noundef nonnull %687) #5
  br label %855

688:                                              ; preds = %672
  %689 = getelementptr inbounds i8, i8* %673, i64 40
  %690 = bitcast i8* %689 to %struct.tre_backtrack_struct**
  store %struct.tre_backtrack_struct* %510, %struct.tre_backtrack_struct** %690, align 8, !tbaa !27
  %691 = getelementptr inbounds i8, i8* %673, i64 48
  %692 = bitcast i8* %691 to %struct.tre_backtrack_struct**
  store %struct.tre_backtrack_struct* null, %struct.tre_backtrack_struct** %692, align 8, !tbaa !24
  %693 = load i32, i32* %16, align 8, !tbaa !12
  %694 = sext i32 %693 to i64
  %695 = shl nsw i64 %694, 3
  %696 = call i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef nonnull %38, i32 noundef 0, i8* noundef null, i32 noundef 0, i64 noundef %695) #5
  %697 = getelementptr inbounds i8, i8* %673, i64 32
  %698 = bitcast i8* %697 to i8**
  store i8* %696, i8** %698, align 8, !tbaa !28
  %699 = icmp eq i8* %696, null
  br i1 %699, label %700, label %712

700:                                              ; preds = %688
  call void @__tre_mem_destroy(%struct.tre_mem_struct* noundef nonnull %38) #5
  %701 = icmp eq i64* %56, null
  br i1 %701, label %704, label %702

702:                                              ; preds = %700
  %703 = bitcast i64* %56 to i8*
  call void @free(i8* noundef nonnull %703) #5
  br label %704

704:                                              ; preds = %702, %700
  %705 = icmp eq %struct.regmatch_t* %67, null
  br i1 %705, label %708, label %706

706:                                              ; preds = %704
  %707 = bitcast %struct.regmatch_t* %67 to i8*
  call void @free(i8* noundef nonnull %707) #5
  br label %708

708:                                              ; preds = %706, %704
  %709 = icmp eq i32* %78, null
  br i1 %709, label %855, label %710

710:                                              ; preds = %708
  %711 = bitcast i32* %78 to i8*
  call void @free(i8* noundef nonnull %711) #5
  br label %855

712:                                              ; preds = %688
  %713 = bitcast %struct.tre_backtrack_struct** %669 to i8**
  store i8* %673, i8** %713, align 8, !tbaa !24
  br label %714

714:                                              ; preds = %712, %668
  %715 = phi %struct.tre_backtrack_struct* [ %674, %712 ], [ %670, %668 ]
  %716 = getelementptr inbounds %struct.tre_backtrack_struct, %struct.tre_backtrack_struct* %715, i64 0, i32 0, i32 0
  store i64 %495, i64* %716, align 8, !tbaa !29
  %717 = getelementptr inbounds %struct.tre_backtrack_struct, %struct.tre_backtrack_struct* %715, i64 0, i32 0, i32 1
  store i8* %493, i8** %717, align 8, !tbaa !30
  %718 = load %struct.tnfa_transition*, %struct.tnfa_transition** %507, align 8, !tbaa !20
  %719 = getelementptr inbounds %struct.tre_backtrack_struct, %struct.tre_backtrack_struct* %715, i64 0, i32 0, i32 2
  store %struct.tnfa_transition* %718, %struct.tnfa_transition** %719, align 8, !tbaa !31
  %720 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %509, i64 0, i32 3
  %721 = load i32, i32* %720, align 8, !tbaa !32
  %722 = getelementptr inbounds %struct.tre_backtrack_struct, %struct.tre_backtrack_struct* %715, i64 0, i32 0, i32 3
  store i32 %721, i32* %722, align 8, !tbaa !33
  %723 = load i32, i32* %7, align 4, !tbaa !14
  %724 = getelementptr inbounds %struct.tre_backtrack_struct, %struct.tre_backtrack_struct* %715, i64 0, i32 0, i32 4
  store i32 %723, i32* %724, align 4, !tbaa !34
  %725 = load i32, i32* %16, align 8, !tbaa !12
  %726 = icmp sgt i32 %725, 0
  br i1 %726, label %727, label %738

727:                                              ; preds = %714
  %728 = getelementptr inbounds %struct.tre_backtrack_struct, %struct.tre_backtrack_struct* %715, i64 0, i32 0, i32 5
  %729 = load i64*, i64** %728, align 8, !tbaa !28
  %730 = zext i32 %725 to i64
  br label %731

731:                                              ; preds = %731, %727
  %732 = phi i64 [ 0, %727 ], [ %736, %731 ]
  %733 = getelementptr inbounds i64, i64* %56, i64 %732
  %734 = load i64, i64* %733, align 8, !tbaa !18
  %735 = getelementptr inbounds i64, i64* %729, i64 %732
  store i64 %734, i64* %735, align 8, !tbaa !18
  %736 = add nuw nsw i64 %732, 1
  %737 = icmp eq i64 %736, %730
  br i1 %737, label %738, label %731

738:                                              ; preds = %731, %714
  %739 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %509, i64 0, i32 4
  %740 = load i32*, i32** %739, align 8, !tbaa !23
  %741 = icmp eq i32* %740, null
  br i1 %741, label %756, label %742

742:                                              ; preds = %738
  %743 = load i32, i32* %740, align 4, !tbaa !14
  %744 = icmp sgt i32 %743, -1
  br i1 %744, label %745, label %756

745:                                              ; preds = %742
  %746 = getelementptr inbounds %struct.tre_backtrack_struct, %struct.tre_backtrack_struct* %715, i64 0, i32 0, i32 5
  %747 = load i64*, i64** %746, align 8, !tbaa !28
  br label %748

748:                                              ; preds = %745, %748
  %749 = phi i32 [ %743, %745 ], [ %754, %748 ]
  %750 = phi i32* [ %740, %745 ], [ %753, %748 ]
  %751 = zext i32 %749 to i64
  %752 = getelementptr inbounds i64, i64* %747, i64 %751
  store i64 %495, i64* %752, align 8, !tbaa !18
  %753 = getelementptr inbounds i32, i32* %750, i64 1
  %754 = load i32, i32* %753, align 4, !tbaa !14
  %755 = icmp sgt i32 %754, -1
  br i1 %755, label %748, label %756

756:                                              ; preds = %748, %742, %738, %664, %655, %646, %627, %615, %614, %611, %599, %591, %590, %587, %585, %565, %562, %556, %548, %542, %541, %535, %523, %515, %506
  %757 = phi i32* [ %511, %541 ], [ %511, %542 ], [ %511, %562 ], [ %511, %565 ], [ %511, %591 ], [ %511, %599 ], [ %511, %615 ], [ %511, %655 ], [ %667, %664 ], [ %511, %646 ], [ %511, %627 ], [ %511, %556 ], [ %511, %548 ], [ %511, %535 ], [ %511, %515 ], [ %511, %506 ], [ %511, %590 ], [ %511, %614 ], [ %511, %523 ], [ %511, %738 ], [ %511, %587 ], [ %511, %611 ], [ %511, %585 ], [ %511, %742 ], [ %511, %748 ]
  %758 = phi %struct.tre_backtrack_struct* [ %510, %541 ], [ %510, %542 ], [ %510, %562 ], [ %510, %565 ], [ %510, %591 ], [ %510, %599 ], [ %510, %615 ], [ %510, %655 ], [ %510, %664 ], [ %510, %646 ], [ %510, %627 ], [ %510, %556 ], [ %510, %548 ], [ %510, %535 ], [ %510, %515 ], [ %510, %506 ], [ %510, %590 ], [ %510, %614 ], [ %510, %523 ], [ %715, %738 ], [ %510, %587 ], [ %510, %611 ], [ %510, %585 ], [ %715, %742 ], [ %715, %748 ]
  %759 = phi %struct.tnfa_transition* [ %508, %541 ], [ %508, %542 ], [ %508, %562 ], [ %508, %565 ], [ %508, %591 ], [ %508, %599 ], [ %508, %615 ], [ %508, %655 ], [ %665, %664 ], [ %508, %646 ], [ %508, %627 ], [ %508, %556 ], [ %508, %548 ], [ %508, %535 ], [ %508, %515 ], [ %508, %506 ], [ %508, %590 ], [ %508, %614 ], [ %508, %523 ], [ %508, %738 ], [ %508, %587 ], [ %508, %611 ], [ %508, %585 ], [ %508, %742 ], [ %508, %748 ]
  %760 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %509, i64 1
  %761 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %509, i64 1, i32 2
  %762 = load %struct.tnfa_transition*, %struct.tnfa_transition** %761, align 8, !tbaa !20
  %763 = icmp eq %struct.tnfa_transition* %762, null
  br i1 %763, label %764, label %506

764:                                              ; preds = %756, %490
  %765 = phi i32* [ %376, %490 ], [ %757, %756 ]
  %766 = phi %struct.tre_backtrack_struct* [ %377, %490 ], [ %758, %756 ]
  %767 = phi %struct.tnfa_transition* [ null, %490 ], [ %759, %756 ]
  %768 = icmp eq %struct.tnfa_transition* %767, null
  br i1 %768, label %785, label %769

769:                                              ; preds = %764
  %770 = icmp eq i32* %765, null
  br i1 %770, label %771, label %773

771:                                              ; preds = %776, %769, %773
  %772 = phi i32* [ %765, %773 ], [ null, %769 ], [ %779, %776 ]
  br label %374

773:                                              ; preds = %769
  %774 = load i32, i32* %765, align 4, !tbaa !14
  %775 = icmp sgt i32 %774, -1
  br i1 %775, label %776, label %771

776:                                              ; preds = %773, %776
  %777 = phi i32 [ %782, %776 ], [ %774, %773 ]
  %778 = phi i32* [ %779, %776 ], [ %765, %773 ]
  %779 = getelementptr inbounds i32, i32* %778, i64 1
  %780 = zext i32 %777 to i64
  %781 = getelementptr inbounds i64, i64* %56, i64 %780
  store i64 %495, i64* %781, align 8, !tbaa !18
  %782 = load i32, i32* %779, align 4, !tbaa !14
  %783 = icmp sgt i32 %782, -1
  br i1 %783, label %776, label %771

784:                                              ; preds = %411, %409, %405
  br label %789

785:                                              ; preds = %478, %764, %460, %436
  %786 = phi i32* [ %376, %436 ], [ %376, %460 ], [ %376, %478 ], [ %765, %764 ]
  %787 = phi %struct.tre_backtrack_struct* [ %377, %436 ], [ %377, %460 ], [ %377, %478 ], [ %766, %764 ]
  %788 = phi i64 [ %378, %436 ], [ %378, %460 ], [ %378, %478 ], [ %491, %764 ]
  br label %789

789:                                              ; preds = %420, %785, %784, %385, %388, %414, %415, %361
  %790 = phi i32* [ %364, %361 ], [ %376, %415 ], [ %376, %414 ], [ %376, %388 ], [ %376, %385 ], [ %376, %784 ], [ %786, %785 ], [ %376, %420 ]
  %791 = phi %struct.tre_backtrack_struct* [ %362, %361 ], [ %377, %415 ], [ %377, %414 ], [ %377, %388 ], [ %377, %385 ], [ %377, %784 ], [ %787, %785 ], [ %377, %420 ]
  %792 = phi i64 [ %89, %361 ], [ %379, %415 ], [ %379, %414 ], [ %370, %388 ], [ %370, %385 ], [ %370, %784 ], [ %370, %785 ], [ %379, %420 ]
  %793 = phi i64 [ %126, %361 ], [ %378, %415 ], [ %378, %414 ], [ %378, %388 ], [ %378, %385 ], [ %378, %784 ], [ %788, %785 ], [ %378, %420 ]
  %794 = getelementptr inbounds %struct.tre_backtrack_struct, %struct.tre_backtrack_struct* %791, i64 0, i32 1
  %795 = load %struct.tre_backtrack_struct*, %struct.tre_backtrack_struct** %794, align 8, !tbaa !27
  %796 = icmp eq %struct.tre_backtrack_struct* %795, null
  br i1 %796, label %829, label %797

797:                                              ; preds = %789
  %798 = getelementptr inbounds %struct.tre_backtrack_struct, %struct.tre_backtrack_struct* %791, i64 0, i32 0, i32 2
  %799 = load %struct.tnfa_transition*, %struct.tnfa_transition** %798, align 8, !tbaa !31
  %800 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %799, i64 0, i32 5
  %801 = load i32, i32* %800, align 8, !tbaa !22
  %802 = and i32 %801, 256
  %803 = icmp eq i32 %802, 0
  br i1 %803, label %809, label %804

804:                                              ; preds = %797
  %805 = getelementptr inbounds %struct.tre_backtrack_struct, %struct.tre_backtrack_struct* %791, i64 0, i32 0, i32 3
  %806 = load i32, i32* %805, align 8, !tbaa !33
  %807 = sext i32 %806 to i64
  %808 = getelementptr inbounds i32, i32* %78, i64 %807
  store i32 0, i32* %808, align 4, !tbaa !14
  br label %809

809:                                              ; preds = %804, %797
  %810 = getelementptr inbounds %struct.tre_backtrack_struct, %struct.tre_backtrack_struct* %791, i64 0, i32 0, i32 0
  %811 = load i64, i64* %810, align 8, !tbaa !29
  %812 = getelementptr inbounds %struct.tre_backtrack_struct, %struct.tre_backtrack_struct* %791, i64 0, i32 0, i32 1
  %813 = load i8*, i8** %812, align 8, !tbaa !30
  %814 = getelementptr inbounds %struct.tre_backtrack_struct, %struct.tre_backtrack_struct* %791, i64 0, i32 0, i32 4
  %815 = load i32, i32* %814, align 4, !tbaa !34
  store i32 %815, i32* %7, align 4, !tbaa !14
  %816 = load i32, i32* %16, align 8, !tbaa !12
  %817 = icmp sgt i32 %816, 0
  br i1 %817, label %818, label %366

818:                                              ; preds = %809
  %819 = getelementptr inbounds %struct.tre_backtrack_struct, %struct.tre_backtrack_struct* %791, i64 0, i32 0, i32 5
  %820 = load i64*, i64** %819, align 8, !tbaa !28
  %821 = zext i32 %816 to i64
  br label %822

822:                                              ; preds = %822, %818
  %823 = phi i64 [ 0, %818 ], [ %827, %822 ]
  %824 = getelementptr inbounds i64, i64* %820, i64 %823
  %825 = load i64, i64* %824, align 8, !tbaa !18
  %826 = getelementptr inbounds i64, i64* %56, i64 %823
  store i64 %825, i64* %826, align 8, !tbaa !18
  %827 = add nuw nsw i64 %823, 1
  %828 = icmp eq i64 %827, %821
  br i1 %828, label %366, label %822

829:                                              ; preds = %789
  %830 = icmp sgt i64 %792, -1
  %831 = load i32, i32* %7, align 4
  %832 = icmp eq i32 %831, 0
  %833 = select i1 %830, i1 true, i1 %832
  br i1 %833, label %835, label %834

834:                                              ; preds = %829
  store i32 %128, i32* %7, align 4, !tbaa !14
  br label %86

835:                                              ; preds = %829
  %836 = xor i1 %830, true
  %837 = zext i1 %836 to i32
  br label %839

838:                                              ; preds = %49, %40
  tail call void @__tre_mem_destroy(%struct.tre_mem_struct* noundef nonnull %38) #5
  br label %855

839:                                              ; preds = %123, %485, %473, %835, %71, %60
  %840 = phi i64 [ %792, %835 ], [ undef, %71 ], [ undef, %60 ], [ undef, %473 ], [ undef, %485 ], [ undef, %123 ]
  %841 = phi i32* [ %78, %835 ], [ null, %71 ], [ null, %60 ], [ %78, %473 ], [ %78, %485 ], [ %78, %123 ]
  %842 = phi %struct.regmatch_t* [ %67, %835 ], [ %67, %71 ], [ null, %60 ], [ %67, %473 ], [ %67, %485 ], [ %67, %123 ]
  %843 = phi i32 [ %837, %835 ], [ 12, %71 ], [ 12, %60 ], [ 1, %473 ], [ 1, %485 ], [ 1, %123 ]
  call void @__tre_mem_destroy(%struct.tre_mem_struct* noundef nonnull %38) #5
  %844 = icmp eq i64* %56, null
  br i1 %844, label %847, label %845

845:                                              ; preds = %839
  %846 = bitcast i64* %56 to i8*
  call void @free(i8* noundef nonnull %846) #5
  br label %847

847:                                              ; preds = %845, %839
  %848 = icmp eq %struct.regmatch_t* %842, null
  br i1 %848, label %851, label %849

849:                                              ; preds = %847
  %850 = bitcast %struct.regmatch_t* %842 to i8*
  call void @free(i8* noundef nonnull %850) #5
  br label %851

851:                                              ; preds = %849, %847
  %852 = icmp eq i32* %841, null
  br i1 %852, label %855, label %853

853:                                              ; preds = %851
  %854 = bitcast i32* %841 to i8*
  call void @free(i8* noundef nonnull %854) #5
  br label %855

855:                                              ; preds = %32, %268, %270, %292, %294, %684, %686, %708, %710, %838, %851, %853
  %856 = phi i64 [ undef, %32 ], [ undef, %838 ], [ %840, %851 ], [ %840, %853 ], [ undef, %684 ], [ undef, %686 ], [ undef, %708 ], [ undef, %710 ], [ undef, %268 ], [ undef, %270 ], [ undef, %292 ], [ undef, %294 ]
  %857 = phi i32 [ 12, %32 ], [ 12, %838 ], [ %843, %851 ], [ %843, %853 ], [ 12, %684 ], [ 12, %686 ], [ 12, %708 ], [ 12, %710 ], [ 12, %268 ], [ 12, %270 ], [ 12, %292 ], [ 12, %294 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %33) #6
  br label %1581

858:                                              ; preds = %27
  %859 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %859) #6
  store i32 0, i32* %6, align 4, !tbaa !14
  %860 = and i32 %4, 1
  %861 = and i32 %4, 2
  %862 = load i32, i32* %11, align 8, !tbaa !9
  %863 = and i32 %862, 4
  %864 = icmp eq i64* %28, null
  br i1 %864, label %867, label %865

865:                                              ; preds = %858
  %866 = load i32, i32* %16, align 8, !tbaa !12
  br label %867

867:                                              ; preds = %865, %858
  %868 = phi i32 [ %866, %865 ], [ 0, %858 ]
  %869 = sext i32 %868 to i64
  %870 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %10, i64 0, i32 13
  %871 = load i32, i32* %870, align 4, !tbaa !17
  %872 = sext i32 %871 to i64
  %873 = shl nsw i64 %872, 6
  %874 = tail call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %873, i64 %869) #7
  %875 = extractvalue { i64, i1 } %874, 1
  %876 = icmp slt i32 %871, 0
  %877 = select i1 %875, i1 true, i1 %876
  br i1 %877, label %1578, label %878

878:                                              ; preds = %867
  %879 = add nuw nsw i32 %871, 1
  %880 = zext i32 %879 to i64
  %881 = shl nsw i64 %869, 3
  %882 = shl nuw nsw i64 %880, 4
  %883 = shl nsw i64 %872, 4
  %884 = mul i64 %881, %872
  %885 = add i64 %882, %884
  %886 = shl i64 %885, 1
  %887 = add nsw i64 %881, 28
  %888 = add nsw i64 %887, %883
  %889 = add i64 %888, %886
  %890 = tail call i8* @calloc(i64 noundef %889, i64 noundef 1) #5
  %891 = icmp eq i8* %890, null
  br i1 %891, label %1578, label %892

892:                                              ; preds = %878
  %893 = bitcast i8* %890 to i64*
  %894 = getelementptr inbounds i8, i8* %890, i64 %881
  %895 = ptrtoint i8* %894 to i64
  %896 = and i64 %895, 7
  %897 = icmp eq i64 %896, 0
  %898 = sub nuw nsw i64 8, %896
  %899 = select i1 %897, i64 0, i64 %898
  %900 = getelementptr inbounds i8, i8* %894, i64 %899
  %901 = bitcast i8* %900 to %struct.tre_tnfa_reach_t*
  %902 = getelementptr inbounds i8, i8* %900, i64 %882
  %903 = ptrtoint i8* %902 to i64
  %904 = and i64 %903, 7
  %905 = icmp eq i64 %904, 0
  %906 = sub nuw nsw i64 8, %904
  %907 = select i1 %905, i64 0, i64 %906
  %908 = getelementptr inbounds i8, i8* %902, i64 %907
  %909 = bitcast i8* %908 to %struct.tre_tnfa_reach_t*
  %910 = getelementptr inbounds i8, i8* %908, i64 %882
  %911 = ptrtoint i8* %910 to i64
  %912 = and i64 %911, 7
  %913 = icmp eq i64 %912, 0
  %914 = sub nuw nsw i64 8, %912
  %915 = select i1 %913, i64 0, i64 %914
  %916 = getelementptr inbounds i8, i8* %910, i64 %915
  %917 = bitcast i8* %916 to %struct.tre_reach_pos_t*
  %918 = getelementptr inbounds i8, i8* %916, i64 %883
  %919 = ptrtoint i8* %918 to i64
  %920 = and i64 %919, 7
  %921 = load i32, i32* %870, align 4, !tbaa !17
  %922 = icmp sgt i32 %921, 0
  br i1 %922, label %923, label %945

923:                                              ; preds = %892
  %924 = icmp eq i64 %920, 0
  %925 = sub nuw nsw i64 8, %920
  %926 = select i1 %924, i64 0, i64 %925
  %927 = getelementptr inbounds i8, i8* %918, i64 %926
  %928 = zext i32 %921 to i64
  br label %929

929:                                              ; preds = %929, %923
  %930 = phi i64 [ 0, %923 ], [ %938, %929 ]
  %931 = phi i8* [ %927, %923 ], [ %937, %929 ]
  %932 = getelementptr inbounds %struct.tre_tnfa_reach_t, %struct.tre_tnfa_reach_t* %909, i64 %930, i32 1
  %933 = bitcast i64** %932 to i8**
  store i8* %931, i8** %933, align 8, !tbaa !44
  %934 = getelementptr inbounds i8, i8* %931, i64 %881
  %935 = getelementptr inbounds %struct.tre_tnfa_reach_t, %struct.tre_tnfa_reach_t* %901, i64 %930, i32 1
  %936 = bitcast i64** %935 to i8**
  store i8* %934, i8** %936, align 8, !tbaa !44
  %937 = getelementptr inbounds i8, i8* %934, i64 %881
  %938 = add nuw nsw i64 %930, 1
  %939 = icmp eq i64 %938, %928
  br i1 %939, label %940, label %929

940:                                              ; preds = %929, %940
  %941 = phi i64 [ %943, %940 ], [ 0, %929 ]
  %942 = getelementptr inbounds %struct.tre_reach_pos_t, %struct.tre_reach_pos_t* %917, i64 %941, i32 0
  store i64 -1, i64* %942, align 8, !tbaa !46
  %943 = add nuw nsw i64 %941, 1
  %944 = icmp eq i64 %943, %928
  br i1 %944, label %945, label %940

945:                                              ; preds = %940, %892
  %946 = call i32 @mbtowc(i32* noundef nonnull %6, i8* noundef %1, i64 noundef 4) #5
  %947 = sext i32 %946 to i64
  %948 = icmp slt i32 %946, 1
  br i1 %948, label %949, label %951

949:                                              ; preds = %945
  %950 = icmp slt i32 %946, 0
  br i1 %950, label %1575, label %951

951:                                              ; preds = %949, %945
  %952 = phi i64 [ %947, %945 ], [ 1, %949 ]
  %953 = getelementptr inbounds i8, i8* %1, i64 %952
  %954 = icmp eq i32 %868, 0
  %955 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %10, i64 0, i32 2
  %956 = icmp eq i32 %860, 0
  %957 = icmp ne i32 %863, 0
  %958 = icmp sgt i32 %868, 0
  %959 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %10, i64 0, i32 3
  %960 = icmp slt i32 %868, 1
  %961 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %10, i64 0, i32 11
  %962 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %10, i64 0, i32 9
  %963 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %10, i64 0, i32 8
  %964 = zext i32 %868 to i64
  %965 = call i32 @llvm.smax.i32(i32 %868, i32 1) #7
  %966 = zext i32 %965 to i64
  br label %967

967:                                              ; preds = %1565, %951
  %968 = phi %struct.tre_tnfa_reach_t* [ %909, %951 ], [ %1265, %1565 ]
  %969 = phi %struct.tre_tnfa_reach_t* [ %901, %951 ], [ %1266, %1565 ]
  %970 = phi %struct.tre_tnfa_reach_t* [ %901, %951 ], [ %1566, %1565 ]
  %971 = phi i64 [ -1, %951 ], [ %1567, %1565 ]
  %972 = phi i32 [ 0, %951 ], [ %1568, %1565 ]
  %973 = phi i64* [ %893, %951 ], [ %1569, %1565 ]
  %974 = phi i64 [ %952, %951 ], [ %1201, %1565 ]
  %975 = phi i64 [ 0, %951 ], [ %1194, %1565 ]
  %976 = phi i8* [ %953, %951 ], [ %1202, %1565 ]
  %977 = phi i32 [ 0, %951 ], [ %1191, %1565 ]
  %978 = icmp slt i64 %971, 0
  br i1 %978, label %979, label %1184

979:                                              ; preds = %967
  %980 = load %struct.tnfa_transition*, %struct.tnfa_transition** %955, align 8, !tbaa !19
  %981 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %980, i64 0, i32 2
  %982 = load %struct.tnfa_transition*, %struct.tnfa_transition** %981, align 8, !tbaa !20
  %983 = icmp eq %struct.tnfa_transition* %982, null
  br i1 %983, label %1177, label %984

984:                                              ; preds = %979
  %985 = icmp slt i64 %975, 1
  %986 = icmp eq i32 %977, 10
  %987 = select i1 %986, i1 %957, i1 false
  %988 = icmp eq i32 %977, 95
  %989 = icmp ne i64 %975, 0
  %990 = icmp eq i64 %975, 0
  %991 = and i1 %956, %985
  br label %992

992:                                              ; preds = %1169, %984
  %993 = phi i32 [ %972, %984 ], [ %1172, %1169 ]
  %994 = phi i64 [ %971, %984 ], [ %1171, %1169 ]
  %995 = phi %struct.tre_tnfa_reach_t* [ %970, %984 ], [ %1170, %1169 ]
  %996 = phi %struct.tnfa_transition* [ %980, %984 ], [ %1173, %1169 ]
  br label %997

997:                                              ; preds = %1105, %992
  %998 = phi %struct.tnfa_transition* [ %996, %992 ], [ %1106, %1105 ]
  %999 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %998, i64 0, i32 3
  %1000 = load i32, i32* %999, align 8, !tbaa !32
  %1001 = sext i32 %1000 to i64
  %1002 = getelementptr inbounds %struct.tre_reach_pos_t, %struct.tre_reach_pos_t* %917, i64 %1001, i32 0
  %1003 = load i64, i64* %1002, align 8, !tbaa !46
  %1004 = icmp slt i64 %1003, %975
  br i1 %1004, label %1005, label %1169

1005:                                             ; preds = %997
  %1006 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %998, i64 0, i32 5
  %1007 = load i32, i32* %1006, align 8, !tbaa !22
  %1008 = icmp eq i32 %1007, 0
  br i1 %1008, label %1110, label %1009

1009:                                             ; preds = %1005
  %1010 = and i32 %1007, 1
  %1011 = icmp eq i32 %1010, 0
  %1012 = select i1 %1011, i1 true, i1 %991
  %1013 = select i1 %1012, i1 true, i1 %987
  br i1 %1013, label %1014, label %1105

1014:                                             ; preds = %1009
  %1015 = and i32 %1007, 2
  %1016 = icmp eq i32 %1015, 0
  br i1 %1016, label %1024, label %1017

1017:                                             ; preds = %1014
  %1018 = load i32, i32* %6, align 4, !tbaa !14
  %1019 = or i32 %1018, %861
  %1020 = icmp eq i32 %1019, 0
  br i1 %1020, label %1024, label %1021

1021:                                             ; preds = %1017
  %1022 = icmp eq i32 %1018, 10
  %1023 = select i1 %1022, i1 %957, i1 false
  br i1 %1023, label %1024, label %1105

1024:                                             ; preds = %1021, %1017, %1014
  %1025 = and i32 %1007, 16
  %1026 = icmp eq i32 %1025, 0
  br i1 %1026, label %1037, label %1027

1027:                                             ; preds = %1024
  br i1 %988, label %1105, label %1028

1028:                                             ; preds = %1027
  %1029 = call i32 @iswalnum(i32 noundef %977) #5
  %1030 = icmp eq i32 %1029, 0
  br i1 %1030, label %1031, label %1105

1031:                                             ; preds = %1028
  %1032 = load i32, i32* %6, align 4, !tbaa !14
  %1033 = icmp eq i32 %1032, 95
  br i1 %1033, label %1037, label %1034

1034:                                             ; preds = %1031
  %1035 = call i32 @iswalnum(i32 noundef %1032) #5
  %1036 = icmp eq i32 %1035, 0
  br i1 %1036, label %1105, label %1037

1037:                                             ; preds = %1034, %1031, %1024
  %1038 = load i32, i32* %1006, align 8, !tbaa !22
  %1039 = and i32 %1038, 32
  %1040 = icmp eq i32 %1039, 0
  br i1 %1040, label %1057, label %1041

1041:                                             ; preds = %1037
  br i1 %988, label %1048, label %1042

1042:                                             ; preds = %1041
  %1043 = call i32 @iswalnum(i32 noundef %977) #5
  %1044 = icmp eq i32 %1043, 0
  %1045 = load i32, i32* %6, align 4
  %1046 = icmp eq i32 %1045, 95
  %1047 = select i1 %1044, i1 true, i1 %1046
  br i1 %1047, label %1105, label %1051

1048:                                             ; preds = %1041
  %1049 = load i32, i32* %6, align 4, !tbaa !14
  %1050 = icmp eq i32 %1049, 95
  br i1 %1050, label %1105, label %1051

1051:                                             ; preds = %1048, %1042
  %1052 = phi i32 [ %1045, %1042 ], [ %1049, %1048 ]
  %1053 = call i32 @iswalnum(i32 noundef %1052) #5
  %1054 = icmp eq i32 %1053, 0
  br i1 %1054, label %1055, label %1105

1055:                                             ; preds = %1051
  %1056 = load i32, i32* %1006, align 8, !tbaa !22
  br label %1057

1057:                                             ; preds = %1055, %1037
  %1058 = phi i32 [ %1056, %1055 ], [ %1038, %1037 ]
  %1059 = and i32 %1058, 64
  %1060 = icmp ne i32 %1059, 0
  %1061 = select i1 %1060, i1 %989, i1 false
  %1062 = load i32, i32* %6, align 4
  %1063 = icmp ne i32 %1062, 0
  %1064 = select i1 %1061, i1 %1063, i1 false
  br i1 %1064, label %1065, label %1081

1065:                                             ; preds = %1057
  br i1 %988, label %1071, label %1066

1066:                                             ; preds = %1065
  %1067 = call i32 @iswalnum(i32 noundef %977) #5
  %1068 = icmp ne i32 %1067, 0
  %1069 = load i32, i32* %6, align 4, !tbaa !14
  %1070 = icmp eq i32 %1069, 95
  br i1 %1070, label %1076, label %1077

1071:                                             ; preds = %1065
  %1072 = icmp eq i32 %1062, 95
  br i1 %1072, label %1105, label %1073

1073:                                             ; preds = %1071
  %1074 = call i32 @iswalnum(i32 noundef %1062) #5
  %1075 = icmp eq i32 %1074, 0
  br i1 %1075, label %1081, label %1105

1076:                                             ; preds = %1066
  br i1 %1068, label %1105, label %1081

1077:                                             ; preds = %1066
  %1078 = call i32 @iswalnum(i32 noundef %1069) #5
  %1079 = icmp ne i32 %1078, 0
  %1080 = xor i1 %1068, %1079
  br i1 %1080, label %1081, label %1105

1081:                                             ; preds = %1077, %1076, %1073, %1057
  %1082 = load i32, i32* %1006, align 8, !tbaa !22
  %1083 = and i32 %1082, 128
  %1084 = icmp eq i32 %1083, 0
  br i1 %1084, label %1110, label %1085

1085:                                             ; preds = %1081
  %1086 = load i32, i32* %6, align 4
  %1087 = icmp eq i32 %1086, 0
  %1088 = select i1 %990, i1 true, i1 %1087
  br i1 %1088, label %1105, label %1089

1089:                                             ; preds = %1085
  br i1 %988, label %1095, label %1090

1090:                                             ; preds = %1089
  %1091 = call i32 @iswalnum(i32 noundef %977) #5
  %1092 = icmp ne i32 %1091, 0
  %1093 = load i32, i32* %6, align 4, !tbaa !14
  %1094 = icmp eq i32 %1093, 95
  br i1 %1094, label %1100, label %1101

1095:                                             ; preds = %1089
  %1096 = icmp eq i32 %1086, 95
  br i1 %1096, label %1110, label %1097

1097:                                             ; preds = %1095
  %1098 = call i32 @iswalnum(i32 noundef %1086) #5
  %1099 = icmp eq i32 %1098, 0
  br i1 %1099, label %1105, label %1110

1100:                                             ; preds = %1090
  br i1 %1092, label %1110, label %1105

1101:                                             ; preds = %1090
  %1102 = call i32 @iswalnum(i32 noundef %1093) #5
  %1103 = icmp ne i32 %1102, 0
  %1104 = xor i1 %1092, %1103
  br i1 %1104, label %1105, label %1110

1105:                                             ; preds = %1101, %1100, %1097, %1085, %1077, %1076, %1073, %1071, %1051, %1048, %1042, %1034, %1028, %1027, %1021, %1009
  %1106 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %998, i64 1
  %1107 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %998, i64 1, i32 2
  %1108 = load %struct.tnfa_transition*, %struct.tnfa_transition** %1107, align 8, !tbaa !20
  %1109 = icmp eq %struct.tnfa_transition* %1108, null
  br i1 %1109, label %1177, label %997

1110:                                             ; preds = %1101, %1100, %1097, %1095, %1081, %1005
  %1111 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %998, i64 0, i32 3
  %1112 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %998, i64 0, i32 2
  %1113 = load %struct.tnfa_transition*, %struct.tnfa_transition** %1112, align 8, !tbaa !20
  %1114 = getelementptr inbounds %struct.tre_tnfa_reach_t, %struct.tre_tnfa_reach_t* %995, i64 0, i32 0
  store %struct.tnfa_transition* %1113, %struct.tnfa_transition** %1114, align 8, !tbaa !48
  br i1 %958, label %1115, label %1123

1115:                                             ; preds = %1110
  %1116 = getelementptr inbounds %struct.tre_tnfa_reach_t, %struct.tre_tnfa_reach_t* %995, i64 0, i32 1
  %1117 = load i64*, i64** %1116, align 8, !tbaa !44
  br label %1118

1118:                                             ; preds = %1118, %1115
  %1119 = phi i64 [ 0, %1115 ], [ %1121, %1118 ]
  %1120 = getelementptr inbounds i64, i64* %1117, i64 %1119
  store i64 -1, i64* %1120, align 8, !tbaa !18
  %1121 = add nuw nsw i64 %1119, 1
  %1122 = icmp eq i64 %1121, %964
  br i1 %1122, label %1123, label %1118

1123:                                             ; preds = %1118, %1110
  %1124 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %998, i64 0, i32 4
  %1125 = load i32*, i32** %1124, align 8, !tbaa !23
  %1126 = icmp eq i32* %1125, null
  br i1 %1126, label %1144, label %1127

1127:                                             ; preds = %1123
  %1128 = load i32, i32* %1125, align 4, !tbaa !14
  %1129 = icmp sgt i32 %1128, -1
  br i1 %1129, label %1130, label %1144

1130:                                             ; preds = %1127
  %1131 = getelementptr inbounds %struct.tre_tnfa_reach_t, %struct.tre_tnfa_reach_t* %995, i64 0, i32 1
  br label %1132

1132:                                             ; preds = %1140, %1130
  %1133 = phi i32 [ %1128, %1130 ], [ %1142, %1140 ]
  %1134 = phi i32* [ %1125, %1130 ], [ %1141, %1140 ]
  %1135 = icmp slt i32 %1133, %868
  br i1 %1135, label %1136, label %1140

1136:                                             ; preds = %1132
  %1137 = load i64*, i64** %1131, align 8, !tbaa !44
  %1138 = zext i32 %1133 to i64
  %1139 = getelementptr inbounds i64, i64* %1137, i64 %1138
  store i64 %975, i64* %1139, align 8, !tbaa !18
  br label %1140

1140:                                             ; preds = %1136, %1132
  %1141 = getelementptr inbounds i32, i32* %1134, i64 1
  %1142 = load i32, i32* %1141, align 4, !tbaa !14
  %1143 = icmp sgt i32 %1142, -1
  br i1 %1143, label %1132, label %1144

1144:                                             ; preds = %1140, %1127, %1123
  %1145 = load %struct.tnfa_transition*, %struct.tnfa_transition** %959, align 8, !tbaa !35
  %1146 = icmp ne %struct.tnfa_transition* %1113, %1145
  %1147 = select i1 %1146, i1 true, i1 %960
  %1148 = select i1 %1146, i64 %994, i64 %975
  %1149 = select i1 %1146, i32 %993, i32 1
  br i1 %1147, label %1160, label %1150

1150:                                             ; preds = %1144
  %1151 = getelementptr inbounds %struct.tre_tnfa_reach_t, %struct.tre_tnfa_reach_t* %995, i64 0, i32 1
  %1152 = load i64*, i64** %1151, align 8, !tbaa !44
  br label %1153

1153:                                             ; preds = %1153, %1150
  %1154 = phi i64 [ 0, %1150 ], [ %1158, %1153 ]
  %1155 = getelementptr inbounds i64, i64* %1152, i64 %1154
  %1156 = load i64, i64* %1155, align 8, !tbaa !18
  %1157 = getelementptr inbounds i64, i64* %28, i64 %1154
  store i64 %1156, i64* %1157, align 8, !tbaa !18
  %1158 = add nuw nsw i64 %1154, 1
  %1159 = icmp eq i64 %1158, %964
  br i1 %1159, label %1160, label %1153

1160:                                             ; preds = %1153, %1144
  %1161 = phi i64 [ %1148, %1144 ], [ %975, %1153 ]
  %1162 = phi i32 [ %1149, %1144 ], [ 1, %1153 ]
  %1163 = load i32, i32* %1111, align 8, !tbaa !32
  %1164 = sext i32 %1163 to i64
  %1165 = getelementptr inbounds %struct.tre_reach_pos_t, %struct.tre_reach_pos_t* %917, i64 %1164, i32 0
  store i64 %975, i64* %1165, align 8, !tbaa !46
  %1166 = getelementptr inbounds %struct.tre_tnfa_reach_t, %struct.tre_tnfa_reach_t* %995, i64 0, i32 1
  %1167 = getelementptr inbounds %struct.tre_reach_pos_t, %struct.tre_reach_pos_t* %917, i64 %1164, i32 1
  store i64** %1166, i64*** %1167, align 8, !tbaa !49
  %1168 = getelementptr inbounds %struct.tre_tnfa_reach_t, %struct.tre_tnfa_reach_t* %995, i64 1
  br label %1169

1169:                                             ; preds = %997, %1160
  %1170 = phi %struct.tre_tnfa_reach_t* [ %1168, %1160 ], [ %995, %997 ]
  %1171 = phi i64 [ %1161, %1160 ], [ %994, %997 ]
  %1172 = phi i32 [ %1162, %1160 ], [ %993, %997 ]
  %1173 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %998, i64 1
  %1174 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %998, i64 1, i32 2
  %1175 = load %struct.tnfa_transition*, %struct.tnfa_transition** %1174, align 8, !tbaa !20
  %1176 = icmp eq %struct.tnfa_transition* %1175, null
  br i1 %1176, label %1177, label %992

1177:                                             ; preds = %1169, %1105, %979
  %1178 = phi %struct.tre_tnfa_reach_t* [ %970, %979 ], [ %995, %1105 ], [ %1170, %1169 ]
  %1179 = phi i64 [ %971, %979 ], [ %994, %1105 ], [ %1171, %1169 ]
  %1180 = phi i32 [ %972, %979 ], [ %993, %1105 ], [ %1172, %1169 ]
  %1181 = getelementptr inbounds %struct.tre_tnfa_reach_t, %struct.tre_tnfa_reach_t* %1178, i64 0, i32 0
  store %struct.tnfa_transition* null, %struct.tnfa_transition** %1181, align 8, !tbaa !48
  %1182 = load i32, i32* %6, align 4, !tbaa !14
  %1183 = icmp eq i32 %1182, 0
  br i1 %1183, label %1571, label %1190

1184:                                             ; preds = %967
  br i1 %954, label %1571, label %1185

1185:                                             ; preds = %1184
  %1186 = icmp ne %struct.tre_tnfa_reach_t* %970, %969
  %1187 = load i32, i32* %6, align 4
  %1188 = icmp ne i32 %1187, 0
  %1189 = select i1 %1186, i1 %1188, i1 false
  br i1 %1189, label %1190, label %1571

1190:                                             ; preds = %1185, %1177
  %1191 = phi i32 [ %1187, %1185 ], [ %1182, %1177 ]
  %1192 = phi i64 [ %971, %1185 ], [ %1179, %1177 ]
  %1193 = phi i32 [ %972, %1185 ], [ %1180, %1177 ]
  %1194 = add nsw i64 %975, %974
  %1195 = call i32 @mbtowc(i32* noundef nonnull %6, i8* noundef %976, i64 noundef 4) #5
  %1196 = sext i32 %1195 to i64
  %1197 = icmp slt i32 %1195, 1
  br i1 %1197, label %1198, label %1200

1198:                                             ; preds = %1190
  %1199 = icmp slt i32 %1195, 0
  br i1 %1199, label %1575, label %1200

1200:                                             ; preds = %1198, %1190
  %1201 = phi i64 [ %1196, %1190 ], [ 1, %1198 ]
  %1202 = getelementptr inbounds i8, i8* %976, i64 %1201
  %1203 = load i32, i32* %961, align 4, !tbaa !50
  %1204 = icmp ne i32 %1203, 0
  %1205 = icmp ne i32 %1193, 0
  %1206 = select i1 %1204, i1 %1205, i1 false
  br i1 %1206, label %1207, label %1264

1207:                                             ; preds = %1200
  %1208 = getelementptr inbounds %struct.tre_tnfa_reach_t, %struct.tre_tnfa_reach_t* %969, i64 0, i32 0
  %1209 = load %struct.tnfa_transition*, %struct.tnfa_transition** %1208, align 8, !tbaa !48
  %1210 = icmp eq %struct.tnfa_transition* %1209, null
  br i1 %1210, label %1261, label %1211

1211:                                             ; preds = %1207
  %1212 = load i32*, i32** %962, align 8, !tbaa !51
  %1213 = load i32, i32* %1212, align 4, !tbaa !14
  %1214 = icmp sgt i32 %1213, -1
  br label %1215

1215:                                             ; preds = %1255, %1211
  %1216 = phi %struct.tnfa_transition* [ %1209, %1211 ], [ %1259, %1255 ]
  %1217 = phi %struct.tre_tnfa_reach_t* [ %968, %1211 ], [ %1256, %1255 ]
  %1218 = phi %struct.tre_tnfa_reach_t* [ %969, %1211 ], [ %1257, %1255 ]
  %1219 = getelementptr inbounds %struct.tre_tnfa_reach_t, %struct.tre_tnfa_reach_t* %1218, i64 0, i32 1
  br i1 %1214, label %1222, label %1220

1220:                                             ; preds = %1215
  %1221 = load i64*, i64** %1219, align 8, !tbaa !44
  br label %1249

1222:                                             ; preds = %1215, %1244
  %1223 = phi i64 [ %1245, %1244 ], [ 0, %1215 ]
  %1224 = phi i32 [ %1247, %1244 ], [ %1213, %1215 ]
  %1225 = icmp slt i32 %1224, %868
  br i1 %1225, label %1226, label %1255

1226:                                             ; preds = %1222
  %1227 = or i64 %1223, 1
  %1228 = getelementptr inbounds i32, i32* %1212, i64 %1227
  %1229 = load i32, i32* %1228, align 4, !tbaa !14
  %1230 = load i64*, i64** %1219, align 8, !tbaa !44
  %1231 = sext i32 %1229 to i64
  %1232 = getelementptr inbounds i64, i64* %1230, i64 %1231
  %1233 = load i64, i64* %1232, align 8, !tbaa !18
  %1234 = getelementptr inbounds i64, i64* %28, i64 %1231
  %1235 = load i64, i64* %1234, align 8, !tbaa !18
  %1236 = icmp eq i64 %1233, %1235
  br i1 %1236, label %1237, label %1244

1237:                                             ; preds = %1226
  %1238 = zext i32 %1224 to i64
  %1239 = getelementptr inbounds i64, i64* %1230, i64 %1238
  %1240 = load i64, i64* %1239, align 8, !tbaa !18
  %1241 = getelementptr inbounds i64, i64* %28, i64 %1238
  %1242 = load i64, i64* %1241, align 8, !tbaa !18
  %1243 = icmp slt i64 %1240, %1242
  br i1 %1243, label %1255, label %1244

1244:                                             ; preds = %1237, %1226
  %1245 = add nuw i64 %1223, 2
  %1246 = getelementptr inbounds i32, i32* %1212, i64 %1245
  %1247 = load i32, i32* %1246, align 4, !tbaa !14
  %1248 = icmp sgt i32 %1247, -1
  br i1 %1248, label %1222, label %1249

1249:                                             ; preds = %1244, %1220
  %1250 = phi i64* [ %1221, %1220 ], [ %1230, %1244 ]
  %1251 = getelementptr inbounds %struct.tre_tnfa_reach_t, %struct.tre_tnfa_reach_t* %1217, i64 0, i32 0
  store %struct.tnfa_transition* %1216, %struct.tnfa_transition** %1251, align 8, !tbaa !48
  %1252 = getelementptr inbounds %struct.tre_tnfa_reach_t, %struct.tre_tnfa_reach_t* %1217, i64 0, i32 1
  %1253 = load i64*, i64** %1252, align 8, !tbaa !44
  store i64* %1250, i64** %1252, align 8, !tbaa !44
  store i64* %1253, i64** %1219, align 8, !tbaa !44
  %1254 = getelementptr inbounds %struct.tre_tnfa_reach_t, %struct.tre_tnfa_reach_t* %1217, i64 1
  br label %1255

1255:                                             ; preds = %1237, %1222, %1249
  %1256 = phi %struct.tre_tnfa_reach_t* [ %1254, %1249 ], [ %1217, %1222 ], [ %1217, %1237 ]
  %1257 = getelementptr inbounds %struct.tre_tnfa_reach_t, %struct.tre_tnfa_reach_t* %1218, i64 1
  %1258 = getelementptr inbounds %struct.tre_tnfa_reach_t, %struct.tre_tnfa_reach_t* %1257, i64 0, i32 0
  %1259 = load %struct.tnfa_transition*, %struct.tnfa_transition** %1258, align 8, !tbaa !48
  %1260 = icmp eq %struct.tnfa_transition* %1259, null
  br i1 %1260, label %1261, label %1215

1261:                                             ; preds = %1255, %1207
  %1262 = phi %struct.tre_tnfa_reach_t* [ %968, %1207 ], [ %1256, %1255 ]
  %1263 = getelementptr inbounds %struct.tre_tnfa_reach_t, %struct.tre_tnfa_reach_t* %1262, i64 0, i32 0
  store %struct.tnfa_transition* null, %struct.tnfa_transition** %1263, align 8, !tbaa !48
  br label %1264

1264:                                             ; preds = %1261, %1200
  %1265 = phi %struct.tre_tnfa_reach_t* [ %968, %1261 ], [ %969, %1200 ]
  %1266 = phi %struct.tre_tnfa_reach_t* [ %969, %1261 ], [ %968, %1200 ]
  %1267 = phi i32 [ 0, %1261 ], [ %1193, %1200 ]
  %1268 = getelementptr inbounds %struct.tre_tnfa_reach_t, %struct.tre_tnfa_reach_t* %1265, i64 0, i32 0
  %1269 = load %struct.tnfa_transition*, %struct.tnfa_transition** %1268, align 8, !tbaa !48
  %1270 = icmp eq %struct.tnfa_transition* %1269, null
  br i1 %1270, label %1565, label %1271

1271:                                             ; preds = %1264
  %1272 = icmp slt i64 %1194, 1
  %1273 = icmp eq i32 %1191, 10
  %1274 = select i1 %1273, i1 %957, i1 false
  %1275 = icmp eq i32 %1191, 95
  %1276 = icmp ne i64 %1194, 0
  %1277 = icmp eq i64 %1194, 0
  %1278 = and i1 %956, %1272
  br label %1279

1279:                                             ; preds = %1556, %1271
  %1280 = phi %struct.tnfa_transition* [ %1269, %1271 ], [ %1563, %1556 ]
  %1281 = phi i64* [ %973, %1271 ], [ %1560, %1556 ]
  %1282 = phi i32 [ %1267, %1271 ], [ %1559, %1556 ]
  %1283 = phi i64 [ %1192, %1271 ], [ %1558, %1556 ]
  %1284 = phi %struct.tre_tnfa_reach_t* [ %1266, %1271 ], [ %1557, %1556 ]
  %1285 = phi %struct.tre_tnfa_reach_t* [ %1265, %1271 ], [ %1561, %1556 ]
  %1286 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %1280, i64 0, i32 2
  %1287 = load %struct.tnfa_transition*, %struct.tnfa_transition** %1286, align 8, !tbaa !20
  %1288 = icmp eq %struct.tnfa_transition* %1287, null
  br i1 %1288, label %1556, label %1289

1289:                                             ; preds = %1279
  %1290 = getelementptr inbounds %struct.tre_tnfa_reach_t, %struct.tre_tnfa_reach_t* %1285, i64 0, i32 1
  br label %1291

1291:                                             ; preds = %1547, %1289
  %1292 = phi %struct.tnfa_transition** [ %1286, %1289 ], [ %1553, %1547 ]
  %1293 = phi i64* [ %1281, %1289 ], [ %1551, %1547 ]
  %1294 = phi i32 [ %1282, %1289 ], [ %1550, %1547 ]
  %1295 = phi i64 [ %1283, %1289 ], [ %1549, %1547 ]
  %1296 = phi %struct.tre_tnfa_reach_t* [ %1284, %1289 ], [ %1548, %1547 ]
  %1297 = phi %struct.tnfa_transition* [ %1280, %1289 ], [ %1552, %1547 ]
  %1298 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %1297, i64 0, i32 0
  %1299 = load i32, i32* %1298, align 8, !tbaa !41
  %1300 = icmp ugt i32 %1299, %1191
  br i1 %1300, label %1547, label %1301

1301:                                             ; preds = %1291
  %1302 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %1297, i64 0, i32 1
  %1303 = load i32, i32* %1302, align 4, !tbaa !42
  %1304 = icmp ult i32 %1303, %1191
  br i1 %1304, label %1547, label %1305

1305:                                             ; preds = %1301
  %1306 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %1297, i64 0, i32 5
  %1307 = load i32, i32* %1306, align 8, !tbaa !22
  %1308 = icmp eq i32 %1307, 0
  br i1 %1308, label %1448, label %1309

1309:                                             ; preds = %1305
  %1310 = and i32 %1307, 1
  %1311 = icmp eq i32 %1310, 0
  %1312 = select i1 %1311, i1 true, i1 %1278
  %1313 = select i1 %1312, i1 true, i1 %1274
  br i1 %1313, label %1314, label %1547

1314:                                             ; preds = %1309
  %1315 = and i32 %1307, 2
  %1316 = icmp eq i32 %1315, 0
  br i1 %1316, label %1324, label %1317

1317:                                             ; preds = %1314
  %1318 = load i32, i32* %6, align 4, !tbaa !14
  %1319 = or i32 %1318, %861
  %1320 = icmp eq i32 %1319, 0
  br i1 %1320, label %1324, label %1321

1321:                                             ; preds = %1317
  %1322 = icmp eq i32 %1318, 10
  %1323 = select i1 %1322, i1 %957, i1 false
  br i1 %1323, label %1324, label %1547

1324:                                             ; preds = %1321, %1317, %1314
  %1325 = and i32 %1307, 16
  %1326 = icmp eq i32 %1325, 0
  br i1 %1326, label %1337, label %1327

1327:                                             ; preds = %1324
  br i1 %1275, label %1547, label %1328

1328:                                             ; preds = %1327
  %1329 = call i32 @iswalnum(i32 noundef %1191) #5
  %1330 = icmp eq i32 %1329, 0
  br i1 %1330, label %1331, label %1547

1331:                                             ; preds = %1328
  %1332 = load i32, i32* %6, align 4, !tbaa !14
  %1333 = icmp eq i32 %1332, 95
  br i1 %1333, label %1337, label %1334

1334:                                             ; preds = %1331
  %1335 = call i32 @iswalnum(i32 noundef %1332) #5
  %1336 = icmp eq i32 %1335, 0
  br i1 %1336, label %1547, label %1337

1337:                                             ; preds = %1334, %1331, %1324
  %1338 = load i32, i32* %1306, align 8, !tbaa !22
  %1339 = and i32 %1338, 32
  %1340 = icmp eq i32 %1339, 0
  br i1 %1340, label %1357, label %1341

1341:                                             ; preds = %1337
  br i1 %1275, label %1348, label %1342

1342:                                             ; preds = %1341
  %1343 = call i32 @iswalnum(i32 noundef %1191) #5
  %1344 = icmp eq i32 %1343, 0
  %1345 = load i32, i32* %6, align 4
  %1346 = icmp eq i32 %1345, 95
  %1347 = select i1 %1344, i1 true, i1 %1346
  br i1 %1347, label %1547, label %1351

1348:                                             ; preds = %1341
  %1349 = load i32, i32* %6, align 4, !tbaa !14
  %1350 = icmp eq i32 %1349, 95
  br i1 %1350, label %1547, label %1351

1351:                                             ; preds = %1348, %1342
  %1352 = phi i32 [ %1345, %1342 ], [ %1349, %1348 ]
  %1353 = call i32 @iswalnum(i32 noundef %1352) #5
  %1354 = icmp eq i32 %1353, 0
  br i1 %1354, label %1355, label %1547

1355:                                             ; preds = %1351
  %1356 = load i32, i32* %1306, align 8, !tbaa !22
  br label %1357

1357:                                             ; preds = %1355, %1337
  %1358 = phi i32 [ %1356, %1355 ], [ %1338, %1337 ]
  %1359 = and i32 %1358, 64
  %1360 = icmp ne i32 %1359, 0
  %1361 = select i1 %1360, i1 %1276, i1 false
  %1362 = load i32, i32* %6, align 4
  %1363 = icmp ne i32 %1362, 0
  %1364 = select i1 %1361, i1 %1363, i1 false
  br i1 %1364, label %1365, label %1381

1365:                                             ; preds = %1357
  br i1 %1275, label %1371, label %1366

1366:                                             ; preds = %1365
  %1367 = call i32 @iswalnum(i32 noundef %1191) #5
  %1368 = icmp ne i32 %1367, 0
  %1369 = load i32, i32* %6, align 4, !tbaa !14
  %1370 = icmp eq i32 %1369, 95
  br i1 %1370, label %1376, label %1377

1371:                                             ; preds = %1365
  %1372 = icmp eq i32 %1362, 95
  br i1 %1372, label %1547, label %1373

1373:                                             ; preds = %1371
  %1374 = call i32 @iswalnum(i32 noundef %1362) #5
  %1375 = icmp eq i32 %1374, 0
  br i1 %1375, label %1381, label %1547

1376:                                             ; preds = %1366
  br i1 %1368, label %1547, label %1381

1377:                                             ; preds = %1366
  %1378 = call i32 @iswalnum(i32 noundef %1369) #5
  %1379 = icmp ne i32 %1378, 0
  %1380 = xor i1 %1368, %1379
  br i1 %1380, label %1381, label %1547

1381:                                             ; preds = %1377, %1376, %1373, %1357
  %1382 = load i32, i32* %1306, align 8, !tbaa !22
  %1383 = and i32 %1382, 128
  %1384 = icmp eq i32 %1383, 0
  br i1 %1384, label %1405, label %1385

1385:                                             ; preds = %1381
  %1386 = load i32, i32* %6, align 4
  %1387 = icmp eq i32 %1386, 0
  %1388 = select i1 %1277, i1 true, i1 %1387
  br i1 %1388, label %1547, label %1389

1389:                                             ; preds = %1385
  br i1 %1275, label %1395, label %1390

1390:                                             ; preds = %1389
  %1391 = call i32 @iswalnum(i32 noundef %1191) #5
  %1392 = icmp ne i32 %1391, 0
  %1393 = load i32, i32* %6, align 4, !tbaa !14
  %1394 = icmp eq i32 %1393, 95
  br i1 %1394, label %1400, label %1401

1395:                                             ; preds = %1389
  %1396 = icmp eq i32 %1386, 95
  br i1 %1396, label %1405, label %1397

1397:                                             ; preds = %1395
  %1398 = call i32 @iswalnum(i32 noundef %1386) #5
  %1399 = icmp eq i32 %1398, 0
  br i1 %1399, label %1547, label %1405

1400:                                             ; preds = %1390
  br i1 %1392, label %1405, label %1547

1401:                                             ; preds = %1390
  %1402 = call i32 @iswalnum(i32 noundef %1393) #5
  %1403 = icmp ne i32 %1402, 0
  %1404 = xor i1 %1392, %1403
  br i1 %1404, label %1547, label %1405

1405:                                             ; preds = %1401, %1400, %1397, %1395, %1381
  %1406 = load i32, i32* %1306, align 8, !tbaa !22
  %1407 = and i32 %1406, 4
  %1408 = icmp eq i32 %1407, 0
  br i1 %1408, label %1437, label %1409

1409:                                             ; preds = %1405
  %1410 = load i32, i32* %11, align 8, !tbaa !9
  %1411 = and i32 %1410, 2
  %1412 = icmp eq i32 %1411, 0
  br i1 %1412, label %1413, label %1426

1413:                                             ; preds = %1409
  %1414 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %1297, i64 0, i32 6, i32 0
  %1415 = load i64, i64* %1414, align 8, !tbaa !37
  %1416 = call i32 @iswctype(i32 noundef %1191, i64 noundef %1415) #5
  %1417 = icmp eq i32 %1416, 0
  br i1 %1417, label %1547, label %1418

1418:                                             ; preds = %1413
  %1419 = load i32, i32* %1306, align 8, !tbaa !22
  %1420 = and i32 %1419, 4
  %1421 = icmp eq i32 %1420, 0
  br i1 %1421, label %1437, label %1422

1422:                                             ; preds = %1418
  %1423 = load i32, i32* %11, align 8, !tbaa !9
  %1424 = and i32 %1423, 2
  %1425 = icmp eq i32 %1424, 0
  br i1 %1425, label %1437, label %1426

1426:                                             ; preds = %1409, %1422
  %1427 = call i32 @towlower(i32 noundef %1191) #5
  %1428 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %1297, i64 0, i32 6, i32 0
  %1429 = load i64, i64* %1428, align 8, !tbaa !37
  %1430 = call i32 @iswctype(i32 noundef %1427, i64 noundef %1429) #5
  %1431 = icmp eq i32 %1430, 0
  br i1 %1431, label %1432, label %1437

1432:                                             ; preds = %1426
  %1433 = call i32 @towupper(i32 noundef %1191) #5
  %1434 = load i64, i64* %1428, align 8, !tbaa !37
  %1435 = call i32 @iswctype(i32 noundef %1433, i64 noundef %1434) #5
  %1436 = icmp eq i32 %1435, 0
  br i1 %1436, label %1547, label %1437

1437:                                             ; preds = %1432, %1426, %1422, %1418, %1405
  %1438 = load i32, i32* %1306, align 8, !tbaa !22
  %1439 = and i32 %1438, 8
  %1440 = icmp eq i32 %1439, 0
  br i1 %1440, label %1448, label %1441

1441:                                             ; preds = %1437
  %1442 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %1297, i64 0, i32 7
  %1443 = load i64*, i64** %1442, align 8, !tbaa !43
  %1444 = load i32, i32* %11, align 8, !tbaa !9
  %1445 = and i32 %1444, 2
  %1446 = call fastcc i32 @tre_neg_char_classes_match(i64* noundef %1443, i32 noundef %1191, i32 noundef %1445) #5
  %1447 = icmp eq i32 %1446, 0
  br i1 %1447, label %1448, label %1547

1448:                                             ; preds = %1441, %1437, %1305
  br i1 %958, label %1449, label %1458

1449:                                             ; preds = %1448
  %1450 = load i64*, i64** %1290, align 8, !tbaa !44
  br label %1451

1451:                                             ; preds = %1451, %1449
  %1452 = phi i64 [ 0, %1449 ], [ %1456, %1451 ]
  %1453 = getelementptr inbounds i64, i64* %1450, i64 %1452
  %1454 = load i64, i64* %1453, align 8, !tbaa !18
  %1455 = getelementptr inbounds i64, i64* %1293, i64 %1452
  store i64 %1454, i64* %1455, align 8, !tbaa !18
  %1456 = add nuw nsw i64 %1452, 1
  %1457 = icmp eq i64 %1456, %964
  br i1 %1457, label %1458, label %1451

1458:                                             ; preds = %1451, %1448
  %1459 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %1297, i64 0, i32 4
  %1460 = load i32*, i32** %1459, align 8, !tbaa !23
  %1461 = icmp eq i32* %1460, null
  br i1 %1461, label %1476, label %1462

1462:                                             ; preds = %1458
  %1463 = load i32, i32* %1460, align 4, !tbaa !14
  %1464 = icmp sgt i32 %1463, -1
  br i1 %1464, label %1465, label %1476

1465:                                             ; preds = %1462, %1472
  %1466 = phi i32 [ %1474, %1472 ], [ %1463, %1462 ]
  %1467 = phi i32* [ %1473, %1472 ], [ %1460, %1462 ]
  %1468 = icmp slt i32 %1466, %868
  br i1 %1468, label %1469, label %1472

1469:                                             ; preds = %1465
  %1470 = zext i32 %1466 to i64
  %1471 = getelementptr inbounds i64, i64* %1293, i64 %1470
  store i64 %1194, i64* %1471, align 8, !tbaa !18
  br label %1472

1472:                                             ; preds = %1469, %1465
  %1473 = getelementptr inbounds i32, i32* %1467, i64 1
  %1474 = load i32, i32* %1473, align 4, !tbaa !14
  %1475 = icmp sgt i32 %1474, -1
  br i1 %1475, label %1465, label %1476

1476:                                             ; preds = %1472, %1462, %1458
  %1477 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %1297, i64 0, i32 3
  %1478 = load i32, i32* %1477, align 8, !tbaa !32
  %1479 = sext i32 %1478 to i64
  %1480 = getelementptr inbounds %struct.tre_reach_pos_t, %struct.tre_reach_pos_t* %917, i64 %1479, i32 0
  %1481 = load i64, i64* %1480, align 8, !tbaa !46
  %1482 = icmp slt i64 %1481, %1194
  br i1 %1482, label %1483, label %1511

1483:                                             ; preds = %1476
  %1484 = load %struct.tnfa_transition*, %struct.tnfa_transition** %1292, align 8, !tbaa !20
  %1485 = getelementptr inbounds %struct.tre_tnfa_reach_t, %struct.tre_tnfa_reach_t* %1296, i64 0, i32 0
  store %struct.tnfa_transition* %1484, %struct.tnfa_transition** %1485, align 8, !tbaa !48
  %1486 = getelementptr inbounds %struct.tre_tnfa_reach_t, %struct.tre_tnfa_reach_t* %1296, i64 0, i32 1
  %1487 = load i64*, i64** %1486, align 8, !tbaa !44
  store i64* %1293, i64** %1486, align 8, !tbaa !44
  store i64 %1194, i64* %1480, align 8, !tbaa !46
  %1488 = getelementptr inbounds %struct.tre_reach_pos_t, %struct.tre_reach_pos_t* %917, i64 %1479, i32 1
  store i64** %1486, i64*** %1488, align 8, !tbaa !49
  %1489 = load %struct.tnfa_transition*, %struct.tnfa_transition** %959, align 8, !tbaa !35
  %1490 = icmp eq %struct.tnfa_transition* %1484, %1489
  br i1 %1490, label %1491, label %1507

1491:                                             ; preds = %1483
  %1492 = icmp eq i64 %1295, -1
  br i1 %1492, label %1498, label %1493

1493:                                             ; preds = %1491
  br i1 %958, label %1494, label %1507

1494:                                             ; preds = %1493
  %1495 = load i64, i64* %1293, align 8, !tbaa !18
  %1496 = load i64, i64* %28, align 8, !tbaa !18
  %1497 = icmp sgt i64 %1495, %1496
  br i1 %1497, label %1507, label %1499

1498:                                             ; preds = %1491
  br i1 %958, label %1499, label %1507

1499:                                             ; preds = %1498, %1494
  br label %1500

1500:                                             ; preds = %1499, %1500
  %1501 = phi i64 [ %1505, %1500 ], [ 0, %1499 ]
  %1502 = getelementptr inbounds i64, i64* %1293, i64 %1501
  %1503 = load i64, i64* %1502, align 8, !tbaa !18
  %1504 = getelementptr inbounds i64, i64* %28, i64 %1501
  store i64 %1503, i64* %1504, align 8, !tbaa !18
  %1505 = add nuw nsw i64 %1501, 1
  %1506 = icmp eq i64 %1505, %966
  br i1 %1506, label %1507, label %1500

1507:                                             ; preds = %1500, %1498, %1494, %1493, %1483
  %1508 = phi i64 [ %1295, %1494 ], [ %1295, %1493 ], [ %1295, %1483 ], [ %1194, %1498 ], [ %1194, %1500 ]
  %1509 = phi i32 [ %1294, %1494 ], [ %1294, %1493 ], [ %1294, %1483 ], [ 1, %1498 ], [ 1, %1500 ]
  %1510 = getelementptr inbounds %struct.tre_tnfa_reach_t, %struct.tre_tnfa_reach_t* %1296, i64 1
  br label %1547

1511:                                             ; preds = %1476
  %1512 = load i32*, i32** %963, align 8, !tbaa !36
  %1513 = getelementptr inbounds %struct.tre_reach_pos_t, %struct.tre_reach_pos_t* %917, i64 %1479, i32 1
  %1514 = load i64**, i64*** %1513, align 8, !tbaa !49
  %1515 = load i64*, i64** %1514, align 8, !tbaa !15
  br i1 %958, label %1516, label %1547

1516:                                             ; preds = %1511, %1533
  %1517 = phi i64 [ %1534, %1533 ], [ 0, %1511 ]
  %1518 = getelementptr inbounds i32, i32* %1512, i64 %1517
  %1519 = load i32, i32* %1518, align 4, !tbaa !37
  %1520 = icmp eq i32 %1519, 0
  %1521 = getelementptr inbounds i64, i64* %1293, i64 %1517
  %1522 = load i64, i64* %1521, align 8, !tbaa !18
  %1523 = getelementptr inbounds i64, i64* %1515, i64 %1517
  %1524 = load i64, i64* %1523, align 8, !tbaa !18
  br i1 %1520, label %1525, label %1529

1525:                                             ; preds = %1516
  %1526 = icmp slt i64 %1522, %1524
  br i1 %1526, label %1536, label %1527

1527:                                             ; preds = %1525
  %1528 = icmp sgt i64 %1522, %1524
  br i1 %1528, label %1547, label %1533

1529:                                             ; preds = %1516
  %1530 = icmp sgt i64 %1522, %1524
  br i1 %1530, label %1536, label %1531

1531:                                             ; preds = %1529
  %1532 = icmp slt i64 %1522, %1524
  br i1 %1532, label %1547, label %1533

1533:                                             ; preds = %1531, %1527
  %1534 = add nuw nsw i64 %1517, 1
  %1535 = icmp eq i64 %1534, %964
  br i1 %1535, label %1547, label %1516

1536:                                             ; preds = %1529, %1525
  store i64* %1293, i64** %1514, align 8, !tbaa !15
  %1537 = load %struct.tnfa_transition*, %struct.tnfa_transition** %1292, align 8, !tbaa !20
  %1538 = load %struct.tnfa_transition*, %struct.tnfa_transition** %959, align 8, !tbaa !35
  %1539 = icmp eq %struct.tnfa_transition* %1537, %1538
  br i1 %1539, label %1540, label %1547

1540:                                             ; preds = %1536, %1540
  %1541 = phi i64 [ %1545, %1540 ], [ 0, %1536 ]
  %1542 = getelementptr inbounds i64, i64* %1293, i64 %1541
  %1543 = load i64, i64* %1542, align 8, !tbaa !18
  %1544 = getelementptr inbounds i64, i64* %28, i64 %1541
  store i64 %1543, i64* %1544, align 8, !tbaa !18
  %1545 = add nuw nsw i64 %1541, 1
  %1546 = icmp eq i64 %1545, %964
  br i1 %1546, label %1547, label %1540

1547:                                             ; preds = %1533, %1531, %1527, %1540, %1536, %1511, %1507, %1441, %1432, %1413, %1401, %1400, %1397, %1385, %1377, %1376, %1373, %1371, %1351, %1348, %1342, %1334, %1328, %1327, %1321, %1309, %1301, %1291
  %1548 = phi %struct.tre_tnfa_reach_t* [ %1296, %1327 ], [ %1296, %1328 ], [ %1296, %1348 ], [ %1296, %1351 ], [ %1296, %1377 ], [ %1296, %1385 ], [ %1296, %1401 ], [ %1296, %1441 ], [ %1510, %1507 ], [ %1296, %1432 ], [ %1296, %1413 ], [ %1296, %1342 ], [ %1296, %1334 ], [ %1296, %1321 ], [ %1296, %1301 ], [ %1296, %1291 ], [ %1296, %1536 ], [ %1296, %1376 ], [ %1296, %1400 ], [ %1296, %1511 ], [ %1296, %1309 ], [ %1296, %1373 ], [ %1296, %1397 ], [ %1296, %1371 ], [ %1296, %1540 ], [ %1296, %1527 ], [ %1296, %1531 ], [ %1296, %1533 ]
  %1549 = phi i64 [ %1295, %1327 ], [ %1295, %1328 ], [ %1295, %1348 ], [ %1295, %1351 ], [ %1295, %1377 ], [ %1295, %1385 ], [ %1295, %1401 ], [ %1295, %1441 ], [ %1508, %1507 ], [ %1295, %1432 ], [ %1295, %1413 ], [ %1295, %1342 ], [ %1295, %1334 ], [ %1295, %1321 ], [ %1295, %1301 ], [ %1295, %1291 ], [ %1295, %1536 ], [ %1295, %1376 ], [ %1295, %1400 ], [ %1295, %1511 ], [ %1295, %1309 ], [ %1295, %1373 ], [ %1295, %1397 ], [ %1295, %1371 ], [ %1194, %1540 ], [ %1295, %1527 ], [ %1295, %1531 ], [ %1295, %1533 ]
  %1550 = phi i32 [ %1294, %1327 ], [ %1294, %1328 ], [ %1294, %1348 ], [ %1294, %1351 ], [ %1294, %1377 ], [ %1294, %1385 ], [ %1294, %1401 ], [ %1294, %1441 ], [ %1509, %1507 ], [ %1294, %1432 ], [ %1294, %1413 ], [ %1294, %1342 ], [ %1294, %1334 ], [ %1294, %1321 ], [ %1294, %1301 ], [ %1294, %1291 ], [ %1294, %1536 ], [ %1294, %1376 ], [ %1294, %1400 ], [ %1294, %1511 ], [ %1294, %1309 ], [ %1294, %1373 ], [ %1294, %1397 ], [ %1294, %1371 ], [ 1, %1540 ], [ %1294, %1527 ], [ %1294, %1531 ], [ %1294, %1533 ]
  %1551 = phi i64* [ %1293, %1327 ], [ %1293, %1328 ], [ %1293, %1348 ], [ %1293, %1351 ], [ %1293, %1377 ], [ %1293, %1385 ], [ %1293, %1401 ], [ %1293, %1441 ], [ %1487, %1507 ], [ %1293, %1432 ], [ %1293, %1413 ], [ %1293, %1342 ], [ %1293, %1334 ], [ %1293, %1321 ], [ %1293, %1301 ], [ %1293, %1291 ], [ %1515, %1536 ], [ %1293, %1376 ], [ %1293, %1400 ], [ %1293, %1511 ], [ %1293, %1309 ], [ %1293, %1373 ], [ %1293, %1397 ], [ %1293, %1371 ], [ %1515, %1540 ], [ %1293, %1527 ], [ %1293, %1531 ], [ %1293, %1533 ]
  %1552 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %1297, i64 1
  %1553 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %1297, i64 1, i32 2
  %1554 = load %struct.tnfa_transition*, %struct.tnfa_transition** %1553, align 8, !tbaa !20
  %1555 = icmp eq %struct.tnfa_transition* %1554, null
  br i1 %1555, label %1556, label %1291

1556:                                             ; preds = %1547, %1279
  %1557 = phi %struct.tre_tnfa_reach_t* [ %1284, %1279 ], [ %1548, %1547 ]
  %1558 = phi i64 [ %1283, %1279 ], [ %1549, %1547 ]
  %1559 = phi i32 [ %1282, %1279 ], [ %1550, %1547 ]
  %1560 = phi i64* [ %1281, %1279 ], [ %1551, %1547 ]
  %1561 = getelementptr inbounds %struct.tre_tnfa_reach_t, %struct.tre_tnfa_reach_t* %1285, i64 1
  %1562 = getelementptr inbounds %struct.tre_tnfa_reach_t, %struct.tre_tnfa_reach_t* %1561, i64 0, i32 0
  %1563 = load %struct.tnfa_transition*, %struct.tnfa_transition** %1562, align 8, !tbaa !48
  %1564 = icmp eq %struct.tnfa_transition* %1563, null
  br i1 %1564, label %1565, label %1279

1565:                                             ; preds = %1556, %1264
  %1566 = phi %struct.tre_tnfa_reach_t* [ %1266, %1264 ], [ %1557, %1556 ]
  %1567 = phi i64 [ %1192, %1264 ], [ %1558, %1556 ]
  %1568 = phi i32 [ %1267, %1264 ], [ %1559, %1556 ]
  %1569 = phi i64* [ %973, %1264 ], [ %1560, %1556 ]
  %1570 = getelementptr inbounds %struct.tre_tnfa_reach_t, %struct.tre_tnfa_reach_t* %1566, i64 0, i32 0
  store %struct.tnfa_transition* null, %struct.tnfa_transition** %1570, align 8, !tbaa !48
  br label %967

1571:                                             ; preds = %1185, %1184, %1177
  %1572 = phi i64 [ %1179, %1177 ], [ %971, %1184 ], [ %971, %1185 ]
  %1573 = lshr i64 %1572, 63
  %1574 = trunc i64 %1573 to i32
  br label %1575

1575:                                             ; preds = %1198, %1571, %949
  %1576 = phi i64 [ undef, %949 ], [ %1572, %1571 ], [ undef, %1198 ]
  %1577 = phi i32 [ 1, %949 ], [ %1574, %1571 ], [ 1, %1198 ]
  call void @free(i8* noundef nonnull %890) #5
  br label %1578

1578:                                             ; preds = %867, %878, %1575
  %1579 = phi i64 [ undef, %867 ], [ undef, %878 ], [ %1576, %1575 ]
  %1580 = phi i32 [ 12, %867 ], [ 12, %878 ], [ %1577, %1575 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %859) #6
  br label %1581

1581:                                             ; preds = %1578, %855
  %1582 = phi i64 [ %1579, %1578 ], [ %856, %855 ]
  %1583 = phi i32 [ %1580, %1578 ], [ %857, %855 ]
  %1584 = icmp eq i32 %1583, 0
  br i1 %1584, label %1585, label %1587

1585:                                             ; preds = %1581
  %1586 = load i32, i32* %11, align 8, !tbaa !9
  call fastcc void @tre_fill_pmatch(i64 noundef %15, %struct.regmatch_t* noundef %3, i32 noundef %1586, %struct.tnfa* noundef %10, i64* noundef %28, i64 noundef %1582) #8
  br label %1587

1587:                                             ; preds = %1585, %1581
  %1588 = icmp eq i64* %28, null
  br i1 %1588, label %1591, label %1589

1589:                                             ; preds = %1587
  %1590 = bitcast i64* %28 to i8*
  call void @free(i8* noundef nonnull %1590) #5
  br label %1591

1591:                                             ; preds = %1587, %1589, %21
  %1592 = phi i32 [ 12, %21 ], [ %1583, %1589 ], [ %1583, %1587 ]
  ret i32 %1592
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i8* @malloc(i64 noundef) local_unnamed_addr #2

; Function Attrs: nofree norecurse nosync nounwind optsize strictfp
define internal fastcc void @tre_fill_pmatch(i64 noundef %0, %struct.regmatch_t* nocapture noundef %1, i32 noundef %2, %struct.tnfa* nocapture noundef readonly %3, i64* nocapture noundef readonly %4, i64 noundef %5) unnamed_addr #3 {
  %7 = icmp sgt i64 %5, -1
  %8 = and i32 %2, 8
  %9 = icmp eq i32 %8, 0
  %10 = and i1 %9, %7
  br i1 %10, label %11, label %100

11:                                               ; preds = %6
  %12 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %3, i64 0, i32 4
  %13 = load %struct.tre_submatch_data*, %struct.tre_submatch_data** %12, align 8, !tbaa !52
  %14 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %3, i64 0, i32 7
  %15 = load i32, i32* %14, align 4, !tbaa !16
  %16 = icmp ne i32 %15, 0
  %17 = icmp ne i64 %0, 0
  %18 = and i1 %16, %17
  br i1 %18, label %19, label %100

19:                                               ; preds = %11
  %20 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %3, i64 0, i32 12
  %21 = load i32, i32* %20, align 8, !tbaa !53
  %22 = add i64 %0, -1
  %23 = add i32 %15, -1
  %24 = zext i32 %23 to i64
  %25 = call i64 @llvm.umin.i64(i64 %22, i64 %24)
  br label %27

26:                                               ; preds = %54
  br i1 %18, label %57, label %100

27:                                               ; preds = %19, %54
  %28 = phi i64 [ 0, %19 ], [ %55, %54 ]
  %29 = getelementptr inbounds %struct.tre_submatch_data, %struct.tre_submatch_data* %13, i64 %28, i32 0
  %30 = load i32, i32* %29, align 8, !tbaa !54
  %31 = icmp eq i32 %30, %21
  br i1 %31, label %36, label %32

32:                                               ; preds = %27
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds i64, i64* %4, i64 %33
  %35 = load i64, i64* %34, align 8, !tbaa !18
  br label %36

36:                                               ; preds = %27, %32
  %37 = phi i64 [ %35, %32 ], [ %5, %27 ]
  %38 = getelementptr inbounds %struct.regmatch_t, %struct.regmatch_t* %1, i64 %28, i32 0
  store i64 %37, i64* %38, align 8
  %39 = getelementptr inbounds %struct.tre_submatch_data, %struct.tre_submatch_data* %13, i64 %28, i32 1
  %40 = load i32, i32* %39, align 4, !tbaa !56
  %41 = icmp eq i32 %40, %21
  br i1 %41, label %46, label %42

42:                                               ; preds = %36
  %43 = sext i32 %40 to i64
  %44 = getelementptr inbounds i64, i64* %4, i64 %43
  %45 = load i64, i64* %44, align 8, !tbaa !18
  br label %46

46:                                               ; preds = %36, %42
  %47 = phi i64 [ %45, %42 ], [ %5, %36 ]
  %48 = getelementptr inbounds %struct.regmatch_t, %struct.regmatch_t* %1, i64 %28, i32 1
  store i64 %47, i64* %48, align 8
  %49 = icmp eq i64 %37, -1
  %50 = icmp eq i64 %47, -1
  %51 = select i1 %49, i1 true, i1 %50
  br i1 %51, label %52, label %54

52:                                               ; preds = %46
  %53 = bitcast i64* %38 to <2 x i64>*
  store <2 x i64> <i64 -1, i64 -1>, <2 x i64>* %53, align 8, !tbaa !18
  br label %54

54:                                               ; preds = %46, %52
  %55 = add nuw nsw i64 %28, 1
  %56 = icmp eq i64 %28, %25
  br i1 %56, label %26, label %27

57:                                               ; preds = %26, %91
  %58 = phi i64 [ %92, %91 ], [ 0, %26 ]
  %59 = getelementptr inbounds %struct.regmatch_t, %struct.regmatch_t* %1, i64 %58, i32 1
  %60 = getelementptr inbounds %struct.tre_submatch_data, %struct.tre_submatch_data* %13, i64 %58, i32 2
  %61 = load i32*, i32** %60, align 8, !tbaa !57
  %62 = icmp eq i32* %61, null
  br i1 %62, label %91, label %63

63:                                               ; preds = %57
  %64 = load i32, i32* %61, align 4, !tbaa !14
  %65 = icmp sgt i32 %64, -1
  br i1 %65, label %66, label %91

66:                                               ; preds = %63
  %67 = getelementptr inbounds %struct.regmatch_t, %struct.regmatch_t* %1, i64 %58, i32 0
  %68 = load i64, i64* %67, align 8, !tbaa !38
  %69 = bitcast i64* %67 to <2 x i64>*
  br label %70

70:                                               ; preds = %66, %84
  %71 = phi i64 [ %68, %66 ], [ %85, %84 ]
  %72 = phi i32 [ %64, %66 ], [ %89, %84 ]
  %73 = phi i32 [ 0, %66 ], [ %86, %84 ]
  %74 = zext i32 %72 to i64
  %75 = getelementptr inbounds %struct.regmatch_t, %struct.regmatch_t* %1, i64 %74, i32 0
  %76 = load i64, i64* %75, align 8, !tbaa !38
  %77 = icmp slt i64 %71, %76
  br i1 %77, label %83, label %78

78:                                               ; preds = %70
  %79 = load i64, i64* %59, align 8, !tbaa !40
  %80 = getelementptr inbounds %struct.regmatch_t, %struct.regmatch_t* %1, i64 %74, i32 1
  %81 = load i64, i64* %80, align 8, !tbaa !40
  %82 = icmp sgt i64 %79, %81
  br i1 %82, label %83, label %84

83:                                               ; preds = %78, %70
  store <2 x i64> <i64 -1, i64 -1>, <2 x i64>* %69, align 8, !tbaa !18
  br label %84

84:                                               ; preds = %78, %83
  %85 = phi i64 [ %71, %78 ], [ -1, %83 ]
  %86 = add i32 %73, 1
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32* %61, i64 %87
  %89 = load i32, i32* %88, align 4, !tbaa !14
  %90 = icmp sgt i32 %89, -1
  br i1 %90, label %70, label %91

91:                                               ; preds = %84, %63, %57
  %92 = add nuw nsw i64 %58, 1
  %93 = trunc i64 %92 to i32
  %94 = icmp ugt i32 %15, %93
  %95 = and i64 %92, 4294967295
  %96 = icmp ult i64 %95, %0
  %97 = and i1 %94, %96
  br i1 %97, label %57, label %98

98:                                               ; preds = %91
  %99 = and i64 %92, 4294967295
  br label %100

100:                                              ; preds = %11, %98, %26, %6
  %101 = phi i64 [ 0, %6 ], [ 0, %26 ], [ %99, %98 ], [ 0, %11 ]
  %102 = icmp ult i64 %101, %0
  br i1 %102, label %103, label %110

103:                                              ; preds = %100, %103
  %104 = phi i64 [ %108, %103 ], [ %101, %100 ]
  %105 = getelementptr inbounds %struct.regmatch_t, %struct.regmatch_t* %1, i64 %104, i32 0
  %106 = bitcast i64* %105 to <2 x i64>*
  store <2 x i64> <i64 -1, i64 -1>, <2 x i64>* %106, align 8, !tbaa !18
  %107 = add nuw nsw i64 %104, 1
  %108 = and i64 %107, 4294967295
  %109 = icmp ult i64 %108, %0
  br i1 %109, label %103, label %110

110:                                              ; preds = %103, %100
  ret void
}

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden %struct.tre_mem_struct* @__tre_mem_new_impl(i32 noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef, i32 noundef, i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @mbtowc(i32* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @iswalnum(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__tre_mem_destroy(%struct.tre_mem_struct* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @strncmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @iswctype(i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @towlower(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @towupper(i32 noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @tre_neg_char_classes_match(i64* nocapture noundef readonly %0, i32 noundef %1, i32 noundef %2) unnamed_addr #0 {
  %4 = load i64, i64* %0, align 8, !tbaa !18
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %28, label %6

6:                                                ; preds = %3
  %7 = icmp eq i32 %2, 0
  br label %8

8:                                                ; preds = %6, %24
  %9 = phi i64 [ %4, %6 ], [ %26, %24 ]
  %10 = phi i64* [ %0, %6 ], [ %25, %24 ]
  br i1 %7, label %11, label %14

11:                                               ; preds = %8
  %12 = tail call i32 @iswctype(i32 noundef %1, i64 noundef %9) #5
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %24, label %28

14:                                               ; preds = %8
  %15 = tail call i32 @towupper(i32 noundef %1) #5
  %16 = load i64, i64* %10, align 8, !tbaa !18
  %17 = tail call i32 @iswctype(i32 noundef %15, i64 noundef %16) #5
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %28

19:                                               ; preds = %14
  %20 = tail call i32 @towlower(i32 noundef %1) #5
  %21 = load i64, i64* %10, align 8, !tbaa !18
  %22 = tail call i32 @iswctype(i32 noundef %20, i64 noundef %21) #5
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %28

24:                                               ; preds = %11, %19
  %25 = getelementptr inbounds i64, i64* %10, i64 1
  %26 = load i64, i64* %25, align 8, !tbaa !18
  %27 = icmp eq i64 %26, 0
  br i1 %27, label %28, label %8

28:                                               ; preds = %19, %14, %11, %24, %3
  %29 = phi i32 [ 0, %3 ], [ 0, %24 ], [ 1, %11 ], [ 1, %14 ], [ 1, %19 ]
  ret i32 %29
}

; Function Attrs: optsize
declare i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #4

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree norecurse nosync nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nounwind strictfp }
attributes #7 = { nounwind }
attributes #8 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !8, i64 8}
!4 = !{!"re_pattern_buffer", !5, i64 0, !8, i64 8, !6, i64 16, !5, i64 48, !6, i64 56}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!10, !11, i64 88}
!10 = !{!"tnfa", !8, i64 0, !11, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !11, i64 48, !11, i64 52, !8, i64 56, !8, i64 64, !11, i64 72, !11, i64 76, !11, i64 80, !11, i64 84, !11, i64 88, !11, i64 92, !11, i64 96}
!11 = !{!"int", !6, i64 0}
!12 = !{!10, !11, i64 72}
!13 = !{!10, !11, i64 92}
!14 = !{!11, !11, i64 0}
!15 = !{!8, !8, i64 0}
!16 = !{!10, !11, i64 52}
!17 = !{!10, !11, i64 84}
!18 = !{!5, !5, i64 0}
!19 = !{!10, !8, i64 16}
!20 = !{!21, !8, i64 8}
!21 = !{!"tnfa_transition", !11, i64 0, !11, i64 4, !8, i64 8, !11, i64 16, !8, i64 24, !11, i64 32, !6, i64 40, !8, i64 48}
!22 = !{!21, !11, i64 32}
!23 = !{!21, !8, i64 24}
!24 = !{!25, !8, i64 48}
!25 = !{!"tre_backtrack_struct", !26, i64 0, !8, i64 40, !8, i64 48}
!26 = !{!"", !5, i64 0, !8, i64 8, !8, i64 16, !11, i64 24, !11, i64 28, !8, i64 32}
!27 = !{!25, !8, i64 40}
!28 = !{!25, !8, i64 32}
!29 = !{!25, !5, i64 0}
!30 = !{!25, !8, i64 8}
!31 = !{!25, !8, i64 16}
!32 = !{!21, !11, i64 16}
!33 = !{!25, !11, i64 24}
!34 = !{!25, !11, i64 28}
!35 = !{!10, !8, i64 24}
!36 = !{!10, !8, i64 56}
!37 = !{!6, !6, i64 0}
!38 = !{!39, !5, i64 0}
!39 = !{!"", !5, i64 0, !5, i64 8}
!40 = !{!39, !5, i64 8}
!41 = !{!21, !11, i64 0}
!42 = !{!21, !11, i64 4}
!43 = !{!21, !8, i64 48}
!44 = !{!45, !8, i64 8}
!45 = !{!"", !8, i64 0, !8, i64 8}
!46 = !{!47, !5, i64 0}
!47 = !{!"", !5, i64 0, !8, i64 8}
!48 = !{!45, !8, i64 0}
!49 = !{!47, !8, i64 8}
!50 = !{!10, !11, i64 76}
!51 = !{!10, !8, i64 64}
!52 = !{!10, !8, i64 32}
!53 = !{!10, !11, i64 80}
!54 = !{!55, !11, i64 0}
!55 = !{!"tre_submatch_data", !11, i64 0, !11, i64 4, !8, i64 8}
!56 = !{!55, !11, i64 4}
!57 = !{!55, !8, i64 8}
