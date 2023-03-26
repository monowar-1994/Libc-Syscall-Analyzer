; ModuleID = 'src/misc/getopt_long.c'
source_filename = "src/misc/getopt_long.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.option = type { i8*, i32, i32*, i32 }

@optind = external local_unnamed_addr global i32, align 4
@__optreset = external local_unnamed_addr global i32, align 4
@__optpos = external local_unnamed_addr global i32, align 4
@optarg = external local_unnamed_addr global i8*, align 8
@optopt = external local_unnamed_addr global i32, align 4
@opterr = external local_unnamed_addr global i32, align 4
@.str = private unnamed_addr constant [37 x i8] c": option does not take an argument: \00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c": option requires an argument: \00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c": option is ambiguous: \00", align 1
@.str.3 = private unnamed_addr constant [24 x i8] c": unrecognized option: \00", align 1

; Function Attrs: nounwind optsize strictfp
define i32 @getopt_long(i32 noundef %0, i8** noundef %1, i8* noundef %2, %struct.option* noundef %3, i32* noundef %4) local_unnamed_addr #0 {
  %6 = tail call fastcc i32 @__getopt_long(i32 noundef %0, i8** noundef %1, i8* noundef %2, %struct.option* noundef %3, i32* noundef %4, i32 noundef 0) #2
  ret i32 %6
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @__getopt_long(i32 noundef %0, i8** noundef %1, i8* noundef %2, %struct.option* noundef readonly %3, i32* noundef writeonly %4, i32 noundef %5) unnamed_addr #0 {
  %7 = load i32, i32* @optind, align 4, !tbaa !3
  %8 = icmp eq i32 %7, 0
  %9 = load i32, i32* @__optreset, align 4
  %10 = icmp ne i32 %9, 0
  %11 = select i1 %8, i1 true, i1 %10
  br i1 %11, label %12, label %13

12:                                               ; preds = %6
  store i32 0, i32* @__optreset, align 4, !tbaa !3
  store i32 0, i32* @__optpos, align 4, !tbaa !3
  store i32 1, i32* @optind, align 4, !tbaa !3
  br label %13

13:                                               ; preds = %6, %12
  %14 = phi i32 [ %7, %6 ], [ 1, %12 ]
  %15 = icmp slt i32 %14, %0
  br i1 %15, label %16, label %265

16:                                               ; preds = %13
  %17 = sext i32 %14 to i64
  %18 = getelementptr inbounds i8*, i8** %1, i64 %17
  %19 = load i8*, i8** %18, align 8, !tbaa !7
  %20 = icmp eq i8* %19, null
  br i1 %20, label %265, label %21

21:                                               ; preds = %16
  %22 = load i8, i8* %2, align 1, !tbaa !9
  switch i8 %22, label %23 [
    i8 43, label %42
    i8 45, label %42
  ]

23:                                               ; preds = %21, %36
  %24 = phi i64 [ %33, %36 ], [ %17, %21 ]
  %25 = phi i8* [ %38, %36 ], [ %19, %21 ]
  %26 = load i8, i8* %25, align 1, !tbaa !9
  %27 = icmp eq i8 %26, 45
  br i1 %27, label %28, label %32

28:                                               ; preds = %23
  %29 = getelementptr inbounds i8, i8* %25, i64 1
  %30 = load i8, i8* %29, align 1, !tbaa !9
  %31 = icmp eq i8 %30, 0
  br i1 %31, label %32, label %40

32:                                               ; preds = %23, %28
  %33 = add nsw i64 %24, 1
  %34 = trunc i64 %33 to i32
  %35 = icmp eq i32 %34, %0
  br i1 %35, label %265, label %36

36:                                               ; preds = %32
  %37 = getelementptr inbounds i8*, i8** %1, i64 %33
  %38 = load i8*, i8** %37, align 8, !tbaa !7
  %39 = icmp eq i8* %38, null
  br i1 %39, label %265, label %23

40:                                               ; preds = %28
  %41 = trunc i64 %24 to i32
  store i32 %41, i32* @optind, align 4, !tbaa !3
  br label %42

42:                                               ; preds = %40, %21, %21
  %43 = phi i32 [ %41, %40 ], [ %14, %21 ], [ %14, %21 ]
  store i8* null, i8** @optarg, align 8, !tbaa !7
  %44 = icmp eq %struct.option* %3, null
  br i1 %44, label %236, label %45

