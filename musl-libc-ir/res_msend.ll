; ModuleID = 'src/network/res_msend.c'
source_filename = "src/network/res_msend.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.resolvconf = type { [3 x %struct.address], i32, i32, i32, i32 }
%struct.address = type { i32, i32, [16 x i8], i32 }
%struct.timespec = type { i64, i64 }
%union.anon = type { %struct.sockaddr_in6 }
%struct.sockaddr_in6 = type { i16, i16, i32, %struct.in6_addr, i32 }
%struct.in6_addr = type { %union.anon.0 }
%union.anon.0 = type { [4 x i32] }
%struct.pollfd = type { i32, i16, i16 }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [13 x i8] c"\00\00\00\00\00\00\00\00\00\00\FF\FF\00", align 1

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__res_msend_rc(i32 noundef %0, i8** nocapture noundef readonly %1, i32* nocapture noundef readonly %2, i8** nocapture noundef readonly %3, i32* noundef %4, i32 noundef %5, %struct.resolvconf* noundef %6) local_unnamed_addr #0 {
  %8 = alloca %struct.timespec, align 8
  %9 = alloca %struct.timespec, align 8
  %10 = alloca %union.anon, align 4
  %11 = alloca [3 x %union.anon], align 16
  %12 = alloca i32, align 4
  %13 = alloca %struct.pollfd, align 4
  %14 = alloca %struct.__ptcb, align 8
  %15 = alloca i32, align 4
  %16 = alloca [1 x i32], align 4
  %17 = bitcast %union.anon* %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %17) #5
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(28) %17, i8 0, i64 28, i1 false)
  %18 = bitcast [3 x %union.anon]* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 84, i8* nonnull %18) #5
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(84) %18, i8 0, i64 84, i1 false) #6
  %19 = bitcast i32* %12 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %19) #5
  %20 = bitcast %struct.pollfd* %13 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %20) #5
  %21 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %12) #7
  %22 = getelementptr inbounds %struct.resolvconf, %struct.resolvconf* %6, i64 0, i32 4
  %23 = load i32, i32* %22, align 4, !tbaa !3
  %24 = mul i32 %23, 1000
  %25 = getelementptr inbounds %struct.resolvconf, %struct.resolvconf* %6, i64 0, i32 2
  %26 = load i32, i32* %25, align 4, !tbaa !8
  %27 = getelementptr inbounds %struct.resolvconf, %struct.resolvconf* %6, i64 0, i32 1
  %28 = load i32, i32* %27, align 4, !tbaa !9
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %65, label %30

30:                                               ; preds = %7, %52
  %31 = phi i64 [ %59, %52 ], [ 0, %7 ]
  %32 = phi i32 [ %56, %52 ], [ 2, %7 ]
  %33 = phi i32 [ %55, %52 ], [ 16, %7 ]
  %34 = getelementptr inbounds %struct.resolvconf, %struct.resolvconf* %6, i64 0, i32 0, i64 %31, i32 0
  %35 = load i32, i32* %34, align 4, !tbaa !10
  %36 = icmp eq i32 %35, 2
  br i1 %36, label %37, label %43

37:                                               ; preds = %30
  %38 = getelementptr inbounds [3 x %union.anon], [3 x %union.anon]* %11, i64 0, i64 %31, i32 0, i32 2
  %39 = bitcast i32* %38 to i8*
  %40 = getelementptr inbounds %struct.resolvconf, %struct.resolvconf* %6, i64 0, i32 0, i64 %31, i32 2, i64 0
  %41 = call i8* @memcpy(i8* noundef nonnull %39, i8* noundef nonnull %40, i64 noundef 4) #7
  %42 = call zeroext i16 @htons(i16 noundef zeroext 53) #7
  br label %52

