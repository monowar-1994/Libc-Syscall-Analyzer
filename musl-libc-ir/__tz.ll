; ModuleID = 'src/time/__tz.c'
source_filename = "src/time/__tz.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }

@__timezone = global i64 0, align 8
@__daylight = global i32 0, align 4
@__tzname = global [2 x i8*] zeroinitializer, align 16
@__utc = hidden constant [4 x i8] c"UTC\00", align 1
@lock = internal global [1 x i32] zeroinitializer, align 4
@__timezone_lockptr = hidden local_unnamed_addr constant i32* getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0), align 8
@zi = internal unnamed_addr global i8* null, align 8
@types = internal unnamed_addr global i8* null, align 8
@abbrevs = internal unnamed_addr global i8* null, align 8
@r0 = internal global [5 x i32] zeroinitializer, align 16
@r1 = internal global [5 x i32] zeroinitializer, align 16
@dst_off = internal unnamed_addr global i32 0, align 4
@abbrevs_end = internal unnamed_addr global i8* null, align 8
@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@do_tzset.search = internal constant [54 x i8] c"/usr/share/zoneinfo/\00/share/zoneinfo/\00/etc/zoneinfo/\00\00", align 16
@.str.1 = private unnamed_addr constant [3 x i8] c"TZ\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"/etc/localtime\00", align 1
@old_tz = internal unnamed_addr global i8* getelementptr inbounds ([32 x i8], [32 x i8]* @old_tz_buf, i64 0, i64 0), align 8
@map_size = internal global i64 0, align 8
@old_tz_size = internal unnamed_addr global i64 32, align 8
@.str.4 = private unnamed_addr constant [4 x i8] c"GMT\00", align 1
@__libc = external hidden local_unnamed_addr global %struct.__libc, align 8
@.str.5 = private unnamed_addr constant [5 x i8] c"TZif\00", align 1
@trans = internal unnamed_addr global i8* null, align 8
@index = internal unnamed_addr global i8* null, align 8
@std_name = internal global [7 x i8] zeroinitializer, align 1
@dst_name = internal global [7 x i8] zeroinitializer, align 1
@old_tz_buf = internal global [32 x i8] zeroinitializer, align 16

@timezone = weak alias i64, i64* @__timezone
@daylight = weak alias i32, i32* @__daylight
@tzname = weak alias [2 x i8*], [2 x i8*]* @__tzname
@tzset = weak alias void (), void ()* @__tzset

; Function Attrs: nounwind optsize strictfp
define hidden void @__secs_to_zone(i64 noundef %0, i32 noundef %1, i32* nocapture noundef writeonly %2, i64* nocapture noundef writeonly %3, i64* noundef writeonly %4, i8** nocapture noundef writeonly %5) local_unnamed_addr #0 {
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #4
  tail call fastcc void @do_tzset() #5
  %7 = load i8*, i8** @zi, align 8, !tbaa !3
  %8 = icmp eq i8* %7, null
  br i1 %8, label %301, label %9

9:                                                ; preds = %6
  %10 = load i8*, i8** @trans, align 8, !tbaa !3
  %11 = getelementptr inbounds i8, i8* %7, i64 44
  %12 = icmp eq i8* %10, %11
  %13 = load i8*, i8** @index, align 8, !tbaa !3
  %14 = ptrtoint i8* %13 to i64
  %15 = ptrtoint i8* %10 to i64
  %16 = sub i64 %14, %15
  %17 = select i1 %12, i64 2, i64 3
  %18 = ashr i64 %16, %17
  switch i64 %18, label %21 [
    i64 0, label %19
    i64 1, label %301
  ]

19:                                               ; preds = %9
  %20 = load i8*, i8** @types, align 8, !tbaa !3
  br label %245

21:                                               ; preds = %9
  %22 = icmp eq i32 %1, 0
  %23 = load i8*, i8** @types, align 8
  br label %24

24:                                               ; preds = %99, %21
  %25 = phi i64 [ %18, %21 ], [ %106, %99 ]
  %26 = phi i64 [ 0, %21 ], [ %105, %99 ]
  %27 = phi i32 [ 0, %21 ], [ %100, %99 ]
  %28 = lshr i64 %25, 1
  %29 = add i64 %28, %26
  %30 = shl i64 %29, %17
  %31 = getelementptr inbounds i8, i8* %10, i64 %30
  %32 = load i8, i8* %31, align 1, !tbaa !7
  %33 = zext i8 %32 to i32
  %34 = shl nuw i32 %33, 24
  %35 = getelementptr inbounds i8, i8* %31, i64 1
  %36 = load i8, i8* %35, align 1, !tbaa !7
  %37 = zext i8 %36 to i32
  %38 = shl nuw nsw i32 %37, 16
  %39 = or i32 %38, %34
  %40 = getelementptr inbounds i8, i8* %31, i64 2
  %41 = load i8, i8* %40, align 1, !tbaa !7
  %42 = zext i8 %41 to i32
  %43 = shl nuw nsw i32 %42, 8
  %44 = or i32 %39, %43
  %45 = getelementptr inbounds i8, i8* %31, i64 3
  %46 = load i8, i8* %45, align 1, !tbaa !7
  %47 = zext i8 %46 to i32
  %48 = or i32 %44, %47
  br i1 %12, label %71, label %49

49:                                               ; preds = %24
  %50 = zext i32 %48 to i64
  %51 = shl nuw i64 %50, 32
  %52 = getelementptr inbounds i8, i8* %31, i64 4
  %53 = load i8, i8* %52, align 1, !tbaa !7
  %54 = zext i8 %53 to i64
  %55 = shl nuw nsw i64 %54, 24
  %56 = getelementptr inbounds i8, i8* %52, i64 1
  %57 = load i8, i8* %56, align 1, !tbaa !7
  %58 = zext i8 %57 to i64
  %59 = shl nuw nsw i64 %58, 16
  %60 = getelementptr inbounds i8, i8* %52, i64 2
  %61 = load i8, i8* %60, align 1, !tbaa !7
  %62 = zext i8 %61 to i64
  %63 = shl nuw nsw i64 %62, 8
  %64 = getelementptr inbounds i8, i8* %52, i64 3
  %65 = load i8, i8* %64, align 1, !tbaa !7
  %66 = zext i8 %65 to i64
  %67 = or i64 %55, %51
  %68 = or i64 %67, %59
  %69 = or i64 %68, %63
  %70 = or i64 %69, %66
  br label %73

71:                                               ; preds = %24
  %72 = sext i32 %48 to i64
  br label %73

73:                                               ; preds = %71, %49
  %74 = phi i64 [ %70, %49 ], [ %72, %71 ]
  br i1 %22, label %99, label %75

75:                                               ; preds = %73
  %76 = add i64 %29, -1
  %77 = getelementptr inbounds i8, i8* %13, i64 %76
  %78 = load i8, i8* %77, align 1, !tbaa !7
  %79 = zext i8 %78 to i64
  %80 = mul nuw nsw i64 %79, 6
  %81 = getelementptr inbounds i8, i8* %23, i64 %80
  %82 = load i8, i8* %81, align 1, !tbaa !7
  %83 = zext i8 %82 to i32
  %84 = shl nuw i32 %83, 24
  %85 = getelementptr inbounds i8, i8* %81, i64 1
  %86 = load i8, i8* %85, align 1, !tbaa !7
  %87 = zext i8 %86 to i32
  %88 = shl nuw nsw i32 %87, 16
  %89 = or i32 %88, %84
  %90 = getelementptr inbounds i8, i8* %81, i64 2
  %91 = load i8, i8* %90, align 1, !tbaa !7
  %92 = zext i8 %91 to i32
  %93 = shl nuw nsw i32 %92, 8
  %94 = or i32 %89, %93
  %95 = getelementptr inbounds i8, i8* %81, i64 3
  %96 = load i8, i8* %95, align 1, !tbaa !7
  %97 = zext i8 %96 to i32
  %98 = or i32 %94, %97
  br label %99

99:                                               ; preds = %75, %73
  %100 = phi i32 [ %98, %75 ], [ %27, %73 ]
  %101 = sext i32 %100 to i64
  %102 = sub nsw i64 %0, %101
  %103 = icmp slt i64 %102, %74
  %104 = sub i64 %25, %28
  %105 = select i1 %103, i64 %26, i64 %29
  %106 = select i1 %103, i64 %28, i64 %104
  %107 = icmp ugt i64 %106, 1
  br i1 %107, label %24, label %108

108:                                              ; preds = %99
  %109 = add i64 %18, -1
  %110 = icmp eq i64 %105, %109
  br i1 %110, label %301, label %111

111:                                              ; preds = %108
  %112 = icmp eq i64 %105, 0
  br i1 %112, label %113, label %202

113:                                              ; preds = %111
  %114 = load i8, i8* %10, align 1, !tbaa !7
  %115 = zext i8 %114 to i32
  %116 = shl nuw i32 %115, 24
  %117 = getelementptr inbounds i8, i8* %10, i64 1
  %118 = load i8, i8* %117, align 1, !tbaa !7
  %119 = zext i8 %118 to i32
  %120 = shl nuw nsw i32 %119, 16
  %121 = or i32 %120, %116
  %122 = getelementptr inbounds i8, i8* %10, i64 2
  %123 = load i8, i8* %122, align 1, !tbaa !7
  %124 = zext i8 %123 to i32
  %125 = shl nuw nsw i32 %124, 8
  %126 = or i32 %121, %125
  %127 = getelementptr inbounds i8, i8* %10, i64 3
  %128 = load i8, i8* %127, align 1, !tbaa !7
  %129 = zext i8 %128 to i32
  %130 = or i32 %126, %129
  br i1 %12, label %153, label %131