45:                                               ; preds = %42
  %46 = sext i32 %43 to i64
  %47 = getelementptr inbounds i8*, i8** %1, i64 %46
  %48 = load i8*, i8** %47, align 8, !tbaa !7
  %49 = load i8, i8* %48, align 1, !tbaa !9
  %50 = icmp eq i8 %49, 45
  br i1 %50, label %51, label %236

51:                                               ; preds = %45
  %52 = icmp ne i32 %5, 0
  %53 = getelementptr inbounds i8, i8* %48, i64 1
  %54 = load i8, i8* %53, align 1, !tbaa !9
  br i1 %52, label %55, label %56

55:                                               ; preds = %51
  switch i8 %54, label %62 [
    i8 45, label %58
    i8 0, label %236
  ]

56:                                               ; preds = %51
  %57 = icmp eq i8 %54, 45
  br i1 %57, label %58, label %236

58:                                               ; preds = %55, %56
  %59 = getelementptr inbounds i8, i8* %48, i64 2
  %60 = load i8, i8* %59, align 1, !tbaa !9
  %61 = icmp eq i8 %60, 0
  br i1 %61, label %236, label %62

62:                                               ; preds = %55, %58
  %63 = phi i8 [ %54, %55 ], [ 45, %58 ]
  %64 = load i8, i8* %2, align 1, !tbaa !9
  %65 = icmp eq i8 %64, 43
  %66 = icmp eq i8 %64, 45
  %67 = or i1 %65, %66
  %68 = zext i1 %67 to i64
  %69 = getelementptr inbounds i8, i8* %2, i64 %68
  %70 = load i8, i8* %69, align 1, !tbaa !9
  %71 = icmp eq i8 %70, 58
  %72 = getelementptr inbounds %struct.option, %struct.option* %3, i64 0, i32 0
  %73 = load i8*, i8** %72, align 8, !tbaa !10
  %74 = icmp eq i8* %73, null
  br i1 %74, label %212, label %75

75:                                               ; preds = %62
  %76 = icmp eq i8 %63, 45
  %77 = getelementptr inbounds i8, i8* %48, i64 2
  %78 = select i1 %76, i8* %77, i8* %53
  br label %79

79:                                               ; preds = %104, %75
  %80 = phi i64 [ 0, %75 ], [ %108, %104 ]
  %81 = phi i8* [ %73, %75 ], [ %110, %104 ]
  %82 = phi i8* [ undef, %75 ], [ %105, %104 ]
  %83 = phi i32 [ undef, %75 ], [ %106, %104 ]
  %84 = phi i32 [ 0, %75 ], [ %107, %104 ]
  br label %85

85:                                               ; preds = %92, %79
  %86 = phi i8* [ %78, %79 ], [ %94, %92 ]
  %87 = phi i8* [ %81, %79 ], [ %93, %92 ]
  %88 = load i8, i8* %86, align 1, !tbaa !9
  switch i8 %88, label %89 [
    i8 0, label %97
    i8 61, label %97
  ]

89:                                               ; preds = %85
  %90 = load i8, i8* %87, align 1, !tbaa !9
  %91 = icmp eq i8 %88, %90
  br i1 %91, label %92, label %95

92:                                               ; preds = %89
  %93 = getelementptr inbounds i8, i8* %87, i64 1
  %94 = getelementptr inbounds i8, i8* %86, i64 1
  br label %85

95:                                               ; preds = %89
  %96 = icmp eq i8 %88, 0
  br i1 %96, label %99, label %104

97:                                               ; preds = %85, %85
  %98 = load i8, i8* %87, align 1, !tbaa !9
  br label %99

99:                                               ; preds = %97, %95
  %100 = phi i8 [ %98, %97 ], [ %90, %95 ]
  %101 = icmp eq i8 %100, 0
  %102 = add nsw i32 %84, 1
  %103 = trunc i64 %80 to i32
  br i1 %101, label %112, label %104

104:                                              ; preds = %99, %95
  %105 = phi i8* [ %86, %99 ], [ %82, %95 ]
  %106 = phi i32 [ %103, %99 ], [ %83, %95 ]
  %107 = phi i32 [ %102, %99 ], [ %84, %95 ]
  %108 = add nuw i64 %80, 1
  %109 = getelementptr inbounds %struct.option, %struct.option* %3, i64 %108, i32 0
  %110 = load i8*, i8** %109, align 8, !tbaa !10
  %111 = icmp eq i8* %110, null
  br i1 %111, label %114, label %79

