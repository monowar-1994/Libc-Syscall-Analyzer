; ModuleID = 'src/malloc/mallocng/malloc_usable_size.c'
source_filename = "src/malloc/mallocng/malloc_usable_size.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.malloc_context = type { i64, i32, i32, %struct.meta*, %struct.meta*, i64, i64, i64, %struct.meta_area*, %struct.meta_area*, i8*, [48 x %struct.meta*], [48 x i64], [32 x i8], [32 x i8], i8, i64 }
%struct.meta = type { %struct.meta*, %struct.meta*, %struct.group*, i32, i32, i64 }
%struct.group = type { %struct.meta*, i8, [7 x i8], [0 x i8] }
%struct.meta_area = type { i64, %struct.meta_area*, i32, [0 x %struct.meta] }

@__malloc_context = external hidden local_unnamed_addr global %struct.malloc_context, align 8
@__malloc_size_classes = external hidden local_unnamed_addr constant [0 x i16], align 2

; Function Attrs: nounwind optsize strictfp
define i64 @malloc_usable_size(i8* noundef %0) local_unnamed_addr #0 {
  %2 = icmp eq i8* %0, null
  br i1 %2, label %182, label %3

3:                                                ; preds = %1
  %4 = ptrtoint i8* %0 to i64
  %5 = and i64 %4, 15
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %8, label %7

7:                                                ; preds = %3
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !3
  br label %8

8:                                                ; preds = %7, %3
  %9 = getelementptr inbounds i8, i8* %0, i64 -2
  %10 = bitcast i8* %9 to i16*
  %11 = load i16, i16* %10, align 2, !tbaa !4
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8* %0, i64 -3
  %14 = load i8, i8* %13, align 1, !tbaa !8
  %15 = and i8 %14, 31
  %16 = zext i8 %15 to i32
  %17 = getelementptr inbounds i8, i8* %0, i64 -4
  %18 = load i8, i8* %17, align 1, !tbaa !8
  %19 = icmp eq i8 %18, 0
  br i1 %19, label %29, label %20

20:                                               ; preds = %8
  %21 = icmp eq i16 %11, 0
  br i1 %21, label %23, label %22

22:                                               ; preds = %20
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !3
  br label %23

23:                                               ; preds = %22, %20
  %24 = getelementptr inbounds i8, i8* %0, i64 -8
  %25 = bitcast i8* %24 to i32*
  %26 = load i32, i32* %25, align 4, !tbaa !9
  %27 = icmp sgt i32 %26, 65535
  br i1 %27, label %29, label %28

28:                                               ; preds = %23
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !3
  br label %29

29:                                               ; preds = %28, %23, %8
  %30 = phi i32 [ %26, %23 ], [ %26, %28 ], [ %12, %8 ]
  %31 = shl nsw i32 %30, 4
  %32 = sext i32 %31 to i64
  %33 = sub nsw i64 0, %32
  %34 = getelementptr inbounds i8, i8* %0, i64 %33
  %35 = getelementptr inbounds i8, i8* %34, i64 -16
  %36 = bitcast i8* %35 to %struct.group*
  %37 = bitcast i8* %35 to %struct.meta**
  %38 = load %struct.meta*, %struct.meta** %37, align 8, !tbaa !11
  %39 = getelementptr inbounds %struct.meta, %struct.meta* %38, i64 0, i32 2
  %40 = load %struct.group*, %struct.group** %39, align 8, !tbaa !13
  %41 = icmp eq %struct.group* %40, %36
  br i1 %41, label %43, label %42

42:                                               ; preds = %29
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !3
  br label %43

43:                                               ; preds = %42, %29
  %44 = getelementptr inbounds %struct.meta, %struct.meta* %38, i64 0, i32 5
  %45 = load i64, i64* %44, align 8
  %46 = trunc i64 %45 to i32
  %47 = and i32 %46, 31
  %48 = icmp ult i32 %47, %16
  br i1 %48, label %49, label %50

49:                                               ; preds = %43
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !3
  br label %50

50:                                               ; preds = %49, %43
  %51 = getelementptr inbounds %struct.meta, %struct.meta* %38, i64 0, i32 3
  %52 = load volatile i32, i32* %51, align 8, !tbaa !16
  %53 = shl nuw i32 1, %16
  %54 = and i32 %52, %53
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %57, label %56

56:                                               ; preds = %50
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !3
  br label %57

