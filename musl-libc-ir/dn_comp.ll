; ModuleID = 'src/network/dn_comp.c'
source_filename = "src/network/dn_comp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @dn_comp(i8* noundef %0, i8* noundef %1, i32 noundef %2, i8** noundef %3, i8** noundef readnone %4) local_unnamed_addr #0 {
  %6 = alloca [128 x i16], align 16
  %7 = alloca [127 x i8], align 16
  %8 = getelementptr inbounds [127 x i8], [127 x i8]* %7, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 127, i8* nonnull %8) #3
  %9 = tail call i64 @strnlen(i8* noundef %0, i64 noundef 255) #4
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %20, label %11

11:                                               ; preds = %5
  %12 = add i64 %9, -1
  %13 = getelementptr inbounds i8, i8* %0, i64 %12
  %14 = load i8, i8* %13, align 1, !tbaa !3
  %15 = icmp eq i8 %14, 46
  %16 = select i1 %15, i64 %12, i64 %9
  %17 = icmp ugt i64 %16, 253
  %18 = icmp slt i32 %2, 1
  %19 = or i1 %18, %17
  br i1 %19, label %254, label %22

20:                                               ; preds = %5
  %21 = icmp slt i32 %2, 1
  br i1 %21, label %254, label %24

22:                                               ; preds = %11
  %23 = icmp eq i64 %16, 0
  br i1 %23, label %24, label %25

24:                                               ; preds = %20, %22
  store i8 0, i8* %1, align 1, !tbaa !3
  br label %254

25:                                               ; preds = %22
  %26 = getelementptr inbounds i8, i8* %0, i64 %16
  %27 = trunc i64 %16 to i32
  br label %28

28:                                               ; preds = %49, %25
  %29 = phi i64 [ %51, %49 ], [ 0, %25 ]
  %30 = phi i32 [ %54, %49 ], [ 0, %25 ]
  %31 = icmp slt i32 %30, %27
  br i1 %31, label %32, label %44

32:                                               ; preds = %28
  %33 = sext i32 %30 to i64
  br label %34

34:                                               ; preds = %39, %32
  %35 = phi i64 [ %33, %32 ], [ %40, %39 ]
  %36 = getelementptr inbounds i8, i8* %0, i64 %35
  %37 = load i8, i8* %36, align 1, !tbaa !3
  %38 = icmp eq i8 %37, 46
  br i1 %38, label %42, label %39

39:                                               ; preds = %34
  %40 = add nsw i64 %35, 1
  %41 = icmp eq i64 %40, %16
  br i1 %41, label %44, label %34

42:                                               ; preds = %34
  %43 = trunc i64 %35 to i32
  br label %44

44:                                               ; preds = %39, %42, %28
  %45 = phi i32 [ %30, %28 ], [ %43, %42 ], [ %27, %39 ]
  %46 = sub nsw i32 %45, %30
  %47 = add i32 %46, -64
  %48 = icmp ult i32 %47, -63
  br i1 %48, label %254, label %49

49:                                               ; preds = %44
  %50 = trunc i32 %46 to i8
  %51 = add nuw i64 %29, 1
  %52 = getelementptr inbounds [127 x i8], [127 x i8]* %7, i64 0, i64 %29
  store i8 %50, i8* %52, align 1, !tbaa !3
  %53 = icmp eq i32 %45, %27
  %54 = add nsw i32 %45, 1
  br i1 %53, label %55, label %28

55:                                               ; preds = %49
  %56 = trunc i64 %51 to i32
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %254, label %58

58:                                               ; preds = %55
  %59 = icmp ne i8** %3, null
  br i1 %59, label %60, label %190

60:                                               ; preds = %58
  %61 = load i8*, i8** %3, align 8, !tbaa !6
  %62 = icmp eq i8* %61, null
  br i1 %62, label %190, label %63

63:                                               ; preds = %60
  %64 = getelementptr inbounds i8*, i8** %3, i64 1
  %65 = load i8*, i8** %64, align 8, !tbaa !6
  %66 = icmp eq i8* %65, null
  br i1 %66, label %190, label %67

67:                                               ; preds = %63
  %68 = bitcast [128 x i16]* %6 to i8*
  %69 = shl i64 %29, 32
  %70 = ashr exact i64 %69, 32
  %71 = getelementptr inbounds [127 x i8], [127 x i8]* %7, i64 0, i64 %70
  %72 = icmp ne i64 %69, 0
  %73 = zext i1 %72 to i32
  br label %74

