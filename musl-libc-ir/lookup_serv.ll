; ModuleID = 'src/network/lookup_serv.c'
source_filename = "src/network/lookup_serv.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.service = type { i16, i8, i8 }
%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"/etc/services\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"/udp\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"/tcp\00", align 1

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__lookup_serv(%struct.service* nocapture noundef writeonly align 2 dereferenceable(8) %0, i8* noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) local_unnamed_addr #0 {
  %6 = alloca [128 x i8], align 16
  %7 = alloca i8*, align 8
  %8 = alloca [1032 x i8], align 16
  %9 = alloca %struct._IO_FILE, align 8
  %10 = getelementptr inbounds [128 x i8], [128 x i8]* %6, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %10) #4
  %11 = bitcast i8** %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %11) #4
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i64 0, i64 0), i8** %7, align 8, !tbaa !3
  switch i32 %3, label %14 [
    i32 1, label %12
    i32 2, label %13
    i32 0, label %22
  ]

12:                                               ; preds = %5
  switch i32 %2, label %169 [
    i32 0, label %22
    i32 6, label %22
  ]

13:                                               ; preds = %5
  switch i32 %2, label %169 [
    i32 0, label %22
    i32 17, label %22
  ]

14:                                               ; preds = %5
  %15 = icmp eq i8* %1, null
  br i1 %15, label %16, label %169

16:                                               ; preds = %14
  %17 = getelementptr inbounds %struct.service, %struct.service* %0, i64 0, i32 0
  store i16 0, i16* %17, align 2, !tbaa !7
  %18 = trunc i32 %2 to i8
  %19 = getelementptr inbounds %struct.service, %struct.service* %0, i64 0, i32 1
  store i8 %18, i8* %19, align 2, !tbaa !10
  %20 = trunc i32 %3 to i8
  %21 = getelementptr inbounds %struct.service, %struct.service* %0, i64 0, i32 2
  store i8 %20, i8* %21, align 1, !tbaa !11
  br label %169

22:                                               ; preds = %13, %12, %13, %12, %5
  %23 = phi i32 [ %2, %5 ], [ 17, %13 ], [ 6, %12 ], [ 6, %12 ], [ 17, %13 ]
  %24 = icmp eq i8* %1, null
  br i1 %24, label %35, label %25

25:                                               ; preds = %22
  %26 = load i8, i8* %1, align 1, !tbaa !12
  %27 = icmp eq i8 %26, 0
  br i1 %27, label %169, label %28

28:                                               ; preds = %25
  %29 = call i64 @strtoul(i8* noundef nonnull %1, i8** noundef nonnull %7, i32 noundef 10) #5
  %30 = load i8*, i8** %7, align 8, !tbaa !3
  %31 = load i8, i8* %30, align 1, !tbaa !12
  %32 = icmp eq i8 %31, 0
  br i1 %32, label %33, label %51

33:                                               ; preds = %28
  %34 = icmp ugt i64 %29, 65535
  br i1 %34, label %169, label %35

35:                                               ; preds = %22, %33
  %36 = phi i64 [ %29, %33 ], [ 0, %22 ]
  %37 = icmp eq i32 %23, 17
  %38 = trunc i64 %36 to i16
  br i1 %37, label %44, label %39

39:                                               ; preds = %35
  %40 = getelementptr inbounds %struct.service, %struct.service* %0, i64 0, i32 0
  store i16 %38, i16* %40, align 2, !tbaa !7
  %41 = getelementptr inbounds %struct.service, %struct.service* %0, i64 0, i32 2
  store i8 1, i8* %41, align 1, !tbaa !11
  %42 = getelementptr inbounds %struct.service, %struct.service* %0, i64 0, i32 1
  store i8 6, i8* %42, align 2, !tbaa !10
  %43 = icmp eq i32 %23, 6
  br i1 %43, label %169, label %44

44:                                               ; preds = %35, %39
  %45 = phi i32 [ 1, %39 ], [ 0, %35 ]
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds %struct.service, %struct.service* %0, i64 %46, i32 0
  store i16 %38, i16* %47, align 2, !tbaa !7
  %48 = getelementptr inbounds %struct.service, %struct.service* %0, i64 %46, i32 2
  store i8 2, i8* %48, align 1, !tbaa !11
  %49 = add nuw nsw i32 %45, 1
  %50 = getelementptr inbounds %struct.service, %struct.service* %0, i64 %46, i32 1
  store i8 17, i8* %50, align 2, !tbaa !10
  br label %169

51:                                               ; preds = %28
  %52 = and i32 %4, 1024
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %54, label %169

