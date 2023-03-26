; ModuleID = 'src/internal/intscan.c'
source_filename = "src/internal/intscan.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@table = internal unnamed_addr constant [257 x i8] c"\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\00\01\02\03\04\05\06\07\08\09\FF\FF\FF\FF\FF\FF\FF\0A\0B\0C\0D\0E\0F\10\11\12\13\14\15\16\17\18\19\1A\1B\1C\1D\1E\1F !\22#\FF\FF\FF\FF\FF\FF\0A\0B\0C\0D\0E\0F\10\11\12\13\14\15\16\17\18\19\1A\1B\1C\1D\1E\1F !\22#\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF", align 16
@.str = private unnamed_addr constant [9 x i8] c"\00\01\02\04\07\03\06\05\00", align 1

; Function Attrs: nounwind strictfp
define i64 @__intscan(%struct._IO_FILE* noundef %0, i32 noundef %1, i32 noundef %2, i64 noundef %3) local_unnamed_addr #0 {
  %5 = icmp ugt i32 %1, 36
  %6 = icmp eq i32 %1, 1
  %7 = or i1 %5, %6
  br i1 %7, label %11, label %8

8:                                                ; preds = %4
  %9 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  %10 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 25
  br label %13

11:                                               ; preds = %4
  %12 = tail call i32* @___errno_location() #4
  store i32 22, i32* %12, align 4, !tbaa !3
  br label %377

13:                                               ; preds = %25, %8
  %14 = load i8*, i8** %9, align 8, !tbaa !7
  %15 = load i8*, i8** %10, align 8, !tbaa !11
  %16 = icmp eq i8* %14, %15
  br i1 %16, label %21, label %17

17:                                               ; preds = %13
  %18 = getelementptr inbounds i8, i8* %14, i64 1
  store i8* %18, i8** %9, align 8, !tbaa !7
  %19 = load i8, i8* %14, align 1, !tbaa !12
  %20 = zext i8 %19 to i32
  br label %23

21:                                               ; preds = %13
  %22 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #5
  br label %23

23:                                               ; preds = %21, %17
  %24 = phi i32 [ %20, %17 ], [ %22, %21 ]
  switch i32 %24, label %38 [
    i32 32, label %25
    i32 13, label %25
    i32 12, label %25
    i32 11, label %25
    i32 10, label %25
    i32 9, label %25
    i32 45, label %26
    i32 43, label %26
  ]

25:                                               ; preds = %23, %23, %23, %23, %23, %23
  br label %13

26:                                               ; preds = %23, %23
  %27 = icmp eq i32 %24, 45
  %28 = sext i1 %27 to i32
  %29 = load i8*, i8** %9, align 8, !tbaa !7
  %30 = load i8*, i8** %10, align 8, !tbaa !11
  %31 = icmp eq i8* %29, %30
  br i1 %31, label %36, label %32

32:                                               ; preds = %26
  %33 = getelementptr inbounds i8, i8* %29, i64 1
  store i8* %33, i8** %9, align 8, !tbaa !7
  %34 = load i8, i8* %29, align 1, !tbaa !12
  %35 = zext i8 %34 to i32
  br label %38

36:                                               ; preds = %26
  %37 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #5
  br label %38

38:                                               ; preds = %23, %32, %36
  %39 = phi i32 [ %35, %32 ], [ %37, %36 ], [ %24, %23 ]
  %40 = phi i32 [ %28, %32 ], [ %28, %36 ], [ 0, %23 ]
  %41 = icmp eq i32 %1, 0
  %42 = and i32 %1, -17
  %43 = icmp eq i32 %42, 0
  %44 = icmp eq i32 %39, 48
  %45 = select i1 %43, i1 %44, i1 false
  br i1 %45, label %46, label %90

46:                                               ; preds = %38
  %47 = load i8*, i8** %9, align 8, !tbaa !7
  %48 = load i8*, i8** %10, align 8, !tbaa !11
  %49 = icmp eq i8* %47, %48
  br i1 %49, label %54, label %50

