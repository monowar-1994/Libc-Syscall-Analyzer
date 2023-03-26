; ModuleID = 'src/crypt/crypt_sha256.c'
source_filename = "src/crypt/crypt_sha256.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sha256 = type { i64, [8 x i32], [64 x i8] }

@__crypt_sha256.testkey = internal constant [18 x i8] c"Xy01@#\01\02\80\7F\FF\0D\0A\81\09 !\00", align 16
@__crypt_sha256.testsetting = internal constant [30 x i8] c"$5$rounds=1234$abc0123456789$\00", align 16
@__crypt_sha256.testhash = internal constant [73 x i8] c"$5$rounds=1234$abc0123456789$3VfDjPt05VHFn47C/ojFZ6KRPYrOjj1lLbH.dkF3bZ6\00", align 16
@.str = private unnamed_addr constant [2 x i8] c"*\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"$5$\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"rounds=\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"rounds=%u$\00", align 1
@.str.4 = private unnamed_addr constant [11 x i8] c"$5$%s%.*s$\00", align 1
@sha256crypt.perm = internal unnamed_addr constant [10 x [3 x i8]] [[3 x i8] c"\00\0A\14", [3 x i8] c"\15\01\0B", [3 x i8] c"\0C\16\02", [3 x i8] c"\03\0D\17", [3 x i8] c"\18\04\0E", [3 x i8] c"\0F\19\05", [3 x i8] c"\06\10\1A", [3 x i8] c"\1B\07\11", [3 x i8] c"\12\1C\08", [3 x i8] c"\09\13\1D"], align 16
@K = internal unnamed_addr constant [64 x i32] [i32 1116352408, i32 1899447441, i32 -1245643825, i32 -373957723, i32 961987163, i32 1508970993, i32 -1841331548, i32 -1424204075, i32 -670586216, i32 310598401, i32 607225278, i32 1426881987, i32 1925078388, i32 -2132889090, i32 -1680079193, i32 -1046744716, i32 -459576895, i32 -272742522, i32 264347078, i32 604807628, i32 770255983, i32 1249150122, i32 1555081692, i32 1996064986, i32 -1740746414, i32 -1473132947, i32 -1341970488, i32 -1084653625, i32 -958395405, i32 -710438585, i32 113926993, i32 338241895, i32 666307205, i32 773529912, i32 1294757372, i32 1396182291, i32 1695183700, i32 1986661051, i32 -2117940946, i32 -1838011259, i32 -1564481375, i32 -1474664885, i32 -1035236496, i32 -949202525, i32 -778901479, i32 -694614492, i32 -200395387, i32 275423344, i32 430227734, i32 506948616, i32 659060556, i32 883997877, i32 958139571, i32 1322822218, i32 1537002063, i32 1747873779, i32 1955562222, i32 2024104815, i32 -2067236844, i32 -1933114872, i32 -1866530822, i32 -1538233109, i32 -1090935817, i32 -965641998], align 16
@b64 = internal unnamed_addr constant [65 x i8] c"./0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz\00", align 16

; Function Attrs: nounwind optsize strictfp
define i8* @__crypt_sha256(i8* noundef %0, i8* noundef %1, i8* noundef %2) local_unnamed_addr #0 {
  %4 = alloca [128 x i8], align 16
  %5 = getelementptr inbounds [128 x i8], [128 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %5) #6
  %6 = tail call fastcc i8* @sha256crypt(i8* noundef %0, i8* noundef %1, i8* noundef %2) #7
  %7 = call fastcc i8* @sha256crypt(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @__crypt_sha256.testkey, i64 0, i64 0), i8* noundef getelementptr inbounds ([30 x i8], [30 x i8]* @__crypt_sha256.testsetting, i64 0, i64 0), i8* noundef nonnull %5) #7
  %8 = icmp eq i8* %6, null
  %9 = icmp ne i8* %7, %5
  %10 = select i1 %8, i1 true, i1 %9
  br i1 %10, label %15, label %11

11:                                               ; preds = %3
  %12 = call i32 @memcmp(i8* noundef nonnull %5, i8* noundef getelementptr inbounds ([73 x i8], [73 x i8]* @__crypt_sha256.testhash, i64 0, i64 0), i64 noundef 73) #8
  %13 = icmp eq i32 %12, 0
  %14 = select i1 %13, i8* %6, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)
  br label %15

15:                                               ; preds = %11, %3
  %16 = phi i8* [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), %3 ], [ %14, %11 ]
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %5) #6
  ret i8* %16
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define internal fastcc i8* @sha256crypt(i8* noundef %0, i8* noundef %1, i8* noundef %2) unnamed_addr #0 {
  %4 = alloca %struct.sha256, align 8
  %5 = alloca [32 x i8], align 16
  %6 = alloca [32 x i8], align 16
  %7 = alloca [32 x i8], align 16
  %8 = alloca [20 x i8], align 16
  %9 = alloca i8*, align 8
  %10 = bitcast %struct.sha256* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 104, i8* nonnull %10) #6
  %11 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %11) #6
  %12 = getelementptr inbounds [32 x i8], [32 x i8]* %6, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %12) #6
  %13 = getelementptr inbounds [32 x i8], [32 x i8]* %7, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %13) #6
  %14 = getelementptr inbounds [20 x i8], [20 x i8]* %8, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %14) #6
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(20) %14, i8 0, i64 20, i1 false) #9
  %15 = tail call i64 @strnlen(i8* noundef %0, i64 noundef 257) #8
  %16 = trunc i64 %15 to i32
  %17 = icmp ugt i32 %16, 256
  br i1 %17, label %192, label %18

