; ModuleID = 'src/internal/floatscan.c'
source_filename = "src/internal/floatscan.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@decfloat.p10s = internal unnamed_addr constant [8 x i32] [i32 10, i32 100, i32 1000, i32 10000, i32 100000, i32 1000000, i32 10000000, i32 100000000], align 16

; Function Attrs: nounwind strictfp
define hidden x86_fp80 @__floatscan(%struct._IO_FILE* noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = alloca [2048 x i32], align 16
  switch i32 %1, label %7 [
    i32 0, label %9
    i32 1, label %5
    i32 2, label %6
  ]

5:                                                ; preds = %3
  br label %9

6:                                                ; preds = %3
  br label %9

7:                                                ; preds = %3
  %8 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %1029

9:                                                ; preds = %3, %6, %5
  %10 = phi i1 [ false, %3 ], [ true, %6 ], [ true, %5 ]
  %11 = phi i32 [ 24, %3 ], [ 64, %6 ], [ 53, %5 ]
  %12 = phi i32 [ -149, %3 ], [ -16445, %6 ], [ -1074, %5 ]
  %13 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  %14 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 25
  br label %15

15:                                               ; preds = %27, %9
  %16 = load i8*, i8** %13, align 8, !tbaa !3
  %17 = load i8*, i8** %14, align 8, !tbaa !10
  %18 = icmp eq i8* %16, %17
  br i1 %18, label %23, label %19

19:                                               ; preds = %15
  %20 = getelementptr inbounds i8, i8* %16, i64 1
  store i8* %20, i8** %13, align 8, !tbaa !3
  %21 = load i8, i8* %16, align 1, !tbaa !11
  %22 = zext i8 %21 to i32
  br label %25

23:                                               ; preds = %15
  %24 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %25

25:                                               ; preds = %23, %19
  %26 = phi i32 [ %22, %19 ], [ %24, %23 ]
  switch i32 %26, label %40 [
    i32 32, label %27
    i32 13, label %27
    i32 12, label %27
    i32 11, label %27
    i32 10, label %27
    i32 9, label %27
    i32 45, label %28
    i32 43, label %28
  ]

27:                                               ; preds = %25, %25, %25, %25, %25, %25
  br label %15

28:                                               ; preds = %25, %25
  %29 = icmp eq i32 %26, 45
  %30 = select i1 %29, i32 -1, i32 1
  %31 = load i8*, i8** %13, align 8, !tbaa !3
  %32 = load i8*, i8** %14, align 8, !tbaa !10
  %33 = icmp eq i8* %31, %32
  br i1 %33, label %38, label %34

34:                                               ; preds = %28
  %35 = getelementptr inbounds i8, i8* %31, i64 1
  store i8* %35, i8** %13, align 8, !tbaa !3
  %36 = load i8, i8* %31, align 1, !tbaa !11
  %37 = zext i8 %36 to i32
  br label %40

38:                                               ; preds = %28
  %39 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %40

40:                                               ; preds = %25, %34, %38
  %41 = phi i32 [ %30, %38 ], [ %30, %34 ], [ 1, %25 ]
  %42 = phi i32 [ %39, %38 ], [ %37, %34 ], [ %26, %25 ]
  %43 = and i32 %42, -33
  %44 = icmp eq i32 %43, 73
  br i1 %44, label %45, label %164

45:                                               ; preds = %40
  %46 = load i8*, i8** %13, align 8, !tbaa !3
  %47 = load i8*, i8** %14, align 8, !tbaa !10
  %48 = icmp eq i8* %46, %47
  br i1 %48, label %53, label %49

49:                                               ; preds = %45
  %50 = getelementptr inbounds i8, i8* %46, i64 1
  store i8* %50, i8** %13, align 8, !tbaa !3
  %51 = load i8, i8* %46, align 1, !tbaa !11
  %52 = zext i8 %51 to i32
  br label %55

53:                                               ; preds = %45
  %54 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %55

55:                                               ; preds = %49, %53
  %56 = phi i32 [ %52, %49 ], [ %54, %53 ]
  %57 = and i32 %56, -33
  %58 = icmp eq i32 %57, 78
  br i1 %58, label %59, label %268

59:                                               ; preds = %55
  %60 = load i8*, i8** %13, align 8, !tbaa !3
  %61 = load i8*, i8** %14, align 8, !tbaa !10
  %62 = icmp eq i8* %60, %61
  br i1 %62, label %67, label %63

63:                                               ; preds = %59
  %64 = getelementptr inbounds i8, i8* %60, i64 1
  store i8* %64, i8** %13, align 8, !tbaa !3
  %65 = load i8, i8* %60, align 1, !tbaa !11
  %66 = zext i8 %65 to i32
  br label %69

67:                                               ; preds = %59
  %68 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %69

69:                                               ; preds = %67, %63
  %70 = phi i32 [ %66, %63 ], [ %68, %67 ]
  %71 = and i32 %70, -33
  %72 = icmp eq i32 %71, 70
  br i1 %72, label %73, label %268

73:                                               ; preds = %69
  %74 = load i8*, i8** %13, align 8, !tbaa !3
  %75 = load i8*, i8** %14, align 8, !tbaa !10
  %76 = icmp eq i8* %74, %75
  br i1 %76, label %81, label %77

77:                                               ; preds = %73
  %78 = getelementptr inbounds i8, i8* %74, i64 1
  store i8* %78, i8** %13, align 8, !tbaa !3
  %79 = load i8, i8* %74, align 1, !tbaa !11
  %80 = zext i8 %79 to i32
  br label %83

81:                                               ; preds = %73
  %82 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %83

83:                                               ; preds = %81, %77
  %84 = phi i32 [ %80, %77 ], [ %82, %81 ]
  %85 = and i32 %84, -33
  %86 = icmp eq i32 %85, 73
  br i1 %86, label %87, label %146

87:                                               ; preds = %83
  %88 = load i8*, i8** %13, align 8, !tbaa !3
  %89 = load i8*, i8** %14, align 8, !tbaa !10
  %90 = icmp eq i8* %88, %89
  br i1 %90, label %95, label %91

91:                                               ; preds = %87
  %92 = getelementptr inbounds i8, i8* %88, i64 1
  store i8* %92, i8** %13, align 8, !tbaa !3
  %93 = load i8, i8* %88, align 1, !tbaa !11
  %94 = zext i8 %93 to i32
  br label %97

95:                                               ; preds = %87
  %96 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %97

97:                                               ; preds = %95, %91
  %98 = phi i32 [ %94, %91 ], [ %96, %95 ]
  %99 = and i32 %98, -33
  %100 = icmp eq i32 %99, 78
  br i1 %100, label %101, label %143

101:                                              ; preds = %97
  %102 = load i8*, i8** %13, align 8, !tbaa !3
  %103 = load i8*, i8** %14, align 8, !tbaa !10
  %104 = icmp eq i8* %102, %103
  br i1 %104, label %109, label %105

105:                                              ; preds = %101
  %106 = getelementptr inbounds i8, i8* %102, i64 1
  store i8* %106, i8** %13, align 8, !tbaa !3
  %107 = load i8, i8* %102, align 1, !tbaa !11
  %108 = zext i8 %107 to i32
  br label %111

109:                                              ; preds = %101
  %110 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %111

111:                                              ; preds = %109, %105
  %112 = phi i32 [ %108, %105 ], [ %110, %109 ]
  %113 = and i32 %112, -33
  %114 = icmp eq i32 %113, 73
  br i1 %114, label %115, label %143

115:                                              ; preds = %111
  %116 = load i8*, i8** %13, align 8, !tbaa !3
  %117 = load i8*, i8** %14, align 8, !tbaa !10
  %118 = icmp eq i8* %116, %117
  br i1 %118, label %123, label %119

119:                                              ; preds = %115
  %120 = getelementptr inbounds i8, i8* %116, i64 1
  store i8* %120, i8** %13, align 8, !tbaa !3
  %121 = load i8, i8* %116, align 1, !tbaa !11
  %122 = zext i8 %121 to i32
  br label %125

123:                                              ; preds = %115
  %124 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %125

125:                                              ; preds = %123, %119
  %126 = phi i32 [ %122, %119 ], [ %124, %123 ]
  %127 = and i32 %126, -33
  %128 = icmp eq i32 %127, 84
  br i1 %128, label %129, label %143

129:                                              ; preds = %125
  %130 = load i8*, i8** %13, align 8, !tbaa !3
  %131 = load i8*, i8** %14, align 8, !tbaa !10
  %132 = icmp eq i8* %130, %131
  br i1 %132, label %137, label %133

133:                                              ; preds = %129
  %134 = getelementptr inbounds i8, i8* %130, i64 1
  store i8* %134, i8** %13, align 8, !tbaa !3
  %135 = load i8, i8* %130, align 1, !tbaa !11
  %136 = zext i8 %135 to i32
  br label %139

137:                                              ; preds = %129
  %138 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %139

139:                                              ; preds = %137, %133
  %140 = phi i32 [ %136, %133 ], [ %138, %137 ]
  %141 = and i32 %140, -33
  %142 = icmp eq i32 %141, 89
  br i1 %142, label %160, label %143

143:                                              ; preds = %139, %125, %111, %97
  %144 = phi i64 [ -4, %97 ], [ -5, %111 ], [ -6, %125 ], [ -7, %139 ]
  %145 = icmp eq i32 %2, 0
  br i1 %145, label %268, label %146

146:                                              ; preds = %143, %83
  %147 = phi i64 [ -3, %83 ], [ %144, %143 ]
  %148 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 26
  %149 = load i64, i64* %148, align 8, !tbaa !12
  %150 = icmp sgt i64 %149, -1
  br i1 %150, label %151, label %160

151:                                              ; preds = %146
  %152 = load i8*, i8** %13, align 8, !tbaa !3
  %153 = getelementptr inbounds i8, i8* %152, i64 -1
  store i8* %153, i8** %13, align 8, !tbaa !3
  %154 = icmp ne i32 %2, 0
  %155 = and i1 %154, %86
  br i1 %155, label %156, label %160

156:                                              ; preds = %151
  %157 = load i8*, i8** %13, align 8, !tbaa !3
  %158 = add nsw i64 %147, 3
  %159 = getelementptr i8, i8* %157, i64 %158
  store i8* %159, i8** %13, align 8, !tbaa !3
  br label %160

160:                                              ; preds = %146, %139, %156, %151
  %161 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %162 = tail call float @llvm.experimental.constrained.fmul.f32(float %161, float 0x7FF0000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %163 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float %162, metadata !"fpexcept.ignore") #6
  br label %1029

164:                                              ; preds = %40
  %165 = icmp eq i32 %2, 0
  %166 = and i32 %42, -33
  %167 = icmp eq i32 %166, 78
  br i1 %167, label %168, label %278

168:                                              ; preds = %164
  %169 = load i8*, i8** %13, align 8, !tbaa !3
  %170 = load i8*, i8** %14, align 8, !tbaa !10
  %171 = icmp eq i8* %169, %170
  br i1 %171, label %176, label %172

172:                                              ; preds = %168
  %173 = getelementptr inbounds i8, i8* %169, i64 1
  store i8* %173, i8** %13, align 8, !tbaa !3
  %174 = load i8, i8* %169, align 1, !tbaa !11
  %175 = zext i8 %174 to i32
  br label %178

176:                                              ; preds = %168
  %177 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %178

178:                                              ; preds = %172, %176
  %179 = phi i32 [ %175, %172 ], [ %177, %176 ]
  %180 = and i32 %179, -33
  %181 = icmp eq i32 %180, 65
  br i1 %181, label %182, label %268

182:                                              ; preds = %178
  %183 = load i8*, i8** %13, align 8, !tbaa !3
  %184 = load i8*, i8** %14, align 8, !tbaa !10
  %185 = icmp eq i8* %183, %184
  br i1 %185, label %190, label %186

186:                                              ; preds = %182
  %187 = getelementptr inbounds i8, i8* %183, i64 1
  store i8* %187, i8** %13, align 8, !tbaa !3
  %188 = load i8, i8* %183, align 1, !tbaa !11
  %189 = zext i8 %188 to i32
  br label %192

190:                                              ; preds = %182
  %191 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %192

192:                                              ; preds = %190, %186
  %193 = phi i32 [ %189, %186 ], [ %191, %190 ]
  %194 = and i32 %193, -33
  %195 = icmp eq i32 %194, 78
  br i1 %195, label %196, label %268

196:                                              ; preds = %192
  %197 = load i8*, i8** %13, align 8, !tbaa !3
  %198 = load i8*, i8** %14, align 8, !tbaa !10
  %199 = icmp eq i8* %197, %198
  br i1 %199, label %204, label %200

200:                                              ; preds = %196
  %201 = getelementptr inbounds i8, i8* %197, i64 1
  store i8* %201, i8** %13, align 8, !tbaa !3
  %202 = load i8, i8* %197, align 1, !tbaa !11
  %203 = zext i8 %202 to i32
  br label %206

204:                                              ; preds = %196
  %205 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %206

206:                                              ; preds = %204, %200
  %207 = phi i32 [ %203, %200 ], [ %205, %204 ]
  %208 = icmp eq i32 %207, 40
  br i1 %208, label %218, label %209

209:                                              ; preds = %206
  %210 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 26
  %211 = load i64, i64* %210, align 8, !tbaa !12
  %212 = icmp sgt i64 %211, -1
  br i1 %212, label %213, label %216

213:                                              ; preds = %209
  %214 = load i8*, i8** %13, align 8, !tbaa !3
  %215 = getelementptr inbounds i8, i8* %214, i64 -1
  store i8* %215, i8** %13, align 8, !tbaa !3
  br label %216

216:                                              ; preds = %209, %213
  %217 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float 0x7FF8000000000000, metadata !"fpexcept.ignore") #6
  br label %1029