54:                                               ; preds = %51
  %55 = call i64 @strlen(i8* noundef nonnull %1) #5
  %56 = getelementptr inbounds [1032 x i8], [1032 x i8]* %8, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 1032, i8* nonnull %56) #4
  %57 = bitcast %struct._IO_FILE* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 232, i8* nonnull %57) #4
  %58 = call %struct._IO_FILE* @__fopen_rb_ca(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), %struct._IO_FILE* noundef nonnull %9, i8* noundef nonnull %56, i64 noundef 1032) #5
  %59 = icmp eq %struct._IO_FILE* %58, null
  br i1 %59, label %68, label %60

60:                                               ; preds = %54
  %61 = call i8* @fgets(i8* noundef nonnull %10, i32 noundef 128, %struct._IO_FILE* noundef nonnull %58) #5
  %62 = icmp eq i8* %61, null
  br i1 %62, label %63, label %65

63:                                               ; preds = %60
  %64 = call i32 @__fclose_ca(%struct._IO_FILE* noundef nonnull %58) #5
  br label %167

65:                                               ; preds = %60
  %66 = icmp eq i32 %23, 6
  %67 = icmp eq i32 %23, 17
  br label %147

68:                                               ; preds = %54
  %69 = tail call i32* @___errno_location() #6
  %70 = load i32, i32* %69, align 4, !tbaa !13
  switch i32 %70, label %71 [
    i32 2, label %167
    i32 20, label %167
    i32 13, label %167
  ]

71:                                               ; preds = %68
  br label %167

72:                                               ; preds = %147, %127
  %73 = call i8* @strchr(i8* noundef nonnull %10, i32 noundef 35) #5
  %74 = icmp eq i8* %73, null
  br i1 %74, label %77, label %75

75:                                               ; preds = %72
  %76 = getelementptr inbounds i8, i8* %73, i64 1
  store i8 10, i8* %73, align 1, !tbaa !12
  store i8 0, i8* %76, align 1, !tbaa !12
  br label %77

77:                                               ; preds = %75, %72
  %78 = call i8* @strstr(i8* noundef nonnull %10, i8* noundef nonnull %1) #5
  %79 = icmp eq i8* %78, null
  br i1 %79, label %127, label %80

80:                                               ; preds = %77, %101
  %81 = phi i8* [ %103, %101 ], [ %78, %77 ]
  %82 = icmp ugt i8* %81, %10
  br i1 %82, label %83, label %91

83:                                               ; preds = %80
  %84 = getelementptr inbounds i8, i8* %81, i64 -1
  %85 = load i8, i8* %84, align 1, !tbaa !12
  %86 = sext i8 %85 to i32
  %87 = icmp ne i8 %85, 32
  %88 = add nsw i32 %86, -14
  %89 = icmp ult i32 %88, -5
  %90 = and i1 %87, %89
  br i1 %90, label %101, label %91

91:                                               ; preds = %83, %80
  %92 = getelementptr inbounds i8, i8* %81, i64 %55
  %93 = load i8, i8* %92, align 1, !tbaa !12
  %94 = icmp eq i8 %93, 0
  br i1 %94, label %105, label %95

95:                                               ; preds = %91
  %96 = sext i8 %93 to i32
  %97 = icmp ne i8 %93, 32
  %98 = add nsw i32 %96, -14
  %99 = icmp ult i32 %98, -5
  %100 = and i1 %97, %99
  br i1 %100, label %101, label %105

101:                                              ; preds = %95, %83
  %102 = getelementptr inbounds i8, i8* %81, i64 1
  %103 = call i8* @strstr(i8* noundef nonnull %102, i8* noundef nonnull %1) #5
  %104 = icmp eq i8* %103, null
  br i1 %104, label %127, label %80

105:                                              ; preds = %91, %95
  %106 = load i8, i8* %10, align 16, !tbaa !12
  %107 = icmp eq i8 %106, 0
  br i1 %107, label %120, label %108

108:                                              ; preds = %105, %116
  %109 = phi i8 [ %118, %116 ], [ %106, %105 ]
  %110 = phi i8* [ %117, %116 ], [ %10, %105 ]
  %111 = sext i8 %109 to i32
  %112 = icmp ne i8 %109, 32
  %113 = add nsw i32 %111, -14
  %114 = icmp ult i32 %113, -5
  %115 = and i1 %112, %114
  br i1 %115, label %116, label %120

116:                                              ; preds = %108
  %117 = getelementptr inbounds i8, i8* %110, i64 1
  %118 = load i8, i8* %117, align 1, !tbaa !12
  %119 = icmp eq i8 %118, 0
  br i1 %119, label %120, label %108

120:                                              ; preds = %108, %116, %105
  %121 = phi i8* [ %10, %105 ], [ %117, %116 ], [ %110, %108 ]
  %122 = call i64 @strtoul(i8* noundef nonnull %121, i8** noundef nonnull %7, i32 noundef 10) #5
  %123 = icmp ugt i64 %122, 65535
  br i1 %123, label %127, label %124

124:                                              ; preds = %120
  %125 = load i8*, i8** %7, align 8, !tbaa !3
  %126 = icmp eq i8* %125, %121
  br i1 %126, label %127, label %130