50:                                               ; preds = %46
  %51 = getelementptr inbounds i8, i8* %47, i64 1
  store i8* %51, i8** %9, align 8, !tbaa !7
  %52 = load i8, i8* %47, align 1, !tbaa !12
  %53 = zext i8 %52 to i32
  br label %56

54:                                               ; preds = %46
  %55 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #5
  br label %56

56:                                               ; preds = %54, %50
  %57 = phi i32 [ %53, %50 ], [ %55, %54 ]
  %58 = and i32 %57, -33
  %59 = icmp eq i32 %58, 88
  br i1 %59, label %60, label %89

60:                                               ; preds = %56
  %61 = load i8*, i8** %9, align 8, !tbaa !7
  %62 = load i8*, i8** %10, align 8, !tbaa !11
  %63 = icmp eq i8* %61, %62
  br i1 %63, label %68, label %64

64:                                               ; preds = %60
  %65 = getelementptr inbounds i8, i8* %61, i64 1
  store i8* %65, i8** %9, align 8, !tbaa !7
  %66 = load i8, i8* %61, align 1, !tbaa !12
  %67 = zext i8 %66 to i32
  br label %70

68:                                               ; preds = %60
  %69 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #5
  br label %70

70:                                               ; preds = %68, %64
  %71 = phi i32 [ %67, %64 ], [ %69, %68 ]
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i8, i8* getelementptr inbounds ([257 x i8], [257 x i8]* @table, i64 0, i64 1), i64 %72
  %74 = load i8, i8* %73, align 1, !tbaa !12
  %75 = icmp ugt i8 %74, 15
  br i1 %75, label %76, label %172

76:                                               ; preds = %70
  %77 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 26
  %78 = load i64, i64* %77, align 8, !tbaa !13
  %79 = icmp sgt i64 %78, -1
  br i1 %79, label %80, label %84

80:                                               ; preds = %76
  %81 = load i8*, i8** %9, align 8, !tbaa !7
  %82 = getelementptr inbounds i8, i8* %81, i64 -1
  store i8* %82, i8** %9, align 8, !tbaa !7
  %83 = icmp eq i32 %2, 0
  br i1 %83, label %88, label %86

84:                                               ; preds = %76
  %85 = icmp eq i32 %2, 0
  br i1 %85, label %88, label %377

86:                                               ; preds = %80
  %87 = getelementptr inbounds i8, i8* %81, i64 -2
  store i8* %87, i8** %9, align 8, !tbaa !7
  br label %377

88:                                               ; preds = %84, %80
  tail call void @__shlim(%struct._IO_FILE* noundef nonnull %0, i64 noundef 0) #5
  br label %377

89:                                               ; preds = %56
  br i1 %41, label %172, label %106

90:                                               ; preds = %38
  %91 = select i1 %41, i32 10, i32 %1
  %92 = sext i32 %39 to i64
  %93 = getelementptr inbounds i8, i8* getelementptr inbounds ([257 x i8], [257 x i8]* @table, i64 0, i64 1), i64 %92
  %94 = load i8, i8* %93, align 1, !tbaa !12
  %95 = zext i8 %94 to i32
  %96 = icmp ugt i32 %91, %95
  br i1 %96, label %106, label %97

97:                                               ; preds = %90
  %98 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 26
  %99 = load i64, i64* %98, align 8, !tbaa !13
  %100 = icmp sgt i64 %99, -1
  br i1 %100, label %101, label %104

101:                                              ; preds = %97
  %102 = load i8*, i8** %9, align 8, !tbaa !7
  %103 = getelementptr inbounds i8, i8* %102, i64 -1
  store i8* %103, i8** %9, align 8, !tbaa !7
  br label %104

