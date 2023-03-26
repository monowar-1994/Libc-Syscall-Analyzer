; ModuleID = 'src/misc/realpath.c'
source_filename = "src/misc/realpath.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i8* @realpath(i8* noalias noundef %0, i8* noalias noundef %1) local_unnamed_addr #0 {
  %3 = alloca [4097 x i8], align 16
  %4 = alloca [4096 x i8], align 16
  %5 = getelementptr inbounds [4097 x i8], [4097 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 4097, i8* nonnull %5) #4
  %6 = getelementptr inbounds [4096 x i8], [4096 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %6) #4
  %7 = icmp eq i8* %0, null
  br i1 %7, label %8, label %10

8:                                                ; preds = %2
  %9 = tail call i32* @___errno_location() #5
  store i32 22, i32* %9, align 4, !tbaa !3
  br label %247

10:                                               ; preds = %2
  %11 = tail call i64 @strnlen(i8* noundef nonnull %0, i64 noundef 4097) #6
  %12 = icmp eq i64 %11, 0
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = tail call i32* @___errno_location() #5
  store i32 2, i32* %14, align 4, !tbaa !3
  br label %247

15:                                               ; preds = %10
  %16 = icmp ugt i64 %11, 4095
  br i1 %16, label %245, label %17

17:                                               ; preds = %15
  %18 = sub nuw nsw i64 4096, %11
  %19 = getelementptr inbounds [4097 x i8], [4097 x i8]* %3, i64 0, i64 %18
  %20 = add nuw nsw i64 %11, 1
  %21 = call i8* @memcpy(i8* noundef nonnull %19, i8* noundef nonnull %0, i64 noundef %20) #6
  %22 = getelementptr inbounds [4096 x i8], [4096 x i8]* %4, i64 0, i64 1
  br label %23

23:                                               ; preds = %157, %17
  %24 = phi i64 [ 0, %17 ], [ %30, %157 ]
  %25 = phi i64 [ 0, %17 ], [ %142, %157 ]
  %26 = phi i64 [ 0, %17 ], [ %31, %157 ]
  %27 = phi i32 [ 0, %17 ], [ %32, %157 ]
  %28 = phi i64 [ %18, %17 ], [ %159, %157 ]
  br label %29

29:                                               ; preds = %173, %23
  %30 = phi i64 [ %24, %23 ], [ %163, %173 ]
  %31 = phi i64 [ %26, %23 ], [ %164, %173 ]
  %32 = phi i32 [ %27, %23 ], [ %165, %173 ]
  %33 = phi i64 [ %28, %23 ], [ %177, %173 ]
  %34 = getelementptr inbounds [4097 x i8], [4097 x i8]* %3, i64 0, i64 %33
  %35 = load i8, i8* %34, align 1, !tbaa !7
  %36 = icmp eq i8 %35, 47
  br i1 %36, label %37, label %48

37:                                               ; preds = %29
  store i8 47, i8* %6, align 16, !tbaa !7
  %38 = add i64 %33, 1
  %39 = getelementptr inbounds [4097 x i8], [4097 x i8]* %3, i64 0, i64 %38
  %40 = load i8, i8* %39, align 1, !tbaa !7
  %41 = icmp eq i8 %40, 47
  br i1 %41, label %42, label %162

42:                                               ; preds = %37
  %43 = add i64 %33, 2
  %44 = getelementptr inbounds [4097 x i8], [4097 x i8]* %3, i64 0, i64 %43
  %45 = load i8, i8* %44, align 1, !tbaa !7
  %46 = icmp eq i8 %45, 47
  br i1 %46, label %162, label %47

47:                                               ; preds = %42
  store i8 47, i8* %22, align 1, !tbaa !7
  br label %162

48:                                               ; preds = %29
  %49 = call i8* @__strchrnul(i8* noundef nonnull %34, i32 noundef 47) #6
  %50 = ptrtoint i8* %49 to i64
  %51 = ptrtoint i8* %34 to i64
  %52 = sub i64 %50, %51
  %53 = icmp ne i64 %52, 0
  %54 = icmp ne i32 %32, 0
  %55 = select i1 %53, i1 true, i1 %54
  br i1 %55, label %56, label %178

56:                                               ; preds = %48
  %57 = icmp eq i64 %52, 1
  br i1 %57, label %58, label %63

58:                                               ; preds = %56
  %59 = load i8, i8* %34, align 1, !tbaa !7
  %60 = icmp eq i8 %59, 46
  br i1 %60, label %61, label %63

61:                                               ; preds = %58
  %62 = add i64 %33, 1
  br label %162

63:                                               ; preds = %58, %56
  %64 = icmp eq i64 %30, 0
  br i1 %64, label %76, label %65

