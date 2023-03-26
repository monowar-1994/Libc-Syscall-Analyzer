; ModuleID = 'src/misc/wordexp.c'
source_filename = "src/misc/wordexp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.wordexp_t = type { i64, i8**, i64 }
%struct.__sigset_t = type { [16 x i64] }
%struct._IO_FILE = type opaque

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"2>/dev/null\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"/bin/sh\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"sh\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"-c\00", align 1
@.str.5 = private unnamed_addr constant [30 x i8] c"eval \22printf %s\\\\\\\\0 x $1 $2\22\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"r\00", align 1

; Function Attrs: nounwind optsize strictfp
define i32 @wordexp(i8* noalias noundef %0, %struct.wordexp_t* noalias nocapture noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = alloca i8*, align 8
  %5 = alloca [1 x i64], align 8
  %6 = alloca i8*, align 8
  %7 = alloca [1 x i64], align 8
  %8 = alloca [2 x i32], align 4
  %9 = alloca %struct.__sigset_t, align 8
  %10 = alloca i32, align 4
  %11 = bitcast i32* %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %11) #5
  %12 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %10) #6
  %13 = bitcast [2 x i32]* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %13) #5
  %14 = bitcast %struct.__sigset_t* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %14) #5
  %15 = and i32 %2, 8
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %18, label %17

17:                                               ; preds = %3
  call void @wordfree(%struct.wordexp_t* noundef %1) #6
  br label %18

18:                                               ; preds = %17, %3
  %19 = and i32 %2, 4
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %84, label %21

21:                                               ; preds = %18
  %22 = load i8, i8* %0, align 1, !tbaa !3
  %23 = icmp eq i8 %22, 0
  br i1 %23, label %84, label %24

24:                                               ; preds = %21, %75
  %25 = phi i8 [ %82, %75 ], [ %22, %21 ]
  %26 = phi i64 [ %80, %75 ], [ 0, %21 ]
  %27 = phi i32 [ %78, %75 ], [ 0, %21 ]
  %28 = phi i32 [ %77, %75 ], [ 0, %21 ]
  %29 = phi i64 [ %76, %75 ], [ 0, %21 ]
  %30 = sext i8 %25 to i32
  switch i32 %30, label %75 [
    i32 92, label %31
    i32 39, label %38
    i32 34, label %42
    i32 40, label %46
    i32 41, label %50
    i32 10, label %54
    i32 124, label %54
    i32 38, label %54
    i32 59, label %54
    i32 60, label %54
    i32 62, label %54
    i32 123, label %54
    i32 125, label %54
    i32 36, label %59
    i32 96, label %73
  ]

31:                                               ; preds = %24
  %32 = icmp eq i32 %27, 0
  br i1 %32, label %33, label %75

33:                                               ; preds = %31
  %34 = add i64 %26, 1
  %35 = getelementptr inbounds i8, i8* %0, i64 %34
  %36 = load i8, i8* %35, align 1, !tbaa !3
  %37 = icmp eq i8 %36, 0
  br i1 %37, label %233, label %75

38:                                               ; preds = %24
  %39 = icmp eq i32 %28, 0
  %40 = zext i1 %39 to i32
  %41 = xor i32 %27, %40
  br label %75

42:                                               ; preds = %24
  %43 = icmp eq i32 %27, 0
  %44 = zext i1 %43 to i32
  %45 = xor i32 %28, %44
  br label %75

46:                                               ; preds = %24
  %47 = icmp eq i64 %29, 0
  br i1 %47, label %54, label %48

48:                                               ; preds = %46
  %49 = add i64 %29, 1
  br label %75

50:                                               ; preds = %24
  %51 = icmp eq i64 %29, 0
  br i1 %51, label %54, label %52

52:                                               ; preds = %50
  %53 = add i64 %29, -1
  br label %75

54:                                               ; preds = %50, %46, %24, %24, %24, %24, %24, %24, %24, %24
  %55 = or i32 %28, %27
  %56 = sext i32 %55 to i64
  %57 = or i64 %29, %56
  %58 = icmp eq i64 %57, 0
  br i1 %58, label %233, label %75

