; ModuleID = 'src/thread/sem_open.c'
source_filename = "src/thread/sem_open.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i64, %struct.sem_t*, i32 }
%struct.sem_t = type { [8 x i32] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.timespec = type { i64, i64 }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }

@lock = internal global [1 x i32] zeroinitializer, align 4
@__sem_open_lockptr = hidden local_unnamed_addr constant i32* getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0), align 8
@semtab = internal unnamed_addr global %struct.anon* null, align 8
@.str = private unnamed_addr constant [16 x i8] c"/dev/shm/tmp-%d\00", align 1

; Function Attrs: nounwind optsize strictfp
define %struct.sem_t* @sem_open(i8* noundef %0, i32 noundef %1, ...) local_unnamed_addr #0 {
  %3 = alloca [1 x %struct.__va_list_tag], align 16
  %4 = alloca i32, align 4
  %5 = alloca %struct.sem_t, align 4
  %6 = alloca [64 x i8], align 16
  %7 = alloca %struct.timespec, align 8
  %8 = alloca %struct.stat, align 8
  %9 = alloca [265 x i8], align 16
  %10 = bitcast [1 x %struct.__va_list_tag]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %10) #5
  %11 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %11) #5
  %12 = bitcast %struct.sem_t* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %12) #5
  %13 = getelementptr inbounds [64 x i8], [64 x i8]* %6, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %13) #5
  %14 = bitcast %struct.timespec* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %14) #5
  %15 = bitcast %struct.stat* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %15) #5
  %16 = getelementptr inbounds [265 x i8], [265 x i8]* %9, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 265, i8* nonnull %16) #5
  %17 = call i8* @__shm_mapname(i8* noundef %0, i8* noundef nonnull %16) #6
  %18 = icmp eq i8* %17, null
  br i1 %18, label %212, label %19

19:                                               ; preds = %2
  call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #6
  %20 = load %struct.anon*, %struct.anon** @semtab, align 8, !tbaa !3
  %21 = icmp eq %struct.anon* %20, null
  br i1 %21, label %22, label %27

22:                                               ; preds = %19
  %23 = call i8* @__libc_calloc(i64 noundef 24, i64 noundef 256) #6
  store i8* %23, i8** bitcast (%struct.anon** @semtab to i8**), align 8, !tbaa !3
  %24 = icmp eq i8* %23, null
  %25 = bitcast i8* %23 to %struct.anon*
  br i1 %24, label %26, label %27

26:                                               ; preds = %22
  call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #6
  br label %212

27:                                               ; preds = %22, %19
  %28 = phi %struct.anon* [ %25, %22 ], [ %20, %19 ]
  br label %29

29:                                               ; preds = %27, %29
  %30 = phi i64 [ 0, %27 ], [ %43, %29 ]
  %31 = phi i32 [ 0, %27 ], [ %35, %29 ]
  %32 = phi i32 [ -1, %27 ], [ %42, %29 ]
  %33 = getelementptr inbounds %struct.anon, %struct.anon* %28, i64 %30, i32 2
  %34 = load i32, i32* %33, align 8, !tbaa !7
  %35 = add nsw i32 %34, %31
  %36 = getelementptr inbounds %struct.anon, %struct.anon* %28, i64 %30, i32 1
  %37 = load %struct.sem_t*, %struct.sem_t** %36, align 8, !tbaa !11
  %38 = icmp eq %struct.sem_t* %37, null
  %39 = icmp slt i32 %32, 0
  %40 = select i1 %38, i1 %39, i1 false
  %41 = trunc i64 %30 to i32
  %42 = select i1 %40, i32 %41, i32 %32
  %43 = add nuw nsw i64 %30, 1
  %44 = icmp eq i64 %43, 256
  br i1 %44, label %45, label %29

45:                                               ; preds = %29
  %46 = icmp eq i32 %35, 2147483647
  %47 = icmp slt i32 %42, 0
  %48 = select i1 %46, i1 true, i1 %47
  br i1 %48, label %49, label %51

