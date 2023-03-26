; ModuleID = 'src/internal/vdso.c'
source_filename = "src/internal/vdso.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.Elf64_Ehdr = type { [16 x i8], i16, i16, i32, i64, i64, i64, i32, i16, i16, i16, i16, i16, i16 }
%struct.Elf64_Verdef = type { i16, i16, i16, i16, i32, i32, i32 }
%struct.Elf64_Sym = type { i32, i8, i8, i16, i64, i64 }

@__libc = external hidden local_unnamed_addr global %struct.__libc, align 8

; Function Attrs: nounwind strictfp
define hidden i8* @__vdsosym(i8* noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = load i64*, i64** getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 5), align 8, !tbaa !3
  br label %4

4:                                                ; preds = %8, %2
  %5 = phi i64 [ 0, %2 ], [ %9, %8 ]
  %6 = getelementptr inbounds i64, i64* %3, i64 %5
  %7 = load i64, i64* %6, align 8, !tbaa !11
  switch i64 %7, label %8 [
    i64 33, label %10
    i64 0, label %234
  ]

8:                                                ; preds = %4
  %9 = add i64 %5, 2
  br label %4

10:                                               ; preds = %4
  %11 = or i64 %5, 1
  %12 = getelementptr inbounds i64, i64* %3, i64 %11
  %13 = load i64, i64* %12, align 8, !tbaa !11
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %234, label %15

15:                                               ; preds = %10
  %16 = inttoptr i64 %13 to i8*
  %17 = inttoptr i64 %13 to %struct.Elf64_Ehdr*
  %18 = getelementptr inbounds %struct.Elf64_Ehdr, %struct.Elf64_Ehdr* %17, i64 0, i32 10
  %19 = load i16, i16* %18, align 8, !tbaa !12
  %20 = zext i16 %19 to i64
  %21 = icmp eq i16 %19, 0
  br i1 %21, label %234, label %22

22:                                               ; preds = %15
  %23 = getelementptr inbounds %struct.Elf64_Ehdr, %struct.Elf64_Ehdr* %17, i64 0, i32 5
  %24 = load i64, i64* %23, align 8, !tbaa !15
  %25 = getelementptr inbounds i8, i8* %16, i64 %24
  %26 = getelementptr inbounds %struct.Elf64_Ehdr, %struct.Elf64_Ehdr* %17, i64 0, i32 9
  %27 = load i16, i16* %26, align 2, !tbaa !16
  %28 = zext i16 %27 to i64
  %29 = and i64 %20, 1
  %30 = icmp eq i16 %19, 1
  br i1 %30, label %82, label %31

31:                                               ; preds = %22
  %32 = and i64 %20, 65534
  br label %33

33:                                               ; preds = %76, %31
  %34 = phi i64 [ -1, %31 ], [ %78, %76 ]
  %35 = phi i64* [ null, %31 ], [ %77, %76 ]
  %36 = phi i8* [ %25, %31 ], [ %79, %76 ]
  %37 = phi i64 [ 0, %31 ], [ %80, %76 ]
  %38 = bitcast i8* %36 to i32*
  %39 = load i32, i32* %38, align 8, !tbaa !17
  switch i32 %39, label %55 [
    i32 1, label %40
    i32 2, label %49
  ]

40:                                               ; preds = %33
  %41 = getelementptr inbounds i8, i8* %36, i64 8
  %42 = bitcast i8* %41 to i64*
  %43 = load i64, i64* %42, align 8, !tbaa !19
  %44 = add i64 %43, %13
  %45 = getelementptr inbounds i8, i8* %36, i64 16
  %46 = bitcast i8* %45 to i64*
  %47 = load i64, i64* %46, align 8, !tbaa !20
  %48 = sub i64 %44, %47
  br label %55

