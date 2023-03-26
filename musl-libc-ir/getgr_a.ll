; ModuleID = 'src/passwd/getgr_a.c'
source_filename = "src/passwd/getgr_a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.group = type { i8*, i8*, i32, i8** }
%struct._IO_FILE = type opaque

@.str = private unnamed_addr constant [11 x i8] c"/etc/group\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"rbe\00", align 1

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__getgr_a(i8* noundef %0, i32 noundef %1, %struct.group* noundef %2, i8** noundef %3, i64* noundef %4, i8*** noundef %5, i64* noundef %6, %struct.group** noundef %7) local_unnamed_addr #0 {
  %9 = alloca i32, align 4
  %10 = alloca [6 x i32], align 16
  %11 = alloca [11 x i8], align 1
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = bitcast i32* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %14) #6
  store %struct.group* null, %struct.group** %7, align 8, !tbaa !3
  %15 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %9) #7
  %16 = call %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)) #7
  %17 = icmp eq %struct._IO_FILE* %16, null
  br i1 %17, label %23, label %18

18:                                               ; preds = %8
  %19 = call i32 @__getgrent_a(%struct._IO_FILE* noundef nonnull %16, %struct.group* noundef %2, i8** noundef %3, i64* noundef %4, i8*** noundef %5, i64* noundef %6, %struct.group** noundef nonnull %7) #7
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %42

21:                                               ; preds = %18
  %22 = icmp eq i8* %0, null
  br label %26

23:                                               ; preds = %8
  %24 = tail call i32* @___errno_location() #8
  %25 = load i32, i32* %24, align 4, !tbaa !7
  br label %257

26:                                               ; preds = %21, %39
  %27 = load %struct.group*, %struct.group** %7, align 8, !tbaa !3
  %28 = icmp eq %struct.group* %27, null
  br i1 %28, label %42, label %29

29:                                               ; preds = %26
  br i1 %22, label %35, label %30

30:                                               ; preds = %29
  %31 = getelementptr inbounds %struct.group, %struct.group* %27, i64 0, i32 0
  %32 = load i8*, i8** %31, align 8, !tbaa !9
  %33 = call i32 @strcmp(i8* noundef nonnull %0, i8* noundef %32) #7
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %42, label %39

35:                                               ; preds = %29
  %36 = getelementptr inbounds %struct.group, %struct.group* %27, i64 0, i32 2
  %37 = load i32, i32* %36, align 8, !tbaa !11
  %38 = icmp eq i32 %37, %1
  br i1 %38, label %42, label %39

39:                                               ; preds = %30, %35
  %40 = call i32 @__getgrent_a(%struct._IO_FILE* noundef nonnull %16, %struct.group* noundef %2, i8** noundef %3, i64* noundef %4, i8*** noundef %5, i64* noundef %6, %struct.group** noundef nonnull %7) #7
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %26, label %42

42:                                               ; preds = %26, %35, %30, %39, %18
  %43 = phi i32 [ %19, %18 ], [ %40, %39 ], [ 0, %30 ], [ 0, %35 ], [ 0, %26 ]
  %44 = call i32 @fclose(%struct._IO_FILE* noundef nonnull %16) #7
  %45 = load %struct.group*, %struct.group** %7, align 8, !tbaa !3
  %46 = icmp eq %struct.group* %45, null
  br i1 %46, label %47, label %257

47:                                               ; preds = %42
  switch i32 %43, label %48 [
    i32 20, label %51
    i32 2, label %51
    i32 0, label %51
  ]

48:                                               ; preds = %47
  %49 = load i32, i32* %9, align 4, !tbaa !7
  %50 = call i32 @pthread_setcancelstate(i32 noundef %49, i32* noundef null) #7
  br label %262

51:                                               ; preds = %47, %47, %47
  %52 = icmp eq i8* %0, null
  %53 = select i1 %52, i32 3, i32 2
  %54 = bitcast [6 x i32]* %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %54) #6
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(24) %54, i8 0, i64 24, i1 false) #9
  %55 = getelementptr inbounds [11 x i8], [11 x i8]* %11, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 11, i8* nonnull %55) #6
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(11) %55, i8 0, i64 11, i1 false) #9
  %56 = bitcast i32* %12 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %56) #6
  store i32 0, i32* %12, align 4, !tbaa !7
  br i1 %52, label %57, label %68

