; ModuleID = 'src/stdio/vfwscanf.c'
source_filename = "src/stdio/vfwscanf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@vfwscanf.size_pfx = internal constant [6 x [3 x i8]] [[3 x i8] c"hh\00", [3 x i8] c"h\00\00", [3 x i8] zeroinitializer, [3 x i8] c"l\00\00", [3 x i8] c"L\00\00", [3 x i8] c"ll\00"], align 16
@.str = private unnamed_addr constant [1 x i32] zeroinitializer, align 4
@vfwscanf.spaces = internal unnamed_addr constant [22 x i32] [i32 32, i32 9, i32 10, i32 13, i32 11, i32 12, i32 133, i32 8192, i32 8193, i32 8194, i32 8195, i32 8196, i32 8197, i32 8198, i32 8200, i32 8201, i32 8202, i32 8232, i32 8233, i32 8287, i32 12288, i32 0], align 16
@.str.1 = private unnamed_addr constant [18 x i8] c"%.*s%.0d%s%c%%lln\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%*\00", align 1

@__isoc99_vfwscanf = weak alias i32 (%struct._IO_FILE*, i32*, %struct.__va_list_tag*), i32 (%struct._IO_FILE*, i32*, %struct.__va_list_tag*)* @vfwscanf

; Function Attrs: nounwind optsize strictfp
define i32 @vfwscanf(%struct._IO_FILE* noalias noundef %0, i32* noalias nocapture noundef readonly %1, %struct.__va_list_tag* noundef %2) #0 {
  %4 = alloca [1 x %struct.__va_list_tag], align 16
  %5 = alloca i64, align 8
  %6 = alloca [22 x i8], align 16
  %7 = bitcast i64* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %7) #4
  %8 = getelementptr inbounds [22 x i8], [22 x i8]* %6, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %8) #4
  %9 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 19
  %10 = load volatile i32, i32* %9, align 4, !tbaa !3
  %11 = icmp sgt i32 %10, -1
  br i1 %11, label %12, label %14

12:                                               ; preds = %3
  %13 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull %0) #5
  br label %14

14:                                               ; preds = %3, %12
  %15 = phi i32 [ %13, %12 ], [ 0, %3 ]
  %16 = tail call i32 @fwide(%struct._IO_FILE* noundef nonnull %0, i32 noundef 1) #5
  %17 = load i32, i32* %1, align 4, !tbaa !10
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %559, label %19

19:                                               ; preds = %14
  %20 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  %21 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 2
  %22 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %23 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %24 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %25 = bitcast [1 x %struct.__va_list_tag]* %4 to i8*
  %26 = bitcast %struct.__va_list_tag* %2 to i8*
  %27 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %4, i64 0, i64 0, i32 0
  %28 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %4, i64 0, i64 0, i32 2
  %29 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %4, i64 0, i64 0, i32 3
  br label %30

30:                                               ; preds = %19, %533
  %31 = phi i32 [ %17, %19 ], [ %541, %533 ]
  %32 = phi i64 [ undef, %19 ], [ %539, %533 ]
  %33 = phi i64 [ 0, %19 ], [ %538, %533 ]
  %34 = phi i32 [ 0, %19 ], [ %537, %533 ]
  %35 = phi i32* [ undef, %19 ], [ %536, %533 ]
  %36 = phi i8* [ undef, %19 ], [ %535, %533 ]
  %37 = phi i32* [ %1, %19 ], [ %540, %533 ]
  %38 = call i32 @iswspace(i32 noundef %31) #5
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %75, label %40

40:                                               ; preds = %30, %40
  %41 = phi i32* [ %42, %40 ], [ %37, %30 ]
  %42 = getelementptr inbounds i32, i32* %41, i64 1
  %43 = load i32, i32* %42, align 4, !tbaa !10
  %44 = call i32 @iswspace(i32 noundef %43) #5
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %40

46:                                               ; preds = %40, %60
  %47 = phi i64 [ %64, %60 ], [ %33, %40 ]
  %48 = load i8*, i8** %20, align 8, !tbaa !11
  %49 = load i8*, i8** %21, align 8, !tbaa !12
  %50 = icmp eq i8* %48, %49
  br i1 %50, label %58, label %51

51:                                               ; preds = %46
  %52 = load i8, i8* %48, align 1, !tbaa !13
  %53 = icmp sgt i8 %52, -1
  br i1 %53, label %54, label %58

54:                                               ; preds = %51
  %55 = getelementptr inbounds i8, i8* %48, i64 1
  store i8* %55, i8** %20, align 8, !tbaa !11
  %56 = load i8, i8* %48, align 1, !tbaa !13
  %57 = zext i8 %56 to i32
  br label %60

58:                                               ; preds = %51, %46
  %59 = call i32 @getwc(%struct._IO_FILE* noundef nonnull %0) #5
  br label %60

60:                                               ; preds = %58, %54
  %61 = phi i32 [ %57, %54 ], [ %59, %58 ]
  %62 = call i32 @iswspace(i32 noundef %61) #5
  %63 = icmp eq i32 %62, 0
  %64 = add nsw i64 %47, 1
  br i1 %63, label %65, label %46

65:                                               ; preds = %60
  %66 = load i8*, i8** %21, align 8, !tbaa !12
  %67 = icmp ne i8* %66, null
  %68 = icmp ult i32 %61, 128
  %69 = and i1 %68, %67
  br i1 %69, label %70, label %73

70:                                               ; preds = %65
  %71 = load i8*, i8** %20, align 8, !tbaa !11
  %72 = getelementptr inbounds i8, i8* %71, i64 -1
  store i8* %72, i8** %20, align 8, !tbaa !11
  br label %533