131:                                              ; preds = %113
  %132 = zext i32 %130 to i64
  %133 = shl nuw i64 %132, 32
  %134 = getelementptr inbounds i8, i8* %10, i64 4
  %135 = load i8, i8* %134, align 1, !tbaa !7
  %136 = zext i8 %135 to i64
  %137 = shl nuw nsw i64 %136, 24
  %138 = getelementptr inbounds i8, i8* %10, i64 5
  %139 = load i8, i8* %138, align 1, !tbaa !7
  %140 = zext i8 %139 to i64
  %141 = shl nuw nsw i64 %140, 16
  %142 = getelementptr inbounds i8, i8* %10, i64 6
  %143 = load i8, i8* %142, align 1, !tbaa !7
  %144 = zext i8 %143 to i64
  %145 = shl nuw nsw i64 %144, 8
  %146 = getelementptr inbounds i8, i8* %10, i64 7
  %147 = load i8, i8* %146, align 1, !tbaa !7
  %148 = zext i8 %147 to i64
  %149 = or i64 %137, %133
  %150 = or i64 %149, %141
  %151 = or i64 %150, %145
  %152 = or i64 %151, %148
  br label %155

153:                                              ; preds = %113
  %154 = sext i32 %130 to i64
  br label %155

155:                                              ; preds = %153, %131
  %156 = phi i64 [ %152, %131 ], [ %154, %153 ]
  %157 = load i8*, i8** @abbrevs, align 8, !tbaa !3
  %158 = ptrtoint i8* %157 to i64
  %159 = ptrtoint i8* %23 to i64
  %160 = sub i64 %158, %159
  %161 = icmp eq i64 %160, 0
  br i1 %161, label %162, label %164

162:                                              ; preds = %164, %155
  %163 = phi i64 [ 0, %155 ], [ %172, %164 ]
  br i1 %22, label %195, label %174

164:                                              ; preds = %155, %164
  %165 = phi i64 [ %167, %164 ], [ %160, %155 ]
  %166 = phi i64 [ %172, %164 ], [ 0, %155 ]
  %167 = add i64 %165, -6
  %168 = add i64 %165, -2
  %169 = getelementptr inbounds i8, i8* %23, i64 %168
  %170 = load i8, i8* %169, align 1, !tbaa !7
  %171 = icmp eq i8 %170, 0
  %172 = select i1 %171, i64 %167, i64 %166
  %173 = icmp eq i64 %167, 0
  br i1 %173, label %162, label %164

174:                                              ; preds = %162
  %175 = getelementptr inbounds i8, i8* %23, i64 %163
  %176 = load i8, i8* %175, align 1, !tbaa !7
  %177 = zext i8 %176 to i32
  %178 = shl nuw i32 %177, 24
  %179 = getelementptr inbounds i8, i8* %175, i64 1
  %180 = load i8, i8* %179, align 1, !tbaa !7
  %181 = zext i8 %180 to i32
  %182 = shl nuw nsw i32 %181, 16
  %183 = or i32 %182, %178
  %184 = getelementptr inbounds i8, i8* %175, i64 2
  %185 = load i8, i8* %184, align 1, !tbaa !7
  %186 = zext i8 %185 to i32
  %187 = shl nuw nsw i32 %186, 8
  %188 = or i32 %183, %187
  %189 = getelementptr inbounds i8, i8* %175, i64 3
  %190 = load i8, i8* %189, align 1, !tbaa !7
  %191 = zext i8 %190 to i32
  %192 = or i32 %188, %191
  %193 = sext i32 %192 to i64
  %194 = sub nsw i64 %0, %193
  br label %195

195:                                              ; preds = %174, %162
  %196 = phi i64 [ %194, %174 ], [ %102, %162 ]
  %197 = icmp slt i64 %196, %156
  br i1 %197, label %198, label %219

198:                                              ; preds = %195
  %199 = load i8, i8* %13, align 1, !tbaa !7
  %200 = zext i8 %199 to i64
  %201 = udiv i64 %163, 6
  br label %245

202:                                              ; preds = %111
  %203 = add i64 %105, -1
  %204 = getelementptr inbounds i8, i8* %13, i64 %203
  %205 = load i8, i8* %204, align 1, !tbaa !7
  %206 = zext i8 %205 to i64
  %207 = mul nuw nsw i64 %206, 6
  %208 = add nuw nsw i64 %207, 4
  %209 = getelementptr inbounds i8, i8* %23, i64 %208
  %210 = load i8, i8* %209, align 1, !tbaa !7
  %211 = getelementptr inbounds i8, i8* %13, i64 %105
  %212 = load i8, i8* %211, align 1, !tbaa !7
  %213 = zext i8 %212 to i64
  %214 = mul nuw nsw i64 %213, 6
  %215 = add nuw nsw i64 %214, 4
  %216 = getelementptr inbounds i8, i8* %23, i64 %215
  %217 = load i8, i8* %216, align 1, !tbaa !7
  %218 = icmp eq i8 %210, %217
  br i1 %218, label %219, label %245

219:                                              ; preds = %195, %202
  %220 = phi i64 [ %105, %202 ], [ 0, %195 ]
  %221 = add i64 %220, 1
  %222 = icmp ult i64 %221, %18
  br i1 %222, label %227, label %223

223:                                              ; preds = %219
  %224 = getelementptr inbounds i8, i8* %13, i64 %220
  %225 = load i8, i8* %224, align 1, !tbaa !7
  %226 = zext i8 %225 to i64
  br label %243

227:                                              ; preds = %219
  %228 = getelementptr inbounds i8, i8* %13, i64 %221
  %229 = load i8, i8* %228, align 1, !tbaa !7
  %230 = zext i8 %229 to i64
  %231 = mul nuw nsw i64 %230, 6
  %232 = add nuw nsw i64 %231, 4
  %233 = getelementptr inbounds i8, i8* %23, i64 %232
  %234 = load i8, i8* %233, align 1, !tbaa !7
  %235 = getelementptr inbounds i8, i8* %13, i64 %220
  %236 = load i8, i8* %235, align 1, !tbaa !7
  %237 = zext i8 %236 to i64
  %238 = mul nuw nsw i64 %237, 6
  %239 = add nuw nsw i64 %238, 4
  %240 = getelementptr inbounds i8, i8* %23, i64 %239
  %241 = load i8, i8* %240, align 1, !tbaa !7
  %242 = icmp eq i8 %234, %241
  br i1 %242, label %243, label %245

243:                                              ; preds = %227, %223
  %244 = phi i64 [ %237, %227 ], [ %226, %223 ]
  br label %245

245:                                              ; preds = %202, %227, %243, %19, %198
  %246 = phi i8* [ %20, %19 ], [ %23, %198 ], [ %23, %243 ], [ %23, %227 ], [ %23, %202 ]
  %247 = phi i64 [ 0, %19 ], [ %200, %198 ], [ %244, %243 ], [ %230, %227 ], [ %206, %202 ]
  %248 = phi i64 [ 0, %19 ], [ %201, %198 ], [ %244, %243 ], [ %237, %227 ], [ %213, %202 ]
  %249 = mul nuw i64 %248, 6
  %250 = add i64 %249, 4
  %251 = getelementptr inbounds i8, i8* %246, i64 %250
  %252 = load i8, i8* %251, align 1, !tbaa !7
  %253 = zext i8 %252 to i32
  store i32 %253, i32* %2, align 4, !tbaa !8
  %254 = getelementptr inbounds i8, i8* %246, i64 %249
  %255 = load i8, i8* %254, align 1, !tbaa !7
  %256 = zext i8 %255 to i32
  %257 = shl nuw i32 %256, 24
  %258 = getelementptr inbounds i8, i8* %254, i64 1
  %259 = load i8, i8* %258, align 1, !tbaa !7
  %260 = zext i8 %259 to i32
  %261 = shl nuw nsw i32 %260, 16
  %262 = or i32 %261, %257
  %263 = getelementptr inbounds i8, i8* %254, i64 2
  %264 = load i8, i8* %263, align 1, !tbaa !7
  %265 = zext i8 %264 to i32
  %266 = shl nuw nsw i32 %265, 8
  %267 = or i32 %262, %266
  %268 = getelementptr inbounds i8, i8* %254, i64 3
  %269 = load i8, i8* %268, align 1, !tbaa !7
  %270 = zext i8 %269 to i32
  %271 = or i32 %267, %270
  %272 = sext i32 %271 to i64
  store i64 %272, i64* %3, align 8, !tbaa !10
  %273 = load i8*, i8** @abbrevs, align 8, !tbaa !3
  %274 = add i64 %249, 5
  %275 = getelementptr inbounds i8, i8* %246, i64 %274
  %276 = load i8, i8* %275, align 1, !tbaa !7
  %277 = zext i8 %276 to i64
  %278 = getelementptr inbounds i8, i8* %273, i64 %277
  store i8* %278, i8** %5, align 8, !tbaa !3
  %279 = icmp eq i64* %4, null
  br i1 %279, label %359, label %280

280:                                              ; preds = %245
  %281 = mul nuw nsw i64 %247, 6
  %282 = getelementptr inbounds i8, i8* %246, i64 %281
  %283 = load i8, i8* %282, align 1, !tbaa !7
  %284 = zext i8 %283 to i32
  %285 = shl nuw i32 %284, 24
  %286 = getelementptr inbounds i8, i8* %282, i64 1
  %287 = load i8, i8* %286, align 1, !tbaa !7
  %288 = zext i8 %287 to i32
  %289 = shl nuw nsw i32 %288, 16
  %290 = or i32 %289, %285
  %291 = getelementptr inbounds i8, i8* %282, i64 2
  %292 = load i8, i8* %291, align 1, !tbaa !7
  %293 = zext i8 %292 to i32
  %294 = shl nuw nsw i32 %293, 8
  %295 = or i32 %290, %294
  %296 = getelementptr inbounds i8, i8* %282, i64 3
  %297 = load i8, i8* %296, align 1, !tbaa !7
  %298 = zext i8 %297 to i32
  %299 = or i32 %295, %298
  %300 = sext i32 %299 to i64
  store i64 %300, i64* %4, align 8, !tbaa !10
  br label %359

