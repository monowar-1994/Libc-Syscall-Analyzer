; ModuleID = 'src/multibyte/mbsrtowcs.c'
source_filename = "src/multibyte/mbsrtowcs.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__mbstate_t = type { i32, i32 }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }

@__fsmu8 = external hidden local_unnamed_addr constant [0 x i32], align 4

; Function Attrs: nounwind optsize strictfp
define i64 @mbsrtowcs(i32* noalias noundef writeonly %0, i8** noalias nocapture noundef %1, i64 noundef %2, %struct.__mbstate_t* noalias noundef %3) local_unnamed_addr #0 {
  %5 = load i8*, i8** %1, align 8, !tbaa !3
  %6 = icmp eq %struct.__mbstate_t* %3, null
  br i1 %6, label %14, label %7

7:                                                ; preds = %4
  %8 = getelementptr %struct.__mbstate_t, %struct.__mbstate_t* %3, i64 0, i32 0
  %9 = load i32, i32* %8, align 4, !tbaa !7
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %14, label %11

11:                                               ; preds = %7
  %12 = icmp eq i32* %0, null
  br i1 %12, label %104, label %13

13:                                               ; preds = %11
  store i32 0, i32* %8, align 4, !tbaa !7
  br label %221

14:                                               ; preds = %7, %4
  %15 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !9
  %16 = inttoptr i64 %15 to %struct.__pthread*
  %17 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %16, i64 0, i32 24
  %18 = load %struct.__locale_struct*, %struct.__locale_struct** %17, align 8, !tbaa !10
  %19 = getelementptr inbounds %struct.__locale_struct, %struct.__locale_struct* %18, i64 0, i32 0, i64 0
  %20 = load %struct.__locale_map*, %struct.__locale_map** %19, align 8, !tbaa !3
  %21 = icmp eq %struct.__locale_map* %20, null
  %22 = icmp eq i32* %0, null
  br i1 %21, label %23, label %45

23:                                               ; preds = %14
  br i1 %22, label %26, label %24

24:                                               ; preds = %23
  %25 = icmp eq i64 %2, 0
  br i1 %25, label %28, label %30

26:                                               ; preds = %23
  %27 = tail call i64 @strlen(i8* noundef %5) #4
  br label %294

28:                                               ; preds = %36, %24
  %29 = phi i8* [ %5, %24 ], [ %37, %36 ]
  store i8* %29, i8** %1, align 8, !tbaa !3
  br label %294

30:                                               ; preds = %24, %36
  %31 = phi i8* [ %37, %36 ], [ %5, %24 ]
  %32 = phi i32* [ %40, %36 ], [ %0, %24 ]
  %33 = phi i64 [ %41, %36 ], [ %2, %24 ]
  %34 = load i8, i8* %31, align 1, !tbaa !14
  %35 = icmp eq i8 %34, 0
  br i1 %35, label %43, label %36

36:                                               ; preds = %30
  %37 = getelementptr inbounds i8, i8* %31, i64 1
  %38 = sext i8 %34 to i32
  %39 = and i32 %38, 57343
  %40 = getelementptr inbounds i32, i32* %32, i64 1
  store i32 %39, i32* %32, align 4, !tbaa !7
  %41 = add i64 %33, -1
  %42 = icmp eq i64 %41, 0
  br i1 %42, label %28, label %30

43:                                               ; preds = %30
  store i32 0, i32* %32, align 4, !tbaa !7
  store i8* null, i8** %1, align 8, !tbaa !3
  %44 = sub i64 %2, %33
  br label %294

45:                                               ; preds = %14
  br i1 %22, label %46, label %49

46:                                               ; preds = %138, %45
  %47 = phi i64 [ %140, %138 ], [ %2, %45 ]
  %48 = phi i8* [ %139, %138 ], [ %5, %45 ]
  br label %54

49:                                               ; preds = %259, %45
  %50 = phi i64 [ %2, %45 ], [ %263, %259 ]
  %51 = phi i32* [ %0, %45 ], [ %262, %259 ]
  %52 = phi i8* [ %5, %45 ], [ %260, %259 ]
  %53 = icmp eq i64 %50, 0
  br i1 %53, label %141, label %143

