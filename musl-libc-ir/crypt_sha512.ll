; ModuleID = 'src/crypt/crypt_sha512.c'
source_filename = "src/crypt/crypt_sha512.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sha512 = type { i64, [8 x i64], [128 x i8] }

@__crypt_sha512.testkey = internal constant [18 x i8] c"Xy01@#\01\02\80\7F\FF\0D\0A\81\09 !\00", align 16
@__crypt_sha512.testsetting = internal constant [30 x i8] c"$6$rounds=1234$abc0123456789$\00", align 16
@__crypt_sha512.testhash = internal constant [116 x i8] c"$6$rounds=1234$abc0123456789$BCpt8zLrc/RcyuXmCDOE1ALqMXB2MH6n1g891HhFj8.w7LxGv.FTkqq6Vxc/km3Y0jE0j24jY5PIv/oOu6reg1\00", align 16
@.str = private unnamed_addr constant [2 x i8] c"*\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"$6$\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"rounds=\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"rounds=%u$\00", align 1
@.str.4 = private unnamed_addr constant [11 x i8] c"$6$%s%.*s$\00", align 1
@sha512crypt.perm = internal unnamed_addr constant [21 x [3 x i8]] [[3 x i8] c"\00\15*", [3 x i8] c"\16+\01", [3 x i8] c",\02\17", [3 x i8] c"\03\18-", [3 x i8] c"\19.\04", [3 x i8] c"/\05\1A", [3 x i8] c"\06\1B0", [3 x i8] c"\1C1\07", [3 x i8] c"2\08\1D", [3 x i8] c"\09\1E3", [3 x i8] c"\1F4\0A", [3 x i8] c"5\0B ", [3 x i8] c"\0C!6", [3 x i8] c"\227\0D", [3 x i8] c"8\0E#", [3 x i8] c"\0F$9", [3 x i8] c"%:\10", [3 x i8] c";\11&", [3 x i8] c"\12'<", [3 x i8] c"(=\13", [3 x i8] c">\14)"], align 16
@K = internal unnamed_addr constant [80 x i64] [i64 4794697086780616226, i64 8158064640168781261, i64 -5349999486874862801, i64 -1606136188198331460, i64 4131703408338449720, i64 6480981068601479193, i64 -7908458776815382629, i64 -6116909921290321640, i64 -2880145864133508542, i64 1334009975649890238, i64 2608012711638119052, i64 6128411473006802146, i64 8268148722764581231, i64 -9160688886553864527, i64 -7215885187991268811, i64 -4495734319001033068, i64 -1973867731355612462, i64 -1171420211273849373, i64 1135362057144423861, i64 2597628984639134821, i64 3308224258029322869, i64 5365058923640841347, i64 6679025012923562964, i64 8573033837759648693, i64 -7476448914759557205, i64 -6327057829258317296, i64 -5763719355590565569, i64 -4658551843659510044, i64 -4116276920077217854, i64 -3051310485924567259, i64 489312712824947311, i64 1452737877330783856, i64 2861767655752347644, i64 3322285676063803686, i64 5560940570517711597, i64 5996557281743188959, i64 7280758554555802590, i64 8532644243296465576, i64 -9096487096722542874, i64 -7894198246740708037, i64 -6719396339535248540, i64 -6333637450476146687, i64 -4446306890439682159, i64 -4076793802049405392, i64 -3345356375505022440, i64 -2983346525034927856, i64 -860691631967231958, i64 1182934255886127544, i64 1847814050463011016, i64 2177327727835720531, i64 2830643537854262169, i64 3796741975233480872, i64 4115178125766777443, i64 5681478168544905931, i64 6601373596472566643, i64 7507060721942968483, i64 8399075790359081724, i64 8693463985226723168, i64 -8878714635349349518, i64 -8302665154208450068, i64 -8016688836872298968, i64 -6606660893046293015, i64 -4685533653050689259, i64 -4147400797238176981, i64 -3880063495543823972, i64 -3348786107499101689, i64 -1523767162380948706, i64 -757361751448694408, i64 500013540394364858, i64 748580250866718886, i64 1242879168328830382, i64 1977374033974150939, i64 2944078676154940804, i64 3659926193048069267, i64 4368137639120453308, i64 4836135668995329356, i64 5532061633213252278, i64 6448918945643986474, i64 6902733635092675308, i64 7801388544844847127], align 16
@b64 = internal unnamed_addr constant [65 x i8] c"./0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz\00", align 16

; Function Attrs: nounwind optsize strictfp
define i8* @__crypt_sha512(i8* noundef %0, i8* noundef %1, i8* noundef %2) local_unnamed_addr #0 {
  %4 = alloca [128 x i8], align 16
  %5 = getelementptr inbounds [128 x i8], [128 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %5) #6
  %6 = tail call fastcc i8* @sha512crypt(i8* noundef %0, i8* noundef %1, i8* noundef %2) #7
  %7 = call fastcc i8* @sha512crypt(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @__crypt_sha512.testkey, i64 0, i64 0), i8* noundef getelementptr inbounds ([30 x i8], [30 x i8]* @__crypt_sha512.testsetting, i64 0, i64 0), i8* noundef nonnull %5) #7
  %8 = icmp eq i8* %6, null
  %9 = icmp ne i8* %7, %5
  %10 = select i1 %8, i1 true, i1 %9
  br i1 %10, label %15, label %11

