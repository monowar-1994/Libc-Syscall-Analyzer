; ModuleID = 'src/network/inet_pton.c'
source_filename = "src/network/inet_pton.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @inet_pton(i32 noundef %0, i8* noalias nocapture noundef readonly %1, i8* noalias nocapture noundef writeonly %2) local_unnamed_addr #0 {
  %4 = alloca <8 x i16>, align 16
  %5 = bitcast <8 x i16>* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %5) #5
  switch i32 %0, label %52 [
    i32 2, label %6
    i32 10, label %54
  ]

6:                                                ; preds = %3, %46
  %7 = phi i64 [ %50, %46 ], [ 0, %3 ]
  %8 = phi i8* [ %49, %46 ], [ %1, %3 ]
  br label %9

9:                                                ; preds = %6, %17
  %10 = phi i64 [ 0, %6 ], [ %20, %17 ]
  %11 = phi i32 [ 0, %6 ], [ %19, %17 ]
  %12 = getelementptr inbounds i8, i8* %8, i64 %10
  %13 = load i8, i8* %12, align 1, !tbaa !3
  %14 = sext i8 %13 to i32
  %15 = add nsw i32 %14, -48
  %16 = icmp ult i32 %15, 10
  br i1 %16, label %17, label %22

17:                                               ; preds = %9
  %18 = mul nsw i32 %11, 10
  %19 = add i32 %15, %18
  %20 = add nuw nsw i64 %10, 1
  %21 = icmp eq i64 %20, 3
  br i1 %21, label %24, label %9

22:                                               ; preds = %9
  %23 = trunc i64 %10 to i32
  switch i32 %23, label %24 [
    i32 0, label %234
    i32 1, label %31
  ]

24:                                               ; preds = %17, %22
  %25 = phi i32 [ %11, %22 ], [ %19, %17 ]
  %26 = phi i32 [ %23, %22 ], [ 3, %17 ]
  %27 = load i8, i8* %8, align 1, !tbaa !3
  %28 = icmp eq i8 %27, 48
  %29 = icmp sgt i32 %25, 255
  %30 = select i1 %28, i1 true, i1 %29
  br i1 %30, label %236, label %33

31:                                               ; preds = %22
  %32 = icmp sgt i32 %11, 255
  br i1 %32, label %236, label %33

33:                                               ; preds = %24, %31
  %34 = phi i32 [ %25, %24 ], [ %11, %31 ]
  %35 = phi i32 [ %26, %24 ], [ 1, %31 ]
  %36 = trunc i32 %34 to i8
  %37 = getelementptr inbounds i8, i8* %2, i64 %7
  store i8 %36, i8* %37, align 1, !tbaa !3
  %38 = zext i32 %35 to i64
  %39 = getelementptr inbounds i8, i8* %8, i64 %38
  %40 = load i8, i8* %39, align 1, !tbaa !3
  %41 = icmp eq i8 %40, 0
  %42 = icmp eq i64 %7, 3
  %43 = select i1 %41, i1 %42, i1 false
  br i1 %43, label %236, label %44

44:                                               ; preds = %33
  %45 = icmp eq i8 %40, 46
  br i1 %45, label %46, label %236

46:                                               ; preds = %44
  %47 = add nuw nsw i32 %35, 1
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds i8, i8* %8, i64 %48
  %50 = add nuw nsw i64 %7, 1
  %51 = icmp eq i64 %50, 4
  br i1 %51, label %236, label %6

52:                                               ; preds = %3
  %53 = tail call i32* @___errno_location() #6
  store i32 97, i32* %53, align 4, !tbaa !6
  br label %236

54:                                               ; preds = %3
  %55 = load i8, i8* %1, align 1, !tbaa !3
  %56 = icmp eq i8 %55, 58
  br i1 %56, label %57, label %61

57:                                               ; preds = %54
  %58 = getelementptr inbounds i8, i8* %1, i64 1
  %59 = load i8, i8* %58, align 1, !tbaa !3
  %60 = icmp eq i8 %59, 58
  br i1 %60, label %61, label %236

61:                                               ; preds = %57, %54
  %62 = phi i8* [ %1, %54 ], [ %58, %57 ]
  br label %63

