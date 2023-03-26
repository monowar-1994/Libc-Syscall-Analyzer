; ModuleID = 'src/network/getaddrinfo.c'
source_filename = "src/network/getaddrinfo.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.addrinfo = type { i32, i32, i32, i32, i32, %struct.sockaddr*, i8*, %struct.addrinfo* }
%struct.sockaddr = type { i16, [14 x i8] }
%struct.service = type { i16, i8, i8 }
%struct.address = type { i32, i32, [16 x i8], i32 }
%struct.aibuf = type { %struct.addrinfo, %union.sa, [1 x i32], i16, i16 }
%union.sa = type { %struct.sockaddr_in6 }
%struct.sockaddr_in6 = type { i16, i16, i32, %struct.in6_addr, i32 }
%struct.in6_addr = type { %union.anon }
%union.anon = type { [4 x i32] }

@getaddrinfo.lo4 = internal constant %struct.sockaddr_in { i16 2, i16 -1, %struct.in_addr { i32 16777343 }, [8 x i8] zeroinitializer }, align 4
@getaddrinfo.lo6 = internal constant { i16, i16, i32, { { [16 x i8] } }, i32 } { i16 10, i16 -1, i32 0, { { [16 x i8] } } { { [16 x i8] } { [16 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01" } }, i32 0 }, align 4
@__const.getaddrinfo.tf = private unnamed_addr constant [2 x i32] [i32 2, i32 10], align 4
@__const.getaddrinfo.ta = private unnamed_addr constant [2 x i8*] [i8* bitcast (%struct.sockaddr_in* @getaddrinfo.lo4 to i8*), i8* bitcast ({ i16, i16, i32, { { [16 x i8] } }, i32 }* @getaddrinfo.lo6 to i8*)], align 16
@__const.getaddrinfo.tl = private unnamed_addr constant [2 x i32] [i32 16, i32 28], align 4

; Function Attrs: nounwind optsize strictfp
define i32 @getaddrinfo(i8* noalias noundef %0, i8* noalias noundef %1, %struct.addrinfo* noalias noundef readonly %2, %struct.addrinfo** noalias nocapture noundef writeonly %3) local_unnamed_addr #0 {
  %5 = alloca [2 x %struct.service], align 2
  %6 = alloca [48 x %struct.address], align 16
  %7 = alloca [256 x i8], align 16
  %8 = alloca i32, align 4
  %9 = bitcast [2 x %struct.service]* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %9) #4
  %10 = bitcast [48 x %struct.address]* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 1344, i8* nonnull %10) #4
  %11 = getelementptr inbounds [256 x i8], [256 x i8]* %7, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %11) #4
  %12 = icmp ne i8* %0, null
  %13 = icmp ne i8* %1, null
  %14 = or i1 %12, %13
  br i1 %14, label %15, label %182

15:                                               ; preds = %4
  %16 = icmp eq %struct.addrinfo* %2, null
  br i1 %16, label %66, label %17

17:                                               ; preds = %15
  %18 = getelementptr inbounds %struct.addrinfo, %struct.addrinfo* %2, i64 0, i32 1
  %19 = load i32, i32* %18, align 4, !tbaa !3
  %20 = getelementptr inbounds %struct.addrinfo, %struct.addrinfo* %2, i64 0, i32 0
  %21 = load i32, i32* %20, align 8, !tbaa !9
  %22 = getelementptr inbounds %struct.addrinfo, %struct.addrinfo* %2, i64 0, i32 3
  %23 = load i32, i32* %22, align 4, !tbaa !10
  %24 = getelementptr inbounds %struct.addrinfo, %struct.addrinfo* %2, i64 0, i32 2
  %25 = load i32, i32* %24, align 8, !tbaa !11
  %26 = and i32 %21, 1087
  %27 = icmp eq i32 %26, %21
  br i1 %27, label %28, label %182

28:                                               ; preds = %17
  switch i32 %19, label %182 [
    i32 2, label %29
    i32 10, label %29
    i32 0, label %29
  ]

29:                                               ; preds = %28, %28, %28
  %30 = and i32 %21, 32
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %66, label %32

32:                                               ; preds = %29
  %33 = bitcast i32* %8 to i8*
  br label %34

34:                                               ; preds = %32, %64
  %35 = phi i1 [ true, %32 ], [ false, %64 ]
  %36 = phi i64 [ 0, %32 ], [ 1, %64 ]
  %37 = phi i32 [ %19, %32 ], [ %65, %64 ]
  %38 = xor i64 %36, 1
  %39 = getelementptr inbounds [2 x i32], [2 x i32]* @__const.getaddrinfo.tf, i64 0, i64 %38
  %40 = load i32, i32* %39, align 4, !tbaa !12
  %41 = icmp eq i32 %37, %40
  br i1 %41, label %64, label %42

42:                                               ; preds = %34
  %43 = getelementptr inbounds [2 x i32], [2 x i32]* @__const.getaddrinfo.tf, i64 0, i64 %36
  %44 = load i32, i32* %43, align 4, !tbaa !12
  %45 = call i32 @socket(i32 noundef %44, i32 noundef 524290, i32 noundef 17) #5
  %46 = icmp sgt i32 %45, -1
  br i1 %46, label %47, label %59

47:                                               ; preds = %42
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %33) #4
  %48 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %8) #5
  %49 = getelementptr inbounds [2 x i8*], [2 x i8*]* @__const.getaddrinfo.ta, i64 0, i64 %36
  %50 = bitcast i8** %49 to %struct.sockaddr**
  %51 = load %struct.sockaddr*, %struct.sockaddr** %50, align 8, !tbaa !13
  %52 = getelementptr inbounds [2 x i32], [2 x i32]* @__const.getaddrinfo.tl, i64 0, i64 %36
  %53 = load i32, i32* %52, align 4, !tbaa !12
  %54 = call i32 @connect(i32 noundef %45, %struct.sockaddr* noundef %51, i32 noundef %53) #5
  %55 = load i32, i32* %8, align 4, !tbaa !12
  %56 = call i32 @pthread_setcancelstate(i32 noundef %55, i32* noundef null) #5
  %57 = call i32 @close(i32 noundef %45) #5
  %58 = icmp eq i32 %54, 0
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %33) #4
  br i1 %58, label %64, label %59