74:                                               ; preds = %188, %67
  %75 = phi i8* [ %61, %67 ], [ %189, %188 ]
  %76 = phi i8* [ %65, %67 ], [ %186, %188 ]
  %77 = phi i8** [ %64, %67 ], [ %185, %188 ]
  %78 = phi i32 [ undef, %67 ], [ %184, %188 ]
  %79 = phi i32 [ 0, %67 ], [ %183, %188 ]
  %80 = phi i32 [ undef, %67 ], [ %176, %188 ]
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %68) #3
  %81 = ptrtoint i8* %75 to i64
  br label %82

82:                                               ; preds = %104, %74
  %83 = phi i64 [ %106, %104 ], [ 0, %74 ]
  %84 = phi i8* [ %111, %104 ], [ %76, %74 ]
  br label %85

85:                                               ; preds = %89, %82
  %86 = phi i8* [ %84, %82 ], [ %97, %89 ]
  %87 = load i8, i8* %86, align 1, !tbaa !3
  %88 = and i8 %87, -64
  switch i8 %88, label %175 [
    i8 0, label %98
    i8 -64, label %89
  ]

89:                                               ; preds = %85
  %90 = zext i8 %87 to i64
  %91 = shl nuw nsw i64 %90, 8
  %92 = and i64 %91, 16128
  %93 = getelementptr inbounds i8, i8* %86, i64 1
  %94 = load i8, i8* %93, align 1, !tbaa !3
  %95 = zext i8 %94 to i64
  %96 = or i64 %92, %95
  %97 = getelementptr inbounds i8, i8* %75, i64 %96
  br label %85

98:                                               ; preds = %85
  %99 = icmp eq i8 %87, 0
  br i1 %99, label %112, label %100

100:                                              ; preds = %98
  %101 = ptrtoint i8* %86 to i64
  %102 = sub i64 %101, %81
  %103 = icmp sgt i64 %102, 16383
  br i1 %103, label %175, label %104

104:                                              ; preds = %100
  %105 = trunc i64 %102 to i16
  %106 = add nuw i64 %83, 1
  %107 = getelementptr inbounds [128 x i16], [128 x i16]* %6, i64 0, i64 %83
  store i16 %105, i16* %107, align 2, !tbaa !8
  %108 = load i8, i8* %86, align 1, !tbaa !3
  %109 = zext i8 %108 to i64
  %110 = add nuw nsw i64 %109, 1
  %111 = getelementptr inbounds i8, i8* %86, i64 %110
  br label %82

112:                                              ; preds = %98
  %113 = trunc i64 %83 to i32
  %114 = icmp eq i32 %113, 0
  br i1 %114, label %175, label %115

115:                                              ; preds = %112
  %116 = load i8, i8* %71, align 1, !tbaa !3
  %117 = shl i64 %83, 32
  %118 = add i64 %117, -4294967296
  %119 = ashr exact i64 %118, 32
  %120 = getelementptr inbounds [128 x i16], [128 x i16]* %6, i64 0, i64 %119
  %121 = load i16, i16* %120, align 2, !tbaa !8
  %122 = zext i8 %116 to i64
  %123 = sext i16 %121 to i64
  %124 = getelementptr inbounds i8, i8* %75, i64 %123
  %125 = load i8, i8* %124, align 1, !tbaa !3
  %126 = icmp eq i8 %116, %125
  br i1 %126, label %127, label %175

127:                                              ; preds = %115
  %128 = sub nsw i64 0, %122
  %129 = getelementptr inbounds i8, i8* %26, i64 %128
  %130 = getelementptr inbounds i8, i8* %75, i64 1
  %131 = getelementptr inbounds i8, i8* %130, i64 %123
  %132 = tail call i32 @memcmp(i8* noundef nonnull %131, i8* noundef nonnull %129, i64 noundef %122) #4
  %133 = icmp eq i32 %132, 0
  br i1 %133, label %134, label %175

134:                                              ; preds = %127
  %135 = zext i8 %116 to i32
  %136 = add nuw nsw i32 %73, %135
  %137 = icmp ne i64 %118, 0
  %138 = select i1 %72, i1 %137, i1 false
  br i1 %138, label %139, label %171