59:                                               ; preds = %24
  %60 = icmp eq i32 %27, 0
  br i1 %60, label %61, label %75

61:                                               ; preds = %59
  %62 = add i64 %26, 1
  %63 = getelementptr inbounds i8, i8* %0, i64 %62
  %64 = load i8, i8* %63, align 1, !tbaa !3
  %65 = icmp eq i8 %64, 40
  br i1 %65, label %66, label %75

66:                                               ; preds = %61
  %67 = add i64 %26, 2
  %68 = getelementptr inbounds i8, i8* %0, i64 %67
  %69 = load i8, i8* %68, align 1, !tbaa !3
  %70 = icmp eq i8 %69, 40
  br i1 %70, label %71, label %233

71:                                               ; preds = %66
  %72 = add i64 %29, 2
  br label %75

73:                                               ; preds = %24
  %74 = icmp eq i32 %27, 0
  br i1 %74, label %233, label %75

75:                                               ; preds = %73, %71, %61, %59, %54, %52, %48, %42, %38, %33, %31, %24
  %76 = phi i64 [ %29, %24 ], [ %29, %73 ], [ %29, %59 ], [ %72, %71 ], [ %29, %54 ], [ %53, %52 ], [ %49, %48 ], [ %29, %31 ], [ %29, %33 ], [ %29, %38 ], [ %29, %42 ], [ %29, %61 ]
  %77 = phi i32 [ %28, %24 ], [ %28, %73 ], [ %28, %59 ], [ %28, %71 ], [ %28, %54 ], [ %28, %52 ], [ %28, %48 ], [ %28, %31 ], [ %28, %33 ], [ %28, %38 ], [ %45, %42 ], [ %28, %61 ]
  %78 = phi i32 [ %27, %24 ], [ %27, %73 ], [ %27, %59 ], [ 0, %71 ], [ %27, %54 ], [ %27, %52 ], [ %27, %48 ], [ %27, %31 ], [ 0, %33 ], [ %41, %38 ], [ %27, %42 ], [ 0, %61 ]
  %79 = phi i64 [ %26, %24 ], [ %26, %73 ], [ %26, %59 ], [ %67, %71 ], [ %26, %54 ], [ %26, %52 ], [ %26, %48 ], [ %26, %31 ], [ %34, %33 ], [ %26, %38 ], [ %26, %42 ], [ %26, %61 ]
  %80 = add i64 %79, 1
  %81 = getelementptr inbounds i8, i8* %0, i64 %80
  %82 = load i8, i8* %81, align 1, !tbaa !3
  %83 = icmp eq i8 %82, 0
  br i1 %83, label %84, label %24

84:                                               ; preds = %75, %21, %18
  %85 = and i32 %2, 2
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %92, label %87

87:                                               ; preds = %84
  %88 = getelementptr inbounds %struct.wordexp_t, %struct.wordexp_t* %1, i64 0, i32 0
  %89 = load i64, i64* %88, align 8, !tbaa !6
  %90 = getelementptr inbounds %struct.wordexp_t, %struct.wordexp_t* %1, i64 0, i32 1
  %91 = load i8**, i8*** %90, align 8, !tbaa !10
  br label %92

92:                                               ; preds = %87, %84
  %93 = phi i64 [ %89, %87 ], [ 0, %84 ]
  %94 = phi i8** [ %91, %87 ], [ null, %84 ]
  %95 = and i32 %2, 1
  %96 = icmp eq i32 %95, 0
  %97 = getelementptr inbounds %struct.wordexp_t, %struct.wordexp_t* %1, i64 0, i32 2
  br i1 %96, label %103, label %98

98:                                               ; preds = %92
  %99 = load i64, i64* %97, align 8, !tbaa !11
  %100 = icmp ugt i64 %99, 576460752303423487
  br i1 %100, label %229, label %101