73:                                               ; preds = %65
  %74 = call i32 @ungetwc(i32 noundef %61, %struct._IO_FILE* noundef nonnull %0) #5
  br label %533

75:                                               ; preds = %30
  %76 = load i32, i32* %37, align 4, !tbaa !10
  %77 = icmp eq i32 %76, 37
  br i1 %77, label %78, label %100

78:                                               ; preds = %75
  %79 = getelementptr inbounds i32, i32* %37, i64 1
  %80 = load i32, i32* %79, align 4, !tbaa !10
  switch i32 %80, label %136 [
    i32 37, label %81
    i32 42, label %134
  ]

81:                                               ; preds = %78, %95
  %82 = phi i64 [ %99, %95 ], [ %33, %78 ]
  %83 = load i8*, i8** %20, align 8, !tbaa !11
  %84 = load i8*, i8** %21, align 8, !tbaa !12
  %85 = icmp eq i8* %83, %84
  br i1 %85, label %93, label %86

86:                                               ; preds = %81
  %87 = load i8, i8* %83, align 1, !tbaa !13
  %88 = icmp sgt i8 %87, -1
  br i1 %88, label %89, label %93

89:                                               ; preds = %86
  %90 = getelementptr inbounds i8, i8* %83, i64 1
  store i8* %90, i8** %20, align 8, !tbaa !11
  %91 = load i8, i8* %83, align 1, !tbaa !13
  %92 = zext i8 %91 to i32
  br label %95

93:                                               ; preds = %86, %81
  %94 = call i32 @getwc(%struct._IO_FILE* noundef nonnull %0) #5
  br label %95

95:                                               ; preds = %93, %89
  %96 = phi i32 [ %92, %89 ], [ %94, %93 ]
  %97 = call i32 @iswspace(i32 noundef %96) #5
  %98 = icmp eq i32 %97, 0
  %99 = add nsw i64 %82, 1
  br i1 %98, label %113, label %81

100:                                              ; preds = %75
  %101 = load i8*, i8** %20, align 8, !tbaa !11
  %102 = load i8*, i8** %21, align 8, !tbaa !12
  %103 = icmp eq i8* %101, %102
  br i1 %103, label %111, label %104

104:                                              ; preds = %100
  %105 = load i8, i8* %101, align 1, !tbaa !13
  %106 = icmp sgt i8 %105, -1
  br i1 %106, label %107, label %111

107:                                              ; preds = %104
  %108 = getelementptr inbounds i8, i8* %101, i64 1
  store i8* %108, i8** %20, align 8, !tbaa !11
  %109 = load i8, i8* %101, align 1, !tbaa !13
  %110 = zext i8 %109 to i32
  br label %113

111:                                              ; preds = %104, %100
  %112 = call i32 @getwc(%struct._IO_FILE* noundef nonnull %0) #5
  br label %113

113:                                              ; preds = %95, %107, %111
  %114 = phi i32* [ %37, %111 ], [ %37, %107 ], [ %79, %95 ]
  %115 = phi i32 [ %112, %111 ], [ %110, %107 ], [ %96, %95 ]
  %116 = phi i64 [ %33, %111 ], [ %33, %107 ], [ %82, %95 ]
  %117 = load i32, i32* %114, align 4, !tbaa !10
  %118 = icmp eq i32 %115, %117
  br i1 %118, label %132, label %119

119:                                              ; preds = %113
  %120 = load i8*, i8** %21, align 8, !tbaa !12
  %121 = icmp ne i8* %120, null
  %122 = icmp ult i32 %115, 128
  %123 = select i1 %121, i1 %122, i1 false
  br i1 %123, label %124, label %127

124:                                              ; preds = %119
  %125 = load i8*, i8** %20, align 8, !tbaa !11
  %126 = getelementptr inbounds i8, i8* %125, i64 -1
  store i8* %126, i8** %20, align 8, !tbaa !11
  br label %559

127:                                              ; preds = %119
  %128 = call i32 @ungetwc(i32 noundef %115, %struct._IO_FILE* noundef nonnull %0) #5
  %129 = icmp sgt i32 %115, -1
  %130 = icmp ne i32 %34, 0
  %131 = select i1 %129, i1 true, i1 %130
  br i1 %131, label %559, label %547

132:                                              ; preds = %113
  %133 = add nsw i64 %116, 1
  br label %533

134:                                              ; preds = %78
  %135 = getelementptr inbounds i32, i32* %37, i64 2
  br label %193

136:                                              ; preds = %78
  %137 = add i32 %80, -48
  %138 = icmp ult i32 %137, 10
  br i1 %138, label %139, label %178

139:                                              ; preds = %136
  %140 = getelementptr inbounds i32, i32* %37, i64 2
  %141 = load i32, i32* %140, align 4, !tbaa !10
  %142 = icmp eq i32 %141, 36
  br i1 %142, label %143, label %178

143:                                              ; preds = %139
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %25) #4
  call void @llvm.va_copy(i8* nonnull %25, i8* %26) #4
  %144 = icmp ugt i32 %137, 1
  %145 = load i32, i32* %27, align 16
  br i1 %144, label %146, label %162

146:                                              ; preds = %143
  %147 = load i8*, i8** %28, align 8
  br label %148

148:                                              ; preds = %157, %146
  %149 = phi i8* [ %147, %146 ], [ %158, %157 ]
  %150 = phi i32 [ %145, %146 ], [ %159, %157 ]
  %151 = phi i32 [ %137, %146 ], [ %160, %157 ]
  %152 = icmp ult i32 %150, 41
  br i1 %152, label %153, label %155

153:                                              ; preds = %148
  %154 = add nuw nsw i32 %150, 8
  store i32 %154, i32* %27, align 16
  br label %157