57:                                               ; preds = %51
  %58 = getelementptr inbounds [11 x i8], [11 x i8]* %11, i64 0, i64 10
  store i8 0, i8* %58, align 1, !tbaa !12
  br label %59

59:                                               ; preds = %59, %57
  %60 = phi i8* [ %58, %57 ], [ %65, %59 ]
  %61 = phi i32 [ %1, %57 ], [ %66, %59 ]
  %62 = urem i32 %61, 10
  %63 = trunc i32 %62 to i8
  %64 = or i8 %63, 48
  %65 = getelementptr inbounds i8, i8* %60, i64 -1
  store i8 %64, i8* %65, align 1, !tbaa !12
  %66 = udiv i32 %61, 10
  %67 = icmp ult i32 %61, 10
  br i1 %67, label %68, label %59

68:                                               ; preds = %59, %51
  %69 = phi i8* [ %0, %51 ], [ %65, %59 ]
  %70 = getelementptr inbounds [6 x i32], [6 x i32]* %10, i64 0, i64 0
  %71 = call %struct._IO_FILE* @__nscd_query(i32 noundef %53, i8* noundef nonnull %69, i32* noundef nonnull %70, i64 noundef 24, i32* noundef nonnull %12) #7
  %72 = icmp eq %struct._IO_FILE* %71, null
  br i1 %72, label %73, label %76

73:                                               ; preds = %68
  %74 = tail call i32* @___errno_location() #8
  %75 = load i32, i32* %74, align 4, !tbaa !7
  br label %255

76:                                               ; preds = %68
  %77 = getelementptr inbounds [6 x i32], [6 x i32]* %10, i64 0, i64 1
  %78 = load i32, i32* %77, align 4, !tbaa !7
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %252, label %80

80:                                               ; preds = %76
  %81 = getelementptr inbounds [6 x i32], [6 x i32]* %10, i64 0, i64 2
  %82 = load i32, i32* %81, align 8, !tbaa !7
  %83 = icmp ne i32 %82, 0
  %84 = getelementptr inbounds [6 x i32], [6 x i32]* %10, i64 0, i64 3
  %85 = load i32, i32* %84, align 4
  %86 = icmp ne i32 %85, 0
  %87 = select i1 %83, i1 %86, i1 false
  br i1 %87, label %88, label %252

88:                                               ; preds = %80
  %89 = xor i32 %85, -1
  %90 = icmp ugt i32 %82, %89
  br i1 %90, label %252, label %91

91:                                               ; preds = %88
  %92 = add nsw i32 %85, %82
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [6 x i32], [6 x i32]* %10, i64 0, i64 5
  %95 = load i32, i32* %94, align 4, !tbaa !7
  %96 = icmp sgt i32 %95, 0
  br i1 %96, label %97, label %131

97:                                               ; preds = %91
  %98 = bitcast i32* %13 to i8*
  br label %99

99:                                               ; preds = %97, %125
  %100 = phi i64 [ 0, %97 ], [ %127, %125 ]
  %101 = phi i64 [ %93, %97 ], [ %126, %125 ]
  %102 = phi i32 [ 0, %97 ], [ %128, %125 ]
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %98) #6
  %103 = call i64 @fread(i8* noundef nonnull %98, i64 noundef 4, i64 noundef 1, %struct._IO_FILE* noundef nonnull %71) #7
  %104 = icmp eq i64 %103, 0
  br i1 %104, label %105, label %111

105:                                              ; preds = %99
  %106 = call i32 @ferror(%struct._IO_FILE* noundef nonnull %71) #7
  %107 = icmp eq i32 %106, 0
  br i1 %107, label %123, label %108

108:                                              ; preds = %105
  %109 = tail call i32* @___errno_location() #8
  %110 = load i32, i32* %109, align 4, !tbaa !7
  br label %123