101:                                              ; preds = %98
  %102 = add i64 %99, %93
  br label %104

103:                                              ; preds = %92
  store i64 0, i64* %97, align 8, !tbaa !11
  br label %104

104:                                              ; preds = %103, %101
  %105 = phi i64 [ %99, %101 ], [ 0, %103 ]
  %106 = phi i64 [ %102, %101 ], [ %93, %103 ]
  %107 = getelementptr inbounds [2 x i32], [2 x i32]* %8, i64 0, i64 0
  %108 = call i32 @pipe2(i32* noundef nonnull %107, i32 noundef 524288) #6
  %109 = icmp slt i32 %108, 0
  br i1 %109, label %229, label %110

110:                                              ; preds = %104
  call void @__block_all_sigs(i8* noundef nonnull %14) #6
  %111 = call i32 @fork() #6
  call void @__restore_sigs(i8* noundef nonnull %14) #6
  %112 = icmp slt i32 %111, 0
  br i1 %112, label %113, label %119

113:                                              ; preds = %110
  %114 = load i32, i32* %107, align 4, !tbaa !12
  %115 = call i32 @close(i32 noundef %114) #6
  %116 = getelementptr inbounds [2 x i32], [2 x i32]* %8, i64 0, i64 1
  %117 = load i32, i32* %116, align 4, !tbaa !12
  %118 = call i32 @close(i32 noundef %117) #6
  br label %229

119:                                              ; preds = %110
  %120 = icmp eq i32 %111, 0
  %121 = getelementptr inbounds [2 x i32], [2 x i32]* %8, i64 0, i64 1
  %122 = load i32, i32* %121, align 4, !tbaa !12
  br i1 %120, label %123, label %134

123:                                              ; preds = %119
  %124 = icmp eq i32 %122, 1
  br i1 %124, label %125, label %127

125:                                              ; preds = %123
  %126 = call i32 (i32, i32, ...) @fcntl(i32 noundef 1, i32 noundef 2, i32 noundef 0) #6
  br label %129

127:                                              ; preds = %123
  %128 = call i32 @dup2(i32 noundef %122, i32 noundef 1) #6
  br label %129

129:                                              ; preds = %127, %125
  %130 = and i32 %2, 16
  %131 = icmp eq i32 %130, 0
  %132 = select i1 %131, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i64 0, i64 0)
  %133 = call i32 (i8*, i8*, ...) @execl(i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0), i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([30 x i8], [30 x i8]* @.str.5, i64 0, i64 0), i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0), i8* noundef %0, i8* noundef %132, i8* noundef null) #6
  call void @_exit(i32 noundef 1) #7
  unreachable

134:                                              ; preds = %119
  %135 = call i32 @close(i32 noundef %122) #6
  %136 = load i32, i32* %107, align 4, !tbaa !12
  %137 = call %struct._IO_FILE* @fdopen(i32 noundef %136, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i64 0, i64 0)) #6
  %138 = icmp eq %struct._IO_FILE* %137, null
  br i1 %138, label %139, label %143

139:                                              ; preds = %134
  %140 = load i32, i32* %107, align 4, !tbaa !12
  %141 = call i32 @close(i32 noundef %140) #6
  %142 = call i32 @kill(i32 noundef %111, i32 noundef 9) #6
  call fastcc void @reap(i32 noundef %111) #6
  br label %229

143:                                              ; preds = %134
  %144 = bitcast [1 x i64]* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %144) #8
  %145 = bitcast i8** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %145) #5
  store i8* null, i8** %6, align 8, !tbaa !14
  %146 = getelementptr inbounds [1 x i64], [1 x i64]* %7, i64 0, i64 0
  store i64 0, i64* %146, align 8, !tbaa !15
  %147 = call i64 @getdelim(i8** noundef nonnull %6, i64* noundef nonnull %146, i32 noundef 0, %struct._IO_FILE* noundef nonnull %137) #6
  %148 = icmp slt i64 %147, 0
  %149 = load i8*, i8** %6, align 8
  %150 = select i1 %148, i8* null, i8* %149
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %145) #5
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %144) #8
  call void @free(i8* noundef %150) #6
  %151 = call i32 @feof(%struct._IO_FILE* noundef nonnull %137) #6
  %152 = icmp eq i32 %151, 0
  br i1 %152, label %153, label %166

