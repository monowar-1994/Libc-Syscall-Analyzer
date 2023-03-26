; ModuleID = 'src/regex/glob.c'
source_filename = "src/regex/glob.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.glob_t = type { i64, i8**, i64, i32, [5 x i8*] }
%struct.passwd = type { i8*, i8*, i32, i32, i8*, i8*, i8* }
%struct.match = type { %struct.match*, [0 x i8] }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct.__dirstream = type opaque
%struct.dirent = type { i64, i64, i16, i8, [256 x i8] }

@.str = private unnamed_addr constant [5 x i8] c"HOME\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

@glob64 = weak alias i32 (i8*, i32, i32 (i8*, i32)*, %struct.glob_t*), i32 (i8*, i32, i32 (i8*, i32)*, %struct.glob_t*)* @glob
@globfree64 = weak alias void (%struct.glob_t*), void (%struct.glob_t*)* @globfree

; Function Attrs: nounwind optsize strictfp
define i32 @glob(i8* noalias noundef %0, i32 noundef %1, i32 (i8*, i32)* noundef readonly %2, %struct.glob_t* noalias nocapture noundef %3) #0 {
  %5 = alloca %struct.passwd, align 8
  %6 = alloca %struct.passwd*, align 8
  %7 = alloca %struct.match, align 8
  %8 = alloca %struct.match*, align 8
  %9 = alloca [4096 x i8], align 16
  %10 = bitcast %struct.match* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %10) #5
  %11 = bitcast %struct.match* %7 to i64*
  store i64 0, i64* %11, align 8
  %12 = bitcast %struct.match** %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %12) #5
  store %struct.match* %7, %struct.match** %8, align 8, !tbaa !3
  %13 = and i32 %1, 8
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %18, label %15

15:                                               ; preds = %4
  %16 = getelementptr inbounds %struct.glob_t, %struct.glob_t* %3, i64 0, i32 2
  %17 = load i64, i64* %16, align 8, !tbaa !7
  br label %18

18:                                               ; preds = %4, %15
  %19 = phi i64 [ %17, %15 ], [ 0, %4 ]
  %20 = getelementptr inbounds [4096 x i8], [4096 x i8]* %9, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %20) #5
  %21 = icmp eq i32 (i8*, i32)* %2, null
  %22 = select i1 %21, i32 (i8*, i32)* @ignore_err, i32 (i8*, i32)* %2
  %23 = and i32 %1, 32
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %29

25:                                               ; preds = %18
  %26 = getelementptr inbounds %struct.glob_t, %struct.glob_t* %3, i64 0, i32 2
  store i64 %19, i64* %26, align 8, !tbaa !7
  %27 = getelementptr inbounds %struct.glob_t, %struct.glob_t* %3, i64 0, i32 0
  store i64 0, i64* %27, align 8, !tbaa !11
  %28 = getelementptr inbounds %struct.glob_t, %struct.glob_t* %3, i64 0, i32 1
  store i8** null, i8*** %28, align 8, !tbaa !12
  br label %29

29:                                               ; preds = %25, %18
  %30 = load i8, i8* %0, align 1, !tbaa !13
  %31 = icmp eq i8 %30, 0
  br i1 %31, label %129, label %32

32:                                               ; preds = %29
  %33 = call i8* @strdup(i8* noundef nonnull %0) #6
  %34 = icmp eq i8* %33, null
  br i1 %34, label %225, label %35

35:                                               ; preds = %32
  store i8 0, i8* %20, align 16, !tbaa !13
  %36 = and i32 %1, 20480
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %102, label %38

38:                                               ; preds = %35
  %39 = load i8, i8* %33, align 1, !tbaa !13
  %40 = icmp eq i8 %39, 126
  br i1 %40, label %41, label %102

41:                                               ; preds = %38
  %42 = getelementptr inbounds i8, i8* %33, i64 1
  %43 = call i8* @__strchrnul(i8* noundef nonnull %42, i32 noundef 47) #6
  %44 = load i8, i8* %43, align 1, !tbaa !13
  %45 = icmp eq i8 %44, 0
  br i1 %45, label %48, label %46

46:                                               ; preds = %41
  %47 = getelementptr inbounds i8, i8* %43, i64 1
  store i8 0, i8* %43, align 1, !tbaa !13
  br label %48

48:                                               ; preds = %46, %41
  %49 = phi i8* [ %47, %46 ], [ %43, %41 ]
  %50 = load i8, i8* %42, align 1, !tbaa !13
  %51 = icmp eq i8 %50, 0
  br i1 %51, label %55, label %52

52:                                               ; preds = %48
  %53 = bitcast %struct.passwd* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %53) #5
  %54 = bitcast %struct.passwd** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %54) #5
  br label %63

55:                                               ; preds = %48
  %56 = call i8* @getenv(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)) #6
  %57 = icmp eq i8* %56, null
  br i1 %57, label %58, label %81

58:                                               ; preds = %55
  %59 = load i8, i8* %42, align 1, !tbaa !13
  %60 = bitcast %struct.passwd* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %60) #5
  %61 = bitcast %struct.passwd** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %61) #5
  %62 = icmp eq i8 %59, 0
  br i1 %62, label %65, label %63

63:                                               ; preds = %58, %52
  %64 = call i32 @getpwnam_r(i8* noundef nonnull %42, %struct.passwd* noundef nonnull %5, i8* noundef nonnull %20, i64 noundef 4096, %struct.passwd** noundef nonnull %6) #6
  br label %68

65:                                               ; preds = %58
  %66 = call i32 @getuid() #6
  %67 = call i32 @getpwuid_r(i32 noundef %66, %struct.passwd* noundef nonnull %5, i8* noundef nonnull %20, i64 noundef 4096, %struct.passwd** noundef nonnull %6) #6
  br label %68