301:                                              ; preds = %9, %108, %6
  %302 = load i32, i32* @__daylight, align 4, !tbaa !8
  %303 = icmp eq i32 %302, 0
  br i1 %303, label %304, label %306

304:                                              ; preds = %301
  %305 = load i64, i64* @__timezone, align 8, !tbaa !10
  br label %340

306:                                              ; preds = %301
  %307 = sdiv i64 %0, 31556952
  %308 = add nsw i64 %307, 70
  br label %309

309:                                              ; preds = %309, %306
  %310 = phi i64 [ %308, %306 ], [ %313, %309 ]
  %311 = tail call i64 @__year_to_secs(i64 noundef %310, i32* noundef null) #4
  %312 = icmp sgt i64 %311, %0
  %313 = add nsw i64 %310, -1
  br i1 %312, label %309, label %314

314:                                              ; preds = %309, %314
  %315 = phi i64 [ %316, %314 ], [ %310, %309 ]
  %316 = add nsw i64 %315, 1
  %317 = tail call i64 @__year_to_secs(i64 noundef %316, i32* noundef null) #4
  %318 = icmp slt i64 %317, %0
  br i1 %318, label %314, label %319

319:                                              ; preds = %314
  %320 = trunc i64 %315 to i32
  %321 = tail call fastcc i64 @rule_to_secs(i32* noundef getelementptr inbounds ([5 x i32], [5 x i32]* @r0, i64 0, i64 0), i32 noundef %320) #5
  %322 = tail call fastcc i64 @rule_to_secs(i32* noundef getelementptr inbounds ([5 x i32], [5 x i32]* @r1, i64 0, i64 0), i32 noundef %320) #5
  %323 = icmp eq i32 %1, 0
  %324 = load i64, i64* @__timezone, align 8
  %325 = load i32, i32* @dst_off, align 4
  %326 = select i1 %323, i64 %324, i64 0
  %327 = add nsw i64 %326, %321
  %328 = select i1 %323, i32 %325, i32 0
  %329 = sext i32 %328 to i64
  %330 = add nsw i64 %322, %329
  %331 = icmp slt i64 %327, %330
  br i1 %331, label %332, label %336

332:                                              ; preds = %319
  %333 = icmp sle i64 %327, %0
  %334 = icmp sgt i64 %330, %0
  %335 = select i1 %333, i1 %334, i1 false
  br i1 %335, label %350, label %340

336:                                              ; preds = %319
  %337 = icmp sle i64 %330, %0
  %338 = icmp sgt i64 %327, %0
  %339 = select i1 %337, i1 %338, i1 false
  br i1 %339, label %340, label %350

340:                                              ; preds = %304, %336, %332
  %341 = phi i64 [ %305, %304 ], [ %324, %336 ], [ %324, %332 ]
  store i32 0, i32* %2, align 4, !tbaa !8
  %342 = sub nsw i64 0, %341
  store i64 %342, i64* %3, align 8, !tbaa !10
  %343 = icmp eq i64* %4, null
  br i1 %343, label %348, label %344

344:                                              ; preds = %340
  %345 = load i32, i32* @dst_off, align 4, !tbaa !8
  %346 = sub nsw i32 0, %345
  %347 = sext i32 %346 to i64
  store i64 %347, i64* %4, align 8, !tbaa !10
  br label %348

348:                                              ; preds = %344, %340
  %349 = load i8*, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @__tzname, i64 0, i64 0), align 16, !tbaa !3
  store i8* %349, i8** %5, align 8, !tbaa !3
  br label %359

350:                                              ; preds = %332, %336
  store i32 1, i32* %2, align 4, !tbaa !8
  %351 = sub nsw i32 0, %325
  %352 = sext i32 %351 to i64
  store i64 %352, i64* %3, align 8, !tbaa !10
  %353 = icmp eq i64* %4, null
  br i1 %353, label %357, label %354

354:                                              ; preds = %350
  %355 = load i64, i64* @__timezone, align 8, !tbaa !10
  %356 = sub nsw i64 0, %355
  store i64 %356, i64* %4, align 8, !tbaa !10
  br label %357

357:                                              ; preds = %354, %350
  %358 = load i8*, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @__tzname, i64 0, i64 1), align 8, !tbaa !3
  store i8* %358, i8** %5, align 8, !tbaa !3
  br label %359

359:                                              ; preds = %280, %245, %357, %348
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #4
  ret void
}

; Function Attrs: optsize
declare hidden void @__lock(i32* noundef) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: optsize
declare hidden void @__unlock(i32* noundef) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: optsize
declare hidden i64 @__year_to_secs(i64 noundef, i32* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define internal fastcc i64 @rule_to_secs(i32* nocapture noundef readonly %0, i32 noundef %1) unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #6
  %5 = sext i32 %1 to i64
  %6 = call i64 @__year_to_secs(i64 noundef %5, i32* noundef nonnull %3) #4
  %7 = load i32, i32* %0, align 4, !tbaa !8
  %8 = getelementptr inbounds i32, i32* %0, i64 1
  %9 = load i32, i32* %8, align 4, !tbaa !8
  switch i32 %7, label %52 [
    i32 77, label %17
    i32 74, label %10
  ]

10:                                               ; preds = %2
  %11 = icmp slt i32 %9, 60
  %12 = load i32, i32* %3, align 4
  %13 = icmp eq i32 %12, 0
  %14 = select i1 %11, i1 true, i1 %13
  %15 = sext i1 %14 to i32
  %16 = add nsw i32 %9, %15
  br label %52

17:                                               ; preds = %2
  %18 = getelementptr inbounds i32, i32* %0, i64 2
  %19 = load i32, i32* %18, align 4, !tbaa !8
  %20 = getelementptr inbounds i32, i32* %0, i64 3
  %21 = load i32, i32* %20, align 4, !tbaa !8
  %22 = add nsw i32 %9, -1
  %23 = load i32, i32* %3, align 4, !tbaa !8
  %24 = call i32 @__month_to_secs(i32 noundef %22, i32 noundef %23) #4
  %25 = sext i32 %24 to i64
  %26 = add nsw i64 %6, %25
  %27 = add nsw i64 %26, 345600
  %28 = srem i64 %27, 604800
  %29 = trunc i64 %28 to i32
  %30 = sdiv i32 %29, -86400
  %31 = add i32 %30, %21
  %32 = icmp slt i32 %31, 0
  %33 = add nsw i32 %31, 7
  %34 = select i1 %32, i32 %33, i32 %31
  %35 = icmp eq i32 %19, 5
  br i1 %35, label %36, label %47

36:                                               ; preds = %17
  %37 = add nsw i32 %34, 28
  %38 = load i32, i32* %3, align 4, !tbaa !8
  %39 = icmp eq i32 %9, 2
  %40 = add nsw i32 %38, 28
  %41 = lshr i32 2773, %22
  %42 = and i32 %41, 1
  %43 = or i32 %42, 30
  %44 = select i1 %39, i32 %40, i32 %43
  %45 = icmp slt i32 %37, %44
  %46 = select i1 %45, i32 5, i32 4
  br label %47

47:                                               ; preds = %36, %17
  %48 = phi i32 [ %19, %17 ], [ %46, %36 ]
  %49 = mul i32 %48, 7
  %50 = add nsw i32 %34, -7
  %51 = add i32 %50, %49
  br label %52

52:                                               ; preds = %10, %2, %47
  %53 = phi i32 [ %51, %47 ], [ %16, %10 ], [ %9, %2 ]
  %54 = phi i64 [ %26, %47 ], [ %6, %10 ], [ %6, %2 ]
  %55 = mul nsw i32 %53, 86400
  %56 = sext i32 %55 to i64
  %57 = add nsw i64 %54, %56
  %58 = getelementptr inbounds i32, i32* %0, i64 4
  %59 = load i32, i32* %58, align 4, !tbaa !8
  %60 = sext i32 %59 to i64
  %61 = add nsw i64 %57, %60
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #6
  ret i64 %61
}

; Function Attrs: nounwind optsize strictfp
define internal void @__tzset() #0 {
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #4
  tail call fastcc void @do_tzset() #5
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #4
  ret void
}

; Function Attrs: nounwind optsize strictfp
define hidden i8* @__tm_to_tzname(%struct.tm* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.tm, %struct.tm* %0, i64 0, i32 10
  %3 = load i8*, i8** %2, align 8, !tbaa !12
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #4
  tail call fastcc void @do_tzset() #5
  %4 = icmp eq i8* %3, getelementptr inbounds ([4 x i8], [4 x i8]* @__utc, i64 0, i64 0)
  br i1 %4, label %24, label %5

5:                                                ; preds = %1
  %6 = load i8*, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @__tzname, i64 0, i64 0), align 16, !tbaa !3
  %7 = icmp eq i8* %3, %6
  %8 = load i8*, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @__tzname, i64 0, i64 1), align 8
  %9 = icmp eq i8* %3, %8
  %10 = select i1 %7, i1 true, i1 %9
  br i1 %10, label %24, label %11

11:                                               ; preds = %5
  %12 = load i8*, i8** @zi, align 8, !tbaa !3
  %13 = icmp eq i8* %12, null
  br i1 %13, label %23, label %14

14:                                               ; preds = %11
  %15 = ptrtoint i8* %3 to i64
  %16 = load i8*, i8** @abbrevs, align 8, !tbaa !3
  %17 = ptrtoint i8* %16 to i64
  %18 = sub i64 %15, %17
  %19 = load i8*, i8** @abbrevs_end, align 8, !tbaa !3
  %20 = ptrtoint i8* %19 to i64
  %21 = sub i64 %20, %17
  %22 = icmp ult i64 %18, %21
  br i1 %22, label %24, label %23

