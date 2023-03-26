; ModuleID = 'src/passwd/getgrouplist.c'
source_filename = "src/passwd/getgrouplist.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.group = type { i8*, i8*, i32, i8** }
%struct._IO_FILE = type opaque

@.str = private unnamed_addr constant [11 x i8] c"/etc/group\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"rbe\00", align 1

; Function Attrs: nounwind optsize strictfp
define i32 @getgrouplist(i8* noundef %0, i32 noundef %1, i32* nocapture noundef writeonly %2, i32* nocapture noundef %3) local_unnamed_addr #0 {
  %5 = alloca %struct.group, align 8
  %6 = alloca %struct.group*, align 8
  %7 = alloca i32, align 4
  %8 = alloca [3 x i32], align 4
  %9 = alloca i8*, align 8
  %10 = alloca i8**, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = bitcast %struct.group* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %13) #5
  %14 = bitcast %struct.group** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %14) #5
  %15 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %15) #5
  store i32 0, i32* %7, align 4, !tbaa !3
  %16 = bitcast [3 x i32]* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %16) #5
  %17 = bitcast i8** %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %17) #5
  store i8* null, i8** %9, align 8, !tbaa !7
  %18 = bitcast i8*** %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %18) #5
  store i8** null, i8*** %10, align 8, !tbaa !7
  %19 = bitcast i64* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %19) #5
  store i64 0, i64* %11, align 8, !tbaa !9
  %20 = bitcast i64* %12 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %20) #5
  %21 = load i32, i32* %3, align 4, !tbaa !3
  %22 = icmp sgt i32 %21, 0
  br i1 %22, label %23, label %25

23:                                               ; preds = %4
  %24 = getelementptr inbounds i32, i32* %2, i64 1
  store i32 %1, i32* %2, align 4, !tbaa !3
  br label %25

25:                                               ; preds = %23, %4
  %26 = phi i32* [ %24, %23 ], [ %2, %4 ]
  %27 = getelementptr inbounds [3 x i32], [3 x i32]* %8, i64 0, i64 0
  %28 = call %struct._IO_FILE* @__nscd_query(i32 noundef 15, i8* noundef %0, i32* noundef nonnull %27, i64 noundef 12, i32* noundef nonnull %7) #6
  %29 = icmp eq %struct._IO_FILE* %28, null
  br i1 %29, label %187, label %30

30:                                               ; preds = %25
  %31 = getelementptr inbounds [3 x i32], [3 x i32]* %8, i64 0, i64 1
  %32 = load i32, i32* %31, align 4, !tbaa !3
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %69, label %34

34:                                               ; preds = %30
  %35 = getelementptr inbounds [3 x i32], [3 x i32]* %8, i64 0, i64 2
  %36 = load i32, i32* %35, align 4, !tbaa !3
  %37 = sext i32 %36 to i64
  %38 = call i8* @calloc(i64 noundef %37, i64 noundef 4) #6
  %39 = bitcast i8* %38 to i32*
  %40 = icmp eq i8* %38, null
  br i1 %40, label %182, label %41

41:                                               ; preds = %34
  %42 = load i32, i32* %35, align 4, !tbaa !3
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %69, label %44

44:                                               ; preds = %41
  %45 = sext i32 %42 to i64
  %46 = shl nsw i64 %45, 2
  %47 = call i64 @fread(i8* noundef nonnull %38, i64 noundef %46, i64 noundef 1, %struct._IO_FILE* noundef nonnull %28) #6
  %48 = icmp eq i64 %47, 0
  br i1 %48, label %49, label %54

49:                                               ; preds = %44
  %50 = call i32 @ferror(%struct._IO_FILE* noundef nonnull %28) #6
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %182

52:                                               ; preds = %49
  %53 = tail call i32* @___errno_location() #7
  store i32 5, i32* %53, align 4, !tbaa !3
  br label %182

54:                                               ; preds = %44
  %55 = load i32, i32* %35, align 4
  %56 = icmp sgt i32 %55, 0
  %57 = load i32, i32* %7, align 4, !tbaa !3
  %58 = icmp ne i32 %57, 0
  %59 = select i1 %58, i1 %56, i1 false
  br i1 %59, label %60, label %69

60:                                               ; preds = %54, %60
  %61 = phi i64 [ %65, %60 ], [ 0, %54 ]
  %62 = getelementptr inbounds i32, i32* %39, i64 %61
  %63 = load i32, i32* %62, align 4, !tbaa !3
  %64 = call i32 @llvm.bswap.i32(i32 %63) #8
  store i32 %64, i32* %62, align 4, !tbaa !3
  %65 = add nuw nsw i64 %61, 1
  %66 = load i32, i32* %35, align 4, !tbaa !3
  %67 = sext i32 %66 to i64
  %68 = icmp slt i64 %65, %67
  br i1 %68, label %60, label %69

69:                                               ; preds = %60, %41, %54, %30
  %70 = phi i32* [ null, %30 ], [ %39, %54 ], [ %39, %41 ], [ %39, %60 ]
  %71 = call i32 @fclose(%struct._IO_FILE* noundef nonnull %28) #6
  %72 = call %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)) #6
  %73 = icmp eq %struct._IO_FILE* %72, null
  br i1 %73, label %80, label %74