49:                                               ; preds = %45
  %50 = tail call i32* @___errno_location() #7
  store i32 24, i32* %50, align 4, !tbaa !12
  call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #6
  br label %212

51:                                               ; preds = %45
  %52 = zext i32 %42 to i64
  %53 = getelementptr inbounds %struct.anon, %struct.anon* %28, i64 %52, i32 1
  store %struct.sem_t* inttoptr (i64 -1 to %struct.sem_t*), %struct.sem_t** %53, align 8, !tbaa !11
  call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #6
  %54 = and i32 %1, 192
  %55 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %4) #6
  %56 = icmp eq i32 %54, 192
  br i1 %56, label %57, label %62

57:                                               ; preds = %51
  %58 = call i32 @access(i8* noundef nonnull %17, i32 noundef 0) #6
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %60, label %62

60:                                               ; preds = %57
  %61 = tail call i32* @___errno_location() #7
  store i32 17, i32* %61, align 4, !tbaa !12
  br label %207

62:                                               ; preds = %57, %51
  %63 = and i32 %1, 64
  %64 = icmp eq i32 %63, 0
  %65 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 0
  %66 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 2
  %67 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 3
  %68 = getelementptr inbounds %struct.timespec, %struct.timespec* %7, i64 0, i32 1
  br label %69

69:                                               ; preds = %141, %62
  %70 = phi i32 [ undef, %62 ], [ %130, %141 ]
  %71 = phi i1 [ false, %62 ], [ true, %141 ]
  br i1 %56, label %90, label %72

72:                                               ; preds = %69
  %73 = call i32 (i8*, i32, ...) @open(i8* noundef nonnull %17, i32 noundef 657410) #6
  %74 = icmp sgt i32 %73, -1
  br i1 %74, label %75, label %85

75:                                               ; preds = %72
  %76 = call i32 @fstat(i32 noundef %73, %struct.stat* noundef nonnull %8) #6
  %77 = icmp slt i32 %76, 0
  br i1 %77, label %81, label %78

78:                                               ; preds = %75
  %79 = call i8* @mmap(i8* noundef null, i64 noundef 32, i32 noundef 3, i32 noundef 1, i32 noundef %73, i64 noundef 0) #6
  %80 = icmp eq i8* %79, inttoptr (i64 -1 to i8*)
  br i1 %80, label %81, label %83

81:                                               ; preds = %78, %75
  %82 = call i32 @close(i32 noundef %73) #6
  br label %207

83:                                               ; preds = %78
  %84 = call i32 @close(i32 noundef %73) #6
  br label %169

85:                                               ; preds = %72
  %86 = tail call i32* @___errno_location() #7
  %87 = load i32, i32* %86, align 4, !tbaa !12
  %88 = icmp ne i32 %87, 2
  %89 = or i1 %64, %88
  br i1 %89, label %207, label %91

90:                                               ; preds = %69
  br i1 %64, label %207, label %91

91:                                               ; preds = %85, %90
  br i1 %71, label %129, label %92

92:                                               ; preds = %91
  call void @llvm.va_start(i8* nonnull %10) #8
  %93 = load i32, i32* %65, align 16
  %94 = icmp ult i32 %93, 41
  br i1 %94, label %101, label %95

95:                                               ; preds = %92
  %96 = load i8*, i8** %66, align 8
  %97 = getelementptr i8, i8* %96, i64 8
  store i8* %97, i8** %66, align 8
  %98 = bitcast i8* %96 to i32*
  %99 = load i32, i32* %98, align 4
  %100 = and i32 %99, 438
  br label %115

101:                                              ; preds = %92
  %102 = load i8*, i8** %67, align 16
  %103 = zext i32 %93 to i64
  %104 = getelementptr i8, i8* %102, i64 %103
  %105 = add nuw nsw i32 %93, 8
  store i32 %105, i32* %65, align 16
  %106 = bitcast i8* %104 to i32*
  %107 = load i32, i32* %106, align 4
  %108 = and i32 %107, 438
  %109 = icmp ult i32 %93, 33
  br i1 %109, label %110, label %115