153:                                              ; preds = %143
  %154 = bitcast [1 x i64]* %5 to i8*
  %155 = bitcast i8** %4 to i8*
  %156 = getelementptr inbounds [1 x i64], [1 x i64]* %5, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %154) #8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %155) #5
  store i8* null, i8** %4, align 8, !tbaa !14
  store i64 0, i64* %156, align 8, !tbaa !15
  %157 = call i64 @getdelim(i8** noundef nonnull %4, i64* noundef nonnull %156, i32 noundef 0, %struct._IO_FILE* noundef nonnull %137) #6
  %158 = icmp slt i64 %157, 0
  %159 = load i8*, i8** %4, align 8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %155) #5
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %154) #8
  %160 = icmp eq i8* %159, null
  %161 = select i1 %158, i1 true, i1 %160
  br i1 %161, label %195, label %162

162:                                              ; preds = %153
  %163 = icmp eq i8** %94, null
  %164 = add i64 %106, 1
  %165 = select i1 %163, i64 0, i64 %164
  br label %168

166:                                              ; preds = %143
  %167 = call i32 @fclose(%struct._IO_FILE* noundef nonnull %137) #6
  call fastcc void @reap(i32 noundef %111) #6
  br label %233

168:                                              ; preds = %185, %162
  %169 = phi i8* [ %192, %185 ], [ %159, %162 ]
  %170 = phi i8** [ %187, %185 ], [ %94, %162 ]
  %171 = phi i64 [ %173, %185 ], [ %106, %162 ]
  %172 = phi i64 [ %186, %185 ], [ %165, %162 ]
  %173 = add i64 %171, 1
  %174 = icmp ult i64 %173, %172
  br i1 %174, label %185, label %175

175:                                              ; preds = %168
  %176 = lshr i64 %172, 1
  %177 = add i64 %172, 10
  %178 = add i64 %177, %176
  %179 = bitcast i8** %170 to i8*
  %180 = shl i64 %178, 3
  %181 = call i8* @realloc(i8* noundef %179, i64 noundef %180) #6
  %182 = icmp eq i8* %181, null
  br i1 %182, label %195, label %183

183:                                              ; preds = %175
  %184 = bitcast i8* %181 to i8**
  br label %185

185:                                              ; preds = %183, %168
  %186 = phi i64 [ %178, %183 ], [ %172, %168 ]
  %187 = phi i8** [ %184, %183 ], [ %170, %168 ]
  %188 = getelementptr inbounds i8*, i8** %187, i64 %171
  store i8* %169, i8** %188, align 8, !tbaa !14
  %189 = getelementptr inbounds i8*, i8** %187, i64 %173
  store i8* null, i8** %189, align 8, !tbaa !14
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %154) #8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %155) #5
  store i8* null, i8** %4, align 8, !tbaa !14
  store i64 0, i64* %156, align 8, !tbaa !15
  %190 = call i64 @getdelim(i8** noundef nonnull %4, i64* noundef nonnull %156, i32 noundef 0, %struct._IO_FILE* noundef nonnull %137) #6
  %191 = icmp slt i64 %190, 0
  %192 = load i8*, i8** %4, align 8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %155) #5
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %154) #8
  %193 = icmp eq i8* %192, null
  %194 = select i1 %191, i1 true, i1 %193
  br i1 %194, label %195, label %168