54:                                               ; preds = %46, %93
  %55 = phi i64 [ %95, %93 ], [ %47, %46 ]
  %56 = phi i8* [ %94, %93 ], [ %48, %46 ]
  %57 = load i8, i8* %56, align 1, !tbaa !14
  %58 = zext i8 %57 to i32
  %59 = add nsw i32 %58, -1
  %60 = icmp ult i32 %59, 127
  %61 = ptrtoint i8* %56 to i64
  %62 = and i64 %61, 3
  %63 = icmp eq i64 %62, 0
  %64 = and i1 %63, %60
  br i1 %64, label %65, label %86

65:                                               ; preds = %54
  %66 = bitcast i8* %56 to i32*
  %67 = load i32, i32* %66, align 4, !tbaa !14
  %68 = add i32 %67, -16843009
  %69 = or i32 %68, %67
  %70 = and i32 %69, -2139062144
  %71 = icmp eq i32 %70, 0
  %72 = trunc i32 %67 to i8
  br i1 %71, label %73, label %86

73:                                               ; preds = %65, %73
  %74 = phi i8* [ %76, %73 ], [ %56, %65 ]
  %75 = phi i64 [ %77, %73 ], [ %55, %65 ]
  %76 = getelementptr inbounds i8, i8* %74, i64 4
  %77 = add i64 %75, -4
  %78 = bitcast i8* %76 to i32*
  %79 = load i32, i32* %78, align 4, !tbaa !14
  %80 = add i32 %79, -16843009
  %81 = or i32 %80, %79
  %82 = and i32 %81, -2139062144
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %73, label %84

84:                                               ; preds = %73
  %85 = trunc i32 %79 to i8
  br label %86

86:                                               ; preds = %84, %65, %54
  %87 = phi i8 [ %57, %54 ], [ %72, %65 ], [ %85, %84 ]
  %88 = phi i64 [ %55, %54 ], [ %55, %65 ], [ %77, %84 ]
  %89 = phi i8* [ %56, %54 ], [ %56, %65 ], [ %76, %84 ]
  %90 = zext i8 %87 to i32
  %91 = add nsw i32 %90, -1
  %92 = icmp ult i32 %91, 127
  br i1 %92, label %93, label %96

93:                                               ; preds = %86
  %94 = getelementptr inbounds i8, i8* %89, i64 1
  %95 = add i64 %88, -1
  br label %54

96:                                               ; preds = %86
  %97 = add nsw i32 %90, -194
  %98 = icmp ugt i32 %97, 50
  br i1 %98, label %273, label %99

99:                                               ; preds = %96
  %100 = getelementptr inbounds i8, i8* %89, i64 1
  %101 = zext i32 %97 to i64
  %102 = getelementptr inbounds [0 x i32], [0 x i32]* @__fsmu8, i64 0, i64 %101
  %103 = load i32, i32* %102, align 4, !tbaa !7
  br label %104

104:                                              ; preds = %11, %99
  %105 = phi i64 [ %2, %11 ], [ %88, %99 ]
  %106 = phi i8* [ %5, %11 ], [ %100, %99 ]
  %107 = phi i32 [ %9, %11 ], [ %103, %99 ]
  %108 = load i8, i8* %106, align 1, !tbaa !14
  %109 = lshr i8 %108, 3
  %110 = zext i8 %109 to i32
  %111 = add nsw i32 %110, -16
  %112 = ashr i32 %107, 26
  %113 = add nsw i32 %112, %110
  %114 = or i32 %111, %113
  %115 = icmp ult i32 %114, 8
  br i1 %115, label %116, label %264

116:                                              ; preds = %104
  %117 = getelementptr inbounds i8, i8* %106, i64 1
  %118 = and i32 %107, 33554432
  %119 = icmp eq i32 %118, 0
  br i1 %119, label %138, label %120

120:                                              ; preds = %116
  %121 = load i8, i8* %117, align 1, !tbaa !14
  %122 = and i8 %121, -64
  %123 = icmp eq i8 %122, -128
  br i1 %123, label %126, label %124

124:                                              ; preds = %120
  %125 = getelementptr inbounds i8, i8* %106, i64 -1
  br label %287

