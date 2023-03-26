; ModuleID = 'src/passwd/getpw_a.c'
source_filename = "src/passwd/getpw_a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.passwd = type { i8*, i8*, i32, i32, i8*, i8*, i8* }
%struct._IO_FILE = type opaque

@.str = private unnamed_addr constant [12 x i8] c"/etc/passwd\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"rbe\00", align 1

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__getpw_a(i8* noundef %0, i32 noundef %1, %struct.passwd* noundef %2, i8** noundef %3, i64* noundef %4, %struct.passwd** noundef %5) local_unnamed_addr #0 {
  %7 = alloca i32, align 4
  %8 = alloca [9 x i32], align 16
  %9 = alloca [11 x i8], align 1
  %10 = alloca [1 x i32], align 4
  %11 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %11) #5
  store %struct.passwd* null, %struct.passwd** %5, align 8, !tbaa !3
  %12 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %7) #6
  %13 = call %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)) #6
  %14 = icmp eq %struct._IO_FILE* %13, null
  br i1 %14, label %20, label %15

15:                                               ; preds = %6
  %16 = call i32 @__getpwent_a(%struct._IO_FILE* noundef nonnull %13, %struct.passwd* noundef %2, i8** noundef %3, i64* noundef %4, %struct.passwd** noundef nonnull %5) #6
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %39

18:                                               ; preds = %15
  %19 = icmp eq i8* %0, null
  br label %23

20:                                               ; preds = %6
  %21 = tail call i32* @___errno_location() #7
  %22 = load i32, i32* %21, align 4, !tbaa !7
  br label %189

23:                                               ; preds = %18, %36
  %24 = load %struct.passwd*, %struct.passwd** %5, align 8, !tbaa !3
  %25 = icmp eq %struct.passwd* %24, null
  br i1 %25, label %39, label %26

26:                                               ; preds = %23
  br i1 %19, label %32, label %27

27:                                               ; preds = %26
  %28 = getelementptr inbounds %struct.passwd, %struct.passwd* %24, i64 0, i32 0
  %29 = load i8*, i8** %28, align 8, !tbaa !9
  %30 = call i32 @strcmp(i8* noundef nonnull %0, i8* noundef %29) #6
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %39, label %36

32:                                               ; preds = %26
  %33 = getelementptr inbounds %struct.passwd, %struct.passwd* %24, i64 0, i32 2
  %34 = load i32, i32* %33, align 8, !tbaa !11
  %35 = icmp eq i32 %34, %1
  br i1 %35, label %39, label %36

36:                                               ; preds = %27, %32
  %37 = call i32 @__getpwent_a(%struct._IO_FILE* noundef nonnull %13, %struct.passwd* noundef %2, i8** noundef %3, i64* noundef %4, %struct.passwd** noundef nonnull %5) #6
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %23, label %39

39:                                               ; preds = %23, %32, %27, %36, %15
  %40 = phi i32 [ %16, %15 ], [ %37, %36 ], [ 0, %27 ], [ 0, %32 ], [ 0, %23 ]
  %41 = call i32 @fclose(%struct._IO_FILE* noundef nonnull %13) #6
  %42 = load %struct.passwd*, %struct.passwd** %5, align 8, !tbaa !3
  %43 = icmp eq %struct.passwd* %42, null
  br i1 %43, label %44, label %189

44:                                               ; preds = %39
  switch i32 %40, label %45 [
    i32 20, label %48
    i32 2, label %48
    i32 0, label %48
  ]

45:                                               ; preds = %44
  %46 = load i32, i32* %7, align 4, !tbaa !7
  %47 = call i32 @pthread_setcancelstate(i32 noundef %46, i32* noundef null) #6
  br label %194

48:                                               ; preds = %44, %44, %44
  %49 = icmp eq i8* %0, null
  %50 = zext i1 %49 to i32
  %51 = bitcast [9 x i32]* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 36, i8* nonnull %51) #5
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(36) %51, i8 0, i64 36, i1 false) #8
  %52 = getelementptr inbounds [11 x i8], [11 x i8]* %9, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 11, i8* nonnull %52) #5
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(11) %52, i8 0, i64 11, i1 false) #8
  br i1 %49, label %53, label %64