57:                                               ; preds = %56, %50
  %58 = getelementptr inbounds %struct.meta, %struct.meta* %38, i64 0, i32 4
  %59 = load volatile i32, i32* %58, align 4, !tbaa !17
  %60 = and i32 %59, %53
  %61 = icmp eq i32 %60, 0
  br i1 %61, label %63, label %62

62:                                               ; preds = %57
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !3
  br label %63

63:                                               ; preds = %62, %57
  %64 = ptrtoint %struct.meta* %38 to i64
  %65 = and i64 %64, -4096
  %66 = inttoptr i64 %65 to %struct.meta_area*
  %67 = getelementptr inbounds %struct.meta_area, %struct.meta_area* %66, i64 0, i32 0
  %68 = load i64, i64* %67, align 4096, !tbaa !18
  %69 = load i64, i64* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 0), align 8, !tbaa !19
  %70 = icmp eq i64 %68, %69
  br i1 %70, label %72, label %71

71:                                               ; preds = %63
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !3
  br label %72

72:                                               ; preds = %71, %63
  %73 = load i64, i64* %44, align 8
  %74 = lshr i64 %73, 6
  %75 = and i64 %74, 63
  %76 = trunc i64 %75 to i32
  %77 = icmp ult i32 %76, 48
  br i1 %77, label %78, label %97

78:                                               ; preds = %72
  %79 = getelementptr inbounds [0 x i16], [0 x i16]* @__malloc_size_classes, i64 0, i64 %75
  %80 = load i16, i16* %79, align 2, !tbaa !4
  %81 = zext i16 %80 to i32
  %82 = mul nuw nsw i32 %81, %16
  %83 = icmp slt i32 %30, %82
  br i1 %83, label %84, label %91

84:                                               ; preds = %78
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !3
  %85 = load i64, i64* %44, align 8
  %86 = lshr i64 %85, 6
  %87 = and i64 %86, 63
  %88 = getelementptr inbounds [0 x i16], [0 x i16]* @__malloc_size_classes, i64 0, i64 %87
  %89 = load i16, i16* %88, align 2, !tbaa !4
  %90 = zext i16 %89 to i32
  br label %91

91:                                               ; preds = %84, %78
  %92 = phi i32 [ %90, %84 ], [ %81, %78 ]
  %93 = add nuw nsw i32 %16, 1
  %94 = mul nuw nsw i32 %93, %92
  %95 = icmp slt i32 %30, %94
  br i1 %95, label %100, label %96

96:                                               ; preds = %91
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !3
  br label %100

97:                                               ; preds = %72
  %98 = icmp eq i32 %76, 63
  br i1 %98, label %100, label %99

99:                                               ; preds = %97
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !3
  br label %100

100:                                              ; preds = %99, %97, %96, %91
  %101 = load i64, i64* %44, align 8
  %102 = icmp ult i64 %101, 4096
  br i1 %102, label %103, label %106

103:                                              ; preds = %100
  %104 = load i8, i8* %13, align 1, !tbaa !8
  %105 = and i8 %104, 31
  br label %125

106:                                              ; preds = %100
  %107 = sext i32 %30 to i64
  %108 = lshr i64 %101, 4
  %109 = and i64 %108, 1152921504606846720
  %110 = add nsw i64 %109, -1
  %111 = icmp ult i64 %110, %107
  br i1 %111, label %112, label %114

112:                                              ; preds = %106
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !3
  %113 = load i64, i64* %44, align 8
  br label %114

114:                                              ; preds = %106, %112
  %115 = phi i64 [ %101, %106 ], [ %113, %112 ]
  %116 = load i8, i8* %13, align 1, !tbaa !8
  %117 = and i8 %116, 31
  %118 = and i64 %115, 31
  %119 = icmp ne i64 %118, 0
  %120 = icmp ult i64 %115, 4096
  %121 = or i1 %120, %119
  br i1 %121, label %125, label %122

122:                                              ; preds = %114
  %123 = and i64 %115, -4096
  %124 = add i64 %123, -16
  br label %135

125:                                              ; preds = %103, %114
  %126 = phi i8 [ %105, %103 ], [ %117, %114 ]
  %127 = phi i8 [ %104, %103 ], [ %116, %114 ]
  %128 = phi i64 [ %101, %103 ], [ %115, %114 ]
  %129 = lshr i64 %128, 6
  %130 = and i64 %129, 63
  %131 = getelementptr inbounds [0 x i16], [0 x i16]* @__malloc_size_classes, i64 0, i64 %130
  %132 = load i16, i16* %131, align 2, !tbaa !4
  %133 = zext i16 %132 to i64
  %134 = shl nuw nsw i64 %133, 4
  br label %135