11:                                               ; preds = %3
  %12 = call i32 @memcmp(i8* noundef nonnull %5, i8* noundef getelementptr inbounds ([116 x i8], [116 x i8]* @__crypt_sha512.testhash, i64 0, i64 0), i64 noundef 116) #8
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
define internal fastcc i8* @sha512crypt(i8* noundef %0, i8* noundef %1, i8* noundef %2) unnamed_addr #0 {
  %4 = alloca %struct.sha512, align 16
  %5 = alloca [64 x i8], align 16
  %6 = alloca [64 x i8], align 16
  %7 = alloca [64 x i8], align 16
  %8 = alloca [20 x i8], align 16
  %9 = alloca i8*, align 8
  %10 = bitcast %struct.sha512* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 200, i8* nonnull %10) #6
  %11 = getelementptr inbounds [64 x i8], [64 x i8]* %5, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %11) #6
  %12 = getelementptr inbounds [64 x i8], [64 x i8]* %6, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %12) #6
  %13 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %13) #6
  %14 = getelementptr inbounds [20 x i8], [20 x i8]* %8, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %14) #6
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(20) %14, i8 0, i64 20, i1 false) #9
  br label %15

15:                                               ; preds = %3, %20
  %16 = phi i64 [ 0, %3 ], [ %21, %20 ]
  %17 = getelementptr inbounds i8, i8* %0, i64 %16
  %18 = load i8, i8* %17, align 1, !tbaa !3
  %19 = icmp eq i8 %18, 0
  br i1 %19, label %23, label %20

20:                                               ; preds = %15
  %21 = add nuw nsw i64 %16, 1
  %22 = icmp eq i64 %21, 257
  br i1 %22, label %199, label %15

23:                                               ; preds = %15
  %24 = trunc i64 %16 to i32
  %25 = tail call i32 @strncmp(i8* noundef %1, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i64 noundef 3) #8
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %199

27:                                               ; preds = %23
  %28 = getelementptr inbounds i8, i8* %1, i64 3
  %29 = tail call i32 @strncmp(i8* noundef nonnull %28, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0), i64 noundef 7) #8
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %54

31:                                               ; preds = %27
  %32 = bitcast i8** %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %32) #6
  %33 = getelementptr inbounds i8, i8* %1, i64 10
  %34 = load i8, i8* %33, align 1, !tbaa !3
  %35 = sext i8 %34 to i32
  %36 = add nsw i32 %35, -48
  %37 = icmp ult i32 %36, 10
  br i1 %37, label %38, label %50

38:                                               ; preds = %31
  %39 = call i64 @strtoul(i8* noundef nonnull %33, i8** noundef nonnull %9, i32 noundef 10) #8
  %40 = load i8*, i8** %9, align 8, !tbaa !6
  %41 = load i8, i8* %40, align 1, !tbaa !3
  %42 = icmp eq i8 %41, 36
  br i1 %42, label %43, label %50

43:                                               ; preds = %38
  %44 = getelementptr inbounds i8, i8* %40, i64 1
  %45 = icmp ult i64 %39, 1000
  br i1 %45, label %51, label %46

46:                                               ; preds = %43
  %47 = icmp ugt i64 %39, 9999999
  br i1 %47, label %50, label %48

48:                                               ; preds = %46
  %49 = trunc i64 %39 to i32
  br label %51

50:                                               ; preds = %31, %38, %46
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %32) #6
  br label %199

51:                                               ; preds = %48, %43
  %52 = phi i32 [ %49, %48 ], [ 1000, %43 ]
  %53 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef nonnull %14, i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i32 noundef %52) #8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %32) #6
  br label %54

54:                                               ; preds = %51, %27
  %55 = phi i32 [ %52, %51 ], [ 5000, %27 ]
  %56 = phi i8* [ %44, %51 ], [ %28, %27 ]
  br label %57

57:                                               ; preds = %54, %61
  %58 = phi i64 [ 0, %54 ], [ %62, %61 ]
  %59 = getelementptr inbounds i8, i8* %56, i64 %58
  %60 = load i8, i8* %59, align 1, !tbaa !3
  switch i8 %60, label %61 [
    i8 0, label %64
    i8 36, label %64
    i8 10, label %199
    i8 58, label %199
  ]

61:                                               ; preds = %57
  %62 = add nuw nsw i64 %58, 1
  %63 = icmp eq i64 %62, 16
  br i1 %63, label %66, label %57

64:                                               ; preds = %57, %57
  %65 = trunc i64 %58 to i32
  br label %66