63:                                               ; preds = %61, %132
  %64 = phi i8 [ %133, %132 ], [ %55, %61 ]
  %65 = phi i8* [ %134, %132 ], [ %62, %61 ]
  %66 = phi i32 [ %136, %132 ], [ 0, %61 ]
  %67 = phi i32 [ %135, %132 ], [ -1, %61 ]
  %68 = icmp eq i8 %64, 58
  %69 = icmp slt i32 %67, 0
  %70 = select i1 %68, i1 %69, i1 false
  br i1 %70, label %71, label %80

71:                                               ; preds = %63
  %72 = and i32 %66, 7
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds <8 x i16>, <8 x i16>* %4, i64 0, i64 %73
  store i16 0, i16* %74, align 2, !tbaa !8
  %75 = getelementptr inbounds i8, i8* %65, i64 1
  %76 = load i8, i8* %75, align 1, !tbaa !3
  %77 = icmp eq i8 %76, 0
  br i1 %77, label %137, label %78

78:                                               ; preds = %71
  %79 = icmp eq i32 %66, 7
  br i1 %79, label %236, label %132

80:                                               ; preds = %63, %98
  %81 = phi i8 [ %100, %98 ], [ %64, %63 ]
  %82 = phi i64 [ %96, %98 ], [ 0, %63 ]
  %83 = phi i32 [ %95, %98 ], [ 0, %63 ]
  %84 = sext i8 %81 to i32
  %85 = add nsw i32 %84, -48
  %86 = icmp ult i32 %85, 10
  br i1 %86, label %92, label %87

87:                                               ; preds = %80
  %88 = or i32 %84, 32
  %89 = add nsw i32 %88, -87
  %90 = add nsw i32 %88, -97
  %91 = icmp ult i32 %90, 6
  br i1 %91, label %92, label %101

92:                                               ; preds = %87, %80
  %93 = phi i32 [ %85, %80 ], [ %89, %87 ]
  %94 = shl nsw i32 %83, 4
  %95 = add nsw i32 %93, %94
  %96 = add nuw nsw i64 %82, 1
  %97 = icmp eq i64 %96, 4
  br i1 %97, label %104, label %98

98:                                               ; preds = %92
  %99 = getelementptr inbounds i8, i8* %65, i64 %96
  %100 = load i8, i8* %99, align 1, !tbaa !3
  br label %80

101:                                              ; preds = %87
  %102 = trunc i64 %82 to i32
  %103 = icmp eq i32 %102, 0
  br i1 %103, label %236, label %104

104:                                              ; preds = %92, %101
  %105 = phi i32 [ %102, %101 ], [ 4, %92 ]
  %106 = phi i32 [ %83, %101 ], [ %95, %92 ]
  %107 = trunc i32 %106 to i16
  %108 = and i32 %66, 7
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds <8 x i16>, <8 x i16>* %4, i64 0, i64 %109
  store i16 %107, i16* %110, align 2, !tbaa !8
  %111 = zext i32 %105 to i64
  %112 = getelementptr inbounds i8, i8* %65, i64 %111
  %113 = load i8, i8* %112, align 1, !tbaa !3
  %114 = icmp eq i8 %113, 0
  br i1 %114, label %115, label %119

115:                                              ; preds = %104
  %116 = icmp sgt i32 %67, -1
  %117 = icmp eq i32 %66, 7
  %118 = select i1 %116, i1 true, i1 %117
  br i1 %118, label %137, label %236

119:                                              ; preds = %104
  %120 = icmp eq i32 %66, 7
  br i1 %120, label %236, label %121

121:                                              ; preds = %119
  switch i8 %113, label %236 [
    i8 58, label %127
    i8 46, label %122
  ]

122:                                              ; preds = %121
  %123 = icmp ult i32 %66, 6
  %124 = select i1 %123, i1 %69, i1 false
  br i1 %124, label %236, label %125

125:                                              ; preds = %122
  %126 = add nuw nsw i32 %66, 1
  br label %137

127:                                              ; preds = %121
  %128 = add nuw nsw i32 %105, 1
  %129 = zext i32 %128 to i64
  %130 = getelementptr inbounds i8, i8* %65, i64 %129
  %131 = load i8, i8* %130, align 1, !tbaa !3
  br label %132