135:                                              ; preds = %122, %125
  %136 = phi i8 [ %126, %125 ], [ %117, %122 ]
  %137 = phi i8 [ %127, %125 ], [ %116, %122 ]
  %138 = phi i64 [ %134, %125 ], [ %124, %122 ]
  %139 = load %struct.group*, %struct.group** %39, align 8, !tbaa !13
  %140 = zext i8 %136 to i64
  %141 = mul i64 %138, %140
  %142 = getelementptr inbounds %struct.group, %struct.group* %139, i64 0, i32 3, i64 %141
  %143 = getelementptr inbounds i8, i8* %142, i64 %138
  %144 = getelementptr inbounds i8, i8* %143, i64 -4
  %145 = lshr i8 %137, 5
  %146 = zext i8 %145 to i64
  %147 = icmp ugt i8 %137, -97
  br i1 %147, label %148, label %163

148:                                              ; preds = %135
  %149 = icmp eq i8 %145, 5
  br i1 %149, label %151, label %150

150:                                              ; preds = %148
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !3
  br label %151

151:                                              ; preds = %150, %148
  %152 = getelementptr inbounds i8, i8* %144, i64 -4
  %153 = bitcast i8* %152 to i32*
  %154 = load i32, i32* %153, align 4, !tbaa !9
  %155 = zext i32 %154 to i64
  %156 = icmp ugt i32 %154, 4
  br i1 %156, label %158, label %157

157:                                              ; preds = %151
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !3
  br label %158

158:                                              ; preds = %157, %151
  %159 = getelementptr inbounds i8, i8* %144, i64 -5
  %160 = load i8, i8* %159, align 1, !tbaa !8
  %161 = icmp eq i8 %160, 0
  br i1 %161, label %163, label %162

162:                                              ; preds = %158
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !3
  br label %163

163:                                              ; preds = %162, %158, %135
  %164 = phi i64 [ %155, %162 ], [ %155, %158 ], [ %146, %135 ]
  %165 = ptrtoint i8* %144 to i64
  %166 = sub i64 %165, %4
  %167 = icmp ugt i64 %164, %166
  br i1 %167, label %168, label %169

168:                                              ; preds = %163
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !3
  br label %169

169:                                              ; preds = %168, %163
  %170 = sub nsw i64 0, %164
  %171 = getelementptr inbounds i8, i8* %144, i64 %170
  %172 = load i8, i8* %171, align 1, !tbaa !8
  %173 = icmp eq i8 %172, 0
  br i1 %173, label %175, label %174

174:                                              ; preds = %169
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !3
  br label %175

175:                                              ; preds = %174, %169
  %176 = load i8, i8* %144, align 1, !tbaa !8
  %177 = icmp eq i8 %176, 0
  br i1 %177, label %179, label %178

178:                                              ; preds = %175
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !3
  br label %179

179:                                              ; preds = %175, %178
  %180 = ptrtoint i8* %171 to i64
  %181 = sub i64 %180, %4
  br label %182

182:                                              ; preds = %1, %179
  %183 = phi i64 [ %181, %179 ], [ 0, %1 ]
  ret i64 %183
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 275710}
!4 = !{!5, !5, i64 0}
!5 = !{!"short", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!6, !6, i64 0}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !6, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"any pointer", !6, i64 0}
!13 = !{!14, !12, i64 16}
!14 = !{!"meta", !12, i64 0, !12, i64 8, !12, i64 16, !10, i64 24, !10, i64 28, !15, i64 32, !15, i64 32, !15, i64 32, !15, i64 33}
!15 = !{!"long", !6, i64 0}
!16 = !{!14, !10, i64 24}
!17 = !{!14, !10, i64 28}
!18 = !{!15, !15, i64 0}
!19 = !{!20, !15, i64 0}
!20 = !{!"malloc_context", !15, i64 0, !10, i64 8, !10, i64 12, !12, i64 16, !12, i64 24, !15, i64 32, !15, i64 40, !15, i64 48, !12, i64 56, !12, i64 64, !12, i64 72, !6, i64 80, !6, i64 464, !6, i64 848, !6, i64 880, !6, i64 912, !15, i64 920}