66:                                               ; preds = %61, %64
  %67 = phi i32 [ %65, %64 ], [ 16, %61 ]
  %68 = bitcast %struct.sha512* %4 to <2 x i64>*
  store <2 x i64> <i64 0, i64 7640891576956012808>, <2 x i64>* %68, align 16, !tbaa !8
  %69 = getelementptr inbounds %struct.sha512, %struct.sha512* %4, i64 0, i32 1, i64 1
  %70 = bitcast i64* %69 to <2 x i64>*
  store <2 x i64> <i64 -4942790177534073029, i64 4354685564936845355>, <2 x i64>* %70, align 16, !tbaa !8
  %71 = getelementptr inbounds %struct.sha512, %struct.sha512* %4, i64 0, i32 1, i64 3
  %72 = bitcast i64* %71 to <2 x i64>*
  store <2 x i64> <i64 -6534734903238641935, i64 5840696475078001361>, <2 x i64>* %72, align 16, !tbaa !8
  %73 = getelementptr inbounds %struct.sha512, %struct.sha512* %4, i64 0, i32 1, i64 5
  %74 = bitcast i64* %73 to <2 x i64>*
  store <2 x i64> <i64 -7276294671716946913, i64 2270897969802886507>, <2 x i64>* %74, align 16, !tbaa !8
  %75 = getelementptr inbounds %struct.sha512, %struct.sha512* %4, i64 0, i32 1, i64 7
  store i64 6620516959819538809, i64* %75, align 16, !tbaa !8
  %76 = and i64 %16, 4294967295
  call fastcc void @sha512_update(%struct.sha512* noundef nonnull %4, i8* noundef %0, i64 noundef %76) #7
  %77 = zext i32 %67 to i64
  call fastcc void @sha512_update(%struct.sha512* noundef nonnull %4, i8* noundef nonnull %56, i64 noundef %77) #7
  call fastcc void @sha512_update(%struct.sha512* noundef nonnull %4, i8* noundef %0, i64 noundef %76) #7
  call fastcc void @sha512_sum(%struct.sha512* noundef nonnull %4, i8* noundef nonnull %11) #7
  %78 = bitcast %struct.sha512* %4 to <2 x i64>*
  store <2 x i64> <i64 0, i64 7640891576956012808>, <2 x i64>* %78, align 16, !tbaa !8
  %79 = bitcast i64* %69 to <2 x i64>*
  store <2 x i64> <i64 -4942790177534073029, i64 4354685564936845355>, <2 x i64>* %79, align 16, !tbaa !8
  %80 = bitcast i64* %71 to <2 x i64>*
  store <2 x i64> <i64 -6534734903238641935, i64 5840696475078001361>, <2 x i64>* %80, align 16, !tbaa !8
  %81 = bitcast i64* %73 to <2 x i64>*
  store <2 x i64> <i64 -7276294671716946913, i64 2270897969802886507>, <2 x i64>* %81, align 16, !tbaa !8
  store i64 6620516959819538809, i64* %75, align 16, !tbaa !8
  call fastcc void @sha512_update(%struct.sha512* noundef nonnull %4, i8* noundef %0, i64 noundef %76) #7
  call fastcc void @sha512_update(%struct.sha512* noundef nonnull %4, i8* noundef nonnull %56, i64 noundef %77) #7
  call fastcc void @hashmd(%struct.sha512* noundef nonnull %4, i32 noundef %24, i8* noundef nonnull %11) #7
  %82 = icmp eq i32 %24, 0
  br i1 %82, label %92, label %83

83:                                               ; preds = %66, %89
  %84 = phi i32 [ %90, %89 ], [ %24, %66 ]
  %85 = and i32 %84, 1
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %88, label %87

87:                                               ; preds = %83
  call fastcc void @sha512_update(%struct.sha512* noundef nonnull %4, i8* noundef nonnull %11, i64 noundef 64) #7
  br label %89

88:                                               ; preds = %83
  call fastcc void @sha512_update(%struct.sha512* noundef nonnull %4, i8* noundef %0, i64 noundef %76) #7
  br label %89

89:                                               ; preds = %87, %88
  %90 = lshr i32 %84, 1
  %91 = icmp ult i32 %84, 2
  br i1 %91, label %92, label %83

92:                                               ; preds = %89, %66
  call fastcc void @sha512_sum(%struct.sha512* noundef nonnull %4, i8* noundef nonnull %11) #7
  %93 = bitcast %struct.sha512* %4 to <2 x i64>*
  store <2 x i64> <i64 0, i64 7640891576956012808>, <2 x i64>* %93, align 16, !tbaa !8
  %94 = bitcast i64* %69 to <2 x i64>*
  store <2 x i64> <i64 -4942790177534073029, i64 4354685564936845355>, <2 x i64>* %94, align 16, !tbaa !8
  %95 = bitcast i64* %71 to <2 x i64>*
  store <2 x i64> <i64 -6534734903238641935, i64 5840696475078001361>, <2 x i64>* %95, align 16, !tbaa !8
  %96 = bitcast i64* %73 to <2 x i64>*
  store <2 x i64> <i64 -7276294671716946913, i64 2270897969802886507>, <2 x i64>* %96, align 16, !tbaa !8
  store i64 6620516959819538809, i64* %75, align 16, !tbaa !8
  %97 = icmp eq i32 %24, 0
  br i1 %97, label %102, label %98

98:                                               ; preds = %92, %98
  %99 = phi i32 [ %100, %98 ], [ 0, %92 ]
  call fastcc void @sha512_update(%struct.sha512* noundef nonnull %4, i8* noundef %0, i64 noundef %76) #7
  %100 = add nuw nsw i32 %99, 1
  %101 = icmp eq i32 %100, %24
  br i1 %101, label %102, label %98

102:                                              ; preds = %98, %92
  call fastcc void @sha512_sum(%struct.sha512* noundef nonnull %4, i8* noundef nonnull %12) #7
  %103 = bitcast %struct.sha512* %4 to <2 x i64>*
  store <2 x i64> <i64 0, i64 7640891576956012808>, <2 x i64>* %103, align 16, !tbaa !8
  %104 = bitcast i64* %69 to <2 x i64>*
  store <2 x i64> <i64 -4942790177534073029, i64 4354685564936845355>, <2 x i64>* %104, align 16, !tbaa !8
  %105 = bitcast i64* %71 to <2 x i64>*
  store <2 x i64> <i64 -6534734903238641935, i64 5840696475078001361>, <2 x i64>* %105, align 16, !tbaa !8
  %106 = bitcast i64* %73 to <2 x i64>*
  store <2 x i64> <i64 -7276294671716946913, i64 2270897969802886507>, <2 x i64>* %106, align 16, !tbaa !8
  store i64 6620516959819538809, i64* %75, align 16, !tbaa !8
  br label %107

107:                                              ; preds = %102, %107
  %108 = phi i32 [ 0, %102 ], [ %109, %107 ]
  call fastcc void @sha512_update(%struct.sha512* noundef nonnull %4, i8* noundef nonnull %56, i64 noundef %77) #7
  %109 = add nuw nsw i32 %108, 1
  %110 = load i8, i8* %11, align 16, !tbaa !3
  %111 = zext i8 %110 to i32
  %112 = add nuw nsw i32 %111, 16
  %113 = icmp ult i32 %109, %112
  br i1 %113, label %107, label %114

