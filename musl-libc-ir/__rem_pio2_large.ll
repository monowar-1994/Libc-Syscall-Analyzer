; ModuleID = 'src/math/__rem_pio2_large.c'
source_filename = "src/math/__rem_pio2_large.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@init_jk = internal unnamed_addr constant [4 x i32] [i32 3, i32 4, i32 4, i32 6], align 16
@ipio2 = internal unnamed_addr constant [690 x i32] [i32 10680707, i32 7228996, i32 1387004, i32 2578385, i32 16069853, i32 12639074, i32 9804092, i32 4427841, i32 16666979, i32 11263675, i32 12935607, i32 2387514, i32 4345298, i32 14681673, i32 3074569, i32 13734428, i32 16653803, i32 1880361, i32 10960616, i32 8533493, i32 3062596, i32 8710556, i32 7349940, i32 6258241, i32 3772886, i32 3769171, i32 3798172, i32 8675211, i32 12450088, i32 3874808, i32 9961438, i32 366607, i32 15675153, i32 9132554, i32 7151469, i32 3571407, i32 2607881, i32 12013382, i32 4155038, i32 6285869, i32 7677882, i32 13102053, i32 15825725, i32 473591, i32 9065106, i32 15363067, i32 6271263, i32 9264392, i32 5636912, i32 4652155, i32 7056368, i32 13614112, i32 10155062, i32 1944035, i32 9527646, i32 15080200, i32 6658437, i32 6231200, i32 6832269, i32 16767104, i32 5075751, i32 3212806, i32 1398474, i32 7579849, i32 6349435, i32 12618859, i32 4703257, i32 12806093, i32 14477321, i32 2786137, i32 12875403, i32 9837734, i32 14528324, i32 13719321, i32 343717, i32 16713477, i32 4161075, i32 15217346, i32 14569368, i32 3308987, i32 12795174, i32 15690526, i32 6224031, i32 3809077, i32 13300351, i32 1935345, i32 2199676, i32 8135786, i32 16412373, i32 7810352, i32 4406037, i32 12981429, i32 10295747, i32 12764333, i32 4279596, i32 6094860, i32 4619654, i32 2978275, i32 10143387, i32 25139, i32 8180404, i32 9938868, i32 13980983, i32 16137943, i32 1577123, i32 16545357, i32 2792804, i32 11261808, i32 16284771, i32 5746810, i32 15144215, i32 5654976, i32 14276155, i32 3703975, i32 13312804, i32 7834326, i32 2315354, i32 12132096, i32 1772273, i32 14667289, i32 16724383, i32 6954598, i32 6379417, i32 4717484, i32 14188414, i32 12018978, i32 9037874, i32 6340582, i32 13485295, i32 603756, i32 13909853, i32 14147094, i32 14564184, i32 9608158, i32 2630354, i32 15238696, i32 5069026, i32 3328710, i32 1499912, i32 13336032, i32 5292055, i32 10952179, i32 6021144, i32 3412782, i32 6427267, i32 84099, i32 6000373, i32 8368301, i32 15919390, i32 4409928, i32 13854480, i32 14212522, i32 4349870, i32 13525354, i32 10758154, i32 11835859, i32 15902214, i32 8353628, i32 8635043, i32 8928353, i32 7893898, i32 5934255, i32 12441455, i32 6530605, i32 13352948, i32 15696269, i32 6799654, i32 4573781, i32 3594698, i32 13805608, i32 9265602, i32 7850258, i32 1320452, i32 10176018, i32 12868036, i32 4507080, i32 9548365, i32 15931136, i32 11355092, i32 15026473, i32 1103357, i32 16563712, i32 13407262, i32 15650416, i32 16072211, i32 8450540, i32 12838835, i32 2685127, i32 9700755, i32 4092353, i32 11733294, i32 15942923, i32 10228360, i32 8069291, i32 10466606, i32 12751431, i32 3093115, i32 7165196, i32 9480050, i32 2090859, i32 9882417, i32 4855417, i32 14842177, i32 9035764, i32 9934056, i32 8709858, i32 9908633, i32 7073160, i32 3563359, i32 982459, i32 11835976, i32 7119975, i32 4354673, i32 3300749, i32 12064159, i32 648636, i32 2437517, i32 3765495, i32 1836336, i32 68621, i32 6817867, i32 5828140, i32 9480775, i32 190324, i32 2414269, i32 10911223, i32 7489646, i32 15668895, i32 10917006, i32 16159156, i32 5329873, i32 15862479, i32 3381280, i32 8276981, i32 6841266, i32 6242013, i32 220480, i32 8358277, i32 2708053, i32 12608567, i32 1103981, i32 3295282, i32 7687259, i32 13922638, i32 7230533, i32 12650763, i32 6944042, i32 13985300, i32 10290983, i32 5243997, i32 14367668, i32 12941034, i32 1571207, i32 8219465, i32 12199709, i32 2714006, i32 11324614, i32 5510317, i32 7004816, i32 9034120, i32 5272108, i32 12493828, i32 9701239, i32 7352563, i32 2620416, i32 11039210, i32 4833894, i32 4055140, i32 8641943, i32 9912227, i32 16618563, i32 9209357, i32 14565681, i32 10303890, i32 9203933, i32 15185687, i32 3923720, i32 2832149, i32 10518620, i32 9666650, i32 9572624, i32 14215183, i32 11501676, i32 4980699, i32 1019960, i32 7739481, i32 1418594, i32 12307297, i32 12159431, i32 12402704, i32 324306, i32 2585929, i32 16168683, i32 12264155, i32 11146250, i32 3090057, i32 7766884, i32 3357449, i32 1741838, i32 11156049, i32 12755741, i32 11464111, i32 1189468, i32 5096045, i32 10254893, i32 9918144, i32 8601347, i32 16183305, i32 9191467, i32 10039661, i32 504889, i32 1384460, i32 6013912, i32 12882677, i32 4959686, i32 10865230, i32 13449127, i32 3582438, i32 9736875, i32 6832861, i32 14574361, i32 15699062, i32 5409640, i32 3660796, i32 11248046, i32 3216863, i32 10595840, i32 14351116, i32 6704484, i32 11994605, i32 3171625, i32 12539479, i32 3866439, i32 12188010, i32 15974005, i32 14652200, i32 3178667, i32 16157798, i32 1428228, i32 402170, i32 1959129, i32 10793789, i32 9378647, i32 642358, i32 15286862, i32 10796563, i32 11871027, i32 1747696, i32 11035983, i32 10863058, i32 999179, i32 13465691, i32 7797027, i32 297851, i32 7477129, i32 5482182, i32 14839407, i32 60399, i32 5786267, i32 12049092, i32 12215978, i32 13619062, i32 1901265, i32 3010993, i32 12687756, i32 7843267, i32 14305414, i32 10509815, i32 16023750, i32 3141804, i32 10153181, i32 12344383, i32 7200464, i32 2082704, i32 11983658, i32 3810723, i32 10137344, i32 9655213, i32 284598, i32 11808041, i32 8290379, i32 10946522, i32 961142, i32 10574203, i32 2757142, i32 2996188, i32 16639482, i32 16702345, i32 16629385, i32 7108324, i32 16558342, i32 7372862, i32 1404549, i32 16746493, i32 474664, i32 3368801, i32 8788010, i32 15383885, i32 11528115, i32 7237007, i32 3762069, i32 6012721, i32 4773764, i32 1498928, i32 4402631, i32 3498277, i32 13529289, i32 12110640, i32 16608447, i32 10616996, i32 14969861, i32 10542426, i32 4681505, i32 13767266, i32 8674489, i32 4809072, i32 14702187, i32 86681, i32 3626320, i32 12047646, i32 12906803, i32 6254099, i32 14954589, i32 11087493, i32 12825117, i32 3551905, i32 10794760, i32 13939178, i32 2225942, i32 14969231, i32 7864103, i32 8389388, i32 2965645, i32 10538319, i32 10069280, i32 13869747, i32 679215, i32 4389300, i32 13359633, i32 13680253, i32 12704667, i32 12392363, i32 8495818, i32 6056456, i32 1529134, i32 5570599, i32 15733887, i32 8783841, i32 6556436, i32 9257366, i32 14597767, i32 2817498, i32 11937131, i32 3443067, i32 16708357, i32 10403769, i32 5204584, i32 11020874, i32 5948495, i32 12384301, i32 9984727, i32 9816052, i32 9260301, i32 10893856, i32 6248356, i32 11616020, i32 9779328, i32 73932, i32 8838513, i32 11984585, i32 16081087, i32 1140045, i32 7014145, i32 11317388, i32 13680818, i32 4740433, i32 981790, i32 12808853, i32 3868323, i32 3489984, i32 8117254, i32 13387232, i32 16394574, i32 13159126, i32 4322280, i32 14574716, i32 14181531, i32 3260121, i32 12818340, i32 13916279, i32 12968809, i32 1301232, i32 3947194, i32 4593734, i32 6255957, i32 16104914, i32 13013614, i32 6106796, i32 15549454, i32 4341276, i32 8897633, i32 15334697, i32 15980263, i32 13270050, i32 3510639, i32 12967944, i32 9295871, i32 14838382, i32 13041072, i32 12650643, i32 7626108, i32 11709803, i32 10317517, i32 8090174, i32 6951366, i32 11128823, i32 14644009, i32 12241333, i32 5308599, i32 897762, i32 2407028, i32 6323685, i32 9099380, i32 2888973, i32 792705, i32 9725566, i32 1452289, i32 7764639, i32 12516861, i32 15680854, i32 3571417, i32 1300972, i32 12171915, i32 16553924, i32 2598961, i32 12807921, i32 3589524, i32 5679320, i32 11905204, i32 969935, i32 2984210, i32 3430255, i32 9000492, i32 14929561, i32 12132566, i32 11165291, i32 10234430, i32 13393681, i32 4852733, i32 16512225, i32 7158670, i32 2918114, i32 8705257, i32 11121916, i32 13758191, i32 13186350, i32 6371631, i32 4464952, i32 13162779, i32 720001, i32 6966011, i32 14162991, i32 8696915, i32 9214286, i32 13378132, i32 14439722, i32 14075584, i32 9836811, i32 12087322, i32 6591849, i32 6314534, i32 15618623, i32 987519, i32 1160692, i32 16108540, i32 2997300, i32 15645748, i32 13393384, i32 6315741, i32 10194535, i32 15676306, i32 12064713, i32 10180705, i32 12343265, i32 13009745, i32 1064664, i32 4747741, i32 14490669, i32 10557615, i32 4598817, i32 14152537, i32 9992921, i32 12604574, i32 16418383, i32 16516694, i32 11434469, i32 3547785, i32 2272568, i32 14455655, i32 11200597, i32 3679874, i32 10217418, i32 10751313, i32 11613081, i32 972713, i32 4719977, i32 15774309, i32 10979455, i32 9915528, i32 3592697, i32 11768353, i32 4883067, i32 2215832, i32 14458688, i32 5588956, i32 3831009, i32 4385639, i32 14654974, i32 6280286, i32 10774395, i32 8039610, i32 10679893, i32 2328619, i32 5618241, i32 552537, i32 8792609, i32 8603449, i32 15131529, i32 13934309, i32 4258633, i32 15292159, i32 13242140, i32 9066949, i32 2882196, i32 12960211, i32 13616399, i32 11426523, i32 8832327, i32 6439813, i32 3900961, i32 9730348, i32 8872208, i32 8080426, i32 1715328, i32 1228611, i32 9447048, i32 8993912, i32 14992552, i32 8117221, i32 12729028, i32 15397926, i32 9070583, i32 12554765, i32 2859877, i32 11637565, i32 752829, i32 14438820, i32 6544679, i32 14541161, i32 1676442, i32 9775528, i32 2674280, i32 11857161, i32 2137924, i32 13277262, i32 6521456, i32 2325630, i32 3324175, i32 9368999, i32 15160852, i32 586017, i32 2792885, i32 5078639, i32 5314981, i32 11270581, i32 14081922, i32 6413718, i32 144918, i32 10435268, i32 10592899, i32 7204210, i32 8031545, i32 11122818, i32 6042219, i32 5973830, i32 15545344, i32 7798994, i32 5633276, i32 5069057, i32 8417760], align 16
@PIo2 = internal unnamed_addr constant [8 x double] [double 0x3FF921FB40000000, double 0x3E74442D00000000, double 0x3CF8469880000000, double 0x3B78CC5160000000, double 0x39F01B8380000000, double 0x387A252040000000, double 0x36E3822280000000, double 0x3569F31D00000000], align 16

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__rem_pio2_large(double* nocapture noundef readonly %0, double* nocapture noundef writeonly %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) local_unnamed_addr #0 {
  %6 = alloca [20 x i32], align 16
  %7 = alloca [20 x double], align 16
  %8 = alloca [20 x double], align 16
  %9 = alloca [20 x double], align 16
  %10 = bitcast [20 x i32]* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 80, i8* nonnull %10) #5
  %11 = bitcast [20 x double]* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 160, i8* nonnull %11) #5
  %12 = bitcast [20 x double]* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 160, i8* nonnull %12) #5
  %13 = bitcast [20 x double]* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 160, i8* nonnull %13) #5
  %14 = sext i32 %4 to i64
  %15 = getelementptr inbounds [4 x i32], [4 x i32]* @init_jk, i64 0, i64 %14
  %16 = load i32, i32* %15, align 4, !tbaa !3
  %17 = add nsw i32 %3, -1
  %18 = add nsw i32 %2, -3
  %19 = sdiv i32 %18, 24
  %20 = icmp sgt i32 %19, 0
  %21 = select i1 %20, i32 %19, i32 0
  %22 = mul nsw i32 %21, -24
  %23 = add i32 %22, %2
  %24 = add i32 %23, -24
  %25 = add nsw i32 %16, %17
  %26 = icmp slt i32 %25, 0
  br i1 %26, label %31, label %27