111:                                              ; preds = %99
  %112 = load i32, i32* %12, align 4, !tbaa !7
  %113 = icmp eq i32 %112, 0
  %114 = load i32, i32* %13, align 4, !tbaa !7
  %115 = call i32 @llvm.bswap.i32(i32 %114) #10
  %116 = select i1 %113, i32 %114, i32 %115
  %117 = zext i32 %116 to i64
  %118 = xor i64 %100, -1
  %119 = icmp ugt i64 %117, %118
  %120 = xor i64 %101, -1
  %121 = icmp ugt i64 %117, %120
  %122 = select i1 %119, i1 true, i1 %121
  br i1 %122, label %123, label %125

123:                                              ; preds = %111, %105, %108
  %124 = phi i32 [ 5, %105 ], [ %110, %108 ], [ 12, %111 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %98) #6
  br label %252

125:                                              ; preds = %111
  %126 = add i64 %101, %117
  %127 = add i64 %100, %117
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %98) #6
  %128 = add nuw nsw i32 %102, 1
  %129 = load i32, i32* %94, align 4, !tbaa !7
  %130 = icmp slt i32 %128, %129
  br i1 %130, label %99, label %131

131:                                              ; preds = %125, %91
  %132 = phi i64 [ %93, %91 ], [ %126, %125 ]
  %133 = phi i64 [ 0, %91 ], [ %127, %125 ]
  %134 = load i64, i64* %4, align 8, !tbaa !13
  %135 = icmp ugt i64 %132, %134
  %136 = load i8*, i8** %3, align 8, !tbaa !3
  br i1 %135, label %139, label %137

137:                                              ; preds = %131
  %138 = icmp eq i8* %136, null
  br i1 %138, label %139, label %147

139:                                              ; preds = %131, %137
  %140 = phi i8* [ null, %137 ], [ %136, %131 ]
  %141 = call i8* @realloc(i8* noundef %140, i64 noundef %132) #7
  %142 = icmp eq i8* %141, null
  br i1 %142, label %144, label %143

143:                                              ; preds = %139
  store i8* %141, i8** %3, align 8, !tbaa !3
  store i64 %132, i64* %4, align 8, !tbaa !13
  br label %147

144:                                              ; preds = %139
  %145 = tail call i32* @___errno_location() #8
  %146 = load i32, i32* %145, align 4, !tbaa !7
  br label %252

147:                                              ; preds = %143, %137
  %148 = phi i8* [ %141, %143 ], [ %136, %137 ]
  %149 = call i64 @fread(i8* noundef nonnull %148, i64 noundef %132, i64 noundef 1, %struct._IO_FILE* noundef nonnull %71) #7
  %150 = icmp eq i64 %149, 0
  br i1 %150, label %151, label %157

151:                                              ; preds = %147
  %152 = call i32 @ferror(%struct._IO_FILE* noundef nonnull %71) #7
  %153 = icmp eq i32 %152, 0
  br i1 %153, label %252, label %154

154:                                              ; preds = %151
  %155 = tail call i32* @___errno_location() #8
  %156 = load i32, i32* %155, align 4, !tbaa !7
  br label %252

157:                                              ; preds = %147
  %158 = load i32, i32* %94, align 4, !tbaa !7
  %159 = add nsw i32 %158, 1
  %160 = sext i32 %159 to i64
  %161 = load i64, i64* %6, align 8, !tbaa !13
  %162 = icmp ult i64 %161, %160
  br i1 %162, label %163, label %178

163:                                              ; preds = %157
  %164 = icmp slt i32 %158, -1
  br i1 %164, label %252, label %165

165:                                              ; preds = %163
  %166 = bitcast i8*** %5 to i8**
  %167 = load i8*, i8** %166, align 8, !tbaa !3
  %168 = shl nsw i64 %160, 3
  %169 = call i8* @realloc(i8* noundef %167, i64 noundef %168) #7
  %170 = icmp eq i8* %169, null
  br i1 %170, label %175, label %171

171:                                              ; preds = %165
  store i8* %169, i8** %166, align 8, !tbaa !3
  %172 = load i32, i32* %94, align 4, !tbaa !7
  %173 = add nsw i32 %172, 1
  %174 = sext i32 %173 to i64
  store i64 %174, i64* %6, align 8, !tbaa !13
  br label %178

