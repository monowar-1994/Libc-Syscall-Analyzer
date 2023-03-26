; ModuleID = 'src/crypt/crypt_md5.c'
source_filename = "src/crypt/crypt_md5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.md5 = type { i64, [4 x i32], [64 x i8] }

@__crypt_md5.testkey = internal constant [18 x i8] c"Xy01@#\01\02\80\7F\FF\0D\0A\81\09 !\00", align 16
@__crypt_md5.testsetting = internal constant [13 x i8] c"$1$abcd0123$\00", align 1
@__crypt_md5.testhash = internal constant [35 x i8] c"$1$abcd0123$9Qcg8DyviekV3tDGMZynJ1\00", align 16
@.str = private unnamed_addr constant [2 x i8] c"*\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"$1$\00", align 1
@md5crypt.perm = internal unnamed_addr constant [5 x [3 x i8]] [[3 x i8] c"\00\06\0C", [3 x i8] c"\01\07\0D", [3 x i8] c"\02\08\0E", [3 x i8] c"\03\09\0F", [3 x i8] c"\04\0A\05"], align 1
@tab = internal unnamed_addr constant [64 x i32] [i32 -680876936, i32 -389564586, i32 606105819, i32 -1044525330, i32 -176418897, i32 1200080426, i32 -1473231341, i32 -45705983, i32 1770035416, i32 -1958414417, i32 -42063, i32 -1990404162, i32 1804603682, i32 -40341101, i32 -1502002290, i32 1236535329, i32 -165796510, i32 -1069501632, i32 643717713, i32 -373897302, i32 -701558691, i32 38016083, i32 -660478335, i32 -405537848, i32 568446438, i32 -1019803690, i32 -187363961, i32 1163531501, i32 -1444681467, i32 -51403784, i32 1735328473, i32 -1926607734, i32 -378558, i32 -2022574463, i32 1839030562, i32 -35309556, i32 -1530992060, i32 1272893353, i32 -155497632, i32 -1094730640, i32 681279174, i32 -358537222, i32 -722521979, i32 76029189, i32 -640364487, i32 -421815835, i32 530742520, i32 -995338651, i32 -198630844, i32 1126891415, i32 -1416354905, i32 -57434055, i32 1700485571, i32 -1894986606, i32 -1051523, i32 -2054922799, i32 1873313359, i32 -30611744, i32 -1560198380, i32 1309151649, i32 -145523070, i32 -1120210379, i32 718787259, i32 -343485551], align 16
@b64 = internal unnamed_addr constant [65 x i8] c"./0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz\00", align 16

; Function Attrs: nounwind optsize strictfp
define i8* @__crypt_md5(i8* noundef %0, i8* noundef %1, i8* noundef %2) local_unnamed_addr #0 {
  %4 = alloca [64 x i8], align 16
  %5 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %5) #5
  %6 = tail call fastcc i8* @md5crypt(i8* noundef %0, i8* noundef %1, i8* noundef %2) #6
  %7 = call fastcc i8* @md5crypt(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @__crypt_md5.testkey, i64 0, i64 0), i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @__crypt_md5.testsetting, i64 0, i64 0), i8* noundef nonnull %5) #6
  %8 = icmp eq i8* %6, null
  %9 = icmp ne i8* %7, %5
  %10 = select i1 %8, i1 true, i1 %9
  br i1 %10, label %15, label %11

11:                                               ; preds = %3
  %12 = call i32 @memcmp(i8* noundef nonnull %5, i8* noundef getelementptr inbounds ([35 x i8], [35 x i8]* @__crypt_md5.testhash, i64 0, i64 0), i64 noundef 35) #7
  %13 = icmp eq i32 %12, 0
  %14 = select i1 %13, i8* %6, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)
  br label %15

15:                                               ; preds = %11, %3
  %16 = phi i8* [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), %3 ], [ %14, %11 ]
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %5) #5
  ret i8* %16
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define internal fastcc i8* @md5crypt(i8* noundef %0, i8* noundef %1, i8* noundef %2) unnamed_addr #0 {
  %4 = alloca %struct.md5, align 8
  %5 = alloca [16 x i8], align 16
  %6 = bitcast %struct.md5* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 88, i8* nonnull %6) #5
  %7 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %7) #5
  %8 = tail call i64 @strnlen(i8* noundef %0, i64 noundef 30001) #7
  %9 = trunc i64 %8 to i32
  %10 = icmp ugt i32 %9, 30000
  br i1 %10, label %135, label %11

11:                                               ; preds = %3
  %12 = tail call i32 @strncmp(i8* noundef %1, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i64 noundef 3) #7
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %135

14:                                               ; preds = %11
  %15 = getelementptr inbounds i8, i8* %1, i64 3
  br label %16

16:                                               ; preds = %14, %20
  %17 = phi i64 [ 0, %14 ], [ %21, %20 ]
  %18 = getelementptr inbounds i8, i8* %15, i64 %17
  %19 = load i8, i8* %18, align 1, !tbaa !3
  switch i8 %19, label %20 [
    i8 0, label %23
    i8 36, label %23
  ]

20:                                               ; preds = %16
  %21 = add nuw nsw i64 %17, 1
  %22 = icmp eq i64 %21, 8
  br i1 %22, label %25, label %16

23:                                               ; preds = %16, %16
  %24 = trunc i64 %17 to i32
  br label %25