59:                                               ; preds = %47, %42
  %60 = tail call i32* @___errno_location() #6
  %61 = load i32, i32* %60, align 4, !tbaa !12
  switch i32 %61, label %182 [
    i32 99, label %62
    i32 97, label %62
    i32 113, label %62
    i32 100, label %62
    i32 101, label %62
  ]

62:                                               ; preds = %59, %59, %59, %59, %59
  %63 = icmp eq i32 %37, %44
  br i1 %63, label %182, label %64

64:                                               ; preds = %47, %62, %34
  %65 = phi i32 [ %37, %34 ], [ %40, %62 ], [ %37, %47 ]
  br i1 %35, label %34, label %66

66:                                               ; preds = %64, %15, %29
  %67 = phi i32 [ %21, %29 ], [ 0, %15 ], [ %21, %64 ]
  %68 = phi i32 [ %23, %29 ], [ 0, %15 ], [ %23, %64 ]
  %69 = phi i32 [ %25, %29 ], [ 0, %15 ], [ %25, %64 ]
  %70 = phi i32 [ %19, %29 ], [ 0, %15 ], [ %65, %64 ]
  %71 = getelementptr inbounds [2 x %struct.service], [2 x %struct.service]* %5, i64 0, i64 0
  %72 = call i32 @__lookup_serv(%struct.service* noundef nonnull %71, i8* noundef %1, i32 noundef %68, i32 noundef %69, i32 noundef %67) #5
  %73 = icmp slt i32 %72, 0
  br i1 %73, label %182, label %74

74:                                               ; preds = %66
  %75 = getelementptr inbounds [48 x %struct.address], [48 x %struct.address]* %6, i64 0, i64 0
  %76 = call i32 @__lookup_name(%struct.address* noundef nonnull %75, i8* noundef nonnull %11, i8* noundef %0, i32 noundef %70, i32 noundef %67) #5
  %77 = icmp slt i32 %76, 0
  br i1 %77, label %182, label %78