68:                                               ; preds = %65, %63
  %69 = phi i32 [ %64, %63 ], [ %67, %65 ]
  %70 = bitcast %struct.passwd* %5 to i8*
  %71 = bitcast %struct.passwd** %6 to i8*
  switch i32 %69, label %75 [
    i32 12, label %76
    i32 0, label %72
  ]

72:                                               ; preds = %68
  %73 = load %struct.passwd*, %struct.passwd** %6, align 8, !tbaa !3
  %74 = icmp eq %struct.passwd* %73, null
  br i1 %74, label %75, label %78

75:                                               ; preds = %72, %68
  br label %76

76:                                               ; preds = %68, %75
  %77 = phi i32 [ 1, %68 ], [ 3, %75 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %71) #5
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %70) #5
  br label %106

78:                                               ; preds = %72
  %79 = getelementptr inbounds %struct.passwd, %struct.passwd* %5, i64 0, i32 5
  %80 = load i8*, i8** %79, align 8, !tbaa !14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %71) #5
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %70) #5
  br label %81

81:                                               ; preds = %78, %55
  %82 = phi i8* [ %80, %78 ], [ %56, %55 ]
  br label %83

83:                                               ; preds = %81, %88
  %84 = phi i8* [ %89, %88 ], [ %82, %81 ]
  %85 = phi i64 [ %90, %88 ], [ 0, %81 ]
  %86 = load i8, i8* %84, align 1, !tbaa !13
  %87 = icmp eq i8 %86, 0
  br i1 %87, label %96, label %88

88:                                               ; preds = %83
  %89 = getelementptr inbounds i8, i8* %84, i64 1
  %90 = add nuw nsw i64 %85, 1
  %91 = getelementptr inbounds [4096 x i8], [4096 x i8]* %9, i64 0, i64 %85
  store i8 %86, i8* %91, align 1, !tbaa !13
  %92 = icmp eq i64 %90, 4094
  br i1 %92, label %93, label %83

93:                                               ; preds = %88
  %94 = load i8, i8* %89, align 1, !tbaa !13
  %95 = icmp eq i8 %94, 0
  br i1 %95, label %96, label %106

96:                                               ; preds = %83, %93
  %97 = phi i64 [ 4094, %93 ], [ %85, %83 ]
  %98 = getelementptr inbounds [4096 x i8], [4096 x i8]* %9, i64 0, i64 %97
  store i8 %44, i8* %98, align 1, !tbaa !13
  br i1 %45, label %102, label %99

99:                                               ; preds = %96
  %100 = add nuw i64 %97, 1
  %101 = getelementptr inbounds [4096 x i8], [4096 x i8]* %9, i64 0, i64 %100
  store i8 0, i8* %101, align 1, !tbaa !13
  br label %102

102:                                              ; preds = %38, %35, %99, %96
  %103 = phi i64 [ %97, %96 ], [ %100, %99 ], [ 0, %38 ], [ 0, %35 ]
  %104 = phi i8* [ %49, %96 ], [ %49, %99 ], [ %33, %38 ], [ %33, %35 ]
  %105 = call fastcc i32 @do_glob(i8* noundef nonnull %20, i64 noundef %103, i32 noundef 0, i8* noundef %104, i32 noundef %1, i32 (i8*, i32)* noundef %22, %struct.match** noundef nonnull %8) #7
  br label %106

106:                                              ; preds = %93, %102, %76
  %107 = phi i32 [ %77, %76 ], [ %105, %102 ], [ 3, %93 ]
  call void @free(i8* noundef nonnull %33) #6
  %108 = icmp eq i32 %107, 1
  %109 = getelementptr inbounds %struct.match, %struct.match* %7, i64 0, i32 0
  %110 = load %struct.match*, %struct.match** %109, align 8, !tbaa !3
  %111 = icmp eq %struct.match* %110, null
  br i1 %108, label %112, label %119

112:                                              ; preds = %106
  br i1 %111, label %225, label %113

113:                                              ; preds = %112, %113
  %114 = phi %struct.match* [ %116, %113 ], [ %110, %112 ]
  %115 = getelementptr inbounds %struct.match, %struct.match* %114, i64 0, i32 0
  %116 = load %struct.match*, %struct.match** %115, align 8, !tbaa !3
  %117 = bitcast %struct.match* %114 to i8*
  call void @free(i8* noundef nonnull %117) #6
  %118 = icmp eq %struct.match* %116, null
  br i1 %118, label %225, label %113

119:                                              ; preds = %106
  br i1 %111, label %129, label %120

120:                                              ; preds = %119, %120
  %121 = phi i64 [ %125, %120 ], [ 0, %119 ]
  %122 = phi %struct.match* [ %124, %120 ], [ %110, %119 ]
  %123 = getelementptr inbounds %struct.match, %struct.match* %122, i64 0, i32 0
  %124 = load %struct.match*, %struct.match** %123, align 8, !tbaa !3
  %125 = add i64 %121, 1
  %126 = icmp eq %struct.match* %124, null
  br i1 %126, label %127, label %120

127:                                              ; preds = %120
  store %struct.match* null, %struct.match** %8, align 8, !tbaa !3
  %128 = icmp eq i64 %125, 0
  br i1 %128, label %129, label %137

129:                                              ; preds = %29, %119, %127
  %130 = phi i32 [ %107, %127 ], [ %107, %119 ], [ 0, %29 ]
  %131 = and i32 %1, 16
  %132 = icmp eq i32 %131, 0
  br i1 %132, label %225, label %133

133:                                              ; preds = %129
  store %struct.match* %7, %struct.match** %8, align 8, !tbaa !3
  %134 = call i64 @strlen(i8* noundef nonnull %0) #6
  %135 = call fastcc i32 @append(%struct.match** noundef nonnull %8, i8* noundef nonnull %0, i64 noundef %134, i32 noundef 0) #7
  %136 = icmp eq i32 %135, 0
  br i1 %136, label %137, label %225

