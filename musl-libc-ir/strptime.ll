; ModuleID = 'src/time/strptime.c'
source_filename = "src/time/strptime.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }

@.str = private unnamed_addr constant [9 x i8] c"%m/%d/%y\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"%H:%M\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"%H:%M:%S\00", align 1

; Function Attrs: nounwind optsize strictfp
define i8* @strptime(i8* noalias noundef %0, i8* noalias noundef %1, %struct.tm* noalias noundef %2) local_unnamed_addr #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %8)
  %9 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %9)
  store i32 0, i32* %5, align 4, !tbaa !3
  %10 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %10)
  store i32 0, i32* %6, align 4, !tbaa !3
  %11 = bitcast i8** %7 to i8*
  %12 = getelementptr inbounds %struct.tm, %struct.tm* %2, i64 0, i32 5
  %13 = getelementptr inbounds %struct.tm, %struct.tm* %2, i64 0, i32 6
  %14 = getelementptr inbounds %struct.tm, %struct.tm* %2, i64 0, i32 0
  %15 = getelementptr inbounds %struct.tm, %struct.tm* %2, i64 0, i32 2
  %16 = getelementptr inbounds %struct.tm, %struct.tm* %2, i64 0, i32 1
  %17 = getelementptr inbounds %struct.tm, %struct.tm* %2, i64 0, i32 4
  %18 = getelementptr inbounds %struct.tm, %struct.tm* %2, i64 0, i32 7
  %19 = getelementptr inbounds %struct.tm, %struct.tm* %2, i64 0, i32 3
  br label %20

20:                                               ; preds = %98, %3
  %21 = phi i8* [ %0, %3 ], [ %99, %98 ]
  %22 = phi i8* [ %1, %3 ], [ %75, %98 ]
  %23 = phi i32 [ 0, %3 ], [ %100, %98 ]
  br label %24

24:                                               ; preds = %20, %53
  %25 = phi i8* [ %54, %53 ], [ %21, %20 ]
  %26 = phi i8* [ %55, %53 ], [ %22, %20 ]
  %27 = load i8, i8* %26, align 1, !tbaa !7
  switch i8 %27, label %28 [
    i8 0, label %250
    i8 37, label %56
  ]

28:                                               ; preds = %24
  %29 = sext i8 %27 to i32
  %30 = icmp ne i8 %27, 32
  %31 = add nsw i32 %29, -14
  %32 = icmp ult i32 %31, -5
  %33 = and i1 %30, %32
  %34 = load i8, i8* %25, align 1, !tbaa !7
  br i1 %33, label %49, label %35

35:                                               ; preds = %28
  %36 = icmp eq i8 %34, 0
  br i1 %36, label %53, label %37

37:                                               ; preds = %35, %45
  %38 = phi i8 [ %47, %45 ], [ %34, %35 ]
  %39 = phi i8* [ %46, %45 ], [ %25, %35 ]
  %40 = sext i8 %38 to i32
  %41 = icmp ne i8 %38, 32
  %42 = add nsw i32 %40, -14
  %43 = icmp ult i32 %42, -5
  %44 = and i1 %41, %43
  br i1 %44, label %53, label %45

45:                                               ; preds = %37
  %46 = getelementptr inbounds i8, i8* %39, i64 1
  %47 = load i8, i8* %46, align 1, !tbaa !7
  %48 = icmp eq i8 %47, 0
  br i1 %48, label %53, label %37

49:                                               ; preds = %28
  %50 = icmp eq i8 %34, %27
  br i1 %50, label %51, label %267

51:                                               ; preds = %49
  %52 = getelementptr inbounds i8, i8* %25, i64 1
  br label %53

53:                                               ; preds = %45, %37, %35, %51
  %54 = phi i8* [ %52, %51 ], [ %25, %35 ], [ %46, %45 ], [ %39, %37 ]
  %55 = getelementptr inbounds i8, i8* %26, i64 1
  br label %24

56:                                               ; preds = %24
  %57 = getelementptr inbounds i8, i8* %26, i64 1
  %58 = load i8, i8* %57, align 1, !tbaa !7
  %59 = icmp eq i8 %58, 43
  %60 = getelementptr inbounds i8, i8* %26, i64 2
  %61 = select i1 %59, i8* %60, i8* %57
  %62 = load i8, i8* %61, align 1, !tbaa !7
  %63 = sext i8 %62 to i32
  %64 = add nsw i32 %63, -48
  %65 = icmp ult i32 %64, 10
  br i1 %65, label %66, label %71