23:                                               ; preds = %14, %11
  br label %24

24:                                               ; preds = %23, %14, %5, %1
  %25 = phi i8* [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i64 0, i64 0), %23 ], [ %3, %14 ], [ %3, %5 ], [ getelementptr inbounds ([4 x i8], [4 x i8]* @__utc, i64 0, i64 0), %1 ]
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #4
  ret i8* %25
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @do_tzset() unnamed_addr #0 {
  %1 = alloca [280 x i8], align 16
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca [7 x i8], align 1
  %5 = alloca [6 x i8], align 1
  %6 = getelementptr inbounds [280 x i8], [280 x i8]* %1, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 280, i8* nonnull %6) #6
  %7 = getelementptr inbounds [280 x i8], [280 x i8]* %1, i64 0, i64 24
  %8 = bitcast i8** %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %8) #6
  %9 = bitcast i8** %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %9) #6
  %10 = tail call i8* @getenv(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0)) #4
  %11 = icmp eq i8* %10, null
  %12 = select i1 %11, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* %10
  store i8* %12, i8** %2, align 8
  %13 = load i8, i8* %12, align 1, !tbaa !7
  %14 = icmp eq i8 %13, 0
  %15 = select i1 %14, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @__utc, i64 0, i64 0), i8* %12
  store i8* %15, i8** %2, align 8
  %16 = load i8*, i8** @old_tz, align 8, !tbaa !3
  %17 = icmp eq i8* %16, null
  br i1 %17, label %21, label %18

18:                                               ; preds = %0
  %19 = tail call i32 @strcmp(i8* noundef %15, i8* noundef nonnull %16) #4
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %409, label %21

21:                                               ; preds = %18, %0
  br label %22

22:                                               ; preds = %21, %22
  %23 = phi i64 [ %26, %22 ], [ 0, %21 ]
  %24 = getelementptr inbounds [5 x i32], [5 x i32]* @r1, i64 0, i64 %23
  store i32 0, i32* %24, align 4, !tbaa !8
  %25 = getelementptr inbounds [5 x i32], [5 x i32]* @r0, i64 0, i64 %23
  store i32 0, i32* %25, align 4, !tbaa !8
  %26 = add nuw nsw i64 %23, 1
  %27 = icmp eq i64 %26, 5
  br i1 %27, label %28, label %22

28:                                               ; preds = %22
  %29 = load i8*, i8** @zi, align 8, !tbaa !3
  %30 = icmp eq i8* %29, null
  br i1 %30, label %34, label %31

31:                                               ; preds = %28
  %32 = load i64, i64* @map_size, align 8, !tbaa !10
  %33 = tail call i32 @__munmap(i8* noundef nonnull %29, i64 noundef %32) #4
  br label %34

34:                                               ; preds = %31, %28
  %35 = tail call i64 @strlen(i8* noundef %15) #4
  %36 = icmp ugt i64 %35, 4097
  br i1 %36, label %37, label %38

37:                                               ; preds = %34
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @__utc, i64 0, i64 0), i8** %2, align 8, !tbaa !3
  br label %38

38:                                               ; preds = %37, %34
  %39 = phi i8* [ getelementptr inbounds ([4 x i8], [4 x i8]* @__utc, i64 0, i64 0), %37 ], [ %15, %34 ]
  %40 = phi i64 [ 3, %37 ], [ %35, %34 ]
  %41 = load i64, i64* @old_tz_size, align 8, !tbaa !10
  %42 = icmp ult i64 %40, %41
  br i1 %42, label %51, label %43

43:                                               ; preds = %38
  %44 = shl i64 %41, 1
  %45 = icmp ult i64 %40, %44
  %46 = add nuw nsw i64 %40, 1
  %47 = select i1 %45, i64 %44, i64 %46
  %48 = icmp ult i64 %47, 4098
  %49 = select i1 %48, i64 %47, i64 4098
  store i64 %49, i64* @old_tz_size, align 8, !tbaa !10
  %50 = tail call i8* @__libc_malloc(i64 noundef %49) #4
  store i8* %50, i8** @old_tz, align 8, !tbaa !3
  br label %53

51:                                               ; preds = %38
  %52 = load i8*, i8** @old_tz, align 8, !tbaa !3
  br label %53

53:                                               ; preds = %51, %43
  %54 = phi i8* [ %52, %51 ], [ %50, %43 ]
  %55 = icmp eq i8* %54, null
  br i1 %55, label %59, label %56

56:                                               ; preds = %53
  %57 = add nuw nsw i64 %40, 1
  %58 = tail call i8* @memcpy(i8* noundef nonnull %54, i8* noundef %39, i64 noundef %57) #4
  br label %59

59:                                               ; preds = %56, %53
  %60 = load i8, i8* %39, align 1, !tbaa !7
  %61 = icmp eq i8 %60, 58
  br i1 %61, label %86, label %62

62:                                               ; preds = %59
  store i8* %39, i8** %3, align 8, !tbaa !3
  %63 = getelementptr inbounds [7 x i8], [7 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 7, i8* nonnull %63) #6
  call fastcc void @getname(i8* noundef nonnull %63, i8** noundef nonnull %3) #5
  %64 = load i8*, i8** %3, align 8, !tbaa !3
  %65 = load i8*, i8** %2, align 8, !tbaa !3
  %66 = icmp eq i8* %64, %65
  br i1 %66, label %82, label %67

67:                                               ; preds = %62
  %68 = load i8, i8* %64, align 1, !tbaa !7
  switch i8 %68, label %69 [
    i8 43, label %81
    i8 45, label %81
  ]

69:                                               ; preds = %67
  %70 = sext i8 %68 to i32
  %71 = add nsw i32 %70, -48
  %72 = icmp ult i32 %71, 10
  br i1 %72, label %81, label %73

73:                                               ; preds = %69
  %74 = call i32 @strcmp(i8* noundef nonnull %63, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @__utc, i64 0, i64 0)) #4
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %81, label %76

76:                                               ; preds = %73
  %77 = call i32 @strcmp(i8* noundef nonnull %63, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0)) #4
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %81, label %79

79:                                               ; preds = %76
  %80 = load i8*, i8** %2, align 8, !tbaa !3
  br label %82

81:                                               ; preds = %69, %73, %76, %67, %67
  call void @llvm.lifetime.end.p0i8(i64 7, i8* nonnull %63) #6
  br label %145

82:                                               ; preds = %62, %79
  %83 = phi i8* [ %80, %79 ], [ %64, %62 ]
  call void @llvm.lifetime.end.p0i8(i64 7, i8* nonnull %63) #6
  %84 = load i8, i8* %83, align 1, !tbaa !7
  %85 = icmp eq i8 %84, 58
  br i1 %85, label %86, label %90

86:                                               ; preds = %59, %82
  %87 = phi i8* [ %83, %82 ], [ %39, %59 ]
  %88 = getelementptr inbounds i8, i8* %87, i64 1
  store i8* %88, i8** %2, align 8, !tbaa !3
  %89 = load i8, i8* %88, align 1, !tbaa !7
  br label %90

90:                                               ; preds = %86, %82
  %91 = phi i8 [ %89, %86 ], [ %84, %82 ]
  %92 = phi i8* [ %88, %86 ], [ %83, %82 ]
  %93 = and i8 %91, -2
  %94 = icmp eq i8 %93, 46
  br i1 %94, label %95, label %103

95:                                               ; preds = %90
  %96 = load i8, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 2), align 2, !tbaa !14
  %97 = icmp eq i8 %96, 0
  br i1 %97, label %128, label %98

98:                                               ; preds = %95
  %99 = call i32 @strcmp(i8* noundef nonnull %92, i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0)) #4
  %100 = icmp eq i32 %99, 0
  br i1 %100, label %101, label %132

101:                                              ; preds = %98
  %102 = load i8*, i8** %2, align 8, !tbaa !3
  br label %128

103:                                              ; preds = %90
  %104 = call i64 @strlen(i8* noundef nonnull %92) #4
  %105 = icmp ult i64 %104, 256
  br i1 %105, label %106, label %132

106:                                              ; preds = %103
  %107 = load i8*, i8** %2, align 8, !tbaa !3
  %108 = call i8* @strchr(i8* noundef %107, i32 noundef 46) #4
  %109 = icmp eq i8* %108, null
  br i1 %109, label %110, label %132

110:                                              ; preds = %106
  %111 = load i8*, i8** %2, align 8, !tbaa !3
  %112 = add nuw nsw i64 %104, 1
  %113 = call i8* @memcpy(i8* noundef nonnull %7, i8* noundef %111, i64 noundef %112) #4
  %114 = getelementptr inbounds i8, i8* %7, i64 %104
  store i8 0, i8* %114, align 1, !tbaa !7
  br label %115

115:                                              ; preds = %110, %119
  %116 = phi i8* [ getelementptr inbounds ([54 x i8], [54 x i8]* @do_tzset.search, i64 0, i64 0), %110 ], [ %126, %119 ]
  %117 = load i8, i8* %116, align 1, !tbaa !7
  %118 = icmp eq i8 %117, 0
  br i1 %118, label %132, label %119

119:                                              ; preds = %115
  %120 = call i64 @strlen(i8* noundef nonnull %116) #4
  %121 = sub i64 0, %120
  %122 = getelementptr inbounds i8, i8* %7, i64 %121
  %123 = call i8* @memcpy(i8* noundef nonnull %122, i8* noundef nonnull %116, i64 noundef %120) #4
  %124 = call i8* @__map_file(i8* noundef nonnull %122, i64* noundef nonnull @map_size) #4
  %125 = add i64 %120, 1
  %126 = getelementptr inbounds i8, i8* %116, i64 %125
  %127 = icmp eq i8* %124, null
  br i1 %127, label %115, label %133