218:                                              ; preds = %206, %266
  %219 = phi i64 [ %267, %266 ], [ 1, %206 ]
  %220 = load i8*, i8** %13, align 8, !tbaa !3
  %221 = load i8*, i8** %14, align 8, !tbaa !10
  %222 = icmp eq i8* %220, %221
  br i1 %222, label %227, label %223

223:                                              ; preds = %218
  %224 = getelementptr inbounds i8, i8* %220, i64 1
  store i8* %224, i8** %13, align 8, !tbaa !3
  %225 = load i8, i8* %220, align 1, !tbaa !11
  %226 = zext i8 %225 to i32
  br label %229

227:                                              ; preds = %218
  %228 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %229

229:                                              ; preds = %227, %223
  %230 = phi i32 [ %226, %223 ], [ %228, %227 ]
  %231 = add nsw i32 %230, -48
  %232 = icmp ult i32 %231, 10
  %233 = add nsw i32 %230, -65
  %234 = icmp ult i32 %233, 26
  %235 = select i1 %232, i1 true, i1 %234
  br i1 %235, label %266, label %236

236:                                              ; preds = %229
  %237 = add nsw i32 %230, -97
  %238 = icmp ult i32 %237, 26
  %239 = icmp eq i32 %230, 95
  %240 = or i1 %239, %238
  br i1 %240, label %266, label %241

241:                                              ; preds = %236
  %242 = icmp eq i32 %230, 41
  br i1 %242, label %243, label %245

243:                                              ; preds = %241
  %244 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float 0x7FF8000000000000, metadata !"fpexcept.ignore") #6
  br label %1029

245:                                              ; preds = %241
  %246 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 26
  %247 = load i64, i64* %246, align 8, !tbaa !12
  %248 = icmp sgt i64 %247, -1
  br i1 %248, label %249, label %252

249:                                              ; preds = %245
  %250 = load i8*, i8** %13, align 8, !tbaa !3
  %251 = getelementptr inbounds i8, i8* %250, i64 -1
  store i8* %251, i8** %13, align 8, !tbaa !3
  br label %252

252:                                              ; preds = %245, %249
  br i1 %165, label %261, label %253

253:                                              ; preds = %252
  %254 = icmp eq i64 %219, 0
  %255 = xor i1 %248, true
  %256 = select i1 %254, i1 true, i1 %255
  br i1 %256, label %264, label %257

257:                                              ; preds = %253
  %258 = load i8*, i8** %13, align 8, !tbaa !3
  %259 = sub i64 0, %219
  %260 = getelementptr i8, i8* %258, i64 %259
  store i8* %260, i8** %13, align 8, !tbaa !3
  br label %264

261:                                              ; preds = %252
  %262 = tail call i32* @___errno_location() #8
  store i32 22, i32* %262, align 4, !tbaa !13
  tail call void @__shlim(%struct._IO_FILE* noundef nonnull %0, i64 noundef 0) #7
  %263 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %1029

264:                                              ; preds = %253, %257
  %265 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float 0x7FF8000000000000, metadata !"fpexcept.ignore") #6
  br label %1029

266:                                              ; preds = %229, %236
  %267 = add i64 %219, 1
  br label %218

268:                                              ; preds = %143, %69, %55, %192, %178
  %269 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 26
  %270 = load i64, i64* %269, align 8, !tbaa !12
  %271 = icmp sgt i64 %270, -1
  br i1 %271, label %272, label %275

272:                                              ; preds = %268
  %273 = load i8*, i8** %13, align 8, !tbaa !3
  %274 = getelementptr inbounds i8, i8* %273, i64 -1
  store i8* %274, i8** %13, align 8, !tbaa !3
  br label %275

275:                                              ; preds = %268, %272
  %276 = tail call i32* @___errno_location() #8
  store i32 22, i32* %276, align 4, !tbaa !13
  tail call void @__shlim(%struct._IO_FILE* noundef nonnull %0, i64 noundef 0) #7
  %277 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %1029

278:                                              ; preds = %164
  %279 = icmp eq i32 %42, 48
  br i1 %279, label %280, label %303

280:                                              ; preds = %278
  %281 = load i8*, i8** %13, align 8, !tbaa !3
  %282 = load i8*, i8** %14, align 8, !tbaa !10
  %283 = icmp eq i8* %281, %282
  br i1 %283, label %288, label %284

284:                                              ; preds = %280
  %285 = getelementptr inbounds i8, i8* %281, i64 1
  store i8* %285, i8** %13, align 8, !tbaa !3
  %286 = load i8, i8* %281, align 1, !tbaa !11
  %287 = zext i8 %286 to i32
  br label %290

288:                                              ; preds = %280
  %289 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %290

290:                                              ; preds = %288, %284
  %291 = phi i32 [ %287, %284 ], [ %289, %288 ]
  %292 = and i32 %291, -33
  %293 = icmp eq i32 %292, 88
  br i1 %293, label %294, label %296

294:                                              ; preds = %290
  %295 = tail call fastcc x86_fp80 @hexfloat(%struct._IO_FILE* noundef nonnull %0, i32 noundef %11, i32 noundef %12, i32 noundef %41, i32 noundef %2) #9
  br label %1029

296:                                              ; preds = %290
  %297 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 26
  %298 = load i64, i64* %297, align 8, !tbaa !12
  %299 = icmp sgt i64 %298, -1
  br i1 %299, label %300, label %303

300:                                              ; preds = %296
  %301 = load i8*, i8** %13, align 8, !tbaa !3
  %302 = getelementptr inbounds i8, i8* %301, i64 -1
  store i8* %302, i8** %13, align 8, !tbaa !3
  br label %303

303:                                              ; preds = %300, %296, %278
  %304 = bitcast [2048 x i32]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8192, i8* nonnull %304) #10
  %305 = add nsw i32 %12, %11
  %306 = sub nsw i32 0, %305
  %307 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %308 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  br label %309

309:                                              ; preds = %322, %303
  %310 = phi i32 [ 0, %303 ], [ 1, %322 ]
  %311 = phi i32 [ %42, %303 ], [ %323, %322 ]
  switch i32 %311, label %352 [
    i32 48, label %312
    i32 46, label %324
  ]

312:                                              ; preds = %309
  %313 = load i8*, i8** %13, align 8, !tbaa !3
  %314 = load i8*, i8** %14, align 8, !tbaa !10
  %315 = icmp eq i8* %313, %314
  br i1 %315, label %320, label %316

316:                                              ; preds = %312
  %317 = getelementptr inbounds i8, i8* %313, i64 1
  store i8* %317, i8** %13, align 8, !tbaa !3
  %318 = load i8, i8* %313, align 1, !tbaa !11
  %319 = zext i8 %318 to i32
  br label %322

320:                                              ; preds = %312
  %321 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %322

322:                                              ; preds = %320, %316
  %323 = phi i32 [ %321, %320 ], [ %319, %316 ]
  br label %309

324:                                              ; preds = %309
  %325 = load i8*, i8** %13, align 8, !tbaa !3
  %326 = load i8*, i8** %14, align 8, !tbaa !10
  %327 = icmp eq i8* %325, %326
  br i1 %327, label %332, label %328

328:                                              ; preds = %324
  %329 = getelementptr inbounds i8, i8* %325, i64 1
  store i8* %329, i8** %13, align 8, !tbaa !3
  %330 = load i8, i8* %325, align 1, !tbaa !11
  %331 = zext i8 %330 to i32
  br label %334

332:                                              ; preds = %324
  %333 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %334

334:                                              ; preds = %332, %328
  %335 = phi i32 [ %331, %328 ], [ %333, %332 ]
  %336 = icmp eq i32 %335, 48
  br i1 %336, label %337, label %352

337:                                              ; preds = %334, %349
  %338 = phi i64 [ %339, %349 ], [ 0, %334 ]
  %339 = add nsw i64 %338, -1
  %340 = load i8*, i8** %13, align 8, !tbaa !3
  %341 = load i8*, i8** %14, align 8, !tbaa !10
  %342 = icmp eq i8* %340, %341
  br i1 %342, label %347, label %343

343:                                              ; preds = %337
  %344 = getelementptr inbounds i8, i8* %340, i64 1
  store i8* %344, i8** %13, align 8, !tbaa !3
  %345 = load i8, i8* %340, align 1, !tbaa !11
  %346 = zext i8 %345 to i32
  br label %349

347:                                              ; preds = %337
  %348 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %349

349:                                              ; preds = %347, %343
  %350 = phi i32 [ %346, %343 ], [ %348, %347 ]
  %351 = icmp eq i32 %350, 48
  br i1 %351, label %337, label %352

352:                                              ; preds = %309, %349, %334
  %353 = phi i32 [ %310, %334 ], [ 1, %349 ], [ %310, %309 ]
  %354 = phi i32 [ 1, %334 ], [ 1, %349 ], [ 0, %309 ]
  %355 = phi i64 [ 0, %334 ], [ %339, %349 ], [ 0, %309 ]
  %356 = phi i32 [ %335, %334 ], [ %350, %349 ], [ %311, %309 ]
  %357 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 0
  store i32 0, i32* %357, align 16, !tbaa !13
  %358 = add nsw i32 %356, -48
  %359 = icmp ult i32 %358, 10
  %360 = icmp eq i32 %356, 46
  %361 = or i1 %360, %359
  br i1 %361, label %362, label %428

362:                                              ; preds = %352
  %363 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 2044
  br label %364

364:                                              ; preds = %422, %362
  %365 = phi i1 [ %360, %362 ], [ %426, %422 ]
  %366 = phi i32 [ %358, %362 ], [ %424, %422 ]
  %367 = phi i32 [ %356, %362 ], [ %423, %422 ]
  %368 = phi i32 [ 0, %362 ], [ %412, %422 ]
  %369 = phi i32 [ 0, %362 ], [ %411, %422 ]
  %370 = phi i64 [ %355, %362 ], [ %410, %422 ]
  %371 = phi i64 [ 0, %362 ], [ %409, %422 ]
  %372 = phi i32 [ %354, %362 ], [ %408, %422 ]
  %373 = phi i32 [ %353, %362 ], [ %407, %422 ]
  %374 = phi i32 [ 0, %362 ], [ %406, %422 ]
  br i1 %365, label %375, label %379

