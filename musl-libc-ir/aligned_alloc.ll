; ModuleID = 'src/malloc/mallocng/aligned_alloc.c'
source_filename = "src/malloc/mallocng/aligned_alloc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.malloc_context = type { i64, i32, i32, %struct.meta*, %struct.meta*, i64, i64, i64, %struct.meta_area*, %struct.meta_area*, i8*, [48 x %struct.meta*], [48 x i64], [32 x i8], [32 x i8], i8, i64 }
%struct.meta = type { %struct.meta*, %struct.meta*, %struct.group*, i32, i32, i64 }
%struct.group = type { %struct.meta*, i8, [7 x i8], [0 x i8] }
%struct.meta_area = type { i64, %struct.meta_area*, i32, [0 x %struct.meta] }

@__malloc_replaced = external hidden local_unnamed_addr global i32, align 4
@__aligned_alloc_replaced = external hidden local_unnamed_addr global i32, align 4
@__malloc_context = external hidden local_unnamed_addr global %struct.malloc_context, align 8
@__malloc_size_classes = external hidden local_unnamed_addr constant [0 x i16], align 2

; Function Attrs: nounwind optsize strictfp
define i8* @aligned_alloc(i64 noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = tail call i64 @llvm.ctpop.i64(i64 %0), !range !3
  %4 = icmp ult i64 %3, 2
  br i1 %4, label %7, label %5

5:                                                ; preds = %2
  %6 = tail call i32* @___errno_location() #4
  store i32 22, i32* %6, align 4, !tbaa !4
  br label %248

7:                                                ; preds = %2
  %8 = xor i64 %0, -1
  %9 = icmp ult i64 %8, %1
  %10 = icmp ugt i64 %0, 34359738367
  %11 = or i1 %10, %9
  br i1 %11, label %12, label %14

12:                                               ; preds = %7
  %13 = tail call i32* @___errno_location() #4
  store i32 12, i32* %13, align 4, !tbaa !4
  br label %248

14:                                               ; preds = %7
  %15 = load i32, i32* @__malloc_replaced, align 4, !tbaa !4
  %16 = icmp eq i32 %15, 0
  %17 = load i32, i32* @__aligned_alloc_replaced, align 4
  %18 = icmp ne i32 %17, 0
  %19 = select i1 %16, i1 true, i1 %18
  br i1 %19, label %22, label %20

20:                                               ; preds = %14
  %21 = tail call i32* @___errno_location() #4
  store i32 12, i32* %21, align 4, !tbaa !4
  br label %248

22:                                               ; preds = %14
  %23 = icmp ugt i64 %0, 16
  %24 = select i1 %23, i64 %0, i64 16
  %25 = add i64 %1, -16
  %26 = add i64 %25, %24
  %27 = tail call i8* @__libc_malloc_impl(i64 noundef %26) #5
  %28 = icmp eq i8* %27, null
  br i1 %28, label %248, label %29

29:                                               ; preds = %22
  %30 = ptrtoint i8* %27 to i64
  %31 = sub i64 0, %30
  %32 = and i64 %30, 15
  %33 = icmp eq i64 %32, 0
  br i1 %33, label %35, label %34

34:                                               ; preds = %29
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !8
  br label %35

35:                                               ; preds = %34, %29
  %36 = getelementptr inbounds i8, i8* %27, i64 -2
  %37 = bitcast i8* %36 to i16*
  %38 = load i16, i16* %37, align 2, !tbaa !9
  %39 = zext i16 %38 to i32
  %40 = getelementptr inbounds i8, i8* %27, i64 -3
  %41 = load i8, i8* %40, align 1, !tbaa !11
  %42 = and i8 %41, 31
  %43 = zext i8 %42 to i32
  %44 = getelementptr inbounds i8, i8* %27, i64 -4
  %45 = load i8, i8* %44, align 1, !tbaa !11
  %46 = icmp eq i8 %45, 0
  br i1 %46, label %56, label %47

47:                                               ; preds = %35
  %48 = icmp eq i16 %38, 0
  br i1 %48, label %50, label %49

49:                                               ; preds = %47
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !8
  br label %50

50:                                               ; preds = %49, %47
  %51 = getelementptr inbounds i8, i8* %27, i64 -8
  %52 = bitcast i8* %51 to i32*
  %53 = load i32, i32* %52, align 4, !tbaa !4
  %54 = icmp sgt i32 %53, 65535
  br i1 %54, label %56, label %55

55:                                               ; preds = %50
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !8
  br label %56

56:                                               ; preds = %55, %50, %35
  %57 = phi i32 [ %53, %50 ], [ %53, %55 ], [ %39, %35 ]
  %58 = shl nsw i32 %57, 4
  %59 = sext i32 %58 to i64
  %60 = sub nsw i64 0, %59
  %61 = getelementptr inbounds i8, i8* %27, i64 %60
  %62 = getelementptr inbounds i8, i8* %61, i64 -16
  %63 = bitcast i8* %62 to %struct.group*
  %64 = bitcast i8* %62 to %struct.meta**
  %65 = load %struct.meta*, %struct.meta** %64, align 8, !tbaa !12
  %66 = getelementptr inbounds %struct.meta, %struct.meta* %65, i64 0, i32 2
  %67 = load %struct.group*, %struct.group** %66, align 8, !tbaa !14
  %68 = icmp eq %struct.group* %67, %63
  br i1 %68, label %70, label %69

69:                                               ; preds = %56
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !8
  br label %70

70:                                               ; preds = %69, %56
  %71 = getelementptr inbounds %struct.meta, %struct.meta* %65, i64 0, i32 5
  %72 = load i64, i64* %71, align 8
  %73 = trunc i64 %72 to i32
  %74 = and i32 %73, 31
  %75 = icmp ult i32 %74, %43
  br i1 %75, label %76, label %77

76:                                               ; preds = %70
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !8
  br label %77

77:                                               ; preds = %76, %70
  %78 = getelementptr inbounds %struct.meta, %struct.meta* %65, i64 0, i32 3
  %79 = load volatile i32, i32* %78, align 8, !tbaa !17
  %80 = shl nuw i32 1, %43
  %81 = and i32 %79, %80
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %84, label %83

83:                                               ; preds = %77
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !8
  br label %84

84:                                               ; preds = %83, %77
  %85 = getelementptr inbounds %struct.meta, %struct.meta* %65, i64 0, i32 4
  %86 = load volatile i32, i32* %85, align 4, !tbaa !18
  %87 = and i32 %86, %80
  %88 = icmp eq i32 %87, 0
  br i1 %88, label %90, label %89

89:                                               ; preds = %84
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !8
  br label %90

90:                                               ; preds = %89, %84
  %91 = ptrtoint %struct.meta* %65 to i64
  %92 = and i64 %91, -4096
  %93 = inttoptr i64 %92 to %struct.meta_area*
  %94 = getelementptr inbounds %struct.meta_area, %struct.meta_area* %93, i64 0, i32 0
  %95 = load i64, i64* %94, align 4096, !tbaa !19
  %96 = load i64, i64* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 0), align 8, !tbaa !20
  %97 = icmp eq i64 %95, %96
  br i1 %97, label %99, label %98