78:                                               ; preds = %74
  %79 = mul nsw i32 %76, %72
  %80 = call i64 @strlen(i8* noundef nonnull %11) #5
  %81 = sext i32 %79 to i64
  %82 = mul nsw i64 %81, 88
  %83 = shl i64 %80, 32
  %84 = ashr exact i64 %83, 32
  %85 = or i64 %82, 1
  %86 = add nsw i64 %85, %84
  %87 = call i8* @calloc(i64 noundef 1, i64 noundef %86) #5
  %88 = bitcast i8* %87 to %struct.aibuf*
  %89 = icmp eq i8* %87, null
  br i1 %89, label %182, label %90

90:                                               ; preds = %78
  %91 = trunc i64 %80 to i32
  %92 = icmp eq i32 %91, 0
  br i1 %92, label %99, label %93

93:                                               ; preds = %90
  %94 = getelementptr inbounds %struct.aibuf, %struct.aibuf* %88, i64 %81
  %95 = bitcast %struct.aibuf* %94 to i8*
  %96 = add i64 %83, 4294967296
  %97 = ashr exact i64 %96, 32
  %98 = call i8* @memcpy(i8* noundef nonnull %95, i8* noundef nonnull %11, i64 noundef %97) #5
  br label %99

99:                                               ; preds = %90, %93
  %100 = phi i8* [ %95, %93 ], [ null, %90 ]
  %101 = icmp eq i32 %76, 0
  br i1 %101, label %177, label %102

102:                                              ; preds = %99
  %103 = icmp eq i32 %72, 0
  %104 = zext i32 %76 to i64
  %105 = zext i32 %72 to i64
  br label %106

106:                                              ; preds = %102, %173
  %107 = phi i64 [ 0, %102 ], [ %175, %173 ]
  %108 = phi i32 [ 0, %102 ], [ %174, %173 ]
  br i1 %103, label %173, label %109

109:                                              ; preds = %106
  %110 = getelementptr inbounds [48 x %struct.address], [48 x %struct.address]* %6, i64 0, i64 %107, i32 0
  %111 = getelementptr inbounds [48 x %struct.address], [48 x %struct.address]* %6, i64 0, i64 %107, i32 1
  %112 = getelementptr inbounds [48 x %struct.address], [48 x %struct.address]* %6, i64 0, i64 %107, i32 2, i64 0
  %113 = sext i32 %108 to i64
  br label %114

114:                                              ; preds = %109, %167
  %115 = phi i64 [ %113, %109 ], [ %169, %167 ]
  %116 = phi i64 [ 0, %109 ], [ %168, %167 ]
  %117 = trunc i64 %115 to i16
  %118 = getelementptr inbounds %struct.aibuf, %struct.aibuf* %88, i64 %115
  %119 = getelementptr inbounds %struct.aibuf, %struct.aibuf* %88, i64 %115, i32 3
  store i16 %117, i16* %119, align 8, !tbaa !14
  %120 = load i32, i32* %110, align 4, !tbaa !17
  %121 = getelementptr inbounds [2 x %struct.service], [2 x %struct.service]* %5, i64 0, i64 %116
  %122 = getelementptr inbounds [2 x %struct.service], [2 x %struct.service]* %5, i64 0, i64 %116, i32 2
  %123 = load i8, i8* %122, align 1, !tbaa !19
  %124 = zext i8 %123 to i32
  %125 = getelementptr inbounds [2 x %struct.service], [2 x %struct.service]* %5, i64 0, i64 %116, i32 1
  %126 = load i8, i8* %125, align 2, !tbaa !21
  %127 = zext i8 %126 to i32
  %128 = icmp eq i32 %120, 2
  %129 = select i1 %128, i32 16, i32 28
  %130 = getelementptr inbounds %struct.aibuf, %struct.aibuf* %88, i64 %115, i32 1
  %131 = getelementptr inbounds %struct.aibuf, %struct.aibuf* %118, i64 0, i32 0, i32 0
  store i32 0, i32* %131, align 8, !tbaa.struct !22
  %132 = getelementptr inbounds %struct.aibuf, %struct.aibuf* %88, i64 %115, i32 0, i32 1
  store i32 %120, i32* %132, align 4, !tbaa.struct !23
  %133 = getelementptr inbounds %struct.aibuf, %struct.aibuf* %88, i64 %115, i32 0, i32 2
  store i32 %124, i32* %133, align 8, !tbaa.struct !24
  %134 = getelementptr inbounds %struct.aibuf, %struct.aibuf* %88, i64 %115, i32 0, i32 3
  store i32 %127, i32* %134, align 4, !tbaa.struct !25
  %135 = getelementptr inbounds %struct.aibuf, %struct.aibuf* %88, i64 %115, i32 0, i32 4
  store i32 %129, i32* %135, align 8, !tbaa.struct !26
  %136 = getelementptr inbounds %struct.aibuf, %struct.aibuf* %88, i64 %115, i32 0, i32 5
  %137 = bitcast %struct.sockaddr** %136 to %union.sa**
  store %union.sa* %130, %union.sa** %137, align 8, !tbaa.struct !27
  %138 = getelementptr inbounds %struct.aibuf, %struct.aibuf* %88, i64 %115, i32 0, i32 6
  store i8* %100, i8** %138, align 8, !tbaa.struct !28
  %139 = getelementptr inbounds %struct.aibuf, %struct.aibuf* %88, i64 %115, i32 0, i32 7
  store %struct.addrinfo* null, %struct.addrinfo** %139, align 8, !tbaa.struct !29
  %140 = icmp eq i64 %115, 0
  br i1 %140, label %145, label %141