155:                                              ; preds = %148
  %156 = getelementptr i8, i8* %149, i64 8
  store i8* %156, i8** %28, align 8
  br label %157

157:                                              ; preds = %155, %153
  %158 = phi i8* [ %156, %155 ], [ %149, %153 ]
  %159 = phi i32 [ %150, %155 ], [ %154, %153 ]
  %160 = add i32 %151, -1
  %161 = icmp ugt i32 %160, 1
  br i1 %161, label %148, label %162

162:                                              ; preds = %157, %143
  %163 = phi i32 [ %145, %143 ], [ %159, %157 ]
  %164 = icmp ult i32 %163, 41
  br i1 %164, label %165, label %170

165:                                              ; preds = %162
  %166 = load i8*, i8** %29, align 16
  %167 = zext i32 %163 to i64
  %168 = getelementptr i8, i8* %166, i64 %167
  %169 = add nuw nsw i32 %163, 8
  store i32 %169, i32* %27, align 16
  br label %173

170:                                              ; preds = %162
  %171 = load i8*, i8** %28, align 8
  %172 = getelementptr i8, i8* %171, i64 8
  store i8* %172, i8** %28, align 8
  br label %173

173:                                              ; preds = %165, %170
  %174 = phi i8* [ %168, %165 ], [ %171, %170 ]
  %175 = bitcast i8* %174 to i8**
  %176 = load i8*, i8** %175, align 8
  call void @llvm.va_end(i8* nonnull %25) #4
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %25) #4
  %177 = getelementptr inbounds i32, i32* %37, i64 3
  br label %193

178:                                              ; preds = %139, %136
  %179 = load i32, i32* %22, align 8
  %180 = icmp ult i32 %179, 41
  br i1 %180, label %181, label %186

181:                                              ; preds = %178
  %182 = load i8*, i8** %24, align 8
  %183 = zext i32 %179 to i64
  %184 = getelementptr i8, i8* %182, i64 %183
  %185 = add nuw nsw i32 %179, 8
  store i32 %185, i32* %22, align 8
  br label %189

186:                                              ; preds = %178
  %187 = load i8*, i8** %23, align 8
  %188 = getelementptr i8, i8* %187, i64 8
  store i8* %188, i8** %23, align 8
  br label %189

189:                                              ; preds = %186, %181
  %190 = phi i8* [ %184, %181 ], [ %187, %186 ]
  %191 = bitcast i8* %190 to i8**
  %192 = load i8*, i8** %191, align 8
  br label %193

193:                                              ; preds = %173, %189, %134
  %194 = phi i32* [ %135, %134 ], [ %177, %173 ], [ %79, %189 ]
  %195 = phi i8* [ null, %134 ], [ %176, %173 ], [ %192, %189 ]
  %196 = load i32, i32* %194, align 4, !tbaa !10
  %197 = add i32 %196, -48
  %198 = icmp ult i32 %197, 10
  br i1 %198, label %199, label %210

199:                                              ; preds = %193, %199
  %200 = phi i32 [ %207, %199 ], [ %196, %193 ]
  %201 = phi i32 [ %205, %199 ], [ 0, %193 ]
  %202 = phi i32* [ %206, %199 ], [ %194, %193 ]
  %203 = mul nsw i32 %201, 10
  %204 = add nsw i32 %200, -48
  %205 = add i32 %204, %203
  %206 = getelementptr inbounds i32, i32* %202, i64 1
  %207 = load i32, i32* %206, align 4, !tbaa !10
  %208 = add i32 %207, -48
  %209 = icmp ult i32 %208, 10
  br i1 %209, label %199, label %210

210:                                              ; preds = %199, %193
  %211 = phi i32* [ %194, %193 ], [ %206, %199 ]
  %212 = phi i32 [ 0, %193 ], [ %205, %199 ]
  %213 = phi i32 [ %196, %193 ], [ %207, %199 ]
  %214 = icmp eq i32 %213, 109
  br i1 %214, label %215, label %220

215:                                              ; preds = %210
  %216 = icmp ne i8* %195, null
  %217 = zext i1 %216 to i32
  %218 = getelementptr inbounds i32, i32* %211, i64 1
  %219 = load i32, i32* %218, align 4, !tbaa !10
  br label %220

220:                                              ; preds = %210, %215
  %221 = phi i32 [ %213, %210 ], [ %219, %215 ]
  %222 = phi i32* [ %211, %210 ], [ %218, %215 ]
  %223 = phi i8* [ %36, %210 ], [ null, %215 ]
  %224 = phi i32* [ %35, %210 ], [ null, %215 ]
  %225 = phi i32 [ 0, %210 ], [ %217, %215 ]
  %226 = getelementptr inbounds i32, i32* %222, i64 1
  switch i32 %221, label %543 [
    i32 104, label %227
    i32 108, label %233
    i32 106, label %242
    i32 122, label %239
    i32 116, label %239
    i32 76, label %240
    i32 100, label %241
    i32 105, label %241
    i32 111, label %241
    i32 117, label %241
    i32 120, label %241
    i32 97, label %241
    i32 101, label %241
    i32 102, label %241
    i32 103, label %241
    i32 65, label %241
    i32 69, label %241
    i32 70, label %241
    i32 71, label %241
    i32 88, label %241
    i32 115, label %241
    i32 99, label %241
    i32 91, label %241
    i32 83, label %241
    i32 67, label %241
    i32 112, label %241
    i32 110, label %241
  ]