49:                                               ; preds = %33
  %50 = getelementptr inbounds i8, i8* %36, i64 8
  %51 = bitcast i8* %50 to i64*
  %52 = load i64, i64* %51, align 8, !tbaa !19
  %53 = getelementptr inbounds i8, i8* %16, i64 %52
  %54 = bitcast i8* %53 to i64*
  br label %55

55:                                               ; preds = %33, %40, %49
  %56 = phi i64* [ %35, %40 ], [ %54, %49 ], [ %35, %33 ]
  %57 = phi i64 [ %48, %40 ], [ %34, %49 ], [ %34, %33 ]
  %58 = getelementptr inbounds i8, i8* %36, i64 %28
  %59 = bitcast i8* %58 to i32*
  %60 = load i32, i32* %59, align 8, !tbaa !17
  switch i32 %60, label %76 [
    i32 1, label %67
    i32 2, label %61
  ]

61:                                               ; preds = %55
  %62 = getelementptr inbounds i8, i8* %58, i64 8
  %63 = bitcast i8* %62 to i64*
  %64 = load i64, i64* %63, align 8, !tbaa !19
  %65 = getelementptr inbounds i8, i8* %16, i64 %64
  %66 = bitcast i8* %65 to i64*
  br label %76

67:                                               ; preds = %55
  %68 = getelementptr inbounds i8, i8* %58, i64 8
  %69 = bitcast i8* %68 to i64*
  %70 = load i64, i64* %69, align 8, !tbaa !19
  %71 = add i64 %70, %13
  %72 = getelementptr inbounds i8, i8* %58, i64 16
  %73 = bitcast i8* %72 to i64*
  %74 = load i64, i64* %73, align 8, !tbaa !20
  %75 = sub i64 %71, %74
  br label %76

76:                                               ; preds = %67, %61, %55
  %77 = phi i64* [ %56, %67 ], [ %66, %61 ], [ %56, %55 ]
  %78 = phi i64 [ %75, %67 ], [ %57, %61 ], [ %57, %55 ]
  %79 = getelementptr inbounds i8, i8* %58, i64 %28
  %80 = add i64 %37, 2
  %81 = icmp eq i64 %80, %32
  br i1 %81, label %82, label %33

82:                                               ; preds = %76, %22
  %83 = phi i64* [ undef, %22 ], [ %77, %76 ]
  %84 = phi i64 [ undef, %22 ], [ %78, %76 ]
  %85 = phi i64 [ -1, %22 ], [ %78, %76 ]
  %86 = phi i64* [ null, %22 ], [ %77, %76 ]
  %87 = phi i8* [ %25, %22 ], [ %79, %76 ]
  %88 = icmp eq i64 %29, 0
  br i1 %88, label %107, label %89

89:                                               ; preds = %82
  %90 = bitcast i8* %87 to i32*
  %91 = load i32, i32* %90, align 8, !tbaa !17
  switch i32 %91, label %107 [
    i32 1, label %98
    i32 2, label %92
  ]

92:                                               ; preds = %89
  %93 = getelementptr inbounds i8, i8* %87, i64 8
  %94 = bitcast i8* %93 to i64*
  %95 = load i64, i64* %94, align 8, !tbaa !19
  %96 = getelementptr inbounds i8, i8* %16, i64 %95
  %97 = bitcast i8* %96 to i64*
  br label %107

98:                                               ; preds = %89
  %99 = getelementptr inbounds i8, i8* %87, i64 8
  %100 = bitcast i8* %99 to i64*
  %101 = load i64, i64* %100, align 8, !tbaa !19
  %102 = add i64 %101, %13
  %103 = getelementptr inbounds i8, i8* %87, i64 16
  %104 = bitcast i8* %103 to i64*
  %105 = load i64, i64* %104, align 8, !tbaa !20
  %106 = sub i64 %102, %105
  br label %107