114:                                              ; preds = %107
  call fastcc void @sha512_sum(%struct.sha512* noundef nonnull %4, i8* noundef nonnull %13) #7
  %115 = icmp eq i32 %55, 0
  br i1 %115, label %141, label %116

116:                                              ; preds = %114
  %117 = bitcast %struct.sha512* %4 to <2 x i64>*
  %118 = bitcast i64* %69 to <2 x i64>*
  %119 = bitcast i64* %71 to <2 x i64>*
  %120 = bitcast i64* %73 to <2 x i64>*
  br label %121

121:                                              ; preds = %116, %138
  %122 = phi i32 [ %139, %138 ], [ 0, %116 ]
  store <2 x i64> <i64 0, i64 7640891576956012808>, <2 x i64>* %117, align 16, !tbaa !8
  store <2 x i64> <i64 -4942790177534073029, i64 4354685564936845355>, <2 x i64>* %118, align 16, !tbaa !8
  store <2 x i64> <i64 -6534734903238641935, i64 5840696475078001361>, <2 x i64>* %119, align 16, !tbaa !8
  store <2 x i64> <i64 -7276294671716946913, i64 2270897969802886507>, <2 x i64>* %120, align 16, !tbaa !8
  store i64 6620516959819538809, i64* %75, align 16, !tbaa !8
  %123 = and i32 %122, 1
  %124 = icmp eq i32 %123, 0
  br i1 %124, label %126, label %125

125:                                              ; preds = %121
  call fastcc void @hashmd(%struct.sha512* noundef nonnull %4, i32 noundef %24, i8* noundef nonnull %12) #7
  br label %127

126:                                              ; preds = %121
  call fastcc void @sha512_update(%struct.sha512* noundef nonnull %4, i8* noundef nonnull %11, i64 noundef 64) #7
  br label %127

127:                                              ; preds = %126, %125
  %128 = urem i32 %122, 3
  %129 = icmp eq i32 %128, 0
  br i1 %129, label %131, label %130

130:                                              ; preds = %127
  call fastcc void @sha512_update(%struct.sha512* noundef nonnull %4, i8* noundef nonnull %13, i64 noundef %77) #7
  br label %131

131:                                              ; preds = %130, %127
  %132 = urem i32 %122, 7
  %133 = icmp eq i32 %132, 0
  br i1 %133, label %135, label %134

134:                                              ; preds = %131
  call fastcc void @hashmd(%struct.sha512* noundef nonnull %4, i32 noundef %24, i8* noundef nonnull %12) #7
  br label %135

135:                                              ; preds = %134, %131
  br i1 %124, label %137, label %136

136:                                              ; preds = %135
  call fastcc void @sha512_update(%struct.sha512* noundef nonnull %4, i8* noundef nonnull %11, i64 noundef 64) #7
  br label %138

137:                                              ; preds = %135
  call fastcc void @hashmd(%struct.sha512* noundef nonnull %4, i32 noundef %24, i8* noundef nonnull %12) #7
  br label %138

138:                                              ; preds = %137, %136
  call fastcc void @sha512_sum(%struct.sha512* noundef nonnull %4, i8* noundef nonnull %11) #7
  %139 = add nuw i32 %122, 1
  %140 = icmp eq i32 %139, %55
  br i1 %140, label %141, label %121

141:                                              ; preds = %138, %114
  %142 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef %2, i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i64 0, i64 0), i8* noundef nonnull %14, i32 noundef %67, i8* noundef nonnull %56) #8
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds i8, i8* %2, i64 %143
  br label %145

145:                                              ; preds = %141, %182
  %146 = phi i64 [ 0, %141 ], [ %183, %182 ]
  %147 = phi i8* [ %144, %141 ], [ %179, %182 ]
  %148 = getelementptr inbounds [21 x [3 x i8]], [21 x [3 x i8]]* @sha512crypt.perm, i64 0, i64 %146, i64 0
  %149 = load i8, i8* %148, align 1, !tbaa !3
  %150 = zext i8 %149 to i64
  %151 = getelementptr inbounds [64 x i8], [64 x i8]* %5, i64 0, i64 %150
  %152 = load i8, i8* %151, align 1, !tbaa !3
  %153 = zext i8 %152 to i32
  %154 = shl nuw nsw i32 %153, 16
  %155 = getelementptr inbounds [21 x [3 x i8]], [21 x [3 x i8]]* @sha512crypt.perm, i64 0, i64 %146, i64 1
  %156 = load i8, i8* %155, align 1, !tbaa !3
  %157 = zext i8 %156 to i64
  %158 = getelementptr inbounds [64 x i8], [64 x i8]* %5, i64 0, i64 %157
  %159 = load i8, i8* %158, align 1, !tbaa !3
  %160 = zext i8 %159 to i32
  %161 = shl nuw nsw i32 %160, 8
  %162 = or i32 %161, %154
  %163 = getelementptr inbounds [21 x [3 x i8]], [21 x [3 x i8]]* @sha512crypt.perm, i64 0, i64 %146, i64 2
  %164 = load i8, i8* %163, align 1, !tbaa !3
  %165 = zext i8 %164 to i64
  %166 = getelementptr inbounds [64 x i8], [64 x i8]* %5, i64 0, i64 %165
  %167 = load i8, i8* %166, align 1, !tbaa !3
  %168 = zext i8 %167 to i32
  %169 = or i32 %162, %168
  br label %170