98:                                               ; preds = %90
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !8
  br label %99

99:                                               ; preds = %98, %90
  %100 = load i64, i64* %71, align 8
  %101 = lshr i64 %100, 6
  %102 = and i64 %101, 63
  %103 = trunc i64 %102 to i32
  %104 = icmp ult i32 %103, 48
  br i1 %104, label %105, label %124

105:                                              ; preds = %99
  %106 = getelementptr inbounds [0 x i16], [0 x i16]* @__malloc_size_classes, i64 0, i64 %102
  %107 = load i16, i16* %106, align 2, !tbaa !9
  %108 = zext i16 %107 to i32
  %109 = mul nuw nsw i32 %108, %43
  %110 = icmp slt i32 %57, %109
  br i1 %110, label %111, label %118

111:                                              ; preds = %105
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !8
  %112 = load i64, i64* %71, align 8
  %113 = lshr i64 %112, 6
  %114 = and i64 %113, 63
  %115 = getelementptr inbounds [0 x i16], [0 x i16]* @__malloc_size_classes, i64 0, i64 %114
  %116 = load i16, i16* %115, align 2, !tbaa !9
  %117 = zext i16 %116 to i32
  br label %118

118:                                              ; preds = %111, %105
  %119 = phi i32 [ %117, %111 ], [ %108, %105 ]
  %120 = add nuw nsw i32 %43, 1
  %121 = mul nuw nsw i32 %120, %119
  %122 = icmp slt i32 %57, %121
  br i1 %122, label %127, label %123

123:                                              ; preds = %118
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !8
  br label %127

124:                                              ; preds = %99
  %125 = icmp eq i32 %103, 63
  br i1 %125, label %127, label %126

126:                                              ; preds = %124
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !8
  br label %127

127:                                              ; preds = %126, %124, %123, %118
  %128 = load i64, i64* %71, align 8
  %129 = icmp ult i64 %128, 4096
  br i1 %129, label %130, label %133