132:                                              ; preds = %78, %127
  %133 = phi i8 [ %76, %78 ], [ %131, %127 ]
  %134 = phi i8* [ %75, %78 ], [ %130, %127 ]
  %135 = phi i32 [ %66, %78 ], [ %67, %127 ]
  %136 = add nuw nsw i32 %66, 1
  br label %63

137:                                              ; preds = %71, %115, %125
  %138 = phi i8* [ %65, %125 ], [ %65, %115 ], [ %75, %71 ]
  %139 = phi i32 [ %126, %125 ], [ %66, %115 ], [ %66, %71 ]
  %140 = phi i32 [ %67, %125 ], [ %67, %115 ], [ %66, %71 ]
  %141 = phi i1 [ false, %125 ], [ true, %115 ], [ true, %71 ]
  %142 = icmp sgt i32 %140, -1
  br i1 %142, label %143, label %222

143:                                              ; preds = %137
  %144 = zext i32 %140 to i64
  %145 = getelementptr inbounds <8 x i16>, <8 x i16>* %4, i64 0, i64 %144
  %146 = getelementptr inbounds i16, i16* %145, i64 7
  %147 = sext i32 %139 to i64
  %148 = sub nsw i64 0, %147
  %149 = getelementptr inbounds i16, i16* %146, i64 %148
  %150 = bitcast i16* %149 to i8*
  %151 = bitcast i16* %145 to i8*
  %152 = add nsw i32 %139, 1
  %153 = sub i32 %152, %140
  %154 = shl nsw i32 %153, 1
  %155 = sext i32 %154 to i64
  %156 = call i8* @memmove(i8* noundef nonnull %150, i8* noundef nonnull %151, i64 noundef %155) #7
  %157 = icmp slt i32 %139, 7
  br i1 %157, label %158, label %222

158:                                              ; preds = %143
  %159 = sub i32 7, %139
  %160 = zext i32 %140 to i64
  %161 = call i32 @llvm.smax.i32(i32 %159, i32 1)
  %162 = zext i32 %161 to i64
  %163 = add nuw nsw i64 %162, 7
  %164 = and i64 %163, 4294967288
  %165 = add nsw i64 %162, -1
  %166 = insertelement <8 x i64> poison, i64 %165, i64 0
  %167 = shufflevector <8 x i64> %166, <8 x i64> poison, <8 x i32> zeroinitializer
  br label %168

168:                                              ; preds = %218, %158
  %169 = phi i64 [ 0, %158 ], [ %219, %218 ]
  %170 = phi <8 x i64> [ <i64 0, i64 1, i64 2, i64 3, i64 4, i64 5, i64 6, i64 7>, %158 ], [ %220, %218 ]
  %171 = icmp ule <8 x i64> %170, %167
  %172 = extractelement <8 x i1> %171, i64 0
  br i1 %172, label %173, label %176

173:                                              ; preds = %168
  %174 = add nuw nsw i64 %169, %160
  %175 = getelementptr inbounds <8 x i16>, <8 x i16>* %4, i64 0, i64 %174
  store i16 0, i16* %175, align 2, !tbaa !8
  br label %176

176:                                              ; preds = %173, %168
  %177 = extractelement <8 x i1> %171, i64 1
  br i1 %177, label %178, label %182

178:                                              ; preds = %176
  %179 = or i64 %169, 1
  %180 = add nuw nsw i64 %179, %160
  %181 = getelementptr inbounds <8 x i16>, <8 x i16>* %4, i64 0, i64 %180
  store i16 0, i16* %181, align 2, !tbaa !8
  br label %182

182:                                              ; preds = %178, %176
  %183 = extractelement <8 x i1> %171, i64 2
  br i1 %183, label %184, label %188

184:                                              ; preds = %182
  %185 = or i64 %169, 2
  %186 = add nuw nsw i64 %185, %160
  %187 = getelementptr inbounds <8 x i16>, <8 x i16>* %4, i64 0, i64 %186
  store i16 0, i16* %187, align 2, !tbaa !8
  br label %188

188:                                              ; preds = %184, %182
  %189 = extractelement <8 x i1> %171, i64 3
  br i1 %189, label %190, label %194