25:                                               ; preds = %20, %23
  %26 = phi i32 [ %24, %23 ], [ 8, %20 ]
  %27 = getelementptr inbounds %struct.md5, %struct.md5* %4, i64 0, i32 0
  store i64 0, i64* %27, align 8, !tbaa !6
  %28 = getelementptr inbounds %struct.md5, %struct.md5* %4, i64 0, i32 1, i64 0
  %29 = bitcast i32* %28 to <4 x i32>*
  store <4 x i32> <i32 1732584193, i32 -271733879, i32 -1732584194, i32 271733878>, <4 x i32>* %29, align 8, !tbaa !9
  %30 = and i64 %8, 4294967295
  call fastcc void @md5_update(%struct.md5* noundef nonnull %4, i8* noundef %0, i64 noundef %30) #6
  %31 = zext i32 %26 to i64
  call fastcc void @md5_update(%struct.md5* noundef nonnull %4, i8* noundef nonnull %15, i64 noundef %31) #6
  call fastcc void @md5_update(%struct.md5* noundef nonnull %4, i8* noundef %0, i64 noundef %30) #6
  call fastcc void @md5_sum(%struct.md5* noundef nonnull %4, i8* noundef nonnull %7) #6
  store i64 0, i64* %27, align 8, !tbaa !6
  %32 = bitcast i32* %28 to <4 x i32>*
  store <4 x i32> <i32 1732584193, i32 -271733879, i32 -1732584194, i32 271733878>, <4 x i32>* %32, align 8, !tbaa !9
  call fastcc void @md5_update(%struct.md5* noundef nonnull %4, i8* noundef %0, i64 noundef %30) #6
  %33 = add nuw i32 %26, 3
  %34 = zext i32 %33 to i64
  call fastcc void @md5_update(%struct.md5* noundef nonnull %4, i8* noundef nonnull %1, i64 noundef %34) #6
  %35 = icmp ugt i64 %30, 16
  br i1 %35, label %36, label %41

36:                                               ; preds = %25, %36
  %37 = phi i64 [ %39, %36 ], [ %30, %25 ]
  call fastcc void @md5_update(%struct.md5* noundef nonnull %4, i8* noundef nonnull %7, i64 noundef 16) #6
  %38 = add nuw nsw i64 %37, 4294967280
  %39 = and i64 %38, 4294967295
  %40 = icmp ugt i64 %39, 16
  br i1 %40, label %36, label %41

41:                                               ; preds = %36, %25
  %42 = phi i64 [ %30, %25 ], [ %39, %36 ]
  call fastcc void @md5_update(%struct.md5* noundef nonnull %4, i8* noundef nonnull %7, i64 noundef %42) #6
  store i8 0, i8* %7, align 16, !tbaa !3
  %43 = icmp eq i32 %9, 0
  br i1 %43, label %53, label %44

44:                                               ; preds = %41, %50
  %45 = phi i32 [ %51, %50 ], [ %9, %41 ]
  %46 = and i32 %45, 1
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %49, label %48

48:                                               ; preds = %44
  call fastcc void @md5_update(%struct.md5* noundef nonnull %4, i8* noundef nonnull %7, i64 noundef 1) #6
  br label %50

49:                                               ; preds = %44
  call fastcc void @md5_update(%struct.md5* noundef nonnull %4, i8* noundef %0, i64 noundef 1) #6
  br label %50

50:                                               ; preds = %48, %49
  %51 = lshr i32 %45, 1
  %52 = icmp ult i32 %45, 2
  br i1 %52, label %53, label %44

53:                                               ; preds = %50, %41
  call fastcc void @md5_sum(%struct.md5* noundef nonnull %4, i8* noundef nonnull %7) #6
  %54 = bitcast i32* %28 to <4 x i32>*
  br label %55

55:                                               ; preds = %53, %73
  %56 = phi i32 [ 0, %53 ], [ %74, %73 ]
  store i64 0, i64* %27, align 8, !tbaa !6
  store <4 x i32> <i32 1732584193, i32 -271733879, i32 -1732584194, i32 271733878>, <4 x i32>* %54, align 8, !tbaa !9
  %57 = and i32 %56, 1
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %60, label %59

59:                                               ; preds = %55
  call fastcc void @md5_update(%struct.md5* noundef nonnull %4, i8* noundef %0, i64 noundef %30) #6
  br label %61

60:                                               ; preds = %55
  call fastcc void @md5_update(%struct.md5* noundef nonnull %4, i8* noundef nonnull %7, i64 noundef 16) #6
  br label %61

61:                                               ; preds = %60, %59
  %62 = trunc i32 %56 to i16
  %63 = urem i16 %62, 3
  %64 = icmp eq i16 %63, 0
  br i1 %64, label %66, label %65

65:                                               ; preds = %61
  call fastcc void @md5_update(%struct.md5* noundef nonnull %4, i8* noundef nonnull %15, i64 noundef %31) #6
  br label %66

66:                                               ; preds = %65, %61
  %67 = urem i16 %62, 7
  %68 = icmp eq i16 %67, 0
  br i1 %68, label %70, label %69

69:                                               ; preds = %66
  call fastcc void @md5_update(%struct.md5* noundef nonnull %4, i8* noundef %0, i64 noundef %30) #6
  br label %70

70:                                               ; preds = %69, %66
  br i1 %58, label %72, label %71

71:                                               ; preds = %70
  call fastcc void @md5_update(%struct.md5* noundef nonnull %4, i8* noundef nonnull %7, i64 noundef 16) #6
  br label %73