141:                                              ; preds = %114
  %142 = getelementptr inbounds %struct.aibuf, %struct.aibuf* %118, i64 0, i32 0
  %143 = add nsw i64 %115, -1
  %144 = getelementptr inbounds %struct.aibuf, %struct.aibuf* %88, i64 %143, i32 0, i32 7
  store %struct.addrinfo* %142, %struct.addrinfo** %144, align 8, !tbaa !30
  br label %145

145:                                              ; preds = %141, %114
  %146 = load i32, i32* %110, align 4, !tbaa !17
  switch i32 %146, label %167 [
    i32 2, label %147
    i32 10, label %156
  ]

147:                                              ; preds = %145
  %148 = getelementptr %union.sa, %union.sa* %130, i64 0, i32 0, i32 0
  store i16 2, i16* %148, align 8, !tbaa !31
  %149 = getelementptr inbounds %struct.service, %struct.service* %121, i64 0, i32 0
  %150 = load i16, i16* %149, align 2, !tbaa !32
  %151 = call zeroext i16 @htons(i16 noundef zeroext %150) #5
  %152 = getelementptr inbounds %struct.aibuf, %struct.aibuf* %88, i64 %115, i32 1, i32 0, i32 1
  store i16 %151, i16* %152, align 2, !tbaa !31
  %153 = getelementptr inbounds %struct.aibuf, %struct.aibuf* %88, i64 %115, i32 1, i32 0, i32 2
  %154 = bitcast i32* %153 to i8*
  %155 = call i8* @memcpy(i8* noundef nonnull %154, i8* noundef nonnull %112, i64 noundef 4) #5
  br label %167

156:                                              ; preds = %145
  %157 = getelementptr inbounds %union.sa, %union.sa* %130, i64 0, i32 0, i32 0
  store i16 10, i16* %157, align 8, !tbaa !31
  %158 = getelementptr inbounds %struct.service, %struct.service* %121, i64 0, i32 0
  %159 = load i16, i16* %158, align 2, !tbaa !32
  %160 = call zeroext i16 @htons(i16 noundef zeroext %159) #5
  %161 = getelementptr inbounds %struct.aibuf, %struct.aibuf* %88, i64 %115, i32 1, i32 0, i32 1
  store i16 %160, i16* %161, align 2, !tbaa !31
  %162 = load i32, i32* %111, align 4, !tbaa !33
  %163 = getelementptr inbounds %struct.aibuf, %struct.aibuf* %88, i64 %115, i32 1, i32 0, i32 4
  store i32 %162, i32* %163, align 8, !tbaa !31
  %164 = getelementptr inbounds %struct.aibuf, %struct.aibuf* %88, i64 %115, i32 1, i32 0, i32 3
  %165 = bitcast %struct.in6_addr* %164 to i8*
  %166 = call i8* @memcpy(i8* noundef nonnull %165, i8* noundef nonnull %112, i64 noundef 16) #5
  br label %167

167:                                              ; preds = %147, %156, %145
  %168 = add nuw nsw i64 %116, 1
  %169 = add nsw i64 %115, 1
  %170 = icmp eq i64 %168, %105
  br i1 %170, label %171, label %114

