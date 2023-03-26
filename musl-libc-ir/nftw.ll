; ModuleID = 'src/misc/nftw.c'
source_filename = "src/misc/nftw.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct.FTW = type { i32, i32 }
%struct.history = type { %struct.history*, i64, i64, i32, i32 }
%struct.__dirstream = type opaque
%struct.dirent = type { i64, i64, i16, i8, [256 x i8] }

@nftw64 = weak alias i32 (i8*, i32 (i8*, %struct.stat*, i32, %struct.FTW*)*, i32, i32), i32 (i8*, i32 (i8*, %struct.stat*, i32, %struct.FTW*)*, i32, i32)* @nftw

; Function Attrs: nounwind optsize strictfp
define i32 @nftw(i8* noundef %0, i32 (i8*, %struct.stat*, i32, %struct.FTW*)* nocapture noundef readonly %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca [4097 x i8], align 16
  %7 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %7) #4
  %8 = getelementptr inbounds [4097 x i8], [4097 x i8]* %6, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 4097, i8* nonnull %8) #4
  %9 = icmp slt i32 %2, 1
  br i1 %9, label %22, label %10

10:                                               ; preds = %4
  %11 = tail call i64 @strlen(i8* noundef %0) #5
  %12 = icmp ugt i64 %11, 4096
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = tail call i32* @___errno_location() #6
  store i32 36, i32* %14, align 4, !tbaa !3
  br label %22

15:                                               ; preds = %10
  %16 = add nuw nsw i64 %11, 1
  %17 = call i8* @memcpy(i8* noundef nonnull %8, i8* noundef %0, i64 noundef %16) #5
  %18 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %5) #5
  %19 = call fastcc i32 @do_nftw(i8* noundef nonnull %8, i32 (i8*, %struct.stat*, i32, %struct.FTW*)* noundef %1, i32 noundef %2, i32 noundef %3, %struct.history* noundef null) #7
  %20 = load i32, i32* %5, align 4, !tbaa !3
  %21 = call i32 @pthread_setcancelstate(i32 noundef %20, i32* noundef null) #5
  br label %22

22:                                               ; preds = %4, %15, %13
  %23 = phi i32 [ -1, %13 ], [ %19, %15 ], [ 0, %4 ]
  call void @llvm.lifetime.end.p0i8(i64 4097, i8* nonnull %8) #4
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %7) #4
  ret i32 %23
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @do_nftw(i8* noundef %0, i32 (i8*, %struct.stat*, i32, %struct.FTW*)* nocapture noundef readonly %1, i32 noundef %2, i32 noundef %3, %struct.history* noundef %4) unnamed_addr #0 {
  %6 = alloca %struct.stat, align 8
  %7 = alloca %struct.history, align 8
  %8 = alloca %struct.FTW, align 4
  %9 = tail call i64 @strlen(i8* noundef %0) #5
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %16, label %11

11:                                               ; preds = %5
  %12 = add i64 %9, -1
  %13 = getelementptr inbounds i8, i8* %0, i64 %12
  %14 = load i8, i8* %13, align 1, !tbaa !7
  %15 = icmp eq i8 %14, 47
  br i1 %15, label %17, label %16

16:                                               ; preds = %11, %5
  br label %17

17:                                               ; preds = %11, %16
  %18 = phi i64 [ %9, %16 ], [ %12, %11 ]
  %19 = bitcast %struct.stat* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %19) #4
  %20 = bitcast %struct.history* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %20) #4
  %21 = bitcast %struct.FTW* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %21) #4
  %22 = and i32 %3, 1
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %29, label %24

24:                                               ; preds = %17
  %25 = call i32 @lstat(i8* noundef %0, %struct.stat* noundef nonnull %6) #5
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %45, label %27

27:                                               ; preds = %24
  %28 = tail call i32* @___errno_location() #6
  br label %39

29:                                               ; preds = %17
  %30 = call i32 @stat(i8* noundef %0, %struct.stat* noundef nonnull %6) #5
  %31 = icmp slt i32 %30, 0
  br i1 %31, label %32, label %45