128:                                              ; preds = %101, %95
  %129 = phi i8* [ %102, %101 ], [ %92, %95 ]
  %130 = call i8* @__map_file(i8* noundef %129, i64* noundef nonnull @map_size) #4
  %131 = icmp eq i8* %130, null
  br i1 %131, label %132, label %133

132:                                              ; preds = %115, %103, %106, %98, %128
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @__utc, i64 0, i64 0), i8** %2, align 8, !tbaa !3
  br label %145

133:                                              ; preds = %119, %128
  %134 = phi i8* [ %130, %128 ], [ %124, %119 ]
  %135 = load i64, i64* @map_size, align 8, !tbaa !10
  %136 = icmp ult i64 %135, 44
  br i1 %136, label %142, label %137

137:                                              ; preds = %133
  %138 = call i32 @memcmp(i8* noundef nonnull %134, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0), i64 noundef 4) #4
  %139 = icmp eq i32 %138, 0
  br i1 %139, label %146, label %140

140:                                              ; preds = %137
  %141 = load i64, i64* @map_size, align 8, !tbaa !10
  br label %142

142:                                              ; preds = %140, %133
  %143 = phi i64 [ %141, %140 ], [ %135, %133 ]
  %144 = call i32 @__munmap(i8* noundef nonnull %134, i64 noundef %143) #4
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @__utc, i64 0, i64 0), i8** %2, align 8, !tbaa !3
  br label %145

145:                                              ; preds = %142, %81, %132
  store i8* null, i8** @zi, align 8, !tbaa !3
  br label %372

146:                                              ; preds = %137
  store i8* %134, i8** @zi, align 8, !tbaa !3
  %147 = getelementptr inbounds i8, i8* %134, i64 4
  %148 = load i8, i8* %147, align 1, !tbaa !7
  %149 = icmp eq i8 %148, 49
  br i1 %149, label %194, label %150

150:                                              ; preds = %146
  %151 = getelementptr inbounds i8, i8* %134, i64 20
  %152 = getelementptr inbounds [6 x i8], [6 x i8]* %5, i64 0, i64 0
  store i8 1, i8* %152, align 1, !tbaa !7
  %153 = getelementptr inbounds [6 x i8], [6 x i8]* %5, i64 0, i64 1
  store i8 1, i8* %153, align 1, !tbaa !7
  %154 = getelementptr inbounds [6 x i8], [6 x i8]* %5, i64 0, i64 2
  store i8 8, i8* %154, align 1, !tbaa !7
  %155 = getelementptr inbounds [6 x i8], [6 x i8]* %5, i64 0, i64 3
  store i8 5, i8* %155, align 1, !tbaa !7
  %156 = getelementptr inbounds [6 x i8], [6 x i8]* %5, i64 0, i64 4
  store i8 6, i8* %156, align 1, !tbaa !7
  %157 = getelementptr inbounds [6 x i8], [6 x i8]* %5, i64 0, i64 5
  store i8 1, i8* %157, align 1, !tbaa !7
  br label %158

158:                                              ; preds = %188, %150
  %159 = phi i8 [ 1, %150 ], [ %190, %188 ]
  %160 = phi i8* [ %151, %150 ], [ %189, %188 ]
  %161 = phi i64 [ 0, %150 ], [ %184, %188 ]
  %162 = phi i64 [ 6, %150 ], [ %185, %188 ]
  %163 = phi i8* [ %152, %150 ], [ %186, %188 ]
  %164 = load i8, i8* %160, align 1, !tbaa !7
  %165 = zext i8 %164 to i64
  %166 = shl nuw nsw i64 %165, 24
  %167 = getelementptr inbounds i8, i8* %160, i64 1
  %168 = load i8, i8* %167, align 1, !tbaa !7
  %169 = zext i8 %168 to i64
  %170 = shl nuw nsw i64 %169, 16
  %171 = or i64 %170, %166
  %172 = getelementptr inbounds i8, i8* %160, i64 2
  %173 = load i8, i8* %172, align 1, !tbaa !7
  %174 = zext i8 %173 to i64
  %175 = shl nuw nsw i64 %174, 8
  %176 = or i64 %171, %175
  %177 = getelementptr inbounds i8, i8* %160, i64 3
  %178 = load i8, i8* %177, align 1, !tbaa !7
  %179 = zext i8 %178 to i64
  %180 = or i64 %176, %179
  %181 = zext i8 %159 to i64
  %182 = mul nuw nsw i64 %180, %181
  %183 = and i64 %182, 4294967295
  %184 = add i64 %183, %161
  %185 = add nsw i64 %162, -1
  %186 = getelementptr inbounds i8, i8* %163, i64 1
  %187 = icmp eq i64 %185, 0
  br i1 %187, label %191, label %188

188:                                              ; preds = %158
  %189 = getelementptr inbounds i8, i8* %160, i64 4
  %190 = load i8, i8* %186, align 1, !tbaa !7
  br label %158

191:                                              ; preds = %158
  %192 = getelementptr inbounds i8, i8* %134, i64 %184
  %193 = getelementptr inbounds i8, i8* %192, i64 44
  br label %194

194:                                              ; preds = %146, %191
  %195 = phi i8* [ %193, %191 ], [ %134, %146 ]
  %196 = phi i32 [ 3, %191 ], [ 2, %146 ]
  %197 = getelementptr inbounds i8, i8* %195, i64 44
  store i8* %197, i8** @trans, align 8, !tbaa !3
  %198 = getelementptr inbounds i8, i8* %195, i64 32
  %199 = load i8, i8* %198, align 1, !tbaa !7
  %200 = zext i8 %199 to i32
  %201 = shl nuw i32 %200, 24
  %202 = getelementptr inbounds i8, i8* %195, i64 33
  %203 = load i8, i8* %202, align 1, !tbaa !7
  %204 = zext i8 %203 to i32
  %205 = shl nuw nsw i32 %204, 16
  %206 = or i32 %205, %201
  %207 = getelementptr inbounds i8, i8* %195, i64 34
  %208 = load i8, i8* %207, align 1, !tbaa !7
  %209 = zext i8 %208 to i32
  %210 = shl nuw nsw i32 %209, 8
  %211 = or i32 %206, %210
  %212 = getelementptr inbounds i8, i8* %195, i64 35
  %213 = load i8, i8* %212, align 1, !tbaa !7
  %214 = zext i8 %213 to i32
  %215 = or i32 %211, %214
  %216 = shl i32 %215, %196
  %217 = zext i32 %216 to i64
  %218 = getelementptr inbounds i8, i8* %197, i64 %217
  store i8* %218, i8** @index, align 8, !tbaa !3
  %219 = zext i8 %199 to i64
  %220 = shl nuw nsw i64 %219, 24
  %221 = zext i8 %203 to i64
  %222 = shl nuw nsw i64 %221, 16
  %223 = or i64 %222, %220
  %224 = zext i8 %208 to i64
  %225 = shl nuw nsw i64 %224, 8
  %226 = or i64 %223, %225
  %227 = zext i8 %213 to i64
  %228 = or i64 %226, %227
  %229 = getelementptr inbounds i8, i8* %218, i64 %228
  store i8* %229, i8** @types, align 8, !tbaa !3
  %230 = getelementptr inbounds i8, i8* %195, i64 36
  %231 = load i8, i8* %230, align 1, !tbaa !7
  %232 = zext i8 %231 to i64
  %233 = shl nuw nsw i64 %232, 24
  %234 = getelementptr inbounds i8, i8* %195, i64 37
  %235 = load i8, i8* %234, align 1, !tbaa !7
  %236 = zext i8 %235 to i64
  %237 = shl nuw nsw i64 %236, 16
  %238 = or i64 %237, %233
  %239 = getelementptr inbounds i8, i8* %195, i64 38
  %240 = load i8, i8* %239, align 1, !tbaa !7
  %241 = zext i8 %240 to i64
  %242 = shl nuw nsw i64 %241, 8
  %243 = or i64 %238, %242
  %244 = getelementptr inbounds i8, i8* %195, i64 39
  %245 = load i8, i8* %244, align 1, !tbaa !7
  %246 = zext i8 %245 to i64
  %247 = or i64 %243, %246
  %248 = mul nuw nsw i64 %247, 6
  %249 = and i64 %248, 4294967294
  %250 = getelementptr inbounds i8, i8* %229, i64 %249
  store i8* %250, i8** @abbrevs, align 8, !tbaa !3
  %251 = getelementptr inbounds i8, i8* %195, i64 40
  %252 = load i8, i8* %251, align 1, !tbaa !7
  %253 = zext i8 %252 to i64
  %254 = shl nuw nsw i64 %253, 24
  %255 = getelementptr inbounds i8, i8* %195, i64 41
  %256 = load i8, i8* %255, align 1, !tbaa !7
  %257 = zext i8 %256 to i64
  %258 = shl nuw nsw i64 %257, 16
  %259 = or i64 %258, %254
  %260 = getelementptr inbounds i8, i8* %195, i64 42
  %261 = load i8, i8* %260, align 1, !tbaa !7
  %262 = zext i8 %261 to i64
  %263 = shl nuw nsw i64 %262, 8
  %264 = or i64 %259, %263
  %265 = getelementptr inbounds i8, i8* %195, i64 43
  %266 = load i8, i8* %265, align 1, !tbaa !7
  %267 = zext i8 %266 to i64
  %268 = or i64 %264, %267
  %269 = getelementptr inbounds i8, i8* %250, i64 %268
  store i8* %269, i8** @abbrevs_end, align 8, !tbaa !3
  %270 = load i64, i64* @map_size, align 8, !tbaa !10
  %271 = add i64 %270, -1
  %272 = getelementptr inbounds i8, i8* %134, i64 %271
  %273 = load i8, i8* %272, align 1, !tbaa !7
  %274 = icmp eq i8 %273, 10
  br i1 %274, label %275, label %285