104:                                              ; preds = %97, %101
  tail call void @__shlim(%struct._IO_FILE* noundef nonnull %0, i64 noundef 0) #5
  %105 = tail call i32* @___errno_location() #4
  store i32 22, i32* %105, align 4, !tbaa !3
  br label %377

106:                                              ; preds = %89, %90
  %107 = phi i32 [ %91, %90 ], [ %1, %89 ]
  %108 = phi i32 [ %39, %90 ], [ %57, %89 ]
  %109 = icmp eq i32 %107, 10
  br i1 %109, label %110, label %172

110:                                              ; preds = %106
  %111 = add nsw i32 %108, -48
  %112 = icmp ult i32 %111, 10
  br i1 %112, label %113, label %135

113:                                              ; preds = %110, %127
  %114 = phi i32 [ %129, %127 ], [ %111, %110 ]
  %115 = phi i32 [ %117, %127 ], [ 0, %110 ]
  %116 = mul nuw i32 %115, 10
  %117 = add nuw i32 %116, %114
  %118 = load i8*, i8** %9, align 8, !tbaa !7
  %119 = load i8*, i8** %10, align 8, !tbaa !11
  %120 = icmp eq i8* %118, %119
  br i1 %120, label %125, label %121

121:                                              ; preds = %113
  %122 = getelementptr inbounds i8, i8* %118, i64 1
  store i8* %122, i8** %9, align 8, !tbaa !7
  %123 = load i8, i8* %118, align 1, !tbaa !12
  %124 = zext i8 %123 to i32
  br label %127

125:                                              ; preds = %113
  %126 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #5
  br label %127

127:                                              ; preds = %125, %121
  %128 = phi i32 [ %124, %121 ], [ %126, %125 ]
  %129 = add nsw i32 %128, -48
  %130 = icmp ult i32 %129, 10
  %131 = icmp ult i32 %117, 429496729
  %132 = select i1 %130, i1 %131, i1 false
  br i1 %132, label %113, label %133

133:                                              ; preds = %127
  %134 = zext i32 %117 to i64
  br label %135

135:                                              ; preds = %133, %110
  %136 = phi i32 [ %129, %133 ], [ %111, %110 ]
  %137 = phi i32 [ %128, %133 ], [ %108, %110 ]
  %138 = phi i64 [ %134, %133 ], [ 0, %110 ]
  %139 = icmp ult i32 %136, 10
  br i1 %139, label %140, label %167

140:                                              ; preds = %135
  %141 = zext i32 %136 to i64
  %142 = mul nuw nsw i64 %138, 10
  br label %148

143:                                              ; preds = %161
  %144 = mul nuw i64 %151, 10
  %145 = zext i32 %163 to i64
  %146 = xor i64 %145, -1
  %147 = icmp ugt i64 %144, %146
  br i1 %147, label %319, label %148

148:                                              ; preds = %140, %143
  %149 = phi i64 [ %141, %140 ], [ %145, %143 ]
  %150 = phi i64 [ %142, %140 ], [ %144, %143 ]
  %151 = add i64 %150, %149
  %152 = load i8*, i8** %9, align 8, !tbaa !7
  %153 = load i8*, i8** %10, align 8, !tbaa !11
  %154 = icmp eq i8* %152, %153
  br i1 %154, label %159, label %155

155:                                              ; preds = %148
  %156 = getelementptr inbounds i8, i8* %152, i64 1
  store i8* %156, i8** %9, align 8, !tbaa !7
  %157 = load i8, i8* %152, align 1, !tbaa !12
  %158 = zext i8 %157 to i32
  br label %161

159:                                              ; preds = %148
  %160 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #5
  br label %161

161:                                              ; preds = %159, %155
  %162 = phi i32 [ %158, %155 ], [ %160, %159 ]
  %163 = add nsw i32 %162, -48
  %164 = icmp ult i32 %163, 10
  %165 = icmp ult i64 %151, 1844674407370955162
  %166 = select i1 %164, i1 %165, i1 false
  br i1 %166, label %143, label %167