72:                                               ; preds = %70
  call fastcc void @md5_update(%struct.md5* noundef nonnull %4, i8* noundef %0, i64 noundef %30) #6
  br label %73

73:                                               ; preds = %72, %71
  call fastcc void @md5_sum(%struct.md5* noundef nonnull %4, i8* noundef nonnull %7) #6
  %74 = add nuw nsw i32 %56, 1
  %75 = icmp eq i32 %74, 1000
  br i1 %75, label %76, label %55

76:                                               ; preds = %73
  %77 = call i8* @memcpy(i8* noundef %2, i8* noundef %1, i64 noundef %34) #7
  %78 = getelementptr inbounds i8, i8* %2, i64 3
  %79 = getelementptr inbounds i8, i8* %78, i64 %31
  %80 = getelementptr inbounds i8, i8* %79, i64 1
  store i8 36, i8* %79, align 1, !tbaa !3
  br label %81

81:                                               ; preds = %76, %118
  %82 = phi i64 [ 0, %76 ], [ %119, %118 ]
  %83 = phi i8* [ %80, %76 ], [ %115, %118 ]
  %84 = getelementptr inbounds [5 x [3 x i8]], [5 x [3 x i8]]* @md5crypt.perm, i64 0, i64 %82, i64 0
  %85 = load i8, i8* %84, align 1, !tbaa !3
  %86 = zext i8 %85 to i64
  %87 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 %86
  %88 = load i8, i8* %87, align 1, !tbaa !3
  %89 = zext i8 %88 to i32
  %90 = shl nuw nsw i32 %89, 16
  %91 = getelementptr inbounds [5 x [3 x i8]], [5 x [3 x i8]]* @md5crypt.perm, i64 0, i64 %82, i64 1
  %92 = load i8, i8* %91, align 1, !tbaa !3
  %93 = zext i8 %92 to i64
  %94 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 %93
  %95 = load i8, i8* %94, align 1, !tbaa !3
  %96 = zext i8 %95 to i32
  %97 = shl nuw nsw i32 %96, 8
  %98 = or i32 %97, %90
  %99 = getelementptr inbounds [5 x [3 x i8]], [5 x [3 x i8]]* @md5crypt.perm, i64 0, i64 %82, i64 2
  %100 = load i8, i8* %99, align 1, !tbaa !3
  %101 = zext i8 %100 to i64
  %102 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 %101
  %103 = load i8, i8* %102, align 1, !tbaa !3
  %104 = zext i8 %103 to i32
  %105 = or i32 %98, %104
  br label %106

106:                                              ; preds = %106, %81
  %107 = phi i32 [ %110, %106 ], [ 4, %81 ]
  %108 = phi i32 [ %116, %106 ], [ %105, %81 ]
  %109 = phi i8* [ %115, %106 ], [ %83, %81 ]
  %110 = add nsw i32 %107, -1
  %111 = and i32 %108, 63
  %112 = zext i32 %111 to i64
  %113 = getelementptr inbounds [65 x i8], [65 x i8]* @b64, i64 0, i64 %112
  %114 = load i8, i8* %113, align 1, !tbaa !3
  %115 = getelementptr inbounds i8, i8* %109, i64 1
  store i8 %114, i8* %109, align 1, !tbaa !3
  %116 = lshr i32 %108, 6
  %117 = icmp ugt i32 %107, 1
  br i1 %117, label %106, label %118

118:                                              ; preds = %106
  %119 = add nuw nsw i64 %82, 1
  %120 = icmp eq i64 %119, 5
  br i1 %120, label %121, label %81

121:                                              ; preds = %118
  %122 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 11
  %123 = load i8, i8* %122, align 1, !tbaa !3
  %124 = zext i8 %123 to i32
  %125 = and i32 %124, 63
  %126 = zext i32 %125 to i64
  %127 = getelementptr inbounds [65 x i8], [65 x i8]* @b64, i64 0, i64 %126
  %128 = load i8, i8* %127, align 1, !tbaa !3
  %129 = getelementptr inbounds i8, i8* %109, i64 2
  store i8 %128, i8* %115, align 1, !tbaa !3
  %130 = lshr i32 %124, 6
  %131 = zext i32 %130 to i64
  %132 = getelementptr inbounds [65 x i8], [65 x i8]* @b64, i64 0, i64 %131
  %133 = load i8, i8* %132, align 1, !tbaa !3
  %134 = getelementptr inbounds i8, i8* %109, i64 3
  store i8 %133, i8* %129, align 1, !tbaa !3
  store i8 0, i8* %134, align 1, !tbaa !3
  br label %135

135:                                              ; preds = %11, %3, %121
  %136 = phi i8* [ %2, %121 ], [ null, %3 ], [ null, %11 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %7) #5
  call void @llvm.lifetime.end.p0i8(i64 88, i8* nonnull %6) #5
  ret i8* %136
}