137:                                              ; preds = %133, %127
  %138 = phi i32 [ %107, %127 ], [ %130, %133 ]
  %139 = phi i64 [ %125, %127 ], [ 1, %133 ]
  %140 = getelementptr inbounds %struct.match, %struct.match* %7, i64 0, i32 0
  br i1 %24, label %164, label %141

141:                                              ; preds = %137
  %142 = getelementptr inbounds %struct.glob_t, %struct.glob_t* %3, i64 0, i32 1
  %143 = bitcast i8*** %142 to i8**
  %144 = load i8*, i8** %143, align 8, !tbaa !12
  %145 = getelementptr inbounds %struct.glob_t, %struct.glob_t* %3, i64 0, i32 0
  %146 = load i64, i64* %145, align 8, !tbaa !11
  %147 = add i64 %146, %19
  %148 = add i64 %147, %139
  %149 = shl i64 %148, 3
  %150 = add i64 %149, 8
  %151 = call i8* @realloc(i8* noundef %144, i64 noundef %150) #6
  %152 = icmp eq i8* %151, null
  br i1 %152, label %153, label %162

153:                                              ; preds = %141
  %154 = load %struct.match*, %struct.match** %140, align 8, !tbaa !3
  %155 = icmp eq %struct.match* %154, null
  br i1 %155, label %225, label %156

156:                                              ; preds = %153, %156
  %157 = phi %struct.match* [ %159, %156 ], [ %154, %153 ]
  %158 = getelementptr inbounds %struct.match, %struct.match* %157, i64 0, i32 0
  %159 = load %struct.match*, %struct.match** %158, align 8, !tbaa !3
  %160 = bitcast %struct.match* %157 to i8*
  call void @free(i8* noundef nonnull %160) #6
  %161 = icmp eq %struct.match* %159, null
  br i1 %161, label %225, label %156

162:                                              ; preds = %141
  store i8* %151, i8** %143, align 8, !tbaa !12
  %163 = bitcast i8* %151 to i8**
  br label %189

164:                                              ; preds = %137
  %165 = add i64 %139, %19
  %166 = shl i64 %165, 3
  %167 = add i64 %166, 8
  %168 = call i8* @malloc(i64 noundef %167) #6
  %169 = getelementptr inbounds %struct.glob_t, %struct.glob_t* %3, i64 0, i32 1
  %170 = bitcast i8*** %169 to i8**
  store i8* %168, i8** %170, align 8, !tbaa !12
  %171 = icmp eq i8* %168, null
  %172 = bitcast i8* %168 to i8**
  br i1 %171, label %175, label %173

173:                                              ; preds = %164
  %174 = icmp eq i64 %19, 0
  br i1 %174, label %189, label %184

175:                                              ; preds = %164
  %176 = load %struct.match*, %struct.match** %140, align 8, !tbaa !3
  %177 = icmp eq %struct.match* %176, null
  br i1 %177, label %225, label %178

178:                                              ; preds = %175, %178
  %179 = phi %struct.match* [ %181, %178 ], [ %176, %175 ]
  %180 = getelementptr inbounds %struct.match, %struct.match* %179, i64 0, i32 0
  %181 = load %struct.match*, %struct.match** %180, align 8, !tbaa !3
  %182 = bitcast %struct.match* %179 to i8*
  call void @free(i8* noundef nonnull %182) #6
  %183 = icmp eq %struct.match* %181, null
  br i1 %183, label %225, label %178

184:                                              ; preds = %173, %184
  %185 = phi i64 [ %187, %184 ], [ 0, %173 ]
  %186 = getelementptr inbounds i8*, i8** %172, i64 %185
  store i8* null, i8** %186, align 8, !tbaa !3
  %187 = add nuw i64 %185, 1
  %188 = icmp eq i64 %187, %19
  br i1 %188, label %193, label %184

189:                                              ; preds = %173, %162
  %190 = phi i8** [ %172, %173 ], [ %163, %162 ]
  %191 = phi i64 [ 0, %173 ], [ %147, %162 ]
  %192 = load %struct.match*, %struct.match** %140, align 8, !tbaa !3
  store %struct.match* %192, %struct.match** %8, align 8, !tbaa !3
  br label %196

193:                                              ; preds = %184
  %194 = load %struct.match*, %struct.match** %140, align 8, !tbaa !3
  store %struct.match* %194, %struct.match** %8, align 8, !tbaa !3
  %195 = icmp eq i64 %139, 0
  br i1 %195, label %210, label %196

196:                                              ; preds = %189, %193
  %197 = phi %struct.match* [ %192, %189 ], [ %194, %193 ]
  %198 = phi i64 [ %191, %189 ], [ %19, %193 ]
  %199 = phi i8** [ %190, %189 ], [ %172, %193 ]
  br label %200

200:                                              ; preds = %196, %200
  %201 = phi i64 [ 0, %196 ], [ %208, %200 ]
  %202 = phi %struct.match* [ %197, %196 ], [ %207, %200 ]
  %203 = getelementptr inbounds %struct.match, %struct.match* %202, i64 0, i32 1, i64 0
  %204 = add i64 %201, %198
  %205 = getelementptr inbounds i8*, i8** %199, i64 %204
  store i8* %203, i8** %205, align 8, !tbaa !3
  %206 = getelementptr inbounds %struct.match, %struct.match* %202, i64 0, i32 0
  %207 = load %struct.match*, %struct.match** %206, align 8, !tbaa !3
  %208 = add nuw i64 %201, 1
  %209 = icmp eq i64 %208, %139
  br i1 %209, label %210, label %200