18:                                               ; preds = %3
  %19 = tail call i32 @strncmp(i8* noundef %1, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i64 noundef 3) #8
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %192

21:                                               ; preds = %18
  %22 = getelementptr inbounds i8, i8* %1, i64 3
  %23 = tail call i32 @strncmp(i8* noundef nonnull %22, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0), i64 noundef 7) #8
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %48

25:                                               ; preds = %21
  %26 = bitcast i8** %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %26) #6
  %27 = getelementptr inbounds i8, i8* %1, i64 10
  %28 = load i8, i8* %27, align 1, !tbaa !3
  %29 = sext i8 %28 to i32
  %30 = add nsw i32 %29, -48
  %31 = icmp ult i32 %30, 10
  br i1 %31, label %32, label %44

32:                                               ; preds = %25
  %33 = call i64 @strtoul(i8* noundef nonnull %27, i8** noundef nonnull %9, i32 noundef 10) #8
  %34 = load i8*, i8** %9, align 8, !tbaa !6
  %35 = load i8, i8* %34, align 1, !tbaa !3
  %36 = icmp eq i8 %35, 36
  br i1 %36, label %37, label %44

37:                                               ; preds = %32
  %38 = getelementptr inbounds i8, i8* %34, i64 1
  %39 = icmp ult i64 %33, 1000
  br i1 %39, label %45, label %40

40:                                               ; preds = %37
  %41 = icmp ugt i64 %33, 9999999
  br i1 %41, label %44, label %42

42:                                               ; preds = %40
  %43 = trunc i64 %33 to i32
  br label %45

44:                                               ; preds = %25, %32, %40
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %26) #6
  br label %192

45:                                               ; preds = %42, %37
  %46 = phi i32 [ %43, %42 ], [ 1000, %37 ]
  %47 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef nonnull %14, i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i32 noundef %46) #8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %26) #6
  br label %48

48:                                               ; preds = %45, %21
  %49 = phi i32 [ %46, %45 ], [ 5000, %21 ]
  %50 = phi i8* [ %38, %45 ], [ %22, %21 ]
  br label %51

51:                                               ; preds = %48, %55
  %52 = phi i64 [ 0, %48 ], [ %56, %55 ]
  %53 = getelementptr inbounds i8, i8* %50, i64 %52
  %54 = load i8, i8* %53, align 1, !tbaa !3
  switch i8 %54, label %55 [
    i8 0, label %58
    i8 36, label %58
    i8 10, label %192
    i8 58, label %192
  ]

55:                                               ; preds = %51
  %56 = add nuw nsw i64 %52, 1
  %57 = icmp eq i64 %56, 16
  br i1 %57, label %60, label %51

58:                                               ; preds = %51, %51
  %59 = trunc i64 %52 to i32
  br label %60

60:                                               ; preds = %55, %58
  %61 = phi i32 [ %59, %58 ], [ 16, %55 ]
  %62 = getelementptr inbounds %struct.sha256, %struct.sha256* %4, i64 0, i32 0
  store i64 0, i64* %62, align 8, !tbaa !8
  %63 = getelementptr inbounds %struct.sha256, %struct.sha256* %4, i64 0, i32 1, i64 0
  %64 = bitcast i32* %63 to <4 x i32>*
  store <4 x i32> <i32 1779033703, i32 -1150833019, i32 1013904242, i32 -1521486534>, <4 x i32>* %64, align 8, !tbaa !11
  %65 = getelementptr inbounds %struct.sha256, %struct.sha256* %4, i64 0, i32 1, i64 4
  %66 = bitcast i32* %65 to <4 x i32>*
  store <4 x i32> <i32 1359893119, i32 -1694144372, i32 528734635, i32 1541459225>, <4 x i32>* %66, align 8, !tbaa !11
  %67 = and i64 %15, 4294967295
  call fastcc void @sha256_update(%struct.sha256* noundef nonnull %4, i8* noundef %0, i64 noundef %67) #7
  %68 = zext i32 %61 to i64
  call fastcc void @sha256_update(%struct.sha256* noundef nonnull %4, i8* noundef nonnull %50, i64 noundef %68) #7
  call fastcc void @sha256_update(%struct.sha256* noundef nonnull %4, i8* noundef %0, i64 noundef %67) #7
  call fastcc void @sha256_sum(%struct.sha256* noundef nonnull %4, i8* noundef nonnull %11) #7
  store i64 0, i64* %62, align 8, !tbaa !8
  %69 = bitcast i32* %63 to <4 x i32>*
  store <4 x i32> <i32 1779033703, i32 -1150833019, i32 1013904242, i32 -1521486534>, <4 x i32>* %69, align 8, !tbaa !11
  %70 = bitcast i32* %65 to <4 x i32>*
  store <4 x i32> <i32 1359893119, i32 -1694144372, i32 528734635, i32 1541459225>, <4 x i32>* %70, align 8, !tbaa !11
  call fastcc void @sha256_update(%struct.sha256* noundef nonnull %4, i8* noundef %0, i64 noundef %67) #7
  call fastcc void @sha256_update(%struct.sha256* noundef nonnull %4, i8* noundef nonnull %50, i64 noundef %68) #7
  call fastcc void @hashmd(%struct.sha256* noundef nonnull %4, i32 noundef %16, i8* noundef nonnull %11) #7
  %71 = icmp eq i32 %16, 0
  br i1 %71, label %88, label %72