275:                                              ; preds = %194
  %276 = getelementptr inbounds i8, i8* %134, i64 %270
  %277 = getelementptr inbounds i8, i8* %276, i64 -2
  br label %278

278:                                              ; preds = %278, %275
  %279 = phi i8* [ %277, %275 ], [ %282, %278 ]
  store i8* %279, i8** %2, align 8, !tbaa !3
  %280 = load i8, i8* %279, align 1, !tbaa !7
  %281 = icmp eq i8 %280, 10
  %282 = getelementptr inbounds i8, i8* %279, i64 -1
  br i1 %281, label %283, label %278

283:                                              ; preds = %278
  %284 = getelementptr inbounds i8, i8* %279, i64 1
  store i8* %284, i8** %2, align 8, !tbaa !3
  br label %371

285:                                              ; preds = %194
  store <2 x i8*> zeroinitializer, <2 x i8*>* bitcast ([2 x i8*]* @__tzname to <2 x i8*>*), align 16, !tbaa !3
  store i32 0, i32* @dst_off, align 4, !tbaa !8
  store i64 0, i64* @__timezone, align 8, !tbaa !10
  store i32 0, i32* @__daylight, align 4, !tbaa !8
  %286 = icmp eq i64 %249, 0
  br i1 %286, label %358, label %287

287:                                              ; preds = %285, %351
  %288 = phi i64 [ %323, %351 ], [ 0, %285 ]
  %289 = phi i32 [ %352, %351 ], [ 0, %285 ]
  %290 = phi i8* [ %353, %351 ], [ null, %285 ]
  %291 = phi i8* [ %325, %351 ], [ null, %285 ]
  %292 = phi i8* [ %354, %351 ], [ %229, %285 ]
  %293 = getelementptr inbounds i8, i8* %292, i64 4
  %294 = load i8, i8* %293, align 1, !tbaa !7
  %295 = icmp ne i8 %294, 0
  %296 = icmp ne i8* %291, null
  %297 = select i1 %295, i1 true, i1 %296
  br i1 %297, label %322, label %298

298:                                              ; preds = %287
  %299 = getelementptr inbounds i8, i8* %292, i64 5
  %300 = load i8, i8* %299, align 1, !tbaa !7
  %301 = zext i8 %300 to i64
  %302 = getelementptr inbounds i8, i8* %250, i64 %301
  store i8* %302, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @__tzname, i64 0, i64 0), align 16, !tbaa !3
  %303 = load i8, i8* %292, align 1, !tbaa !7
  %304 = zext i8 %303 to i64
  %305 = mul nuw nsw i64 %304, 4278190080
  %306 = getelementptr inbounds i8, i8* %292, i64 1
  %307 = load i8, i8* %306, align 1, !tbaa !7
  %308 = zext i8 %307 to i64
  %309 = mul nuw nsw i64 %308, 4294901760
  %310 = add nuw nsw i64 %309, %305
  %311 = getelementptr inbounds i8, i8* %292, i64 2
  %312 = load i8, i8* %311, align 1, !tbaa !7
  %313 = zext i8 %312 to i64
  %314 = mul nuw nsw i64 %313, 4294967040
  %315 = add nuw nsw i64 %310, %314
  %316 = getelementptr inbounds i8, i8* %292, i64 3
  %317 = load i8, i8* %316, align 1, !tbaa !7
  %318 = zext i8 %317 to i64
  %319 = sub nsw i64 %315, %318
  %320 = and i64 %319, 4294967295
  store i64 %320, i64* @__timezone, align 8, !tbaa !10
  %321 = load i8, i8* %293, align 1, !tbaa !7
  br label %322

322:                                              ; preds = %298, %287
  %323 = phi i64 [ %320, %298 ], [ %288, %287 ]
  %324 = phi i8 [ %321, %298 ], [ %294, %287 ]
  %325 = phi i8* [ %302, %298 ], [ %291, %287 ]
  %326 = icmp eq i8 %324, 0
  %327 = icmp ne i8* %290, null
  %328 = select i1 %326, i1 true, i1 %327
  br i1 %328, label %351, label %329

329:                                              ; preds = %322
  %330 = getelementptr inbounds i8, i8* %292, i64 5
  %331 = load i8, i8* %330, align 1, !tbaa !7
  %332 = zext i8 %331 to i64
  %333 = getelementptr inbounds i8, i8* %250, i64 %332
  store i8* %333, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @__tzname, i64 0, i64 1), align 8, !tbaa !3
  %334 = load i8, i8* %292, align 1, !tbaa !7
  %335 = zext i8 %334 to i32
  %336 = mul i32 %335, -16777216
  %337 = getelementptr inbounds i8, i8* %292, i64 1
  %338 = load i8, i8* %337, align 1, !tbaa !7
  %339 = zext i8 %338 to i32
  %340 = mul nsw i32 %339, -65536
  %341 = add i32 %340, %336
  %342 = getelementptr inbounds i8, i8* %292, i64 2
  %343 = load i8, i8* %342, align 1, !tbaa !7
  %344 = zext i8 %343 to i32
  %345 = mul nsw i32 %344, -256
  %346 = add i32 %341, %345
  %347 = getelementptr inbounds i8, i8* %292, i64 3
  %348 = load i8, i8* %347, align 1, !tbaa !7
  %349 = zext i8 %348 to i32
  %350 = sub i32 %346, %349
  store i32 %350, i32* @dst_off, align 4, !tbaa !8
  store i32 1, i32* @__daylight, align 4, !tbaa !8
  br label %351

351:                                              ; preds = %322, %329
  %352 = phi i32 [ %289, %322 ], [ 1, %329 ]
  %353 = phi i8* [ %290, %322 ], [ %333, %329 ]
  %354 = getelementptr inbounds i8, i8* %292, i64 6
  %355 = icmp ult i8* %354, %250
  br i1 %355, label %287, label %356

356:                                              ; preds = %351
  %357 = icmp eq i8* %325, null
  br i1 %357, label %358, label %364

358:                                              ; preds = %285, %356
  %359 = phi i8* [ %353, %356 ], [ null, %285 ]
  %360 = phi i32 [ %352, %356 ], [ 0, %285 ]
  %361 = phi i64 [ %323, %356 ], [ 0, %285 ]
  %362 = icmp eq i8* %359, null
  %363 = select i1 %362, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @__utc, i64 0, i64 0), i8* %359
  store i8* %363, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @__tzname, i64 0, i64 0), align 16
  br label %364

364:                                              ; preds = %358, %356
  %365 = phi i32 [ %360, %358 ], [ %352, %356 ]
  %366 = phi i64 [ %361, %358 ], [ %323, %356 ]
  %367 = phi i8* [ %363, %358 ], [ %325, %356 ]
  %368 = icmp eq i32 %365, 0
  br i1 %368, label %369, label %371

369:                                              ; preds = %364
  store i8* %367, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @__tzname, i64 0, i64 1), align 8, !tbaa !3
  %370 = trunc i64 %366 to i32
  store i32 %370, i32* @dst_off, align 4, !tbaa !8
  br label %371

371:                                              ; preds = %364, %369, %283
  br i1 %274, label %372, label %409

372:                                              ; preds = %145, %371
  %373 = load i8*, i8** %2, align 8, !tbaa !3
  %374 = icmp eq i8* %373, null
  br i1 %374, label %375, label %376

375:                                              ; preds = %372
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @__utc, i64 0, i64 0), i8** %2, align 8, !tbaa !3
  br label %376

376:                                              ; preds = %375, %372
  call fastcc void @getname(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @std_name, i64 0, i64 0), i8** noundef nonnull %2) #5
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @std_name, i64 0, i64 0), i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @__tzname, i64 0, i64 0), align 16, !tbaa !3
  %377 = call fastcc i32 @getoff(i8** noundef nonnull %2) #5
  %378 = sext i32 %377 to i64
  store i64 %378, i64* @__timezone, align 8, !tbaa !10
  call fastcc void @getname(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @dst_name, i64 0, i64 0), i8** noundef nonnull %2) #5
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @dst_name, i64 0, i64 0), i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @__tzname, i64 0, i64 1), align 8, !tbaa !3
  %379 = load i8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @dst_name, i64 0, i64 0), align 1, !tbaa !7
  %380 = icmp eq i8 %379, 0
  br i1 %380, label %394, label %381

381:                                              ; preds = %376
  store i32 1, i32* @__daylight, align 4, !tbaa !8
  %382 = load i8*, i8** %2, align 8, !tbaa !3
  %383 = load i8, i8* %382, align 1, !tbaa !7
  switch i8 %383, label %384 [
    i8 43, label %388
    i8 45, label %388
  ]

384:                                              ; preds = %381
  %385 = sext i8 %383 to i32
  %386 = add nsw i32 %385, -48
  %387 = icmp ult i32 %386, 10
  br i1 %387, label %388, label %390

388:                                              ; preds = %381, %381, %384
  %389 = call fastcc i32 @getoff(i8** noundef nonnull %2) #5
  br label %397

390:                                              ; preds = %384
  %391 = load i64, i64* @__timezone, align 8, !tbaa !10
  %392 = trunc i64 %391 to i32
  %393 = add i32 %392, -3600
  br label %397

394:                                              ; preds = %376
  store i32 0, i32* @__daylight, align 4, !tbaa !8
  %395 = load i64, i64* @__timezone, align 8, !tbaa !10
  %396 = trunc i64 %395 to i32
  br label %397