110:                                              ; preds = %101
  %111 = load i8*, i8** %67, align 16
  %112 = zext i32 %105 to i64
  %113 = getelementptr i8, i8* %111, i64 %112
  %114 = add nuw nsw i32 %93, 16
  store i32 %114, i32* %65, align 16
  br label %119

115:                                              ; preds = %95, %101
  %116 = phi i32 [ %100, %95 ], [ %108, %101 ]
  %117 = load i8*, i8** %66, align 8
  %118 = getelementptr i8, i8* %117, i64 8
  store i8* %118, i8** %66, align 8
  br label %119

119:                                              ; preds = %115, %110
  %120 = phi i32 [ %108, %110 ], [ %116, %115 ]
  %121 = phi i8* [ %113, %110 ], [ %117, %115 ]
  %122 = bitcast i8* %121 to i32*
  %123 = load i32, i32* %122, align 4
  call void @llvm.va_end(i8* nonnull %10) #8
  %124 = icmp slt i32 %123, 0
  br i1 %124, label %125, label %127

125:                                              ; preds = %119
  %126 = tail call i32* @___errno_location() #7
  store i32 22, i32* %126, align 4, !tbaa !12
  br label %207

127:                                              ; preds = %119
  %128 = call i32 @sem_init(%struct.sem_t* noundef nonnull %5, i32 noundef 1, i32 noundef %123) #6
  br label %129

129:                                              ; preds = %127, %91
  %130 = phi i32 [ %120, %127 ], [ %70, %91 ]
  %131 = call i32 @clock_gettime(i32 noundef 0, %struct.timespec* noundef nonnull %7) #6
  %132 = load i64, i64* %68, align 8, !tbaa !13
  %133 = trunc i64 %132 to i32
  %134 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef nonnull %13, i64 noundef 64, i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0), i32 noundef %133) #6
  %135 = call i32 (i8*, i32, ...) @open(i8* noundef nonnull %13, i32 noundef 657602, i32 noundef %130) #6
  %136 = icmp slt i32 %135, 0
  br i1 %136, label %137, label %142

137:                                              ; preds = %129
  %138 = tail call i32* @___errno_location() #7
  %139 = load i32, i32* %138, align 4, !tbaa !12
  %140 = icmp eq i32 %139, 17
  br i1 %140, label %141, label %207

141:                                              ; preds = %137, %165
  br label %69

142:                                              ; preds = %129
  %143 = call i64 @write(i32 noundef %135, i8* noundef nonnull %12, i64 noundef 32) #6
  %144 = icmp eq i64 %143, 32
  br i1 %144, label %145, label %151

145:                                              ; preds = %142
  %146 = call i32 @fstat(i32 noundef %135, %struct.stat* noundef nonnull %8) #6
  %147 = icmp slt i32 %146, 0
  br i1 %147, label %151, label %148

148:                                              ; preds = %145
  %149 = call i8* @mmap(i8* noundef null, i64 noundef 32, i32 noundef 3, i32 noundef 1, i32 noundef %135, i64 noundef 0) #6
  %150 = icmp eq i8* %149, inttoptr (i64 -1 to i8*)
  br i1 %150, label %151, label %154

151:                                              ; preds = %148, %145, %142
  %152 = call i32 @close(i32 noundef %135) #6
  %153 = call i32 @unlink(i8* noundef nonnull %13) #6
  br label %207

154:                                              ; preds = %148
  %155 = call i32 @close(i32 noundef %135) #6
  %156 = call i32 @link(i8* noundef nonnull %13, i8* noundef nonnull %17) #6
  %157 = icmp eq i32 %156, 0
  br i1 %157, label %158, label %160

158:                                              ; preds = %154
  %159 = call i32 @unlink(i8* noundef nonnull %13) #6
  br label %169

160:                                              ; preds = %154
  %161 = tail call i32* @___errno_location() #7
  %162 = load i32, i32* %161, align 4, !tbaa !12
  %163 = call i32 @unlink(i8* noundef nonnull %13) #6
  %164 = icmp eq i32 %162, 0
  br i1 %164, label %169, label %165