32:                                               ; preds = %29
  %33 = tail call i32* @___errno_location() #6
  %34 = load i32, i32* %33, align 4, !tbaa !3
  %35 = icmp eq i32 %34, 2
  br i1 %35, label %36, label %42

36:                                               ; preds = %32
  %37 = call i32 @lstat(i8* noundef %0, %struct.stat* noundef nonnull %6) #5
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %57, label %39

39:                                               ; preds = %36, %27
  %40 = phi i32* [ %33, %36 ], [ %28, %27 ]
  %41 = load i32, i32* %40, align 4, !tbaa !3
  br label %42

42:                                               ; preds = %39, %32
  %43 = phi i32 [ %41, %39 ], [ %34, %32 ]
  %44 = icmp eq i32 %43, 13
  br i1 %44, label %57, label %215

45:                                               ; preds = %29, %24
  %46 = getelementptr inbounds %struct.stat, %struct.stat* %6, i64 0, i32 3
  %47 = load i32, i32* %46, align 8, !tbaa !8
  %48 = trunc i32 %47 to i16
  %49 = and i16 %48, -4096
  switch i16 %49, label %57 [
    i16 16384, label %50
    i16 -24576, label %55
  ]

50:                                               ; preds = %45
  %51 = and i32 %3, 8
  %52 = icmp eq i32 %51, 0
  %53 = xor i1 %52, true
  %54 = select i1 %52, i32 2, i32 6
  br label %57

55:                                               ; preds = %45
  %56 = select i1 %23, i32 7, i32 5
  br label %57

57:                                               ; preds = %45, %55, %50, %42, %36
  %58 = phi i1 [ false, %36 ], [ false, %42 ], [ %52, %50 ], [ false, %55 ], [ false, %45 ]
  %59 = phi i1 [ false, %36 ], [ false, %42 ], [ %53, %50 ], [ false, %55 ], [ false, %45 ]
  %60 = phi i32 [ 7, %36 ], [ 4, %42 ], [ %54, %50 ], [ %56, %55 ], [ 1, %45 ]
  %61 = and i32 %3, 2
  %62 = icmp ne i32 %61, 0
  %63 = icmp ne %struct.history* %4, null
  %64 = and i1 %62, %63
  %65 = getelementptr inbounds %struct.stat, %struct.stat* %6, i64 0, i32 0
  %66 = load i64, i64* %65, align 8, !tbaa !12
  br i1 %64, label %67, label %71

67:                                               ; preds = %57
  %68 = getelementptr inbounds %struct.history, %struct.history* %4, i64 0, i32 1
  %69 = load i64, i64* %68, align 8, !tbaa !13
  %70 = icmp eq i64 %66, %69
  br i1 %70, label %71, label %215

71:                                               ; preds = %57, %67
  %72 = getelementptr inbounds %struct.history, %struct.history* %7, i64 0, i32 0
  store %struct.history* %4, %struct.history** %72, align 8, !tbaa !16
  %73 = getelementptr inbounds %struct.stat, %struct.stat* %6, i64 0, i32 0
  %74 = getelementptr inbounds %struct.history, %struct.history* %7, i64 0, i32 1
  store i64 %66, i64* %74, align 8, !tbaa !13
  %75 = getelementptr inbounds %struct.stat, %struct.stat* %6, i64 0, i32 1
  %76 = load i64, i64* %75, align 8, !tbaa !17
  %77 = getelementptr inbounds %struct.history, %struct.history* %7, i64 0, i32 2
  store i64 %76, i64* %77, align 8, !tbaa !18
  br i1 %63, label %78, label %90

