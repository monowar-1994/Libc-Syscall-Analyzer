; ModuleID = 'src/network/resolvconf.c'
source_filename = "src/network/resolvconf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.resolvconf = type { [3 x %struct.address], i32, i32, i32, i32 }
%struct.address = type { i32, i32, [16 x i8], i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@.str = private unnamed_addr constant [17 x i8] c"/etc/resolv.conf\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"options\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"ndots:\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"attempts:\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"timeout:\00", align 1
@.str.5 = private unnamed_addr constant [11 x i8] c"nameserver\00", align 1
@.str.6 = private unnamed_addr constant [7 x i8] c"domain\00", align 1
@.str.7 = private unnamed_addr constant [7 x i8] c"search\00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__get_resolv_conf(%struct.resolvconf* noundef %0, i8* noundef %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = alloca [256 x i8], align 16
  %5 = alloca [256 x i8], align 16
  %6 = alloca %struct._IO_FILE, align 8
  %7 = alloca i8*, align 8
  %8 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %8) #4
  %9 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %9) #4
  %10 = bitcast %struct._IO_FILE* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 232, i8* nonnull %10) #4
  %11 = getelementptr inbounds %struct.resolvconf, %struct.resolvconf* %0, i64 0, i32 3
  store i32 1, i32* %11, align 4, !tbaa !3
  %12 = getelementptr inbounds %struct.resolvconf, %struct.resolvconf* %0, i64 0, i32 4
  store i32 5, i32* %12, align 4, !tbaa !8
  %13 = getelementptr inbounds %struct.resolvconf, %struct.resolvconf* %0, i64 0, i32 2
  store i32 2, i32* %13, align 4, !tbaa !9
  %14 = icmp eq i8* %1, null
  br i1 %14, label %16, label %15

15:                                               ; preds = %3
  store i8 0, i8* %1, align 1, !tbaa !10
  br label %16

16:                                               ; preds = %15, %3
  %17 = call %struct._IO_FILE* @__fopen_rb_ca(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i64 0, i64 0), %struct._IO_FILE* noundef nonnull %6, i8* noundef nonnull %9, i64 noundef 256) #5
  %18 = icmp eq %struct._IO_FILE* %17, null
  br i1 %18, label %31, label %19

19:                                               ; preds = %16
  %20 = call i8* @fgets(i8* noundef nonnull %8, i32 noundef 256, %struct._IO_FILE* noundef nonnull %17) #5
  %21 = icmp eq i8* %20, null
  br i1 %21, label %22, label %24

22:                                               ; preds = %19
  %23 = call i32 @__fclose_ca(%struct._IO_FILE* noundef nonnull %17) #5
  br label %186

24:                                               ; preds = %19
  %25 = bitcast i8** %7 to i8*
  %26 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %17, i64 0, i32 0
  %27 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i64 0, i64 7
  %28 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i64 0, i64 10
  %29 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i64 0, i64 11
  %30 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i64 0, i64 6
  br label %34

31:                                               ; preds = %16
  %32 = tail call i32* @___errno_location() #6
  %33 = load i32, i32* %32, align 4, !tbaa !11
  switch i32 %33, label %192 [
    i32 2, label %186
    i32 20, label %186
    i32 13, label %186
  ]

34:                                               ; preds = %24, %179
  %35 = phi i32 [ 0, %24 ], [ %180, %179 ]
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %25) #4
  %36 = call i8* @strchr(i8* noundef nonnull %8, i32 noundef 10) #5
  %37 = icmp eq i8* %36, null
  br i1 %37, label %38, label %44

38:                                               ; preds = %34
  %39 = load i32, i32* %26, align 8, !tbaa !12
  %40 = and i32 %39, 16
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %44

42:                                               ; preds = %38, %42
  %43 = call i32 @getc(%struct._IO_FILE* noundef nonnull %17) #5
  switch i32 %43, label %42 [
    i32 -1, label %179
    i32 10, label %179
  ]

44:                                               ; preds = %38, %34
  %45 = call i32 @strncmp(i8* noundef nonnull %8, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 noundef 7) #5
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %107