107:                                              ; preds = %89, %92, %98, %82
  %108 = phi i64* [ %83, %82 ], [ %86, %98 ], [ %97, %92 ], [ %86, %89 ]
  %109 = phi i64 [ %84, %82 ], [ %106, %98 ], [ %85, %92 ], [ %85, %89 ]
  %110 = icmp eq i64* %108, null
  %111 = icmp eq i64 %109, -1
  %112 = select i1 %110, i1 true, i1 %111
  br i1 %112, label %234, label %113

113:                                              ; preds = %107
  %114 = load i64, i64* %108, align 8, !tbaa !11
  %115 = icmp eq i64 %114, 0
  br i1 %115, label %234, label %116

116:                                              ; preds = %113, %138
  %117 = phi i64 [ %146, %138 ], [ %114, %113 ]
  %118 = phi %struct.Elf64_Verdef* [ %143, %138 ], [ null, %113 ]
  %119 = phi i16* [ %142, %138 ], [ null, %113 ]
  %120 = phi i32* [ %141, %138 ], [ null, %113 ]
  %121 = phi %struct.Elf64_Sym* [ %140, %138 ], [ null, %113 ]
  %122 = phi i8* [ %139, %138 ], [ null, %113 ]
  %123 = phi i64 [ %144, %138 ], [ 0, %113 ]
  %124 = or i64 %123, 1
  %125 = getelementptr inbounds i64, i64* %108, i64 %124
  %126 = load i64, i64* %125, align 8, !tbaa !11
  %127 = add i64 %126, %109
  switch i64 %117, label %138 [
    i64 5, label %128
    i64 6, label %130
    i64 4, label %132
    i64 1879048176, label %134
    i64 1879048188, label %136
  ]

128:                                              ; preds = %116
  %129 = inttoptr i64 %127 to i8*
  br label %138

130:                                              ; preds = %116
  %131 = inttoptr i64 %127 to %struct.Elf64_Sym*
  br label %138

132:                                              ; preds = %116
  %133 = inttoptr i64 %127 to i32*
  br label %138

134:                                              ; preds = %116
  %135 = inttoptr i64 %127 to i16*
  br label %138

136:                                              ; preds = %116
  %137 = inttoptr i64 %127 to %struct.Elf64_Verdef*
  br label %138

138:                                              ; preds = %116, %136, %134, %132, %130, %128
  %139 = phi i8* [ %122, %116 ], [ %122, %136 ], [ %122, %134 ], [ %122, %132 ], [ %122, %130 ], [ %129, %128 ]
  %140 = phi %struct.Elf64_Sym* [ %121, %116 ], [ %121, %136 ], [ %121, %134 ], [ %121, %132 ], [ %131, %130 ], [ %121, %128 ]
  %141 = phi i32* [ %120, %116 ], [ %120, %136 ], [ %120, %134 ], [ %133, %132 ], [ %120, %130 ], [ %120, %128 ]
  %142 = phi i16* [ %119, %116 ], [ %119, %136 ], [ %135, %134 ], [ %119, %132 ], [ %119, %130 ], [ %119, %128 ]
  %143 = phi %struct.Elf64_Verdef* [ %118, %116 ], [ %137, %136 ], [ %118, %134 ], [ %118, %132 ], [ %118, %130 ], [ %118, %128 ]
  %144 = add i64 %123, 2
  %145 = getelementptr inbounds i64, i64* %108, i64 %144
  %146 = load i64, i64* %145, align 8, !tbaa !11
  %147 = icmp eq i64 %146, 0
  br i1 %147, label %148, label %116

148:                                              ; preds = %138
  %149 = icmp ne i8* %139, null
  %150 = icmp ne %struct.Elf64_Sym* %140, null
  %151 = select i1 %149, i1 %150, i1 false
  %152 = icmp ne i32* %141, null
  %153 = select i1 %151, i1 %152, i1 false
  br i1 %153, label %154, label %234