27:                                               ; preds = %5
  %28 = sub nsw i32 %21, %17
  %29 = add i32 %16, %3
  %30 = zext i32 %29 to i64
  br label %37

31:                                               ; preds = %46, %5
  %32 = icmp sgt i32 %3, 0
  %33 = call i32 @llvm.smax.i32(i32 %16, i32 0)
  %34 = add nuw i32 %33, 1
  %35 = zext i32 %34 to i64
  %36 = zext i32 %3 to i64
  br label %52

37:                                               ; preds = %27, %46
  %38 = phi i64 [ 0, %27 ], [ %49, %46 ]
  %39 = phi i32 [ %28, %27 ], [ %50, %46 ]
  %40 = icmp slt i32 %39, 0
  br i1 %40, label %46, label %41

41:                                               ; preds = %37
  %42 = zext i32 %39 to i64
  %43 = getelementptr inbounds [690 x i32], [690 x i32]* @ipio2, i64 0, i64 %42
  %44 = load i32, i32* %43, align 4, !tbaa !3
  %45 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %44, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %46

46:                                               ; preds = %37, %41
  %47 = phi double [ %45, %41 ], [ 0.000000e+00, %37 ]
  %48 = getelementptr inbounds [20 x double], [20 x double]* %7, i64 0, i64 %38
  store double %47, double* %48, align 8, !tbaa !7
  %49 = add nuw nsw i64 %38, 1
  %50 = add nsw i32 %39, 1
  %51 = icmp eq i64 %49, %30
  br i1 %51, label %31, label %37