47:                                               ; preds = %44
  %48 = load i8, i8* %27, align 1, !tbaa !10
  %49 = sext i8 %48 to i32
  %50 = icmp ne i8 %48, 32
  %51 = add nsw i32 %49, -14
  %52 = icmp ult i32 %51, -5
  %53 = and i1 %50, %52
  br i1 %53, label %107, label %54

54:                                               ; preds = %47
  %55 = call i8* @strstr(i8* noundef nonnull %8, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0)) #5
  %56 = icmp eq i8* %55, null
  br i1 %56, label %71, label %57

57:                                               ; preds = %54
  %58 = getelementptr inbounds i8, i8* %55, i64 6
  %59 = load i8, i8* %58, align 1, !tbaa !10
  %60 = sext i8 %59 to i32
  %61 = add nsw i32 %60, -48
  %62 = icmp ult i32 %61, 10
  br i1 %62, label %63, label %71

63:                                               ; preds = %57
  %64 = call i64 @strtoul(i8* noundef nonnull %58, i8** noundef nonnull %7, i32 noundef 10) #5
  %65 = load i8*, i8** %7, align 8, !tbaa !16
  %66 = icmp eq i8* %65, %58
  br i1 %66, label %71, label %67

67:                                               ; preds = %63
  %68 = icmp ult i64 %64, 15
  %69 = select i1 %68, i64 %64, i64 15
  %70 = trunc i64 %69 to i32
  store i32 %70, i32* %11, align 4, !tbaa !3
  br label %71

71:                                               ; preds = %63, %67, %57, %54
  %72 = call i8* @strstr(i8* noundef nonnull %8, i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0)) #5
  %73 = icmp eq i8* %72, null
  br i1 %73, label %88, label %74

74:                                               ; preds = %71
  %75 = getelementptr inbounds i8, i8* %72, i64 9
  %76 = load i8, i8* %75, align 1, !tbaa !10
  %77 = sext i8 %76 to i32
  %78 = add nsw i32 %77, -48
  %79 = icmp ult i32 %78, 10
  br i1 %79, label %80, label %88

80:                                               ; preds = %74
  %81 = call i64 @strtoul(i8* noundef nonnull %75, i8** noundef nonnull %7, i32 noundef 10) #5
  %82 = load i8*, i8** %7, align 8, !tbaa !16
  %83 = icmp eq i8* %82, %75
  br i1 %83, label %88, label %84

84:                                               ; preds = %80
  %85 = icmp ult i64 %81, 10
  %86 = select i1 %85, i64 %81, i64 10
  %87 = trunc i64 %86 to i32
  store i32 %87, i32* %13, align 4, !tbaa !9
  br label %88

88:                                               ; preds = %80, %84, %74, %71
  %89 = call i8* @strstr(i8* noundef nonnull %8, i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0)) #5
  %90 = icmp eq i8* %89, null
  br i1 %90, label %179, label %91

91:                                               ; preds = %88
  %92 = getelementptr inbounds i8, i8* %89, i64 8
  %93 = load i8, i8* %92, align 1, !tbaa !10
  %94 = sext i8 %93 to i32
  %95 = add nsw i32 %94, -48
  %96 = icmp ult i32 %95, 10
  %97 = icmp eq i8 %93, 46
  %98 = select i1 %96, i1 true, i1 %97
  br i1 %98, label %99, label %179

99:                                               ; preds = %91
  %100 = call i64 @strtoul(i8* noundef nonnull %92, i8** noundef nonnull %7, i32 noundef 10) #5
  %101 = load i8*, i8** %7, align 8, !tbaa !16
  %102 = icmp eq i8* %101, %92
  br i1 %102, label %179, label %103

103:                                              ; preds = %99
  %104 = icmp ult i64 %100, 60
  %105 = select i1 %104, i64 %100, i64 60
  %106 = trunc i64 %105 to i32
  store i32 %106, i32* %12, align 4, !tbaa !8
  br label %179

107:                                              ; preds = %47, %44
  %108 = call i32 @strncmp(i8* noundef nonnull %8, i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i64 0, i64 0), i64 noundef 10) #5
  %109 = icmp eq i32 %108, 0
  br i1 %109, label %110, label %150