72:                                               ; preds = %60, %78
  %73 = phi i32 [ %79, %78 ], [ %16, %60 ]
  %74 = and i32 %73, 1
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %77, label %76

76:                                               ; preds = %72
  call fastcc void @sha256_update(%struct.sha256* noundef nonnull %4, i8* noundef nonnull %11, i64 noundef 32) #7
  br label %78

77:                                               ; preds = %72
  call fastcc void @sha256_update(%struct.sha256* noundef nonnull %4, i8* noundef %0, i64 noundef %67) #7
  br label %78

78:                                               ; preds = %76, %77
  %79 = lshr i32 %73, 1
  %80 = icmp ult i32 %73, 2
  br i1 %80, label %81, label %72

81:                                               ; preds = %78
  call fastcc void @sha256_sum(%struct.sha256* noundef nonnull %4, i8* noundef nonnull %11) #7
  store i64 0, i64* %62, align 8, !tbaa !8
  %82 = bitcast i32* %63 to <4 x i32>*
  store <4 x i32> <i32 1779033703, i32 -1150833019, i32 1013904242, i32 -1521486534>, <4 x i32>* %82, align 8, !tbaa !11
  %83 = bitcast i32* %65 to <4 x i32>*
  store <4 x i32> <i32 1359893119, i32 -1694144372, i32 528734635, i32 1541459225>, <4 x i32>* %83, align 8, !tbaa !11
  br i1 %71, label %91, label %84

84:                                               ; preds = %81, %84
  %85 = phi i32 [ %86, %84 ], [ 0, %81 ]
  call fastcc void @sha256_update(%struct.sha256* noundef nonnull %4, i8* noundef %0, i64 noundef %67) #7
  %86 = add nuw i32 %85, 1
  %87 = icmp eq i32 %86, %16
  br i1 %87, label %91, label %84

88:                                               ; preds = %60
  call fastcc void @sha256_sum(%struct.sha256* noundef nonnull %4, i8* noundef nonnull %11) #7
  store i64 0, i64* %62, align 8, !tbaa !8
  %89 = bitcast i32* %63 to <4 x i32>*
  store <4 x i32> <i32 1779033703, i32 -1150833019, i32 1013904242, i32 -1521486534>, <4 x i32>* %89, align 8, !tbaa !11
  %90 = bitcast i32* %65 to <4 x i32>*
  store <4 x i32> <i32 1359893119, i32 -1694144372, i32 528734635, i32 1541459225>, <4 x i32>* %90, align 8, !tbaa !11
  br label %91

91:                                               ; preds = %84, %88, %81
  call fastcc void @sha256_sum(%struct.sha256* noundef nonnull %4, i8* noundef nonnull %12) #7
  store i64 0, i64* %62, align 8, !tbaa !8
  %92 = bitcast i32* %63 to <4 x i32>*
  store <4 x i32> <i32 1779033703, i32 -1150833019, i32 1013904242, i32 -1521486534>, <4 x i32>* %92, align 8, !tbaa !11
  %93 = bitcast i32* %65 to <4 x i32>*
  store <4 x i32> <i32 1359893119, i32 -1694144372, i32 528734635, i32 1541459225>, <4 x i32>* %93, align 8, !tbaa !11
  br label %94

94:                                               ; preds = %91, %94
  %95 = phi i32 [ 0, %91 ], [ %96, %94 ]
  call fastcc void @sha256_update(%struct.sha256* noundef nonnull %4, i8* noundef nonnull %50, i64 noundef %68) #7
  %96 = add nuw nsw i32 %95, 1
  %97 = load i8, i8* %11, align 16, !tbaa !3
  %98 = zext i8 %97 to i32
  %99 = add nuw nsw i32 %98, 16
  %100 = icmp ult i32 %96, %99
  br i1 %100, label %94, label %101

101:                                              ; preds = %94
  call fastcc void @sha256_sum(%struct.sha256* noundef nonnull %4, i8* noundef nonnull %13) #7
  %102 = icmp eq i32 %49, 0
  br i1 %102, label %126, label %103