170:                                              ; preds = %170, %145
  %171 = phi i32 [ %174, %170 ], [ 4, %145 ]
  %172 = phi i32 [ %180, %170 ], [ %169, %145 ]
  %173 = phi i8* [ %179, %170 ], [ %147, %145 ]
  %174 = add nsw i32 %171, -1
  %175 = and i32 %172, 63
  %176 = zext i32 %175 to i64
  %177 = getelementptr inbounds [65 x i8], [65 x i8]* @b64, i64 0, i64 %176
  %178 = load i8, i8* %177, align 1, !tbaa !3
  %179 = getelementptr inbounds i8, i8* %173, i64 1
  store i8 %178, i8* %173, align 1, !tbaa !3
  %180 = lshr i32 %172, 6
  %181 = icmp ugt i32 %171, 1
  br i1 %181, label %170, label %182

182:                                              ; preds = %170
  %183 = add nuw nsw i64 %146, 1
  %184 = icmp eq i64 %183, 21
  br i1 %184, label %185, label %145

185:                                              ; preds = %182
  %186 = getelementptr inbounds [64 x i8], [64 x i8]* %5, i64 0, i64 63
  %187 = load i8, i8* %186, align 1, !tbaa !3
  %188 = zext i8 %187 to i32
  %189 = and i32 %188, 63
  %190 = zext i32 %189 to i64
  %191 = getelementptr inbounds [65 x i8], [65 x i8]* @b64, i64 0, i64 %190
  %192 = load i8, i8* %191, align 1, !tbaa !3
  %193 = getelementptr inbounds i8, i8* %173, i64 2
  store i8 %192, i8* %179, align 1, !tbaa !3
  %194 = lshr i32 %188, 6
  %195 = zext i32 %194 to i64
  %196 = getelementptr inbounds [65 x i8], [65 x i8]* @b64, i64 0, i64 %195
  %197 = load i8, i8* %196, align 1, !tbaa !3
  %198 = getelementptr inbounds i8, i8* %173, i64 3
  store i8 %197, i8* %193, align 1, !tbaa !3
  store i8 0, i8* %198, align 1, !tbaa !3
  br label %199

199:                                              ; preds = %20, %57, %57, %50, %23, %185
  %200 = phi i8* [ %2, %185 ], [ null, %23 ], [ null, %50 ], [ null, %57 ], [ null, %57 ], [ null, %20 ]
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %14) #6
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %13) #6
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %12) #6
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %11) #6
  call void @llvm.lifetime.end.p0i8(i64 200, i8* nonnull %10) #6
  ret i8* %200
}