43:                                               ; preds = %30
  %44 = getelementptr inbounds [3 x %union.anon], [3 x %union.anon]* %11, i64 0, i64 %31, i32 0, i32 3
  %45 = bitcast %struct.in6_addr* %44 to i8*
  %46 = getelementptr inbounds %struct.resolvconf, %struct.resolvconf* %6, i64 0, i32 0, i64 %31, i32 2, i64 0
  %47 = call i8* @memcpy(i8* noundef nonnull %45, i8* noundef nonnull %46, i64 noundef 16) #7
  %48 = call zeroext i16 @htons(i16 noundef zeroext 53) #7
  %49 = getelementptr inbounds %struct.resolvconf, %struct.resolvconf* %6, i64 0, i32 0, i64 %31, i32 1
  %50 = load i32, i32* %49, align 4, !tbaa !12
  %51 = getelementptr inbounds [3 x %union.anon], [3 x %union.anon]* %11, i64 0, i64 %31, i32 0, i32 4
  store i32 %50, i32* %51, align 4, !tbaa !13
  br label %52

52:                                               ; preds = %43, %37
  %53 = phi i16 [ %42, %37 ], [ %48, %43 ]
  %54 = phi i16 [ 2, %37 ], [ 10, %43 ]
  %55 = phi i32 [ %33, %37 ], [ 28, %43 ]
  %56 = phi i32 [ %32, %37 ], [ 10, %43 ]
  %57 = getelementptr inbounds [3 x %union.anon], [3 x %union.anon]* %11, i64 0, i64 %31, i32 0, i32 1
  store i16 %53, i16* %57, align 2
  %58 = getelementptr inbounds [3 x %union.anon], [3 x %union.anon]* %11, i64 0, i64 %31, i32 0, i32 0
  store i16 %54, i16* %58, align 4
  %59 = add nuw nsw i64 %31, 1
  %60 = load i32, i32* %27, align 4, !tbaa !9
  %61 = zext i32 %60 to i64
  %62 = icmp ult i64 %59, %61
  br i1 %62, label %30, label %63

63:                                               ; preds = %52
  %64 = trunc i64 %59 to i32
  br label %65

65:                                               ; preds = %63, %7
  %66 = phi i32 [ 16, %7 ], [ %55, %63 ]
  %67 = phi i32 [ 0, %7 ], [ %64, %63 ]
  %68 = phi i32 [ 2, %7 ], [ %56, %63 ]
  %69 = trunc i32 %68 to i16
  %70 = getelementptr inbounds %union.anon, %union.anon* %10, i64 0, i32 0, i32 0
  store i16 %69, i16* %70, align 4, !tbaa !13
  %71 = call i32 @socket(i32 noundef %68, i32 noundef 526338, i32 noundef 0) #7
  %72 = icmp slt i32 %71, 0
  %73 = icmp eq i32 %68, 10
  %74 = and i1 %72, %73
  br i1 %74, label %75, label %81

75:                                               ; preds = %65
  %76 = tail call i32* @___errno_location() #8
  %77 = load i32, i32* %76, align 4, !tbaa !14
  %78 = icmp eq i32 %77, 97
  br i1 %78, label %79, label %91

79:                                               ; preds = %75
  %80 = call i32 @socket(i32 noundef 2, i32 noundef 526338, i32 noundef 0) #7
  br label %81

81:                                               ; preds = %79, %65
  %82 = phi i32 [ 2, %79 ], [ %68, %65 ]
  %83 = phi i32 [ %80, %79 ], [ %71, %65 ]
  %84 = icmp slt i32 %83, 0
  br i1 %84, label %91, label %85

85:                                               ; preds = %81
  %86 = bitcast %union.anon* %10 to %struct.sockaddr*
  %87 = call i32 @bind(i32 noundef %83, %struct.sockaddr* noundef nonnull %86, i32 noundef %66) #7
  %88 = icmp slt i32 %87, 0
  br i1 %88, label %89, label %94

89:                                               ; preds = %85
  %90 = call i32 @close(i32 noundef %83) #7
  br label %91

91:                                               ; preds = %75, %81, %89
  %92 = load i32, i32* %12, align 4, !tbaa !14
  %93 = call i32 @pthread_setcancelstate(i32 noundef %92, i32* noundef null) #7
  br label %325

94:                                               ; preds = %85
  %95 = bitcast %struct.__ptcb* %14 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %95) #5
  %96 = zext i32 %83 to i64
  %97 = inttoptr i64 %96 to i8*
  call void @_pthread_cleanup_push(%struct.__ptcb* noundef nonnull %14, void (i8*)* noundef nonnull @cleanup, i8* noundef %97) #7
  %98 = load i32, i32* %12, align 4, !tbaa !14
  %99 = call i32 @pthread_setcancelstate(i32 noundef %98, i32* noundef null) #7
  %100 = icmp eq i32 %82, 10
  br i1 %100, label %101, label %125