65:                                               ; preds = %63
  %66 = add i64 %30, -1
  %67 = getelementptr inbounds [4096 x i8], [4096 x i8]* %4, i64 0, i64 %66
  %68 = load i8, i8* %67, align 1, !tbaa !7
  %69 = icmp eq i8 %68, 47
  br i1 %69, label %76, label %70

70:                                               ; preds = %65
  %71 = icmp eq i64 %33, 0
  br i1 %71, label %245, label %72

72:                                               ; preds = %70
  %73 = add i64 %33, -1
  %74 = getelementptr inbounds [4097 x i8], [4097 x i8]* %3, i64 0, i64 %73
  store i8 47, i8* %74, align 1, !tbaa !7
  %75 = add i64 %52, 1
  br label %76

76:                                               ; preds = %72, %65, %63
  %77 = phi i64 [ %75, %72 ], [ %52, %65 ], [ %52, %63 ]
  %78 = phi i64 [ %73, %72 ], [ %33, %65 ], [ %33, %63 ]
  %79 = add i64 %77, %30
  %80 = icmp ugt i64 %79, 4095
  br i1 %80, label %245, label %81

81:                                               ; preds = %76
  %82 = getelementptr inbounds [4096 x i8], [4096 x i8]* %4, i64 0, i64 %30
  %83 = getelementptr inbounds [4097 x i8], [4097 x i8]* %3, i64 0, i64 %78
  %84 = call i8* @memcpy(i8* noundef nonnull %82, i8* noundef nonnull %83, i64 noundef %77) #6
  %85 = getelementptr inbounds [4096 x i8], [4096 x i8]* %4, i64 0, i64 %79
  store i8 0, i8* %85, align 1, !tbaa !7
  %86 = add i64 %78, %77
  %87 = icmp eq i64 %52, 2
  br i1 %87, label %88, label %104

88:                                               ; preds = %81
  %89 = add i64 %86, -2
  %90 = getelementptr inbounds [4097 x i8], [4097 x i8]* %3, i64 0, i64 %89
  %91 = load i8, i8* %90, align 1, !tbaa !7
  %92 = icmp eq i8 %91, 46
  br i1 %92, label %93, label %104

93:                                               ; preds = %88
  %94 = add i64 %86, -1
  %95 = getelementptr inbounds [4097 x i8], [4097 x i8]* %3, i64 0, i64 %94
  %96 = load i8, i8* %95, align 1, !tbaa !7
  %97 = icmp eq i8 %96, 46
  br i1 %97, label %98, label %104

98:                                               ; preds = %93
  %99 = mul i64 %31, 3
  %100 = icmp ugt i64 %30, %99
  br i1 %100, label %103, label %101

101:                                              ; preds = %98
  %102 = add i64 %31, 1
  br label %162

103:                                              ; preds = %98
  br i1 %54, label %104, label %119

104:                                              ; preds = %103, %93, %88, %81
  %105 = phi i1 [ false, %103 ], [ true, %93 ], [ true, %88 ], [ true, %81 ]
  %106 = call i64 @readlink(i8* noundef nonnull %6, i8* noundef nonnull %5, i64 noundef %86) #6
  %107 = icmp eq i64 %106, %86
  br i1 %107, label %245, label %108

108:                                              ; preds = %104
  %109 = icmp eq i64 %106, 0
  br i1 %109, label %110, label %112

110:                                              ; preds = %108
  %111 = tail call i32* @___errno_location() #5
  store i32 2, i32* %111, align 4, !tbaa !3
  br label %247

112:                                              ; preds = %108
  %113 = icmp slt i64 %106, 0
  br i1 %113, label %114, label %141

114:                                              ; preds = %112
  %115 = tail call i32* @___errno_location() #5
  %116 = load i32, i32* %115, align 4, !tbaa !3
  %117 = icmp eq i32 %116, 22
  br i1 %117, label %118, label %247

118:                                              ; preds = %114
  br i1 %105, label %136, label %119

119:                                              ; preds = %103, %118
  br label %120

120:                                              ; preds = %119, %123
  %121 = phi i64 [ %124, %123 ], [ %30, %119 ]
  %122 = icmp eq i64 %121, 0
  br i1 %122, label %162, label %123

123:                                              ; preds = %120
  %124 = add i64 %121, -1
  %125 = getelementptr inbounds [4096 x i8], [4096 x i8]* %4, i64 0, i64 %124
  %126 = load i8, i8* %125, align 1, !tbaa !7
  %127 = icmp eq i8 %126, 47
  br i1 %127, label %128, label %120

128:                                              ; preds = %123
  %129 = icmp ugt i64 %121, 1
  br i1 %129, label %130, label %162