; Function Attrs: optsize
declare i32 @memcmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i64 @strnlen(i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @strncmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @md5_update(%struct.md5* noundef %0, i8* noundef %1, i64 noundef %2) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.md5, %struct.md5* %0, i64 0, i32 0
  %5 = load i64, i64* %4, align 8, !tbaa !6
  %6 = trunc i64 %5 to i32
  %7 = and i32 %6, 63
  %8 = add i64 %5, %2
  store i64 %8, i64* %4, align 8, !tbaa !6
  %9 = icmp eq i32 %7, 0
  br i1 %9, label %25, label %10

10:                                               ; preds = %3
  %11 = sub nuw nsw i32 64, %7
  %12 = zext i32 %11 to i64
  %13 = icmp ugt i64 %12, %2
  br i1 %13, label %14, label %18

14:                                               ; preds = %10
  %15 = zext i32 %7 to i64
  %16 = getelementptr inbounds %struct.md5, %struct.md5* %0, i64 0, i32 2, i64 %15
  %17 = tail call i8* @memcpy(i8* noundef nonnull %16, i8* noundef %1, i64 noundef %2) #7
  br label %40

18:                                               ; preds = %10
  %19 = getelementptr inbounds %struct.md5, %struct.md5* %0, i64 0, i32 2, i64 0
  %20 = zext i32 %7 to i64
  %21 = getelementptr inbounds %struct.md5, %struct.md5* %0, i64 0, i32 2, i64 %20
  %22 = tail call i8* @memcpy(i8* noundef nonnull %21, i8* noundef %1, i64 noundef %12) #7
  %23 = sub i64 %2, %12
  %24 = getelementptr inbounds i8, i8* %1, i64 %12
  tail call fastcc void @processblock(%struct.md5* noundef nonnull %0, i8* noundef nonnull %19) #6
  br label %25

25:                                               ; preds = %18, %3
  %26 = phi i8* [ %24, %18 ], [ %1, %3 ]
  %27 = phi i64 [ %23, %18 ], [ %2, %3 ]
  %28 = icmp ugt i64 %27, 63
  br i1 %28, label %29, label %35

29:                                               ; preds = %25, %29
  %30 = phi i64 [ %32, %29 ], [ %27, %25 ]
  %31 = phi i8* [ %33, %29 ], [ %26, %25 ]
  tail call fastcc void @processblock(%struct.md5* noundef %0, i8* noundef %31) #6
  %32 = add i64 %30, -64
  %33 = getelementptr inbounds i8, i8* %31, i64 64
  %34 = icmp ugt i64 %32, 63
  br i1 %34, label %29, label %35

35:                                               ; preds = %29, %25
  %36 = phi i8* [ %26, %25 ], [ %33, %29 ]
  %37 = phi i64 [ %27, %25 ], [ %32, %29 ]
  %38 = getelementptr inbounds %struct.md5, %struct.md5* %0, i64 0, i32 2, i64 0
  %39 = tail call i8* @memcpy(i8* noundef nonnull %38, i8* noundef %36, i64 noundef %37) #7
  br label %40

40:                                               ; preds = %35, %14
  ret void
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @md5_sum(%struct.md5* noundef %0, i8* nocapture noundef writeonly %1) unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.md5, %struct.md5* %0, i64 0, i32 0
  %4 = load i64, i64* %3, align 8, !tbaa !6
  %5 = trunc i64 %4 to i32
  %6 = and i32 %5, 63
  %7 = getelementptr inbounds %struct.md5, %struct.md5* %0, i64 0, i32 2
  %8 = add nuw nsw i32 %6, 1
  %9 = zext i32 %6 to i64
  %10 = getelementptr inbounds %struct.md5, %struct.md5* %0, i64 0, i32 2, i64 %9
  store i8 -128, i8* %10, align 1, !tbaa !3
  %11 = icmp ugt i32 %6, 55
  br i1 %11, label %12, label %19

12:                                               ; preds = %2
  %13 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 0
  %14 = zext i32 %8 to i64
  %15 = getelementptr inbounds %struct.md5, %struct.md5* %0, i64 0, i32 2, i64 %14
  %16 = xor i32 %6, 63
  %17 = zext i32 %16 to i64
  %18 = tail call i8* @memset(i8* noundef nonnull %15, i32 noundef 0, i64 noundef %17) #7
  tail call fastcc void @processblock(%struct.md5* noundef nonnull %0, i8* noundef nonnull %13) #7
  br label %19

19:                                               ; preds = %2, %12
  %20 = phi i32 [ 0, %12 ], [ %8, %2 ]
  %21 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 0
  %22 = zext i32 %20 to i64
  %23 = getelementptr inbounds %struct.md5, %struct.md5* %0, i64 0, i32 2, i64 %22
  %24 = sub nuw nsw i32 56, %20
  %25 = zext i32 %24 to i64
  %26 = tail call i8* @memset(i8* noundef nonnull %23, i32 noundef 0, i64 noundef %25) #7
  %27 = load i64, i64* %3, align 8, !tbaa !6
  %28 = shl i64 %27, 3
  store i64 %28, i64* %3, align 8, !tbaa !6
  %29 = trunc i64 %28 to i8
  %30 = getelementptr inbounds %struct.md5, %struct.md5* %0, i64 0, i32 2, i64 56
  store i8 %29, i8* %30, align 8, !tbaa !3
  %31 = lshr i64 %28, 8
  %32 = trunc i64 %31 to i8
  %33 = getelementptr inbounds %struct.md5, %struct.md5* %0, i64 0, i32 2, i64 57
  store i8 %32, i8* %33, align 1, !tbaa !3
  %34 = lshr i64 %28, 16
  %35 = trunc i64 %34 to i8
  %36 = getelementptr inbounds %struct.md5, %struct.md5* %0, i64 0, i32 2, i64 58
  store i8 %35, i8* %36, align 2, !tbaa !3
  %37 = lshr i64 %28, 24
  %38 = trunc i64 %37 to i8
  %39 = getelementptr inbounds %struct.md5, %struct.md5* %0, i64 0, i32 2, i64 59
  store i8 %38, i8* %39, align 1, !tbaa !3
  %40 = lshr i64 %28, 32
  %41 = trunc i64 %40 to i8
  %42 = getelementptr inbounds %struct.md5, %struct.md5* %0, i64 0, i32 2, i64 60
  store i8 %41, i8* %42, align 4, !tbaa !3
  %43 = lshr i64 %28, 40
  %44 = trunc i64 %43 to i8
  %45 = getelementptr inbounds %struct.md5, %struct.md5* %0, i64 0, i32 2, i64 61
  store i8 %44, i8* %45, align 1, !tbaa !3
  %46 = lshr i64 %28, 48
  %47 = trunc i64 %46 to i8
  %48 = getelementptr inbounds %struct.md5, %struct.md5* %0, i64 0, i32 2, i64 62
  store i8 %47, i8* %48, align 2, !tbaa !3
  %49 = lshr i64 %28, 56
  %50 = trunc i64 %49 to i8
  %51 = getelementptr inbounds %struct.md5, %struct.md5* %0, i64 0, i32 2, i64 63
  store i8 %50, i8* %51, align 1, !tbaa !3
  tail call fastcc void @processblock(%struct.md5* noundef nonnull %0, i8* noundef nonnull %21) #7
  br label %52

52:                                               ; preds = %19, %52
  %53 = phi i64 [ 0, %19 ], [ %74, %52 ]
  %54 = getelementptr inbounds %struct.md5, %struct.md5* %0, i64 0, i32 1, i64 %53
  %55 = load i32, i32* %54, align 4, !tbaa !9
  %56 = trunc i32 %55 to i8
  %57 = shl nuw nsw i64 %53, 2
  %58 = getelementptr inbounds i8, i8* %1, i64 %57
  store i8 %56, i8* %58, align 1, !tbaa !3
  %59 = load i32, i32* %54, align 4, !tbaa !9
  %60 = lshr i32 %59, 8
  %61 = trunc i32 %60 to i8
  %62 = or i64 %57, 1
  %63 = getelementptr inbounds i8, i8* %1, i64 %62
  store i8 %61, i8* %63, align 1, !tbaa !3
  %64 = load i32, i32* %54, align 4, !tbaa !9
  %65 = lshr i32 %64, 16
  %66 = trunc i32 %65 to i8
  %67 = or i64 %57, 2
  %68 = getelementptr inbounds i8, i8* %1, i64 %67
  store i8 %66, i8* %68, align 1, !tbaa !3
  %69 = load i32, i32* %54, align 4, !tbaa !9
  %70 = lshr i32 %69, 24
  %71 = trunc i32 %70 to i8
  %72 = or i64 %57, 3
  %73 = getelementptr inbounds i8, i8* %1, i64 %72
  store i8 %71, i8* %73, align 1, !tbaa !3
  %74 = add nuw nsw i64 %53, 1
  %75 = icmp eq i64 %74, 4
  br i1 %75, label %76, label %52

76:                                               ; preds = %52
  ret void
}

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nofree nosync nounwind optsize strictfp
define internal fastcc void @processblock(%struct.md5* nocapture noundef %0, i8* nocapture noundef readonly %1) unnamed_addr #3 {
  %3 = alloca [16 x i32], align 16
  %4 = bitcast [16 x i32]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %4) #5
  br label %5