101:                                              ; preds = %94
  store i32 0, i32* %15, align 4, !tbaa !14
  %102 = bitcast i32* %15 to i8*
  %103 = call i32 @setsockopt(i32 noundef %83, i32 noundef 41, i32 noundef 26, i8* noundef nonnull %102, i32 noundef 4) #7
  %104 = icmp eq i32 %67, 0
  br i1 %104, label %125, label %105

105:                                              ; preds = %101
  %106 = zext i32 %67 to i64
  br label %107

107:                                              ; preds = %105, %122
  %108 = phi i64 [ 0, %105 ], [ %123, %122 ]
  %109 = getelementptr inbounds [3 x %union.anon], [3 x %union.anon]* %11, i64 0, i64 %108, i32 0, i32 0
  %110 = load i16, i16* %109, align 4, !tbaa !13
  %111 = icmp eq i16 %110, 2
  br i1 %111, label %112, label %122

112:                                              ; preds = %107
  %113 = getelementptr inbounds [3 x %union.anon], [3 x %union.anon]* %11, i64 0, i64 %108, i32 0, i32 3, i32 0
  %114 = bitcast %union.anon.0* %113 to i8*
  %115 = getelementptr inbounds [3 x %union.anon], [3 x %union.anon]* %11, i64 0, i64 %108, i32 0, i32 3, i32 0, i32 0, i64 3
  %116 = bitcast i32* %115 to i8*
  %117 = getelementptr inbounds [3 x %union.anon], [3 x %union.anon]* %11, i64 0, i64 %108, i32 0, i32 2
  %118 = bitcast i32* %117 to i8*
  %119 = call i8* @memcpy(i8* noundef nonnull %116, i8* noundef nonnull %118, i64 noundef 4) #7
  %120 = call i8* @memcpy(i8* noundef nonnull %114, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), i64 noundef 12) #7
  store i16 10, i16* %109, align 4, !tbaa !13
  store i32 0, i32* %117, align 4, !tbaa !13
  %121 = getelementptr inbounds [3 x %union.anon], [3 x %union.anon]* %11, i64 0, i64 %108, i32 0, i32 4
  store i32 0, i32* %121, align 4, !tbaa !13
  br label %122

122:                                              ; preds = %107, %112
  %123 = add nuw nsw i64 %108, 1
  %124 = icmp eq i64 %123, %106
  br i1 %124, label %125, label %107

125:                                              ; preds = %122, %101, %94
  %126 = bitcast i32* %4 to i8*
  %127 = sext i32 %0 to i64
  %128 = shl nsw i64 %127, 2
  %129 = call i8* @memset(i8* noundef %126, i32 noundef 0, i64 noundef %128) #7
  %130 = getelementptr inbounds %struct.pollfd, %struct.pollfd* %13, i64 0, i32 0
  store i32 %83, i32* %130, align 4, !tbaa !15
  %131 = getelementptr inbounds %struct.pollfd, %struct.pollfd* %13, i64 0, i32 1
  store i16 1, i16* %131, align 4, !tbaa !18
  %132 = sdiv i32 %24, %26
  %133 = bitcast %struct.timespec* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %133) #5
  %134 = call i32 @clock_gettime(i32 noundef 0, %struct.timespec* noundef nonnull %9) #7
  %135 = getelementptr inbounds %struct.timespec, %struct.timespec* %9, i64 0, i32 0
  %136 = load i64, i64* %135, align 8, !tbaa !19
  %137 = mul i64 %136, 1000
  %138 = getelementptr inbounds %struct.timespec, %struct.timespec* %9, i64 0, i32 1
  %139 = load i64, i64* %138, align 8, !tbaa !22
  %140 = sdiv i64 %139, 1000000
  %141 = add i64 %140, %137
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %133) #5
  %142 = sext i32 %132 to i64
  %143 = sext i32 %24 to i64
  %144 = icmp eq i32 %24, 0
  br i1 %144, label %324, label %145