210:                                              ; preds = %200, %193
  %211 = phi i64 [ %19, %193 ], [ %198, %200 ]
  %212 = phi i8** [ %172, %193 ], [ %199, %200 ]
  %213 = phi %struct.match* [ %194, %193 ], [ %207, %200 ]
  %214 = phi i64 [ 0, %193 ], [ %139, %200 ]
  store %struct.match* %213, %struct.match** %8, align 8, !tbaa !3
  %215 = add i64 %214, %211
  %216 = getelementptr inbounds i8*, i8** %212, i64 %215
  store i8* null, i8** %216, align 8, !tbaa !3
  %217 = getelementptr inbounds %struct.glob_t, %struct.glob_t* %3, i64 0, i32 0
  %218 = load i64, i64* %217, align 8, !tbaa !11
  %219 = add i64 %218, %139
  store i64 %219, i64* %217, align 8, !tbaa !11
  %220 = and i32 %1, 4
  %221 = icmp eq i32 %220, 0
  br i1 %221, label %222, label %225

222:                                              ; preds = %210
  %223 = getelementptr inbounds i8*, i8** %212, i64 %211
  %224 = bitcast i8** %223 to i8*
  call void @qsort(i8* noundef %224, i64 noundef %139, i64 noundef 8, i32 (i8*, i8*)* noundef nonnull @sort) #6
  br label %225

225:                                              ; preds = %113, %156, %178, %153, %32, %175, %112, %210, %222, %129, %133
  %226 = phi i32 [ 1, %133 ], [ 3, %129 ], [ %138, %222 ], [ %138, %210 ], [ 1, %112 ], [ 1, %175 ], [ 1, %32 ], [ 1, %153 ], [ 1, %178 ], [ 1, %156 ], [ 1, %113 ]
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %20) #5
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %12) #5
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %10) #5
  ret i32 %226
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal i32 @ignore_err(i8* nocapture noundef readnone %0, i32 noundef %1) #2 {
  ret i32 0
}

; Function Attrs: optsize
declare i8* @strdup(i8* noundef) local_unnamed_addr #3

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @do_glob(i8* noundef %0, i64 noundef %1, i32 noundef %2, i8* noundef %3, i32 noundef %4, i32 (i8*, i32)* nocapture noundef readonly %5, %struct.match** nocapture noundef %6) unnamed_addr #0 {
  %8 = alloca %struct.stat, align 8
  %9 = icmp eq i32 %2, 0
  %10 = and i32 %4, 2
  %11 = shl nuw nsw i32 %10, 2
  %12 = xor i32 %11, 8
  %13 = select i1 %9, i32 %12, i32 %2
  %14 = load i8, i8* %3, align 1, !tbaa !13
  %15 = icmp ne i8 %14, 0
  %16 = icmp ne i32 %13, 4
  %17 = and i1 %16, %15
  %18 = select i1 %17, i32 0, i32 %13
  %19 = add i64 %1, 1
  %20 = icmp ult i64 %19, 4096
  %21 = icmp eq i8 %14, 47
  %22 = select i1 %20, i1 %21, i1 false
  br i1 %22, label %23, label %34

23:                                               ; preds = %7, %31
  %24 = phi i8* [ %27, %31 ], [ %3, %7 ]
  %25 = phi i64 [ %26, %31 ], [ %1, %7 ]
  %26 = phi i64 [ %29, %31 ], [ %19, %7 ]
  %27 = getelementptr inbounds i8, i8* %24, i64 1
  %28 = getelementptr inbounds i8, i8* %0, i64 %25
  store i8 47, i8* %28, align 1, !tbaa !13
  %29 = add i64 %26, 1
  %30 = icmp eq i64 %29, 4096
  br i1 %30, label %34, label %31

31:                                               ; preds = %23
  %32 = load i8, i8* %27, align 1, !tbaa !13
  %33 = icmp eq i8 %32, 47
  br i1 %33, label %23, label %34

34:                                               ; preds = %23, %31, %7
  %35 = phi i8* [ %3, %7 ], [ %27, %31 ], [ %27, %23 ]
  %36 = phi i64 [ %1, %7 ], [ %26, %31 ], [ 4095, %23 ]
  %37 = and i32 %4, 64
  %38 = icmp eq i32 %37, 0
  br label %39

39:                                               ; preds = %107, %34
  %40 = phi i32 [ 0, %34 ], [ %112, %107 ]
  %41 = phi i32 [ 0, %34 ], [ %111, %107 ]
  %42 = phi i64 [ 0, %34 ], [ %113, %107 ]
  %43 = phi i64 [ 0, %34 ], [ %114, %107 ]
  %44 = phi i8* [ %35, %34 ], [ %109, %107 ]
  %45 = phi i32 [ %18, %34 ], [ 0, %107 ]
  %46 = phi i64 [ %36, %34 ], [ %108, %107 ]
  %47 = getelementptr inbounds i8, i8* %44, i64 %43
  %48 = load i8, i8* %47, align 1, !tbaa !13
  switch i8 %48, label %49 [
    i8 42, label %115
    i8 63, label %115
  ]

49:                                               ; preds = %39
  %50 = icmp eq i32 %41, 0
  %51 = xor i1 %50, true
  %52 = icmp eq i8 %48, 93
  %53 = select i1 %51, i1 %52, i1 false
  br i1 %53, label %115, label %54

54:                                               ; preds = %49
  switch i8 %48, label %70 [
    i8 0, label %55
    i8 91, label %82
    i8 92, label %60
  ]

55:                                               ; preds = %54
  %56 = icmp eq i32 %40, 0
  br i1 %56, label %57, label %277

57:                                               ; preds = %55
  %58 = getelementptr inbounds i8, i8* %44, i64 %43
  %59 = add i64 %46, %42
  br label %115