154:                                              ; preds = %148
  %155 = icmp eq %struct.Elf64_Verdef* %143, null
  %156 = select i1 %155, i16* null, i16* %142
  %157 = getelementptr inbounds i32, i32* %141, i64 1
  %158 = load i32, i32* %157, align 4, !tbaa !21
  %159 = icmp eq i32 %158, 0
  br i1 %159, label %234, label %160

160:                                              ; preds = %154
  %161 = icmp eq i16* %156, null
  br label %162

162:                                              ; preds = %160, %229
  %163 = phi i64 [ 0, %160 ], [ %230, %229 ]
  %164 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %140, i64 %163, i32 1
  %165 = load i8, i8* %164, align 4, !tbaa !22
  %166 = zext i8 %165 to i32
  %167 = and i32 %166, 15
  %168 = shl nuw nsw i32 1, %167
  %169 = and i32 %168, 39
  %170 = icmp eq i32 %169, 0
  br i1 %170, label %229, label %171

171:                                              ; preds = %162
  %172 = lshr i32 %166, 4
  %173 = shl nuw nsw i32 1, %172
  %174 = and i32 %173, 1030
  %175 = icmp eq i32 %174, 0
  br i1 %175, label %229, label %176

176:                                              ; preds = %171
  %177 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %140, i64 %163, i32 3
  %178 = load i16, i16* %177, align 2, !tbaa !24
  %179 = icmp eq i16 %178, 0
  br i1 %179, label %229, label %180

180:                                              ; preds = %176
  %181 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %140, i64 %163, i32 0
  %182 = load i32, i32* %181, align 8, !tbaa !25
  %183 = zext i32 %182 to i64
  %184 = getelementptr inbounds i8, i8* %139, i64 %183
  %185 = tail call i32 @strcmp(i8* noundef %1, i8* noundef nonnull %184) #2
  %186 = icmp eq i32 %185, 0
  br i1 %186, label %187, label %229

187:                                              ; preds = %180
  br i1 %161, label %224, label %188

188:                                              ; preds = %187
  %189 = getelementptr inbounds i16, i16* %156, i64 %163
  %190 = load i16, i16* %189, align 2, !tbaa !26
  br label %191

191:                                              ; preds = %207, %188
  %192 = phi %struct.Elf64_Verdef* [ %143, %188 ], [ %211, %207 ]
  %193 = getelementptr inbounds %struct.Elf64_Verdef, %struct.Elf64_Verdef* %192, i64 0, i32 1
  %194 = load i16, i16* %193, align 2, !tbaa !27
  %195 = and i16 %194, 1
  %196 = icmp eq i16 %195, 0
  br i1 %196, label %197, label %203

197:                                              ; preds = %191
  %198 = getelementptr inbounds %struct.Elf64_Verdef, %struct.Elf64_Verdef* %192, i64 0, i32 2
  %199 = load i16, i16* %198, align 4, !tbaa !29
  %200 = xor i16 %199, %190
  %201 = and i16 %200, 32767
  %202 = icmp eq i16 %201, 0
  br i1 %202, label %212, label %203

203:                                              ; preds = %197, %191
  %204 = getelementptr inbounds %struct.Elf64_Verdef, %struct.Elf64_Verdef* %192, i64 0, i32 6
  %205 = load i32, i32* %204, align 4, !tbaa !30
  %206 = icmp eq i32 %205, 0
  br i1 %206, label %229, label %207

207:                                              ; preds = %203
  %208 = bitcast %struct.Elf64_Verdef* %192 to i8*
  %209 = zext i32 %205 to i64
  %210 = getelementptr inbounds i8, i8* %208, i64 %209
  %211 = bitcast i8* %210 to %struct.Elf64_Verdef*
  br label %191