145:                                              ; preds = %125
  %146 = sub i64 %141, %142
  %147 = icmp slt i32 %0, 1
  %148 = icmp eq i32 %67, 0
  %149 = shl nsw i32 %0, 1
  %150 = sext i32 %5 to i64
  %151 = getelementptr inbounds [1 x i32], [1 x i32]* %16, i64 0, i64 0
  %152 = zext i32 %66 to i64
  %153 = bitcast %struct.timespec* %8 to i8*
  %154 = getelementptr inbounds %struct.timespec, %struct.timespec* %8, i64 0, i32 0
  %155 = getelementptr inbounds %struct.timespec, %struct.timespec* %8, i64 0, i32 1
  %156 = zext i32 %0 to i64
  %157 = zext i32 %67 to i64
  %158 = zext i32 %67 to i64
  br label %159

159:                                              ; preds = %145, %313
  %160 = phi i64 [ %141, %145 ], [ %321, %313 ]
  %161 = phi i64 [ %146, %145 ], [ %193, %313 ]
  %162 = phi i32 [ 0, %145 ], [ %315, %313 ]
  %163 = phi i32 [ undef, %145 ], [ %314, %313 ]
  %164 = sub i64 %160, %161
  %165 = icmp ult i64 %164, %142
  %166 = or i1 %165, %147
  %167 = select i1 %165, i32 %163, i32 %149
  %168 = select i1 %165, i64 %161, i64 %160
  br i1 %166, label %191, label %169

169:                                              ; preds = %159, %188
  %170 = phi i64 [ %189, %188 ], [ 0, %159 ]
  %171 = getelementptr inbounds i32, i32* %4, i64 %170
  %172 = load i32, i32* %171, align 4, !tbaa !14
  %173 = icmp ne i32 %172, 0
  %174 = select i1 %173, i1 true, i1 %148
  br i1 %174, label %188, label %175

175:                                              ; preds = %169
  %176 = getelementptr inbounds i8*, i8** %1, i64 %170
  %177 = getelementptr inbounds i32, i32* %2, i64 %170
  br label %178

178:                                              ; preds = %175, %178
  %179 = phi i64 [ 0, %175 ], [ %186, %178 ]
  %180 = load i8*, i8** %176, align 8, !tbaa !23
  %181 = load i32, i32* %177, align 4, !tbaa !14
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds [3 x %union.anon], [3 x %union.anon]* %11, i64 0, i64 %179
  %184 = bitcast %union.anon* %183 to %struct.sockaddr*
  %185 = call i64 @sendto(i32 noundef %83, i8* noundef %180, i64 noundef %182, i32 noundef 16384, %struct.sockaddr* noundef nonnull %184, i32 noundef %66) #7
  %186 = add nuw nsw i64 %179, 1
  %187 = icmp eq i64 %186, %157
  br i1 %187, label %188, label %178

188:                                              ; preds = %178, %169
  %189 = add nuw nsw i64 %170, 1
  %190 = icmp eq i64 %189, %156
  br i1 %190, label %191, label %169

191:                                              ; preds = %188, %159
  %192 = phi i32 [ %167, %159 ], [ %149, %188 ]
  %193 = phi i64 [ %168, %159 ], [ %160, %188 ]
  %194 = sub i64 %142, %160
  %195 = add i64 %194, %193
  %196 = trunc i64 %195 to i32
  %197 = call i32 @poll(%struct.pollfd* noundef nonnull %13, i64 noundef 1, i32 noundef %196) #7
  %198 = icmp slt i32 %197, 1
  br i1 %198, label %313, label %286

199:                                              ; preds = %265, %286
  %200 = phi i32 [ %288, %286 ], [ %202, %265 ]
  br label %201

201:                                              ; preds = %199, %310
  %202 = phi i32 [ %200, %199 ], [ %311, %310 ]
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds i8*, i8** %3, i64 %203
  %205 = load i8*, i8** %204, align 8, !tbaa !23
  store i32 %66, i32* %151, align 4, !tbaa !14
  %206 = call i64 @recvfrom(i32 noundef %83, i8* noundef %205, i64 noundef %150, i32 noundef 0, %struct.sockaddr* noundef nonnull %86, i32* noundef nonnull %151) #7
  %207 = trunc i64 %206 to i32
  %208 = icmp sgt i32 %207, -1
  br i1 %208, label %209, label %313