227:                                              ; preds = %220
  %228 = load i32, i32* %226, align 4, !tbaa !10
  %229 = icmp eq i32 %228, 104
  %230 = getelementptr inbounds i32, i32* %222, i64 2
  %231 = select i1 %229, i32* %230, i32* %226
  %232 = select i1 %229, i32 -2, i32 -1
  br label %242

233:                                              ; preds = %220
  %234 = load i32, i32* %226, align 4, !tbaa !10
  %235 = icmp eq i32 %234, 108
  %236 = getelementptr inbounds i32, i32* %222, i64 2
  %237 = select i1 %235, i32* %236, i32* %226
  %238 = select i1 %235, i32 3, i32 1
  br label %242

239:                                              ; preds = %220, %220
  br label %242

240:                                              ; preds = %220
  br label %242

241:                                              ; preds = %220, %220, %220, %220, %220, %220, %220, %220, %220, %220, %220, %220, %220, %220, %220, %220, %220, %220, %220, %220, %220
  br label %242

242:                                              ; preds = %233, %227, %220, %241, %240, %239
  %243 = phi i32* [ %222, %241 ], [ %226, %240 ], [ %226, %239 ], [ %226, %220 ], [ %231, %227 ], [ %237, %233 ]
  %244 = phi i32 [ 0, %241 ], [ 2, %240 ], [ 1, %239 ], [ 3, %220 ], [ %232, %227 ], [ %238, %233 ]
  %245 = load i32, i32* %243, align 4, !tbaa !10
  %246 = and i32 %245, 47
  %247 = icmp eq i32 %246, 3
  %248 = or i32 %245, 32
  %249 = select i1 %247, i32 %248, i32 %245
  %250 = select i1 %247, i32 1, i32 %244
  switch i32 %249, label %251 [
    i32 110, label %305
    i32 91, label %273
  ]

251:                                              ; preds = %242
  %252 = and i32 %249, -33
  %253 = icmp eq i32 %252, 67
  br i1 %253, label %273, label %254

254:                                              ; preds = %251, %268
  %255 = phi i64 [ %272, %268 ], [ %33, %251 ]
  %256 = load i8*, i8** %20, align 8, !tbaa !11
  %257 = load i8*, i8** %21, align 8, !tbaa !12
  %258 = icmp eq i8* %256, %257
  br i1 %258, label %266, label %259

259:                                              ; preds = %254
  %260 = load i8, i8* %256, align 1, !tbaa !13
  %261 = icmp sgt i8 %260, -1
  br i1 %261, label %262, label %266

262:                                              ; preds = %259
  %263 = getelementptr inbounds i8, i8* %256, i64 1
  store i8* %263, i8** %20, align 8, !tbaa !11
  %264 = load i8, i8* %256, align 1, !tbaa !13
  %265 = zext i8 %264 to i32
  br label %268

266:                                              ; preds = %259, %254
  %267 = call i32 @getwc(%struct._IO_FILE* noundef nonnull %0) #5
  br label %268

268:                                              ; preds = %266, %262
  %269 = phi i32 [ %265, %262 ], [ %267, %266 ]
  %270 = call i32 @iswspace(i32 noundef %269) #5
  %271 = icmp eq i32 %270, 0
  %272 = add nsw i64 %255, 1
  br i1 %271, label %286, label %254

273:                                              ; preds = %242, %251
  %274 = load i8*, i8** %20, align 8, !tbaa !11
  %275 = load i8*, i8** %21, align 8, !tbaa !12
  %276 = icmp eq i8* %274, %275
  br i1 %276, label %284, label %277

277:                                              ; preds = %273
  %278 = load i8, i8* %274, align 1, !tbaa !13
  %279 = icmp sgt i8 %278, -1
  br i1 %279, label %280, label %284

280:                                              ; preds = %277
  %281 = getelementptr inbounds i8, i8* %274, i64 1
  store i8* %281, i8** %20, align 8, !tbaa !11
  %282 = load i8, i8* %274, align 1, !tbaa !13
  %283 = zext i8 %282 to i32
  br label %292

284:                                              ; preds = %277, %273
  %285 = call i32 @getwc(%struct._IO_FILE* noundef nonnull %0) #5
  br label %286

286:                                              ; preds = %268, %284
  %287 = phi i32 [ %285, %284 ], [ %269, %268 ]
  %288 = phi i64 [ %33, %284 ], [ %255, %268 ]
  %289 = icmp slt i32 %287, 0
  br i1 %289, label %543, label %290

290:                                              ; preds = %286
  %291 = load i8*, i8** %21, align 8, !tbaa !12
  br label %292

292:                                              ; preds = %290, %280
  %293 = phi i8* [ %275, %280 ], [ %291, %290 ]
  %294 = phi i64 [ %33, %280 ], [ %288, %290 ]
  %295 = phi i32 [ %283, %280 ], [ %287, %290 ]
  %296 = icmp ne i8* %293, null
  %297 = icmp ult i32 %295, 128
  %298 = select i1 %296, i1 %297, i1 false
  br i1 %298, label %299, label %302

299:                                              ; preds = %292
  %300 = load i8*, i8** %20, align 8, !tbaa !11
  %301 = getelementptr inbounds i8, i8* %300, i64 -1
  store i8* %301, i8** %20, align 8, !tbaa !11
  br label %304

302:                                              ; preds = %292
  %303 = call i32 @ungetwc(i32 noundef %295, %struct._IO_FILE* noundef nonnull %0) #5
  br label %304

304:                                              ; preds = %299, %302
  switch i32 %249, label %543 [
    i32 110, label %305
    i32 115, label %321
    i32 99, label %321
    i32 91, label %321
    i32 100, label %507
    i32 105, label %507
    i32 111, label %507
    i32 117, label %507
    i32 120, label %507
    i32 97, label %507
    i32 101, label %507
    i32 102, label %507
    i32 103, label %507
    i32 65, label %507
    i32 69, label %507
    i32 70, label %507
    i32 71, label %507
    i32 88, label %507
    i32 112, label %507
  ]