375:                                              ; preds = %364
  %376 = icmp eq i32 %372, 0
  br i1 %376, label %405, label %377

377:                                              ; preds = %375
  %378 = icmp eq i32 %373, 0
  br label %463

379:                                              ; preds = %364
  %380 = icmp slt i32 %369, 2045
  %381 = add nsw i64 %371, 1
  %382 = icmp eq i32 %367, 48
  br i1 %380, label %383, label %401

383:                                              ; preds = %379
  %384 = trunc i64 %381 to i32
  %385 = select i1 %382, i32 %374, i32 %384
  %386 = icmp eq i32 %368, 0
  %387 = sext i32 %369 to i64
  %388 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 %387
  br i1 %386, label %394, label %389

389:                                              ; preds = %383
  %390 = load i32, i32* %388, align 4, !tbaa !13
  %391 = mul i32 %390, 10
  %392 = add nsw i32 %367, -48
  %393 = add i32 %392, %391
  br label %394

394:                                              ; preds = %389, %383
  %395 = phi i32 [ %393, %389 ], [ %366, %383 ]
  store i32 %395, i32* %388, align 4, !tbaa !13
  %396 = add nsw i32 %368, 1
  %397 = icmp eq i32 %396, 9
  %398 = zext i1 %397 to i32
  %399 = add nsw i32 %369, %398
  %400 = select i1 %397, i32 0, i32 %396
  br label %405

401:                                              ; preds = %379
  br i1 %382, label %405, label %402

402:                                              ; preds = %401
  %403 = load i32, i32* %363, align 16, !tbaa !13
  %404 = or i32 %403, 1
  store i32 %404, i32* %363, align 16, !tbaa !13
  br label %405

405:                                              ; preds = %402, %401, %394, %375
  %406 = phi i32 [ %385, %394 ], [ 18396, %402 ], [ %374, %401 ], [ %374, %375 ]
  %407 = phi i32 [ 1, %394 ], [ %373, %402 ], [ %373, %401 ], [ %373, %375 ]
  %408 = phi i32 [ %372, %394 ], [ %372, %402 ], [ %372, %401 ], [ 1, %375 ]
  %409 = phi i64 [ %381, %394 ], [ %381, %402 ], [ %381, %401 ], [ %371, %375 ]
  %410 = phi i64 [ %370, %394 ], [ %370, %402 ], [ %370, %401 ], [ %371, %375 ]
  %411 = phi i32 [ %399, %394 ], [ %369, %402 ], [ %369, %401 ], [ %369, %375 ]
  %412 = phi i32 [ %400, %394 ], [ %368, %402 ], [ %368, %401 ], [ %368, %375 ]
  %413 = load i8*, i8** %13, align 8, !tbaa !3
  %414 = load i8*, i8** %14, align 8, !tbaa !10
  %415 = icmp eq i8* %413, %414
  br i1 %415, label %420, label %416

416:                                              ; preds = %405
  %417 = getelementptr inbounds i8, i8* %413, i64 1
  store i8* %417, i8** %13, align 8, !tbaa !3
  %418 = load i8, i8* %413, align 1, !tbaa !11
  %419 = zext i8 %418 to i32
  br label %422

420:                                              ; preds = %405
  %421 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %422

422:                                              ; preds = %420, %416
  %423 = phi i32 [ %419, %416 ], [ %421, %420 ]
  %424 = add nsw i32 %423, -48
  %425 = icmp ult i32 %424, 10
  %426 = icmp eq i32 %423, 46
  %427 = or i1 %426, %425
  br i1 %427, label %364, label %428

428:                                              ; preds = %422, %352
  %429 = phi i32 [ 0, %352 ], [ %406, %422 ]
  %430 = phi i32 [ %353, %352 ], [ %407, %422 ]
  %431 = phi i32 [ %354, %352 ], [ %408, %422 ]
  %432 = phi i64 [ 0, %352 ], [ %409, %422 ]
  %433 = phi i64 [ %355, %352 ], [ %410, %422 ]
  %434 = phi i32 [ 0, %352 ], [ %411, %422 ]
  %435 = phi i32 [ 0, %352 ], [ %412, %422 ]
  %436 = phi i32 [ %356, %352 ], [ %423, %422 ]
  %437 = icmp eq i32 %431, 0
  %438 = select i1 %437, i64 %432, i64 %433
  %439 = icmp eq i32 %430, 0
  %440 = xor i1 %439, true
  %441 = and i32 %436, -33
  %442 = icmp eq i32 %441, 69
  %443 = select i1 %440, i1 %442, i1 false
  br i1 %443, label %444, label %461

444:                                              ; preds = %428
  %445 = tail call fastcc i64 @scanexp(%struct._IO_FILE* noundef nonnull %0, i32 noundef %2) #7
  %446 = icmp eq i64 %445, -9223372036854775808
  br i1 %446, label %447, label %458

447:                                              ; preds = %444
  %448 = icmp eq i32 %2, 0
  br i1 %448, label %456, label %449

449:                                              ; preds = %447
  %450 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 26
  %451 = load i64, i64* %450, align 8, !tbaa !12
  %452 = icmp sgt i64 %451, -1
  br i1 %452, label %453, label %458

453:                                              ; preds = %449
  %454 = load i8*, i8** %13, align 8, !tbaa !3
  %455 = getelementptr inbounds i8, i8* %454, i64 -1
  store i8* %455, i8** %13, align 8, !tbaa !3
  br label %458

456:                                              ; preds = %447
  tail call void @__shlim(%struct._IO_FILE* noundef nonnull %0, i64 noundef 0) #7
  %457 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  br label %1027

458:                                              ; preds = %453, %449, %444
  %459 = phi i64 [ %445, %444 ], [ 0, %453 ], [ 0, %449 ]
  %460 = add nsw i64 %459, %438
  br i1 %439, label %483, label %486

461:                                              ; preds = %428
  %462 = icmp sgt i32 %436, -1
  br i1 %462, label %463, label %476

463:                                              ; preds = %461, %377
  %464 = phi i32 [ %374, %377 ], [ %429, %461 ]
  %465 = phi i64 [ %371, %377 ], [ %432, %461 ]
  %466 = phi i32 [ %369, %377 ], [ %434, %461 ]
  %467 = phi i32 [ %368, %377 ], [ %435, %461 ]
  %468 = phi i64 [ %370, %377 ], [ %438, %461 ]
  %469 = phi i1 [ %378, %377 ], [ %439, %461 ]
  %470 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 26
  %471 = load i64, i64* %470, align 8, !tbaa !12
  %472 = icmp sgt i64 %471, -1
  br i1 %472, label %473, label %476

473:                                              ; preds = %463
  %474 = load i8*, i8** %13, align 8, !tbaa !3
  %475 = getelementptr inbounds i8, i8* %474, i64 -1
  store i8* %475, i8** %13, align 8, !tbaa !3
  br i1 %469, label %483, label %486

476:                                              ; preds = %463, %461
  %477 = phi i32 [ %464, %463 ], [ %429, %461 ]
  %478 = phi i64 [ %465, %463 ], [ %432, %461 ]
  %479 = phi i32 [ %466, %463 ], [ %434, %461 ]
  %480 = phi i32 [ %467, %463 ], [ %435, %461 ]
  %481 = phi i1 [ %469, %463 ], [ %439, %461 ]
  %482 = phi i64 [ %468, %463 ], [ %438, %461 ]
  br i1 %481, label %483, label %486

483:                                              ; preds = %476, %473, %458
  %484 = tail call i32* @___errno_location() #8
  store i32 22, i32* %484, align 4, !tbaa !13
  tail call void @__shlim(%struct._IO_FILE* noundef nonnull %0, i64 noundef 0) #7
  %485 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  br label %1027

486:                                              ; preds = %476, %473, %458
  %487 = phi i32 [ %429, %458 ], [ %477, %476 ], [ %464, %473 ]
  %488 = phi i64 [ %432, %458 ], [ %478, %476 ], [ %465, %473 ]
  %489 = phi i32 [ %434, %458 ], [ %479, %476 ], [ %466, %473 ]
  %490 = phi i32 [ %435, %458 ], [ %480, %476 ], [ %467, %473 ]
  %491 = phi i64 [ %460, %458 ], [ %482, %476 ], [ %468, %473 ]
  %492 = load i32, i32* %357, align 16, !tbaa !13
  %493 = icmp eq i32 %492, 0
  br i1 %493, label %494, label %498

494:                                              ; preds = %486
  %495 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %496 = tail call double @llvm.experimental.constrained.fmul.f64(double %495, double 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %497 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %496, metadata !"fpexcept.ignore") #10
  br label %1027

498:                                              ; preds = %486
  %499 = icmp eq i64 %491, %488
  %500 = icmp slt i64 %488, 10
  %501 = and i1 %500, %499
  br i1 %501, label %502, label %510

502:                                              ; preds = %498
  %503 = lshr i32 %492, %11
  %504 = icmp eq i32 %503, 0
  %505 = select i1 %10, i1 true, i1 %504
  br i1 %505, label %506, label %510