60:                                               ; preds = %54
  br i1 %38, label %61, label %76

61:                                               ; preds = %60
  %62 = add nsw i64 %43, 1
  %63 = getelementptr inbounds i8, i8* %44, i64 %62
  %64 = load i8, i8* %63, align 1, !tbaa !13
  %65 = xor i1 %50, true
  %66 = icmp eq i8 %64, 93
  %67 = select i1 %65, i1 %66, i1 false
  br i1 %67, label %115, label %68

68:                                               ; preds = %61
  %69 = icmp eq i8 %64, 0
  br i1 %69, label %277, label %70

70:                                               ; preds = %54, %68
  %71 = phi i8 [ %64, %68 ], [ %48, %54 ]
  %72 = phi i64 [ %62, %68 ], [ %43, %54 ]
  %73 = icmp eq i8 %71, 47
  br i1 %73, label %74, label %76

74:                                               ; preds = %70
  %75 = icmp eq i32 %40, 0
  br i1 %75, label %86, label %277

76:                                               ; preds = %60, %70
  %77 = phi i64 [ %72, %70 ], [ %43, %60 ]
  %78 = phi i8 [ %71, %70 ], [ 92, %60 ]
  %79 = add nsw i64 %42, 1
  %80 = add i64 %46, %79
  %81 = icmp ult i64 %80, 4096
  br i1 %81, label %95, label %105

82:                                               ; preds = %54
  %83 = add nsw i64 %42, 1
  %84 = add i64 %46, %83
  %85 = icmp ult i64 %84, 4096
  br i1 %85, label %95, label %107

86:                                               ; preds = %74
  %87 = add nsw i64 %42, 1
  %88 = add i64 %87, %46
  %89 = icmp ult i64 %88, 4096
  br i1 %89, label %90, label %277

90:                                               ; preds = %86
  %91 = add nsw i64 %72, 1
  %92 = getelementptr inbounds i8, i8* %44, i64 %91
  %93 = getelementptr inbounds i8, i8* %44, i64 %72
  %94 = load i8, i8* %93, align 1, !tbaa !13
  br label %95

95:                                               ; preds = %82, %90, %76
  %96 = phi i8 [ %94, %90 ], [ %78, %76 ], [ 91, %82 ]
  %97 = phi i64 [ 0, %90 ], [ %79, %76 ], [ %83, %82 ]
  %98 = phi i64 [ %88, %90 ], [ %46, %76 ], [ %46, %82 ]
  %99 = phi i8* [ %92, %90 ], [ %44, %76 ], [ %44, %82 ]
  %100 = phi i64 [ -1, %90 ], [ %77, %76 ], [ %43, %82 ]
  %101 = phi i64 [ -1, %90 ], [ %42, %76 ], [ %42, %82 ]
  %102 = phi i32 [ 0, %90 ], [ %41, %76 ], [ 1, %82 ]
  %103 = add i64 %101, %98
  %104 = getelementptr inbounds i8, i8* %0, i64 %103
  store i8 %96, i8* %104, align 1, !tbaa !13
  br label %107

105:                                              ; preds = %76
  %106 = icmp eq i32 %41, 0
  br i1 %106, label %277, label %107

107:                                              ; preds = %82, %105, %95
  %108 = phi i64 [ %98, %95 ], [ %46, %105 ], [ %46, %82 ]
  %109 = phi i8* [ %99, %95 ], [ %44, %105 ], [ %44, %82 ]
  %110 = phi i64 [ %100, %95 ], [ %77, %105 ], [ %43, %82 ]
  %111 = phi i32 [ %102, %95 ], [ %41, %105 ], [ 1, %82 ]
  %112 = phi i32 [ %40, %95 ], [ 1, %105 ], [ 1, %82 ]
  %113 = phi i64 [ %97, %95 ], [ %42, %105 ], [ %42, %82 ]
  %114 = add nsw i64 %110, 1
  br label %39

115:                                              ; preds = %49, %39, %39, %61, %57
  %116 = phi i8* [ %58, %57 ], [ %44, %61 ], [ %44, %39 ], [ %44, %39 ], [ %44, %49 ]
  %117 = phi i64 [ %59, %57 ], [ %46, %61 ], [ %46, %39 ], [ %46, %39 ], [ %46, %49 ]
  %118 = getelementptr inbounds i8, i8* %0, i64 %117
  store i8 0, i8* %118, align 1, !tbaa !13
  %119 = load i8, i8* %116, align 1, !tbaa !13
  %120 = icmp eq i8 %119, 0
  br i1 %120, label %121, label %159

121:                                              ; preds = %115
  %122 = bitcast %struct.stat* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %122) #5
  %123 = icmp ne i32 %10, 0
  br i1 %123, label %124, label %134

124:                                              ; preds = %121
  switch i32 %45, label %149 [
    i32 10, label %125
    i32 0, label %125
  ]

125:                                              ; preds = %124, %124
  %126 = call i32 @stat(i8* noundef nonnull %0, %struct.stat* noundef nonnull %8) #6
  %127 = icmp eq i32 %126, 0
  br i1 %127, label %128, label %134

128:                                              ; preds = %125
  %129 = getelementptr inbounds %struct.stat, %struct.stat* %8, i64 0, i32 3
  %130 = load i32, i32* %129, align 8, !tbaa !16
  %131 = and i32 %130, 61440
  %132 = icmp eq i32 %131, 16384
  %133 = select i1 %132, i32 4, i32 8
  br label %149

134:                                              ; preds = %125, %121
  %135 = icmp eq i32 %45, 0
  br i1 %135, label %136, label %149

136:                                              ; preds = %134
  %137 = call i32 @lstat(i8* noundef nonnull %0, %struct.stat* noundef nonnull %8) #6
  %138 = icmp eq i32 %137, 0
  br i1 %138, label %149, label %139