; Function Attrs: optsize
declare i32 @memcmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: optsize
declare i32 @strncmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @strtoul(i8* noundef, i8** noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @sprintf(i8* noundef, i8* noundef, ...) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @sha512_update(%struct.sha512* noundef %0, i8* noundef %1, i64 noundef %2) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 0
  %5 = load i64, i64* %4, align 8, !tbaa !10
  %6 = trunc i64 %5 to i32
  %7 = and i32 %6, 127
  %8 = add i64 %5, %2
  store i64 %8, i64* %4, align 8, !tbaa !10
  %9 = icmp eq i32 %7, 0
  br i1 %9, label %25, label %10

10:                                               ; preds = %3
  %11 = sub nuw nsw i32 128, %7
  %12 = zext i32 %11 to i64
  %13 = icmp ugt i64 %12, %2
  br i1 %13, label %14, label %18

14:                                               ; preds = %10
  %15 = zext i32 %7 to i64
  %16 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 2, i64 %15
  %17 = tail call i8* @memcpy(i8* noundef nonnull %16, i8* noundef %1, i64 noundef %2) #8
  br label %40

18:                                               ; preds = %10
  %19 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 2, i64 0
  %20 = zext i32 %7 to i64
  %21 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 2, i64 %20
  %22 = tail call i8* @memcpy(i8* noundef nonnull %21, i8* noundef %1, i64 noundef %12) #8
  %23 = sub i64 %2, %12
  %24 = getelementptr inbounds i8, i8* %1, i64 %12
  tail call fastcc void @processblock(%struct.sha512* noundef nonnull %0, i8* noundef nonnull %19) #7
  br label %25

25:                                               ; preds = %18, %3
  %26 = phi i8* [ %24, %18 ], [ %1, %3 ]
  %27 = phi i64 [ %23, %18 ], [ %2, %3 ]
  %28 = icmp ugt i64 %27, 127
  br i1 %28, label %29, label %35

29:                                               ; preds = %25, %29
  %30 = phi i64 [ %32, %29 ], [ %27, %25 ]
  %31 = phi i8* [ %33, %29 ], [ %26, %25 ]
  tail call fastcc void @processblock(%struct.sha512* noundef %0, i8* noundef %31) #7
  %32 = add i64 %30, -128
  %33 = getelementptr inbounds i8, i8* %31, i64 128
  %34 = icmp ugt i64 %32, 127
  br i1 %34, label %29, label %35

35:                                               ; preds = %29, %25
  %36 = phi i8* [ %26, %25 ], [ %33, %29 ]
  %37 = phi i64 [ %27, %25 ], [ %32, %29 ]
  %38 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 2, i64 0
  %39 = tail call i8* @memcpy(i8* noundef nonnull %38, i8* noundef %36, i64 noundef %37) #8
  br label %40

40:                                               ; preds = %35, %14
  ret void
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @sha512_sum(%struct.sha512* noundef %0, i8* nocapture noundef writeonly %1) unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 0
  %4 = load i64, i64* %3, align 8, !tbaa !10
  %5 = trunc i64 %4 to i32
  %6 = and i32 %5, 127
  %7 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 2
  %8 = add nuw nsw i32 %6, 1
  %9 = zext i32 %6 to i64
  %10 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 2, i64 %9
  store i8 -128, i8* %10, align 1, !tbaa !3
  %11 = icmp ugt i32 %6, 111
  br i1 %11, label %12, label %19

12:                                               ; preds = %2
  %13 = getelementptr inbounds [128 x i8], [128 x i8]* %7, i64 0, i64 0
  %14 = zext i32 %8 to i64
  %15 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 2, i64 %14
  %16 = xor i32 %6, 127
  %17 = zext i32 %16 to i64
  %18 = tail call i8* @memset(i8* noundef nonnull %15, i32 noundef 0, i64 noundef %17) #8
  tail call fastcc void @processblock(%struct.sha512* noundef nonnull %0, i8* noundef nonnull %13) #8
  br label %19

19:                                               ; preds = %2, %12
  %20 = phi i32 [ 0, %12 ], [ %8, %2 ]
  %21 = getelementptr inbounds [128 x i8], [128 x i8]* %7, i64 0, i64 0
  %22 = zext i32 %20 to i64
  %23 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 2, i64 %22
  %24 = sub nuw nsw i32 120, %20
  %25 = zext i32 %24 to i64
  %26 = tail call i8* @memset(i8* noundef nonnull %23, i32 noundef 0, i64 noundef %25) #8
  %27 = load i64, i64* %3, align 8, !tbaa !10
  %28 = shl i64 %27, 3
  store i64 %28, i64* %3, align 8, !tbaa !10
  %29 = lshr i64 %28, 56
  %30 = trunc i64 %29 to i8
  %31 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 2, i64 120
  store i8 %30, i8* %31, align 8, !tbaa !3
  %32 = lshr i64 %28, 48
  %33 = trunc i64 %32 to i8
  %34 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 2, i64 121
  store i8 %33, i8* %34, align 1, !tbaa !3
  %35 = lshr i64 %28, 40
  %36 = trunc i64 %35 to i8
  %37 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 2, i64 122
  store i8 %36, i8* %37, align 2, !tbaa !3
  %38 = lshr i64 %28, 32
  %39 = trunc i64 %38 to i8
  %40 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 2, i64 123
  store i8 %39, i8* %40, align 1, !tbaa !3
  %41 = lshr i64 %28, 24
  %42 = trunc i64 %41 to i8
  %43 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 2, i64 124
  store i8 %42, i8* %43, align 4, !tbaa !3
  %44 = lshr i64 %28, 16
  %45 = trunc i64 %44 to i8
  %46 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 2, i64 125
  store i8 %45, i8* %46, align 1, !tbaa !3
  %47 = lshr i64 %28, 8
  %48 = trunc i64 %47 to i8
  %49 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 2, i64 126
  store i8 %48, i8* %49, align 2, !tbaa !3
  %50 = trunc i64 %28 to i8
  %51 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 2, i64 127
  store i8 %50, i8* %51, align 1, !tbaa !3
  tail call fastcc void @processblock(%struct.sha512* noundef nonnull %0, i8* noundef nonnull %21) #8
  br label %52

52:                                               ; preds = %19, %52
  %53 = phi i64 [ 0, %19 ], [ %94, %52 ]
  %54 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 1, i64 %53
  %55 = load i64, i64* %54, align 8, !tbaa !8
  %56 = lshr i64 %55, 56
  %57 = trunc i64 %56 to i8
  %58 = shl nuw nsw i64 %53, 3
  %59 = getelementptr inbounds i8, i8* %1, i64 %58
  store i8 %57, i8* %59, align 1, !tbaa !3
  %60 = load i64, i64* %54, align 8, !tbaa !8
  %61 = lshr i64 %60, 48
  %62 = trunc i64 %61 to i8
  %63 = or i64 %58, 1
  %64 = getelementptr inbounds i8, i8* %1, i64 %63
  store i8 %62, i8* %64, align 1, !tbaa !3
  %65 = load i64, i64* %54, align 8, !tbaa !8
  %66 = lshr i64 %65, 40
  %67 = trunc i64 %66 to i8
  %68 = or i64 %58, 2
  %69 = getelementptr inbounds i8, i8* %1, i64 %68
  store i8 %67, i8* %69, align 1, !tbaa !3
  %70 = load i64, i64* %54, align 8, !tbaa !8
  %71 = lshr i64 %70, 32
  %72 = trunc i64 %71 to i8
  %73 = or i64 %58, 3
  %74 = getelementptr inbounds i8, i8* %1, i64 %73
  store i8 %72, i8* %74, align 1, !tbaa !3
  %75 = load i64, i64* %54, align 8, !tbaa !8
  %76 = lshr i64 %75, 24
  %77 = trunc i64 %76 to i8
  %78 = or i64 %58, 4
  %79 = getelementptr inbounds i8, i8* %1, i64 %78
  store i8 %77, i8* %79, align 1, !tbaa !3
  %80 = load i64, i64* %54, align 8, !tbaa !8
  %81 = lshr i64 %80, 16
  %82 = trunc i64 %81 to i8
  %83 = or i64 %58, 5
  %84 = getelementptr inbounds i8, i8* %1, i64 %83
  store i8 %82, i8* %84, align 1, !tbaa !3
  %85 = load i64, i64* %54, align 8, !tbaa !8
  %86 = lshr i64 %85, 8
  %87 = trunc i64 %86 to i8
  %88 = or i64 %58, 6
  %89 = getelementptr inbounds i8, i8* %1, i64 %88
  store i8 %87, i8* %89, align 1, !tbaa !3
  %90 = load i64, i64* %54, align 8, !tbaa !8
  %91 = trunc i64 %90 to i8
  %92 = or i64 %58, 7
  %93 = getelementptr inbounds i8, i8* %1, i64 %92
  store i8 %91, i8* %93, align 1, !tbaa !3
  %94 = add nuw nsw i64 %53, 1
  %95 = icmp eq i64 %94, 8
  br i1 %95, label %96, label %52

96:                                               ; preds = %52
  ret void
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @hashmd(%struct.sha512* noundef %0, i32 noundef %1, i8* noundef %2) unnamed_addr #0 {
  %4 = icmp ugt i32 %1, 64
  br i1 %4, label %5, label %9

5:                                                ; preds = %3, %5
  %6 = phi i32 [ %7, %5 ], [ %1, %3 ]
  tail call fastcc void @sha512_update(%struct.sha512* noundef %0, i8* noundef %2, i64 noundef 64) #7
  %7 = add i32 %6, -64
  %8 = icmp ugt i32 %7, 64
  br i1 %8, label %5, label %9

9:                                                ; preds = %5, %3
  %10 = phi i32 [ %1, %3 ], [ %7, %5 ]
  %11 = zext i32 %10 to i64
  tail call fastcc void @sha512_update(%struct.sha512* noundef %0, i8* noundef %2, i64 noundef %11) #7
  ret void
}

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nofree nosync nounwind optsize strictfp
define internal fastcc void @processblock(%struct.sha512* nocapture noundef %0, i8* nocapture noundef readonly %1) unnamed_addr #4 {
  %3 = alloca [80 x i64], align 16
  %4 = bitcast [80 x i64]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 640, i8* nonnull %4) #6
  br label %8