212:                                              ; preds = %197
  %213 = bitcast %struct.Elf64_Verdef* %192 to i8*
  %214 = getelementptr inbounds %struct.Elf64_Verdef, %struct.Elf64_Verdef* %192, i64 0, i32 5
  %215 = load i32, i32* %214, align 4, !tbaa !31
  %216 = zext i32 %215 to i64
  %217 = getelementptr inbounds i8, i8* %213, i64 %216
  %218 = bitcast i8* %217 to i32*
  %219 = load i32, i32* %218, align 4, !tbaa !32
  %220 = zext i32 %219 to i64
  %221 = getelementptr inbounds i8, i8* %139, i64 %220
  %222 = tail call i32 @strcmp(i8* noundef %0, i8* noundef nonnull %221) #2
  %223 = icmp eq i32 %222, 0
  br i1 %223, label %224, label %229

224:                                              ; preds = %212, %187
  %225 = getelementptr inbounds %struct.Elf64_Sym, %struct.Elf64_Sym* %140, i64 %163, i32 4
  %226 = load i64, i64* %225, align 8, !tbaa !34
  %227 = add i64 %226, %109
  %228 = inttoptr i64 %227 to i8*
  br label %234

229:                                              ; preds = %203, %212, %180, %176, %171, %162
  %230 = add nuw nsw i64 %163, 1
  %231 = load i32, i32* %157, align 4, !tbaa !21
  %232 = zext i32 %231 to i64
  %233 = icmp ult i64 %230, %232
  br i1 %233, label %162, label %234

234:                                              ; preds = %4, %229, %113, %15, %154, %107, %148, %224, %10
  %235 = phi i8* [ null, %10 ], [ null, %107 ], [ %228, %224 ], [ null, %148 ], [ null, %154 ], [ null, %15 ], [ null, %113 ], [ null, %229 ], [ null, %4 ]
  ret i8* %235
}

declare i32 @strcmp(i8* noundef, i8* noundef) local_unnamed_addr #1

attributes #0 = { nounwind strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !8, i64 8}
!4 = !{!"__libc", !5, i64 0, !5, i64 1, !5, i64 2, !5, i64 3, !7, i64 4, !8, i64 8, !8, i64 16, !9, i64 24, !9, i64 32, !9, i64 40, !9, i64 48, !10, i64 56}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!"int", !5, i64 0}
!8 = !{!"any pointer", !5, i64 0}
!9 = !{!"long", !5, i64 0}
!10 = !{!"__locale_struct", !5, i64 0}
!11 = !{!9, !9, i64 0}
!12 = !{!13, !14, i64 56}
!13 = !{!"", !5, i64 0, !14, i64 16, !14, i64 18, !7, i64 20, !9, i64 24, !9, i64 32, !9, i64 40, !7, i64 48, !14, i64 52, !14, i64 54, !14, i64 56, !14, i64 58, !14, i64 60, !14, i64 62}
!14 = !{!"short", !5, i64 0}
!15 = !{!13, !9, i64 32}
!16 = !{!13, !14, i64 54}
!17 = !{!18, !7, i64 0}
!18 = !{!"", !7, i64 0, !7, i64 4, !9, i64 8, !9, i64 16, !9, i64 24, !9, i64 32, !9, i64 40, !9, i64 48}
!19 = !{!18, !9, i64 8}
!20 = !{!18, !9, i64 16}
!21 = !{!7, !7, i64 0}
!22 = !{!23, !5, i64 4}
!23 = !{!"", !7, i64 0, !5, i64 4, !5, i64 5, !14, i64 6, !9, i64 8, !9, i64 16}
!24 = !{!23, !14, i64 6}
!25 = !{!23, !7, i64 0}
!26 = !{!14, !14, i64 0}
!27 = !{!28, !14, i64 2}
!28 = !{!"", !14, i64 0, !14, i64 2, !14, i64 4, !14, i64 6, !7, i64 8, !7, i64 12, !7, i64 16}
!29 = !{!28, !14, i64 4}
!30 = !{!28, !7, i64 16}
!31 = !{!28, !7, i64 12}
!32 = !{!33, !7, i64 0}
!33 = !{!"", !7, i64 0, !7, i64 4}
!34 = !{!23, !9, i64 8}