139:                                              ; preds = %136
  %140 = tail call i32* @___errno_location() #8
  %141 = load i32, i32* %140, align 4, !tbaa !19
  %142 = icmp eq i32 %141, 2
  br i1 %142, label %148, label %143

143:                                              ; preds = %139
  %144 = call i32 %5(i8* noundef nonnull %0, i32 noundef %141) #6
  %145 = and i32 %4, 1
  %146 = or i32 %144, %145
  %147 = icmp eq i32 %146, 0
  br i1 %147, label %148, label %157

148:                                              ; preds = %143, %139
  br label %157

149:                                              ; preds = %128, %124, %136, %134
  %150 = phi i32 [ 0, %136 ], [ %45, %134 ], [ %133, %128 ], [ %45, %124 ]
  %151 = icmp eq i32 %150, 4
  %152 = select i1 %123, i1 %151, i1 false
  %153 = zext i1 %152 to i32
  %154 = call fastcc i32 @append(%struct.match** noundef %6, i8* noundef nonnull %0, i64 noundef %117, i32 noundef %153) #7
  %155 = icmp ne i32 %154, 0
  %156 = zext i1 %155 to i32
  br label %157

157:                                              ; preds = %149, %143, %148
  %158 = phi i32 [ 0, %148 ], [ 2, %143 ], [ %156, %149 ]
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %122) #5
  br label %277

159:                                              ; preds = %115
  %160 = tail call i8* @strchr(i8* noundef nonnull %116, i32 noundef 47) #6
  %161 = icmp ne i8* %160, null
  %162 = and i1 %38, %161
  br i1 %162, label %163, label %180

163:                                              ; preds = %159, %166
  %164 = phi i8* [ %167, %166 ], [ %160, %159 ]
  %165 = icmp ugt i8* %164, %116
  br i1 %165, label %166, label %170

166:                                              ; preds = %163
  %167 = getelementptr inbounds i8, i8* %164, i64 -1
  %168 = load i8, i8* %167, align 1, !tbaa !13
  %169 = icmp eq i8 %168, 92
  br i1 %169, label %163, label %170

170:                                              ; preds = %163, %166
  %171 = ptrtoint i8* %160 to i64
  %172 = ptrtoint i8* %164 to i64
  %173 = sub i64 %171, %172
  %174 = and i64 %173, 1
  %175 = icmp eq i64 %174, 0
  %176 = xor i1 %175, true
  %177 = sext i1 %176 to i64
  %178 = getelementptr i8, i8* %160, i64 %177
  %179 = select i1 %175, i8 47, i8 92
  br label %180

180:                                              ; preds = %159, %170
  %181 = phi i8* [ %178, %170 ], [ %160, %159 ]
  %182 = phi i8 [ %179, %170 ], [ 47, %159 ]
  %183 = icmp eq i64 %117, 0
  %184 = select i1 %183, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0), i8* %0
  %185 = tail call %struct.__dirstream* @opendir(i8* noundef %184) #6
  %186 = icmp eq %struct.__dirstream* %185, null
  %187 = tail call i32* @___errno_location() #8
  %188 = load i32, i32* %187, align 4, !tbaa !19
  br i1 %186, label %189, label %195

189:                                              ; preds = %180
  %190 = tail call i32 %5(i8* noundef %0, i32 noundef %188) #6
  %191 = and i32 %4, 1
  %192 = or i32 %190, %191
  %193 = icmp eq i32 %192, 0
  %194 = select i1 %193, i32 0, i32 2
  br label %277

195:                                              ; preds = %180
  store i32 0, i32* %187, align 4, !tbaa !19
  %196 = tail call %struct.dirent* @readdir(%struct.__dirstream* noundef nonnull %185) #6
  %197 = icmp eq %struct.dirent* %196, null
  br i1 %197, label %263, label %198

198:                                              ; preds = %195
  %199 = icmp eq i8* %181, null
  %200 = sub i64 4096, %117
  %201 = lshr i32 %4, 5
  %202 = and i32 %201, 2
  %203 = and i32 %4, 128
  %204 = lshr exact i32 %203, 5
  %205 = or i32 %204, %202
  %206 = xor i32 %205, 4
  %207 = icmp eq i32 %203, 0
  %208 = or i1 %207, %199
  %209 = or i32 %202, 4
  br label %210

210:                                              ; preds = %198, %215
  %211 = phi %struct.dirent* [ %196, %198 ], [ %216, %215 ]
  br i1 %199, label %222, label %212

212:                                              ; preds = %210
  %213 = getelementptr inbounds %struct.dirent, %struct.dirent* %211, i64 0, i32 3
  %214 = load i8, i8* %213, align 2, !tbaa !20
  switch i8 %214, label %215 [
    i8 0, label %218
    i8 4, label %218
    i8 10, label %218
  ]

215:                                              ; preds = %229, %218, %252, %243, %226, %222, %212
  store i32 0, i32* %187, align 4, !tbaa !19
  %216 = tail call %struct.dirent* @readdir(%struct.__dirstream* noundef nonnull %185) #6
  %217 = icmp eq %struct.dirent* %216, null
  br i1 %217, label %263, label %210

218:                                              ; preds = %212, %212, %212
  %219 = getelementptr inbounds %struct.dirent, %struct.dirent* %211, i64 0, i32 4, i64 0
  %220 = tail call i64 @strlen(i8* noundef nonnull %219) #6
  %221 = icmp ult i64 %220, %200
  br i1 %221, label %226, label %215

222:                                              ; preds = %210
  %223 = getelementptr inbounds %struct.dirent, %struct.dirent* %211, i64 0, i32 4, i64 0
  %224 = tail call i64 @strlen(i8* noundef nonnull %223) #6
  %225 = icmp ult i64 %224, %200
  br i1 %225, label %229, label %215