74:                                               ; preds = %69
  %75 = icmp ne i32* %70, null
  %76 = getelementptr inbounds [3 x i32], [3 x i32]* %8, i64 0, i64 2
  %77 = getelementptr inbounds %struct.group, %struct.group* %5, i64 0, i32 2
  %78 = getelementptr inbounds %struct.group, %struct.group* %5, i64 0, i32 3
  %79 = sext i32 %21 to i64
  br label %135

80:                                               ; preds = %69
  %81 = tail call i32* @___errno_location() #7
  %82 = load i32, i32* %81, align 4, !tbaa !3
  switch i32 %82, label %187 [
    i32 2, label %143
    i32 20, label %143
  ]

83:                                               ; preds = %138, %126
  %84 = call i32 @__getgrent_a(%struct._IO_FILE* noundef nonnull %72, %struct.group* noundef nonnull %5, i8** noundef nonnull %9, i64* noundef nonnull %12, i8*** noundef nonnull %10, i64* noundef nonnull %11, %struct.group** noundef nonnull %6) #6
  %85 = icmp eq i32 %84, 0
  %86 = load %struct.group*, %struct.group** %6, align 8
  %87 = icmp ne %struct.group* %86, null
  %88 = select i1 %85, i1 %87, i1 false
  br i1 %88, label %89, label %140

89:                                               ; preds = %83
  %90 = load i32, i32* %76, align 4
  %91 = icmp sgt i32 %90, 0
  %92 = select i1 %75, i1 %91, i1 false
  br i1 %92, label %93, label %107

93:                                               ; preds = %89, %102
  %94 = phi i32 [ %103, %102 ], [ %90, %89 ]
  %95 = phi i64 [ %104, %102 ], [ 0, %89 ]
  %96 = getelementptr inbounds i32, i32* %70, i64 %95
  %97 = load i32, i32* %96, align 4, !tbaa !3
  %98 = load i32, i32* %77, align 8, !tbaa !11
  %99 = icmp eq i32 %97, %98
  br i1 %99, label %100, label %102

100:                                              ; preds = %93
  store i32 %1, i32* %96, align 4, !tbaa !3
  %101 = load i32, i32* %76, align 4, !tbaa !3
  br label %102

102:                                              ; preds = %93, %100
  %103 = phi i32 [ %94, %93 ], [ %101, %100 ]
  %104 = add nuw nsw i64 %95, 1
  %105 = sext i32 %103 to i64
  %106 = icmp slt i64 %104, %105
  br i1 %106, label %93, label %107

107:                                              ; preds = %102, %89
  %108 = load i8**, i8*** %78, align 8, !tbaa !13
  %109 = load i8*, i8** %108, align 8, !tbaa !7
  %110 = icmp eq i8* %109, null
  br i1 %110, label %126, label %111

111:                                              ; preds = %107, %120
  %112 = phi i8* [ %124, %120 ], [ %109, %107 ]
  %113 = phi i64 [ %121, %120 ], [ 0, %107 ]
  %114 = call i32 @strcmp(i8* noundef %0, i8* noundef nonnull %112) #6
  %115 = icmp eq i32 %114, 0
  br i1 %115, label %116, label %120

116:                                              ; preds = %111
  %117 = load i8**, i8*** %78, align 8, !tbaa !13
  %118 = getelementptr inbounds i8*, i8** %117, i64 %113
  %119 = load i8*, i8** %118, align 8, !tbaa !7
  br label %126

120:                                              ; preds = %111
  %121 = add nuw nsw i64 %113, 1
  %122 = load i8**, i8*** %78, align 8, !tbaa !13
  %123 = getelementptr inbounds i8*, i8** %122, i64 %121
  %124 = load i8*, i8** %123, align 8, !tbaa !7
  %125 = icmp eq i8* %124, null
  br i1 %125, label %126, label %111

126:                                              ; preds = %120, %116, %107
  %127 = phi i8* [ null, %107 ], [ %119, %116 ], [ null, %120 ]
  %128 = icmp eq i8* %127, null
  br i1 %128, label %83, label %129

129:                                              ; preds = %126
  %130 = add nuw nsw i64 %139, 1
  %131 = icmp slt i64 %139, %79
  br i1 %131, label %132, label %138

132:                                              ; preds = %129
  %133 = load i32, i32* %77, align 8, !tbaa !11
  %134 = getelementptr inbounds i32, i32* %136, i64 1
  store i32 %133, i32* %136, align 4, !tbaa !3
  br label %135

135:                                              ; preds = %132, %74
  %136 = phi i32* [ %134, %132 ], [ %26, %74 ]
  %137 = phi i64 [ %130, %132 ], [ 1, %74 ]
  br label %138

138:                                              ; preds = %135, %129
  %139 = phi i64 [ %130, %129 ], [ %137, %135 ]
  br label %83

140:                                              ; preds = %83
  br i1 %85, label %143, label %141

141:                                              ; preds = %140
  %142 = tail call i32* @___errno_location() #7
  store i32 %84, i32* %142, align 4, !tbaa !3
  br label %180