167:                                              ; preds = %161, %135
  %168 = phi i32 [ %137, %135 ], [ %162, %161 ]
  %169 = phi i64 [ %138, %135 ], [ %151, %161 ]
  %170 = phi i32 [ %136, %135 ], [ %163, %161 ]
  %171 = icmp ugt i32 %170, 9
  br i1 %171, label %350, label %319

172:                                              ; preds = %89, %70, %106
  %173 = phi i32 [ %108, %106 ], [ %71, %70 ], [ %57, %89 ]
  %174 = phi i32 [ %107, %106 ], [ 16, %70 ], [ 8, %89 ]
  %175 = tail call i32 @llvm.ctpop.i32(i32 %174), !range !14
  %176 = icmp ult i32 %175, 2
  br i1 %176, label %183, label %177

177:                                              ; preds = %172
  %178 = sext i32 %173 to i64
  %179 = getelementptr inbounds i8, i8* getelementptr inbounds ([257 x i8], [257 x i8]* @table, i64 0, i64 1), i64 %178
  %180 = load i8, i8* %179, align 1, !tbaa !12
  %181 = zext i8 %180 to i32
  %182 = icmp ugt i32 %174, %181
  br i1 %182, label %256, label %282

183:                                              ; preds = %172
  %184 = mul i32 %174, 23
  %185 = lshr i32 %184, 5
  %186 = and i32 %185, 7
  %187 = zext i32 %186 to i64
  %188 = getelementptr inbounds [9 x i8], [9 x i8]* @.str, i64 0, i64 %187
  %189 = load i8, i8* %188, align 1, !tbaa !12
  %190 = sext i8 %189 to i32
  %191 = sext i32 %173 to i64
  %192 = getelementptr inbounds i8, i8* getelementptr inbounds ([257 x i8], [257 x i8]* @table, i64 0, i64 1), i64 %191
  %193 = load i8, i8* %192, align 1, !tbaa !12
  %194 = zext i8 %193 to i32
  %195 = icmp ugt i32 %174, %194
  br i1 %195, label %196, label %222

196:                                              ; preds = %183, %210
  %197 = phi i32 [ %215, %210 ], [ %194, %183 ]
  %198 = phi i32 [ %200, %210 ], [ 0, %183 ]
  %199 = shl i32 %198, %190
  %200 = or i32 %197, %199
  %201 = load i8*, i8** %9, align 8, !tbaa !7
  %202 = load i8*, i8** %10, align 8, !tbaa !11
  %203 = icmp eq i8* %201, %202
  br i1 %203, label %208, label %204

204:                                              ; preds = %196
  %205 = getelementptr inbounds i8, i8* %201, i64 1
  store i8* %205, i8** %9, align 8, !tbaa !7
  %206 = load i8, i8* %201, align 1, !tbaa !12
  %207 = zext i8 %206 to i32
  br label %210

208:                                              ; preds = %196
  %209 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #5
  br label %210

210:                                              ; preds = %208, %204
  %211 = phi i32 [ %207, %204 ], [ %209, %208 ]
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds i8, i8* getelementptr inbounds ([257 x i8], [257 x i8]* @table, i64 0, i64 1), i64 %212
  %214 = load i8, i8* %213, align 1, !tbaa !12
  %215 = zext i8 %214 to i32
  %216 = icmp ugt i32 %174, %215
  %217 = icmp ult i32 %200, 134217728
  %218 = select i1 %216, i1 %217, i1 false
  br i1 %218, label %196, label %219

219:                                              ; preds = %210
  %220 = zext i8 %214 to i32
  %221 = zext i32 %200 to i64
  br label %222