195:                                              ; preds = %185, %175, %153
  %196 = phi i64 [ %106, %153 ], [ %173, %185 ], [ %171, %175 ]
  %197 = phi i8** [ %94, %153 ], [ %187, %185 ], [ %170, %175 ]
  %198 = call i32 @feof(%struct._IO_FILE* noundef nonnull %137) #6
  %199 = icmp eq i32 %198, 0
  %200 = zext i1 %199 to i32
  %201 = call i32 @fclose(%struct._IO_FILE* noundef nonnull %137) #6
  call fastcc void @reap(i32 noundef %111) #6
  %202 = icmp eq i8** %197, null
  br i1 %202, label %203, label %207

203:                                              ; preds = %195
  %204 = add i64 %196, 1
  %205 = call i8* @calloc(i64 noundef %204, i64 noundef 8) #6
  %206 = bitcast i8* %205 to i8**
  br label %207

207:                                              ; preds = %203, %195
  %208 = phi i8** [ %197, %195 ], [ %206, %203 ]
  %209 = getelementptr inbounds %struct.wordexp_t, %struct.wordexp_t* %1, i64 0, i32 1
  store i8** %208, i8*** %209, align 8, !tbaa !10
  %210 = getelementptr inbounds %struct.wordexp_t, %struct.wordexp_t* %1, i64 0, i32 0
  store i64 %196, i64* %210, align 8, !tbaa !6
  br i1 %96, label %233, label %211

211:                                              ; preds = %207
  %212 = icmp eq i8** %208, null
  br i1 %212, label %226, label %213

213:                                              ; preds = %211
  %214 = icmp eq i64 %105, 0
  br i1 %214, label %226, label %215

215:                                              ; preds = %213
  %216 = add i64 %105, -1
  %217 = getelementptr inbounds i8*, i8** %208, i64 %216
  store i8* null, i8** %217, align 8, !tbaa !14
  %218 = icmp eq i64 %216, 0
  br i1 %218, label %226, label %219

219:                                              ; preds = %215
  %220 = load i8**, i8*** %209, align 8, !tbaa !10
  br label %221

221:                                              ; preds = %219, %221
  %222 = phi i64 [ %216, %219 ], [ %223, %221 ]
  %223 = add i64 %222, -1
  %224 = getelementptr inbounds i8*, i8** %220, i64 %223
  store i8* null, i8** %224, align 8, !tbaa !14
  %225 = icmp eq i64 %223, 0
  br i1 %225, label %226, label %221

226:                                              ; preds = %221, %215, %213, %211
  %227 = phi i64 [ 0, %213 ], [ %105, %211 ], [ 1, %215 ], [ %105, %221 ]
  %228 = sub i64 %196, %227
  store i64 %228, i64* %210, align 8, !tbaa !6
  br label %233

229:                                              ; preds = %139, %113, %104, %98
  br i1 %86, label %230, label %233

230:                                              ; preds = %229
  %231 = getelementptr inbounds %struct.wordexp_t, %struct.wordexp_t* %1, i64 0, i32 0
  store i64 0, i64* %231, align 8, !tbaa !6
  %232 = getelementptr inbounds %struct.wordexp_t, %struct.wordexp_t* %1, i64 0, i32 1
  store i8** null, i8*** %232, align 8, !tbaa !10
  br label %233