126:                                              ; preds = %120
  %127 = getelementptr inbounds i8, i8* %106, i64 2
  %128 = and i32 %107, 524288
  %129 = icmp eq i32 %128, 0
  br i1 %129, label %138, label %130

130:                                              ; preds = %126
  %131 = load i8, i8* %127, align 1, !tbaa !14
  %132 = and i8 %131, -64
  %133 = icmp eq i8 %132, -128
  br i1 %133, label %136, label %134

134:                                              ; preds = %130
  %135 = getelementptr inbounds i8, i8* %106, i64 -1
  br label %287

136:                                              ; preds = %130
  %137 = getelementptr inbounds i8, i8* %106, i64 3
  br label %138

138:                                              ; preds = %126, %136, %116
  %139 = phi i8* [ %137, %136 ], [ %127, %126 ], [ %117, %116 ]
  %140 = add i64 %105, -1
  br label %46

141:                                              ; preds = %204, %49
  %142 = phi i8* [ %52, %49 ], [ %209, %204 ]
  store i8* %142, i8** %1, align 8, !tbaa !3
  br label %294

143:                                              ; preds = %49, %204
  %144 = phi i8* [ %209, %204 ], [ %52, %49 ]
  %145 = phi i32* [ %210, %204 ], [ %51, %49 ]
  %146 = phi i64 [ %211, %204 ], [ %50, %49 ]
  %147 = load i8, i8* %144, align 1, !tbaa !14
  %148 = zext i8 %147 to i32
  %149 = add nsw i32 %148, -1
  %150 = icmp ult i32 %149, 127
  br i1 %150, label %151, label %196

151:                                              ; preds = %143
  %152 = ptrtoint i8* %144 to i64
  %153 = and i64 %152, 3
  %154 = icmp eq i64 %153, 0
  %155 = icmp ugt i64 %146, 4
  %156 = select i1 %154, i1 %155, i1 false
  br i1 %156, label %157, label %204

157:                                              ; preds = %151, %167
  %158 = phi i64 [ %183, %167 ], [ %146, %151 ]
  %159 = phi i32* [ %182, %167 ], [ %145, %151 ]
  %160 = phi i8* [ %179, %167 ], [ %144, %151 ]
  %161 = bitcast i8* %160 to i32*
  %162 = load i32, i32* %161, align 4, !tbaa !14
  %163 = add i32 %162, -16843009
  %164 = or i32 %163, %162
  %165 = and i32 %164, -2139062144
  %166 = icmp eq i32 %165, 0
  br i1 %166, label %167, label %187

167:                                              ; preds = %157
  %168 = getelementptr inbounds i8, i8* %160, i64 1
  %169 = and i32 %162, 255
  %170 = getelementptr inbounds i32, i32* %159, i64 1
  store i32 %169, i32* %159, align 4, !tbaa !7
  %171 = getelementptr inbounds i8, i8* %160, i64 2
  %172 = load i8, i8* %168, align 1, !tbaa !14
  %173 = zext i8 %172 to i32
  %174 = getelementptr inbounds i32, i32* %159, i64 2
  store i32 %173, i32* %170, align 4, !tbaa !7
  %175 = getelementptr inbounds i8, i8* %160, i64 3
  %176 = load i8, i8* %171, align 1, !tbaa !14
  %177 = zext i8 %176 to i32
  %178 = getelementptr inbounds i32, i32* %159, i64 3
  store i32 %177, i32* %174, align 4, !tbaa !7
  %179 = getelementptr inbounds i8, i8* %160, i64 4
  %180 = load i8, i8* %175, align 1, !tbaa !14
  %181 = zext i8 %180 to i32
  %182 = getelementptr inbounds i32, i32* %159, i64 4
  store i32 %181, i32* %178, align 4, !tbaa !7
  %183 = add i64 %158, -4
  %184 = icmp ugt i64 %183, 4
  br i1 %184, label %157, label %185

185:                                              ; preds = %167
  %186 = load i8, i8* %179, align 1, !tbaa !14
  br label %189

187:                                              ; preds = %157
  %188 = trunc i32 %162 to i8
  br label %189