190:                                              ; preds = %188
  %191 = or i64 %169, 3
  %192 = add nuw nsw i64 %191, %160
  %193 = getelementptr inbounds <8 x i16>, <8 x i16>* %4, i64 0, i64 %192
  store i16 0, i16* %193, align 2, !tbaa !8
  br label %194

194:                                              ; preds = %190, %188
  %195 = extractelement <8 x i1> %171, i64 4
  br i1 %195, label %196, label %200

196:                                              ; preds = %194
  %197 = or i64 %169, 4
  %198 = add nuw nsw i64 %197, %160
  %199 = getelementptr inbounds <8 x i16>, <8 x i16>* %4, i64 0, i64 %198
  store i16 0, i16* %199, align 2, !tbaa !8
  br label %200

200:                                              ; preds = %196, %194
  %201 = extractelement <8 x i1> %171, i64 5
  br i1 %201, label %202, label %206

202:                                              ; preds = %200
  %203 = or i64 %169, 5
  %204 = add nuw nsw i64 %203, %160
  %205 = getelementptr inbounds <8 x i16>, <8 x i16>* %4, i64 0, i64 %204
  store i16 0, i16* %205, align 2, !tbaa !8
  br label %206

206:                                              ; preds = %202, %200
  %207 = extractelement <8 x i1> %171, i64 6
  br i1 %207, label %208, label %212

208:                                              ; preds = %206
  %209 = or i64 %169, 6
  %210 = add nuw nsw i64 %209, %160
  %211 = getelementptr inbounds <8 x i16>, <8 x i16>* %4, i64 0, i64 %210
  store i16 0, i16* %211, align 2, !tbaa !8
  br label %212

212:                                              ; preds = %208, %206
  %213 = extractelement <8 x i1> %171, i64 7
  br i1 %213, label %214, label %218

214:                                              ; preds = %212
  %215 = or i64 %169, 7
  %216 = add nuw nsw i64 %215, %160
  %217 = getelementptr inbounds <8 x i16>, <8 x i16>* %4, i64 0, i64 %216
  store i16 0, i16* %217, align 2, !tbaa !8
  br label %218

218:                                              ; preds = %214, %212
  %219 = add i64 %169, 8
  %220 = add <8 x i64> %170, <i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8>
  %221 = icmp eq i64 %219, %164
  br i1 %221, label %222, label %168, !llvm.loop !10

222:                                              ; preds = %143, %137, %218
  %223 = load <8 x i16>, <8 x i16>* %4, align 16, !tbaa !8
  %224 = lshr <8 x i16> %223, <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>
  %225 = trunc <8 x i16> %224 to <8 x i8>
  %226 = trunc <8 x i16> %223 to <8 x i8>
  %227 = bitcast i8* %2 to <16 x i8>*
  %228 = shufflevector <8 x i8> %225, <8 x i8> %226, <16 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11, i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  store <16 x i8> %228, <16 x i8>* %227, align 1, !tbaa !3
  br i1 %141, label %233, label %229

229:                                              ; preds = %222
  %230 = getelementptr i8, i8* %2, i64 12
  %231 = call i32 @inet_pton(i32 noundef 2, i8* noundef nonnull %138, i8* noundef nonnull %230) #8
  %232 = icmp slt i32 %231, 1
  br i1 %232, label %236, label %233

233:                                              ; preds = %229, %222
  br label %236

234:                                              ; preds = %22
  %235 = trunc i64 %10 to i32
  br label %236

236:                                              ; preds = %121, %119, %101, %78, %234, %31, %24, %33, %44, %46, %115, %229, %122, %57, %233, %52
  %237 = phi i32 [ -1, %52 ], [ 1, %233 ], [ 0, %57 ], [ 0, %122 ], [ 0, %229 ], [ 0, %115 ], [ %235, %234 ], [ 0, %31 ], [ 0, %24 ], [ 1, %33 ], [ 0, %44 ], [ 0, %46 ], [ 0, %78 ], [ 0, %101 ], [ 0, %119 ], [ 0, %121 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %5) #5
  ret i32 %237
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memmove(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #4

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { nounwind strictfp }
attributes #6 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #7 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #8 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
!8 = !{!9, !9, i64 0}
!9 = !{!"short", !4, i64 0}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.isvectorized", i32 1}