506:                                              ; preds = %502
  %507 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %508 = tail call x86_fp80 @llvm.experimental.constrained.uitofp.f80.i32(i32 %492, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %509 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %507, x86_fp80 %508, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  br label %1027

510:                                              ; preds = %502, %498
  %511 = sdiv i32 %12, -2
  %512 = zext i32 %511 to i64
  %513 = icmp sgt i64 %491, %512
  br i1 %513, label %514, label %519

514:                                              ; preds = %510
  %515 = tail call i32* @___errno_location() #8
  store i32 34, i32* %515, align 4, !tbaa !13
  %516 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %517 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %516, x86_fp80 0xK7FFEFFFFFFFFFFFFFFFF, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %518 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %517, x86_fp80 0xK7FFEFFFFFFFFFFFFFFFF, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  br label %1027

519:                                              ; preds = %510
  %520 = add nsw i32 %12, -128
  %521 = sext i32 %520 to i64
  %522 = icmp slt i64 %491, %521
  br i1 %522, label %523, label %528

523:                                              ; preds = %519
  %524 = tail call i32* @___errno_location() #8
  store i32 34, i32* %524, align 4, !tbaa !13
  %525 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %526 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %525, x86_fp80 0xK00018000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %527 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %526, x86_fp80 0xK00018000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  br label %1027

528:                                              ; preds = %519
  %529 = icmp eq i32 %490, 0
  br i1 %529, label %590, label %530

530:                                              ; preds = %528
  %531 = icmp slt i32 %490, 9
  br i1 %531, label %532, label %588

532:                                              ; preds = %530
  %533 = sext i32 %489 to i64
  %534 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 %533
  %535 = load i32, i32* %534, align 4, !tbaa !13
  %536 = sub i32 9, %490
  %537 = icmp ult i32 %536, 8
  br i1 %537, label %577, label %538

538:                                              ; preds = %532
  %539 = and i32 %536, -8
  %540 = add i32 %490, %539
  %541 = insertelement <4 x i32> <i32 poison, i32 1, i32 1, i32 1>, i32 %535, i64 0
  %542 = add i32 %539, -8
  %543 = lshr exact i32 %542, 3
  %544 = add nuw nsw i32 %543, 1
  %545 = and i32 %544, 7
  %546 = icmp ult i32 %542, 56
  br i1 %546, label %557, label %547

547:                                              ; preds = %538
  %548 = and i32 %544, 1073741816
  br label %549

549:                                              ; preds = %549, %547
  %550 = phi <4 x i32> [ %541, %547 ], [ %553, %549 ]
  %551 = phi <4 x i32> [ <i32 1, i32 1, i32 1, i32 1>, %547 ], [ %554, %549 ]
  %552 = phi i32 [ 0, %547 ], [ %555, %549 ]
  %553 = mul <4 x i32> %550, <i32 100000000, i32 100000000, i32 100000000, i32 100000000>
  %554 = mul <4 x i32> %551, <i32 100000000, i32 100000000, i32 100000000, i32 100000000>
  %555 = add nuw i32 %552, 8
  %556 = icmp eq i32 %555, %548
  br i1 %556, label %557, label %549, !llvm.loop !14

557:                                              ; preds = %549, %538
  %558 = phi <4 x i32> [ undef, %538 ], [ %553, %549 ]
  %559 = phi <4 x i32> [ undef, %538 ], [ %554, %549 ]
  %560 = phi <4 x i32> [ %541, %538 ], [ %553, %549 ]
  %561 = phi <4 x i32> [ <i32 1, i32 1, i32 1, i32 1>, %538 ], [ %554, %549 ]
  %562 = icmp eq i32 %545, 0
  br i1 %562, label %571, label %563

563:                                              ; preds = %557, %563
  %564 = phi <4 x i32> [ %567, %563 ], [ %560, %557 ]
  %565 = phi <4 x i32> [ %568, %563 ], [ %561, %557 ]
  %566 = phi i32 [ %569, %563 ], [ 0, %557 ]
  %567 = mul <4 x i32> %564, <i32 10, i32 10, i32 10, i32 10>
  %568 = mul <4 x i32> %565, <i32 10, i32 10, i32 10, i32 10>
  %569 = add i32 %566, 1
  %570 = icmp eq i32 %569, %545
  br i1 %570, label %571, label %563, !llvm.loop !16

571:                                              ; preds = %563, %557
  %572 = phi <4 x i32> [ %558, %557 ], [ %567, %563 ]
  %573 = phi <4 x i32> [ %559, %557 ], [ %568, %563 ]
  %574 = mul <4 x i32> %573, %572
  %575 = call i32 @llvm.vector.reduce.mul.v4i32(<4 x i32> %574)
  %576 = icmp eq i32 %536, %539
  br i1 %576, label %586, label %577

577:                                              ; preds = %532, %571
  %578 = phi i32 [ %535, %532 ], [ %575, %571 ]
  %579 = phi i32 [ %490, %532 ], [ %540, %571 ]
  br label %580

580:                                              ; preds = %577, %580
  %581 = phi i32 [ %583, %580 ], [ %578, %577 ]
  %582 = phi i32 [ %584, %580 ], [ %579, %577 ]
  %583 = mul i32 %581, 10
  %584 = add i32 %582, 1
  %585 = icmp eq i32 %584, 9
  br i1 %585, label %586, label %580, !llvm.loop !18

586:                                              ; preds = %580, %571
  %587 = phi i32 [ %575, %571 ], [ %583, %580 ]
  store i32 %587, i32* %534, align 4, !tbaa !13
  br label %588

588:                                              ; preds = %586, %530
  %589 = add nsw i32 %489, 1
  br label %590

590:                                              ; preds = %588, %528
  %591 = phi i32 [ %589, %588 ], [ %489, %528 ]
  %592 = trunc i64 %491 to i32
  %593 = icmp slt i32 %487, 9
  br i1 %593, label %594, label %638

594:                                              ; preds = %590
  %595 = icmp sle i32 %487, %592
  %596 = icmp slt i32 %592, 18
  %597 = and i1 %595, %596
  br i1 %597, label %598, label %638

598:                                              ; preds = %594
  %599 = icmp eq i32 %592, 9
  br i1 %599, label %600, label %605

600:                                              ; preds = %598
  %601 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %602 = load i32, i32* %357, align 16, !tbaa !13
  %603 = tail call x86_fp80 @llvm.experimental.constrained.uitofp.f80.i32(i32 %602, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %604 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %601, x86_fp80 %603, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  br label %1027

605:                                              ; preds = %598
  %606 = icmp slt i32 %592, 9
  br i1 %606, label %607, label %618

607:                                              ; preds = %605
  %608 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %609 = load i32, i32* %357, align 16, !tbaa !13
  %610 = tail call x86_fp80 @llvm.experimental.constrained.uitofp.f80.i32(i32 %609, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %611 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %608, x86_fp80 %610, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %612 = sub i64 8, %491
  %613 = and i64 %612, 4294967295
  %614 = getelementptr inbounds [8 x i32], [8 x i32]* @decfloat.p10s, i64 0, i64 %613
  %615 = load i32, i32* %614, align 4, !tbaa !13
  %616 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 %615, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %617 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %611, x86_fp80 %616, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  br label %1027

618:                                              ; preds = %605
  %619 = mul nsw i32 %592, -3
  %620 = add nuw nsw i32 %11, 27
  %621 = add i32 %620, %619
  %622 = icmp sgt i32 %621, 30
  %623 = load i32, i32* %357, align 16, !tbaa !13
  %624 = lshr i32 %623, %621
  %625 = icmp eq i32 %624, 0
  %626 = select i1 %622, i1 true, i1 %625
  br i1 %626, label %627, label %638

627:                                              ; preds = %618
  %628 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %629 = tail call x86_fp80 @llvm.experimental.constrained.uitofp.f80.i32(i32 %623, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %630 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %628, x86_fp80 %629, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %631 = shl i64 %491, 32
  %632 = add i64 %631, -42949672960
  %633 = ashr exact i64 %632, 32
  %634 = getelementptr inbounds [8 x i32], [8 x i32]* @decfloat.p10s, i64 0, i64 %633
  %635 = load i32, i32* %634, align 4, !tbaa !13
  %636 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 %635, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %637 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %630, x86_fp80 %636, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  br label %1027

638:                                              ; preds = %618, %594, %590
  %639 = sext i32 %591 to i64
  br label %640

640:                                              ; preds = %640, %638
  %641 = phi i64 [ %642, %640 ], [ %639, %638 ]
  %642 = add i64 %641, -1
  %643 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 %642
  %644 = load i32, i32* %643, align 4, !tbaa !13
  %645 = icmp eq i32 %644, 0
  br i1 %645, label %640, label %646

646:                                              ; preds = %640
  %647 = trunc i64 %641 to i32
  %648 = srem i32 %592, 9
  %649 = icmp eq i32 %648, 0
  br i1 %649, label %697, label %650

650:                                              ; preds = %646
  %651 = add nsw i32 %648, 9
  %652 = icmp slt i32 %592, 0
  %653 = select i1 %652, i32 %651, i32 %648
  %654 = sub nsw i32 8, %653
  %655 = sext i32 %654 to i64
  %656 = getelementptr inbounds [8 x i32], [8 x i32]* @decfloat.p10s, i64 0, i64 %655
  %657 = load i32, i32* %656, align 4, !tbaa !13
  %658 = icmp eq i32 %647, 0
  br i1 %658, label %691, label %659

659:                                              ; preds = %650
  %660 = sdiv i32 1000000000, %657
  %661 = and i64 %641, 4294967295
  br label %662

662:                                              ; preds = %662, %659
  %663 = phi i64 [ 0, %659 ], [ %682, %662 ]
  %664 = phi i32 [ 0, %659 ], [ %672, %662 ]
  %665 = phi i32 [ 0, %659 ], [ %681, %662 ]
  %666 = phi i32 [ %592, %659 ], [ %680, %662 ]
  %667 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 %663
  %668 = load i32, i32* %667, align 4, !tbaa !13
  %669 = urem i32 %668, %657
  %670 = udiv i32 %668, %657
  %671 = add i32 %670, %664
  store i32 %671, i32* %667, align 4, !tbaa !13
  %672 = mul i32 %669, %660
  %673 = zext i32 %665 to i64
  %674 = icmp eq i64 %663, %673
  %675 = icmp eq i32 %671, 0
  %676 = select i1 %674, i1 %675, i1 false
  %677 = add nsw i32 %665, 1
  %678 = and i32 %677, 2047
  %679 = add nsw i32 %666, -9
  %680 = select i1 %676, i32 %679, i32 %666
  %681 = select i1 %676, i32 %678, i32 %665
  %682 = add nuw nsw i64 %663, 1
  %683 = icmp eq i64 %682, %661
  br i1 %683, label %684, label %662

684:                                              ; preds = %662
  %685 = icmp eq i32 %672, 0
  br i1 %685, label %691, label %686

686:                                              ; preds = %684
  %687 = add nsw i32 %647, 1
  %688 = shl i64 %641, 32
  %689 = ashr exact i64 %688, 32
  %690 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 %689
  store i32 %672, i32* %690, align 4, !tbaa !13
  br label %691

691:                                              ; preds = %686, %684, %650
  %692 = phi i32 [ %681, %686 ], [ %681, %684 ], [ 0, %650 ]
  %693 = phi i32 [ %680, %686 ], [ %680, %684 ], [ %592, %650 ]
  %694 = phi i32 [ %687, %686 ], [ %647, %684 ], [ 0, %650 ]
  %695 = sub nsw i32 9, %653
  %696 = add nsw i32 %695, %693
  br label %697

697:                                              ; preds = %691, %646
  %698 = phi i32 [ %592, %646 ], [ %696, %691 ]
  %699 = phi i32 [ %647, %646 ], [ %694, %691 ]
  %700 = phi i32 [ 0, %646 ], [ %692, %691 ]
  br label %701

701:                                              ; preds = %697, %770
  %702 = phi i32 [ %698, %697 ], [ %754, %770 ]
  %703 = phi i32 [ 0, %697 ], [ %751, %770 ]
  %704 = phi i32 [ %699, %697 ], [ %771, %770 ]
  %705 = phi i32 [ %700, %697 ], [ %756, %770 ]
  %706 = icmp slt i32 %702, 27
  %707 = icmp eq i32 %702, 27
  %708 = sext i32 %705 to i64
  %709 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 %708
  br label %710

710:                                              ; preds = %701, %750
  %711 = phi i32 [ %751, %750 ], [ %703, %701 ]
  %712 = phi i32 [ %748, %750 ], [ %704, %701 ]
  br i1 %706, label %718, label %713

713:                                              ; preds = %710
  br i1 %707, label %715, label %714

714:                                              ; preds = %715, %713
  br label %846

715:                                              ; preds = %713
  %716 = load i32, i32* %709, align 4, !tbaa !13
  %717 = icmp ult i32 %716, 18
  br i1 %717, label %718, label %714

718:                                              ; preds = %715, %710
  %719 = add i32 %712, 2047
  br label %720

720:                                              ; preds = %737, %718
  %721 = phi i32 [ %712, %718 ], [ %748, %737 ]
  %722 = phi i32 [ %719, %718 ], [ %749, %737 ]
  %723 = phi i32 [ 0, %718 ], [ %739, %737 ]
  %724 = and i32 %722, 2047
  %725 = zext i32 %724 to i64
  %726 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 %725
  %727 = load i32, i32* %726, align 4, !tbaa !13
  %728 = zext i32 %727 to i64
  %729 = shl nuw nsw i64 %728, 29
  %730 = zext i32 %723 to i64
  %731 = add nuw nsw i64 %729, %730
  %732 = icmp ugt i64 %731, 1000000000
  br i1 %732, label %733, label %737

733:                                              ; preds = %720
  %734 = udiv i64 %731, 1000000000
  %735 = trunc i64 %734 to i32
  %736 = urem i64 %731, 1000000000
  br label %737

737:                                              ; preds = %733, %720
  %738 = phi i64 [ %736, %733 ], [ %731, %720 ]
  %739 = phi i32 [ %735, %733 ], [ 0, %720 ]
  %740 = trunc i64 %738 to i32
  store i32 %740, i32* %726, align 4, !tbaa !13
  %741 = add i32 %721, 2047
  %742 = and i32 %741, 2047
  %743 = icmp ne i32 %724, %742
  %744 = icmp eq i32 %724, %705
  %745 = select i1 %743, i1 true, i1 %744
  %746 = icmp eq i32 %740, 0
  %747 = select i1 %746, i32 %724, i32 %721
  %748 = select i1 %745, i32 %721, i32 %747
  %749 = add nsw i32 %724, -1
  br i1 %744, label %750, label %720

750:                                              ; preds = %737
  %751 = add nsw i32 %711, -29
  %752 = icmp eq i32 %739, 0
  br i1 %752, label %710, label %753

753:                                              ; preds = %750
  %754 = add nsw i32 %702, 9
  %755 = add i32 %705, 2047
  %756 = and i32 %755, 2047
  %757 = icmp eq i32 %756, %748
  br i1 %757, label %758, label %770

758:                                              ; preds = %753
  %759 = add i32 %748, 2047
  %760 = and i32 %759, 2047
  %761 = zext i32 %760 to i64
  %762 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 %761
  %763 = load i32, i32* %762, align 4, !tbaa !13
  %764 = add i32 %748, 2046
  %765 = and i32 %764, 2047
  %766 = zext i32 %765 to i64
  %767 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 %766
  %768 = load i32, i32* %767, align 4, !tbaa !13
  %769 = or i32 %768, %763
  store i32 %769, i32* %767, align 4, !tbaa !13
  br label %770

770:                                              ; preds = %758, %753
  %771 = phi i32 [ %760, %758 ], [ %748, %753 ]
  %772 = zext i32 %756 to i64
  %773 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 %772
  store i32 %739, i32* %773, align 4, !tbaa !13
  br label %701

774:                                              ; preds = %857, %809
  %775 = phi i32 [ %810, %809 ], [ %859, %857 ]
  %776 = phi i32 [ %849, %809 ], [ %860, %857 ]
  %777 = and i32 %776, 2047
  %778 = icmp eq i32 %777, %849
  br i1 %778, label %808, label %779

779:                                              ; preds = %774
  %780 = zext i32 %777 to i64
  %781 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 %780
  %782 = load i32, i32* %781, align 4, !tbaa !13
  %783 = icmp ult i32 %782, 18
  br i1 %783, label %807, label %784

784:                                              ; preds = %779
  %785 = icmp eq i32 %782, 18
  br i1 %785, label %786, label %809

786:                                              ; preds = %784
  %787 = add nsw i32 %776, 1
  %788 = and i32 %787, 2047
  %789 = icmp eq i32 %788, %849
  br i1 %789, label %807, label %790

790:                                              ; preds = %786
  %791 = zext i32 %788 to i64
  %792 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 %791
  %793 = load i32, i32* %792, align 4, !tbaa !13
  %794 = icmp ult i32 %793, 446744073
  br i1 %794, label %807, label %795

795:                                              ; preds = %790
  %796 = icmp eq i32 %793, 446744073
  br i1 %796, label %797, label %809

797:                                              ; preds = %795
  %798 = add nsw i32 %776, 2
  %799 = and i32 %798, 2047
  %800 = icmp eq i32 %799, %849
  br i1 %800, label %807, label %801

801:                                              ; preds = %797
  %802 = zext i32 %799 to i64
  %803 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 %802
  %804 = load i32, i32* %803, align 4, !tbaa !13
  %805 = icmp ult i32 %804, 709551616
  %806 = select i1 %805, i1 %861, i1 false
  br i1 %806, label %870, label %809

807:                                              ; preds = %797, %790, %786, %779
  br i1 %862, label %870, label %809

808:                                              ; preds = %774
  br i1 %863, label %872, label %809

809:                                              ; preds = %808, %807, %801, %795, %784
  %810 = add nsw i32 %865, %775
  %811 = icmp eq i32 %776, %849
  br i1 %811, label %774, label %812

812:                                              ; preds = %809
  %813 = shl nsw i32 -1, %865
  %814 = xor i32 %813, -1
  %815 = lshr i32 1000000000, %865
  br label %816

816:                                              ; preds = %816, %812
  %817 = phi i32 [ 0, %812 ], [ %827, %816 ]
  %818 = phi i32 [ %776, %812 ], [ %837, %816 ]
  %819 = phi i32 [ %776, %812 ], [ %835, %816 ]
  %820 = phi i32 [ %858, %812 ], [ %834, %816 ]
  %821 = sext i32 %818 to i64
  %822 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 %821
  %823 = load i32, i32* %822, align 4, !tbaa !13
  %824 = and i32 %823, %814
  %825 = lshr i32 %823, %865
  %826 = add i32 %825, %817
  store i32 %826, i32* %822, align 4, !tbaa !13
  %827 = mul i32 %824, %815
  %828 = icmp eq i32 %818, %819
  %829 = icmp eq i32 %826, 0
  %830 = select i1 %828, i1 %829, i1 false
  %831 = add nsw i32 %819, 1
  %832 = and i32 %831, 2047
  %833 = add nsw i32 %820, -9
  %834 = select i1 %830, i32 %833, i32 %820
  %835 = select i1 %830, i32 %832, i32 %819
  %836 = add nsw i32 %818, 1
  %837 = and i32 %836, 2047
  %838 = icmp eq i32 %837, %849
  br i1 %838, label %839, label %816

839:                                              ; preds = %816
  %840 = icmp eq i32 %827, 0
  br i1 %840, label %869, label %841

841:                                              ; preds = %839
  %842 = icmp eq i32 %852, %835
  br i1 %842, label %866, label %843

843:                                              ; preds = %841
  %844 = sext i32 %849 to i64
  %845 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 %844
  store i32 %827, i32* %845, align 4, !tbaa !13
  br label %846

846:                                              ; preds = %843, %714
  %847 = phi i32 [ %834, %843 ], [ %702, %714 ]
  %848 = phi i32 [ %810, %843 ], [ %711, %714 ]
  %849 = phi i32 [ %852, %843 ], [ %712, %714 ]
  %850 = phi i32 [ %835, %843 ], [ %705, %714 ]
  %851 = add nsw i32 %849, 1
  %852 = and i32 %851, 2047
  %853 = add i32 %849, 2047
  %854 = and i32 %853, 2047
  %855 = zext i32 %854 to i64
  %856 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 %855
  br label %857

857:                                              ; preds = %869, %846
  %858 = phi i32 [ %847, %846 ], [ %834, %869 ]
  %859 = phi i32 [ %848, %846 ], [ %810, %869 ]
  %860 = phi i32 [ %850, %846 ], [ %835, %869 ]
  %861 = icmp eq i32 %858, 27
  %862 = icmp eq i32 %858, 27
  %863 = icmp eq i32 %858, 27
  %864 = icmp sgt i32 %858, 36
  %865 = select i1 %864, i32 9, i32 1
  br label %774

866:                                              ; preds = %841
  %867 = load i32, i32* %856, align 4, !tbaa !13
  %868 = or i32 %867, 1
  store i32 %868, i32* %856, align 4, !tbaa !13
  br label %869

869:                                              ; preds = %866, %839
  br label %857

870:                                              ; preds = %807, %801
  %871 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  br label %882

872:                                              ; preds = %808
  %873 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %874 = add nsw i32 %849, 1
  %875 = and i32 %874, 2047
  %876 = add nsw i32 %875, -1
  %877 = sext i32 %876 to i64
  %878 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 %877
  store i32 0, i32* %878, align 4, !tbaa !13
  %879 = zext i32 %849 to i64
  %880 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 %879
  %881 = load i32, i32* %880, align 4, !tbaa !13
  br label %882

882:                                              ; preds = %870, %872
  %883 = phi i32 [ %782, %870 ], [ %881, %872 ]
  %884 = phi x86_fp80 [ %871, %870 ], [ %873, %872 ]
  %885 = phi i32 [ %849, %870 ], [ %875, %872 ]
  %886 = tail call x86_fp80 @llvm.experimental.constrained.uitofp.f80.i32(i32 %883, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %887 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 0xK401CEE6B280000000000, x86_fp80 %884, x86_fp80 %886, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %888 = add nsw i32 %776, 1
  %889 = and i32 %888, 2047
  %890 = icmp eq i32 %889, %885
  %891 = add i32 %776, 2
  %892 = and i32 %891, 2047
  br i1 %890, label %893, label %902

893:                                              ; preds = %882
  %894 = add nsw i32 %892, -1
  %895 = sext i32 %894 to i64
  %896 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 %895
  store i32 0, i32* %896, align 4, !tbaa !13
  %897 = zext i32 %889 to i64
  %898 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 %897
  %899 = load i32, i32* %898, align 4, !tbaa !13
  %900 = tail call x86_fp80 @llvm.experimental.constrained.uitofp.f80.i32(i32 %899, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %901 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 0xK401CEE6B280000000000, x86_fp80 %887, x86_fp80 %900, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  br label %909

902:                                              ; preds = %882
  %903 = zext i32 %889 to i64
  %904 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 %903
  %905 = load i32, i32* %904, align 4, !tbaa !13
  %906 = tail call x86_fp80 @llvm.experimental.constrained.uitofp.f80.i32(i32 %905, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %907 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 0xK401CEE6B280000000000, x86_fp80 %887, x86_fp80 %906, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %908 = icmp eq i32 %892, %885
  br i1 %908, label %909, label %916

909:                                              ; preds = %893, %902
  %910 = phi x86_fp80 [ %901, %893 ], [ %907, %902 ]
  %911 = add i32 %776, 3
  %912 = and i32 %911, 2047
  %913 = add nsw i32 %912, -1
  %914 = sext i32 %913 to i64
  %915 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 %914
  store i32 0, i32* %915, align 4, !tbaa !13
  br label %916

916:                                              ; preds = %909, %902
  %917 = phi x86_fp80 [ %910, %909 ], [ %907, %902 ]
  %918 = phi i32 [ %912, %909 ], [ %885, %902 ]
  %919 = zext i32 %892 to i64
  %920 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 %919
  %921 = load i32, i32* %920, align 4, !tbaa !13
  %922 = tail call x86_fp80 @llvm.experimental.constrained.uitofp.f80.i32(i32 %921, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %923 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 0xK401CEE6B280000000000, x86_fp80 %917, x86_fp80 %922, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %924 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %925 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %923, x86_fp80 %924, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %926 = add nsw i32 %775, 64
  %927 = sub nsw i32 %926, %12
  %928 = icmp slt i32 %927, %11
  %929 = icmp sgt i32 %927, 0
  %930 = select i1 %929, i32 %927, i32 0
  %931 = select i1 %928, i32 %930, i32 %11
  %932 = icmp slt i32 %931, 64
  br i1 %932, label %933, label %946

933:                                              ; preds = %916
  %934 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %935 = sub nsw i32 127, %931
  %936 = tail call double @scalbn(double noundef %934, i32 noundef %935) #7
  %937 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %936, metadata !"fpexcept.ignore") #10
  %938 = tail call x86_fp80 @copysignl(x86_fp80 noundef %937, x86_fp80 noundef %925) #7
  %939 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %940 = sub nsw i32 64, %931
  %941 = tail call double @scalbn(double noundef %939, i32 noundef %940) #7
  %942 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %941, metadata !"fpexcept.ignore") #10
  %943 = tail call x86_fp80 @fmodl(x86_fp80 noundef %925, x86_fp80 noundef %942) #7
  %944 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %925, x86_fp80 %943, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %945 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %944, x86_fp80 %938, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  br label %946

946:                                              ; preds = %933, %916
  %947 = phi x86_fp80 [ %945, %933 ], [ %925, %916 ]
  %948 = phi x86_fp80 [ %943, %933 ], [ %307, %916 ]
  %949 = phi x86_fp80 [ %938, %933 ], [ %308, %916 ]
  %950 = add nsw i32 %776, 3
  %951 = and i32 %950, 2047
  %952 = icmp eq i32 %951, %918
  br i1 %952, label %994, label %953

953:                                              ; preds = %946
  %954 = zext i32 %951 to i64
  %955 = getelementptr inbounds [2048 x i32], [2048 x i32]* %4, i64 0, i64 %954
  %956 = load i32, i32* %955, align 4, !tbaa !13
  %957 = icmp ult i32 %956, 500000000
  br i1 %957, label %958, label %967

958:                                              ; preds = %953
  %959 = icmp eq i32 %956, 0
  br i1 %959, label %960, label %964

960:                                              ; preds = %958
  %961 = add nsw i32 %776, 4
  %962 = and i32 %961, 2047
  %963 = icmp eq i32 %962, %918
  br i1 %963, label %985, label %964

964:                                              ; preds = %960, %958
  %965 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %966 = tail call double @llvm.experimental.constrained.fmul.f64(double 2.500000e-01, double %965, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  br label %981

967:                                              ; preds = %953
  %968 = icmp eq i32 %956, 500000000
  br i1 %968, label %972, label %969

969:                                              ; preds = %967
  %970 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %971 = tail call double @llvm.experimental.constrained.fmul.f64(double 7.500000e-01, double %970, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  br label %981

972:                                              ; preds = %967
  %973 = add nsw i32 %776, 4
  %974 = and i32 %973, 2047
  %975 = icmp eq i32 %974, %918
  %976 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  br i1 %975, label %977, label %979

977:                                              ; preds = %972
  %978 = tail call double @llvm.experimental.constrained.fmul.f64(double 5.000000e-01, double %976, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  br label %981

979:                                              ; preds = %972
  %980 = tail call double @llvm.experimental.constrained.fmul.f64(double 7.500000e-01, double %976, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  br label %981

981:                                              ; preds = %979, %977, %969, %964
  %982 = phi double [ %971, %969 ], [ %978, %977 ], [ %980, %979 ], [ %966, %964 ]
  %983 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %982, metadata !"fpexcept.ignore") #10
  %984 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %948, x86_fp80 %983, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  br label %985

985:                                              ; preds = %981, %960
  %986 = phi x86_fp80 [ %948, %960 ], [ %984, %981 ]
  %987 = icmp slt i32 %931, 63
  br i1 %987, label %988, label %994

988:                                              ; preds = %985
  %989 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %990 = tail call x86_fp80 @fmodl(x86_fp80 noundef %986, x86_fp80 noundef %989) #7
  %991 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %990, x86_fp80 0xK00000000000000000000, metadata !"une", metadata !"fpexcept.ignore") #10
  br i1 %991, label %994, label %992

992:                                              ; preds = %988
  %993 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %986, x86_fp80 0xK3FFF8000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  br label %994

994:                                              ; preds = %992, %988, %985, %946
  %995 = phi x86_fp80 [ %948, %946 ], [ %986, %988 ], [ %993, %992 ], [ %986, %985 ]
  %996 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %947, x86_fp80 %995, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %997 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %996, x86_fp80 %949, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %998 = and i32 %926, 2147483647
  %999 = sub nsw i32 -2, %305
  %1000 = icmp sgt i32 %998, %999
  br i1 %1000, label %1001, label %1023

1001:                                             ; preds = %994
  %1002 = tail call x86_fp80 @fabsl(x86_fp80 noundef %997) #7
  %1003 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %1004 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %1003, x86_fp80 0xK3FC08000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %1005 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %1002, x86_fp80 %1004, metadata !"oge", metadata !"fpexcept.ignore") #10
  br i1 %1005, label %1006, label %1012

1006:                                             ; preds = %1001
  %1007 = icmp ne i32 %931, %927
  %1008 = select i1 %928, i1 %1007, i1 false
  %1009 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #10
  %1010 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %997, x86_fp80 %1009, metadata !"round.dynamic", metadata !"fpexcept.ignore") #10
  %1011 = add nsw i32 %775, 1
  br label %1012

1012:                                             ; preds = %1006, %1001
  %1013 = phi i32 [ %1011, %1006 ], [ %775, %1001 ]
  %1014 = phi i1 [ %1008, %1006 ], [ %928, %1001 ]
  %1015 = phi x86_fp80 [ %1010, %1006 ], [ %997, %1001 ]
  %1016 = add nsw i32 %1013, 61
  %1017 = icmp sgt i32 %1016, %306
  br i1 %1017, label %1021, label %1018

1018:                                             ; preds = %1012
  br i1 %1014, label %1019, label %1023

1019:                                             ; preds = %1018
  %1020 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %995, x86_fp80 0xK00000000000000000000, metadata !"une", metadata !"fpexcept.ignore") #10
  br i1 %1020, label %1021, label %1023

1021:                                             ; preds = %1019, %1012
  %1022 = tail call i32* @___errno_location() #8
  store i32 34, i32* %1022, align 4, !tbaa !13
  br label %1023

1023:                                             ; preds = %1021, %1019, %1018, %994
  %1024 = phi i32 [ %1013, %1021 ], [ %1013, %1019 ], [ %1013, %1018 ], [ %775, %994 ]
  %1025 = phi x86_fp80 [ %1015, %1021 ], [ %1015, %1019 ], [ %1015, %1018 ], [ %997, %994 ]
  %1026 = tail call x86_fp80 @scalbnl(x86_fp80 noundef %1025, i32 noundef %1024) #7
  br label %1027

1027:                                             ; preds = %456, %483, %494, %506, %514, %523, %600, %607, %627, %1023
  %1028 = phi x86_fp80 [ %509, %506 ], [ %518, %514 ], [ %527, %523 ], [ %604, %600 ], [ %617, %607 ], [ %1026, %1023 ], [ %637, %627 ], [ %497, %494 ], [ %485, %483 ], [ %457, %456 ]
  call void @llvm.lifetime.end.p0i8(i64 8192, i8* nonnull %304) #10
  br label %1029

1029:                                             ; preds = %1027, %294, %275, %264, %261, %243, %216, %160, %7
  %1030 = phi x86_fp80 [ %8, %7 ], [ %163, %160 ], [ %217, %216 ], [ %244, %243 ], [ %265, %264 ], [ %263, %261 ], [ %277, %275 ], [ %295, %294 ], [ %1028, %1027 ]
  ret x86_fp80 %1030
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32, metadata, metadata) #2

declare hidden i32 @__shgetc(%struct._IO_FILE* noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float, metadata) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #4

declare hidden void @__shlim(%struct._IO_FILE* noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: nounwind strictfp
define internal fastcc x86_fp80 @hexfloat(%struct._IO_FILE* noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) unnamed_addr #0 {
  %6 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %7 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %8 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %9 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  %10 = load i8*, i8** %9, align 8, !tbaa !3
  %11 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 25
  %12 = load i8*, i8** %11, align 8, !tbaa !10
  %13 = icmp eq i8* %10, %12
  br i1 %13, label %18, label %14

14:                                               ; preds = %5
  %15 = getelementptr inbounds i8, i8* %10, i64 1
  store i8* %15, i8** %9, align 8, !tbaa !3
  %16 = load i8, i8* %10, align 1, !tbaa !11
  %17 = zext i8 %16 to i32
  br label %20

18:                                               ; preds = %5
  %19 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %20

20:                                               ; preds = %18, %14
  %21 = phi i32 [ %17, %14 ], [ %19, %18 ]
  br label %22

22:                                               ; preds = %35, %20
  %23 = phi i32 [ 0, %20 ], [ 1, %35 ]
  %24 = phi i32 [ %21, %20 ], [ %36, %35 ]
  switch i32 %24, label %65 [
    i32 48, label %25
    i32 46, label %37
  ]

25:                                               ; preds = %22
  %26 = load i8*, i8** %9, align 8, !tbaa !3
  %27 = load i8*, i8** %11, align 8, !tbaa !10
  %28 = icmp eq i8* %26, %27
  br i1 %28, label %33, label %29

29:                                               ; preds = %25
  %30 = getelementptr inbounds i8, i8* %26, i64 1
  store i8* %30, i8** %9, align 8, !tbaa !3
  %31 = load i8, i8* %26, align 1, !tbaa !11
  %32 = zext i8 %31 to i32
  br label %35

33:                                               ; preds = %25
  %34 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %35

35:                                               ; preds = %33, %29
  %36 = phi i32 [ %34, %33 ], [ %32, %29 ]
  br label %22

37:                                               ; preds = %22
  %38 = load i8*, i8** %9, align 8, !tbaa !3
  %39 = load i8*, i8** %11, align 8, !tbaa !10
  %40 = icmp eq i8* %38, %39
  br i1 %40, label %45, label %41

41:                                               ; preds = %37
  %42 = getelementptr inbounds i8, i8* %38, i64 1
  store i8* %42, i8** %9, align 8, !tbaa !3
  %43 = load i8, i8* %38, align 1, !tbaa !11
  %44 = zext i8 %43 to i32
  br label %47

45:                                               ; preds = %37
  %46 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %47

47:                                               ; preds = %45, %41
  %48 = phi i32 [ %44, %41 ], [ %46, %45 ]
  %49 = icmp eq i32 %48, 48
  br i1 %49, label %50, label %65

50:                                               ; preds = %47, %61
  %51 = phi i64 [ %63, %61 ], [ 0, %47 ]
  %52 = load i8*, i8** %9, align 8, !tbaa !3
  %53 = load i8*, i8** %11, align 8, !tbaa !10
  %54 = icmp eq i8* %52, %53
  br i1 %54, label %59, label %55

55:                                               ; preds = %50
  %56 = getelementptr inbounds i8, i8* %52, i64 1
  store i8* %56, i8** %9, align 8, !tbaa !3
  %57 = load i8, i8* %52, align 1, !tbaa !11
  %58 = zext i8 %57 to i32
  br label %61

59:                                               ; preds = %50
  %60 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %61

61:                                               ; preds = %59, %55
  %62 = phi i32 [ %58, %55 ], [ %60, %59 ]
  %63 = add nsw i64 %51, -1
  %64 = icmp eq i32 %62, 48
  br i1 %64, label %50, label %65

65:                                               ; preds = %22, %61, %47
  %66 = phi i32 [ 1, %47 ], [ 1, %61 ], [ 0, %22 ]
  %67 = phi i32 [ %23, %47 ], [ 1, %61 ], [ %23, %22 ]
  %68 = phi i64 [ 0, %47 ], [ %63, %61 ], [ 0, %22 ]
  %69 = phi i32 [ %48, %47 ], [ %62, %61 ], [ %24, %22 ]
  br label %70

70:                                               ; preds = %137, %65
  %71 = phi i32 [ 0, %65 ], [ %120, %137 ]
  %72 = phi x86_fp80 [ %6, %65 ], [ %121, %137 ]
  %73 = phi x86_fp80 [ %7, %65 ], [ %122, %137 ]
  %74 = phi i32 [ 0, %65 ], [ %123, %137 ]
  %75 = phi i32 [ %66, %65 ], [ %124, %137 ]
  %76 = phi i32 [ %67, %65 ], [ %125, %137 ]
  %77 = phi i64 [ %68, %65 ], [ %126, %137 ]
  %78 = phi i64 [ 0, %65 ], [ %127, %137 ]
  %79 = phi i32 [ %69, %65 ], [ %138, %137 ]
  %80 = add nsw i32 %79, -48
  %81 = icmp ult i32 %80, 10
  %82 = or i32 %79, 32
  br i1 %81, label %91, label %83

83:                                               ; preds = %70
  %84 = add nsw i32 %82, -97
  %85 = icmp ult i32 %84, 6
  %86 = icmp eq i32 %79, 46
  %87 = select i1 %85, i1 true, i1 %86
  br i1 %87, label %88, label %139

88:                                               ; preds = %83
  br i1 %86, label %89, label %91

89:                                               ; preds = %88
  %90 = icmp eq i32 %75, 0
  br i1 %90, label %119, label %139

91:                                               ; preds = %70, %88
  %92 = icmp sgt i32 %79, 57
  %93 = add nsw i32 %82, -87
  %94 = select i1 %92, i32 %93, i32 %80
  %95 = icmp slt i64 %78, 8
  br i1 %95, label %96, label %99

96:                                               ; preds = %91
  %97 = shl i32 %71, 4
  %98 = add i32 %94, %97
  br label %113

99:                                               ; preds = %91
  %100 = icmp ult i64 %78, 17
  br i1 %100, label %101, label %106

101:                                              ; preds = %99
  %102 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 %94, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %103 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 16, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %104 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %73, x86_fp80 %103, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %105 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %102, x86_fp80 %104, x86_fp80 %72, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %113

106:                                              ; preds = %99
  %107 = icmp eq i32 %94, 0
  %108 = icmp ne i32 %74, 0
  %109 = select i1 %107, i1 true, i1 %108
  br i1 %109, label %113, label %110

110:                                              ; preds = %106
  %111 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #6
  %112 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %111, x86_fp80 %73, x86_fp80 %72, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %113

113:                                              ; preds = %101, %110, %106, %96
  %114 = phi i32 [ %98, %96 ], [ %71, %101 ], [ %71, %106 ], [ %71, %110 ]
  %115 = phi x86_fp80 [ %72, %96 ], [ %105, %101 ], [ %72, %106 ], [ %112, %110 ]
  %116 = phi x86_fp80 [ %73, %96 ], [ %104, %101 ], [ %73, %106 ], [ %73, %110 ]
  %117 = phi i32 [ %74, %96 ], [ %74, %101 ], [ %74, %106 ], [ 1, %110 ]
  %118 = add nsw i64 %78, 1
  br label %119

119:                                              ; preds = %89, %113
  %120 = phi i32 [ %114, %113 ], [ %71, %89 ]
  %121 = phi x86_fp80 [ %115, %113 ], [ %72, %89 ]
  %122 = phi x86_fp80 [ %116, %113 ], [ %73, %89 ]
  %123 = phi i32 [ %117, %113 ], [ %74, %89 ]
  %124 = phi i32 [ %75, %113 ], [ 1, %89 ]
  %125 = phi i32 [ 1, %113 ], [ %76, %89 ]
  %126 = phi i64 [ %77, %113 ], [ %78, %89 ]
  %127 = phi i64 [ %118, %113 ], [ %78, %89 ]
  %128 = load i8*, i8** %9, align 8, !tbaa !3
  %129 = load i8*, i8** %11, align 8, !tbaa !10
  %130 = icmp eq i8* %128, %129
  br i1 %130, label %135, label %131

131:                                              ; preds = %119
  %132 = getelementptr inbounds i8, i8* %128, i64 1
  store i8* %132, i8** %9, align 8, !tbaa !3
  %133 = load i8, i8* %128, align 1, !tbaa !11
  %134 = zext i8 %133 to i32
  br label %137

135:                                              ; preds = %119
  %136 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %137

137:                                              ; preds = %135, %131
  %138 = phi i32 [ %136, %135 ], [ %134, %131 ]
  br label %70

139:                                              ; preds = %83, %89
  %140 = phi i32 [ %79, %83 ], [ 46, %89 ]
  %141 = icmp eq i32 %76, 0
  br i1 %141, label %142, label %162

142:                                              ; preds = %139
  %143 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 26
  %144 = load i64, i64* %143, align 8, !tbaa !12
  %145 = icmp sgt i64 %144, -1
  br i1 %145, label %146, label %150

146:                                              ; preds = %142
  %147 = load i8*, i8** %9, align 8, !tbaa !3
  %148 = getelementptr inbounds i8, i8* %147, i64 -1
  store i8* %148, i8** %9, align 8, !tbaa !3
  %149 = icmp eq i32 %4, 0
  br i1 %149, label %157, label %152

150:                                              ; preds = %142
  %151 = icmp eq i32 %4, 0
  br i1 %151, label %157, label %158

152:                                              ; preds = %146
  %153 = getelementptr inbounds i8, i8* %147, i64 -2
  store i8* %153, i8** %9, align 8, !tbaa !3
  %154 = icmp eq i32 %75, 0
  br i1 %154, label %158, label %155

155:                                              ; preds = %152
  %156 = getelementptr inbounds i8, i8* %147, i64 -3
  store i8* %156, i8** %9, align 8, !tbaa !3
  br label %158

157:                                              ; preds = %150, %146
  tail call void @__shlim(%struct._IO_FILE* noundef nonnull %0, i64 noundef 0) #7
  br label %158

158:                                              ; preds = %150, %152, %155, %157
  %159 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %160 = tail call double @llvm.experimental.constrained.fmul.f64(double %159, double 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %161 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %160, metadata !"fpexcept.ignore") #6
  br label %302

162:                                              ; preds = %139
  %163 = icmp eq i32 %75, 0
  %164 = select i1 %163, i64 %78, i64 %77
  %165 = icmp slt i64 %78, 8
  br i1 %165, label %166, label %187

166:                                              ; preds = %162
  %167 = sub i64 0, %78
  %168 = and i64 %167, 7
  %169 = icmp eq i64 %168, 0
  br i1 %169, label %178, label %170

170:                                              ; preds = %166, %170
  %171 = phi i64 [ %175, %170 ], [ %78, %166 ]
  %172 = phi i32 [ %174, %170 ], [ %71, %166 ]
  %173 = phi i64 [ %176, %170 ], [ 0, %166 ]
  %174 = shl i32 %172, 4
  %175 = add i64 %171, 1
  %176 = add i64 %173, 1
  %177 = icmp eq i64 %176, %168
  br i1 %177, label %178, label %170, !llvm.loop !20

178:                                              ; preds = %170, %166
  %179 = phi i32 [ undef, %166 ], [ %174, %170 ]
  %180 = phi i64 [ %78, %166 ], [ %175, %170 ]
  %181 = add i64 %78, -1
  %182 = icmp ult i64 %181, 7
  br i1 %182, label %187, label %183

183:                                              ; preds = %178, %183
  %184 = phi i64 [ %185, %183 ], [ %180, %178 ]
  %185 = add i64 %184, 8
  %186 = icmp eq i64 %184, 0
  br i1 %186, label %187, label %183

187:                                              ; preds = %178, %183, %162
  %188 = phi i32 [ %71, %162 ], [ %179, %178 ], [ 0, %183 ]
  %189 = and i32 %140, -33
  %190 = icmp eq i32 %189, 80
  br i1 %190, label %191, label %202

191:                                              ; preds = %187
  %192 = tail call fastcc i64 @scanexp(%struct._IO_FILE* noundef %0, i32 noundef %4) #9
  %193 = icmp eq i64 %192, -9223372036854775808
  br i1 %193, label %194, label %209

194:                                              ; preds = %191
  %195 = icmp eq i32 %4, 0
  br i1 %195, label %200, label %196

196:                                              ; preds = %194
  %197 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 26
  %198 = load i64, i64* %197, align 8, !tbaa !12
  %199 = icmp sgt i64 %198, -1
  br i1 %199, label %206, label %209

200:                                              ; preds = %194
  tail call void @__shlim(%struct._IO_FILE* noundef %0, i64 noundef 0) #7
  %201 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %302

202:                                              ; preds = %187
  %203 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 26
  %204 = load i64, i64* %203, align 8, !tbaa !12
  %205 = icmp sgt i64 %204, -1
  br i1 %205, label %206, label %209

206:                                              ; preds = %202, %196
  %207 = load i8*, i8** %9, align 8, !tbaa !3
  %208 = getelementptr inbounds i8, i8* %207, i64 -1
  store i8* %208, i8** %9, align 8, !tbaa !3
  br label %209

209:                                              ; preds = %206, %196, %202, %191
  %210 = phi i64 [ %192, %191 ], [ 0, %202 ], [ 0, %196 ], [ 0, %206 ]
  %211 = shl nsw i64 %164, 2
  %212 = add nsw i64 %211, -32
  %213 = add nsw i64 %212, %210
  %214 = icmp eq i32 %188, 0
  br i1 %214, label %215, label %219

215:                                              ; preds = %209
  %216 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %217 = tail call double @llvm.experimental.constrained.fmul.f64(double %216, double 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %218 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %217, metadata !"fpexcept.ignore") #6
  br label %302

219:                                              ; preds = %209
  %220 = sub nsw i32 0, %2
  %221 = zext i32 %220 to i64
  %222 = icmp sgt i64 %213, %221
  br i1 %222, label %223, label %228

223:                                              ; preds = %219
  %224 = tail call i32* @___errno_location() #8
  store i32 34, i32* %224, align 4, !tbaa !13
  %225 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %226 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %225, x86_fp80 0xK7FFEFFFFFFFFFFFFFFFF, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %227 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %226, x86_fp80 0xK7FFEFFFFFFFFFFFFFFFF, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %302

228:                                              ; preds = %219
  %229 = add nsw i32 %2, -128
  %230 = sext i32 %229 to i64
  %231 = icmp slt i64 %213, %230
  br i1 %231, label %234, label %232

232:                                              ; preds = %228
  %233 = icmp sgt i32 %188, -1
  br i1 %233, label %239, label %256

234:                                              ; preds = %228
  %235 = tail call i32* @___errno_location() #8
  store i32 34, i32* %235, align 4, !tbaa !13
  %236 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %237 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %236, x86_fp80 0xK00018000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %238 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %237, x86_fp80 0xK00018000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %302

239:                                              ; preds = %232, %250
  %240 = phi i64 [ %254, %250 ], [ %213, %232 ]
  %241 = phi x86_fp80 [ %253, %250 ], [ %72, %232 ]
  %242 = phi i32 [ %252, %250 ], [ %188, %232 ]
  %243 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #6
  %244 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %241, x86_fp80 %243, metadata !"oge", metadata !"fpexcept.ignore") #6
  %245 = shl nuw i32 %242, 1
  br i1 %244, label %246, label %250

246:                                              ; preds = %239
  %247 = or i32 %245, 1
  %248 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %249 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %241, x86_fp80 %248, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %250

250:                                              ; preds = %239, %246
  %251 = phi x86_fp80 [ %249, %246 ], [ %241, %239 ]
  %252 = phi i32 [ %247, %246 ], [ %245, %239 ]
  %253 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %241, x86_fp80 %251, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %254 = add nsw i64 %240, -1
  %255 = icmp sgt i32 %252, -1
  br i1 %255, label %239, label %256

256:                                              ; preds = %250, %232
  %257 = phi i32 [ %188, %232 ], [ %252, %250 ]
  %258 = phi x86_fp80 [ %72, %232 ], [ %253, %250 ]
  %259 = phi i64 [ %213, %232 ], [ %254, %250 ]
  %260 = zext i32 %1 to i64
  %261 = sext i32 %2 to i64
  %262 = sub nsw i64 32, %261
  %263 = add i64 %262, %259
  %264 = icmp slt i64 %263, %260
  %265 = trunc i64 %263 to i32
  %266 = icmp sgt i32 %265, 0
  %267 = select i1 %266, i32 %265, i32 0
  %268 = select i1 %264, i32 %267, i32 %1
  %269 = icmp slt i32 %268, 64
  br i1 %269, label %270, label %286

270:                                              ; preds = %256
  %271 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %272 = sub i32 95, %268
  %273 = tail call double @scalbn(double noundef %271, i32 noundef %272) #7
  %274 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %273, metadata !"fpexcept.ignore") #6
  %275 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %276 = tail call x86_fp80 @copysignl(x86_fp80 noundef %274, x86_fp80 noundef %275) #7
  %277 = icmp slt i32 %268, 32
  br i1 %277, label %278, label %286

278:                                              ; preds = %270
  %279 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %258, x86_fp80 0xK00000000000000000000, metadata !"une", metadata !"fpexcept.ignore") #6
  %280 = and i32 %257, 1
  %281 = icmp eq i32 %280, 0
  %282 = select i1 %279, i1 %281, i1 false
  br i1 %282, label %283, label %286

283:                                              ; preds = %278
  %284 = add nuw nsw i32 %257, 1
  %285 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %286

286:                                              ; preds = %256, %283, %278, %270
  %287 = phi x86_fp80 [ %276, %283 ], [ %276, %278 ], [ %276, %270 ], [ %8, %256 ]
  %288 = phi i32 [ %284, %283 ], [ %257, %278 ], [ %257, %270 ], [ %257, %256 ]
  %289 = phi x86_fp80 [ %285, %283 ], [ %258, %278 ], [ %258, %270 ], [ %258, %256 ]
  %290 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %291 = tail call x86_fp80 @llvm.experimental.constrained.uitofp.f80.i32(i32 %288, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %292 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %290, x86_fp80 %291, x86_fp80 %287, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %293 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %294 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %293, x86_fp80 %289, x86_fp80 %292, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %295 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %294, x86_fp80 %287, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %296 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %295, x86_fp80 0xK00000000000000000000, metadata !"une", metadata !"fpexcept.ignore") #6
  br i1 %296, label %299, label %297

297:                                              ; preds = %286
  %298 = tail call i32* @___errno_location() #8
  store i32 34, i32* %298, align 4, !tbaa !13
  br label %299

299:                                              ; preds = %297, %286
  %300 = trunc i64 %259 to i32
  %301 = tail call x86_fp80 @scalbnl(x86_fp80 noundef %295, i32 noundef %300) #7
  br label %302

302:                                              ; preds = %299, %234, %223, %215, %200, %158
  %303 = phi x86_fp80 [ %227, %223 ], [ %238, %234 ], [ %301, %299 ], [ %218, %215 ], [ %201, %200 ], [ %161, %158 ]
  ret x86_fp80 %303
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

; Function Attrs: nounwind strictfp
define internal fastcc i64 @scanexp(%struct._IO_FILE* noundef %0, i32 noundef %1) unnamed_addr #0 {
  %3 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  %4 = load i8*, i8** %3, align 8, !tbaa !3
  %5 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 25
  %6 = load i8*, i8** %5, align 8, !tbaa !10
  %7 = icmp eq i8* %4, %6
  br i1 %7, label %12, label %8

8:                                                ; preds = %2
  %9 = getelementptr inbounds i8, i8* %4, i64 1
  store i8* %9, i8** %3, align 8, !tbaa !3
  %10 = load i8, i8* %4, align 1, !tbaa !11
  %11 = zext i8 %10 to i32
  br label %14

12:                                               ; preds = %2
  %13 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %14

14:                                               ; preds = %12, %8
  %15 = phi i32 [ %11, %8 ], [ %13, %12 ]
  %16 = icmp eq i32 %15, 45
  switch i32 %15, label %17 [
    i32 45, label %19
    i32 43, label %19
  ]

17:                                               ; preds = %14
  %18 = add i32 %15, -58
  br label %42

19:                                               ; preds = %14, %14
  %20 = load i8*, i8** %3, align 8, !tbaa !3
  %21 = load i8*, i8** %5, align 8, !tbaa !10
  %22 = icmp eq i8* %20, %21
  br i1 %22, label %27, label %23

23:                                               ; preds = %19
  %24 = getelementptr inbounds i8, i8* %20, i64 1
  store i8* %24, i8** %3, align 8, !tbaa !3
  %25 = load i8, i8* %20, align 1, !tbaa !11
  %26 = zext i8 %25 to i32
  br label %29

27:                                               ; preds = %19
  %28 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %29

29:                                               ; preds = %27, %23
  %30 = phi i32 [ %26, %23 ], [ %28, %27 ]
  %31 = add i32 %30, -58
  %32 = icmp ult i32 %31, -10
  %33 = icmp ne i32 %1, 0
  %34 = and i1 %33, %32
  br i1 %34, label %35, label %42

35:                                               ; preds = %29
  %36 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 26
  %37 = load i64, i64* %36, align 8, !tbaa !12
  %38 = icmp sgt i64 %37, -1
  br i1 %38, label %39, label %50

39:                                               ; preds = %35
  %40 = load i8*, i8** %3, align 8, !tbaa !3
  %41 = getelementptr inbounds i8, i8* %40, i64 -1
  store i8* %41, i8** %3, align 8, !tbaa !3
  br label %50

42:                                               ; preds = %17, %29
  %43 = phi i32 [ %18, %17 ], [ %31, %29 ]
  %44 = phi i32 [ %15, %17 ], [ %30, %29 ]
  %45 = phi i1 [ false, %17 ], [ %16, %29 ]
  %46 = icmp ult i32 %43, -10
  br i1 %46, label %50, label %47

47:                                               ; preds = %42
  %48 = add nsw i32 %44, -48
  %49 = icmp ult i32 %48, 10
  br i1 %49, label %57, label %80

50:                                               ; preds = %39, %35, %42
  %51 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 26
  %52 = load i64, i64* %51, align 8, !tbaa !12
  %53 = icmp sgt i64 %52, -1
  br i1 %53, label %54, label %135

54:                                               ; preds = %50
  %55 = load i8*, i8** %3, align 8, !tbaa !3
  %56 = getelementptr inbounds i8, i8* %55, i64 -1
  store i8* %56, i8** %3, align 8, !tbaa !3
  br label %135

57:                                               ; preds = %47, %72
  %58 = phi i32 [ %62, %72 ], [ 0, %47 ]
  %59 = phi i32 [ %73, %72 ], [ %44, %47 ]
  %60 = mul nsw i32 %58, 10
  %61 = add nsw i32 %59, -48
  %62 = add i32 %61, %60
  %63 = load i8*, i8** %3, align 8, !tbaa !3
  %64 = load i8*, i8** %5, align 8, !tbaa !10
  %65 = icmp eq i8* %63, %64
  br i1 %65, label %70, label %66

66:                                               ; preds = %57
  %67 = getelementptr inbounds i8, i8* %63, i64 1
  store i8* %67, i8** %3, align 8, !tbaa !3
  %68 = load i8, i8* %63, align 1, !tbaa !11
  %69 = zext i8 %68 to i32
  br label %72

70:                                               ; preds = %57
  %71 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %72

72:                                               ; preds = %70, %66
  %73 = phi i32 [ %69, %66 ], [ %71, %70 ]
  %74 = add nsw i32 %73, -48
  %75 = icmp ult i32 %74, 10
  %76 = icmp slt i32 %62, 214748364
  %77 = select i1 %75, i1 %76, i1 false
  br i1 %77, label %57, label %78

78:                                               ; preds = %72
  %79 = sext i32 %62 to i64
  br label %80

80:                                               ; preds = %78, %47
  %81 = phi i32 [ %74, %78 ], [ %48, %47 ]
  %82 = phi i32 [ %73, %78 ], [ %44, %47 ]
  %83 = phi i64 [ %79, %78 ], [ 0, %47 ]
  %84 = icmp ult i32 %81, 10
  br i1 %84, label %89, label %85

85:                                               ; preds = %105, %80
  %86 = phi i32 [ %81, %80 ], [ %107, %105 ]
  %87 = phi i64 [ %83, %80 ], [ %95, %105 ]
  %88 = icmp ult i32 %86, 10
  br i1 %88, label %111, label %125

89:                                               ; preds = %80, %105
  %90 = phi i64 [ %95, %105 ], [ %83, %80 ]
  %91 = phi i32 [ %106, %105 ], [ %82, %80 ]
  %92 = mul nsw i64 %90, 10
  %93 = zext i32 %91 to i64
  %94 = add nsw i64 %93, -48
  %95 = add i64 %94, %92
  %96 = load i8*, i8** %3, align 8, !tbaa !3
  %97 = load i8*, i8** %5, align 8, !tbaa !10
  %98 = icmp eq i8* %96, %97
  br i1 %98, label %103, label %99

99:                                               ; preds = %89
  %100 = getelementptr inbounds i8, i8* %96, i64 1
  store i8* %100, i8** %3, align 8, !tbaa !3
  %101 = load i8, i8* %96, align 1, !tbaa !11
  %102 = zext i8 %101 to i32
  br label %105

103:                                              ; preds = %89
  %104 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %105

105:                                              ; preds = %103, %99
  %106 = phi i32 [ %102, %99 ], [ %104, %103 ]
  %107 = add nsw i32 %106, -48
  %108 = icmp ult i32 %107, 10
  %109 = icmp slt i64 %95, 92233720368547758
  %110 = select i1 %108, i1 %109, i1 false
  br i1 %110, label %89, label %85

111:                                              ; preds = %85, %121
  %112 = load i8*, i8** %3, align 8, !tbaa !3
  %113 = load i8*, i8** %5, align 8, !tbaa !10
  %114 = icmp eq i8* %112, %113
  br i1 %114, label %119, label %115

115:                                              ; preds = %111
  %116 = getelementptr inbounds i8, i8* %112, i64 1
  store i8* %116, i8** %3, align 8, !tbaa !3
  %117 = load i8, i8* %112, align 1, !tbaa !11
  %118 = zext i8 %117 to i32
  br label %121

119:                                              ; preds = %111
  %120 = tail call i32 @__shgetc(%struct._IO_FILE* noundef nonnull %0) #7
  br label %121

121:                                              ; preds = %119, %115
  %122 = phi i32 [ %118, %115 ], [ %120, %119 ]
  %123 = add nsw i32 %122, -48
  %124 = icmp ult i32 %123, 10
  br i1 %124, label %111, label %125

125:                                              ; preds = %121, %85
  %126 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 26
  %127 = load i64, i64* %126, align 8, !tbaa !12
  %128 = icmp sgt i64 %127, -1
  br i1 %128, label %129, label %132

129:                                              ; preds = %125
  %130 = load i8*, i8** %3, align 8, !tbaa !3
  %131 = getelementptr inbounds i8, i8* %130, i64 -1
  store i8* %131, i8** %3, align 8, !tbaa !3
  br label %132

132:                                              ; preds = %125, %129
  %133 = sub nsw i64 0, %87
  %134 = select i1 %45, i64 %133, i64 %87
  br label %135

135:                                              ; preds = %54, %50, %132
  %136 = phi i64 [ %134, %132 ], [ -9223372036854775808, %50 ], [ -9223372036854775808, %54 ]
  ret i64 %136
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #2

declare x86_fp80 @copysignl(x86_fp80 noundef, x86_fp80 noundef) local_unnamed_addr #3

declare double @scalbn(double noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.uitofp.f80.i32(i32, metadata, metadata) #2

declare x86_fp80 @scalbnl(x86_fp80 noundef, i32 noundef) local_unnamed_addr #3

declare x86_fp80 @fmodl(x86_fp80 noundef, x86_fp80 noundef) local_unnamed_addr #3

declare x86_fp80 @fabsl(x86_fp80 noundef) local_unnamed_addr #3

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.mul.v4i32(<4 x i32>) #5

attributes #0 = { nounwind strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree nosync nounwind readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nosync nounwind readnone willreturn }
attributes #6 = { strictfp }
attributes #7 = { nobuiltin nounwind strictfp "no-builtins" }
attributes #8 = { nobuiltin nounwind readnone strictfp willreturn "no-builtins" }
attributes #9 = { nobuiltin strictfp "no-builtins" }
attributes #10 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !8, i64 8}
!4 = !{!"_IO_FILE", !5, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !9, i64 96, !8, i64 104, !8, i64 112, !5, i64 120, !5, i64 124, !9, i64 128, !5, i64 136, !5, i64 140, !5, i64 144, !8, i64 152, !9, i64 160, !8, i64 168, !8, i64 176, !8, i64 184, !9, i64 192, !9, i64 200, !8, i64 208, !8, i64 216, !8, i64 224}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{!4, !8, i64 184}
!11 = !{!6, !6, i64 0}
!12 = !{!4, !9, i64 192}
!13 = !{!5, !5, i64 0}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.isvectorized", i32 1}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.unroll.disable"}
!18 = distinct !{!18, !19, !15}
!19 = !{!"llvm.loop.unroll.runtime.disable"}
!20 = distinct !{!20, !17}