305:                                              ; preds = %242, %304
  %306 = phi i64 [ %294, %304 ], [ %33, %242 ]
  %307 = icmp eq i8* %195, null
  br i1 %307, label %533, label %308

308:                                              ; preds = %305
  switch i32 %250, label %533 [
    i32 -2, label %309
    i32 -1, label %311
    i32 0, label %314
    i32 1, label %317
    i32 3, label %319
  ]

309:                                              ; preds = %308
  %310 = trunc i64 %306 to i8
  store i8 %310, i8* %195, align 1, !tbaa !13
  br label %533

311:                                              ; preds = %308
  %312 = trunc i64 %306 to i16
  %313 = bitcast i8* %195 to i16*
  store i16 %312, i16* %313, align 2, !tbaa !14
  br label %533

314:                                              ; preds = %308
  %315 = trunc i64 %306 to i32
  %316 = bitcast i8* %195 to i32*
  store i32 %315, i32* %316, align 4, !tbaa !10
  br label %533

317:                                              ; preds = %308
  %318 = bitcast i8* %195 to i64*
  store i64 %306, i64* %318, align 8, !tbaa !16
  br label %533

319:                                              ; preds = %308
  %320 = bitcast i8* %195 to i64*
  store i64 %306, i64* %320, align 8, !tbaa !17
  br label %533

321:                                              ; preds = %304, %304, %304
  %322 = icmp eq i32 %249, 99
  br i1 %322, label %323, label %326

323:                                              ; preds = %321
  %324 = icmp sgt i32 %212, 1
  %325 = select i1 %324, i32 %212, i32 1
  br label %344

326:                                              ; preds = %321
  %327 = icmp eq i32 %249, 115
  br i1 %327, label %344, label %328

328:                                              ; preds = %326
  %329 = getelementptr inbounds i32, i32* %243, i64 1
  %330 = load i32, i32* %329, align 4, !tbaa !10
  %331 = icmp eq i32 %330, 94
  %332 = getelementptr inbounds i32, i32* %243, i64 2
  %333 = select i1 %331, i32* %332, i32* %329
  %334 = zext i1 %331 to i32
  %335 = load i32, i32* %333, align 4, !tbaa !10
  %336 = icmp eq i32 %335, 93
  %337 = zext i1 %336 to i64
  %338 = getelementptr i32, i32* %333, i64 %337
  br label %339

339:                                              ; preds = %342, %328
  %340 = phi i32* [ %338, %328 ], [ %343, %342 ]
  %341 = load i32, i32* %340, align 4, !tbaa !10
  switch i32 %341, label %342 [
    i32 93, label %344
    i32 0, label %543
  ]

342:                                              ; preds = %339
  %343 = getelementptr inbounds i32, i32* %340, i64 1
  br label %339

344:                                              ; preds = %339, %326, %323
  %345 = phi i32* [ %243, %323 ], [ %243, %326 ], [ %340, %339 ]
  %346 = phi i32 [ 1, %323 ], [ 1, %326 ], [ %334, %339 ]
  %347 = phi i32* [ getelementptr inbounds ([1 x i32], [1 x i32]* @.str, i64 0, i64 0), %323 ], [ getelementptr inbounds ([22 x i32], [22 x i32]* @vfwscanf.spaces, i64 0, i64 0), %326 ], [ %333, %339 ]
  %348 = phi i32 [ %325, %323 ], [ %212, %326 ], [ %212, %339 ]
  %349 = icmp eq i32 %250, 0
  %350 = select i1 %349, i8* %195, i8* null
  %351 = icmp eq i32 %250, 1
  %352 = bitcast i8* %195 to i32*
  %353 = select i1 %351, i32* %352, i32* null
  %354 = icmp slt i32 %348, 1
  %355 = select i1 %354, i32 -1, i32 %348
  %356 = icmp eq i32 %225, 0
  br i1 %356, label %369, label %357

357:                                              ; preds = %344
  %358 = add i32 %355, 1
  %359 = select i1 %322, i32 %358, i32 31
  %360 = zext i32 %359 to i64
  br i1 %351, label %361, label %366

361:                                              ; preds = %357
  %362 = shl nuw nsw i64 %360, 2
  %363 = call i8* @malloc(i64 noundef %362) #5
  %364 = bitcast i8* %363 to i32*
  %365 = icmp eq i8* %363, null
  br i1 %365, label %543, label %369

366:                                              ; preds = %357
  %367 = call i8* @malloc(i64 noundef %360) #5
  %368 = icmp eq i8* %367, null
  br i1 %368, label %543, label %369

369:                                              ; preds = %361, %366, %344
  %370 = phi i8* [ %350, %361 ], [ %367, %366 ], [ %350, %344 ]
  %371 = phi i32* [ %364, %361 ], [ null, %366 ], [ %353, %344 ]
  %372 = phi i64 [ %360, %361 ], [ %360, %366 ], [ %32, %344 ]
  %373 = icmp eq i32 %355, 0
  br i1 %373, label %487, label %374

374:                                              ; preds = %369
  %375 = getelementptr inbounds i32, i32* %347, i64 1
  %376 = xor i1 %356, true
  br label %377