103:                                              ; preds = %101
  %104 = bitcast i32* %63 to <4 x i32>*
  %105 = bitcast i32* %65 to <4 x i32>*
  br label %106

106:                                              ; preds = %103, %123
  %107 = phi i32 [ %124, %123 ], [ 0, %103 ]
  store i64 0, i64* %62, align 8, !tbaa !8
  store <4 x i32> <i32 1779033703, i32 -1150833019, i32 1013904242, i32 -1521486534>, <4 x i32>* %104, align 8, !tbaa !11
  store <4 x i32> <i32 1359893119, i32 -1694144372, i32 528734635, i32 1541459225>, <4 x i32>* %105, align 8, !tbaa !11
  %108 = and i32 %107, 1
  %109 = icmp eq i32 %108, 0
  br i1 %109, label %111, label %110

110:                                              ; preds = %106
  call fastcc void @hashmd(%struct.sha256* noundef nonnull %4, i32 noundef %16, i8* noundef nonnull %12) #7
  br label %112

111:                                              ; preds = %106
  call fastcc void @sha256_update(%struct.sha256* noundef nonnull %4, i8* noundef nonnull %11, i64 noundef 32) #7
  br label %112

112:                                              ; preds = %111, %110
  %113 = urem i32 %107, 3
  %114 = icmp eq i32 %113, 0
  br i1 %114, label %116, label %115

115:                                              ; preds = %112
  call fastcc void @sha256_update(%struct.sha256* noundef nonnull %4, i8* noundef nonnull %13, i64 noundef %68) #7
  br label %116

116:                                              ; preds = %115, %112
  %117 = urem i32 %107, 7
  %118 = icmp eq i32 %117, 0
  br i1 %118, label %120, label %119

119:                                              ; preds = %116
  call fastcc void @hashmd(%struct.sha256* noundef nonnull %4, i32 noundef %16, i8* noundef nonnull %12) #7
  br label %120

120:                                              ; preds = %119, %116
  br i1 %109, label %122, label %121

121:                                              ; preds = %120
  call fastcc void @sha256_update(%struct.sha256* noundef nonnull %4, i8* noundef nonnull %11, i64 noundef 32) #7
  br label %123

122:                                              ; preds = %120
  call fastcc void @hashmd(%struct.sha256* noundef nonnull %4, i32 noundef %16, i8* noundef nonnull %12) #7
  br label %123

123:                                              ; preds = %122, %121
  call fastcc void @sha256_sum(%struct.sha256* noundef nonnull %4, i8* noundef nonnull %11) #7
  %124 = add nuw i32 %107, 1
  %125 = icmp eq i32 %124, %49
  br i1 %125, label %126, label %106

126:                                              ; preds = %123, %101
  %127 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef %2, i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i64 0, i64 0), i8* noundef nonnull %14, i32 noundef %61, i8* noundef nonnull %50) #8
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i8, i8* %2, i64 %128
  br label %130

130:                                              ; preds = %126, %167
  %131 = phi i64 [ 0, %126 ], [ %168, %167 ]
  %132 = phi i8* [ %129, %126 ], [ %164, %167 ]
  %133 = getelementptr inbounds [10 x [3 x i8]], [10 x [3 x i8]]* @sha256crypt.perm, i64 0, i64 %131, i64 0
  %134 = load i8, i8* %133, align 1, !tbaa !3
  %135 = zext i8 %134 to i64
  %136 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 %135
  %137 = load i8, i8* %136, align 1, !tbaa !3
  %138 = zext i8 %137 to i32
  %139 = shl nuw nsw i32 %138, 16
  %140 = getelementptr inbounds [10 x [3 x i8]], [10 x [3 x i8]]* @sha256crypt.perm, i64 0, i64 %131, i64 1
  %141 = load i8, i8* %140, align 1, !tbaa !3
  %142 = zext i8 %141 to i64
  %143 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 %142
  %144 = load i8, i8* %143, align 1, !tbaa !3
  %145 = zext i8 %144 to i32
  %146 = shl nuw nsw i32 %145, 8
  %147 = or i32 %146, %139
  %148 = getelementptr inbounds [10 x [3 x i8]], [10 x [3 x i8]]* @sha256crypt.perm, i64 0, i64 %131, i64 2
  %149 = load i8, i8* %148, align 1, !tbaa !3
  %150 = zext i8 %149 to i64
  %151 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 %150
  %152 = load i8, i8* %151, align 1, !tbaa !3
  %153 = zext i8 %152 to i32
  %154 = or i32 %147, %153
  br label %155