171:                                              ; preds = %167
  %172 = trunc i64 %169 to i32
  br label %173

173:                                              ; preds = %171, %106
  %174 = phi i32 [ %108, %106 ], [ %172, %171 ]
  %175 = add nuw nsw i64 %107, 1
  %176 = icmp eq i64 %175, %104
  br i1 %176, label %177, label %106

177:                                              ; preds = %173, %99
  %178 = trunc i32 %79 to i16
  %179 = getelementptr inbounds i8, i8* %87, i64 82
  %180 = bitcast i8* %179 to i16*
  store i16 %178, i16* %180, align 2, !tbaa !34
  %181 = bitcast %struct.addrinfo** %3 to i8**
  store i8* %87, i8** %181, align 8, !tbaa !13
  br label %182

182:                                              ; preds = %59, %62, %28, %17, %78, %74, %66, %4, %177
  %183 = phi i32 [ 0, %177 ], [ -2, %4 ], [ %72, %66 ], [ %76, %74 ], [ -10, %78 ], [ -6, %28 ], [ -1, %17 ], [ -11, %59 ], [ -2, %62 ]
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %11) #4
  call void @llvm.lifetime.end.p0i8(i64 1344, i8* nonnull %10) #4
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %9) #4
  ret i32 %183
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @connect(i32 noundef, %struct.sockaddr* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @close(i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare hidden i32 @__lookup_serv(%struct.service* noundef, i8* noundef, i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__lookup_name(%struct.address* noundef, i8* noundef, i8* noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare zeroext i16 @htons(i16 noundef zeroext) local_unnamed_addr #2

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
!3 = !{!4, !5, i64 4}
!4 = !{!"addrinfo", !5, i64 0, !5, i64 4, !5, i64 8, !5, i64 12, !5, i64 16, !8, i64 24, !8, i64 32, !8, i64 40}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!4, !5, i64 0}
!10 = !{!4, !5, i64 12}
!11 = !{!4, !5, i64 8}
!12 = !{!5, !5, i64 0}
!13 = !{!8, !8, i64 0}
!14 = !{!15, !16, i64 80}
!15 = !{!"aibuf", !4, i64 0, !6, i64 48, !6, i64 76, !16, i64 80, !16, i64 82}
!16 = !{!"short", !6, i64 0}
!17 = !{!18, !5, i64 0}
!18 = !{!"address", !5, i64 0, !5, i64 4, !6, i64 8, !5, i64 24}
!19 = !{!20, !6, i64 3}
!20 = !{!"service", !16, i64 0, !6, i64 2, !6, i64 3}
!21 = !{!20, !6, i64 2}
!22 = !{i64 0, i64 4, !12, i64 4, i64 4, !12, i64 8, i64 4, !12, i64 12, i64 4, !12, i64 16, i64 4, !12, i64 24, i64 8, !13, i64 32, i64 8, !13, i64 40, i64 8, !13}
!23 = !{i64 0, i64 4, !12, i64 4, i64 4, !12, i64 8, i64 4, !12, i64 12, i64 4, !12, i64 20, i64 8, !13, i64 28, i64 8, !13, i64 36, i64 8, !13}
!24 = !{i64 0, i64 4, !12, i64 4, i64 4, !12, i64 8, i64 4, !12, i64 16, i64 8, !13, i64 24, i64 8, !13, i64 32, i64 8, !13}
!25 = !{i64 0, i64 4, !12, i64 4, i64 4, !12, i64 12, i64 8, !13, i64 20, i64 8, !13, i64 28, i64 8, !13}
!26 = !{i64 0, i64 4, !12, i64 8, i64 8, !13, i64 16, i64 8, !13, i64 24, i64 8, !13}
!27 = !{i64 0, i64 8, !13, i64 8, i64 8, !13, i64 16, i64 8, !13}
!28 = !{i64 0, i64 8, !13, i64 8, i64 8, !13}
!29 = !{i64 0, i64 8, !13}
!30 = !{!15, !8, i64 40}
!31 = !{!6, !6, i64 0}
!32 = !{!20, !16, i64 0}
!33 = !{!18, !5, i64 4}
!34 = !{!15, !16, i64 82}