130:                                              ; preds = %127
  %131 = load i8, i8* %40, align 1, !tbaa !11
  %132 = and i8 %131, 31
  br label %152

133:                                              ; preds = %127
  %134 = sext i32 %57 to i64
  %135 = lshr i64 %128, 4
  %136 = and i64 %135, 1152921504606846720
  %137 = add nsw i64 %136, -1
  %138 = icmp ult i64 %137, %134
  br i1 %138, label %139, label %141

139:                                              ; preds = %133
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !8
  %140 = load i64, i64* %71, align 8
  br label %141

141:                                              ; preds = %133, %139
  %142 = phi i64 [ %128, %133 ], [ %140, %139 ]
  %143 = load i8, i8* %40, align 1, !tbaa !11
  %144 = and i8 %143, 31
  %145 = and i64 %142, 31
  %146 = icmp ne i64 %145, 0
  %147 = icmp ult i64 %142, 4096
  %148 = or i1 %147, %146
  br i1 %148, label %152, label %149

149:                                              ; preds = %141
  %150 = and i64 %142, -4096
  %151 = add i64 %150, -16
  br label %161

152:                                              ; preds = %130, %141
  %153 = phi i8 [ %132, %130 ], [ %144, %141 ]
  %154 = phi i64 [ %128, %130 ], [ %142, %141 ]
  %155 = lshr i64 %154, 6
  %156 = and i64 %155, 63
  %157 = getelementptr inbounds [0 x i16], [0 x i16]* @__malloc_size_classes, i64 0, i64 %156
  %158 = load i16, i16* %157, align 2, !tbaa !9
  %159 = zext i16 %158 to i64
  %160 = shl nuw nsw i64 %159, 4
  br label %161

161:                                              ; preds = %149, %152
  %162 = phi i8 [ %153, %152 ], [ %144, %149 ]
  %163 = phi i64 [ %160, %152 ], [ %151, %149 ]
  %164 = load %struct.group*, %struct.group** %66, align 8, !tbaa !14
  %165 = zext i8 %162 to i64
  %166 = mul i64 %163, %165
  %167 = getelementptr inbounds %struct.group, %struct.group* %164, i64 0, i32 3, i64 %166
  %168 = add nuw nsw i8 %162, 1
  %169 = zext i8 %168 to i64
  %170 = mul i64 %163, %169
  %171 = getelementptr inbounds %struct.group, %struct.group* %164, i64 0, i32 3, i64 %170
  %172 = getelementptr inbounds i8, i8* %171, i64 -4
  %173 = add nsw i64 %24, -1
  %174 = and i64 %173, %31
  %175 = icmp eq i64 %174, 0
  br i1 %175, label %176, label %198

176:                                              ; preds = %161
  %177 = ptrtoint i8* %172 to i64
  %178 = add i64 %30, %1
  %179 = sub i64 %177, %178
  %180 = trunc i64 %179 to i32
  %181 = icmp eq i32 %180, 0
  br i1 %181, label %191, label %182

182:                                              ; preds = %176
  %183 = mul i64 %179, -4294967296
  %184 = ashr exact i64 %183, 32
  %185 = getelementptr inbounds i8, i8* %172, i64 %184
  store i8 0, i8* %185, align 1, !tbaa !11
  %186 = icmp sgt i32 %180, 4
  br i1 %186, label %187, label %191

187:                                              ; preds = %182
  %188 = getelementptr inbounds i8, i8* %171, i64 -8
  %189 = bitcast i8* %188 to i32*
  store i32 %180, i32* %189, align 4, !tbaa !4
  %190 = getelementptr inbounds i8, i8* %171, i64 -9
  store i8 0, i8* %190, align 1, !tbaa !11
  br label %191

191:                                              ; preds = %176, %182, %187
  %192 = phi i32 [ 5, %187 ], [ %180, %182 ], [ 0, %176 ]
  %193 = load i8, i8* %40, align 1, !tbaa !11
  %194 = and i8 %193, 31
  %195 = trunc i32 %192 to i8
  %196 = shl i8 %195, 5
  %197 = or i8 %196, %194
  store i8 %197, i8* %40, align 1, !tbaa !11
  br label %248

198:                                              ; preds = %161
  %199 = getelementptr inbounds %struct.group, %struct.group* %164, i64 0, i32 3, i64 0
  %200 = getelementptr inbounds i8, i8* %27, i64 %174
  %201 = ptrtoint i8* %200 to i64
  %202 = ptrtoint i8* %199 to i64
  %203 = sub i64 %201, %202
  %204 = lshr i64 %203, 4
  %205 = trunc i64 %204 to i32
  %206 = icmp ult i32 %205, 65536
  br i1 %206, label %207, label %211