222:                                              ; preds = %219, %183
  %223 = phi i32 [ %220, %219 ], [ %194, %183 ]
  %224 = phi i8 [ %214, %219 ], [ %193, %183 ]
  %225 = phi i32 [ %211, %219 ], [ %173, %183 ]
  %226 = phi i64 [ %221, %219 ], [ 0, %183 ]
  %227 = zext i32 %190 to i64
  %228 = lshr i64 -1, %227
  %229 = icmp ugt i32 %174, %223
  %230 = icmp uge i64 %228, %226
  %231 = select i1 %229, i1 %230, i1 false
  br i1 %231, label %232, label %319

232:                                              ; preds = %222, %247
  %233 = phi i8 [ %251, %247 ], [ %224, %222 ]
  %234 = phi i64 [ %237, %247 ], [ %226, %222 ]
  %235 = shl i64 %234, %227
  %236 = zext i8 %233 to i64
  %237 = or i64 %235, %236
  %238 = load i8*, i8** %9, align 8, !tbaa !7
  %239 = load i8*, i8** %10, align 8, !tbaa !11
  %240 = icmp eq i8* %238, %239
  br i1 %240, label %245, label %241

241:                                              ; preds = %232
  %242 = getelementptr inbounds i8, i8* %238, i64 1
  store i8* %242, i8** %9, align 8, !tbaa !7
  %243 = load i8, i8* %238, align 1, !tbaa !12
  %244 = zext i8 %243 to i32
  br label %247

245:                                              ; preds = %232
  %246 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #5
  br label %247

247:                                              ; preds = %245, %241
  %248 = phi i32 [ %244, %241 ], [ %246, %245 ]
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds i8, i8* getelementptr inbounds ([257 x i8], [257 x i8]* @table, i64 0, i64 1), i64 %249
  %251 = load i8, i8* %250, align 1, !tbaa !12
  %252 = zext i8 %251 to i32
  %253 = icmp ugt i32 %174, %252
  %254 = icmp ule i64 %237, %228
  %255 = select i1 %253, i1 %254, i1 false
  br i1 %255, label %232, label %319

256:                                              ; preds = %177, %270
  %257 = phi i32 [ %275, %270 ], [ %181, %177 ]
  %258 = phi i32 [ %260, %270 ], [ 0, %177 ]
  %259 = mul i32 %258, %174
  %260 = add i32 %257, %259
  %261 = load i8*, i8** %9, align 8, !tbaa !7
  %262 = load i8*, i8** %10, align 8, !tbaa !11
  %263 = icmp eq i8* %261, %262
  br i1 %263, label %268, label %264

264:                                              ; preds = %256
  %265 = getelementptr inbounds i8, i8* %261, i64 1
  store i8* %265, i8** %9, align 8, !tbaa !7
  %266 = load i8, i8* %261, align 1, !tbaa !12
  %267 = zext i8 %266 to i32
  br label %270

268:                                              ; preds = %256
  %269 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #5
  br label %270

270:                                              ; preds = %268, %264
  %271 = phi i32 [ %267, %264 ], [ %269, %268 ]
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds i8, i8* getelementptr inbounds ([257 x i8], [257 x i8]* @table, i64 0, i64 1), i64 %272
  %274 = load i8, i8* %273, align 1, !tbaa !12
  %275 = zext i8 %274 to i32
  %276 = icmp ugt i32 %174, %275
  %277 = icmp ult i32 %260, 119304647
  %278 = select i1 %276, i1 %277, i1 false
  br i1 %278, label %256, label %279

279:                                              ; preds = %270
  %280 = zext i8 %274 to i32
  %281 = zext i32 %260 to i64
  br label %282

282:                                              ; preds = %279, %177
  %283 = phi i32 [ %280, %279 ], [ %181, %177 ]
  %284 = phi i8 [ %274, %279 ], [ %180, %177 ]
  %285 = phi i32 [ %271, %279 ], [ %173, %177 ]
  %286 = phi i64 [ %281, %279 ], [ 0, %177 ]
  %287 = icmp ugt i32 %174, %283
  br i1 %287, label %288, label %319

288:                                              ; preds = %282
  %289 = zext i32 %174 to i64
  br label %293