226:                                              ; preds = %218
  store i8 0, i8* %181, align 1, !tbaa !13
  %227 = tail call i32 @fnmatch(i8* noundef nonnull %116, i8* noundef nonnull %219, i32 noundef %206) #6
  %228 = icmp eq i32 %227, 0
  br i1 %228, label %232, label %215

229:                                              ; preds = %222
  %230 = tail call i32 @fnmatch(i8* noundef nonnull %116, i8* noundef nonnull %223, i32 noundef %206) #6
  %231 = icmp eq i32 %230, 0
  br i1 %231, label %246, label %215

232:                                              ; preds = %226
  br i1 %208, label %249, label %233

233:                                              ; preds = %232
  %234 = load i8, i8* %219, align 1, !tbaa !13
  %235 = icmp eq i8 %234, 46
  br i1 %235, label %236, label %249

236:                                              ; preds = %233
  %237 = getelementptr inbounds %struct.dirent, %struct.dirent* %211, i64 0, i32 4, i64 1
  %238 = load i8, i8* %237, align 1, !tbaa !13
  switch i8 %238, label %249 [
    i8 0, label %243
    i8 46, label %239
  ]

239:                                              ; preds = %236
  %240 = getelementptr inbounds %struct.dirent, %struct.dirent* %211, i64 0, i32 4, i64 2
  %241 = load i8, i8* %240, align 1, !tbaa !13
  %242 = icmp eq i8 %241, 0
  br i1 %242, label %243, label %249

243:                                              ; preds = %236, %239
  %244 = tail call i32 @fnmatch(i8* noundef nonnull %116, i8* noundef nonnull %219, i32 noundef %209) #6
  %245 = icmp eq i32 %244, 0
  br i1 %245, label %249, label %215

246:                                              ; preds = %229
  %247 = add nuw i64 %224, 1
  %248 = tail call i8* @memcpy(i8* noundef nonnull %118, i8* noundef nonnull %223, i64 noundef %247) #6
  br label %252

249:                                              ; preds = %236, %232, %243, %239, %233
  %250 = add nuw i64 %220, 1
  %251 = tail call i8* @memcpy(i8* noundef nonnull %118, i8* noundef nonnull %219, i64 noundef %250) #6
  store i8 %182, i8* %181, align 1, !tbaa !13
  br label %252

252:                                              ; preds = %246, %249
  %253 = phi i64 [ %220, %249 ], [ %224, %246 ]
  %254 = phi i8* [ %181, %249 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.2, i64 0, i64 0), %246 ]
  %255 = add i64 %253, %117
  %256 = getelementptr inbounds %struct.dirent, %struct.dirent* %211, i64 0, i32 3
  %257 = load i8, i8* %256, align 2, !tbaa !20
  %258 = zext i8 %257 to i32
  %259 = tail call fastcc i32 @do_glob(i8* noundef %0, i64 noundef %255, i32 noundef %258, i8* noundef nonnull %254, i32 noundef %4, i32 (i8*, i32)* noundef %5, %struct.match** noundef %6) #7
  %260 = icmp eq i32 %259, 0
  br i1 %260, label %215, label %261

261:                                              ; preds = %252
  %262 = tail call i32 @closedir(%struct.__dirstream* noundef nonnull %185) #6
  br label %277

263:                                              ; preds = %215, %195
  %264 = load i32, i32* %187, align 4, !tbaa !19
  %265 = icmp eq i8* %181, null
  br i1 %265, label %267, label %266

266:                                              ; preds = %263
  store i8 %182, i8* %181, align 1, !tbaa !13
  br label %267

267:                                              ; preds = %266, %263
  %268 = tail call i32 @closedir(%struct.__dirstream* noundef nonnull %185) #6
  %269 = icmp eq i32 %264, 0
  br i1 %269, label %276, label %270

270:                                              ; preds = %267
  %271 = load i32, i32* %187, align 4, !tbaa !19
  %272 = tail call i32 %5(i8* noundef %0, i32 noundef %271) #6
  %273 = and i32 %4, 1
  %274 = or i32 %272, %273
  %275 = icmp eq i32 %274, 0
  br i1 %275, label %276, label %277

276:                                              ; preds = %270, %267
  store i32 %188, i32* %187, align 4, !tbaa !19
  br label %277

277:                                              ; preds = %86, %105, %74, %68, %261, %189, %276, %270, %55, %157
  %278 = phi i32 [ %158, %157 ], [ 0, %55 ], [ 0, %276 ], [ 2, %270 ], [ %194, %189 ], [ %259, %261 ], [ 0, %68 ], [ 0, %74 ], [ 0, %105 ], [ 0, %86 ]
  ret i32 %278
}

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @append(%struct.match** nocapture noundef %0, i8* noundef %1, i64 noundef %2, i32 noundef %3) unnamed_addr #0 {
  %5 = add i64 %2, 10
  %6 = tail call i8* @malloc(i64 noundef %5) #6
  %7 = icmp eq i8* %6, null
  br i1 %7, label %28, label %8

8:                                                ; preds = %4
  %9 = bitcast %struct.match** %0 to i8***
  %10 = load i8**, i8*** %9, align 8, !tbaa !3
  store i8* %6, i8** %10, align 8, !tbaa !3
  %11 = bitcast i8* %6 to %struct.match**
  store %struct.match* null, %struct.match** %11, align 8, !tbaa !3
  %12 = getelementptr inbounds i8, i8* %6, i64 8
  %13 = add i64 %2, 1
  %14 = tail call i8* @memcpy(i8* noundef nonnull %12, i8* noundef %1, i64 noundef %13) #6
  %15 = icmp ne i32 %3, 0
  %16 = icmp ne i64 %2, 0
  %17 = and i1 %16, %15
  br i1 %17, label %18, label %26