207:                                              ; preds = %198
  %208 = trunc i64 %204 to i16
  %209 = getelementptr inbounds i8, i8* %200, i64 -2
  %210 = bitcast i8* %209 to i16*
  store i16 %208, i16* %210, align 2, !tbaa !9
  br label %216

211:                                              ; preds = %198
  %212 = getelementptr inbounds i8, i8* %200, i64 -2
  %213 = bitcast i8* %212 to i16*
  store i16 0, i16* %213, align 2, !tbaa !9
  %214 = getelementptr inbounds i8, i8* %200, i64 -8
  %215 = bitcast i8* %214 to i32*
  store i32 %205, i32* %215, align 4, !tbaa !4
  br label %216

216:                                              ; preds = %211, %207
  %217 = phi i8 [ 0, %207 ], [ 1, %211 ]
  %218 = getelementptr inbounds i8, i8* %200, i64 -4
  store i8 %217, i8* %218, align 1
  %219 = getelementptr inbounds i8, i8* %200, i64 -3
  store i8 %162, i8* %219, align 1, !tbaa !11
  %220 = ptrtoint i8* %172 to i64
  %221 = add i64 %201, %1
  %222 = sub i64 %220, %221
  %223 = trunc i64 %222 to i32
  %224 = icmp eq i32 %223, 0
  br i1 %224, label %234, label %225

225:                                              ; preds = %216
  %226 = mul i64 %222, -4294967296
  %227 = ashr exact i64 %226, 32
  %228 = getelementptr inbounds i8, i8* %172, i64 %227
  store i8 0, i8* %228, align 1, !tbaa !11
  %229 = icmp sgt i32 %223, 4
  br i1 %229, label %230, label %234

230:                                              ; preds = %225
  %231 = getelementptr inbounds i8, i8* %171, i64 -8
  %232 = bitcast i8* %231 to i32*
  store i32 %223, i32* %232, align 4, !tbaa !4
  %233 = getelementptr inbounds i8, i8* %171, i64 -9
  store i8 0, i8* %233, align 1, !tbaa !11
  br label %234

234:                                              ; preds = %216, %225, %230
  %235 = phi i32 [ 5, %230 ], [ %223, %225 ], [ 0, %216 ]
  %236 = load i8, i8* %219, align 1, !tbaa !11
  %237 = and i8 %236, 31
  %238 = trunc i32 %235 to i8
  %239 = shl i8 %238, 5
  %240 = or i8 %239, %237
  store i8 %240, i8* %219, align 1, !tbaa !11
  %241 = ptrtoint i8* %167 to i64
  %242 = sub i64 %201, %241
  %243 = lshr i64 %242, 4
  %244 = trunc i64 %243 to i16
  %245 = getelementptr inbounds i8, i8* %167, i64 -2
  %246 = bitcast i8* %245 to i16*
  store i16 %244, i16* %246, align 2, !tbaa !9
  %247 = getelementptr inbounds i8, i8* %167, i64 -3
  store i8 -32, i8* %247, align 1, !tbaa !11
  br label %248

248:                                              ; preds = %22, %234, %191, %20, %12, %5
  %249 = phi i8* [ null, %5 ], [ null, %12 ], [ null, %20 ], [ null, %22 ], [ %200, %234 ], [ %27, %191 ]
  ret i8* %249
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i8* @__libc_malloc_impl(i64 noundef) local_unnamed_addr #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #3

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 0, i64 65}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{i64 276795}
!9 = !{!10, !10, i64 0}
!10 = !{!"short", !6, i64 0}
!11 = !{!6, !6, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"any pointer", !6, i64 0}
!14 = !{!15, !13, i64 16}
!15 = !{!"meta", !13, i64 0, !13, i64 8, !13, i64 16, !5, i64 24, !5, i64 28, !16, i64 32, !16, i64 32, !16, i64 32, !16, i64 33}
!16 = !{!"long", !6, i64 0}
!17 = !{!15, !5, i64 24}
!18 = !{!15, !5, i64 28}
!19 = !{!16, !16, i64 0}
!20 = !{!21, !16, i64 0}
!21 = !{!"malloc_context", !16, i64 0, !5, i64 8, !5, i64 12, !13, i64 16, !13, i64 24, !16, i64 32, !16, i64 40, !16, i64 48, !13, i64 56, !13, i64 64, !13, i64 72, !6, i64 80, !6, i64 464, !6, i64 848, !6, i64 880, !6, i64 912, !16, i64 920}