53:                                               ; preds = %48
  %54 = getelementptr inbounds [11 x i8], [11 x i8]* %9, i64 0, i64 10
  br label %55

55:                                               ; preds = %55, %53
  %56 = phi i8* [ %54, %53 ], [ %61, %55 ]
  %57 = phi i32 [ %1, %53 ], [ %62, %55 ]
  %58 = urem i32 %57, 10
  %59 = trunc i32 %58 to i8
  %60 = or i8 %59, 48
  %61 = getelementptr inbounds i8, i8* %56, i64 -1
  store i8 %60, i8* %61, align 1, !tbaa !12
  %62 = udiv i32 %57, 10
  %63 = icmp ult i32 %57, 10
  br i1 %63, label %64, label %55

64:                                               ; preds = %55, %48
  %65 = phi i8* [ %0, %48 ], [ %61, %55 ]
  %66 = getelementptr inbounds [9 x i32], [9 x i32]* %8, i64 0, i64 0
  %67 = getelementptr inbounds [1 x i32], [1 x i32]* %10, i64 0, i64 0
  store i32 0, i32* %67, align 4, !tbaa !7
  %68 = call %struct._IO_FILE* @__nscd_query(i32 noundef %50, i8* noundef nonnull %65, i32* noundef nonnull %66, i64 noundef 36, i32* noundef nonnull %67) #6
  %69 = icmp eq %struct._IO_FILE* %68, null
  br i1 %69, label %70, label %73

70:                                               ; preds = %64
  %71 = tail call i32* @___errno_location() #7
  %72 = load i32, i32* %71, align 4, !tbaa !7
  br label %187

73:                                               ; preds = %64
  %74 = getelementptr inbounds [9 x i32], [9 x i32]* %8, i64 0, i64 1
  %75 = load i32, i32* %74, align 4, !tbaa !7
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %184, label %77

77:                                               ; preds = %73
  %78 = getelementptr inbounds [9 x i32], [9 x i32]* %8, i64 0, i64 2
  %79 = getelementptr inbounds [9 x i32], [9 x i32]* %8, i64 0, i64 3
  %80 = bitcast i32* %78 to <2 x i32>*
  %81 = load <2 x i32>, <2 x i32>* %80, align 8
  %82 = getelementptr inbounds [9 x i32], [9 x i32]* %8, i64 0, i64 6
  %83 = getelementptr inbounds [9 x i32], [9 x i32]* %8, i64 0, i64 7
  %84 = bitcast i32* %82 to <2 x i32>*
  %85 = load <2 x i32>, <2 x i32>* %84, align 8
  %86 = shufflevector <2 x i32> %81, <2 x i32> %85, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %87 = freeze <4 x i32> %86
  %88 = icmp eq <4 x i32> %87, zeroinitializer
  %89 = bitcast <4 x i1> %88 to i4
  %90 = icmp eq i4 %89, 0
  %91 = getelementptr inbounds [9 x i32], [9 x i32]* %8, i64 0, i64 8
  %92 = load i32, i32* %91, align 16
  %93 = icmp ne i32 %92, 0
  %94 = select i1 %90, i1 %93, i1 false
  br i1 %94, label %95, label %184

95:                                               ; preds = %77
  %96 = extractelement <2 x i32> %81, i64 0
  %97 = extractelement <2 x i32> %81, i64 1
  %98 = or i32 %97, %96
  %99 = extractelement <2 x i32> %85, i64 0
  %100 = or i32 %98, %99
  %101 = extractelement <2 x i32> %85, i64 1
  %102 = or i32 %100, %101
  %103 = or i32 %102, %92
  %104 = icmp slt i32 %103, 0
  br i1 %104, label %184, label %105

105:                                              ; preds = %95
  %106 = add nsw i32 %97, %96
  %107 = add nsw i32 %106, %99
  %108 = add nsw i32 %107, %101
  %109 = add nsw i32 %108, %92
  %110 = sext i32 %109 to i64
  %111 = load i64, i64* %4, align 8, !tbaa !13
  %112 = icmp ult i64 %111, %110
  %113 = load i8*, i8** %3, align 8, !tbaa !3
  br i1 %112, label %116, label %114