78:                                               ; preds = %71
  %79 = getelementptr inbounds %struct.history, %struct.history* %4, i64 0, i32 3
  %80 = load i32, i32* %79, align 8, !tbaa !19
  %81 = add nsw i32 %80, 1
  %82 = getelementptr inbounds %struct.history, %struct.history* %7, i64 0, i32 3
  store i32 %81, i32* %82, align 8, !tbaa !19
  %83 = trunc i64 %18 to i32
  %84 = add i32 %83, 1
  %85 = getelementptr inbounds %struct.history, %struct.history* %7, i64 0, i32 4
  store i32 %84, i32* %85, align 4, !tbaa !20
  %86 = getelementptr inbounds %struct.FTW, %struct.FTW* %8, i64 0, i32 1
  store i32 %81, i32* %86, align 4, !tbaa !21
  %87 = getelementptr inbounds %struct.history, %struct.history* %4, i64 0, i32 4
  %88 = load i32, i32* %87, align 4, !tbaa !20
  %89 = getelementptr inbounds %struct.FTW, %struct.FTW* %8, i64 0, i32 0
  store i32 %88, i32* %89, align 4, !tbaa !23
  br label %118

90:                                               ; preds = %71
  %91 = getelementptr inbounds %struct.history, %struct.history* %7, i64 0, i32 3
  store i32 0, i32* %91, align 8, !tbaa !19
  %92 = trunc i64 %18 to i32
  %93 = add i32 %92, 1
  %94 = getelementptr inbounds %struct.history, %struct.history* %7, i64 0, i32 4
  store i32 %93, i32* %94, align 4, !tbaa !20
  %95 = getelementptr inbounds %struct.FTW, %struct.FTW* %8, i64 0, i32 1
  store i32 0, i32* %95, align 4, !tbaa !21
  %96 = icmp eq i64 %18, 0
  br i1 %96, label %105, label %97

97:                                               ; preds = %90, %102
  %98 = phi i64 [ %103, %102 ], [ %18, %90 ]
  %99 = getelementptr inbounds i8, i8* %0, i64 %98
  %100 = load i8, i8* %99, align 1, !tbaa !7
  %101 = icmp eq i8 %100, 47
  br i1 %101, label %102, label %105

102:                                              ; preds = %97
  %103 = add i64 %98, -1
  %104 = icmp eq i64 %103, 0
  br i1 %104, label %105, label %97

105:                                              ; preds = %97, %102, %90
  %106 = phi i64 [ 0, %90 ], [ %98, %97 ], [ 0, %102 ]
  br label %107

107:                                              ; preds = %105, %110
  %108 = phi i64 [ %111, %110 ], [ %106, %105 ]
  %109 = icmp eq i64 %108, 0
  br i1 %109, label %115, label %110

110:                                              ; preds = %107
  %111 = add i64 %108, -1
  %112 = getelementptr inbounds i8, i8* %0, i64 %111
  %113 = load i8, i8* %112, align 1, !tbaa !7
  %114 = icmp eq i8 %113, 47
  br i1 %114, label %115, label %107

115:                                              ; preds = %107, %110
  %116 = trunc i64 %108 to i32
  %117 = getelementptr inbounds %struct.FTW, %struct.FTW* %8, i64 0, i32 0
  store i32 %116, i32* %117, align 4, !tbaa !23
  br label %118

118:                                              ; preds = %115, %78
  %119 = or i1 %58, %59
  br i1 %119, label %120, label %131

120:                                              ; preds = %118
  %121 = call i32 (i8*, i32, ...) @open(i8* noundef %0, i32 noundef 0) #5
  %122 = tail call i32* @___errno_location() #6
  %123 = load i32, i32* %122, align 4, !tbaa !3
  %124 = icmp slt i32 %121, 0
  %125 = icmp eq i32 %123, 13
  %126 = select i1 %124, i1 %125, i1 false
  %127 = select i1 %126, i32 3, i32 %60
  %128 = icmp eq i32 %2, 0
  br i1 %128, label %129, label %131

129:                                              ; preds = %120
  %130 = call i32 @close(i32 noundef %121) #5
  br label %131

131:                                              ; preds = %120, %129, %118
  %132 = phi i32 [ %127, %120 ], [ %127, %129 ], [ %60, %118 ]
  %133 = phi i32 [ %121, %120 ], [ %121, %129 ], [ undef, %118 ]
  %134 = phi i32 [ %123, %120 ], [ %123, %129 ], [ undef, %118 ]
  %135 = and i32 %3, 8
  %136 = icmp eq i32 %135, 0
  br i1 %136, label %137, label %140