175:                                              ; preds = %165
  %176 = tail call i32* @___errno_location() #8
  %177 = load i32, i32* %176, align 4, !tbaa !7
  br label %252

178:                                              ; preds = %171, %157
  %179 = phi i32 [ %172, %171 ], [ %158, %157 ]
  %180 = icmp eq i32 %179, 0
  br i1 %180, label %220, label %181

181:                                              ; preds = %178
  %182 = load i8*, i8** %3, align 8, !tbaa !3
  %183 = load i32, i32* %81, align 8, !tbaa !7
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds i8, i8* %182, i64 %184
  %186 = load i32, i32* %84, align 4, !tbaa !7
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds i8, i8* %185, i64 %187
  %189 = load i8**, i8*** %5, align 8, !tbaa !3
  store i8* %188, i8** %189, align 8, !tbaa !3
  %190 = load i8**, i8*** %5, align 8, !tbaa !3
  %191 = load i8*, i8** %190, align 8, !tbaa !3
  %192 = icmp eq i64 %133, 0
  br i1 %192, label %214, label %193

193:                                              ; preds = %181, %207
  %194 = phi i8* [ %208, %207 ], [ %191, %181 ]
  %195 = phi i8** [ %209, %207 ], [ %190, %181 ]
  %196 = phi i8* [ %211, %207 ], [ %191, %181 ]
  %197 = phi i32 [ %210, %207 ], [ 0, %181 ]
  %198 = load i8, i8* %196, align 1, !tbaa !12
  %199 = icmp eq i8 %198, 0
  br i1 %199, label %200, label %207

200:                                              ; preds = %193
  %201 = getelementptr inbounds i8, i8* %196, i64 1
  %202 = add nsw i32 %197, 1
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds i8*, i8** %195, i64 %203
  store i8* %201, i8** %204, align 8, !tbaa !3
  %205 = load i8**, i8*** %5, align 8, !tbaa !3
  %206 = load i8*, i8** %205, align 8, !tbaa !3
  br label %207

207:                                              ; preds = %193, %200
  %208 = phi i8* [ %194, %193 ], [ %206, %200 ]
  %209 = phi i8** [ %195, %193 ], [ %205, %200 ]
  %210 = phi i32 [ %197, %193 ], [ %202, %200 ]
  %211 = getelementptr inbounds i8, i8* %196, i64 1
  %212 = getelementptr inbounds i8, i8* %208, i64 %133
  %213 = icmp eq i8* %211, %212
  br i1 %213, label %214, label %193

214:                                              ; preds = %207, %181
  %215 = phi i32 [ 0, %181 ], [ %210, %207 ]
  %216 = phi i8** [ %190, %181 ], [ %209, %207 ]
  %217 = sext i32 %215 to i64
  %218 = getelementptr inbounds i8*, i8** %216, i64 %217
  store i8* null, i8** %218, align 8, !tbaa !3
  %219 = icmp eq i32 %215, %179
  br i1 %219, label %224, label %252

220:                                              ; preds = %178
  %221 = load i8**, i8*** %5, align 8, !tbaa !3
  store i8* null, i8** %221, align 8, !tbaa !3
  %222 = load i32, i32* %81, align 8, !tbaa !7
  %223 = sext i32 %222 to i64
  br label %224

224:                                              ; preds = %214, %220
  %225 = phi i64 [ %184, %214 ], [ %223, %220 ]
  %226 = load i8*, i8** %3, align 8, !tbaa !3
  %227 = getelementptr inbounds %struct.group, %struct.group* %2, i64 0, i32 0
  store i8* %226, i8** %227, align 8, !tbaa !9
  %228 = getelementptr inbounds i8, i8* %226, i64 %225
  %229 = getelementptr inbounds %struct.group, %struct.group* %2, i64 0, i32 1
  store i8* %228, i8** %229, align 8, !tbaa !15
  %230 = getelementptr inbounds [6 x i32], [6 x i32]* %10, i64 0, i64 4
  %231 = load i32, i32* %230, align 16, !tbaa !7
  %232 = getelementptr inbounds %struct.group, %struct.group* %2, i64 0, i32 2
  store i32 %231, i32* %232, align 8, !tbaa !11
  %233 = load i8**, i8*** %5, align 8, !tbaa !3
  %234 = getelementptr inbounds %struct.group, %struct.group* %2, i64 0, i32 3
  store i8** %233, i8*** %234, align 8, !tbaa !16
  %235 = getelementptr inbounds i8, i8* %228, i64 -1
  %236 = load i8, i8* %235, align 1, !tbaa !12
  %237 = icmp eq i8 %236, 0
  br i1 %237, label %238, label %252