155:                                              ; preds = %155, %130
  %156 = phi i32 [ %159, %155 ], [ 4, %130 ]
  %157 = phi i32 [ %165, %155 ], [ %154, %130 ]
  %158 = phi i8* [ %164, %155 ], [ %132, %130 ]
  %159 = add nsw i32 %156, -1
  %160 = and i32 %157, 63
  %161 = zext i32 %160 to i64
  %162 = getelementptr inbounds [65 x i8], [65 x i8]* @b64, i64 0, i64 %161
  %163 = load i8, i8* %162, align 1, !tbaa !3
  %164 = getelementptr inbounds i8, i8* %158, i64 1
  store i8 %163, i8* %158, align 1, !tbaa !3
  %165 = lshr i32 %157, 6
  %166 = icmp ugt i32 %156, 1
  br i1 %166, label %155, label %167

167:                                              ; preds = %155
  %168 = add nuw nsw i64 %131, 1
  %169 = icmp eq i64 %168, 10
  br i1 %169, label %170, label %130

170:                                              ; preds = %167
  %171 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 31
  %172 = load i8, i8* %171, align 1, !tbaa !3
  %173 = zext i8 %172 to i32
  %174 = shl nuw nsw i32 %173, 8
  %175 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 30
  %176 = load i8, i8* %175, align 2, !tbaa !3
  %177 = zext i8 %176 to i32
  %178 = or i32 %174, %177
  br label %179

179:                                              ; preds = %179, %170
  %180 = phi i32 [ %183, %179 ], [ 3, %170 ]
  %181 = phi i32 [ %189, %179 ], [ %178, %170 ]
  %182 = phi i8* [ %188, %179 ], [ %164, %170 ]
  %183 = add nsw i32 %180, -1
  %184 = and i32 %181, 63
  %185 = zext i32 %184 to i64
  %186 = getelementptr inbounds [65 x i8], [65 x i8]* @b64, i64 0, i64 %185
  %187 = load i8, i8* %186, align 1, !tbaa !3
  %188 = getelementptr inbounds i8, i8* %182, i64 1
  store i8 %187, i8* %182, align 1, !tbaa !3
  %189 = lshr i32 %181, 6
  %190 = icmp ugt i32 %180, 1
  br i1 %190, label %179, label %191

191:                                              ; preds = %179
  store i8 0, i8* %188, align 1, !tbaa !3
  br label %192

192:                                              ; preds = %51, %51, %44, %18, %3, %191
  %193 = phi i8* [ %2, %191 ], [ null, %3 ], [ null, %18 ], [ null, %44 ], [ null, %51 ], [ null, %51 ]
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %14) #6
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %13) #6
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %12) #6
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %11) #6
  call void @llvm.lifetime.end.p0i8(i64 104, i8* nonnull %10) #6
  ret i8* %193
}