114:                                              ; preds = %105
  %115 = icmp eq i8* %113, null
  br i1 %115, label %116, label %124

116:                                              ; preds = %105, %114
  %117 = phi i8* [ null, %114 ], [ %113, %105 ]
  %118 = call i8* @realloc(i8* noundef %117, i64 noundef %110) #6
  %119 = icmp eq i8* %118, null
  br i1 %119, label %121, label %120

120:                                              ; preds = %116
  store i8* %118, i8** %3, align 8, !tbaa !3
  store i64 %110, i64* %4, align 8, !tbaa !13
  br label %124

121:                                              ; preds = %116
  %122 = tail call i32* @___errno_location() #7
  %123 = load i32, i32* %122, align 4, !tbaa !7
  br label %184

124:                                              ; preds = %120, %114
  %125 = phi i8* [ %118, %120 ], [ %113, %114 ]
  %126 = call i64 @fread(i8* noundef nonnull %125, i64 noundef %110, i64 noundef 1, %struct._IO_FILE* noundef nonnull %68) #6
  %127 = icmp eq i64 %126, 0
  br i1 %127, label %128, label %134

128:                                              ; preds = %124
  %129 = call i32 @ferror(%struct._IO_FILE* noundef nonnull %68) #6
  %130 = icmp eq i32 %129, 0
  br i1 %130, label %184, label %131

131:                                              ; preds = %128
  %132 = tail call i32* @___errno_location() #7
  %133 = load i32, i32* %132, align 4, !tbaa !7
  br label %184

134:                                              ; preds = %124
  %135 = load i8*, i8** %3, align 8, !tbaa !3
  %136 = getelementptr inbounds %struct.passwd, %struct.passwd* %2, i64 0, i32 0
  store i8* %135, i8** %136, align 8, !tbaa !9
  %137 = load i32, i32* %78, align 8, !tbaa !7
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds i8, i8* %135, i64 %138
  %140 = getelementptr inbounds %struct.passwd, %struct.passwd* %2, i64 0, i32 1
  store i8* %139, i8** %140, align 8, !tbaa !15
  %141 = load i32, i32* %79, align 4, !tbaa !7
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i8, i8* %139, i64 %142
  %144 = getelementptr inbounds %struct.passwd, %struct.passwd* %2, i64 0, i32 4
  store i8* %143, i8** %144, align 8, !tbaa !16
  %145 = load i32, i32* %82, align 8, !tbaa !7
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds i8, i8* %143, i64 %146
  %148 = getelementptr inbounds %struct.passwd, %struct.passwd* %2, i64 0, i32 5
  store i8* %147, i8** %148, align 8, !tbaa !17
  %149 = load i32, i32* %83, align 4, !tbaa !7
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds i8, i8* %147, i64 %150
  %152 = getelementptr inbounds %struct.passwd, %struct.passwd* %2, i64 0, i32 6
  store i8* %151, i8** %152, align 8, !tbaa !18
  %153 = getelementptr inbounds [9 x i32], [9 x i32]* %8, i64 0, i64 4
  %154 = load i32, i32* %153, align 16, !tbaa !7
  %155 = getelementptr inbounds %struct.passwd, %struct.passwd* %2, i64 0, i32 2
  store i32 %154, i32* %155, align 8, !tbaa !11
  %156 = getelementptr inbounds [9 x i32], [9 x i32]* %8, i64 0, i64 5
  %157 = load i32, i32* %156, align 4, !tbaa !7
  %158 = getelementptr inbounds %struct.passwd, %struct.passwd* %2, i64 0, i32 3
  store i32 %157, i32* %158, align 4, !tbaa !19
  %159 = getelementptr inbounds i8, i8* %139, i64 -1
  %160 = load i8, i8* %159, align 1, !tbaa !12
  %161 = icmp eq i8 %160, 0
  br i1 %161, label %162, label %184

162:                                              ; preds = %134
  %163 = getelementptr inbounds i8, i8* %143, i64 -1
  %164 = load i8, i8* %163, align 1, !tbaa !12
  %165 = icmp eq i8 %164, 0
  br i1 %165, label %166, label %184