238:                                              ; preds = %224
  %239 = load i32, i32* %84, align 4, !tbaa !7
  %240 = add nsw i32 %239, -1
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds i8, i8* %228, i64 %241
  %243 = load i8, i8* %242, align 1, !tbaa !12
  %244 = icmp eq i8 %243, 0
  br i1 %244, label %245, label %252

245:                                              ; preds = %238
  br i1 %52, label %249, label %246

246:                                              ; preds = %245
  %247 = call i32 @strcmp(i8* noundef nonnull %0, i8* noundef nonnull %226) #7
  %248 = icmp eq i32 %247, 0
  br i1 %248, label %251, label %252

249:                                              ; preds = %245
  %250 = icmp eq i32 %231, %1
  br i1 %250, label %251, label %252

251:                                              ; preds = %246, %249
  store %struct.group* %2, %struct.group** %7, align 8, !tbaa !3
  br label %252

252:                                              ; preds = %175, %144, %123, %246, %249, %224, %238, %214, %163, %154, %151, %88, %80, %76, %251
  %253 = phi i32 [ %146, %144 ], [ %177, %175 ], [ %43, %251 ], [ 0, %76 ], [ 5, %80 ], [ 12, %88 ], [ %156, %154 ], [ 5, %151 ], [ 12, %163 ], [ 5, %214 ], [ 5, %238 ], [ 5, %224 ], [ 5, %249 ], [ 5, %246 ], [ %124, %123 ]
  %254 = call i32 @fclose(%struct._IO_FILE* noundef nonnull %71) #7
  br label %255

255:                                              ; preds = %252, %73
  %256 = phi i32 [ %253, %252 ], [ %75, %73 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %56) #6
  call void @llvm.lifetime.end.p0i8(i64 11, i8* nonnull %55) #6
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %54) #6
  br label %257

257:                                              ; preds = %255, %42, %23
  %258 = phi i32 [ %43, %42 ], [ %256, %255 ], [ %25, %23 ]
  %259 = load i32, i32* %9, align 4, !tbaa !7
  %260 = call i32 @pthread_setcancelstate(i32 noundef %259, i32* noundef null) #7
  %261 = icmp eq i32 %258, 0
  br i1 %261, label %265, label %262

262:                                              ; preds = %48, %257
  %263 = phi i32 [ %43, %48 ], [ %258, %257 ]
  %264 = tail call i32* @___errno_location() #8
  store i32 %263, i32* %264, align 4, !tbaa !7
  br label %265

265:                                              ; preds = %257, %262
  %266 = phi i32 [ 0, %257 ], [ %263, %262 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %14) #6
  ret i32 %266
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare %struct._IO_FILE* @fopen(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare hidden i32 @__getgrent_a(%struct._IO_FILE* noundef, %struct.group* noundef, i8** noundef, i64* noundef, i8*** noundef, i64* noundef, %struct.group** noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @strcmp(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @fclose(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: optsize
declare hidden %struct._IO_FILE* @__nscd_query(i32 noundef, i8* noundef, i32* noundef, i64 noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @fread(i8* noundef, i64 noundef, i64 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @ferror(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i8* @realloc(i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.bswap.i32(i32) #5

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #5 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { nounwind strictfp }
attributes #7 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #8 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #9 = { strictfp }
attributes #10 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
!9 = !{!10, !4, i64 0}
!10 = !{!"group", !4, i64 0, !4, i64 8, !8, i64 16, !4, i64 24}
!11 = !{!10, !8, i64 16}
!12 = !{!5, !5, i64 0}
!13 = !{!14, !14, i64 0}
!14 = !{!"long", !5, i64 0}
!15 = !{!10, !4, i64 8}
!16 = !{!10, !4, i64 24}