290:                                              ; preds = %312
  %291 = tail call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %289, i64 %302)
  %292 = extractvalue { i64, i1 } %291, 1
  br i1 %292, label %319, label %293

293:                                              ; preds = %288, %290
  %294 = phi i32 [ %285, %288 ], [ %313, %290 ]
  %295 = phi i64 [ %286, %288 ], [ %302, %290 ]
  %296 = phi i8 [ %284, %288 ], [ %316, %290 ]
  %297 = mul i64 %295, %289
  %298 = zext i8 %296 to i64
  %299 = xor i64 %298, -1
  %300 = icmp ugt i64 %297, %299
  br i1 %300, label %319, label %301

301:                                              ; preds = %293
  %302 = add i64 %297, %298
  %303 = load i8*, i8** %9, align 8, !tbaa !7
  %304 = load i8*, i8** %10, align 8, !tbaa !11
  %305 = icmp eq i8* %303, %304
  br i1 %305, label %310, label %306

306:                                              ; preds = %301
  %307 = getelementptr inbounds i8, i8* %303, i64 1
  store i8* %307, i8** %9, align 8, !tbaa !7
  %308 = load i8, i8* %303, align 1, !tbaa !12
  %309 = zext i8 %308 to i32
  br label %312

310:                                              ; preds = %301
  %311 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #5
  br label %312

312:                                              ; preds = %310, %306
  %313 = phi i32 [ %309, %306 ], [ %311, %310 ]
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds i8, i8* getelementptr inbounds ([257 x i8], [257 x i8]* @table, i64 0, i64 1), i64 %314
  %316 = load i8, i8* %315, align 1, !tbaa !12
  %317 = zext i8 %316 to i32
  %318 = icmp ugt i32 %174, %317
  br i1 %318, label %290, label %319

319:                                              ; preds = %143, %312, %290, %293, %247, %282, %222, %167
  %320 = phi i32 [ 10, %167 ], [ %174, %222 ], [ %174, %282 ], [ %174, %247 ], [ %174, %293 ], [ %174, %290 ], [ %174, %312 ], [ 10, %143 ]
  %321 = phi i32 [ %168, %167 ], [ %225, %222 ], [ %285, %282 ], [ %248, %247 ], [ %313, %312 ], [ %313, %290 ], [ %294, %293 ], [ %162, %143 ]
  %322 = phi i64 [ %169, %167 ], [ %226, %222 ], [ %286, %282 ], [ %237, %247 ], [ %302, %312 ], [ %302, %290 ], [ %295, %293 ], [ %151, %143 ]
  %323 = sext i32 %321 to i64
  %324 = getelementptr inbounds i8, i8* getelementptr inbounds ([257 x i8], [257 x i8]* @table, i64 0, i64 1), i64 %323
  %325 = load i8, i8* %324, align 1, !tbaa !12
  %326 = zext i8 %325 to i32
  %327 = icmp ugt i32 %320, %326
  br i1 %327, label %328, label %350

328:                                              ; preds = %319, %338
  %329 = load i8*, i8** %9, align 8, !tbaa !7
  %330 = load i8*, i8** %10, align 8, !tbaa !11
  %331 = icmp eq i8* %329, %330
  br i1 %331, label %336, label %332

332:                                              ; preds = %328
  %333 = getelementptr inbounds i8, i8* %329, i64 1
  store i8* %333, i8** %9, align 8, !tbaa !7
  %334 = load i8, i8* %329, align 1, !tbaa !12
  %335 = zext i8 %334 to i32
  br label %338

336:                                              ; preds = %328
  %337 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #5
  br label %338

338:                                              ; preds = %336, %332
  %339 = phi i32 [ %335, %332 ], [ %337, %336 ]
  %340 = sext i32 %339 to i64
  %341 = getelementptr inbounds i8, i8* getelementptr inbounds ([257 x i8], [257 x i8]* @table, i64 0, i64 1), i64 %340
  %342 = load i8, i8* %341, align 1, !tbaa !12
  %343 = zext i8 %342 to i32
  %344 = icmp ugt i32 %320, %343
  br i1 %344, label %328, label %345