139:                                              ; preds = %134, %163
  %140 = phi i32 [ %168, %163 ], [ %136, %134 ]
  %141 = phi i64 [ %146, %163 ], [ %70, %134 ]
  %142 = phi i64 [ %149, %163 ], [ %119, %134 ]
  %143 = phi i8* [ %154, %163 ], [ %129, %134 ]
  %144 = phi i16 [ %151, %163 ], [ %121, %134 ]
  %145 = getelementptr inbounds i8, i8* %143, i64 -1
  %146 = add nsw i64 %141, -1
  %147 = getelementptr inbounds [127 x i8], [127 x i8]* %7, i64 0, i64 %146
  %148 = load i8, i8* %147, align 1, !tbaa !3
  %149 = add nsw i64 %142, -1
  %150 = getelementptr inbounds [128 x i16], [128 x i16]* %6, i64 0, i64 %149
  %151 = load i16, i16* %150, align 2, !tbaa !8
  %152 = zext i8 %148 to i64
  %153 = sub nsw i64 0, %152
  %154 = getelementptr inbounds i8, i8* %145, i64 %153
  %155 = sext i16 %151 to i64
  %156 = getelementptr inbounds i8, i8* %75, i64 %155
  %157 = load i8, i8* %156, align 1, !tbaa !3
  %158 = icmp eq i8 %148, %157
  br i1 %158, label %159, label %171

159:                                              ; preds = %139
  %160 = getelementptr inbounds i8, i8* %130, i64 %155
  %161 = tail call i32 @memcmp(i8* noundef nonnull %160, i8* noundef nonnull %154, i64 noundef %152) #4
  %162 = icmp eq i32 %161, 0
  br i1 %162, label %163, label %171

163:                                              ; preds = %159
  %164 = zext i8 %148 to i32
  %165 = icmp ne i64 %146, 0
  %166 = zext i1 %165 to i32
  %167 = add i32 %140, %166
  %168 = add i32 %167, %164
  %169 = icmp ne i64 %149, 0
  %170 = select i1 %165, i1 %169, i1 false
  br i1 %170, label %139, label %171

171:                                              ; preds = %163, %159, %139, %134
  %172 = phi i16 [ %121, %134 ], [ %151, %163 ], [ %144, %159 ], [ %144, %139 ]
  %173 = phi i32 [ %136, %134 ], [ %168, %163 ], [ %140, %159 ], [ %140, %139 ]
  %174 = zext i16 %172 to i32
  br label %175

175:                                              ; preds = %100, %85, %171, %127, %112, %115
  %176 = phi i32 [ %80, %112 ], [ %80, %115 ], [ %80, %127 ], [ %174, %171 ], [ %80, %85 ], [ %80, %100 ]
  %177 = phi i32 [ 0, %112 ], [ 0, %115 ], [ 0, %127 ], [ %173, %171 ], [ 0, %85 ], [ 0, %100 ]
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %68) #3
  %178 = icmp sgt i32 %177, %79
  br i1 %178, label %179, label %182

179:                                              ; preds = %175
  %180 = sext i32 %177 to i64
  %181 = icmp eq i64 %16, %180
  br i1 %181, label %190, label %182

182:                                              ; preds = %175, %179
  %183 = phi i32 [ %177, %179 ], [ %79, %175 ]
  %184 = phi i32 [ %176, %179 ], [ %78, %175 ]
  %185 = getelementptr inbounds i8*, i8** %77, i64 1
  %186 = load i8*, i8** %185, align 8, !tbaa !6
  %187 = icmp eq i8* %186, null
  br i1 %187, label %190, label %188

188:                                              ; preds = %182
  %189 = load i8*, i8** %3, align 8, !tbaa !6
  br label %74

190:                                              ; preds = %179, %182, %63, %60, %58
  %191 = phi i32 [ 0, %60 ], [ 0, %58 ], [ 0, %63 ], [ %177, %179 ], [ %183, %182 ]
  %192 = phi i32 [ undef, %60 ], [ undef, %58 ], [ undef, %63 ], [ %176, %179 ], [ %184, %182 ]
  %193 = phi i8** [ %3, %60 ], [ null, %58 ], [ %64, %63 ], [ %77, %179 ], [ %185, %182 ]
  %194 = sext i32 %2 to i64
  %195 = sext i32 %191 to i64
  %196 = sub i64 %16, %195
  %197 = add i64 %196, 2
  %198 = add nsw i32 %191, -1
  %199 = sext i32 %198 to i64
  %200 = add i64 %16, -1
  %201 = icmp ugt i64 %200, %199
  %202 = zext i1 %201 to i64
  %203 = add i64 %197, %202
  %204 = icmp ugt i64 %203, %194
  br i1 %204, label %254, label %205