66:                                               ; preds = %56
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %11) #3
  %67 = call i64 @strtoul(i8* noundef nonnull %61, i8** noundef nonnull %7, i32 noundef 10) #4
  %68 = trunc i64 %67 to i32
  %69 = load i8*, i8** %7, align 8, !tbaa !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %11) #3
  %70 = load i8, i8* %69, align 1, !tbaa !7
  br label %71

71:                                               ; preds = %56, %66
  %72 = phi i8 [ %70, %66 ], [ %62, %56 ]
  %73 = phi i8* [ %69, %66 ], [ %61, %56 ]
  %74 = phi i32 [ %68, %66 ], [ -1, %56 ]
  %75 = getelementptr inbounds i8, i8* %73, i64 1
  %76 = sext i8 %72 to i32
  switch i32 %76, label %267 [
    i32 97, label %232
    i32 65, label %232
    i32 98, label %77
    i32 66, label %77
    i32 104, label %77
    i32 99, label %78
    i32 67, label %82
    i32 100, label %86
    i32 101, label %86
    i32 68, label %87
    i32 72, label %90
    i32 73, label %91
    i32 106, label %92
    i32 109, label %93
    i32 77, label %94
    i32 110, label %95
    i32 116, label %95
    i32 112, label %113
    i32 114, label %132
    i32 82, label %136
    i32 83, label %139
    i32 84, label %140
    i32 85, label %161
    i32 87, label %161
    i32 119, label %143
    i32 120, label %144
    i32 88, label %148
    i32 121, label %152
    i32 89, label %154
    i32 37, label %157
  ]

77:                                               ; preds = %71, %71, %71
  br label %232

78:                                               ; preds = %71
  %79 = call i8* @nl_langinfo(i32 noundef 131112) #4
  %80 = call i8* @strptime(i8* noundef %25, i8* noundef %79, %struct.tm* noundef %2) #5
  %81 = icmp eq i8* %80, null
  br i1 %81, label %267, label %98

82:                                               ; preds = %71
  %83 = icmp slt i32 %74, 0
  %84 = select i1 %83, i32 2, i32 %74
  %85 = or i32 %23, 2
  br label %193

86:                                               ; preds = %71, %71
  br label %161

87:                                               ; preds = %71
  %88 = call i8* @strptime(i8* noundef %25, i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), %struct.tm* noundef %2) #5
  %89 = icmp eq i8* %88, null
  br i1 %89, label %267, label %98

90:                                               ; preds = %71
  br label %161

91:                                               ; preds = %71
  br label %161

92:                                               ; preds = %71
  br label %161

93:                                               ; preds = %71
  br label %161

94:                                               ; preds = %71
  br label %161

95:                                               ; preds = %71, %71
  %96 = load i8, i8* %25, align 1, !tbaa !7
  %97 = icmp eq i8 %96, 0
  br i1 %97, label %98, label %101

98:                                               ; preds = %101, %109, %95, %247, %191, %226, %157, %148, %144, %140, %136, %132, %87, %78, %127, %118
  %99 = phi i8* [ %158, %157 ], [ %228, %226 ], [ %150, %148 ], [ %146, %144 ], [ %188, %191 ], [ %141, %140 ], [ %137, %136 ], [ %134, %132 ], [ %131, %127 ], [ %121, %118 ], [ %88, %87 ], [ %80, %78 ], [ %248, %247 ], [ %25, %95 ], [ %110, %109 ], [ %103, %101 ]
  %100 = phi i32 [ %23, %157 ], [ %197, %226 ], [ %23, %148 ], [ %23, %144 ], [ %23, %191 ], [ %23, %140 ], [ %23, %136 ], [ %23, %132 ], [ %23, %127 ], [ %23, %118 ], [ %23, %87 ], [ %23, %78 ], [ %23, %247 ], [ %23, %95 ], [ %23, %109 ], [ %23, %101 ]
  br label %20

101:                                              ; preds = %95, %109
  %102 = phi i8 [ %111, %109 ], [ %96, %95 ]
  %103 = phi i8* [ %110, %109 ], [ %25, %95 ]
  %104 = sext i8 %102 to i32
  %105 = icmp ne i8 %102, 32
  %106 = add nsw i32 %104, -14
  %107 = icmp ult i32 %106, -5
  %108 = and i1 %105, %107
  br i1 %108, label %98, label %109