143:                                              ; preds = %80, %80, %140
  %144 = phi i32* [ %136, %140 ], [ %26, %80 ], [ %26, %80 ]
  %145 = phi i64 [ %139, %140 ], [ 1, %80 ], [ 1, %80 ]
  %146 = icmp eq i32* %70, null
  br i1 %146, label %174, label %147

147:                                              ; preds = %143
  %148 = getelementptr inbounds [3 x i32], [3 x i32]* %8, i64 0, i64 2
  %149 = load i32, i32* %148, align 4, !tbaa !3
  %150 = icmp sgt i32 %149, 0
  br i1 %150, label %151, label %174

151:                                              ; preds = %147
  %152 = sext i32 %21 to i64
  br label %153

153:                                              ; preds = %151, %167
  %154 = phi i32 [ %149, %151 ], [ %168, %167 ]
  %155 = phi i64 [ %145, %151 ], [ %170, %167 ]
  %156 = phi i64 [ 0, %151 ], [ %171, %167 ]
  %157 = phi i32* [ %144, %151 ], [ %169, %167 ]
  %158 = getelementptr inbounds i32, i32* %70, i64 %156
  %159 = load i32, i32* %158, align 4, !tbaa !3
  %160 = icmp eq i32 %159, %1
  br i1 %160, label %167, label %161

161:                                              ; preds = %153
  %162 = add nsw i64 %155, 1
  %163 = icmp slt i64 %155, %152
  br i1 %163, label %164, label %167

164:                                              ; preds = %161
  %165 = getelementptr inbounds i32, i32* %157, i64 1
  store i32 %159, i32* %157, align 4, !tbaa !3
  %166 = load i32, i32* %148, align 4, !tbaa !3
  br label %167

167:                                              ; preds = %153, %164, %161
  %168 = phi i32 [ %166, %164 ], [ %154, %161 ], [ %154, %153 ]
  %169 = phi i32* [ %165, %164 ], [ %157, %161 ], [ %157, %153 ]
  %170 = phi i64 [ %162, %164 ], [ %162, %161 ], [ %155, %153 ]
  %171 = add nuw nsw i64 %156, 1
  %172 = sext i32 %168 to i64
  %173 = icmp slt i64 %171, %172
  br i1 %173, label %153, label %174

174:                                              ; preds = %167, %147, %143
  %175 = phi i64 [ %145, %143 ], [ %145, %147 ], [ %170, %167 ]
  %176 = sext i32 %21 to i64
  %177 = icmp sgt i64 %175, %176
  %178 = trunc i64 %175 to i32
  %179 = select i1 %177, i32 -1, i32 %178
  store i32 %178, i32* %3, align 4, !tbaa !3
  br label %180

180:                                              ; preds = %174, %141
  %181 = phi i32 [ -1, %141 ], [ %179, %174 ]
  br i1 %73, label %187, label %182

182:                                              ; preds = %52, %49, %34, %180
  %183 = phi i32* [ %70, %180 ], [ %39, %52 ], [ %39, %49 ], [ null, %34 ]
  %184 = phi %struct._IO_FILE* [ %72, %180 ], [ %28, %52 ], [ %28, %49 ], [ %28, %34 ]
  %185 = phi i32 [ %181, %180 ], [ -1, %52 ], [ -1, %49 ], [ -1, %34 ]
  %186 = call i32 @fclose(%struct._IO_FILE* noundef nonnull %184) #6
  br label %187

187:                                              ; preds = %80, %25, %182, %180
  %188 = phi i32* [ %183, %182 ], [ %70, %180 ], [ %70, %80 ], [ null, %25 ]
  %189 = phi i32 [ %185, %182 ], [ %181, %180 ], [ -1, %80 ], [ -1, %25 ]
  %190 = bitcast i32* %188 to i8*
  call void @free(i8* noundef %190) #6
  %191 = load i8*, i8** %9, align 8, !tbaa !7
  call void @free(i8* noundef %191) #6
  %192 = bitcast i8*** %10 to i8**
  %193 = load i8*, i8** %192, align 8, !tbaa !7
  call void @free(i8* noundef %193) #6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %20) #5
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %19) #5
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %18) #5
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %17) #5
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %16) #5
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %15) #5
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %14) #5
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %13) #5
  ret i32 %189
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden %struct._IO_FILE* @__nscd_query(i32 noundef, i8* noundef, i32* noundef, i64 noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @fread(i8* noundef, i64 noundef, i64 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @ferror(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @fclose(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare %struct._IO_FILE* @fopen(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__getgrent_a(%struct._IO_FILE* noundef, %struct.group* noundef, i8** noundef, i64* noundef, i8*** noundef, i64* noundef, %struct.group** noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @strcmp(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.bswap.i32(i32) #4

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { nounwind strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #7 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #8 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"any pointer", !5, i64 0}
!9 = !{!10, !10, i64 0}
!10 = !{!"long", !5, i64 0}
!11 = !{!12, !4, i64 16}
!12 = !{!"group", !8, i64 0, !8, i64 8, !4, i64 16, !8, i64 24}
!13 = !{!12, !8, i64 24}