112:                                              ; preds = %99
  %113 = trunc i64 %80 to i32
  br label %114

114:                                              ; preds = %104, %112
  %115 = phi i32 [ 1, %112 ], [ %107, %104 ]
  %116 = phi i32 [ %113, %112 ], [ %106, %104 ]
  %117 = phi i8* [ %86, %112 ], [ %105, %104 ]
  %118 = icmp eq i32 %115, 1
  %119 = and i1 %52, %118
  br i1 %119, label %120, label %157

120:                                              ; preds = %114
  %121 = ptrtoint i8* %117 to i64
  %122 = ptrtoint i8* %53 to i64
  %123 = sub i64 %121, %122
  %124 = tail call i32 @mblen(i8* noundef nonnull %53, i64 noundef 4) #3
  %125 = sext i32 %124 to i64
  %126 = icmp eq i64 %123, %125
  br i1 %126, label %127, label %158

127:                                              ; preds = %120
  %128 = trunc i64 %123 to i32
  %129 = load i8, i8* %2, align 1, !tbaa !9
  %130 = icmp eq i8 %129, 0
  br i1 %130, label %158, label %131

131:                                              ; preds = %127
  %132 = icmp sgt i32 %128, 0
  %133 = and i64 %123, 4294967295
  br label %138

134:                                              ; preds = %153
  %135 = getelementptr inbounds i8, i8* %2, i64 %156
  %136 = load i8, i8* %135, align 1, !tbaa !9
  %137 = icmp eq i8 %136, 0
  br i1 %137, label %158, label %138

138:                                              ; preds = %134, %131
  %139 = phi i64 [ 0, %131 ], [ %156, %134 ]
  br i1 %132, label %140, label %153

140:                                              ; preds = %138, %148
  %141 = phi i64 [ %149, %148 ], [ 0, %138 ]
  %142 = getelementptr inbounds i8, i8* %53, i64 %141
  %143 = load i8, i8* %142, align 1, !tbaa !9
  %144 = add nuw nsw i64 %141, %139
  %145 = getelementptr inbounds i8, i8* %2, i64 %144
  %146 = load i8, i8* %145, align 1, !tbaa !9
  %147 = icmp eq i8 %143, %146
  br i1 %147, label %148, label %151

148:                                              ; preds = %140
  %149 = add nuw nsw i64 %141, 1
  %150 = icmp eq i64 %149, %133
  br i1 %150, label %212, label %140

151:                                              ; preds = %140
  %152 = trunc i64 %141 to i32
  br label %153

153:                                              ; preds = %151, %138
  %154 = phi i32 [ 0, %138 ], [ %152, %151 ]
  %155 = icmp eq i32 %154, %128
  %156 = add nuw i64 %139, 1
  br i1 %155, label %212, label %134

157:                                              ; preds = %114
  br i1 %118, label %158, label %212

158:                                              ; preds = %134, %157, %127, %120
  %159 = load i32, i32* @optind, align 4, !tbaa !3
  %160 = add nsw i32 %159, 1
  store i32 %160, i32* @optind, align 4, !tbaa !3
  %161 = load i8, i8* %117, align 1, !tbaa !9
  %162 = icmp eq i8 %161, 61
  %163 = sext i32 %116 to i64
  %164 = getelementptr inbounds %struct.option, %struct.option* %3, i64 %163, i32 1
  %165 = load i32, i32* %164, align 8, !tbaa !12
  br i1 %162, label %166, label %182

166:                                              ; preds = %158
  %167 = icmp eq i32 %165, 0
  br i1 %167, label %168, label %180

168:                                              ; preds = %166
  %169 = getelementptr inbounds %struct.option, %struct.option* %3, i64 %163, i32 3
  %170 = load i32, i32* %169, align 8, !tbaa !13
  store i32 %170, i32* @optopt, align 4, !tbaa !3
  %171 = xor i1 %71, true
  %172 = load i32, i32* @opterr, align 4
  %173 = icmp ne i32 %172, 0
  %174 = select i1 %171, i1 %173, i1 false
  br i1 %174, label %175, label %238