; Function Attrs: optsize
declare i32 @memcmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: optsize
declare i64 @strnlen(i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @strncmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @strtoul(i8* noundef, i8** noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @sprintf(i8* noundef, i8* noundef, ...) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @sha256_update(%struct.sha256* noundef %0, i8* noundef %1, i64 noundef %2) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 0
  %5 = load i64, i64* %4, align 8, !tbaa !8
  %6 = trunc i64 %5 to i32
  %7 = and i32 %6, 63
  %8 = add i64 %5, %2
  store i64 %8, i64* %4, align 8, !tbaa !8
  %9 = icmp eq i32 %7, 0
  br i1 %9, label %25, label %10

10:                                               ; preds = %3
  %11 = sub nuw nsw i32 64, %7
  %12 = zext i32 %11 to i64
  %13 = icmp ugt i64 %12, %2
  br i1 %13, label %14, label %18

14:                                               ; preds = %10
  %15 = zext i32 %7 to i64
  %16 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 2, i64 %15
  %17 = tail call i8* @memcpy(i8* noundef nonnull %16, i8* noundef %1, i64 noundef %2) #8
  br label %40

18:                                               ; preds = %10
  %19 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 2, i64 0
  %20 = zext i32 %7 to i64
  %21 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 2, i64 %20
  %22 = tail call i8* @memcpy(i8* noundef nonnull %21, i8* noundef %1, i64 noundef %12) #8
  %23 = sub i64 %2, %12
  %24 = getelementptr inbounds i8, i8* %1, i64 %12
  tail call fastcc void @processblock(%struct.sha256* noundef nonnull %0, i8* noundef nonnull %19) #7
  br label %25

25:                                               ; preds = %18, %3
  %26 = phi i8* [ %24, %18 ], [ %1, %3 ]
  %27 = phi i64 [ %23, %18 ], [ %2, %3 ]
  %28 = icmp ugt i64 %27, 63
  br i1 %28, label %29, label %35

29:                                               ; preds = %25, %29
  %30 = phi i64 [ %32, %29 ], [ %27, %25 ]
  %31 = phi i8* [ %33, %29 ], [ %26, %25 ]
  tail call fastcc void @processblock(%struct.sha256* noundef %0, i8* noundef %31) #7
  %32 = add i64 %30, -64
  %33 = getelementptr inbounds i8, i8* %31, i64 64
  %34 = icmp ugt i64 %32, 63
  br i1 %34, label %29, label %35

35:                                               ; preds = %29, %25
  %36 = phi i8* [ %26, %25 ], [ %33, %29 ]
  %37 = phi i64 [ %27, %25 ], [ %32, %29 ]
  %38 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 2, i64 0
  %39 = tail call i8* @memcpy(i8* noundef nonnull %38, i8* noundef %36, i64 noundef %37) #8
  br label %40

40:                                               ; preds = %35, %14
  ret void
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @sha256_sum(%struct.sha256* noundef %0, i8* nocapture noundef writeonly %1) unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 0
  %4 = load i64, i64* %3, align 8, !tbaa !8
  %5 = trunc i64 %4 to i32
  %6 = and i32 %5, 63
  %7 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 2
  %8 = add nuw nsw i32 %6, 1
  %9 = zext i32 %6 to i64
  %10 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 2, i64 %9
  store i8 -128, i8* %10, align 1, !tbaa !3
  %11 = icmp ugt i32 %6, 55
  br i1 %11, label %12, label %19

12:                                               ; preds = %2
  %13 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 0
  %14 = zext i32 %8 to i64
  %15 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 2, i64 %14
  %16 = xor i32 %6, 63
  %17 = zext i32 %16 to i64
  %18 = tail call i8* @memset(i8* noundef nonnull %15, i32 noundef 0, i64 noundef %17) #8
  tail call fastcc void @processblock(%struct.sha256* noundef nonnull %0, i8* noundef nonnull %13) #8
  br label %19

19:                                               ; preds = %2, %12
  %20 = phi i32 [ 0, %12 ], [ %8, %2 ]
  %21 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 0
  %22 = zext i32 %20 to i64
  %23 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 2, i64 %22
  %24 = sub nuw nsw i32 56, %20
  %25 = zext i32 %24 to i64
  %26 = tail call i8* @memset(i8* noundef nonnull %23, i32 noundef 0, i64 noundef %25) #8
  %27 = load i64, i64* %3, align 8, !tbaa !8
  %28 = shl i64 %27, 3
  store i64 %28, i64* %3, align 8, !tbaa !8
  %29 = lshr i64 %28, 56
  %30 = trunc i64 %29 to i8
  %31 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 2, i64 56
  store i8 %30, i8* %31, align 8, !tbaa !3
  %32 = lshr i64 %28, 48
  %33 = trunc i64 %32 to i8
  %34 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 2, i64 57
  store i8 %33, i8* %34, align 1, !tbaa !3
  %35 = lshr i64 %28, 40
  %36 = trunc i64 %35 to i8
  %37 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 2, i64 58
  store i8 %36, i8* %37, align 2, !tbaa !3
  %38 = lshr i64 %28, 32
  %39 = trunc i64 %38 to i8
  %40 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 2, i64 59
  store i8 %39, i8* %40, align 1, !tbaa !3
  %41 = lshr i64 %28, 24
  %42 = trunc i64 %41 to i8
  %43 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 2, i64 60
  store i8 %42, i8* %43, align 4, !tbaa !3
  %44 = lshr i64 %28, 16
  %45 = trunc i64 %44 to i8
  %46 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 2, i64 61
  store i8 %45, i8* %46, align 1, !tbaa !3
  %47 = lshr i64 %28, 8
  %48 = trunc i64 %47 to i8
  %49 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 2, i64 62
  store i8 %48, i8* %49, align 2, !tbaa !3
  %50 = trunc i64 %28 to i8
  %51 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 2, i64 63
  store i8 %50, i8* %51, align 1, !tbaa !3
  tail call fastcc void @processblock(%struct.sha256* noundef nonnull %0, i8* noundef nonnull %21) #8
  br label %52

52:                                               ; preds = %19, %52
  %53 = phi i64 [ 0, %19 ], [ %74, %52 ]
  %54 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 1, i64 %53
  %55 = load i32, i32* %54, align 4, !tbaa !11
  %56 = lshr i32 %55, 24
  %57 = trunc i32 %56 to i8
  %58 = shl nuw nsw i64 %53, 2
  %59 = getelementptr inbounds i8, i8* %1, i64 %58
  store i8 %57, i8* %59, align 1, !tbaa !3
  %60 = load i32, i32* %54, align 4, !tbaa !11
  %61 = lshr i32 %60, 16
  %62 = trunc i32 %61 to i8
  %63 = or i64 %58, 1
  %64 = getelementptr inbounds i8, i8* %1, i64 %63
  store i8 %62, i8* %64, align 1, !tbaa !3
  %65 = load i32, i32* %54, align 4, !tbaa !11
  %66 = lshr i32 %65, 8
  %67 = trunc i32 %66 to i8
  %68 = or i64 %58, 2
  %69 = getelementptr inbounds i8, i8* %1, i64 %68
  store i8 %67, i8* %69, align 1, !tbaa !3
  %70 = load i32, i32* %54, align 4, !tbaa !11
  %71 = trunc i32 %70 to i8
  %72 = or i64 %58, 3
  %73 = getelementptr inbounds i8, i8* %1, i64 %72
  store i8 %71, i8* %73, align 1, !tbaa !3
  %74 = add nuw nsw i64 %53, 1
  %75 = icmp eq i64 %74, 8
  br i1 %75, label %76, label %52

76:                                               ; preds = %52
  ret void
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @hashmd(%struct.sha256* noundef %0, i32 noundef %1, i8* noundef %2) unnamed_addr #0 {
  %4 = icmp ugt i32 %1, 32
  br i1 %4, label %5, label %9

5:                                                ; preds = %3, %5
  %6 = phi i32 [ %7, %5 ], [ %1, %3 ]
  tail call fastcc void @sha256_update(%struct.sha256* noundef %0, i8* noundef %2, i64 noundef 32) #7
  %7 = add i32 %6, -32
  %8 = icmp ugt i32 %7, 32
  br i1 %8, label %5, label %9

9:                                                ; preds = %5, %3
  %10 = phi i32 [ %1, %3 ], [ %7, %5 ]
  %11 = zext i32 %10 to i64
  tail call fastcc void @sha256_update(%struct.sha256* noundef %0, i8* noundef %2, i64 noundef %11) #7
  ret void
}

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nofree nosync nounwind optsize strictfp
define internal fastcc void @processblock(%struct.sha256* nocapture noundef %0, i8* nocapture noundef readonly %1) unnamed_addr #4 {
  %3 = alloca [64 x i32], align 16
  %4 = bitcast [64 x i32]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %4) #6
  br label %8