345:                                              ; preds = %338
  %346 = tail call i32* @___errno_location() #4
  store i32 34, i32* %346, align 4, !tbaa !3
  %347 = and i64 %3, 1
  %348 = icmp eq i64 %347, 0
  %349 = select i1 %348, i32 %40, i32 0
  br label %350

350:                                              ; preds = %345, %319, %167
  %351 = phi i32 [ %40, %167 ], [ %40, %319 ], [ %349, %345 ]
  %352 = phi i64 [ %169, %167 ], [ %322, %319 ], [ %3, %345 ]
  %353 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 26
  %354 = load i64, i64* %353, align 8, !tbaa !13
  %355 = icmp sgt i64 %354, -1
  br i1 %355, label %356, label %359

356:                                              ; preds = %350
  %357 = load i8*, i8** %9, align 8, !tbaa !7
  %358 = getelementptr inbounds i8, i8* %357, i64 -1
  store i8* %358, i8** %9, align 8, !tbaa !7
  br label %359

359:                                              ; preds = %350, %356
  %360 = icmp ult i64 %352, %3
  br i1 %360, label %373, label %361

361:                                              ; preds = %359
  %362 = and i64 %3, 1
  %363 = icmp ne i64 %362, 0
  %364 = icmp ne i32 %351, 0
  %365 = or i1 %363, %364
  br i1 %365, label %369, label %366

366:                                              ; preds = %361
  %367 = tail call i32* @___errno_location() #4
  store i32 34, i32* %367, align 4, !tbaa !3
  %368 = add i64 %3, -1
  br label %377

369:                                              ; preds = %361
  %370 = icmp ugt i64 %352, %3
  br i1 %370, label %371, label %373

371:                                              ; preds = %369
  %372 = tail call i32* @___errno_location() #4
  store i32 34, i32* %372, align 4, !tbaa !3
  br label %377

373:                                              ; preds = %369, %359
  %374 = sext i32 %351 to i64
  %375 = xor i64 %352, %374
  %376 = sub i64 %375, %374
  br label %377

377:                                              ; preds = %84, %88, %86, %373, %371, %366, %104, %11
  %378 = phi i64 [ 0, %11 ], [ %3, %371 ], [ %376, %373 ], [ %368, %366 ], [ 0, %104 ], [ 0, %86 ], [ 0, %88 ], [ 0, %84 ]
  ret i64 %378
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #1

declare hidden i32 @__shgetc(%struct._IO_FILE* noundef) local_unnamed_addr #2

declare hidden void @__shlim(%struct._IO_FILE* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #3

attributes #0 = { nounwind strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nobuiltin nounwind readnone strictfp willreturn "no-builtins" }
attributes #5 = { nobuiltin nounwind strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !9, i64 8}
!8 = !{!"_IO_FILE", !4, i64 0, !9, i64 8, !9, i64 16, !9, i64 24, !9, i64 32, !9, i64 40, !9, i64 48, !9, i64 56, !9, i64 64, !9, i64 72, !9, i64 80, !9, i64 88, !10, i64 96, !9, i64 104, !9, i64 112, !4, i64 120, !4, i64 124, !10, i64 128, !4, i64 136, !4, i64 140, !4, i64 144, !9, i64 152, !10, i64 160, !9, i64 168, !9, i64 176, !9, i64 184, !10, i64 192, !10, i64 200, !9, i64 208, !9, i64 216, !9, i64 224}
!9 = !{!"any pointer", !5, i64 0}
!10 = !{!"long", !5, i64 0}
!11 = !{!8, !9, i64 184}
!12 = !{!5, !5, i64 0}
!13 = !{!8, !10, i64 192}
!14 = !{i32 0, i32 33}