127:                                              ; preds = %101, %120, %124, %77, %133
  %128 = call i8* @fgets(i8* noundef nonnull %10, i32 noundef 128, %struct._IO_FILE* noundef nonnull %58) #5
  %129 = icmp eq i8* %128, null
  br i1 %129, label %162, label %72

130:                                              ; preds = %124
  %131 = call i32 @strncmp(i8* noundef %125, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 noundef 4) #5
  %132 = icmp eq i32 %131, 0
  br i1 %132, label %133, label %141

133:                                              ; preds = %130
  br i1 %66, label %127, label %134

134:                                              ; preds = %133
  %135 = trunc i64 %122 to i16
  %136 = sext i32 %148 to i64
  %137 = getelementptr inbounds %struct.service, %struct.service* %0, i64 %136, i32 0
  store i16 %135, i16* %137, align 2, !tbaa !7
  %138 = getelementptr inbounds %struct.service, %struct.service* %0, i64 %136, i32 2
  store i8 2, i8* %138, align 1, !tbaa !11
  %139 = add nsw i32 %148, 1
  %140 = getelementptr inbounds %struct.service, %struct.service* %0, i64 %136, i32 1
  store i8 17, i8* %140, align 2, !tbaa !10
  br label %141

141:                                              ; preds = %130, %134
  %142 = phi i32 [ %139, %134 ], [ %148, %130 ]
  %143 = load i8*, i8** %7, align 8, !tbaa !3
  %144 = call i32 @strncmp(i8* noundef %143, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i64 noundef 4) #5
  %145 = icmp ne i32 %144, 0
  %146 = or i1 %145, %67
  br i1 %146, label %156, label %149

147:                                              ; preds = %65, %156
  %148 = phi i32 [ 0, %65 ], [ %157, %156 ]
  br label %72

149:                                              ; preds = %141
  %150 = trunc i64 %122 to i16
  %151 = sext i32 %142 to i64
  %152 = getelementptr inbounds %struct.service, %struct.service* %0, i64 %151, i32 0
  store i16 %150, i16* %152, align 2, !tbaa !7
  %153 = getelementptr inbounds %struct.service, %struct.service* %0, i64 %151, i32 2
  store i8 1, i8* %153, align 1, !tbaa !11
  %154 = add nsw i32 %142, 1
  %155 = getelementptr inbounds %struct.service, %struct.service* %0, i64 %151, i32 1
  store i8 6, i8* %155, align 2, !tbaa !10
  br label %156

156:                                              ; preds = %141, %149
  %157 = phi i32 [ %142, %141 ], [ %154, %149 ]
  %158 = call i8* @fgets(i8* noundef nonnull %10, i32 noundef 128, %struct._IO_FILE* noundef nonnull %58) #5
  %159 = icmp ne i8* %158, null
  %160 = icmp slt i32 %157, 2
  %161 = select i1 %159, i1 %160, i1 false
  br i1 %161, label %147, label %162

162:                                              ; preds = %156, %127
  %163 = phi i32 [ %148, %127 ], [ %157, %156 ]
  %164 = call i32 @__fclose_ca(%struct._IO_FILE* noundef nonnull %58) #5
  %165 = icmp sgt i32 %163, 0
  %166 = select i1 %165, i32 %163, i32 -8
  br label %167

167:                                              ; preds = %162, %63, %68, %68, %68, %71
  %168 = phi i32 [ -11, %71 ], [ -8, %68 ], [ -8, %68 ], [ -8, %68 ], [ -8, %63 ], [ %166, %162 ]
  call void @llvm.lifetime.end.p0i8(i64 232, i8* nonnull %57) #4
  call void @llvm.lifetime.end.p0i8(i64 1032, i8* nonnull %56) #4
  br label %169

169:                                              ; preds = %51, %39, %44, %33, %25, %14, %13, %12, %167, %16
  %170 = phi i32 [ 1, %16 ], [ %168, %167 ], [ -8, %12 ], [ -8, %13 ], [ -8, %14 ], [ -8, %25 ], [ -8, %33 ], [ %49, %44 ], [ 1, %39 ], [ -2, %51 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %11) #4
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %10) #4
  ret i32 %170
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i64 @strtoul(i8* noundef, i8** noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden %struct._IO_FILE* @__fopen_rb_ca(i8* noundef, %struct._IO_FILE* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @fgets(i8* noundef, i32 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @strchr(i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @strstr(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @strncmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__fclose_ca(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !9, i64 0}
!8 = !{!"service", !9, i64 0, !5, i64 2, !5, i64 3}
!9 = !{!"short", !5, i64 0}
!10 = !{!8, !5, i64 2}
!11 = !{!8, !5, i64 3}
!12 = !{!5, !5, i64 0}
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !5, i64 0}