18:                                               ; preds = %8
  %19 = add i64 %2, -1
  %20 = getelementptr inbounds i8, i8* %1, i64 %19
  %21 = load i8, i8* %20, align 1, !tbaa !13
  %22 = icmp eq i8 %21, 47
  br i1 %22, label %26, label %23

23:                                               ; preds = %18
  %24 = getelementptr inbounds i8, i8* %12, i64 %2
  store i8 47, i8* %24, align 1, !tbaa !13
  %25 = getelementptr inbounds i8, i8* %12, i64 %13
  store i8 0, i8* %25, align 1, !tbaa !13
  br label %26

26:                                               ; preds = %23, %18, %8
  %27 = bitcast %struct.match** %0 to i8**
  store i8* %6, i8** %27, align 8, !tbaa !3
  br label %28

28:                                               ; preds = %4, %26
  %29 = phi i32 [ 0, %26 ], [ -1, %4 ]
  ret i32 %29
}

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @realloc(i8* noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @malloc(i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare void @qsort(i8* noundef, i64 noundef, i64 noundef, i32 (i8*, i8*)* noundef) local_unnamed_addr #3

; Function Attrs: nounwind optsize strictfp
define internal i32 @sort(i8* nocapture noundef readonly %0, i8* nocapture noundef readonly %1) #0 {
  %3 = bitcast i8* %0 to i8**
  %4 = load i8*, i8** %3, align 8, !tbaa !3
  %5 = bitcast i8* %1 to i8**
  %6 = load i8*, i8** %5, align 8, !tbaa !3
  %7 = tail call i32 @strcmp(i8* noundef %4, i8* noundef %6) #6
  ret i32 %7
}

; Function Attrs: nounwind optsize strictfp
define void @globfree(%struct.glob_t* nocapture noundef %0) #0 {
  %2 = getelementptr inbounds %struct.glob_t, %struct.glob_t* %0, i64 0, i32 0
  %3 = load i64, i64* %2, align 8, !tbaa !11
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %19, label %5

5:                                                ; preds = %1
  %6 = getelementptr inbounds %struct.glob_t, %struct.glob_t* %0, i64 0, i32 1
  %7 = getelementptr inbounds %struct.glob_t, %struct.glob_t* %0, i64 0, i32 2
  br label %8

8:                                                ; preds = %5, %8
  %9 = phi i64 [ 0, %5 ], [ %16, %8 ]
  %10 = load i8**, i8*** %6, align 8, !tbaa !12
  %11 = load i64, i64* %7, align 8, !tbaa !7
  %12 = add i64 %11, %9
  %13 = getelementptr inbounds i8*, i8** %10, i64 %12
  %14 = load i8*, i8** %13, align 8, !tbaa !3
  %15 = getelementptr inbounds i8, i8* %14, i64 -8
  tail call void @free(i8* noundef nonnull %15) #6
  %16 = add nuw i64 %9, 1
  %17 = load i64, i64* %2, align 8, !tbaa !11
  %18 = icmp ult i64 %16, %17
  br i1 %18, label %8, label %19

19:                                               ; preds = %8, %1
  %20 = getelementptr inbounds %struct.glob_t, %struct.glob_t* %0, i64 0, i32 1
  %21 = bitcast i8*** %20 to i8**
  %22 = load i8*, i8** %21, align 8, !tbaa !12
  tail call void @free(i8* noundef %22) #6
  store i64 0, i64* %2, align 8, !tbaa !11
  store i8** null, i8*** %20, align 8, !tbaa !12
  ret void
}

; Function Attrs: optsize
declare hidden i8* @__strchrnul(i8* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @getenv(i8* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @getpwnam_r(i8* noundef, %struct.passwd* noundef, i8* noundef, i64 noundef, %struct.passwd** noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @getpwuid_r(i32 noundef, %struct.passwd* noundef, i8* noundef, i64 noundef, %struct.passwd** noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @getuid() local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @stat(i8* noundef, %struct.stat* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @lstat(i8* noundef, %struct.stat* noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #4

; Function Attrs: optsize
declare i8* @strchr(i8* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare %struct.__dirstream* @opendir(i8* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare %struct.dirent* @readdir(%struct.__dirstream* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @fnmatch(i8* noundef, i8* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @closedir(%struct.__dirstream* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @strcmp(i8* noundef, i8* noundef) local_unnamed_addr #3

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #7 = { nobuiltin optsize strictfp "no-builtins" }
attributes #8 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !9, i64 16}
!8 = !{!"", !9, i64 0, !4, i64 8, !9, i64 16, !10, i64 24, !5, i64 32}
!9 = !{!"long", !5, i64 0}
!10 = !{!"int", !5, i64 0}
!11 = !{!8, !9, i64 0}
!12 = !{!8, !4, i64 8}
!13 = !{!5, !5, i64 0}
!14 = !{!15, !4, i64 32}
!15 = !{!"passwd", !4, i64 0, !4, i64 8, !10, i64 16, !10, i64 20, !4, i64 24, !4, i64 32, !4, i64 40}
!16 = !{!17, !10, i64 24}
!17 = !{!"stat", !9, i64 0, !9, i64 8, !9, i64 16, !10, i64 24, !10, i64 28, !10, i64 32, !10, i64 36, !9, i64 40, !9, i64 48, !9, i64 56, !9, i64 64, !18, i64 72, !18, i64 88, !18, i64 104, !5, i64 120}
!18 = !{!"timespec", !9, i64 0, !9, i64 8}
!19 = !{!10, !10, i64 0}
!20 = !{!21, !5, i64 18}
!21 = !{!"dirent", !9, i64 0, !9, i64 8, !22, i64 16, !5, i64 18, !5, i64 19}
!22 = !{!"short", !5, i64 0}