52:                                               ; preds = %31, %79
  %53 = phi i64 [ 0, %31 ], [ %82, %79 ]
  br i1 %32, label %54, label %79

54:                                               ; preds = %52
  %55 = trunc i64 %53 to i32
  %56 = add nsw i32 %17, %55
  br label %66

57:                                               ; preds = %79
  %58 = icmp sgt i32 %24, 0
  %59 = icmp eq i32 %24, 0
  %60 = sub i32 48, %23
  %61 = sub i32 47, %23
  %62 = icmp sgt i32 %3, 0
  %63 = sext i32 %16 to i64
  %64 = zext i32 %21 to i64
  %65 = zext i32 %3 to i64
  br label %84

66:                                               ; preds = %54, %66
  %67 = phi i64 [ 0, %54 ], [ %77, %66 ]
  %68 = phi double [ 0.000000e+00, %54 ], [ %76, %66 ]
  %69 = getelementptr inbounds double, double* %0, i64 %67
  %70 = load double, double* %69, align 8, !tbaa !7
  %71 = trunc i64 %67 to i32
  %72 = sub i32 %56, %71
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [20 x double], [20 x double]* %7, i64 0, i64 %73
  %75 = load double, double* %74, align 8, !tbaa !7
  %76 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %70, double %75, double %68, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %77 = add nuw nsw i64 %67, 1
  %78 = icmp eq i64 %77, %36
  br i1 %78, label %79, label %66