110:                                              ; preds = %107
  %111 = load i8, i8* %28, align 2, !tbaa !10
  %112 = sext i8 %111 to i32
  %113 = icmp ne i8 %111, 32
  %114 = add nsw i32 %112, -14
  %115 = icmp ult i32 %114, -5
  %116 = and i1 %113, %115
  br i1 %116, label %150, label %117

117:                                              ; preds = %110
  %118 = icmp sgt i32 %35, 2
  br i1 %118, label %179, label %119

119:                                              ; preds = %117, %119
  %120 = phi i8* [ %127, %119 ], [ %29, %117 ]
  %121 = load i8, i8* %120, align 1, !tbaa !10
  %122 = sext i8 %121 to i32
  %123 = icmp ne i8 %121, 32
  %124 = add nsw i32 %122, -14
  %125 = icmp ult i32 %124, -5
  %126 = and i1 %123, %125
  %127 = getelementptr inbounds i8, i8* %120, i64 1
  br i1 %126, label %128, label %119

128:                                              ; preds = %119
  %129 = icmp eq i8 %121, 0
  br i1 %129, label %142, label %130

130:                                              ; preds = %128, %138
  %131 = phi i8 [ %140, %138 ], [ %121, %128 ]
  %132 = phi i8* [ %139, %138 ], [ %120, %128 ]
  %133 = sext i8 %131 to i32
  %134 = icmp ne i8 %131, 32
  %135 = add nsw i32 %133, -14
  %136 = icmp ult i32 %135, -5
  %137 = and i1 %134, %136
  br i1 %137, label %138, label %142

138:                                              ; preds = %130
  %139 = getelementptr inbounds i8, i8* %132, i64 1
  %140 = load i8, i8* %139, align 1, !tbaa !10
  %141 = icmp eq i8 %140, 0
  br i1 %141, label %142, label %130

142:                                              ; preds = %130, %138, %128
  %143 = phi i8* [ %120, %128 ], [ %139, %138 ], [ %132, %130 ]
  store i8* %143, i8** %7, align 8, !tbaa !16
  store i8 0, i8* %143, align 1, !tbaa !10
  %144 = sext i32 %35 to i64
  %145 = getelementptr inbounds %struct.resolvconf, %struct.resolvconf* %0, i64 0, i32 0, i64 %144
  %146 = call i32 @__lookup_ipliteral(%struct.address* noundef %145, i8* noundef nonnull %120, i32 noundef 0) #5
  %147 = icmp sgt i32 %146, 0
  %148 = zext i1 %147 to i32
  %149 = add nsw i32 %35, %148
  br label %179

150:                                              ; preds = %110, %107
  br i1 %14, label %179, label %151

151:                                              ; preds = %150
  %152 = call i32 @strncmp(i8* noundef nonnull %8, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i64 noundef 6) #5
  %153 = icmp eq i32 %152, 0
  br i1 %153, label %157, label %154

154:                                              ; preds = %151
  %155 = call i32 @strncmp(i8* noundef nonnull %8, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.7, i64 0, i64 0), i64 noundef 6) #5
  %156 = icmp eq i32 %155, 0
  br i1 %156, label %157, label %179

157:                                              ; preds = %154, %151
  %158 = load i8, i8* %30, align 2, !tbaa !10
  %159 = sext i8 %158 to i32
  %160 = icmp ne i8 %158, 32
  %161 = add nsw i32 %159, -14
  %162 = icmp ult i32 %161, -5
  %163 = and i1 %160, %162
  br i1 %163, label %179, label %164

164:                                              ; preds = %157, %164
  %165 = phi i8* [ %172, %164 ], [ %27, %157 ]
  %166 = load i8, i8* %165, align 1, !tbaa !10
  %167 = sext i8 %166 to i32
  %168 = icmp ne i8 %166, 32
  %169 = add nsw i32 %167, -14
  %170 = icmp ult i32 %169, -5
  %171 = and i1 %168, %170
  %172 = getelementptr inbounds i8, i8* %165, i64 1
  br i1 %171, label %173, label %164