165:                                              ; preds = %160
  %166 = call i32 @munmap(i8* noundef %149, i64 noundef 32) #6
  %167 = icmp ne i32 %162, 17
  %168 = or i1 %56, %167
  br i1 %168, label %207, label %141

169:                                              ; preds = %160, %158, %83
  %170 = phi i8* [ %79, %83 ], [ %149, %158 ], [ %149, %160 ]
  call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #6
  %171 = load %struct.anon*, %struct.anon** @semtab, align 8, !tbaa !3
  %172 = getelementptr inbounds %struct.stat, %struct.stat* %8, i64 0, i32 1
  %173 = load i64, i64* %172, align 8, !tbaa !15
  br label %174

174:                                              ; preds = %169, %179
  %175 = phi i64 [ 0, %169 ], [ %180, %179 ]
  %176 = getelementptr inbounds %struct.anon, %struct.anon* %171, i64 %175, i32 0
  %177 = load i64, i64* %176, align 8, !tbaa !17
  %178 = icmp eq i64 %177, %173
  br i1 %178, label %182, label %179

179:                                              ; preds = %174
  %180 = add nuw nsw i64 %175, 1
  %181 = icmp eq i64 %180, 256
  br i1 %181, label %192, label %174

182:                                              ; preds = %174
  %183 = trunc i64 %175 to i32
  %184 = and i64 %175, 4294967295
  %185 = call i32 @munmap(i8* noundef %170, i64 noundef 32) #6
  %186 = load %struct.anon*, %struct.anon** @semtab, align 8, !tbaa !3
  %187 = getelementptr inbounds %struct.anon, %struct.anon* %186, i64 %52, i32 1
  store %struct.sem_t* null, %struct.sem_t** %187, align 8, !tbaa !11
  %188 = getelementptr inbounds %struct.anon, %struct.anon* %186, i64 %184, i32 1
  %189 = bitcast %struct.sem_t** %188 to i8**
  %190 = load i8*, i8** %189, align 8, !tbaa !11
  %191 = load i64, i64* %172, align 8, !tbaa !15
  br label %192

192:                                              ; preds = %179, %182
  %193 = phi i64 [ %191, %182 ], [ %173, %179 ]
  %194 = phi %struct.anon* [ %186, %182 ], [ %171, %179 ]
  %195 = phi i32 [ %183, %182 ], [ %42, %179 ]
  %196 = phi i8* [ %190, %182 ], [ %170, %179 ]
  %197 = sext i32 %195 to i64
  %198 = getelementptr inbounds %struct.anon, %struct.anon* %194, i64 %197, i32 2
  %199 = load i32, i32* %198, align 8, !tbaa !7
  %200 = add nsw i32 %199, 1
  store i32 %200, i32* %198, align 8, !tbaa !7
  %201 = bitcast i8* %196 to %struct.sem_t*
  %202 = getelementptr inbounds %struct.anon, %struct.anon* %194, i64 %197, i32 1
  %203 = bitcast %struct.sem_t** %202 to i8**
  store i8* %196, i8** %203, align 8, !tbaa !11
  %204 = getelementptr inbounds %struct.anon, %struct.anon* %194, i64 %197, i32 0
  store i64 %193, i64* %204, align 8, !tbaa !17
  call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #6
  %205 = load i32, i32* %4, align 4, !tbaa !12
  %206 = call i32 @pthread_setcancelstate(i32 noundef %205, i32* noundef null) #6
  br label %212

207:                                              ; preds = %165, %137, %90, %85, %151, %125, %81, %60
  %208 = load i32, i32* %4, align 4, !tbaa !12
  %209 = call i32 @pthread_setcancelstate(i32 noundef %208, i32* noundef null) #6
  call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #6
  %210 = load %struct.anon*, %struct.anon** @semtab, align 8, !tbaa !3
  %211 = getelementptr inbounds %struct.anon, %struct.anon* %210, i64 %52, i32 1
  store %struct.sem_t* null, %struct.sem_t** %211, align 8, !tbaa !11
  call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #6
  br label %212