79:                                               ; preds = %66, %52
  %80 = phi double [ 0.000000e+00, %52 ], [ %76, %66 ]
  %81 = getelementptr inbounds [20 x double], [20 x double]* %9, i64 0, i64 %53
  store double %80, double* %81, align 8, !tbaa !7
  %82 = add nuw nsw i64 %53, 1
  %83 = icmp eq i64 %82, %35
  br i1 %83, label %57, label %52

84:                                               ; preds = %232, %57
  %85 = phi i32 [ %16, %57 ], [ %208, %232 ]
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [20 x double], [20 x double]* %9, i64 0, i64 %86
  %88 = load double, double* %87, align 8, !tbaa !7
  %89 = icmp sgt i32 %85, 0
  br i1 %89, label %90, label %109

90:                                               ; preds = %84
  %91 = zext i32 %85 to i64
  br label %92

92:                                               ; preds = %90, %92
  %93 = phi i64 [ 0, %90 ], [ %107, %92 ]
  %94 = phi i64 [ %91, %90 ], [ %102, %92 ]
  %95 = phi double [ %88, %90 ], [ %106, %92 ]
  %96 = tail call double @llvm.experimental.constrained.fmul.f64(double 0x3E70000000000000, double %95, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %97 = tail call i32 @llvm.experimental.constrained.fptosi.i32.f64(double %96, metadata !"fpexcept.ignore") #6
  %98 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %97, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %99 = tail call double @llvm.experimental.constrained.fmuladd.f64(double 0xC170000000000000, double %98, double %95, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %100 = tail call i32 @llvm.experimental.constrained.fptosi.i32.f64(double %99, metadata !"fpexcept.ignore") #6
  %101 = getelementptr inbounds [20 x i32], [20 x i32]* %6, i64 0, i64 %93
  store i32 %100, i32* %101, align 4, !tbaa !3
  %102 = add nsw i64 %94, -1
  %103 = and i64 %102, 4294967295
  %104 = getelementptr inbounds [20 x double], [20 x double]* %9, i64 0, i64 %103
  %105 = load double, double* %104, align 8, !tbaa !7
  %106 = tail call double @llvm.experimental.constrained.fadd.f64(double %105, double %98, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %107 = add nuw nsw i64 %93, 1
  %108 = icmp eq i64 %107, %91
  br i1 %108, label %109, label %92

109:                                              ; preds = %92, %84
  %110 = phi double [ %88, %84 ], [ %106, %92 ]
  %111 = tail call double @scalbn(double noundef %110, i32 noundef %24) #7
  %112 = tail call double @llvm.experimental.constrained.fmul.f64(double %111, double 1.250000e-01, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %113 = tail call double @floor(double noundef %112) #7
  %114 = tail call double @llvm.experimental.constrained.fmuladd.f64(double -8.000000e+00, double %113, double %111, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %115 = tail call i32 @llvm.experimental.constrained.fptosi.i32.f64(double %114, metadata !"fpexcept.ignore") #6
  %116 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %115, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %117 = tail call double @llvm.experimental.constrained.fsub.f64(double %114, double %116, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br i1 %58, label %118, label %128

118:                                              ; preds = %109
  %119 = add nsw i32 %85, -1
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [20 x i32], [20 x i32]* %6, i64 0, i64 %120
  %122 = load i32, i32* %121, align 4, !tbaa !3
  %123 = ashr i32 %122, %60
  %124 = add nsw i32 %123, %115
  %125 = shl i32 %123, %60
  %126 = sub nsw i32 %122, %125
  store i32 %126, i32* %121, align 4, !tbaa !3
  %127 = ashr i32 %126, %61
  br label %137

128:                                              ; preds = %109
  br i1 %59, label %129, label %135

129:                                              ; preds = %128
  %130 = add nsw i32 %85, -1
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [20 x i32], [20 x i32]* %6, i64 0, i64 %131
  %133 = load i32, i32* %132, align 4, !tbaa !3
  %134 = ashr i32 %133, 23
  br label %137

135:                                              ; preds = %128
  %136 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %117, double 5.000000e-01, metadata !"oge", metadata !"fpexcept.ignore") #6
  br i1 %136, label %141, label %181

137:                                              ; preds = %129, %118
  %138 = phi i32 [ %124, %118 ], [ %115, %129 ]
  %139 = phi i32 [ %127, %118 ], [ %134, %129 ]
  %140 = icmp sgt i32 %139, 0
  br i1 %140, label %141, label %181

141:                                              ; preds = %135, %137
  %142 = phi i32 [ %139, %137 ], [ 2, %135 ]
  %143 = phi i32 [ %138, %137 ], [ %115, %135 ]
  %144 = add nsw i32 %143, 1
  br i1 %89, label %145, label %162

145:                                              ; preds = %141
  %146 = zext i32 %85 to i64
  br label %147

147:                                              ; preds = %145, %158
  %148 = phi i64 [ 0, %145 ], [ %160, %158 ]
  %149 = phi i32 [ 0, %145 ], [ %159, %158 ]
  %150 = getelementptr inbounds [20 x i32], [20 x i32]* %6, i64 0, i64 %148
  %151 = load i32, i32* %150, align 4, !tbaa !3
  %152 = icmp eq i32 %149, 0
  br i1 %152, label %153, label %155

153:                                              ; preds = %147
  %154 = icmp eq i32 %151, 0
  br i1 %154, label %158, label %155

155:                                              ; preds = %147, %153
  %156 = phi i32 [ 16777216, %153 ], [ 16777215, %147 ]
  %157 = sub nsw i32 %156, %151
  store i32 %157, i32* %150, align 4, !tbaa !3
  br label %158

158:                                              ; preds = %155, %153
  %159 = phi i32 [ 0, %153 ], [ 1, %155 ]
  %160 = add nuw nsw i64 %148, 1
  %161 = icmp eq i64 %160, %146
  br i1 %161, label %162, label %147

162:                                              ; preds = %158, %141
  %163 = phi i32 [ 0, %141 ], [ %159, %158 ]
  br i1 %58, label %164, label %173

164:                                              ; preds = %162
  switch i32 %23, label %173 [
    i32 25, label %166
    i32 26, label %165
  ]

165:                                              ; preds = %164
  br label %166

166:                                              ; preds = %164, %165
  %167 = phi i32 [ 4194303, %165 ], [ 8388607, %164 ]
  %168 = add nsw i32 %85, -1
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [20 x i32], [20 x i32]* %6, i64 0, i64 %169
  %171 = load i32, i32* %170, align 4, !tbaa !3
  %172 = and i32 %171, %167
  store i32 %172, i32* %170, align 4, !tbaa !3
  br label %173

173:                                              ; preds = %166, %164, %162
  %174 = icmp eq i32 %142, 2
  br i1 %174, label %175, label %181

175:                                              ; preds = %173
  %176 = tail call double @llvm.experimental.constrained.fsub.f64(double 1.000000e+00, double %117, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %177 = icmp eq i32 %163, 0
  br i1 %177, label %181, label %178

178:                                              ; preds = %175
  %179 = tail call double @scalbn(double noundef 1.000000e+00, i32 noundef %24) #7
  %180 = tail call double @llvm.experimental.constrained.fsub.f64(double %176, double %179, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %181

181:                                              ; preds = %135, %173, %178, %175, %137
  %182 = phi i32 [ 2, %178 ], [ 2, %175 ], [ %142, %173 ], [ %139, %137 ], [ 0, %135 ]
  %183 = phi i32 [ %144, %178 ], [ %144, %175 ], [ %144, %173 ], [ %138, %137 ], [ %115, %135 ]
  %184 = phi double [ %180, %178 ], [ %176, %175 ], [ %117, %173 ], [ %117, %137 ], [ %117, %135 ]
  %185 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %184, double 0.000000e+00, metadata !"oeq", metadata !"fpexcept.ignore") #6
  br i1 %185, label %186, label %244

186:                                              ; preds = %181
  %187 = icmp sgt i32 %85, %16
  br i1 %187, label %188, label %198

188:                                              ; preds = %186, %188
  %189 = phi i64 [ %191, %188 ], [ %86, %186 ]
  %190 = phi i32 [ %194, %188 ], [ 0, %186 ]
  %191 = add nsw i64 %189, -1
  %192 = getelementptr inbounds [20 x i32], [20 x i32]* %6, i64 0, i64 %191
  %193 = load i32, i32* %192, align 4, !tbaa !3
  %194 = or i32 %193, %190
  %195 = icmp sgt i64 %191, %63
  br i1 %195, label %188, label %196

196:                                              ; preds = %188
  %197 = icmp eq i32 %194, 0
  br i1 %197, label %198, label %236

198:                                              ; preds = %186, %196
  br label %199

199:                                              ; preds = %198, %199
  %200 = phi i64 [ %205, %199 ], [ 1, %198 ]
  %201 = sub nsw i64 %63, %200
  %202 = getelementptr inbounds [20 x i32], [20 x i32]* %6, i64 0, i64 %201
  %203 = load i32, i32* %202, align 4, !tbaa !3
  %204 = icmp eq i32 %203, 0
  %205 = add nuw i64 %200, 1
  br i1 %204, label %199, label %206

206:                                              ; preds = %199
  %207 = trunc i64 %200 to i32
  %208 = add nsw i32 %85, %207
  %209 = sext i32 %208 to i64
  br label %210

210:                                              ; preds = %206, %232
  %211 = phi i64 [ %86, %206 ], [ %212, %232 ]
  %212 = add nsw i64 %211, 1
  %213 = add nsw i64 %212, %64
  %214 = getelementptr inbounds [690 x i32], [690 x i32]* @ipio2, i64 0, i64 %213
  %215 = load i32, i32* %214, align 4, !tbaa !3
  %216 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %215, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %217 = trunc i64 %211 to i32
  %218 = add i32 %217, %3
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds [20 x double], [20 x double]* %7, i64 0, i64 %219
  store double %216, double* %220, align 8, !tbaa !7
  br i1 %62, label %221, label %232

221:                                              ; preds = %210, %221
  %222 = phi i64 [ %230, %221 ], [ 0, %210 ]
  %223 = phi double [ %229, %221 ], [ 0.000000e+00, %210 ]
  %224 = getelementptr inbounds double, double* %0, i64 %222
  %225 = load double, double* %224, align 8, !tbaa !7
  %226 = sub nsw i64 %219, %222
  %227 = getelementptr inbounds [20 x double], [20 x double]* %7, i64 0, i64 %226
  %228 = load double, double* %227, align 8, !tbaa !7
  %229 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %225, double %228, double %223, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %230 = add nuw nsw i64 %222, 1
  %231 = icmp eq i64 %230, %65
  br i1 %231, label %232, label %221

232:                                              ; preds = %221, %210
  %233 = phi double [ 0.000000e+00, %210 ], [ %229, %221 ]
  %234 = getelementptr inbounds [20 x double], [20 x double]* %9, i64 0, i64 %212
  store double %233, double* %234, align 8, !tbaa !7
  %235 = icmp slt i64 %212, %209
  br i1 %235, label %210, label %84

236:                                              ; preds = %196, %236
  %237 = phi i64 [ %240, %236 ], [ %86, %196 ]
  %238 = phi i32 [ %239, %236 ], [ %24, %196 ]
  %239 = add nsw i32 %238, -24
  %240 = add i64 %237, -1
  %241 = getelementptr inbounds [20 x i32], [20 x i32]* %6, i64 0, i64 %240
  %242 = load i32, i32* %241, align 4, !tbaa !3
  %243 = icmp eq i32 %242, 0
  br i1 %243, label %236, label %262

244:                                              ; preds = %181
  %245 = sub i32 24, %23
  %246 = tail call double @scalbn(double noundef %184, i32 noundef %245) #7
  %247 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %246, double 0x4170000000000000, metadata !"oge", metadata !"fpexcept.ignore") #6
  br i1 %247, label %248, label %259

248:                                              ; preds = %244
  %249 = tail call double @llvm.experimental.constrained.fmul.f64(double 0x3E70000000000000, double %246, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %250 = tail call i32 @llvm.experimental.constrained.fptosi.i32.f64(double %249, metadata !"fpexcept.ignore") #6
  %251 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %250, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %252 = tail call double @llvm.experimental.constrained.fmuladd.f64(double 0xC170000000000000, double %251, double %246, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %253 = tail call i32 @llvm.experimental.constrained.fptosi.i32.f64(double %252, metadata !"fpexcept.ignore") #6
  %254 = getelementptr inbounds [20 x i32], [20 x i32]* %6, i64 0, i64 %86
  store i32 %253, i32* %254, align 4, !tbaa !3
  %255 = add nsw i32 %85, 1
  %256 = tail call i32 @llvm.experimental.constrained.fptosi.i32.f64(double %251, metadata !"fpexcept.ignore") #6
  %257 = sext i32 %255 to i64
  %258 = getelementptr inbounds [20 x i32], [20 x i32]* %6, i64 0, i64 %257
  store i32 %256, i32* %258, align 4, !tbaa !3
  br label %264

259:                                              ; preds = %244
  %260 = tail call i32 @llvm.experimental.constrained.fptosi.i32.f64(double %246, metadata !"fpexcept.ignore") #6
  %261 = getelementptr inbounds [20 x i32], [20 x i32]* %6, i64 0, i64 %86
  store i32 %260, i32* %261, align 4, !tbaa !3
  br label %264

262:                                              ; preds = %236
  %263 = trunc i64 %240 to i32
  br label %264

264:                                              ; preds = %262, %248, %259
  %265 = phi i32 [ %255, %248 ], [ %85, %259 ], [ %263, %262 ]
  %266 = phi i32 [ %23, %248 ], [ %24, %259 ], [ %239, %262 ]
  %267 = tail call double @scalbn(double noundef 1.000000e+00, i32 noundef %266) #7
  %268 = icmp sgt i32 %265, -1
  br i1 %268, label %269, label %305

269:                                              ; preds = %264
  %270 = zext i32 %265 to i64
  br label %274

271:                                              ; preds = %274
  br i1 %268, label %272, label %305

272:                                              ; preds = %271
  %273 = zext i32 %265 to i64
  br label %285

274:                                              ; preds = %269, %274
  %275 = phi i64 [ %270, %269 ], [ %283, %274 ]
  %276 = phi double [ %267, %269 ], [ %282, %274 ]
  %277 = getelementptr inbounds [20 x i32], [20 x i32]* %6, i64 0, i64 %275
  %278 = load i32, i32* %277, align 4, !tbaa !3
  %279 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %278, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %280 = tail call double @llvm.experimental.constrained.fmul.f64(double %276, double %279, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %281 = getelementptr inbounds [20 x double], [20 x double]* %9, i64 0, i64 %275
  store double %280, double* %281, align 8, !tbaa !7
  %282 = tail call double @llvm.experimental.constrained.fmul.f64(double %276, double 0x3E70000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %283 = add nsw i64 %275, -1
  %284 = icmp eq i64 %275, 0
  br i1 %284, label %271, label %274

285:                                              ; preds = %301, %272
  %286 = phi i64 [ %273, %272 ], [ %303, %301 ]
  %287 = sub nuw nsw i64 %273, %286
  br label %288

288:                                              ; preds = %285, %288
  %289 = phi i64 [ 0, %285 ], [ %297, %288 ]
  %290 = phi double [ 0.000000e+00, %285 ], [ %296, %288 ]
  %291 = getelementptr inbounds [8 x double], [8 x double]* @PIo2, i64 0, i64 %289
  %292 = load double, double* %291, align 8, !tbaa !7
  %293 = add nsw i64 %289, %286
  %294 = getelementptr inbounds [20 x double], [20 x double]* %9, i64 0, i64 %293
  %295 = load double, double* %294, align 8, !tbaa !7
  %296 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %292, double %295, double %290, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %297 = add nuw nsw i64 %289, 1
  %298 = icmp sge i64 %289, %63
  %299 = icmp uge i64 %289, %287
  %300 = select i1 %298, i1 true, i1 %299
  br i1 %300, label %301, label %288

301:                                              ; preds = %288
  %302 = getelementptr inbounds [20 x double], [20 x double]* %8, i64 0, i64 %287
  store double %296, double* %302, align 8, !tbaa !7
  %303 = add nsw i64 %286, -1
  %304 = icmp sgt i64 %286, 0
  br i1 %304, label %285, label %305

305:                                              ; preds = %301, %264, %271
  switch i32 %4, label %420 [
    i32 0, label %310
    i32 1, label %326
    i32 2, label %326
    i32 3, label %306
  ]

306:                                              ; preds = %305
  %307 = icmp sgt i32 %265, 0
  br i1 %307, label %308, label %401

308:                                              ; preds = %306
  %309 = zext i32 %265 to i64
  br label %366

310:                                              ; preds = %305
  br i1 %268, label %311, label %321

311:                                              ; preds = %310
  %312 = zext i32 %265 to i64
  br label %313

313:                                              ; preds = %311, %313
  %314 = phi i64 [ %312, %311 ], [ %319, %313 ]
  %315 = phi double [ 0.000000e+00, %311 ], [ %318, %313 ]
  %316 = getelementptr inbounds [20 x double], [20 x double]* %8, i64 0, i64 %314
  %317 = load double, double* %316, align 8, !tbaa !7
  %318 = tail call double @llvm.experimental.constrained.fadd.f64(double %315, double %317, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %319 = add nsw i64 %314, -1
  %320 = icmp eq i64 %314, 0
  br i1 %320, label %321, label %313

321:                                              ; preds = %313, %310
  %322 = phi double [ 0.000000e+00, %310 ], [ %318, %313 ]
  %323 = icmp eq i32 %182, 0
  %324 = fneg double %322
  %325 = select i1 %323, double %322, double %324
  store double %325, double* %1, align 8, !tbaa !7
  br label %420

326:                                              ; preds = %305, %305
  br i1 %268, label %327, label %337

327:                                              ; preds = %326
  %328 = zext i32 %265 to i64
  br label %329

329:                                              ; preds = %327, %329
  %330 = phi i64 [ %328, %327 ], [ %335, %329 ]
  %331 = phi double [ 0.000000e+00, %327 ], [ %334, %329 ]
  %332 = getelementptr inbounds [20 x double], [20 x double]* %8, i64 0, i64 %330
  %333 = load double, double* %332, align 8, !tbaa !7
  %334 = tail call double @llvm.experimental.constrained.fadd.f64(double %331, double %333, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %335 = add nsw i64 %330, -1
  %336 = icmp eq i64 %330, 0
  br i1 %336, label %337, label %329

337:                                              ; preds = %329, %326
  %338 = phi double [ 0.000000e+00, %326 ], [ %334, %329 ]
  %339 = icmp eq i32 %182, 0
  %340 = fneg double %338
  %341 = select i1 %339, double %338, double %340
  store double %341, double* %1, align 8, !tbaa !7
  %342 = getelementptr inbounds [20 x double], [20 x double]* %8, i64 0, i64 0
  %343 = load double, double* %342, align 16, !tbaa !7
  %344 = tail call double @llvm.experimental.constrained.fsub.f64(double %343, double %338, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %345 = icmp slt i32 %265, 1
  br i1 %345, label %357, label %346

346:                                              ; preds = %337
  %347 = add nuw i32 %265, 1
  %348 = zext i32 %347 to i64
  br label %349

349:                                              ; preds = %346, %349
  %350 = phi i64 [ 1, %346 ], [ %355, %349 ]
  %351 = phi double [ %344, %346 ], [ %354, %349 ]
  %352 = getelementptr inbounds [20 x double], [20 x double]* %8, i64 0, i64 %350
  %353 = load double, double* %352, align 8, !tbaa !7
  %354 = tail call double @llvm.experimental.constrained.fadd.f64(double %351, double %353, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %355 = add nuw nsw i64 %350, 1
  %356 = icmp eq i64 %355, %348
  br i1 %356, label %357, label %349

357:                                              ; preds = %349, %337
  %358 = phi double [ %344, %337 ], [ %354, %349 ]
  %359 = fneg double %358
  %360 = select i1 %339, double %358, double %359
  %361 = getelementptr inbounds double, double* %1, i64 1
  store double %360, double* %361, align 8, !tbaa !7
  br label %420

362:                                              ; preds = %366
  %363 = icmp sgt i32 %265, 1
  br i1 %363, label %364, label %401

364:                                              ; preds = %362
  %365 = zext i32 %265 to i64
  br label %381

366:                                              ; preds = %308, %366
  %367 = phi i64 [ %309, %308 ], [ %368, %366 ]
  %368 = add nsw i64 %367, -1
  %369 = and i64 %368, 4294967295
  %370 = getelementptr inbounds [20 x double], [20 x double]* %8, i64 0, i64 %369
  %371 = load double, double* %370, align 8, !tbaa !7
  %372 = getelementptr inbounds [20 x double], [20 x double]* %8, i64 0, i64 %367
  %373 = load double, double* %372, align 8, !tbaa !7
  %374 = tail call double @llvm.experimental.constrained.fadd.f64(double %371, double %373, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %375 = tail call double @llvm.experimental.constrained.fsub.f64(double %371, double %374, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %376 = tail call double @llvm.experimental.constrained.fadd.f64(double %373, double %375, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  store double %376, double* %372, align 8, !tbaa !7
  store double %374, double* %370, align 8, !tbaa !7
  %377 = icmp ugt i64 %367, 1
  br i1 %377, label %366, label %362

378:                                              ; preds = %381
  br i1 %363, label %379, label %401

379:                                              ; preds = %378
  %380 = zext i32 %265 to i64
  br label %393

381:                                              ; preds = %364, %381
  %382 = phi i64 [ %365, %364 ], [ %383, %381 ]
  %383 = add nsw i64 %382, -1
  %384 = and i64 %383, 4294967295
  %385 = getelementptr inbounds [20 x double], [20 x double]* %8, i64 0, i64 %384
  %386 = load double, double* %385, align 8, !tbaa !7
  %387 = getelementptr inbounds [20 x double], [20 x double]* %8, i64 0, i64 %382
  %388 = load double, double* %387, align 8, !tbaa !7
  %389 = tail call double @llvm.experimental.constrained.fadd.f64(double %386, double %388, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %390 = tail call double @llvm.experimental.constrained.fsub.f64(double %386, double %389, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %391 = tail call double @llvm.experimental.constrained.fadd.f64(double %388, double %390, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  store double %391, double* %387, align 8, !tbaa !7
  store double %389, double* %385, align 8, !tbaa !7
  %392 = icmp ugt i64 %382, 2
  br i1 %392, label %381, label %378

393:                                              ; preds = %379, %393
  %394 = phi i64 [ %380, %379 ], [ %399, %393 ]
  %395 = phi double [ 0.000000e+00, %379 ], [ %398, %393 ]
  %396 = getelementptr inbounds [20 x double], [20 x double]* %8, i64 0, i64 %394
  %397 = load double, double* %396, align 8, !tbaa !7
  %398 = tail call double @llvm.experimental.constrained.fadd.f64(double %395, double %397, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %399 = add nsw i64 %394, -1
  %400 = icmp ugt i64 %394, 2
  br i1 %400, label %393, label %401

401:                                              ; preds = %393, %362, %306, %378
  %402 = phi double [ 0.000000e+00, %378 ], [ 0.000000e+00, %306 ], [ 0.000000e+00, %362 ], [ %398, %393 ]
  %403 = icmp eq i32 %182, 0
  %404 = getelementptr inbounds [20 x double], [20 x double]* %8, i64 0, i64 0
  %405 = load double, double* %404, align 16, !tbaa !7
  br i1 %403, label %406, label %411

406:                                              ; preds = %401
  store double %405, double* %1, align 8, !tbaa !7
  %407 = getelementptr inbounds [20 x double], [20 x double]* %8, i64 0, i64 1
  %408 = load double, double* %407, align 8, !tbaa !7
  %409 = getelementptr inbounds double, double* %1, i64 1
  store double %408, double* %409, align 8, !tbaa !7
  %410 = getelementptr inbounds double, double* %1, i64 2
  store double %402, double* %410, align 8, !tbaa !7
  br label %420

411:                                              ; preds = %401
  %412 = getelementptr inbounds [20 x double], [20 x double]* %8, i64 0, i64 1
  %413 = load double, double* %412, align 8, !tbaa !7
  %414 = insertelement <2 x double> poison, double %405, i64 0
  %415 = insertelement <2 x double> %414, double %413, i64 1
  %416 = fneg <2 x double> %415
  %417 = bitcast double* %1 to <2 x double>*
  store <2 x double> %416, <2 x double>* %417, align 8, !tbaa !7
  %418 = fneg double %402
  %419 = getelementptr inbounds double, double* %1, i64 2
  store double %418, double* %419, align 8, !tbaa !7
  br label %420

420:                                              ; preds = %406, %411, %305, %357, %321
  %421 = and i32 %183, 7
  call void @llvm.lifetime.end.p0i8(i64 160, i8* nonnull %13) #5
  call void @llvm.lifetime.end.p0i8(i64 160, i8* nonnull %12) #5
  call void @llvm.lifetime.end.p0i8(i64 160, i8* nonnull %11) #5
  call void @llvm.lifetime.end.p0i8(i64 80, i8* nonnull %10) #5
  ret i32 %421
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i32 @llvm.experimental.constrained.fptosi.i32.f64(double, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

; Function Attrs: optsize
declare double @scalbn(double noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare double @floor(double noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f64(double, double, metadata, metadata) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #4

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { nounwind strictfp }
attributes #6 = { strictfp }
attributes #7 = { nobuiltin nounwind optsize strictfp "no-builtins" }

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
!8 = !{!"double", !5, i64 0}