377:                                              ; preds = %374, %463
  %378 = phi i32 [ %355, %374 ], [ %471, %463 ]
  %379 = phi i1 [ false, %374 ], [ true, %463 ]
  %380 = phi i64 [ %372, %374 ], [ %467, %463 ]
  %381 = phi i64 [ 0, %374 ], [ %466, %463 ]
  %382 = phi i64 [ %294, %374 ], [ %468, %463 ]
  %383 = phi i32* [ %371, %374 ], [ %465, %463 ]
  %384 = phi i8* [ %370, %374 ], [ %464, %463 ]
  %385 = load i8*, i8** %20, align 8, !tbaa !11
  %386 = load i8*, i8** %21, align 8, !tbaa !12
  %387 = icmp eq i8* %385, %386
  br i1 %387, label %395, label %388

388:                                              ; preds = %377
  %389 = load i8, i8* %385, align 1, !tbaa !13
  %390 = icmp sgt i8 %389, -1
  br i1 %390, label %391, label %395

391:                                              ; preds = %388
  %392 = getelementptr inbounds i8, i8* %385, i64 1
  store i8* %392, i8** %20, align 8, !tbaa !11
  %393 = load i8, i8* %385, align 1, !tbaa !13
  %394 = zext i8 %393 to i32
  br label %398

395:                                              ; preds = %377, %388
  %396 = call i32 @getwc(%struct._IO_FILE* noundef nonnull %0) #5
  %397 = icmp slt i32 %396, 0
  br i1 %397, label %481, label %398

398:                                              ; preds = %391, %395
  %399 = phi i32 [ %394, %391 ], [ %396, %395 ]
  %400 = load i32, i32* %347, align 4, !tbaa !10
  switch i32 %400, label %405 [
    i32 45, label %401
    i32 93, label %403
  ]

401:                                              ; preds = %398
  %402 = icmp eq i32 %399, 45
  br i1 %402, label %427, label %405

403:                                              ; preds = %398
  %404 = icmp eq i32 %399, 93
  br i1 %404, label %427, label %405

405:                                              ; preds = %403, %401, %398
  %406 = phi i32* [ %375, %403 ], [ %375, %401 ], [ %347, %398 ]
  br label %407

407:                                              ; preds = %405, %422
  %408 = phi i32* [ %426, %422 ], [ %406, %405 ]
  %409 = load i32, i32* %408, align 4, !tbaa !10
  switch i32 %409, label %422 [
    i32 0, label %427
    i32 93, label %427
    i32 45, label %410
  ]

410:                                              ; preds = %407
  %411 = getelementptr inbounds i32, i32* %408, i64 1
  %412 = load i32, i32* %411, align 4, !tbaa !10
  switch i32 %412, label %413 [
    i32 0, label %422
    i32 93, label %422
  ]

413:                                              ; preds = %410
  %414 = getelementptr inbounds i32, i32* %408, i64 -1
  %415 = load i32, i32* %414, align 4, !tbaa !10
  %416 = icmp slt i32 %415, %412
  br i1 %416, label %417, label %422

417:                                              ; preds = %413
  %418 = sub i32 %399, %415
  %419 = xor i32 %415, -1
  %420 = add i32 %412, %419
  %421 = icmp ugt i32 %418, %420
  br i1 %421, label %422, label %427

422:                                              ; preds = %417, %413, %410, %410, %407
  %423 = phi i32* [ %408, %410 ], [ %408, %407 ], [ %408, %410 ], [ %411, %413 ], [ %411, %417 ]
  %424 = load i32, i32* %423, align 4, !tbaa !10
  %425 = icmp eq i32 %424, %399
  %426 = getelementptr inbounds i32, i32* %423, i64 1
  br i1 %425, label %427, label %407

427:                                              ; preds = %407, %407, %417, %422, %401, %403
  %428 = phi i32 [ 1, %401 ], [ 1, %403 ], [ 1, %417 ], [ 1, %422 ], [ 0, %407 ], [ 0, %407 ]
  %429 = icmp eq i32 %428, %346
  br i1 %429, label %473, label %430

430:                                              ; preds = %427
  %431 = icmp eq i32* %383, null
  br i1 %431, label %445, label %432

432:                                              ; preds = %430
  %433 = add i64 %381, 1
  %434 = getelementptr inbounds i32, i32* %383, i64 %381
  store i32 %399, i32* %434, align 4, !tbaa !10
  %435 = icmp eq i64 %433, %380
  %436 = select i1 %376, i1 %435, i1 false
  br i1 %436, label %437, label %463

437:                                              ; preds = %432
  %438 = shl i64 %380, 1
  %439 = or i64 %438, 1
  %440 = bitcast i32* %383 to i8*
  %441 = shl i64 %439, 2
  %442 = call i8* @realloc(i8* noundef nonnull %440, i64 noundef %441) #5
  %443 = icmp eq i8* %442, null
  %444 = bitcast i8* %442 to i32*
  br i1 %443, label %543, label %463

445:                                              ; preds = %430
  br i1 %351, label %463, label %446

446:                                              ; preds = %445
  %447 = icmp eq i8* %384, null
  %448 = getelementptr inbounds i8, i8* %384, i64 %381
  %449 = select i1 %447, i8* %8, i8* %448
  %450 = call i32 @wctomb(i8* noundef %449, i32 noundef %399) #5
  %451 = icmp slt i32 %450, 0
  br i1 %451, label %543, label %452

452:                                              ; preds = %446
  %453 = zext i32 %450 to i64
  %454 = add i64 %381, %453
  %455 = add i64 %380, -4
  %456 = icmp ugt i64 %454, %455
  %457 = select i1 %376, i1 %456, i1 false
  br i1 %457, label %458, label %463

458:                                              ; preds = %452
  %459 = shl i64 %380, 1
  %460 = or i64 %459, 1
  %461 = call i8* @realloc(i8* noundef %384, i64 noundef %460) #5
  %462 = icmp eq i8* %461, null
  br i1 %462, label %543, label %463