209:                                              ; preds = %201
  %210 = icmp slt i32 %202, %0
  br label %211

211:                                              ; preds = %209, %215
  %212 = phi i32 [ %207, %209 ], [ %218, %215 ]
  %213 = phi i64 [ %206, %209 ], [ %217, %215 ]
  %214 = icmp ult i32 %212, 4
  br i1 %214, label %215, label %220

215:                                              ; preds = %227, %251, %211, %232, %257, %260
  %216 = load i8*, i8** %204, align 8, !tbaa !23
  store i32 %66, i32* %151, align 4, !tbaa !14
  %217 = call i64 @recvfrom(i32 noundef %83, i8* noundef %216, i64 noundef %150, i32 noundef 0, %struct.sockaddr* noundef nonnull %86, i32* noundef nonnull %151) #7
  %218 = trunc i64 %217 to i32
  %219 = icmp sgt i32 %218, -1
  br i1 %219, label %211, label %313

220:                                              ; preds = %211
  br i1 %148, label %232, label %221

221:                                              ; preds = %220, %227
  %222 = phi i64 [ %228, %227 ], [ 0, %220 ]
  %223 = getelementptr inbounds [3 x %union.anon], [3 x %union.anon]* %11, i64 0, i64 %222
  %224 = bitcast %union.anon* %223 to i8*
  %225 = call i32 @memcmp(i8* noundef nonnull %224, i8* noundef nonnull %17, i64 noundef %152) #7
  %226 = icmp eq i32 %225, 0
  br i1 %226, label %230, label %227

227:                                              ; preds = %221
  %228 = add nuw nsw i64 %222, 1
  %229 = icmp eq i64 %228, %158
  br i1 %229, label %215, label %221

230:                                              ; preds = %221
  %231 = trunc i64 %222 to i32
  br label %232

232:                                              ; preds = %230, %220
  %233 = phi i32 [ 0, %220 ], [ %231, %230 ]
  %234 = icmp eq i32 %233, %67
  br i1 %234, label %215, label %235

235:                                              ; preds = %232
  br i1 %210, label %236, label %257

236:                                              ; preds = %235
  %237 = load i8*, i8** %204, align 8, !tbaa !23
  %238 = load i8, i8* %237, align 1, !tbaa !13
  %239 = getelementptr inbounds i8, i8* %237, i64 1
  br label %240

240:                                              ; preds = %236, %251
  %241 = phi i64 [ %203, %236 ], [ %252, %251 ]
  %242 = getelementptr inbounds i8*, i8** %1, i64 %241
  %243 = load i8*, i8** %242, align 8, !tbaa !23
  %244 = load i8, i8* %243, align 1, !tbaa !13
  %245 = icmp eq i8 %238, %244
  br i1 %245, label %246, label %251

246:                                              ; preds = %240
  %247 = load i8, i8* %239, align 1, !tbaa !13
  %248 = getelementptr inbounds i8, i8* %243, i64 1
  %249 = load i8, i8* %248, align 1, !tbaa !13
  %250 = icmp eq i8 %247, %249
  br i1 %250, label %255, label %251

251:                                              ; preds = %240, %246
  %252 = add nsw i64 %241, 1
  %253 = trunc i64 %252 to i32
  %254 = icmp eq i32 %253, %0
  br i1 %254, label %215, label %240

255:                                              ; preds = %246
  %256 = trunc i64 %241 to i32
  br label %257

257:                                              ; preds = %255, %235
  %258 = phi i32 [ %202, %235 ], [ %256, %255 ]
  %259 = icmp eq i32 %258, %0
  br i1 %259, label %215, label %260

260:                                              ; preds = %257
  %261 = sext i32 %258 to i64
  %262 = getelementptr inbounds i32, i32* %4, i64 %261
  %263 = load i32, i32* %262, align 4, !tbaa !14
  %264 = icmp eq i32 %263, 0
  br i1 %264, label %265, label %215