5:                                                ; preds = %8
  %6 = getelementptr inbounds [80 x i64], [80 x i64]* %3, i64 0, i64 0
  %7 = load i64, i64* %6, align 16, !tbaa !8
  br label %59

8:                                                ; preds = %2, %8
  %9 = phi i64 [ 0, %2 ], [ %57, %8 ]
  %10 = shl nuw nsw i64 %9, 3
  %11 = getelementptr inbounds i8, i8* %1, i64 %10
  %12 = load i8, i8* %11, align 1, !tbaa !3
  %13 = zext i8 %12 to i64
  %14 = shl nuw i64 %13, 56
  %15 = getelementptr inbounds [80 x i64], [80 x i64]* %3, i64 0, i64 %9
  %16 = or i64 %10, 1
  %17 = getelementptr inbounds i8, i8* %1, i64 %16
  %18 = load i8, i8* %17, align 1, !tbaa !3
  %19 = zext i8 %18 to i64
  %20 = shl nuw nsw i64 %19, 48
  %21 = or i64 %20, %14
  %22 = or i64 %10, 2
  %23 = getelementptr inbounds i8, i8* %1, i64 %22
  %24 = load i8, i8* %23, align 1, !tbaa !3
  %25 = zext i8 %24 to i64
  %26 = shl nuw nsw i64 %25, 40
  %27 = or i64 %26, %21
  %28 = or i64 %10, 3
  %29 = getelementptr inbounds i8, i8* %1, i64 %28
  %30 = load i8, i8* %29, align 1, !tbaa !3
  %31 = zext i8 %30 to i64
  %32 = shl nuw nsw i64 %31, 32
  %33 = or i64 %32, %27
  %34 = or i64 %10, 4
  %35 = getelementptr inbounds i8, i8* %1, i64 %34
  %36 = load i8, i8* %35, align 1, !tbaa !3
  %37 = zext i8 %36 to i64
  %38 = shl nuw nsw i64 %37, 24
  %39 = or i64 %38, %33
  %40 = or i64 %10, 5
  %41 = getelementptr inbounds i8, i8* %1, i64 %40
  %42 = load i8, i8* %41, align 1, !tbaa !3
  %43 = zext i8 %42 to i64
  %44 = shl nuw nsw i64 %43, 16
  %45 = or i64 %44, %39
  %46 = or i64 %10, 6
  %47 = getelementptr inbounds i8, i8* %1, i64 %46
  %48 = load i8, i8* %47, align 1, !tbaa !3
  %49 = zext i8 %48 to i64
  %50 = shl nuw nsw i64 %49, 8
  %51 = or i64 %50, %45
  %52 = or i64 %10, 7
  %53 = getelementptr inbounds i8, i8* %1, i64 %52
  %54 = load i8, i8* %53, align 1, !tbaa !3
  %55 = zext i8 %54 to i64
  %56 = or i64 %51, %55
  store i64 %56, i64* %15, align 8, !tbaa !8
  %57 = add nuw nsw i64 %9, 1
  %58 = icmp eq i64 %57, 16
  br i1 %58, label %5, label %8

59:                                               ; preds = %5, %59
  %60 = phi i64 [ %7, %5 ], [ %76, %59 ]
  %61 = phi i64 [ 16, %5 ], [ %85, %59 ]
  %62 = add nsw i64 %61, -2
  %63 = getelementptr inbounds [80 x i64], [80 x i64]* %3, i64 0, i64 %62
  %64 = load i64, i64* %63, align 8, !tbaa !8
  %65 = tail call i64 @llvm.fshl.i64(i64 %64, i64 %64, i64 45)
  %66 = tail call i64 @llvm.fshl.i64(i64 %64, i64 %64, i64 3)
  %67 = xor i64 %65, %66
  %68 = lshr i64 %64, 6
  %69 = xor i64 %67, %68
  %70 = add nsw i64 %61, -7
  %71 = getelementptr inbounds [80 x i64], [80 x i64]* %3, i64 0, i64 %70
  %72 = load i64, i64* %71, align 8, !tbaa !8
  %73 = add i64 %69, %72
  %74 = add nsw i64 %61, -15
  %75 = getelementptr inbounds [80 x i64], [80 x i64]* %3, i64 0, i64 %74
  %76 = load i64, i64* %75, align 8, !tbaa !8
  %77 = tail call i64 @llvm.fshl.i64(i64 %76, i64 %76, i64 63)
  %78 = tail call i64 @llvm.fshl.i64(i64 %76, i64 %76, i64 56)
  %79 = xor i64 %77, %78
  %80 = lshr i64 %76, 7
  %81 = xor i64 %79, %80
  %82 = add i64 %73, %60
  %83 = add i64 %82, %81
  %84 = getelementptr inbounds [80 x i64], [80 x i64]* %3, i64 0, i64 %61
  store i64 %83, i64* %84, align 8, !tbaa !8
  %85 = add nuw nsw i64 %61, 1
  %86 = icmp eq i64 %85, 80
  br i1 %86, label %87, label %59