109:                                              ; preds = %101
  %110 = getelementptr inbounds i8, i8* %103, i64 1
  %111 = load i8, i8* %110, align 1, !tbaa !7
  %112 = icmp eq i8 %111, 0
  br i1 %112, label %98, label %101

113:                                              ; preds = %71
  %114 = call i8* @nl_langinfo(i32 noundef 131110) #4
  %115 = call i64 @strlen(i8* noundef %114) #4
  %116 = call i32 @strncasecmp(i8* noundef %25, i8* noundef %114, i64 noundef %115) #4
  %117 = icmp eq i32 %116, 0
  br i1 %117, label %118, label %122

118:                                              ; preds = %113
  %119 = load i32, i32* %15, align 8, !tbaa !10
  %120 = srem i32 %119, 12
  store i32 %120, i32* %15, align 8, !tbaa !10
  %121 = getelementptr inbounds i8, i8* %25, i64 %115
  br label %98

122:                                              ; preds = %113
  %123 = call i8* @nl_langinfo(i32 noundef 131111) #4
  %124 = call i64 @strlen(i8* noundef %123) #4
  %125 = call i32 @strncasecmp(i8* noundef %25, i8* noundef %123, i64 noundef %124) #4
  %126 = icmp eq i32 %125, 0
  br i1 %126, label %127, label %267

127:                                              ; preds = %122
  %128 = load i32, i32* %15, align 8, !tbaa !10
  %129 = srem i32 %128, 12
  %130 = add nsw i32 %129, 12
  store i32 %130, i32* %15, align 8, !tbaa !10
  %131 = getelementptr inbounds i8, i8* %25, i64 %124
  br label %98

132:                                              ; preds = %71
  %133 = call i8* @nl_langinfo(i32 noundef 131115) #4
  %134 = call i8* @strptime(i8* noundef %25, i8* noundef %133, %struct.tm* noundef %2) #5
  %135 = icmp eq i8* %134, null
  br i1 %135, label %267, label %98

136:                                              ; preds = %71
  %137 = call i8* @strptime(i8* noundef %25, i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), %struct.tm* noundef %2) #5
  %138 = icmp eq i8* %137, null
  br i1 %138, label %267, label %98

139:                                              ; preds = %71
  br label %161

140:                                              ; preds = %71
  %141 = call i8* @strptime(i8* noundef %25, i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0), %struct.tm* noundef %2) #5
  %142 = icmp eq i8* %141, null
  br i1 %142, label %267, label %98

143:                                              ; preds = %71
  br label %161

144:                                              ; preds = %71
  %145 = call i8* @nl_langinfo(i32 noundef 131113) #4
  %146 = call i8* @strptime(i8* noundef %25, i8* noundef %145, %struct.tm* noundef %2) #5
  %147 = icmp eq i8* %146, null
  br i1 %147, label %267, label %98

148:                                              ; preds = %71
  %149 = call i8* @nl_langinfo(i32 noundef 131114) #4
  %150 = call i8* @strptime(i8* noundef %25, i8* noundef %149, %struct.tm* noundef %2) #5
  %151 = icmp eq i8* %150, null
  br i1 %151, label %267, label %98

152:                                              ; preds = %71
  %153 = or i32 %23, 1
  br label %193

154:                                              ; preds = %71
  %155 = icmp slt i32 %74, 0
  %156 = select i1 %155, i32 4, i32 %74
  br label %193

157:                                              ; preds = %71
  %158 = getelementptr inbounds i8, i8* %25, i64 1
  %159 = load i8, i8* %25, align 1, !tbaa !7
  %160 = icmp eq i8 %159, 37
  br i1 %160, label %98, label %267

161:                                              ; preds = %71, %71, %86, %90, %91, %92, %93, %94, %139, %143
  %162 = phi i32 [ 0, %143 ], [ 0, %139 ], [ 0, %94 ], [ -1, %93 ], [ -1, %92 ], [ 0, %91 ], [ 0, %90 ], [ 0, %86 ], [ 0, %71 ], [ 0, %71 ]
  %163 = phi i32 [ 0, %143 ], [ 0, %139 ], [ 0, %94 ], [ 1, %93 ], [ 1, %92 ], [ 1, %91 ], [ 0, %90 ], [ 1, %86 ], [ 0, %71 ], [ 0, %71 ]
  %164 = phi i32 [ 7, %143 ], [ 61, %139 ], [ 60, %94 ], [ 12, %93 ], [ 366, %92 ], [ 12, %91 ], [ 24, %90 ], [ 31, %86 ], [ 54, %71 ], [ 54, %71 ]
  %165 = phi i32* [ %13, %143 ], [ %14, %139 ], [ %16, %94 ], [ %17, %93 ], [ %18, %92 ], [ %15, %91 ], [ %15, %90 ], [ %19, %86 ], [ %4, %71 ], [ %4, %71 ]
  %166 = load i8, i8* %25, align 1, !tbaa !7
  %167 = sext i8 %166 to i32
  %168 = add nsw i32 %167, -48
  %169 = icmp ult i32 %168, 10
  br i1 %169, label %170, label %267