189:                                              ; preds = %187, %185
  %190 = phi i8 [ %186, %185 ], [ %188, %187 ]
  %191 = phi i64 [ %183, %185 ], [ %158, %187 ]
  %192 = phi i32* [ %182, %185 ], [ %159, %187 ]
  %193 = phi i8* [ %179, %185 ], [ %160, %187 ]
  %194 = zext i8 %190 to i32
  %195 = add nsw i32 %194, -1
  br label %196

196:                                              ; preds = %189, %143
  %197 = phi i32 [ %195, %189 ], [ %149, %143 ]
  %198 = phi i32 [ %194, %189 ], [ %148, %143 ]
  %199 = phi i8 [ %190, %189 ], [ %147, %143 ]
  %200 = phi i64 [ %191, %189 ], [ %146, %143 ]
  %201 = phi i32* [ %192, %189 ], [ %145, %143 ]
  %202 = phi i8* [ %193, %189 ], [ %144, %143 ]
  %203 = icmp ult i32 %197, 127
  br i1 %203, label %204, label %213

204:                                              ; preds = %151, %196
  %205 = phi i8* [ %202, %196 ], [ %144, %151 ]
  %206 = phi i32* [ %201, %196 ], [ %145, %151 ]
  %207 = phi i64 [ %200, %196 ], [ %146, %151 ]
  %208 = phi i32 [ %198, %196 ], [ %148, %151 ]
  %209 = getelementptr inbounds i8, i8* %205, i64 1
  %210 = getelementptr inbounds i32, i32* %206, i64 1
  store i32 %208, i32* %206, align 4, !tbaa !7
  %211 = add i64 %207, -1
  %212 = icmp eq i64 %211, 0
  br i1 %212, label %141, label %143

213:                                              ; preds = %196
  %214 = add nsw i32 %198, -194
  %215 = icmp ugt i32 %214, 50
  br i1 %215, label %273, label %216

216:                                              ; preds = %213
  %217 = getelementptr inbounds i8, i8* %202, i64 1
  %218 = zext i32 %214 to i64
  %219 = getelementptr inbounds [0 x i32], [0 x i32]* @__fsmu8, i64 0, i64 %218
  %220 = load i32, i32* %219, align 4, !tbaa !7
  br label %221

221:                                              ; preds = %216, %13
  %222 = phi i64 [ %2, %13 ], [ %200, %216 ]
  %223 = phi i32* [ %0, %13 ], [ %201, %216 ]
  %224 = phi i8* [ %5, %13 ], [ %217, %216 ]
  %225 = phi i32 [ %9, %13 ], [ %220, %216 ]
  %226 = load i8, i8* %224, align 1, !tbaa !14
  %227 = zext i8 %226 to i32
  %228 = lshr i32 %227, 3
  %229 = add nsw i32 %228, -16
  %230 = ashr i32 %225, 26
  %231 = add nsw i32 %228, %230
  %232 = or i32 %229, %231
  %233 = icmp ult i32 %232, 8
  br i1 %233, label %234, label %264

234:                                              ; preds = %221
  %235 = shl i32 %225, 6
  %236 = getelementptr inbounds i8, i8* %224, i64 1
  %237 = add nsw i32 %227, -128
  %238 = or i32 %237, %235
  %239 = icmp sgt i32 %238, -1
  br i1 %239, label %259, label %240

240:                                              ; preds = %234
  %241 = load i8, i8* %236, align 1, !tbaa !14
  %242 = zext i8 %241 to i32
  %243 = add nsw i32 %242, -128
  %244 = icmp ugt i32 %243, 63
  br i1 %244, label %284, label %245

245:                                              ; preds = %240
  %246 = shl i32 %238, 6
  %247 = getelementptr inbounds i8, i8* %224, i64 2
  %248 = or i32 %243, %246
  %249 = icmp sgt i32 %248, -1
  br i1 %249, label %259, label %250

250:                                              ; preds = %245
  %251 = load i8, i8* %247, align 1, !tbaa !14
  %252 = zext i8 %251 to i32
  %253 = add nsw i32 %252, -128
  %254 = icmp ugt i32 %253, 63
  br i1 %254, label %284, label %255

255:                                              ; preds = %250
  %256 = shl i32 %248, 6
  %257 = getelementptr inbounds i8, i8* %224, i64 3
  %258 = or i32 %253, %256
  br label %259