463:                                              ; preds = %458, %452, %437, %445, %432
  %464 = phi i8* [ %384, %437 ], [ %384, %432 ], [ %384, %445 ], [ %461, %458 ], [ %384, %452 ]
  %465 = phi i32* [ %444, %437 ], [ %383, %432 ], [ null, %445 ], [ null, %458 ], [ null, %452 ]
  %466 = phi i64 [ %380, %437 ], [ %433, %432 ], [ %381, %445 ], [ %454, %458 ], [ %454, %452 ]
  %467 = phi i64 [ %439, %437 ], [ %380, %432 ], [ %380, %445 ], [ %460, %458 ], [ %380, %452 ]
  %468 = add nsw i64 %382, 1
  %469 = icmp sgt i32 %378, 0
  %470 = sext i1 %469 to i32
  %471 = add i32 %378, %470
  %472 = icmp eq i32 %471, 0
  br i1 %472, label %487, label %377

473:                                              ; preds = %427
  %474 = load i8*, i8** %21, align 8, !tbaa !12
  %475 = icmp ne i8* %474, null
  %476 = icmp ult i32 %399, 128
  %477 = select i1 %475, i1 %476, i1 false
  br i1 %477, label %478, label %481

478:                                              ; preds = %473
  %479 = load i8*, i8** %20, align 8, !tbaa !11
  %480 = getelementptr inbounds i8, i8* %479, i64 -1
  store i8* %480, i8** %20, align 8, !tbaa !11
  br label %484

481:                                              ; preds = %395, %473
  %482 = phi i32 [ %399, %473 ], [ %396, %395 ]
  %483 = call i32 @ungetwc(i32 noundef %482, %struct._IO_FILE* noundef nonnull %0) #5
  br label %484

484:                                              ; preds = %481, %478
  %485 = icmp ne i32 %249, 99
  %486 = and i1 %485, %379
  br i1 %486, label %487, label %551

487:                                              ; preds = %463, %369, %484
  %488 = phi i8* [ %384, %484 ], [ %370, %369 ], [ %464, %463 ]
  %489 = phi i32* [ %383, %484 ], [ %371, %369 ], [ %465, %463 ]
  %490 = phi i64 [ %382, %484 ], [ %294, %369 ], [ %468, %463 ]
  %491 = phi i64 [ %381, %484 ], [ 0, %369 ], [ %466, %463 ]
  %492 = phi i64 [ %380, %484 ], [ %372, %369 ], [ %467, %463 ]
  br i1 %356, label %498, label %493

493:                                              ; preds = %487
  br i1 %351, label %494, label %496

494:                                              ; preds = %493
  %495 = bitcast i8* %195 to i32**
  store i32* %489, i32** %495, align 8, !tbaa !19
  br label %498

496:                                              ; preds = %493
  %497 = bitcast i8* %195 to i8**
  store i8* %488, i8** %497, align 8, !tbaa !19
  br label %498

498:                                              ; preds = %494, %496, %487
  br i1 %322, label %524, label %499

499:                                              ; preds = %498
  %500 = icmp eq i32* %489, null
  br i1 %500, label %503, label %501

501:                                              ; preds = %499
  %502 = getelementptr inbounds i32, i32* %489, i64 %491
  store i32 0, i32* %502, align 4, !tbaa !10
  br label %503

503:                                              ; preds = %501, %499
  %504 = icmp eq i8* %488, null
  br i1 %504, label %524, label %505

505:                                              ; preds = %503
  %506 = getelementptr inbounds i8, i8* %488, i64 %491
  store i8 0, i8* %506, align 1, !tbaa !13
  br label %524

507:                                              ; preds = %304, %304, %304, %304, %304, %304, %304, %304, %304, %304, %304, %304, %304, %304, %304
  %508 = icmp sgt i32 %212, 0
  %509 = select i1 %508, i32 %212, i32 0
  %510 = icmp eq i8* %195, null
  %511 = select i1 %510, i32 2, i32 1
  %512 = add nsw i32 %250, 2
  %513 = zext i32 %512 to i64
  %514 = getelementptr inbounds [6 x [3 x i8]], [6 x [3 x i8]]* @vfwscanf.size_pfx, i64 0, i64 %513, i64 0
  %515 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef nonnull %8, i64 noundef 22, i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0), i32 noundef %511, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i32 noundef %509, i8* noundef nonnull %514, i32 noundef %249) #5
  store i64 0, i64* %5, align 8, !tbaa !16
  %516 = select i1 %510, i8* %7, i8* %195
  %517 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* noundef nonnull %0, i8* noundef nonnull %8, i8* noundef %516, i64* noundef nonnull %5) #5
  %518 = icmp eq i32 %517, -1
  br i1 %518, label %543, label %519

519:                                              ; preds = %507
  %520 = load i64, i64* %5, align 8, !tbaa !16
  %521 = icmp eq i64 %520, 0
  br i1 %521, label %551, label %522

522:                                              ; preds = %519
  %523 = add nsw i64 %520, %294
  br label %524

524:                                              ; preds = %498, %505, %503, %522
  %525 = phi i32* [ %243, %522 ], [ %345, %505 ], [ %345, %503 ], [ %345, %498 ]
  %526 = phi i8* [ %223, %522 ], [ %488, %505 ], [ null, %503 ], [ %488, %498 ]
  %527 = phi i32* [ %224, %522 ], [ %489, %505 ], [ %489, %503 ], [ %489, %498 ]
  %528 = phi i64 [ %523, %522 ], [ %490, %505 ], [ %490, %503 ], [ %490, %498 ]
  %529 = phi i64 [ %32, %522 ], [ %492, %505 ], [ %492, %503 ], [ %492, %498 ]
  %530 = icmp ne i8* %195, null
  %531 = zext i1 %530 to i32
  %532 = add nsw i32 %34, %531
  br label %533