5:                                                ; preds = %2, %5
  %6 = phi i64 [ 0, %2 ], [ %30, %5 ]
  %7 = shl nuw nsw i64 %6, 2
  %8 = getelementptr inbounds i8, i8* %1, i64 %7
  %9 = load i8, i8* %8, align 1, !tbaa !3
  %10 = zext i8 %9 to i32
  %11 = getelementptr inbounds [16 x i32], [16 x i32]* %3, i64 0, i64 %6
  %12 = or i64 %7, 1
  %13 = getelementptr inbounds i8, i8* %1, i64 %12
  %14 = load i8, i8* %13, align 1, !tbaa !3
  %15 = zext i8 %14 to i32
  %16 = shl nuw nsw i32 %15, 8
  %17 = or i32 %16, %10
  %18 = or i64 %7, 2
  %19 = getelementptr inbounds i8, i8* %1, i64 %18
  %20 = load i8, i8* %19, align 1, !tbaa !3
  %21 = zext i8 %20 to i32
  %22 = shl nuw nsw i32 %21, 16
  %23 = or i32 %22, %17
  %24 = or i64 %7, 3
  %25 = getelementptr inbounds i8, i8* %1, i64 %24
  %26 = load i8, i8* %25, align 1, !tbaa !3
  %27 = zext i8 %26 to i32
  %28 = shl nuw i32 %27, 24
  %29 = or i32 %28, %23
  store i32 %29, i32* %11, align 4, !tbaa !9
  %30 = add nuw nsw i64 %6, 1
  %31 = icmp eq i64 %30, 16
  br i1 %31, label %32, label %5

32:                                               ; preds = %5
  %33 = getelementptr inbounds %struct.md5, %struct.md5* %0, i64 0, i32 1, i64 0
  %34 = load i32, i32* %33, align 8, !tbaa !9
  %35 = getelementptr inbounds %struct.md5, %struct.md5* %0, i64 0, i32 1, i64 1
  %36 = load i32, i32* %35, align 4, !tbaa !9
  %37 = getelementptr inbounds %struct.md5, %struct.md5* %0, i64 0, i32 1, i64 2
  %38 = load i32, i32* %37, align 8, !tbaa !9
  %39 = getelementptr inbounds %struct.md5, %struct.md5* %0, i64 0, i32 1, i64 3
  %40 = load i32, i32* %39, align 4, !tbaa !9
  br label %41