259:                                              ; preds = %245, %255, %234
  %260 = phi i8* [ %257, %255 ], [ %247, %245 ], [ %236, %234 ]
  %261 = phi i32 [ %258, %255 ], [ %248, %245 ], [ %238, %234 ]
  %262 = getelementptr inbounds i32, i32* %223, i64 1
  store i32 %261, i32* %223, align 4, !tbaa !7
  %263 = add i64 %222, -1
  br label %49

264:                                              ; preds = %221, %104
  %265 = phi i64 [ %105, %104 ], [ %222, %221 ]
  %266 = phi i32* [ %0, %104 ], [ %223, %221 ]
  %267 = phi i8* [ %106, %104 ], [ %224, %221 ]
  %268 = phi i32 [ %107, %104 ], [ %225, %221 ]
  %269 = getelementptr inbounds i8, i8* %267, i64 -1
  %270 = icmp eq i32 %268, 0
  br i1 %270, label %271, label %287

271:                                              ; preds = %264
  %272 = load i8, i8* %269, align 1, !tbaa !14
  br label %273

273:                                              ; preds = %271, %96, %213
  %274 = phi i8 [ %272, %271 ], [ %87, %96 ], [ %199, %213 ]
  %275 = phi i8* [ %269, %271 ], [ %89, %96 ], [ %202, %213 ]
  %276 = phi i32* [ %266, %271 ], [ %0, %96 ], [ %201, %213 ]
  %277 = phi i64 [ %265, %271 ], [ %88, %96 ], [ %200, %213 ]
  %278 = icmp eq i8 %274, 0
  br i1 %278, label %279, label %287

279:                                              ; preds = %273
  %280 = icmp eq i32* %276, null
  br i1 %280, label %282, label %281

281:                                              ; preds = %279
  store i32 0, i32* %276, align 4, !tbaa !7
  store i8* null, i8** %1, align 8, !tbaa !3
  br label %282

282:                                              ; preds = %281, %279
  %283 = sub i64 %2, %277
  br label %294

284:                                              ; preds = %250, %240
  %285 = getelementptr inbounds i8, i8* %224, i64 -1
  %286 = tail call i32* @___errno_location() #5
  store i32 84, i32* %286, align 4, !tbaa !7
  br label %292

287:                                              ; preds = %134, %124, %273, %264
  %288 = phi i8* [ %275, %273 ], [ %269, %264 ], [ %135, %134 ], [ %125, %124 ]
  %289 = phi i32* [ %276, %273 ], [ %266, %264 ], [ %0, %134 ], [ %0, %124 ]
  %290 = tail call i32* @___errno_location() #5
  store i32 84, i32* %290, align 4, !tbaa !7
  %291 = icmp eq i32* %289, null
  br i1 %291, label %294, label %292

292:                                              ; preds = %284, %287
  %293 = phi i8* [ %285, %284 ], [ %288, %287 ]
  store i8* %293, i8** %1, align 8, !tbaa !3
  br label %294

294:                                              ; preds = %287, %292, %282, %141, %43, %28, %26
  %295 = phi i64 [ %283, %282 ], [ %2, %141 ], [ %44, %43 ], [ %2, %28 ], [ %27, %26 ], [ -1, %292 ], [ -1, %287 ]
  ret i64 %295
}

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readnone strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

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
!9 = !{i64 285835}
!10 = !{!11, !4, i64 168}
!11 = !{!"__pthread", !4, i64 0, !4, i64 8, !4, i64 16, !4, i64 24, !12, i64 32, !12, i64 40, !8, i64 48, !8, i64 52, !8, i64 56, !8, i64 60, !5, i64 64, !5, i64 65, !5, i64 66, !5, i64 66, !4, i64 72, !12, i64 80, !4, i64 88, !12, i64 96, !12, i64 104, !4, i64 112, !4, i64 120, !4, i64 128, !13, i64 136, !8, i64 160, !8, i64 164, !4, i64 168, !5, i64 176, !4, i64 184, !4, i64 192}
!12 = !{!"long", !5, i64 0}
!13 = !{!"", !4, i64 0, !12, i64 8, !4, i64 16}
!14 = !{!5, !5, i64 0}