130:                                              ; preds = %128
  %131 = icmp ne i64 %121, 2
  %132 = load i8, i8* %6, align 16
  %133 = icmp ne i8 %132, 47
  %134 = select i1 %131, i1 true, i1 %133
  %135 = select i1 %134, i64 %124, i64 2
  br label %162

136:                                              ; preds = %118
  %137 = select i1 %53, i64 %79, i64 %30
  %138 = getelementptr inbounds [4097 x i8], [4097 x i8]* %3, i64 0, i64 %86
  %139 = load i8, i8* %138, align 1, !tbaa !7
  %140 = sext i8 %139 to i32
  br label %162

141:                                              ; preds = %112
  %142 = add nuw nsw i64 %25, 1
  %143 = icmp eq i64 %142, 40
  br i1 %143, label %144, label %146

144:                                              ; preds = %141
  %145 = tail call i32* @___errno_location() #5
  store i32 40, i32* %145, align 4, !tbaa !3
  br label %247

146:                                              ; preds = %141
  %147 = add nsw i64 %106, -1
  %148 = getelementptr inbounds [4097 x i8], [4097 x i8]* %3, i64 0, i64 %147
  %149 = load i8, i8* %148, align 1, !tbaa !7
  %150 = icmp eq i8 %149, 47
  br i1 %150, label %151, label %157

151:                                              ; preds = %146, %151
  %152 = phi i64 [ %156, %151 ], [ %86, %146 ]
  %153 = getelementptr inbounds [4097 x i8], [4097 x i8]* %3, i64 0, i64 %152
  %154 = load i8, i8* %153, align 1, !tbaa !7
  %155 = icmp eq i8 %154, 47
  %156 = add i64 %152, 1
  br i1 %155, label %151, label %157

157:                                              ; preds = %151, %146
  %158 = phi i64 [ %86, %146 ], [ %152, %151 ]
  %159 = sub i64 %158, %106
  %160 = getelementptr inbounds [4097 x i8], [4097 x i8]* %3, i64 0, i64 %159
  %161 = call i8* @memmove(i8* noundef nonnull %160, i8* noundef nonnull %5, i64 noundef %106) #6
  br label %23

162:                                              ; preds = %120, %128, %130, %136, %101, %61, %37, %42, %47
  %163 = phi i64 [ 2, %47 ], [ 1, %42 ], [ 1, %37 ], [ %135, %130 ], [ 1, %128 ], [ %137, %136 ], [ %79, %101 ], [ %30, %61 ], [ 0, %120 ]
  %164 = phi i64 [ 0, %47 ], [ 0, %42 ], [ 0, %37 ], [ %31, %130 ], [ %31, %128 ], [ %31, %136 ], [ %102, %101 ], [ %31, %61 ], [ %31, %120 ]
  %165 = phi i32 [ 0, %47 ], [ 0, %42 ], [ 0, %37 ], [ 0, %130 ], [ 0, %128 ], [ %140, %136 ], [ %32, %101 ], [ %32, %61 ], [ 0, %120 ]
  %166 = phi i64 [ %38, %47 ], [ %38, %42 ], [ %38, %37 ], [ %86, %130 ], [ %86, %128 ], [ %86, %136 ], [ %86, %101 ], [ %62, %61 ], [ %86, %120 ]
  %167 = getelementptr inbounds [4097 x i8], [4097 x i8]* %3, i64 0, i64 %166
  br label %168

168:                                              ; preds = %168, %162
  %169 = phi i8* [ %167, %162 ], [ %172, %168 ]
  %170 = load i8, i8* %169, align 1, !tbaa !7
  %171 = icmp eq i8 %170, 47
  %172 = getelementptr inbounds i8, i8* %169, i64 1
  br i1 %171, label %168, label %173

173:                                              ; preds = %168
  %174 = ptrtoint i8* %169 to i64
  %175 = ptrtoint i8* %167 to i64
  %176 = sub i64 %166, %175
  %177 = add i64 %176, %174
  br label %29

178:                                              ; preds = %48
  %179 = getelementptr inbounds [4096 x i8], [4096 x i8]* %4, i64 0, i64 %30
  store i8 0, i8* %179, align 1, !tbaa !7
  %180 = load i8, i8* %6, align 16, !tbaa !7
  %181 = icmp eq i8 %180, 47
  br i1 %181, label %237, label %182

182:                                              ; preds = %178
  %183 = call i8* @getcwd(i8* noundef nonnull %5, i64 noundef 4097) #6
  %184 = icmp eq i8* %183, null
  br i1 %184, label %247, label %185

185:                                              ; preds = %182
  %186 = call i64 @strlen(i8* noundef nonnull %5) #6
  %187 = icmp eq i64 %31, 0
  br i1 %187, label %212, label %188