41:                                               ; preds = %32, %41
  %42 = phi i64 [ 0, %32 ], [ %98, %41 ]
  %43 = phi i32 [ %40, %32 ], [ %71, %41 ]
  %44 = phi i32 [ %38, %32 ], [ %84, %41 ]
  %45 = phi i32 [ %36, %32 ], [ %97, %41 ]
  %46 = phi i32 [ %34, %32 ], [ %58, %41 ]
  %47 = xor i32 %43, %44
  %48 = and i32 %47, %45
  %49 = xor i32 %48, %43
  %50 = getelementptr inbounds [16 x i32], [16 x i32]* %3, i64 0, i64 %42
  %51 = load i32, i32* %50, align 16, !tbaa !9
  %52 = getelementptr inbounds [64 x i32], [64 x i32]* @tab, i64 0, i64 %42
  %53 = load i32, i32* %52, align 16, !tbaa !9
  %54 = add i32 %49, %46
  %55 = add i32 %54, %51
  %56 = add i32 %55, %53
  %57 = tail call i32 @llvm.fshl.i32(i32 %56, i32 %56, i32 7)
  %58 = add i32 %57, %45
  %59 = or i64 %42, 1
  %60 = xor i32 %44, %45
  %61 = and i32 %58, %60
  %62 = xor i32 %61, %44
  %63 = getelementptr inbounds [16 x i32], [16 x i32]* %3, i64 0, i64 %59
  %64 = load i32, i32* %63, align 4, !tbaa !9
  %65 = getelementptr inbounds [64 x i32], [64 x i32]* @tab, i64 0, i64 %59
  %66 = load i32, i32* %65, align 4, !tbaa !9
  %67 = add i32 %64, %43
  %68 = add i32 %67, %66
  %69 = add i32 %68, %62
  %70 = tail call i32 @llvm.fshl.i32(i32 %69, i32 %69, i32 12)
  %71 = add i32 %70, %58
  %72 = or i64 %42, 2
  %73 = xor i32 %58, %45
  %74 = and i32 %71, %73
  %75 = xor i32 %74, %45
  %76 = getelementptr inbounds [16 x i32], [16 x i32]* %3, i64 0, i64 %72
  %77 = load i32, i32* %76, align 8, !tbaa !9
  %78 = getelementptr inbounds [64 x i32], [64 x i32]* @tab, i64 0, i64 %72
  %79 = load i32, i32* %78, align 8, !tbaa !9
  %80 = add i32 %77, %44
  %81 = add i32 %80, %79
  %82 = add i32 %81, %75
  %83 = tail call i32 @llvm.fshl.i32(i32 %82, i32 %82, i32 17)
  %84 = add i32 %83, %71
  %85 = or i64 %42, 3
  %86 = xor i32 %71, %58
  %87 = and i32 %84, %86
  %88 = xor i32 %87, %58
  %89 = getelementptr inbounds [16 x i32], [16 x i32]* %3, i64 0, i64 %85
  %90 = load i32, i32* %89, align 4, !tbaa !9
  %91 = getelementptr inbounds [64 x i32], [64 x i32]* @tab, i64 0, i64 %85
  %92 = load i32, i32* %91, align 4, !tbaa !9
  %93 = add i32 %90, %45
  %94 = add i32 %93, %92
  %95 = add i32 %94, %88
  %96 = tail call i32 @llvm.fshl.i32(i32 %95, i32 %95, i32 22)
  %97 = add i32 %96, %84
  %98 = add nuw nsw i64 %42, 4
  %99 = icmp ult i64 %42, 12
  br i1 %99, label %41, label %100