5:                                                ; preds = %8
  %6 = getelementptr inbounds [64 x i32], [64 x i32]* %3, i64 0, i64 0
  %7 = load i32, i32* %6, align 16, !tbaa !11
  br label %35

8:                                                ; preds = %2, %8
  %9 = phi i64 [ 0, %2 ], [ %33, %8 ]
  %10 = shl nuw nsw i64 %9, 2
  %11 = getelementptr inbounds i8, i8* %1, i64 %10
  %12 = load i8, i8* %11, align 1, !tbaa !3
  %13 = zext i8 %12 to i32
  %14 = shl nuw i32 %13, 24
  %15 = getelementptr inbounds [64 x i32], [64 x i32]* %3, i64 0, i64 %9
  %16 = or i64 %10, 1
  %17 = getelementptr inbounds i8, i8* %1, i64 %16
  %18 = load i8, i8* %17, align 1, !tbaa !3
  %19 = zext i8 %18 to i32
  %20 = shl nuw nsw i32 %19, 16
  %21 = or i32 %20, %14
  %22 = or i64 %10, 2
  %23 = getelementptr inbounds i8, i8* %1, i64 %22
  %24 = load i8, i8* %23, align 1, !tbaa !3
  %25 = zext i8 %24 to i32
  %26 = shl nuw nsw i32 %25, 8
  %27 = or i32 %26, %21
  %28 = or i64 %10, 3
  %29 = getelementptr inbounds i8, i8* %1, i64 %28
  %30 = load i8, i8* %29, align 1, !tbaa !3
  %31 = zext i8 %30 to i32
  %32 = or i32 %27, %31
  store i32 %32, i32* %15, align 4, !tbaa !11
  %33 = add nuw nsw i64 %9, 1
  %34 = icmp eq i64 %33, 16
  br i1 %34, label %5, label %8

35:                                               ; preds = %5, %35
  %36 = phi i32 [ %7, %5 ], [ %52, %35 ]
  %37 = phi i64 [ 16, %5 ], [ %61, %35 ]
  %38 = add nsw i64 %37, -2
  %39 = getelementptr inbounds [64 x i32], [64 x i32]* %3, i64 0, i64 %38
  %40 = load i32, i32* %39, align 4, !tbaa !11
  %41 = tail call i32 @llvm.fshl.i32(i32 %40, i32 %40, i32 15)
  %42 = tail call i32 @llvm.fshl.i32(i32 %40, i32 %40, i32 13)
  %43 = xor i32 %41, %42
  %44 = lshr i32 %40, 10
  %45 = xor i32 %43, %44
  %46 = add nsw i64 %37, -7
  %47 = getelementptr inbounds [64 x i32], [64 x i32]* %3, i64 0, i64 %46
  %48 = load i32, i32* %47, align 4, !tbaa !11
  %49 = add i32 %45, %48
  %50 = add nsw i64 %37, -15
  %51 = getelementptr inbounds [64 x i32], [64 x i32]* %3, i64 0, i64 %50
  %52 = load i32, i32* %51, align 4, !tbaa !11
  %53 = tail call i32 @llvm.fshl.i32(i32 %52, i32 %52, i32 25)
  %54 = tail call i32 @llvm.fshl.i32(i32 %52, i32 %52, i32 14)
  %55 = xor i32 %53, %54
  %56 = lshr i32 %52, 3
  %57 = xor i32 %55, %56
  %58 = add i32 %49, %36
  %59 = add i32 %58, %57
  %60 = getelementptr inbounds [64 x i32], [64 x i32]* %3, i64 0, i64 %37
  store i32 %59, i32* %60, align 4, !tbaa !11
  %61 = add nuw nsw i64 %37, 1
  %62 = icmp eq i64 %61, 64
  br i1 %62, label %63, label %35