173:                                              ; preds = %164
  %174 = call i64 @strlen(i8* noundef nonnull %165) #5
  %175 = icmp ult i64 %174, %2
  br i1 %175, label %176, label %179

176:                                              ; preds = %173
  %177 = add nuw i64 %174, 1
  %178 = call i8* @memcpy(i8* noundef nonnull %1, i8* noundef nonnull %165, i64 noundef %177) #5
  br label %179

179:                                              ; preds = %42, %42, %176, %173, %154, %157, %150, %117, %88, %91, %103, %99, %142
  %180 = phi i32 [ %149, %142 ], [ %35, %99 ], [ %35, %103 ], [ %35, %91 ], [ %35, %88 ], [ %35, %117 ], [ %35, %150 ], [ %35, %157 ], [ %35, %154 ], [ %35, %173 ], [ %35, %176 ], [ %35, %42 ], [ %35, %42 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %25) #4
  %181 = call i8* @fgets(i8* noundef nonnull %8, i32 noundef 256, %struct._IO_FILE* noundef nonnull %17) #5
  %182 = icmp eq i8* %181, null
  br i1 %182, label %183, label %34

183:                                              ; preds = %179
  %184 = call i32 @__fclose_ca(%struct._IO_FILE* noundef nonnull %17) #5
  %185 = icmp eq i32 %180, 0
  br i1 %185, label %186, label %189

186:                                              ; preds = %22, %31, %31, %31, %183
  %187 = getelementptr inbounds %struct.resolvconf, %struct.resolvconf* %0, i64 0, i32 0, i64 0
  %188 = call i32 @__lookup_ipliteral(%struct.address* noundef %187, i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.8, i64 0, i64 0), i32 noundef 0) #5
  br label %189

189:                                              ; preds = %186, %183
  %190 = phi i32 [ %180, %183 ], [ 1, %186 ]
  %191 = getelementptr inbounds %struct.resolvconf, %struct.resolvconf* %0, i64 0, i32 1
  store i32 %190, i32* %191, align 4, !tbaa !17
  br label %192

192:                                              ; preds = %31, %189
  %193 = phi i32 [ 0, %189 ], [ -1, %31 ]
  call void @llvm.lifetime.end.p0i8(i64 232, i8* nonnull %10) #4
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %9) #4
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %8) #4
  ret i32 %193
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden %struct._IO_FILE* @__fopen_rb_ca(i8* noundef, %struct._IO_FILE* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @fgets(i8* noundef, i32 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @strchr(i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @getc(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @strncmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @strstr(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @strtoul(i8* noundef, i8** noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__lookup_ipliteral(%struct.address* noundef, i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__fclose_ca(%struct._IO_FILE* noundef) local_unnamed_addr #2

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
!3 = !{!4, !7, i64 92}
!4 = !{!"resolvconf", !5, i64 0, !7, i64 84, !7, i64 88, !7, i64 92, !7, i64 96}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!"int", !5, i64 0}
!8 = !{!4, !7, i64 96}
!9 = !{!4, !7, i64 88}
!10 = !{!5, !5, i64 0}
!11 = !{!7, !7, i64 0}
!12 = !{!13, !7, i64 0}
!13 = !{!"_IO_FILE", !7, i64 0, !14, i64 8, !14, i64 16, !14, i64 24, !14, i64 32, !14, i64 40, !14, i64 48, !14, i64 56, !14, i64 64, !14, i64 72, !14, i64 80, !14, i64 88, !15, i64 96, !14, i64 104, !14, i64 112, !7, i64 120, !7, i64 124, !15, i64 128, !7, i64 136, !7, i64 140, !7, i64 144, !14, i64 152, !15, i64 160, !14, i64 168, !14, i64 176, !14, i64 184, !15, i64 192, !15, i64 200, !14, i64 208, !14, i64 216, !14, i64 224}
!14 = !{!"any pointer", !5, i64 0}
!15 = !{!"long", !5, i64 0}
!16 = !{!14, !14, i64 0}
!17 = !{!4, !7, i64 84}