100:                                              ; preds = %41, %100
  %101 = phi i64 [ %169, %100 ], [ 16, %41 ]
  %102 = phi i32 [ %136, %100 ], [ %71, %41 ]
  %103 = phi i32 [ %152, %100 ], [ %84, %41 ]
  %104 = phi i32 [ %168, %100 ], [ %97, %41 ]
  %105 = phi i32 [ %120, %100 ], [ %58, %41 ]
  %106 = xor i32 %103, %104
  %107 = and i32 %102, %106
  %108 = xor i32 %107, %103
  %109 = mul nuw nsw i64 %101, 5
  %110 = and i64 %109, 12
  %111 = or i64 %110, 1
  %112 = getelementptr inbounds [16 x i32], [16 x i32]* %3, i64 0, i64 %111
  %113 = load i32, i32* %112, align 4, !tbaa !9
  %114 = getelementptr inbounds [64 x i32], [64 x i32]* @tab, i64 0, i64 %101
  %115 = load i32, i32* %114, align 16, !tbaa !9
  %116 = add i32 %108, %105
  %117 = add i32 %116, %113
  %118 = add i32 %117, %115
  %119 = tail call i32 @llvm.fshl.i32(i32 %118, i32 %118, i32 5)
  %120 = add i32 %119, %104
  %121 = or i64 %101, 1
  %122 = xor i32 %120, %104
  %123 = and i32 %122, %103
  %124 = xor i32 %123, %104
  %125 = mul i64 %121, 5
  %126 = add nuw nsw i64 %125, 1
  %127 = and i64 %126, 14
  %128 = getelementptr inbounds [16 x i32], [16 x i32]* %3, i64 0, i64 %127
  %129 = load i32, i32* %128, align 8, !tbaa !9
  %130 = getelementptr inbounds [64 x i32], [64 x i32]* @tab, i64 0, i64 %121
  %131 = load i32, i32* %130, align 4, !tbaa !9
  %132 = add i32 %129, %102
  %133 = add i32 %132, %131
  %134 = add i32 %133, %124
  %135 = tail call i32 @llvm.fshl.i32(i32 %134, i32 %134, i32 9)
  %136 = add i32 %135, %120
  %137 = or i64 %101, 2
  %138 = xor i32 %136, %120
  %139 = and i32 %138, %104
  %140 = xor i32 %139, %120
  %141 = mul i64 %137, 5
  %142 = and i64 %141, 14
  %143 = or i64 %142, 1
  %144 = getelementptr inbounds [16 x i32], [16 x i32]* %3, i64 0, i64 %143
  %145 = load i32, i32* %144, align 4, !tbaa !9
  %146 = getelementptr inbounds [64 x i32], [64 x i32]* @tab, i64 0, i64 %137
  %147 = load i32, i32* %146, align 8, !tbaa !9
  %148 = add i32 %145, %103
  %149 = add i32 %148, %147
  %150 = add i32 %149, %140
  %151 = tail call i32 @llvm.fshl.i32(i32 %150, i32 %150, i32 14)
  %152 = add i32 %151, %136
  %153 = or i64 %101, 3
  %154 = xor i32 %152, %136
  %155 = and i32 %154, %120
  %156 = xor i32 %155, %136
  %157 = mul nuw nsw i64 %153, 5
  %158 = add nuw nsw i64 %157, 1
  %159 = and i64 %158, 12
  %160 = getelementptr inbounds [16 x i32], [16 x i32]* %3, i64 0, i64 %159
  %161 = load i32, i32* %160, align 16, !tbaa !9
  %162 = getelementptr inbounds [64 x i32], [64 x i32]* @tab, i64 0, i64 %153
  %163 = load i32, i32* %162, align 4, !tbaa !9
  %164 = add i32 %161, %104
  %165 = add i32 %164, %163
  %166 = add i32 %165, %156
  %167 = tail call i32 @llvm.fshl.i32(i32 %166, i32 %166, i32 20)
  %168 = add i32 %167, %152
  %169 = add nuw nsw i64 %101, 4
  %170 = icmp ult i64 %101, 28
  br i1 %170, label %100, label %171

171:                                              ; preds = %100, %171
  %172 = phi i64 [ %235, %171 ], [ 32, %100 ]
  %173 = phi i32 [ %204, %171 ], [ %136, %100 ]
  %174 = phi i32 [ %219, %171 ], [ %152, %100 ]
  %175 = phi i32 [ %234, %171 ], [ %168, %100 ]
  %176 = phi i32 [ %190, %171 ], [ %120, %100 ]
  %177 = xor i32 %174, %175
  %178 = xor i32 %177, %173
  %179 = mul nuw nsw i64 %172, 3
  %180 = add nuw nsw i64 %179, 5
  %181 = and i64 %180, 13
  %182 = getelementptr inbounds [16 x i32], [16 x i32]* %3, i64 0, i64 %181
  %183 = load i32, i32* %182, align 4, !tbaa !9
  %184 = getelementptr inbounds [64 x i32], [64 x i32]* @tab, i64 0, i64 %172
  %185 = load i32, i32* %184, align 16, !tbaa !9
  %186 = add i32 %178, %176
  %187 = add i32 %186, %183
  %188 = add i32 %187, %185
  %189 = tail call i32 @llvm.fshl.i32(i32 %188, i32 %188, i32 4)
  %190 = add i32 %189, %175
  %191 = or i64 %172, 1
  %192 = xor i32 %177, %190
  %193 = mul i64 %191, 3
  %194 = add i64 %193, 5
  %195 = and i64 %194, 12
  %196 = getelementptr inbounds [16 x i32], [16 x i32]* %3, i64 0, i64 %195
  %197 = load i32, i32* %196, align 16, !tbaa !9
  %198 = getelementptr inbounds [64 x i32], [64 x i32]* @tab, i64 0, i64 %191
  %199 = load i32, i32* %198, align 4, !tbaa !9
  %200 = add i32 %197, %173
  %201 = add i32 %200, %199
  %202 = add i32 %201, %192
  %203 = tail call i32 @llvm.fshl.i32(i32 %202, i32 %202, i32 11)
  %204 = add i32 %203, %190
  %205 = or i64 %172, 2
  %206 = xor i32 %190, %175
  %207 = xor i32 %206, %204
  %208 = mul i64 %205, 3
  %209 = add i64 %208, 5
  %210 = and i64 %209, 15
  %211 = getelementptr inbounds [16 x i32], [16 x i32]* %3, i64 0, i64 %210
  %212 = load i32, i32* %211, align 4, !tbaa !9
  %213 = getelementptr inbounds [64 x i32], [64 x i32]* @tab, i64 0, i64 %205
  %214 = load i32, i32* %213, align 8, !tbaa !9
  %215 = add i32 %212, %174
  %216 = add i32 %215, %214
  %217 = add i32 %216, %207
  %218 = tail call i32 @llvm.fshl.i32(i32 %217, i32 %217, i32 16)
  %219 = add i32 %218, %204
  %220 = or i64 %172, 3
  %221 = xor i32 %204, %190
  %222 = xor i32 %221, %219
  %223 = mul nuw nsw i64 %220, 3
  %224 = add nuw nsw i64 %223, 5
  %225 = and i64 %224, 14
  %226 = getelementptr inbounds [16 x i32], [16 x i32]* %3, i64 0, i64 %225
  %227 = load i32, i32* %226, align 8, !tbaa !9
  %228 = getelementptr inbounds [64 x i32], [64 x i32]* @tab, i64 0, i64 %220
  %229 = load i32, i32* %228, align 4, !tbaa !9
  %230 = add i32 %227, %175
  %231 = add i32 %230, %229
  %232 = add i32 %231, %222
  %233 = tail call i32 @llvm.fshl.i32(i32 %232, i32 %232, i32 23)
  %234 = add i32 %233, %219
  %235 = add nuw nsw i64 %172, 4
  %236 = icmp ult i64 %172, 44
  br i1 %236, label %171, label %237