175:                                              ; preds = %168
  %176 = load i8*, i8** %1, align 8, !tbaa !7
  %177 = getelementptr inbounds %struct.option, %struct.option* %3, i64 %163, i32 0
  %178 = load i8*, i8** %177, align 8, !tbaa !10
  %179 = tail call i64 @strlen(i8* noundef %178) #3
  tail call void @__getopt_msg(i8* noundef %176, i8* noundef getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i64 0, i64 0), i8* noundef %178, i64 noundef %179) #3
  br label %238

180:                                              ; preds = %166
  %181 = getelementptr inbounds i8, i8* %117, i64 1
  store i8* %181, i8** @optarg, align 8, !tbaa !7
  br label %202

182:                                              ; preds = %158
  %183 = icmp eq i32 %165, 1
  br i1 %183, label %184, label %202

184:                                              ; preds = %182
  %185 = sext i32 %160 to i64
  %186 = getelementptr inbounds i8*, i8** %1, i64 %185
  %187 = load i8*, i8** %186, align 8, !tbaa !7
  store i8* %187, i8** @optarg, align 8, !tbaa !7
  %188 = icmp eq i8* %187, null
  br i1 %188, label %189, label %200

189:                                              ; preds = %184
  %190 = getelementptr inbounds %struct.option, %struct.option* %3, i64 %163, i32 3
  %191 = load i32, i32* %190, align 8, !tbaa !13
  store i32 %191, i32* @optopt, align 4, !tbaa !3
  br i1 %71, label %238, label %192

192:                                              ; preds = %189
  %193 = load i32, i32* @opterr, align 4, !tbaa !3
  %194 = icmp eq i32 %193, 0
  br i1 %194, label %238, label %195

195:                                              ; preds = %192
  %196 = load i8*, i8** %1, align 8, !tbaa !7
  %197 = getelementptr inbounds %struct.option, %struct.option* %3, i64 %163, i32 0
  %198 = load i8*, i8** %197, align 8, !tbaa !10
  %199 = tail call i64 @strlen(i8* noundef %198) #3
  tail call void @__getopt_msg(i8* noundef %196, i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0), i8* noundef %198, i64 noundef %199) #3
  br label %238

200:                                              ; preds = %184
  %201 = add nsw i32 %159, 2
  store i32 %201, i32* @optind, align 4, !tbaa !3
  br label %202

202:                                              ; preds = %200, %182, %180
  %203 = icmp eq i32* %4, null
  br i1 %203, label %205, label %204

204:                                              ; preds = %202
  store i32 %116, i32* %4, align 4, !tbaa !3
  br label %205

205:                                              ; preds = %204, %202
  %206 = getelementptr inbounds %struct.option, %struct.option* %3, i64 %163, i32 2
  %207 = load i32*, i32** %206, align 8, !tbaa !14
  %208 = icmp eq i32* %207, null
  %209 = getelementptr inbounds %struct.option, %struct.option* %3, i64 %163, i32 3
  %210 = load i32, i32* %209, align 8, !tbaa !13
  br i1 %208, label %238, label %211

211:                                              ; preds = %205
  store i32 %210, i32* %207, align 4, !tbaa !3
  br label %238

212:                                              ; preds = %153, %148, %157, %62
  %213 = phi i32 [ %115, %157 ], [ 0, %62 ], [ 2, %148 ], [ 2, %153 ]
  %214 = load i32, i32* @optind, align 4, !tbaa !3
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds i8*, i8** %1, i64 %215
  %217 = load i8*, i8** %216, align 8, !tbaa !7
  %218 = getelementptr inbounds i8, i8* %217, i64 1
  %219 = load i8, i8* %218, align 1, !tbaa !9
  %220 = icmp eq i8 %219, 45
  br i1 %220, label %221, label %236

221:                                              ; preds = %212
  store i32 0, i32* @optopt, align 4, !tbaa !3
  %222 = xor i1 %71, true
  %223 = load i32, i32* @opterr, align 4
  %224 = icmp ne i32 %223, 0
  %225 = select i1 %222, i1 %224, i1 false
  br i1 %225, label %226, label %233