265:                                              ; preds = %260
  %266 = load i8*, i8** %204, align 8, !tbaa !23
  %267 = getelementptr inbounds i8, i8* %266, i64 3
  %268 = load i8, i8* %267, align 1, !tbaa !13
  %269 = and i8 %268, 15
  %270 = zext i8 %269 to i32
  switch i32 %270, label %199 [
    i32 0, label %289
    i32 3, label %289
    i32 2, label %271
  ]

271:                                              ; preds = %265
  %272 = icmp eq i32 %287, 0
  br i1 %272, label %284, label %273

273:                                              ; preds = %271
  %274 = add nsw i32 %287, -1
  %275 = getelementptr inbounds i8*, i8** %1, i64 %261
  %276 = load i8*, i8** %275, align 8, !tbaa !23
  %277 = getelementptr inbounds i32, i32* %2, i64 %261
  %278 = load i32, i32* %277, align 4, !tbaa !14
  %279 = sext i32 %278 to i64
  %280 = zext i32 %233 to i64
  %281 = getelementptr inbounds [3 x %union.anon], [3 x %union.anon]* %11, i64 0, i64 %280
  %282 = bitcast %union.anon* %281 to %struct.sockaddr*
  %283 = call i64 @sendto(i32 noundef %83, i8* noundef %276, i64 noundef %279, i32 noundef 16384, %struct.sockaddr* noundef nonnull %282, i32 noundef %66) #7
  br label %284

284:                                              ; preds = %273, %271
  %285 = phi i32 [ 0, %271 ], [ %274, %273 ]
  br label %286

286:                                              ; preds = %191, %284
  %287 = phi i32 [ %285, %284 ], [ %192, %191 ]
  %288 = phi i32 [ %202, %284 ], [ %162, %191 ]
  br label %199

289:                                              ; preds = %265, %265
  %290 = getelementptr inbounds i32, i32* %4, i64 %261
  %291 = trunc i64 %213 to i32
  store i32 %291, i32* %290, align 4, !tbaa !14
  %292 = icmp eq i32 %258, %202
  br i1 %292, label %293, label %302

293:                                              ; preds = %289
  br i1 %210, label %294, label %310

294:                                              ; preds = %293, %299
  %295 = phi i64 [ %300, %299 ], [ %203, %293 ]
  %296 = getelementptr inbounds i32, i32* %4, i64 %295
  %297 = load i32, i32* %296, align 4, !tbaa !14
  %298 = icmp eq i32 %297, 0
  br i1 %298, label %308, label %299

299:                                              ; preds = %294
  %300 = add nsw i64 %295, 1
  %301 = icmp eq i64 %300, %127
  br i1 %301, label %324, label %294

302:                                              ; preds = %289
  %303 = getelementptr inbounds i8*, i8** %3, i64 %261
  %304 = load i8*, i8** %303, align 8, !tbaa !23
  %305 = shl i64 %213, 32
  %306 = ashr exact i64 %305, 32
  %307 = call i8* @memcpy(i8* noundef %304, i8* noundef nonnull %266, i64 noundef %306) #7
  br label %310

308:                                              ; preds = %294
  %309 = trunc i64 %295 to i32
  br label %310

310:                                              ; preds = %308, %293, %302
  %311 = phi i32 [ %202, %302 ], [ %202, %293 ], [ %309, %308 ]
  %312 = icmp eq i32 %311, %0
  br i1 %312, label %324, label %201

313:                                              ; preds = %201, %215, %191
  %314 = phi i32 [ %192, %191 ], [ %287, %215 ], [ %287, %201 ]
  %315 = phi i32 [ %162, %191 ], [ %202, %215 ], [ %202, %201 ]
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %153) #5
  %316 = call i32 @clock_gettime(i32 noundef 0, %struct.timespec* noundef nonnull %8) #7
  %317 = load i64, i64* %154, align 8, !tbaa !19
  %318 = mul i64 %317, 1000
  %319 = load i64, i64* %155, align 8, !tbaa !22
  %320 = sdiv i64 %319, 1000000
  %321 = add i64 %320, %318
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %153) #5
  %322 = sub i64 %321, %141
  %323 = icmp ult i64 %322, %143
  br i1 %323, label %159, label %324