237:                                              ; preds = %171, %237
  %238 = phi i64 [ %302, %237 ], [ 48, %171 ]
  %239 = phi i32 [ %271, %237 ], [ %204, %171 ]
  %240 = phi i32 [ %286, %237 ], [ %219, %171 ]
  %241 = phi i32 [ %301, %237 ], [ %234, %171 ]
  %242 = phi i32 [ %256, %237 ], [ %190, %171 ]
  %243 = xor i32 %239, -1
  %244 = or i32 %241, %243
  %245 = xor i32 %244, %240
  %246 = mul nuw nsw i64 %238, 7
  %247 = and i64 %246, 12
  %248 = getelementptr inbounds [16 x i32], [16 x i32]* %3, i64 0, i64 %247
  %249 = load i32, i32* %248, align 16, !tbaa !9
  %250 = getelementptr inbounds [64 x i32], [64 x i32]* @tab, i64 0, i64 %238
  %251 = load i32, i32* %250, align 16, !tbaa !9
  %252 = add i32 %245, %242
  %253 = add i32 %252, %249
  %254 = add i32 %253, %251
  %255 = tail call i32 @llvm.fshl.i32(i32 %254, i32 %254, i32 6)
  %256 = add i32 %255, %241
  %257 = or i64 %238, 1
  %258 = xor i32 %240, -1
  %259 = or i32 %256, %258
  %260 = xor i32 %259, %241
  %261 = mul i64 %257, 7
  %262 = and i64 %261, 15
  %263 = getelementptr inbounds [16 x i32], [16 x i32]* %3, i64 0, i64 %262
  %264 = load i32, i32* %263, align 4, !tbaa !9
  %265 = getelementptr inbounds [64 x i32], [64 x i32]* @tab, i64 0, i64 %257
  %266 = load i32, i32* %265, align 4, !tbaa !9
  %267 = add i32 %264, %239
  %268 = add i32 %267, %266
  %269 = add i32 %268, %260
  %270 = tail call i32 @llvm.fshl.i32(i32 %269, i32 %269, i32 10)
  %271 = add i32 %270, %256
  %272 = or i64 %238, 2
  %273 = xor i32 %241, -1
  %274 = or i32 %271, %273
  %275 = xor i32 %274, %256
  %276 = mul nuw nsw i64 %272, 7
  %277 = and i64 %276, 14
  %278 = getelementptr inbounds [16 x i32], [16 x i32]* %3, i64 0, i64 %277
  %279 = load i32, i32* %278, align 8, !tbaa !9
  %280 = getelementptr inbounds [64 x i32], [64 x i32]* @tab, i64 0, i64 %272
  %281 = load i32, i32* %280, align 8, !tbaa !9
  %282 = add i32 %279, %240
  %283 = add i32 %282, %281
  %284 = add i32 %283, %275
  %285 = tail call i32 @llvm.fshl.i32(i32 %284, i32 %284, i32 15)
  %286 = add i32 %285, %271
  %287 = or i64 %238, 3
  %288 = xor i32 %256, -1
  %289 = or i32 %286, %288
  %290 = xor i32 %289, %271
  %291 = mul i64 %287, 7
  %292 = and i64 %291, 13
  %293 = getelementptr inbounds [16 x i32], [16 x i32]* %3, i64 0, i64 %292
  %294 = load i32, i32* %293, align 4, !tbaa !9
  %295 = getelementptr inbounds [64 x i32], [64 x i32]* @tab, i64 0, i64 %287
  %296 = load i32, i32* %295, align 4, !tbaa !9
  %297 = add i32 %294, %241
  %298 = add i32 %297, %296
  %299 = add i32 %298, %290
  %300 = tail call i32 @llvm.fshl.i32(i32 %299, i32 %299, i32 21)
  %301 = add i32 %300, %286
  %302 = add nuw nsw i64 %238, 4
  %303 = icmp ult i64 %238, 60
  br i1 %303, label %237, label %304

304:                                              ; preds = %237
  %305 = add i32 %256, %34
  store i32 %305, i32* %33, align 8, !tbaa !9
  %306 = add i32 %301, %36
  store i32 %306, i32* %35, align 4, !tbaa !9
  %307 = add i32 %286, %38
  store i32 %307, i32* %37, align 8, !tbaa !9
  %308 = add i32 %271, %40
  store i32 %308, i32* %39, align 4, !tbaa !9
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %4) #5
  ret void
}

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #4

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nosync nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { nounwind strictfp }
attributes #6 = { nobuiltin optsize strictfp "no-builtins" }
attributes #7 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !8, i64 0}
!7 = !{!"md5", !8, i64 0, !4, i64 8, !4, i64 24}
!8 = !{!"long", !4, i64 0}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !4, i64 0}