212:                                              ; preds = %2, %207, %192, %49, %26
  %213 = phi %struct.sem_t* [ null, %49 ], [ null, %207 ], [ %201, %192 ], [ null, %26 ], [ null, %2 ]
  call void @llvm.lifetime.end.p0i8(i64 265, i8* nonnull %16) #5
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %15) #5
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %14) #5
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %13) #5
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %12) #5
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %11) #5
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %10) #5
  ret %struct.sem_t* %213
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i8* @__shm_mapname(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__lock(i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i8* @__libc_calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__unlock(i32* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @access(i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @open(i8* noundef, i32 noundef, ...) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @fstat(i32 noundef, %struct.stat* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @mmap(i8* noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @close(i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #4

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #4

; Function Attrs: optsize
declare i32 @sem_init(%struct.sem_t* noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @clock_gettime(i32 noundef, %struct.timespec* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @snprintf(i8* noundef, i64 noundef, i8* noundef, ...) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @write(i32 noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @unlink(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @link(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @munmap(i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define i32 @sem_close(%struct.sem_t* noundef %0) local_unnamed_addr #0 {
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #6
  %2 = load %struct.anon*, %struct.anon** @semtab, align 8, !tbaa !3
  br label %3

3:                                                ; preds = %1, %8
  %4 = phi i64 [ 0, %1 ], [ %9, %8 ]
  %5 = getelementptr inbounds %struct.anon, %struct.anon* %2, i64 %4, i32 1
  %6 = load %struct.sem_t*, %struct.sem_t** %5, align 8, !tbaa !11
  %7 = icmp eq %struct.sem_t* %6, %0
  br i1 %7, label %11, label %8

8:                                                ; preds = %3
  %9 = add nuw nsw i64 %4, 1
  %10 = icmp eq i64 %9, 256
  br i1 %10, label %11, label %3

11:                                               ; preds = %8, %3
  %12 = phi i64 [ 256, %8 ], [ %4, %3 ]
  %13 = and i64 %12, 4294967295
  %14 = getelementptr inbounds %struct.anon, %struct.anon* %2, i64 %13, i32 2
  %15 = load i32, i32* %14, align 8, !tbaa !7
  %16 = add nsw i32 %15, -1
  store i32 %16, i32* %14, align 8, !tbaa !7
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %19, label %18

18:                                               ; preds = %11
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #6
  br label %24

19:                                               ; preds = %11
  %20 = getelementptr inbounds %struct.anon, %struct.anon* %2, i64 %13, i32 1
  store %struct.sem_t* null, %struct.sem_t** %20, align 8, !tbaa !11
  %21 = getelementptr inbounds %struct.anon, %struct.anon* %2, i64 %13, i32 0
  store i64 0, i64* %21, align 8, !tbaa !17
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #6
  %22 = bitcast %struct.sem_t* %0 to i8*
  %23 = tail call i32 @munmap(i8* noundef %22, i64 noundef 32) #6
  br label %24

24:                                               ; preds = %19, %18
  ret i32 0
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree nosync nounwind willreturn }
attributes #5 = { nounwind strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #7 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #8 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !10, i64 16}
!8 = !{!"", !9, i64 0, !4, i64 8, !10, i64 16}
!9 = !{!"long", !5, i64 0}
!10 = !{!"int", !5, i64 0}
!11 = !{!8, !4, i64 8}
!12 = !{!10, !10, i64 0}
!13 = !{!14, !9, i64 8}
!14 = !{!"timespec", !9, i64 0, !9, i64 8}
!15 = !{!16, !9, i64 8}
!16 = !{!"stat", !9, i64 0, !9, i64 8, !9, i64 16, !10, i64 24, !10, i64 28, !10, i64 32, !10, i64 36, !9, i64 40, !9, i64 48, !9, i64 56, !9, i64 64, !14, i64 72, !14, i64 88, !14, i64 104, !5, i64 120}
!17 = !{!8, !9, i64 0}