324:                                              ; preds = %313, %310, %299, %125
  call void @_pthread_cleanup_pop(%struct.__ptcb* noundef nonnull %14, i32 noundef 1) #7
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %95) #5
  br label %325

325:                                              ; preds = %324, %91
  %326 = phi i32 [ -1, %91 ], [ 0, %324 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %20) #5
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %19) #5
  call void @llvm.lifetime.end.p0i8(i64 84, i8* nonnull %18) #5
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %17) #5
  ret i32 %326
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: optsize
declare i32 @pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare zeroext i16 @htons(i16 noundef zeroext) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @bind(i32 noundef, %struct.sockaddr* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @close(i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare void @_pthread_cleanup_push(%struct.__ptcb* noundef, void (i8*)* noundef, i8* noundef) local_unnamed_addr #3

; Function Attrs: nounwind optsize strictfp
define internal void @cleanup(i8* noundef %0) #0 {
  %2 = ptrtoint i8* %0 to i64
  %3 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 3, i64 %2) #5, !srcloc !25
  ret void
}

; Function Attrs: optsize
declare i32 @setsockopt(i32 noundef, i32 noundef, i32 noundef, i8* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i64 @sendto(i32 noundef, i8* noundef, i64 noundef, i32 noundef, %struct.sockaddr* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @poll(%struct.pollfd* noundef, i64 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i64 @recvfrom(i32 noundef, i8* noundef, i64 noundef, i32 noundef, %struct.sockaddr* noundef, i32* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @memcmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare void @_pthread_cleanup_pop(%struct.__ptcb* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: nounwind optsize strictfp
define i32 @__res_msend(i32 noundef %0, i8** nocapture noundef readonly %1, i32* nocapture noundef readonly %2, i8** nocapture noundef readonly %3, i32* noundef %4, i32 noundef %5) local_unnamed_addr #0 {
  %7 = alloca %struct.resolvconf, align 4
  %8 = bitcast %struct.resolvconf* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 100, i8* nonnull %8) #5
  %9 = call i32 @__get_resolv_conf(%struct.resolvconf* noundef nonnull %7, i8* noundef null, i64 noundef 0) #7
  %10 = icmp slt i32 %9, 0
  br i1 %10, label %13, label %11

11:                                               ; preds = %6
  %12 = call i32 @__res_msend_rc(i32 noundef %0, i8** noundef %1, i32* noundef %2, i8** noundef %3, i32* noundef %4, i32 noundef %5, %struct.resolvconf* noundef nonnull %7) #9
  br label %13

13:                                               ; preds = %6, %11
  %14 = phi i32 [ %12, %11 ], [ -1, %6 ]
  call void @llvm.lifetime.end.p0i8(i64 100, i8* nonnull %8) #5
  ret i32 %14
}

; Function Attrs: optsize
declare hidden i32 @__get_resolv_conf(%struct.resolvconf* noundef, i8* noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @clock_gettime(i32 noundef, %struct.timespec* noundef) local_unnamed_addr #3

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind strictfp }
attributes #6 = { strictfp }
attributes #7 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #8 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #9 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !7, i64 96}
!4 = !{!"resolvconf", !5, i64 0, !7, i64 84, !7, i64 88, !7, i64 92, !7, i64 96}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!"int", !5, i64 0}
!8 = !{!4, !7, i64 88}
!9 = !{!4, !7, i64 84}
!10 = !{!11, !7, i64 0}
!11 = !{!"address", !7, i64 0, !7, i64 4, !5, i64 8, !7, i64 24}
!12 = !{!11, !7, i64 4}
!13 = !{!5, !5, i64 0}
!14 = !{!7, !7, i64 0}
!15 = !{!16, !7, i64 0}
!16 = !{!"pollfd", !7, i64 0, !17, i64 4, !17, i64 6}
!17 = !{!"short", !5, i64 0}
!18 = !{!16, !17, i64 4}
!19 = !{!20, !21, i64 0}
!20 = !{!"timespec", !21, i64 0, !21, i64 8}
!21 = !{!"long", !5, i64 0}
!22 = !{!20, !21, i64 8}
!23 = !{!24, !24, i64 0}
!24 = !{!"any pointer", !5, i64 0}
!25 = !{i64 257916}