170:                                              ; preds = %161
  store i32 0, i32* %165, align 4, !tbaa !3
  %171 = add nuw nsw i32 %164, %163
  br label %172

172:                                              ; preds = %170, %180
  %173 = phi i32 [ %183, %180 ], [ 0, %170 ]
  %174 = phi i32 [ %184, %180 ], [ 1, %170 ]
  %175 = phi i8* [ %182, %180 ], [ %25, %170 ]
  %176 = load i8, i8* %175, align 1, !tbaa !7
  %177 = sext i8 %176 to i32
  %178 = add nsw i32 %177, -48
  %179 = icmp ult i32 %178, 10
  br i1 %179, label %180, label %186

180:                                              ; preds = %172
  %181 = mul nsw i32 %173, 10
  %182 = getelementptr inbounds i8, i8* %175, i64 1
  %183 = add i32 %178, %181
  store i32 %183, i32* %165, align 4, !tbaa !3
  %184 = mul nsw i32 %174, 10
  %185 = icmp ugt i32 %184, %171
  br i1 %185, label %186, label %172

186:                                              ; preds = %172, %180
  %187 = phi i32 [ %173, %172 ], [ %183, %180 ]
  %188 = phi i8* [ %175, %172 ], [ %182, %180 ]
  %189 = sub nsw i32 %187, %163
  %190 = icmp ult i32 %189, %164
  br i1 %190, label %191, label %267

191:                                              ; preds = %186
  %192 = add i32 %187, %162
  store i32 %192, i32* %165, align 4, !tbaa !3
  br label %98

193:                                              ; preds = %154, %152, %82
  %194 = phi i32 [ %156, %154 ], [ 2, %152 ], [ %84, %82 ]
  %195 = phi i32 [ -1900, %154 ], [ 0, %152 ], [ 0, %82 ]
  %196 = phi i32* [ %12, %154 ], [ %6, %152 ], [ %5, %82 ]
  %197 = phi i32 [ 0, %154 ], [ %153, %152 ], [ %85, %82 ]
  %198 = load i8, i8* %25, align 1, !tbaa !7
  switch i8 %198, label %203 [
    i8 43, label %199
    i8 45, label %201
  ]

199:                                              ; preds = %193
  %200 = getelementptr inbounds i8, i8* %25, i64 1
  br label %203

201:                                              ; preds = %193
  %202 = getelementptr inbounds i8, i8* %25, i64 1
  br label %203

203:                                              ; preds = %193, %199, %201
  %204 = phi i8* [ %200, %199 ], [ %202, %201 ], [ %25, %193 ]
  %205 = phi i1 [ true, %199 ], [ false, %201 ], [ true, %193 ]
  %206 = load i8, i8* %204, align 1, !tbaa !7
  %207 = sext i8 %206 to i32
  %208 = add nsw i32 %207, -48
  %209 = icmp ult i32 %208, 10
  br i1 %209, label %210, label %267

210:                                              ; preds = %203
  store i32 0, i32* %196, align 4, !tbaa !3
  %211 = icmp eq i32 %194, 0
  br i1 %211, label %226, label %212

212:                                              ; preds = %210, %220
  %213 = phi i32 [ %223, %220 ], [ 0, %210 ]
  %214 = phi i32 [ %224, %220 ], [ 0, %210 ]
  %215 = phi i8* [ %222, %220 ], [ %204, %210 ]
  %216 = load i8, i8* %215, align 1, !tbaa !7
  %217 = sext i8 %216 to i32
  %218 = add nsw i32 %217, -48
  %219 = icmp ult i32 %218, 10
  br i1 %219, label %220, label %226