226:                                              ; preds = %221
  %227 = load i8*, i8** %1, align 8, !tbaa !7
  %228 = icmp eq i32 %213, 0
  %229 = select i1 %228, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i64 0, i64 0)
  %230 = getelementptr inbounds i8, i8* %217, i64 2
  %231 = tail call i64 @strlen(i8* noundef nonnull %230) #3
  tail call void @__getopt_msg(i8* noundef %227, i8* noundef %229, i8* noundef nonnull %230, i64 noundef %231) #3
  %232 = load i32, i32* @optind, align 4, !tbaa !3
  br label %233

233:                                              ; preds = %226, %221
  %234 = phi i32 [ %232, %226 ], [ %214, %221 ]
  %235 = add nsw i32 %234, 1
  store i32 %235, i32* @optind, align 4, !tbaa !3
  br label %238

236:                                              ; preds = %55, %212, %58, %56, %45, %42
  %237 = tail call i32 @getopt(i32 noundef %0, i8** noundef nonnull %1, i8* noundef nonnull %2) #3
  br label %238

238:                                              ; preds = %168, %175, %189, %192, %195, %205, %211, %233, %236
  %239 = phi i32 [ %237, %236 ], [ 63, %192 ], [ 58, %189 ], [ 63, %168 ], [ 63, %233 ], [ 63, %195 ], [ 63, %175 ], [ 0, %211 ], [ %210, %205 ]
  %240 = icmp sgt i32 %43, %14
  br i1 %240, label %241, label %265

241:                                              ; preds = %238
  %242 = load i32, i32* @optind, align 4, !tbaa !3
  %243 = sub i32 %242, %43
  %244 = icmp sgt i32 %243, 0
  br i1 %244, label %245, label %263

245:                                              ; preds = %241
  %246 = add nsw i32 %242, -1
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds i8*, i8** %1, i64 %247
  %249 = icmp sgt i32 %246, %14
  br label %250

250:                                              ; preds = %245, %260
  %251 = phi i32 [ 0, %245 ], [ %261, %260 ]
  %252 = load i8*, i8** %248, align 8, !tbaa !7
  br i1 %249, label %253, label %260

253:                                              ; preds = %250, %253
  %254 = phi i64 [ %255, %253 ], [ %247, %250 ]
  %255 = add nsw i64 %254, -1
  %256 = getelementptr inbounds i8*, i8** %1, i64 %255
  %257 = load i8*, i8** %256, align 8, !tbaa !7
  %258 = getelementptr inbounds i8*, i8** %1, i64 %254
  store i8* %257, i8** %258, align 8, !tbaa !7
  %259 = icmp sgt i64 %255, %17
  br i1 %259, label %253, label %260

260:                                              ; preds = %253, %250
  store i8* %252, i8** %18, align 8, !tbaa !7
  %261 = add nuw nsw i32 %251, 1
  %262 = icmp eq i32 %261, %243
  br i1 %262, label %263, label %250

263:                                              ; preds = %260, %241
  %264 = add nsw i32 %243, %14
  store i32 %264, i32* @optind, align 4, !tbaa !3
  br label %265

265:                                              ; preds = %36, %32, %238, %263, %13, %16
  %266 = phi i32 [ -1, %16 ], [ -1, %13 ], [ %239, %263 ], [ %239, %238 ], [ -1, %32 ], [ -1, %36 ]
  ret i32 %266
}

; Function Attrs: nounwind optsize strictfp
define i32 @getopt_long_only(i32 noundef %0, i8** noundef %1, i8* noundef %2, %struct.option* noundef %3, i32* noundef %4) local_unnamed_addr #0 {
  %6 = tail call fastcc i32 @__getopt_long(i32 noundef %0, i8** noundef %1, i8* noundef %2, %struct.option* noundef %3, i32* noundef %4, i32 noundef 1) #2
  ret i32 %6
}

; Function Attrs: optsize
declare i32 @mblen(i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__getopt_msg(i8* noundef, i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @getopt(i32 noundef, i8** noundef, i8* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin optsize strictfp "no-builtins" }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"any pointer", !5, i64 0}
!9 = !{!5, !5, i64 0}
!10 = !{!11, !8, i64 0}
!11 = !{!"option", !8, i64 0, !4, i64 8, !8, i64 16, !4, i64 24}
!12 = !{!11, !4, i64 8}
!13 = !{!11, !4, i64 24}
!14 = !{!11, !8, i64 16}