63:                                               ; preds = %35
  %64 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 1, i64 0
  %65 = load i32, i32* %64, align 8, !tbaa !11
  %66 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 1, i64 1
  %67 = load i32, i32* %66, align 4, !tbaa !11
  %68 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 1, i64 2
  %69 = load i32, i32* %68, align 8, !tbaa !11
  %70 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 1, i64 3
  %71 = load i32, i32* %70, align 4, !tbaa !11
  %72 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 1, i64 4
  %73 = load i32, i32* %72, align 8, !tbaa !11
  %74 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 1, i64 5
  %75 = load i32, i32* %74, align 4, !tbaa !11
  %76 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 1, i64 6
  %77 = load i32, i32* %76, align 8, !tbaa !11
  %78 = getelementptr inbounds %struct.sha256, %struct.sha256* %0, i64 0, i32 1, i64 7
  %79 = load i32, i32* %78, align 4, !tbaa !11
  br label %80

80:                                               ; preds = %63, %80
  %81 = phi i64 [ 0, %63 ], [ %118, %80 ]
  %82 = phi i32 [ %79, %63 ], [ %83, %80 ]
  %83 = phi i32 [ %77, %63 ], [ %84, %80 ]
  %84 = phi i32 [ %75, %63 ], [ %85, %80 ]
  %85 = phi i32 [ %73, %63 ], [ %116, %80 ]
  %86 = phi i32 [ %71, %63 ], [ %87, %80 ]
  %87 = phi i32 [ %69, %63 ], [ %88, %80 ]
  %88 = phi i32 [ %67, %63 ], [ %89, %80 ]
  %89 = phi i32 [ %65, %63 ], [ %117, %80 ]
  %90 = tail call i32 @llvm.fshl.i32(i32 %85, i32 %85, i32 26)
  %91 = tail call i32 @llvm.fshl.i32(i32 %85, i32 %85, i32 21)
  %92 = xor i32 %90, %91
  %93 = tail call i32 @llvm.fshl.i32(i32 %85, i32 %85, i32 7)
  %94 = xor i32 %92, %93
  %95 = add i32 %82, %94
  %96 = xor i32 %83, %84
  %97 = and i32 %96, %85
  %98 = xor i32 %97, %83
  %99 = add i32 %95, %98
  %100 = getelementptr inbounds [64 x i32], [64 x i32]* @K, i64 0, i64 %81
  %101 = load i32, i32* %100, align 4, !tbaa !11
  %102 = add i32 %99, %101
  %103 = getelementptr inbounds [64 x i32], [64 x i32]* %3, i64 0, i64 %81
  %104 = load i32, i32* %103, align 4, !tbaa !11
  %105 = add i32 %102, %104
  %106 = tail call i32 @llvm.fshl.i32(i32 %89, i32 %89, i32 30)
  %107 = tail call i32 @llvm.fshl.i32(i32 %89, i32 %89, i32 19)
  %108 = xor i32 %106, %107
  %109 = tail call i32 @llvm.fshl.i32(i32 %89, i32 %89, i32 10)
  %110 = xor i32 %108, %109
  %111 = and i32 %88, %89
  %112 = or i32 %88, %89
  %113 = and i32 %87, %112
  %114 = or i32 %113, %111
  %115 = add i32 %114, %110
  %116 = add i32 %105, %86
  %117 = add i32 %115, %105
  %118 = add nuw nsw i64 %81, 1
  %119 = icmp eq i64 %118, 64
  br i1 %119, label %120, label %80

120:                                              ; preds = %80
  %121 = add i32 %117, %65
  store i32 %121, i32* %64, align 8, !tbaa !11
  %122 = add i32 %89, %67
  store i32 %122, i32* %66, align 4, !tbaa !11
  %123 = add i32 %88, %69
  store i32 %123, i32* %68, align 8, !tbaa !11
  %124 = add i32 %87, %71
  store i32 %124, i32* %70, align 4, !tbaa !11
  %125 = add i32 %116, %73
  store i32 %125, i32* %72, align 8, !tbaa !11
  %126 = add i32 %85, %75
  store i32 %126, i32* %74, align 4, !tbaa !11
  %127 = add i32 %84, %77
  store i32 %127, i32* %76, align 8, !tbaa !11
  %128 = add i32 %83, %79
  store i32 %128, i32* %78, align 4, !tbaa !11
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %4) #6
  ret void
}

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #5

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #4 = { nofree nosync nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { nounwind strictfp }
attributes #7 = { nobuiltin optsize strictfp "no-builtins" }
attributes #8 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #9 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !4, i64 0}
!8 = !{!9, !10, i64 0}
!9 = !{!"sha256", !10, i64 0, !4, i64 8, !4, i64 40}
!10 = !{!"long", !4, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !4, i64 0}