533:                                              ; preds = %319, %317, %314, %311, %309, %308, %305, %524, %70, %73, %132
  %534 = phi i32* [ %41, %70 ], [ %41, %73 ], [ %114, %132 ], [ %525, %524 ], [ %243, %305 ], [ %243, %308 ], [ %243, %309 ], [ %243, %311 ], [ %243, %314 ], [ %243, %317 ], [ %243, %319 ]
  %535 = phi i8* [ %36, %70 ], [ %36, %73 ], [ %36, %132 ], [ %526, %524 ], [ %223, %305 ], [ %223, %308 ], [ %223, %309 ], [ %223, %311 ], [ %223, %314 ], [ %223, %317 ], [ %223, %319 ]
  %536 = phi i32* [ %35, %70 ], [ %35, %73 ], [ %35, %132 ], [ %527, %524 ], [ %224, %305 ], [ %224, %308 ], [ %224, %309 ], [ %224, %311 ], [ %224, %314 ], [ %224, %317 ], [ %224, %319 ]
  %537 = phi i32 [ %34, %70 ], [ %34, %73 ], [ %34, %132 ], [ %532, %524 ], [ %34, %305 ], [ %34, %308 ], [ %34, %309 ], [ %34, %311 ], [ %34, %314 ], [ %34, %317 ], [ %34, %319 ]
  %538 = phi i64 [ %47, %70 ], [ %47, %73 ], [ %133, %132 ], [ %528, %524 ], [ %306, %305 ], [ %306, %308 ], [ %306, %309 ], [ %306, %311 ], [ %306, %314 ], [ %306, %317 ], [ %306, %319 ]
  %539 = phi i64 [ %32, %70 ], [ %32, %73 ], [ %32, %132 ], [ %529, %524 ], [ %32, %305 ], [ %32, %308 ], [ %32, %309 ], [ %32, %311 ], [ %32, %314 ], [ %32, %317 ], [ %32, %319 ]
  %540 = getelementptr inbounds i32, i32* %534, i64 1
  %541 = load i32, i32* %540, align 4, !tbaa !10
  %542 = icmp eq i32 %541, 0
  br i1 %542, label %559, label %30

543:                                              ; preds = %361, %366, %304, %220, %507, %286, %339, %458, %446, %437
  %544 = phi i8* [ %384, %437 ], [ %384, %446 ], [ %384, %458 ], [ %223, %339 ], [ null, %366 ], [ %350, %361 ], [ %223, %507 ], [ %223, %304 ], [ %223, %286 ], [ %223, %220 ]
  %545 = phi i32* [ null, %458 ], [ null, %446 ], [ %383, %437 ], [ %224, %339 ], [ null, %366 ], [ null, %361 ], [ %224, %507 ], [ %224, %304 ], [ %224, %286 ], [ %224, %220 ]
  %546 = icmp eq i32 %34, 0
  br i1 %546, label %547, label %551

547:                                              ; preds = %127, %543
  %548 = phi i8* [ %36, %127 ], [ %544, %543 ]
  %549 = phi i32* [ %35, %127 ], [ %545, %543 ]
  %550 = phi i32 [ 0, %127 ], [ %225, %543 ]
  br label %551

551:                                              ; preds = %519, %484, %543, %547
  %552 = phi i8* [ %548, %547 ], [ %544, %543 ], [ %384, %484 ], [ %223, %519 ]
  %553 = phi i32* [ %549, %547 ], [ %545, %543 ], [ %383, %484 ], [ %224, %519 ]
  %554 = phi i32 [ -1, %547 ], [ %34, %543 ], [ %34, %484 ], [ %34, %519 ]
  %555 = phi i32 [ %550, %547 ], [ %225, %543 ], [ %225, %484 ], [ %225, %519 ]
  %556 = icmp eq i32 %555, 0
  br i1 %556, label %559, label %557

557:                                              ; preds = %551
  call void @free(i8* noundef %552) #5
  %558 = bitcast i32* %553 to i8*
  call void @free(i8* noundef %558) #5
  br label %559

559:                                              ; preds = %533, %14, %124, %127, %557, %551
  %560 = phi i32 [ %554, %557 ], [ %554, %551 ], [ %34, %127 ], [ %34, %124 ], [ 0, %14 ], [ %537, %533 ]
  %561 = icmp eq i32 %15, 0
  br i1 %561, label %563, label %562

562:                                              ; preds = %559
  call void @__unlockfile(%struct._IO_FILE* noundef %0) #5
  br label %563

563:                                              ; preds = %559, %562
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %8) #4
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %7) #4
  ret i32 %560
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @fwide(%struct._IO_FILE* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @iswspace(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @getwc(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @ungetwc(i32 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @malloc(i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @realloc(i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @wctomb(i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @snprintf(i8* noundef, i64 noundef, i8* noundef, ...) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @fscanf(%struct._IO_FILE* noundef, i8* noundef, ...) local_unnamed_addr #2

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__unlockfile(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_copy(i8*, i8*) #3

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #3

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind willreturn }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }

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
!10 = !{!5, !5, i64 0}
!11 = !{!4, !8, i64 8}
!12 = !{!4, !8, i64 16}
!13 = !{!6, !6, i64 0}
!14 = !{!15, !15, i64 0}
!15 = !{!"short", !6, i64 0}
!16 = !{!9, !9, i64 0}
!17 = !{!18, !18, i64 0}
!18 = !{!"long long", !6, i64 0}
!19 = !{!8, !8, i64 0}