137:                                              ; preds = %131
  %138 = call i32 %1(i8* noundef %0, %struct.stat* noundef nonnull %6, i32 noundef %132, %struct.FTW* noundef nonnull %8) #5
  %139 = icmp eq i32 %138, 0
  br i1 %139, label %140, label %215

140:                                              ; preds = %137, %131
  %141 = icmp eq %struct.history* %4, null
  br i1 %141, label %158, label %142

142:                                              ; preds = %140
  %143 = load i64, i64* %73, align 8, !tbaa !12
  %144 = load i64, i64* %75, align 8
  br label %145

145:                                              ; preds = %142, %154
  %146 = phi %struct.history* [ %4, %142 ], [ %156, %154 ]
  %147 = getelementptr inbounds %struct.history, %struct.history* %146, i64 0, i32 1
  %148 = load i64, i64* %147, align 8, !tbaa !13
  %149 = icmp eq i64 %148, %143
  br i1 %149, label %150, label %154

150:                                              ; preds = %145
  %151 = getelementptr inbounds %struct.history, %struct.history* %146, i64 0, i32 2
  %152 = load i64, i64* %151, align 8, !tbaa !18
  %153 = icmp eq i64 %152, %144
  br i1 %153, label %215, label %154

154:                                              ; preds = %145, %150
  %155 = getelementptr inbounds %struct.history, %struct.history* %146, i64 0, i32 0
  %156 = load %struct.history*, %struct.history** %155, align 8, !tbaa !16
  %157 = icmp eq %struct.history* %156, null
  br i1 %157, label %158, label %145

158:                                              ; preds = %154, %140
  %159 = and i32 %132, -5
  %160 = icmp eq i32 %159, 2
  %161 = icmp ne i32 %2, 0
  %162 = and i1 %161, %160
  br i1 %162, label %163, label %209

163:                                              ; preds = %158
  %164 = icmp slt i32 %133, 0
  br i1 %164, label %165, label %167

165:                                              ; preds = %163
  %166 = tail call i32* @___errno_location() #6
  store i32 %134, i32* %166, align 4, !tbaa !3
  br label %215

167:                                              ; preds = %163
  %168 = call %struct.__dirstream* @fdopendir(i32 noundef %133) #5
  %169 = icmp eq %struct.__dirstream* %168, null
  br i1 %169, label %205, label %170

170:                                              ; preds = %167
  %171 = call %struct.dirent* @readdir(%struct.__dirstream* noundef nonnull %168) #5
  %172 = icmp eq %struct.dirent* %171, null
  br i1 %172, label %207, label %173

173:                                              ; preds = %170
  %174 = sub i64 4096, %9
  %175 = getelementptr inbounds i8, i8* %0, i64 %18
  %176 = getelementptr inbounds i8, i8* %175, i64 1
  %177 = add nsw i32 %2, -1
  br label %178

178:                                              ; preds = %173, %190
  %179 = phi %struct.dirent* [ %171, %173 ], [ %191, %190 ]
  %180 = getelementptr inbounds %struct.dirent, %struct.dirent* %179, i64 0, i32 4, i64 0
  %181 = load i8, i8* %180, align 1, !tbaa !7
  %182 = icmp eq i8 %181, 46
  br i1 %182, label %183, label %193

183:                                              ; preds = %178
  %184 = getelementptr inbounds %struct.dirent, %struct.dirent* %179, i64 0, i32 4, i64 1
  %185 = load i8, i8* %184, align 1, !tbaa !7
  switch i8 %185, label %193 [
    i8 0, label %190
    i8 46, label %186
  ]

186:                                              ; preds = %183
  %187 = getelementptr inbounds %struct.dirent, %struct.dirent* %179, i64 0, i32 4, i64 2
  %188 = load i8, i8* %187, align 1, !tbaa !7
  %189 = icmp eq i8 %188, 0
  br i1 %189, label %190, label %193

190:                                              ; preds = %186, %183, %199
  %191 = call %struct.dirent* @readdir(%struct.__dirstream* noundef nonnull %168) #5
  %192 = icmp eq %struct.dirent* %191, null
  br i1 %192, label %207, label %178