205:                                              ; preds = %190
  %206 = getelementptr inbounds i8, i8* %1, i64 1
  %207 = tail call i8* @memcpy(i8* noundef nonnull %206, i8* noundef %0, i64 noundef %196) #4
  %208 = icmp eq i64 %196, 0
  br i1 %208, label %222, label %209

209:                                              ; preds = %205, %209
  %210 = phi i64 [ %216, %209 ], [ 0, %205 ]
  %211 = phi i64 [ %220, %209 ], [ 0, %205 ]
  %212 = phi i32 [ %219, %209 ], [ 0, %205 ]
  %213 = getelementptr inbounds [127 x i8], [127 x i8]* %7, i64 0, i64 %210
  %214 = load i8, i8* %213, align 1, !tbaa !3
  %215 = getelementptr inbounds i8, i8* %1, i64 %211
  store i8 %214, i8* %215, align 1, !tbaa !3
  %216 = add nuw i64 %210, 1
  %217 = zext i8 %214 to i32
  %218 = add i32 %212, 1
  %219 = add i32 %218, %217
  %220 = zext i32 %219 to i64
  %221 = icmp ugt i64 %196, %220
  br i1 %221, label %209, label %222

222:                                              ; preds = %209, %205
  %223 = phi i32 [ 0, %205 ], [ %219, %209 ]
  %224 = zext i32 %223 to i64
  %225 = icmp eq i32 %191, 0
  br i1 %225, label %234, label %226

226:                                              ; preds = %222
  %227 = lshr i32 %192, 8
  %228 = trunc i32 %227 to i8
  %229 = or i8 %228, -64
  %230 = add nuw nsw i32 %223, 1
  %231 = trunc i32 %192 to i8
  %232 = zext i32 %230 to i64
  %233 = getelementptr inbounds i8, i8* %1, i64 %232
  store i8 %231, i8* %233, align 1, !tbaa !3
  br label %234

234:                                              ; preds = %222, %226
  %235 = phi i8 [ %229, %226 ], [ 0, %222 ]
  %236 = phi i32 [ %230, %226 ], [ %223, %222 ]
  %237 = getelementptr inbounds i8, i8* %1, i64 %224
  store i8 %235, i8* %237, align 1
  %238 = add nsw i32 %236, 1
  %239 = icmp sgt i32 %236, 1
  %240 = icmp ne i8** %4, null
  %241 = and i1 %240, %239
  %242 = and i1 %59, %241
  br i1 %242, label %243, label %254

243:                                              ; preds = %234
  %244 = load i8*, i8** %3, align 8, !tbaa !6
  %245 = icmp eq i8* %244, null
  br i1 %245, label %254, label %246

246:                                              ; preds = %243, %246
  %247 = phi i8** [ %250, %246 ], [ %193, %243 ]
  %248 = load i8*, i8** %247, align 8, !tbaa !6
  %249 = icmp eq i8* %248, null
  %250 = getelementptr inbounds i8*, i8** %247, i64 1
  br i1 %249, label %251, label %246

251:                                              ; preds = %246
  %252 = icmp ult i8** %250, %4
  br i1 %252, label %253, label %254

253:                                              ; preds = %251
  store i8* %1, i8** %247, align 8, !tbaa !6
  store i8* null, i8** %250, align 8, !tbaa !6
  br label %254

254:                                              ; preds = %44, %20, %234, %243, %253, %251, %190, %55, %11, %24
  %255 = phi i32 [ 1, %24 ], [ -1, %11 ], [ -1, %55 ], [ -1, %190 ], [ %238, %251 ], [ %238, %253 ], [ %238, %243 ], [ %238, %234 ], [ -1, %20 ], [ -1, %44 ]
  call void @llvm.lifetime.end.p0i8(i64 127, i8* nonnull %8) #3
  ret i32 %255
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i64 @strnlen(i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @memcmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !4, i64 0}
!8 = !{!9, !9, i64 0}
!9 = !{!"short", !4, i64 0}