397:                                              ; preds = %388, %390, %394
  %398 = phi i32 [ %389, %388 ], [ %393, %390 ], [ %396, %394 ]
  store i32 %398, i32* @dst_off, align 4, !tbaa !8
  %399 = load i8*, i8** %2, align 8, !tbaa !3
  %400 = load i8, i8* %399, align 1, !tbaa !7
  %401 = icmp eq i8 %400, 44
  br i1 %401, label %402, label %409

402:                                              ; preds = %397
  %403 = getelementptr inbounds i8, i8* %399, i64 1
  store i8* %403, i8** %2, align 8, !tbaa !3
  call fastcc void @getrule(i8** noundef nonnull %2, i32* noundef getelementptr inbounds ([5 x i32], [5 x i32]* @r0, i64 0, i64 0)) #5
  %404 = load i8*, i8** %2, align 8, !tbaa !3
  %405 = load i8, i8* %404, align 1, !tbaa !7
  %406 = icmp eq i8 %405, 44
  br i1 %406, label %407, label %409

407:                                              ; preds = %402
  %408 = getelementptr inbounds i8, i8* %404, i64 1
  store i8* %408, i8** %2, align 8, !tbaa !3
  call fastcc void @getrule(i8** noundef nonnull %2, i32* noundef getelementptr inbounds ([5 x i32], [5 x i32]* @r1, i64 0, i64 0)) #5
  br label %409

409:                                              ; preds = %397, %371, %407, %402, %18
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %9) #6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %8) #6
  call void @llvm.lifetime.end.p0i8(i64 280, i8* nonnull %6) #6
  ret void
}