220:                                              ; preds = %212
  %221 = mul nsw i32 %213, 10
  %222 = getelementptr inbounds i8, i8* %215, i64 1
  %223 = add i32 %218, %221
  store i32 %223, i32* %196, align 4, !tbaa !3
  %224 = add nuw nsw i32 %214, 1
  %225 = icmp eq i32 %224, %194
  br i1 %225, label %226, label %212

226:                                              ; preds = %212, %220, %210
  %227 = phi i32 [ 0, %210 ], [ %223, %220 ], [ %213, %212 ]
  %228 = phi i8* [ %204, %210 ], [ %222, %220 ], [ %215, %212 ]
  %229 = sub nsw i32 0, %227
  %230 = select i1 %205, i32 %227, i32 %229
  %231 = add i32 %230, %195
  store i32 %231, i32* %196, align 4, !tbaa !3
  br label %98

232:                                              ; preds = %71, %71, %77
  %233 = phi i32 [ 131086, %77 ], [ 131072, %71 ], [ 131072, %71 ]
  %234 = phi i32 [ 12, %77 ], [ 7, %71 ], [ 7, %71 ]
  %235 = phi i32* [ %17, %77 ], [ %13, %71 ], [ %13, %71 ]
  %236 = shl nuw nsw i32 %234, 1
  br label %237

237:                                              ; preds = %241, %232
  %238 = phi i32 [ %236, %232 ], [ %239, %241 ]
  %239 = add nsw i32 %238, -1
  %240 = icmp sgt i32 %238, 0
  br i1 %240, label %241, label %267

241:                                              ; preds = %237
  %242 = add nsw i32 %239, %233
  %243 = call i8* @nl_langinfo(i32 noundef %242) #4
  %244 = call i64 @strlen(i8* noundef %243) #4
  %245 = call i32 @strncasecmp(i8* noundef %25, i8* noundef %243, i64 noundef %244) #4
  %246 = icmp eq i32 %245, 0
  br i1 %246, label %247, label %237

247:                                              ; preds = %241
  %248 = getelementptr inbounds i8, i8* %25, i64 %244
  %249 = srem i32 %239, %234
  store i32 %249, i32* %235, align 4, !tbaa !3
  br label %98

250:                                              ; preds = %24
  %251 = icmp eq i32 %23, 0
  br i1 %251, label %267, label %252

252:                                              ; preds = %250
  %253 = load i32, i32* %6, align 4, !tbaa !3
  store i32 %253, i32* %12, align 4, !tbaa !13
  %254 = and i32 %23, 2
  %255 = icmp eq i32 %254, 0
  br i1 %255, label %261, label %256

256:                                              ; preds = %252
  %257 = load i32, i32* %5, align 4, !tbaa !3
  %258 = mul nsw i32 %257, 100
  %259 = add i32 %253, -1900
  %260 = add i32 %259, %258
  br label %265

261:                                              ; preds = %252
  %262 = icmp slt i32 %253, 69
  br i1 %262, label %263, label %267

263:                                              ; preds = %261
  %264 = add nsw i32 %253, 100
  br label %265

265:                                              ; preds = %256, %263
  %266 = phi i32 [ %264, %263 ], [ %260, %256 ]
  store i32 %266, i32* %12, align 4, !tbaa !13
  br label %267

267:                                              ; preds = %203, %186, %161, %71, %157, %148, %144, %140, %136, %132, %122, %87, %78, %49, %237, %265, %250, %261
  %268 = phi i8* [ %25, %261 ], [ %25, %250 ], [ %25, %265 ], [ null, %237 ], [ null, %49 ], [ null, %78 ], [ null, %87 ], [ null, %122 ], [ null, %132 ], [ null, %136 ], [ null, %140 ], [ null, %144 ], [ null, %148 ], [ null, %157 ], [ null, %71 ], [ null, %161 ], [ null, %186 ], [ null, %203 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %10)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %9)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %8)
  ret i8* %268
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i64 @strtoul(i8* noundef, i8** noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i8* @nl_langinfo(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @strncasecmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!5, !5, i64 0}
!8 = !{!9, !9, i64 0}
!9 = !{!"any pointer", !5, i64 0}
!10 = !{!11, !4, i64 8}
!11 = !{!"tm", !4, i64 0, !4, i64 4, !4, i64 8, !4, i64 12, !4, i64 16, !4, i64 20, !4, i64 24, !4, i64 28, !4, i64 32, !12, i64 40, !9, i64 48}
!12 = !{!"long", !5, i64 0}
!13 = !{!11, !4, i64 20}