193:                                              ; preds = %183, %186, %178
  %194 = call i64 @strlen(i8* noundef nonnull %180) #5
  %195 = icmp ult i64 %194, %174
  br i1 %195, label %199, label %196

196:                                              ; preds = %193
  %197 = tail call i32* @___errno_location() #6
  store i32 36, i32* %197, align 4, !tbaa !3
  %198 = call i32 @closedir(%struct.__dirstream* noundef nonnull %168) #5
  br label %215

199:                                              ; preds = %193
  store i8 47, i8* %175, align 1, !tbaa !7
  %200 = call i8* @strcpy(i8* noundef nonnull %176, i8* noundef nonnull %180) #5
  %201 = call fastcc i32 @do_nftw(i8* noundef %0, i32 (i8*, %struct.stat*, i32, %struct.FTW*)* noundef %1, i32 noundef %177, i32 noundef %3, %struct.history* noundef nonnull %7) #7
  %202 = icmp eq i32 %201, 0
  br i1 %202, label %190, label %203

203:                                              ; preds = %199
  %204 = call i32 @closedir(%struct.__dirstream* noundef nonnull %168) #5
  br label %215

205:                                              ; preds = %167
  %206 = call i32 @close(i32 noundef %133) #5
  br label %215

207:                                              ; preds = %190, %170
  %208 = call i32 @closedir(%struct.__dirstream* noundef nonnull %168) #5
  br label %209

209:                                              ; preds = %207, %158
  %210 = getelementptr inbounds i8, i8* %0, i64 %9
  store i8 0, i8* %210, align 1, !tbaa !7
  br i1 %136, label %214, label %211

211:                                              ; preds = %209
  %212 = call i32 %1(i8* noundef nonnull %0, %struct.stat* noundef nonnull %6, i32 noundef %132, %struct.FTW* noundef nonnull %8) #5
  %213 = icmp eq i32 %212, 0
  br i1 %213, label %214, label %215

214:                                              ; preds = %211, %209
  br label %215

215:                                              ; preds = %150, %203, %196, %205, %211, %137, %67, %42, %214, %165
  %216 = phi i32 [ -1, %165 ], [ 0, %214 ], [ -1, %42 ], [ 0, %67 ], [ %138, %137 ], [ %212, %211 ], [ %201, %203 ], [ -1, %196 ], [ -1, %205 ], [ 0, %150 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %21) #4
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %20) #4
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %19) #4
  ret i32 %216
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @lstat(i8* noundef, %struct.stat* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @stat(i8* noundef, %struct.stat* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @open(i8* noundef, i32 noundef, ...) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @close(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare %struct.__dirstream* @fdopendir(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare %struct.dirent* @readdir(%struct.__dirstream* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @closedir(%struct.__dirstream* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @strcpy(i8* noundef, i8* noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #7 = { nobuiltin optsize strictfp "no-builtins" }

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
!8 = !{!9, !4, i64 24}
!9 = !{!"stat", !10, i64 0, !10, i64 8, !10, i64 16, !4, i64 24, !4, i64 28, !4, i64 32, !4, i64 36, !10, i64 40, !10, i64 48, !10, i64 56, !10, i64 64, !11, i64 72, !11, i64 88, !11, i64 104, !5, i64 120}
!10 = !{!"long", !5, i64 0}
!11 = !{!"timespec", !10, i64 0, !10, i64 8}
!12 = !{!9, !10, i64 0}
!13 = !{!14, !10, i64 8}
!14 = !{!"history", !15, i64 0, !10, i64 8, !10, i64 16, !4, i64 24, !4, i64 28}
!15 = !{!"any pointer", !5, i64 0}
!16 = !{!14, !15, i64 0}
!17 = !{!9, !10, i64 8}
!18 = !{!14, !10, i64 16}
!19 = !{!14, !4, i64 24}
!20 = !{!14, !4, i64 28}
!21 = !{!22, !4, i64 4}
!22 = !{!"FTW", !4, i64 0, !4, i64 4}
!23 = !{!22, !4, i64 0}