166:                                              ; preds = %162
  %167 = getelementptr inbounds i8, i8* %147, i64 -1
  %168 = load i8, i8* %167, align 1, !tbaa !12
  %169 = icmp eq i8 %168, 0
  br i1 %169, label %170, label %184

170:                                              ; preds = %166
  %171 = load i32, i32* %91, align 16, !tbaa !7
  %172 = add nsw i32 %171, -1
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds i8, i8* %151, i64 %173
  %175 = load i8, i8* %174, align 1, !tbaa !12
  %176 = icmp eq i8 %175, 0
  br i1 %176, label %177, label %184

177:                                              ; preds = %170
  br i1 %49, label %181, label %178

178:                                              ; preds = %177
  %179 = call i32 @strcmp(i8* noundef nonnull %0, i8* noundef nonnull %135) #6
  %180 = icmp eq i32 %179, 0
  br i1 %180, label %183, label %184

181:                                              ; preds = %177
  %182 = icmp eq i32 %154, %1
  br i1 %182, label %183, label %184

183:                                              ; preds = %178, %181
  store %struct.passwd* %2, %struct.passwd** %5, align 8, !tbaa !3
  br label %184

184:                                              ; preds = %121, %178, %181, %134, %162, %166, %170, %131, %128, %95, %77, %73, %183
  %185 = phi i32 [ %123, %121 ], [ %40, %183 ], [ 0, %73 ], [ 5, %77 ], [ 12, %95 ], [ %133, %131 ], [ 5, %128 ], [ 5, %170 ], [ 5, %166 ], [ 5, %162 ], [ 5, %134 ], [ 5, %181 ], [ 5, %178 ]
  %186 = call i32 @fclose(%struct._IO_FILE* noundef nonnull %68) #6
  br label %187

187:                                              ; preds = %184, %70
  %188 = phi i32 [ %185, %184 ], [ %72, %70 ]
  call void @llvm.lifetime.end.p0i8(i64 11, i8* nonnull %52) #5
  call void @llvm.lifetime.end.p0i8(i64 36, i8* nonnull %51) #5
  br label %189

189:                                              ; preds = %187, %39, %20
  %190 = phi i32 [ %40, %39 ], [ %188, %187 ], [ %22, %20 ]
  %191 = load i32, i32* %7, align 4, !tbaa !7
  %192 = call i32 @pthread_setcancelstate(i32 noundef %191, i32* noundef null) #6
  %193 = icmp eq i32 %190, 0
  br i1 %193, label %197, label %194

194:                                              ; preds = %45, %189
  %195 = phi i32 [ %40, %45 ], [ %190, %189 ]
  %196 = tail call i32* @___errno_location() #7
  store i32 %195, i32* %196, align 4, !tbaa !7
  br label %197

197:                                              ; preds = %189, %194
  %198 = phi i32 [ 0, %189 ], [ %195, %194 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %11) #5
  ret i32 %198
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare %struct._IO_FILE* @fopen(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare hidden i32 @__getpwent_a(%struct._IO_FILE* noundef, %struct.passwd* noundef, i8** noundef, i64* noundef, %struct.passwd** noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @strcmp(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @fclose(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: optsize
declare hidden %struct._IO_FILE* @__nscd_query(i32 noundef, i8* noundef, i32* noundef, i64 noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @realloc(i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i64 @fread(i8* noundef, i64 noundef, i64 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @ferror(%struct._IO_FILE* noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
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
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
!9 = !{!10, !4, i64 0}
!10 = !{!"passwd", !4, i64 0, !4, i64 8, !8, i64 16, !8, i64 20, !4, i64 24, !4, i64 32, !4, i64 40}
!11 = !{!10, !8, i64 16}
!12 = !{!5, !5, i64 0}
!13 = !{!14, !14, i64 0}
!14 = !{!"long", !5, i64 0}
!15 = !{!10, !4, i64 8}
!16 = !{!10, !4, i64 24}
!17 = !{!10, !4, i64 32}
!18 = !{!10, !4, i64 40}
!19 = !{!10, !8, i64 20}