; Function Attrs: optsize
declare i8* @getenv(i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @strcmp(i8* noundef, i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i32 @__munmap(i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i8* @__libc_malloc(i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: nofree norecurse nosync nounwind optsize strictfp
define internal fastcc void @getname(i8* nocapture noundef writeonly %0, i8** nocapture noundef %1) unnamed_addr #3 {
  %3 = load i8*, i8** %1, align 8, !tbaa !3
  %4 = load i8, i8* %3, align 1, !tbaa !7
  %5 = icmp eq i8 %4, 60
  br i1 %5, label %11, label %6

6:                                                ; preds = %2
  %7 = or i8 %4, 32
  %8 = sext i8 %7 to i32
  %9 = add nsw i32 %8, -97
  %10 = icmp ult i32 %9, 26
  br i1 %10, label %30, label %54

11:                                               ; preds = %2
  %12 = getelementptr inbounds i8, i8* %3, i64 1
  store i8* %12, i8** %1, align 8, !tbaa !3
  br label %13

13:                                               ; preds = %24, %11
  %14 = phi i8* [ %25, %24 ], [ %12, %11 ]
  %15 = phi i8* [ %26, %24 ], [ %12, %11 ]
  %16 = phi i64 [ %27, %24 ], [ 0, %11 ]
  %17 = getelementptr inbounds i8, i8* %15, i64 %16
  %18 = load i8, i8* %17, align 1, !tbaa !7
  switch i8 %18, label %19 [
    i8 0, label %47
    i8 62, label %28
  ]

19:                                               ; preds = %13
  %20 = icmp ult i64 %16, 6
  br i1 %20, label %21, label %24

21:                                               ; preds = %19
  %22 = getelementptr inbounds i8, i8* %0, i64 %16
  store i8 %18, i8* %22, align 1, !tbaa !7
  %23 = load i8*, i8** %1, align 8, !tbaa !3
  br label %24

24:                                               ; preds = %19, %21
  %25 = phi i8* [ %14, %19 ], [ %23, %21 ]
  %26 = phi i8* [ %15, %19 ], [ %23, %21 ]
  %27 = add nuw i64 %16, 1
  br label %13

28:                                               ; preds = %13
  %29 = getelementptr inbounds i8, i8* %15, i64 1
  br label %47

30:                                               ; preds = %6, %38
  %31 = phi i8* [ %39, %38 ], [ %3, %6 ]
  %32 = phi i64 [ %40, %38 ], [ 0, %6 ]
  %33 = phi i8 [ %42, %38 ], [ %4, %6 ]
  %34 = icmp ult i64 %32, 6
  br i1 %34, label %35, label %38

35:                                               ; preds = %30
  %36 = getelementptr inbounds i8, i8* %0, i64 %32
  store i8 %33, i8* %36, align 1, !tbaa !7
  %37 = load i8*, i8** %1, align 8, !tbaa !3
  br label %38

38:                                               ; preds = %30, %35
  %39 = phi i8* [ %31, %30 ], [ %37, %35 ]
  %40 = add nuw i64 %32, 1
  %41 = getelementptr inbounds i8, i8* %39, i64 %40
  %42 = load i8, i8* %41, align 1, !tbaa !7
  %43 = or i8 %42, 32
  %44 = sext i8 %43 to i32
  %45 = add nsw i32 %44, -97
  %46 = icmp ult i32 %45, 26
  br i1 %46, label %30, label %47

47:                                               ; preds = %38, %13, %28
  %48 = phi i8* [ %29, %28 ], [ %14, %13 ], [ %39, %38 ]
  %49 = phi i64 [ %16, %28 ], [ %16, %13 ], [ %40, %38 ]
  %50 = trunc i64 %49 to i32
  %51 = and i64 %49, 4294967295
  %52 = getelementptr inbounds i8, i8* %48, i64 %51
  store i8* %52, i8** %1, align 8, !tbaa !3
  %53 = icmp ult i32 %50, 6
  br i1 %53, label %54, label %56

54:                                               ; preds = %6, %47
  %55 = phi i64 [ %49, %47 ], [ 0, %6 ]
  br label %56

56:                                               ; preds = %47, %54
  %57 = phi i64 [ %55, %54 ], [ 6, %47 ]
  %58 = and i64 %57, 4294967295
  %59 = getelementptr inbounds i8, i8* %0, i64 %58
  store i8 0, i8* %59, align 1, !tbaa !7
  ret void
}

; Function Attrs: optsize
declare hidden i8* @__map_file(i8* noundef, i64* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @strchr(i8* noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @memcmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: nofree norecurse nosync nounwind optsize strictfp
define internal fastcc i32 @getoff(i8** nocapture noundef %0) unnamed_addr #3 {
  %2 = load i8*, i8** %0, align 8, !tbaa !3
  %3 = load i8, i8* %2, align 1, !tbaa !7
  switch i8 %3, label %8 [
    i8 45, label %5
    i8 43, label %4
  ]

4:                                                ; preds = %1
  br label %5

5:                                                ; preds = %1, %4
  %6 = phi i1 [ true, %4 ], [ false, %1 ]
  %7 = getelementptr inbounds i8, i8* %2, i64 1
  store i8* %7, i8** %0, align 8, !tbaa !3
  br label %8

8:                                                ; preds = %5, %1
  %9 = phi i8* [ %2, %1 ], [ %7, %5 ]
  %10 = phi i1 [ true, %1 ], [ %6, %5 ]
  %11 = load i8, i8* %9, align 1, !tbaa !7
  %12 = sext i8 %11 to i32
  %13 = add nsw i32 %12, -48
  %14 = icmp ult i32 %13, 10
  br i1 %14, label %15, label %28

15:                                               ; preds = %8, %15
  %16 = phi i32 [ %24, %15 ], [ %13, %8 ]
  %17 = phi i8* [ %21, %15 ], [ %9, %8 ]
  %18 = phi i32 [ %20, %15 ], [ 0, %8 ]
  %19 = mul i32 %18, 10
  %20 = add i32 %19, %16
  %21 = getelementptr inbounds i8, i8* %17, i64 1
  store i8* %21, i8** %0, align 8, !tbaa !3
  %22 = load i8, i8* %21, align 1, !tbaa !7
  %23 = sext i8 %22 to i32
  %24 = add nsw i32 %23, -48
  %25 = icmp ult i32 %24, 10
  br i1 %25, label %15, label %26

26:                                               ; preds = %15
  %27 = mul i32 %20, 3600
  br label %28

28:                                               ; preds = %26, %8
  %29 = phi i8 [ %11, %8 ], [ %22, %26 ]
  %30 = phi i8* [ %9, %8 ], [ %21, %26 ]
  %31 = phi i32 [ 0, %8 ], [ %27, %26 ]
  %32 = icmp eq i8 %29, 58
  br i1 %32, label %33, label %78

33:                                               ; preds = %28
  %34 = getelementptr inbounds i8, i8* %30, i64 1
  store i8* %34, i8** %0, align 8, !tbaa !3
  %35 = load i8, i8* %34, align 1, !tbaa !7
  %36 = sext i8 %35 to i32
  %37 = add nsw i32 %36, -48
  %38 = icmp ult i32 %37, 10
  br i1 %38, label %39, label %52

39:                                               ; preds = %33, %39
  %40 = phi i32 [ %48, %39 ], [ %37, %33 ]
  %41 = phi i8* [ %45, %39 ], [ %34, %33 ]
  %42 = phi i32 [ %44, %39 ], [ 0, %33 ]
  %43 = mul i32 %42, 10
  %44 = add i32 %43, %40
  %45 = getelementptr inbounds i8, i8* %41, i64 1
  store i8* %45, i8** %0, align 8, !tbaa !3
  %46 = load i8, i8* %45, align 1, !tbaa !7
  %47 = sext i8 %46 to i32
  %48 = add nsw i32 %47, -48
  %49 = icmp ult i32 %48, 10
  br i1 %49, label %39, label %50

50:                                               ; preds = %39
  %51 = mul i32 %44, 60
  br label %52

52:                                               ; preds = %50, %33
  %53 = phi i8 [ %35, %33 ], [ %46, %50 ]
  %54 = phi i8* [ %30, %33 ], [ %41, %50 ]
  %55 = phi i32 [ 0, %33 ], [ %51, %50 ]
  %56 = add nsw i32 %55, %31
  %57 = icmp eq i8 %53, 58
  br i1 %57, label %58, label %78

58:                                               ; preds = %52
  %59 = getelementptr inbounds i8, i8* %54, i64 2
  store i8* %59, i8** %0, align 8, !tbaa !3
  %60 = load i8, i8* %59, align 1, !tbaa !7
  %61 = sext i8 %60 to i32
  %62 = add nsw i32 %61, -48
  %63 = icmp ult i32 %62, 10
  br i1 %63, label %64, label %75

64:                                               ; preds = %58, %64
  %65 = phi i32 [ %73, %64 ], [ %62, %58 ]
  %66 = phi i8* [ %70, %64 ], [ %59, %58 ]
  %67 = phi i32 [ %69, %64 ], [ 0, %58 ]
  %68 = mul i32 %67, 10
  %69 = add i32 %68, %65
  %70 = getelementptr inbounds i8, i8* %66, i64 1
  store i8* %70, i8** %0, align 8, !tbaa !3
  %71 = load i8, i8* %70, align 1, !tbaa !7
  %72 = sext i8 %71 to i32
  %73 = add nsw i32 %72, -48
  %74 = icmp ult i32 %73, 10
  br i1 %74, label %64, label %75

75:                                               ; preds = %64, %58
  %76 = phi i32 [ 0, %58 ], [ %69, %64 ]
  %77 = add nsw i32 %76, %56
  br label %78

78:                                               ; preds = %52, %75, %28
  %79 = phi i32 [ %77, %75 ], [ %56, %52 ], [ %31, %28 ]
  %80 = sub nsw i32 0, %79
  %81 = select i1 %10, i32 %79, i32 %80
  ret i32 %81
}

; Function Attrs: nofree norecurse nosync nounwind optsize strictfp
define internal fastcc void @getrule(i8** nocapture noundef %0, i32* nocapture noundef writeonly %1) unnamed_addr #3 {
  %3 = load i8*, i8** %0, align 8, !tbaa !3
  %4 = load i8, i8* %3, align 1, !tbaa !7
  %5 = sext i8 %4 to i32
  store i32 %5, i32* %1, align 4, !tbaa !8
  switch i8 %4, label %8 [
    i8 77, label %26
    i8 74, label %6
  ]

6:                                                ; preds = %2
  %7 = getelementptr inbounds i8, i8* %3, i64 1
  store i8* %7, i8** %0, align 8, !tbaa !3
  br label %9

8:                                                ; preds = %2
  store i32 0, i32* %1, align 4, !tbaa !8
  br label %9

9:                                                ; preds = %8, %6
  %10 = phi i8* [ %3, %8 ], [ %7, %6 ]
  %11 = load i8, i8* %10, align 1, !tbaa !7
  %12 = sext i8 %11 to i32
  %13 = add nsw i32 %12, -48
  %14 = icmp ult i32 %13, 10
  br i1 %14, label %15, label %83

15:                                               ; preds = %9, %15
  %16 = phi i32 [ %24, %15 ], [ %13, %9 ]
  %17 = phi i8* [ %21, %15 ], [ %10, %9 ]
  %18 = phi i32 [ %20, %15 ], [ 0, %9 ]
  %19 = mul i32 %18, 10
  %20 = add i32 %19, %16
  %21 = getelementptr inbounds i8, i8* %17, i64 1
  store i8* %21, i8** %0, align 8, !tbaa !3
  %22 = load i8, i8* %21, align 1, !tbaa !7
  %23 = sext i8 %22 to i32
  %24 = add nsw i32 %23, -48
  %25 = icmp ult i32 %24, 10
  br i1 %25, label %15, label %83

26:                                               ; preds = %2
  %27 = getelementptr inbounds i8, i8* %3, i64 1
  store i8* %27, i8** %0, align 8, !tbaa !3
  %28 = load i8, i8* %27, align 1, !tbaa !7
  %29 = sext i8 %28 to i32
  %30 = add nsw i32 %29, -48
  %31 = icmp ult i32 %30, 10
  br i1 %31, label %32, label %43

32:                                               ; preds = %26, %32
  %33 = phi i32 [ %41, %32 ], [ %30, %26 ]
  %34 = phi i8* [ %38, %32 ], [ %27, %26 ]
  %35 = phi i32 [ %37, %32 ], [ 0, %26 ]
  %36 = mul i32 %35, 10
  %37 = add i32 %36, %33
  %38 = getelementptr inbounds i8, i8* %34, i64 1
  store i8* %38, i8** %0, align 8, !tbaa !3
  %39 = load i8, i8* %38, align 1, !tbaa !7
  %40 = sext i8 %39 to i32
  %41 = add nsw i32 %40, -48
  %42 = icmp ult i32 %41, 10
  br i1 %42, label %32, label %43

43:                                               ; preds = %32, %26
  %44 = phi i8* [ %3, %26 ], [ %34, %32 ]
  %45 = phi i32 [ 0, %26 ], [ %37, %32 ]
  %46 = getelementptr inbounds i32, i32* %1, i64 1
  store i32 %45, i32* %46, align 4, !tbaa !8
  %47 = getelementptr inbounds i8, i8* %44, i64 2
  store i8* %47, i8** %0, align 8, !tbaa !3
  %48 = load i8, i8* %47, align 1, !tbaa !7
  %49 = sext i8 %48 to i32
  %50 = add nsw i32 %49, -48
  %51 = icmp ult i32 %50, 10
  br i1 %51, label %52, label %63

52:                                               ; preds = %43, %52
  %53 = phi i32 [ %61, %52 ], [ %50, %43 ]
  %54 = phi i8* [ %58, %52 ], [ %47, %43 ]
  %55 = phi i32 [ %57, %52 ], [ 0, %43 ]
  %56 = mul i32 %55, 10
  %57 = add i32 %56, %53
  %58 = getelementptr inbounds i8, i8* %54, i64 1
  store i8* %58, i8** %0, align 8, !tbaa !3
  %59 = load i8, i8* %58, align 1, !tbaa !7
  %60 = sext i8 %59 to i32
  %61 = add nsw i32 %60, -48
  %62 = icmp ult i32 %61, 10
  br i1 %62, label %52, label %63

63:                                               ; preds = %52, %43
  %64 = phi i8* [ %47, %43 ], [ %58, %52 ]
  %65 = phi i32 [ 0, %43 ], [ %57, %52 ]
  %66 = getelementptr inbounds i32, i32* %1, i64 2
  store i32 %65, i32* %66, align 4, !tbaa !8
  %67 = getelementptr inbounds i8, i8* %64, i64 1
  store i8* %67, i8** %0, align 8, !tbaa !3
  %68 = load i8, i8* %67, align 1, !tbaa !7
  %69 = sext i8 %68 to i32
  %70 = add nsw i32 %69, -48
  %71 = icmp ult i32 %70, 10
  br i1 %71, label %72, label %83

72:                                               ; preds = %63, %72
  %73 = phi i32 [ %81, %72 ], [ %70, %63 ]
  %74 = phi i8* [ %78, %72 ], [ %67, %63 ]
  %75 = phi i32 [ %77, %72 ], [ 0, %63 ]
  %76 = mul i32 %75, 10
  %77 = add i32 %76, %73
  %78 = getelementptr inbounds i8, i8* %74, i64 1
  store i8* %78, i8** %0, align 8, !tbaa !3
  %79 = load i8, i8* %78, align 1, !tbaa !7
  %80 = sext i8 %79 to i32
  %81 = add nsw i32 %80, -48
  %82 = icmp ult i32 %81, 10
  br i1 %82, label %72, label %83

83:                                               ; preds = %72, %15, %63, %9
  %84 = phi i64 [ 1, %9 ], [ 3, %63 ], [ 1, %15 ], [ 3, %72 ]
  %85 = phi i32 [ 0, %9 ], [ 0, %63 ], [ %20, %15 ], [ %77, %72 ]
  %86 = phi i8* [ %10, %9 ], [ %67, %63 ], [ %21, %15 ], [ %78, %72 ]
  %87 = getelementptr inbounds i32, i32* %1, i64 %84
  store i32 %85, i32* %87, align 4, !tbaa !8
  %88 = load i8, i8* %86, align 1, !tbaa !7
  %89 = icmp eq i8 %88, 47
  br i1 %89, label %90, label %93

90:                                               ; preds = %83
  %91 = getelementptr inbounds i8, i8* %86, i64 1
  store i8* %91, i8** %0, align 8, !tbaa !3
  %92 = tail call fastcc i32 @getoff(i8** noundef nonnull %0) #5
  br label %93

93:                                               ; preds = %83, %90
  %94 = phi i32 [ %92, %90 ], [ 7200, %83 ]
  %95 = getelementptr inbounds i32, i32* %1, i64 4
  store i32 %94, i32* %95, align 4
  ret void
}

; Function Attrs: optsize
declare hidden i32 @__month_to_secs(i32 noundef, i32 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nofree norecurse nosync nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nobuiltin optsize strictfp "no-builtins" }
attributes #6 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!5, !5, i64 0}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !5, i64 0}
!10 = !{!11, !11, i64 0}
!11 = !{!"long", !5, i64 0}
!12 = !{!13, !4, i64 48}
!13 = !{!"tm", !9, i64 0, !9, i64 4, !9, i64 8, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !9, i64 32, !11, i64 40, !4, i64 48}
!14 = !{!15, !5, i64 2}
!15 = !{!"__libc", !5, i64 0, !5, i64 1, !5, i64 2, !5, i64 3, !9, i64 4, !4, i64 8, !4, i64 16, !11, i64 24, !11, i64 32, !11, i64 40, !11, i64 48, !16, i64 56}
!16 = !{!"__locale_struct", !5, i64 0}