233:                                              ; preds = %33, %54, %66, %73, %166, %207, %226, %229, %230
  %234 = phi i32 [ 5, %166 ], [ %200, %226 ], [ %200, %207 ], [ 1, %230 ], [ 1, %229 ], [ 5, %33 ], [ 2, %54 ], [ 4, %73 ], [ 4, %66 ]
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %14) #5
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %13) #5
  %235 = load i32, i32* %10, align 4, !tbaa !12
  %236 = call i32 @pthread_setcancelstate(i32 noundef %235, i32* noundef null) #6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %11) #5
  ret i32 %234
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define void @wordfree(%struct.wordexp_t* nocapture noundef %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.wordexp_t, %struct.wordexp_t* %0, i64 0, i32 1
  %3 = load i8**, i8*** %2, align 8, !tbaa !10
  %4 = icmp eq i8** %3, null
  br i1 %4, label %32, label %5

5:                                                ; preds = %1
  %6 = bitcast i8** %3 to i8*
  %7 = getelementptr inbounds %struct.wordexp_t, %struct.wordexp_t* %0, i64 0, i32 0
  %8 = load i64, i64* %7, align 8, !tbaa !6
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %30, label %10

10:                                               ; preds = %5
  %11 = getelementptr inbounds %struct.wordexp_t, %struct.wordexp_t* %0, i64 0, i32 2
  %12 = load i64, i64* %11, align 8, !tbaa !11
  %13 = getelementptr inbounds i8*, i8** %3, i64 %12
  %14 = load i8*, i8** %13, align 8, !tbaa !14
  tail call void @free(i8* noundef %14) #6
  %15 = load i64, i64* %7, align 8, !tbaa !6
  %16 = icmp ugt i64 %15, 1
  br i1 %16, label %17, label %27

17:                                               ; preds = %10, %17
  %18 = phi i64 [ %24, %17 ], [ 1, %10 ]
  %19 = load i8**, i8*** %2, align 8, !tbaa !10
  %20 = load i64, i64* %11, align 8, !tbaa !11
  %21 = add i64 %20, %18
  %22 = getelementptr inbounds i8*, i8** %19, i64 %21
  %23 = load i8*, i8** %22, align 8, !tbaa !14
  tail call void @free(i8* noundef %23) #6
  %24 = add nuw i64 %18, 1
  %25 = load i64, i64* %7, align 8, !tbaa !6
  %26 = icmp ult i64 %24, %25
  br i1 %26, label %17, label %27

27:                                               ; preds = %17, %10
  %28 = bitcast i8*** %2 to i8**
  %29 = load i8*, i8** %28, align 8, !tbaa !10
  br label %30

30:                                               ; preds = %5, %27
  %31 = phi i8* [ %29, %27 ], [ %6, %5 ]
  tail call void @free(i8* noundef %31) #6
  store i8** null, i8*** %2, align 8, !tbaa !10
  store i64 0, i64* %7, align 8, !tbaa !6
  br label %32

32:                                               ; preds = %1, %30
  ret void
}

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @pipe2(i32* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__block_all_sigs(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @fork() local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__restore_sigs(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @close(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @fcntl(i32 noundef, i32 noundef, ...) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @dup2(i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @execl(i8* noundef, i8* noundef, ...) local_unnamed_addr #2

; Function Attrs: noreturn optsize
declare void @_exit(i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare %struct._IO_FILE* @fdopen(i32 noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @kill(i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @reap(i32 noundef %0) unnamed_addr #0 {
  %2 = alloca i32, align 4
  %3 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #5
  br label %4

4:                                                ; preds = %7, %1
  %5 = call i32 @waitpid(i32 noundef %0, i32* noundef nonnull %2, i32 noundef 0) #6
  %6 = icmp slt i32 %5, 0
  br i1 %6, label %7, label %11

7:                                                ; preds = %4
  %8 = tail call i32* @___errno_location() #9
  %9 = load i32, i32* %8, align 4, !tbaa !12
  %10 = icmp eq i32 %9, 4
  br i1 %10, label %4, label %11

11:                                               ; preds = %4, %7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #5
  ret void
}

; Function Attrs: optsize
declare i32 @feof(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @fclose(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @realloc(i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @waitpid(i32 noundef, i32* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #4

; Function Attrs: optsize
declare i64 @getdelim(i8** noundef, i64* noundef, i32 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #7 = { nobuiltin noreturn nounwind optsize strictfp "no-builtins" }
attributes #8 = { nounwind }
attributes #9 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !8, i64 0}
!7 = !{!"", !8, i64 0, !9, i64 8, !8, i64 16}
!8 = !{!"long", !4, i64 0}
!9 = !{!"any pointer", !4, i64 0}
!10 = !{!7, !9, i64 8}
!11 = !{!7, !8, i64 16}
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !4, i64 0}
!14 = !{!9, !9, i64 0}
!15 = !{!8, !8, i64 0}