87:                                               ; preds = %59
  %88 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 1, i64 0
  %89 = load i64, i64* %88, align 8, !tbaa !8
  %90 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 1, i64 1
  %91 = load i64, i64* %90, align 8, !tbaa !8
  %92 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 1, i64 2
  %93 = load i64, i64* %92, align 8, !tbaa !8
  %94 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 1, i64 3
  %95 = load i64, i64* %94, align 8, !tbaa !8
  %96 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 1, i64 4
  %97 = load i64, i64* %96, align 8, !tbaa !8
  %98 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 1, i64 5
  %99 = load i64, i64* %98, align 8, !tbaa !8
  %100 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 1, i64 6
  %101 = load i64, i64* %100, align 8, !tbaa !8
  %102 = getelementptr inbounds %struct.sha512, %struct.sha512* %0, i64 0, i32 1, i64 7
  %103 = load i64, i64* %102, align 8, !tbaa !8
  br label %104

104:                                              ; preds = %87, %104
  %105 = phi i64 [ 0, %87 ], [ %142, %104 ]
  %106 = phi i64 [ %103, %87 ], [ %107, %104 ]
  %107 = phi i64 [ %101, %87 ], [ %108, %104 ]
  %108 = phi i64 [ %99, %87 ], [ %109, %104 ]
  %109 = phi i64 [ %97, %87 ], [ %140, %104 ]
  %110 = phi i64 [ %95, %87 ], [ %111, %104 ]
  %111 = phi i64 [ %93, %87 ], [ %112, %104 ]
  %112 = phi i64 [ %91, %87 ], [ %113, %104 ]
  %113 = phi i64 [ %89, %87 ], [ %141, %104 ]
  %114 = tail call i64 @llvm.fshl.i64(i64 %109, i64 %109, i64 50)
  %115 = tail call i64 @llvm.fshl.i64(i64 %109, i64 %109, i64 46)
  %116 = xor i64 %114, %115
  %117 = tail call i64 @llvm.fshl.i64(i64 %109, i64 %109, i64 23)
  %118 = xor i64 %116, %117
  %119 = add i64 %106, %118
  %120 = xor i64 %107, %108
  %121 = and i64 %120, %109
  %122 = xor i64 %121, %107
  %123 = add i64 %119, %122
  %124 = getelementptr inbounds [80 x i64], [80 x i64]* @K, i64 0, i64 %105
  %125 = load i64, i64* %124, align 8, !tbaa !8
  %126 = add i64 %123, %125
  %127 = getelementptr inbounds [80 x i64], [80 x i64]* %3, i64 0, i64 %105
  %128 = load i64, i64* %127, align 8, !tbaa !8
  %129 = add i64 %126, %128
  %130 = tail call i64 @llvm.fshl.i64(i64 %113, i64 %113, i64 36)
  %131 = tail call i64 @llvm.fshl.i64(i64 %113, i64 %113, i64 30)
  %132 = xor i64 %130, %131
  %133 = tail call i64 @llvm.fshl.i64(i64 %113, i64 %113, i64 25)
  %134 = xor i64 %132, %133
  %135 = and i64 %112, %113
  %136 = or i64 %112, %113
  %137 = and i64 %111, %136
  %138 = or i64 %137, %135
  %139 = add i64 %138, %134
  %140 = add i64 %129, %110
  %141 = add i64 %139, %129
  %142 = add nuw nsw i64 %105, 1
  %143 = icmp eq i64 %142, 80
  br i1 %143, label %144, label %104

144:                                              ; preds = %104
  %145 = add i64 %141, %89
  store i64 %145, i64* %88, align 8, !tbaa !8
  %146 = add i64 %113, %91
  store i64 %146, i64* %90, align 8, !tbaa !8
  %147 = add i64 %112, %93
  store i64 %147, i64* %92, align 8, !tbaa !8
  %148 = add i64 %111, %95
  store i64 %148, i64* %94, align 8, !tbaa !8
  %149 = add i64 %140, %97
  store i64 %149, i64* %96, align 8, !tbaa !8
  %150 = add i64 %109, %99
  store i64 %150, i64* %98, align 8, !tbaa !8
  %151 = add i64 %108, %101
  store i64 %151, i64* %100, align 8, !tbaa !8
  %152 = add i64 %107, %103
  store i64 %152, i64* %102, align 8, !tbaa !8
  call void @llvm.lifetime.end.p0i8(i64 640, i8* nonnull %4) #6
  ret void
}

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.fshl.i64(i64, i64, i64) #5

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
!8 = !{!9, !9, i64 0}
!9 = !{!"long", !4, i64 0}
!10 = !{!11, !9, i64 0}
!11 = !{!"sha512", !9, i64 0, !4, i64 8, !4, i64 72}