188:                                              ; preds = %185, %203
  %189 = phi i64 [ %192, %203 ], [ %31, %185 ]
  %190 = phi i64 [ %210, %203 ], [ 0, %185 ]
  %191 = phi i64 [ %206, %203 ], [ %186, %185 ]
  %192 = add i64 %189, -1
  %193 = icmp ne i64 %191, 0
  %194 = zext i1 %193 to i64
  br label %195

195:                                              ; preds = %188, %198
  %196 = phi i64 [ %199, %198 ], [ %191, %188 ]
  %197 = icmp ugt i64 %196, 1
  br i1 %197, label %198, label %203

198:                                              ; preds = %195
  %199 = add i64 %196, -1
  %200 = getelementptr inbounds [4097 x i8], [4097 x i8]* %3, i64 0, i64 %199
  %201 = load i8, i8* %200, align 1, !tbaa !7
  %202 = icmp eq i8 %201, 47
  br i1 %202, label %203, label %195

203:                                              ; preds = %195, %198
  %204 = phi i64 [ %194, %195 ], [ %196, %198 ]
  %205 = sext i1 %197 to i64
  %206 = add i64 %204, %205
  %207 = add i64 %190, 2
  %208 = icmp ult i64 %207, %30
  %209 = add i64 %190, 3
  %210 = select i1 %208, i64 %209, i64 %207
  %211 = icmp eq i64 %192, 0
  br i1 %211, label %212, label %188

212:                                              ; preds = %203, %185
  %213 = phi i64 [ %186, %185 ], [ %206, %203 ]
  %214 = phi i64 [ 0, %185 ], [ %210, %203 ]
  %215 = sub i64 %30, %214
  %216 = icmp eq i64 %215, 0
  br i1 %216, label %225, label %217

217:                                              ; preds = %212
  %218 = add i64 %213, -1
  %219 = getelementptr inbounds [4097 x i8], [4097 x i8]* %3, i64 0, i64 %218
  %220 = load i8, i8* %219, align 1, !tbaa !7
  %221 = icmp eq i8 %220, 47
  br i1 %221, label %225, label %222

222:                                              ; preds = %217
  %223 = add i64 %213, 1
  %224 = getelementptr inbounds [4097 x i8], [4097 x i8]* %3, i64 0, i64 %213
  store i8 47, i8* %224, align 1, !tbaa !7
  br label %225

225:                                              ; preds = %222, %217, %212
  %226 = phi i64 [ %223, %222 ], [ %213, %217 ], [ %213, %212 ]
  %227 = add i64 %215, -4095
  %228 = add i64 %227, %226
  %229 = icmp ult i64 %228, -4096
  br i1 %229, label %245, label %230

230:                                              ; preds = %225
  %231 = getelementptr inbounds [4096 x i8], [4096 x i8]* %4, i64 0, i64 %226
  %232 = getelementptr inbounds [4096 x i8], [4096 x i8]* %4, i64 0, i64 %214
  %233 = add i64 %215, 1
  %234 = call i8* @memmove(i8* noundef nonnull %231, i8* noundef nonnull %232, i64 noundef %233) #6
  %235 = call i8* @memcpy(i8* noundef nonnull %6, i8* noundef nonnull %5, i64 noundef %226) #6
  %236 = add i64 %215, %226
  br label %237

237:                                              ; preds = %230, %178
  %238 = phi i64 [ %236, %230 ], [ %30, %178 ]
  %239 = icmp eq i8* %1, null
  br i1 %239, label %243, label %240

240:                                              ; preds = %237
  %241 = add i64 %238, 1
  %242 = call i8* @memcpy(i8* noundef nonnull %1, i8* noundef nonnull %6, i64 noundef %241) #6
  br label %247

243:                                              ; preds = %237
  %244 = call i8* @strdup(i8* noundef nonnull %6) #6
  br label %247

245:                                              ; preds = %104, %76, %70, %225, %15
  %246 = tail call i32* @___errno_location() #5
  store i32 36, i32* %246, align 4, !tbaa !3
  br label %247

247:                                              ; preds = %114, %110, %144, %182, %245, %243, %240, %13, %8
  %248 = phi i8* [ null, %245 ], [ %242, %240 ], [ %244, %243 ], [ null, %13 ], [ null, %8 ], [ null, %182 ], [ null, %144 ], [ null, %110 ], [ null, %114 ]
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %6) #4
  call void @llvm.lifetime.end.p0i8(i64 4097, i8* nonnull %5) #4
  ret i8* %248
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @strnlen(i8* noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden i8* @__strchrnul(i8* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i64 @readlink(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @memmove(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i8* @getcwd(i8* noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @strdup(i8* noundef) local_unnamed_addr #3

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!5, !5, i64 0}
