; ModuleID = 'src/crypt/crypt_blowfish.c'
source_filename = "src/crypt/crypt_blowfish.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.BF_ctx = type { %struct.anon.1 }
%struct.anon.1 = type { [18 x i32], [4 x [256 x i32]] }
%struct.anon = type { [30 x i8], [63 x i8] }
%struct.anon.0 = type { %union.BF_ctx, [18 x i32], %union.anon }
%union.anon = type { [6 x i32] }

@.str = private unnamed_addr constant [10 x i8] c"8b \D0\C1\D2\CF\CC\D8\00", align 1
@.str.1 = private unnamed_addr constant [30 x i8] c"$2a$00$abcdefghijklmnopqrstuu\00", align 1
@__crypt_blowfish.test_hashes = internal constant [2 x [34 x i8]] [[34 x i8] c"i1D709vfamulimlGcq0qq3UvuUasvEa\00U\00", [34 x i8] c"VUrPmXD6q/nVSSp7pNDhCR9071IfIRe\00U\00"], align 16
@flags_by_subtype = internal unnamed_addr constant [26 x i8] c"\02\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\04\00", align 16
@.str.2 = private unnamed_addr constant [12 x i8] c"\FF\A334\FF\FF\FF\A3345\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@BF_init_state = internal constant %union.BF_ctx { %struct.anon.1 { [18 x i32] [i32 608135816, i32 -2052912941, i32 320440878, i32 57701188, i32 -1542899678, i32 698298832, i32 137296536, i32 -330404727, i32 1160258022, i32 953160567, i32 -1101764913, i32 887688300, i32 -1062458953, i32 -914599715, i32 1065670069, i32 -1253635817, i32 -1843997223, i32 -1988494565], [4 x [256 x i32]] [[256 x i32] [i32 -785314906, i32 -1730169428, i32 805139163, i32 -803545161, i32 -1193168915, i32 1780907670, i32 -1166241723, i32 -248741991, i32 614570311, i32 -1282315017, i32 134345442, i32 -2054226922, i32 1667834072, i32 1901547113, i32 -1537671517, i32 -191677058, i32 227898511, i32 1921955416, i32 1904987480, i32 -2112533778, i32 2069144605, i32 -1034266187, i32 -1674521287, i32 720527379, i32 -976113629, i32 677414384, i32 -901678824, i32 -1193592593, i32 -1904616272, i32 1614419982, i32 1822297739, i32 -1340175810, i32 -686458943, i32 -1120842969, i32 2024746970, i32 1432378464, i32 -430627341, i32 -1437226092, i32 1464375394, i32 1676153920, i32 1439316330, i32 715854006, i32 -1261675468, i32 289532110, i32 -1588296017, i32 2087905683, i32 -1276242927, i32 1668267050, i32 732546397, i32 1947742710, i32 -832815594, i32 -1685613794, i32 -1344882125, i32 1814351708, i32 2050118529, i32 680887927, i32 999245976, i32 1800124847, i32 -994056165, i32 1713906067, i32 1641548236, i32 -81679983, i32 1216130144, i32 1575780402, i32 -276538019, i32 -377129551, i32 -601480446, i32 -345695352, i32 596196993, i32 -745100091, i32 258830323, i32 -2081144263, i32 772490370, i32 -1534844924, i32 1774776394, i32 -1642095778, i32 566650946, i32 -152474470, i32 1728879713, i32 -1412200208, i32 1783734482, i32 -665571480, i32 -1777359064, i32 -1420741725, i32 1861159788, i32 326777828, i32 -1170476976, i32 2130389656, i32 -1578015459, i32 967770486, i32 1724537150, i32 -2109534584, i32 -1930525159, i32 1164943284, i32 2105845187, i32 998989502, i32 -529566248, i32 -2050940813, i32 1075463327, i32 1455516326, i32 1322494562, i32 910128902, i32 469688178, i32 1117454909, i32 936433444, i32 -804646328, i32 -619713837, i32 1240580251, i32 122909385, i32 -2137449605, i32 634681816, i32 -152510729, i32 -469872614, i32 -1233564613, i32 -1754472259, i32 79693498, i32 -1045868618, i32 1084186820, i32 1583128258, i32 426386531, i32 1761308591, i32 1047286709, i32 322548459, i32 995290223, i32 1845252383, i32 -1691314900, i32 -863943356, i32 -1352745719, i32 -1092366332, i32 -567063811, i32 1712269319, i32 422464435, i32 -1060394921, i32 1170764815, i32 -771006663, i32 -1177289765, i32 1434042557, i32 442511882, i32 -694091578, i32 1076654713, i32 1738483198, i32 -81812532, i32 -1901729288, i32 -617471240, i32 1014306527, i32 -43947243, i32 793779912, i32 -1392160085, i32 842905082, i32 -48003232, i32 1395751752, i32 1040244610, i32 -1638115397, i32 -898659168, i32 445077038, i32 -552113701, i32 -717051658, i32 679411651, i32 -1402522938, i32 -1940957837, i32 1767581616, i32 -1144366904, i32 -503340195, i32 -1192226400, i32 284835224, i32 -48135240, i32 1258075500, i32 768725851, i32 -1705778055, i32 -1225243291, i32 -762426948, i32 1274779536, i32 -505548070, i32 -1530167757, i32 1660621633, i32 -823867672, i32 -283063590, i32 913787905, i32 -797008130, i32 737222580, i32 -1780753843, i32 -1366257256, i32 -357724559, i32 1804850592, i32 -795946544, i32 -1345903136, i32 -1908647121, i32 -1904896841, i32 -1879645445, i32 -233690268, i32 -2004305902, i32 -1878134756, i32 1336762016, i32 1754252060, i32 -774901359, i32 -1280786003, i32 791618072, i32 -1106372745, i32 -361419266, i32 -1962795103, i32 -442446833, i32 -1250986776, i32 413987798, i32 -829824359, i32 -1264037920, i32 -49028937, i32 2093235073, i32 -760370983, i32 375366246, i32 -2137688315, i32 -1815317740, i32 555357303, i32 -424861595, i32 2008414854, i32 -950779147, i32 -73583153, i32 -338841844, i32 2067696032, i32 -700376109, i32 -1373733303, i32 2428461, i32 544322398, i32 577241275, i32 1471733935, i32 610547355, i32 -267798242, i32 1432588573, i32 1507829418, i32 2025931657, i32 -648391809, i32 545086370, i32 48609733, i32 -2094660746, i32 1653985193, i32 298326376, i32 1316178497, i32 -1287180854, i32 2064951626, i32 458293330, i32 -1705826027, i32 -703637697, i32 -1130641692, i32 727753846, i32 -2115603456, i32 146436021, i32 1461446943, i32 -224990101, i32 705550613, i32 -1235000031, i32 -407242314, i32 -13368018, i32 -981117340, i32 1404054877, i32 -1449160799, i32 146425753, i32 1854211946], [256 x i32] [i32 1266315497, i32 -1246549692, i32 -613086930, i32 -1004984797, i32 -1385257296, i32 1235738493, i32 -1662099272, i32 -1880247706, i32 -324367247, i32 1771706367, i32 1449415276, i32 -1028546847, i32 422970021, i32 1963543593, i32 -1604775104, i32 -468174274, i32 1062508698, i32 1531092325, i32 1804592342, i32 -1711849514, i32 -1580033017, i32 -269995787, i32 1294809318, i32 -265986623, i32 1289560198, i32 -2072974554, i32 1669523910, i32 35572830, i32 157838143, i32 1052438473, i32 1016535060, i32 1802137761, i32 1753167236, i32 1386275462, i32 -1214491899, i32 -1437595849, i32 1040679964, i32 2145300060, i32 -1904392980, i32 1461121720, i32 -1338320329, i32 -263189491, i32 -266592508, i32 33600511, i32 -1374882534, i32 1018524850, i32 629373528, i32 -603381315, i32 -779021319, i32 2091462646, i32 -1808644237, i32 586499841, i32 988145025, i32 935516892, i32 -927631820, i32 -1695294041, i32 -1455136442, i32 265290510, i32 -322386114, i32 -1535828415, i32 -499593831, i32 1005194799, i32 847297441, i32 406762289, i32 1314163512, i32 1332590856, i32 1866599683, i32 -167115585, i32 750260880, i32 613907577, i32 1450815602, i32 -1129346641, i32 -560302305, i32 -644675568, i32 -1282691566, i32 -590397650, i32 1427272223, i32 778793252, i32 1343938022, i32 -1618686585, i32 2052605720, i32 1946737175, i32 -1130390852, i32 -380928628, i32 -327488454, i32 -612033030, i32 1661551462, i32 -1000029230, i32 -283371449, i32 840292616, i32 -582796489, i32 616741398, i32 312560963, i32 711312465, i32 1351876610, i32 322626781, i32 1910503582, i32 271666773, i32 -2119403562, i32 1594956187, i32 70604529, i32 -677132437, i32 1007753275, i32 1495573769, i32 -225450259, i32 -1745748998, i32 -1631928532, i32 504708206, i32 -2031925904, i32 -353800271, i32 -2045878774, i32 1514023603, i32 1998579484, i32 1312622330, i32 694541497, i32 -1712906993, i32 -2143385130, i32 1382467621, i32 776784248, i32 -1676627094, i32 -971698502, i32 -1797068168, i32 -1510196141, i32 503983604, i32 -218673497, i32 907881277, i32 423175695, i32 432175456, i32 1378068232, i32 -149744970, i32 -340918674, i32 -356311194, i32 -474200683, i32 -1501837181, i32 -1317062703, i32 26017576, i32 -1020076561, i32 -1100195163, i32 1700274565, i32 1756076034, i32 -288447217, i32 -617638597, i32 720338349, i32 1533947780, i32 354530856, i32 688349552, i32 -321042571, i32 1637815568, i32 332179504, i32 -345916010, i32 53804574, i32 -1442618417, i32 -1250730864, i32 1282449977, i32 -711025141, i32 -877994476, i32 -288586052, i32 1617046695, i32 -1666491221, i32 -1292663698, i32 1686838959, i32 431878346, i32 -1608291911, i32 1700445008, i32 1080580658, i32 1009431731, i32 832498133, i32 -1071531785, i32 -1688990951, i32 -2023776103, i32 -1778935426, i32 1648197032, i32 -130578278, i32 -1746719369, i32 300782431, i32 375919233, i32 238389289, i32 -941219882, i32 -1763778655, i32 2019080857, i32 1475708069, i32 455242339, i32 -1685863425, i32 448939670, i32 -843904277, i32 1395535956, i32 -1881585436, i32 1841049896, i32 1491858159, i32 885456874, i32 -30872223, i32 -293847949, i32 1565136089, i32 -396052509, i32 1108368660, i32 540939232, i32 1173283510, i32 -1549095958, i32 -613658859, i32 -87339056, i32 -951913406, i32 -278217803, i32 1699691293, i32 1103962373, i32 -669091426, i32 -2038084153, i32 -464828566, i32 1031889488, i32 -815619598, i32 1535977030, i32 -58162272, i32 -1043876189, i32 2132092099, i32 1774941330, i32 1199868427, i32 1452454533, i32 157007616, i32 -1390851939, i32 342012276, i32 595725824, i32 1480756522, i32 206960106, i32 497939518, i32 591360097, i32 863170706, i32 -1919713727, i32 -698356495, i32 1814182875, i32 2094937945, i32 -873565088, i32 1082520231, i32 -831049106, i32 -1509457788, i32 435703966, i32 -386934699, i32 1641649973, i32 -1452693590, i32 -989067582, i32 1510255612, i32 -2146710820, i32 -1639679442, i32 -1018874748, i32 -36346107, i32 236887753, i32 -613164077, i32 274041037, i32 1734335097, i32 -479771840, i32 -976997275, i32 1899903192, i32 1026095262, i32 -244449504, i32 356393447, i32 -1884275382, i32 -421290197, i32 -612127241], [256 x i32] [i32 -381855128, i32 -1803468553, i32 -162781668, i32 -1805047500, i32 1091903735, i32 1979897079, i32 -1124832466, i32 -727580568, i32 -737663887, i32 857797738, i32 1136121015, i32 1342202287, i32 507115054, i32 -1759230650, i32 337727348, i32 -1081374656, i32 1301675037, i32 -1766485585, i32 1895095763, i32 1721773893, i32 -1078195732, i32 62756741, i32 2142006736, i32 835421444, i32 -1762973773, i32 1442658625, i32 -635090970, i32 -1412822374, i32 676362277, i32 1392781812, i32 170690266, i32 -373920261, i32 1759253602, i32 -683120384, i32 1745797284, i32 664899054, i32 1329594018, i32 -393761396, i32 -1249058810, i32 2062866102, i32 -1429332356, i32 -751345684, i32 -830954599, i32 1080764994, i32 553557557, i32 -638351943, i32 -298199125, i32 991055499, i32 499776247, i32 1265440854, i32 648242737, i32 -354183246, i32 980351604, i32 -581221582, i32 1749149687, i32 -898096901, i32 -83167922, i32 -654396521, i32 1161844396, i32 -1169648345, i32 1431517754, i32 545492359, i32 -26498633, i32 -795437749, i32 1437099964, i32 -1592419752, i32 -861329053, i32 -1713251533, i32 -1507177898, i32 1060185593, i32 1593081372, i32 -1876348548, i32 -34019326, i32 69676912, i32 -2135222948, i32 86519011, i32 -1782508216, i32 -456757982, i32 1220612927, i32 -955283748, i32 133810670, i32 1090789135, i32 1078426020, i32 1569222167, i32 845107691, i32 -711212847, i32 -222510705, i32 1091646820, i32 628848692, i32 1613405280, i32 -537335645, i32 526609435, i32 236106946, i32 48312990, i32 -1352249391, i32 -892239595, i32 1797494240, i32 859738849, i32 992217954, i32 -289490654, i32 -2051890674, i32 -424014439, i32 -562951028, i32 765654824, i32 -804095931, i32 -1783130883, i32 1685915746, i32 -405998096, i32 1414112111, i32 -2021832454, i32 -1013056217, i32 -214004450, i32 172450625, i32 -1724973196, i32 980381355, i32 -185008841, i32 -1475158944, i32 -1578377736, i32 -1726226100, i32 -613520627, i32 -964995824, i32 1835478071, i32 660984891, i32 -590288892, i32 -248967737, i32 -872349789, i32 -1254551662, i32 1762651403, i32 1719377915, i32 -824476260, i32 -1601057013, i32 -652910941, i32 -1156370552, i32 1364962596, i32 2073328063, i32 1983633131, i32 926494387, i32 -871278215, i32 -2144935273, i32 -198299347, i32 1749200295, i32 -966120645, i32 309677260, i32 2016342300, i32 1779581495, i32 -1215147545, i32 111262694, i32 1274766160, i32 443224088, i32 298511866, i32 1025883608, i32 -488520759, i32 1145181785, i32 168956806, i32 -653464466, i32 -710153686, i32 1689216846, i32 -628709281, i32 -1094719096, i32 1692713982, i32 -1648590761, i32 -252198778, i32 1618508792, i32 1610833997, i32 -771914938, i32 -164094032, i32 2001055236, i32 -684262196, i32 -2092799181, i32 -266425487, i32 -1333771897, i32 1006657119, i32 2006996926, i32 -1108824540, i32 1430667929, i32 -1084739999, i32 1314452623, i32 -220332638, i32 -193663176, i32 -2021016126, i32 1399257539, i32 -927756684, i32 -1267338667, i32 1190975929, i32 2062231137, i32 -1960976508, i32 -2073424263, i32 -1856006686, i32 1181637006, i32 548689776, i32 -1932175983, i32 -922558900, i32 -1190417183, i32 -1149106736, i32 296247880, i32 1970579870, i32 -1216407114, i32 -525738999, i32 1714227617, i32 -1003338189, i32 -396747006, i32 166772364, i32 1251581989, i32 493813264, i32 448347421, i32 195405023, i32 -1584991729, i32 677966185, i32 -591930749, i32 1463355134, i32 -1578971493, i32 1338867538, i32 1343315457, i32 -1492745222, i32 -1610435132, i32 233230375, i32 -1694987225, i32 2000651841, i32 -1017099258, i32 1638401717, i32 -266896856, i32 -1057650976, i32 6314154, i32 819756386, i32 300326615, i32 590932579, i32 1405279636, i32 -1027467724, i32 -1144263082, i32 -1866680610, i32 -335774303, i32 -833020554, i32 1862657033, i32 1266418056, i32 963775037, i32 2089974820, i32 -2031914401, i32 1917689273, i32 448879540, i32 -744572676, i32 -313240200, i32 150775221, i32 -667058989, i32 1303187396, i32 508620638, i32 -1318983944, i32 -1568336679, i32 1817252668, i32 1876281319, i32 1457606340, i32 908771278, i32 -574175177, i32 -677760460, i32 -1838972398, i32 1729034894, i32 1080033504], [256 x i32] [i32 976866871, i32 -738527793, i32 -1413318857, i32 1522871579, i32 1555064734, i32 1336096578, i32 -746444992, i32 -1715692610, i32 -720269667, i32 -1089506539, i32 -701686658, i32 -956251013, i32 -1215554709, i32 564236357, i32 -1301368386, i32 1781952180, i32 1464380207, i32 -1131123079, i32 -962365742, i32 1699332808, i32 1393555694, i32 1183702653, i32 -713881059, i32 1288719814, i32 691649499, i32 -1447410096, i32 -1399511320, i32 -1101077756, i32 -1577396752, i32 1781354906, i32 1676643554, i32 -1702433246, i32 -1064713544, i32 1126444790, i32 -1524759638, i32 -1661808476, i32 -2084544070, i32 -1679201715, i32 -1880812208, i32 -1167828010, i32 673620729, i32 -1489356063, i32 1269405062, i32 -279616791, i32 -953159725, i32 -145557542, i32 1057255273, i32 2012875353, i32 -2132498155, i32 -2018474495, i32 -1693849939, i32 993977747, i32 -376373926, i32 -1640704105, i32 753973209, i32 36408145, i32 -1764381638, i32 25011837, i32 -774947114, i32 2088578344, i32 530523599, i32 -1376601957, i32 1524020338, i32 1518925132, i32 -534139791, i32 -535190042, i32 1202760957, i32 -309069157, i32 -388774771, i32 674977740, i32 -120232407, i32 2031300136, i32 2019492241, i32 -311074731, i32 -141160892, i32 -472686964, i32 352677332, i32 -1997247046, i32 60907813, i32 90501309, i32 -1007968747, i32 1016092578, i32 -1759044884, i32 -1455814870, i32 457141659, i32 509813237, i32 -174299397, i32 652014361, i32 1966332200, i32 -1319764491, i32 55981186, i32 -1967506245, i32 676427537, i32 -1039476232, i32 -1412673177, i32 -861040033, i32 1307055953, i32 942726286, i32 933058658, i32 -1826555503, i32 -361066302, i32 -79791154, i32 1361170020, i32 2001714738, i32 -1464409218, i32 -1020707514, i32 1222529897, i32 1679025792, i32 -1565652976, i32 -580013532, i32 1770335741, i32 151462246, i32 -1281735158, i32 1682292957, i32 1483529935, i32 471910574, i32 1539241949, i32 458788160, i32 -858652289, i32 1807016891, i32 -576558466, i32 978976581, i32 1043663428, i32 -1129001515, i32 1927990952, i32 -94075717, i32 -1922690386, i32 -1086558393, i32 -761535389, i32 1412390302, i32 -1362987237, i32 -162634896, i32 1947078029, i32 -413461673, i32 -126740879, i32 -1353482915, i32 1077988104, i32 1320477388, i32 886195818, i32 18198404, i32 -508558296, i32 -1785185763, i32 112762804, i32 -831610808, i32 1866414978, i32 891333506, i32 18488651, i32 661792760, i32 1628790961, i32 -409780260, i32 -1153795797, i32 876946877, i32 -1601685023, i32 1372485963, i32 791857591, i32 -1608533303, i32 -534984578, i32 -1127755274, i32 -822013501, i32 -1578587449, i32 445679433, i32 -732971622, i32 -790962485, i32 -720709064, i32 54117162, i32 -963561881, i32 -1913048708, i32 -525259953, i32 -140617289, i32 1140177722, i32 -220915201, i32 668550556, i32 -1080614356, i32 367459370, i32 261225585, i32 -1684794075, i32 -85617823, i32 -826893077, i32 -1029151655, i32 314222801, i32 -1228863650, i32 -486184436, i32 282218597, i32 -888953790, i32 -521376242, i32 379116347, i32 1285071038, i32 846784868, i32 -1625320142, i32 -523005217, i32 -744475605, i32 -1989021154, i32 453669953, i32 1268987020, i32 -977374944, i32 -1015663912, i32 -550133875, i32 -1684459730, i32 -435458233, i32 266596637, i32 -447948204, i32 517658769, i32 -832407089, i32 -851542417, i32 370717030, i32 -47440635, i32 -2070949179, i32 -151313767, i32 -182193321, i32 -1506642397, i32 -1817692879, i32 1456262402, i32 -1393524382, i32 1517677493, i32 1846949527, i32 -1999473716, i32 -560569710, i32 -2118563376, i32 1280348187, i32 1908823572, i32 -423180355, i32 846861322, i32 1172426758, i32 -1007518822, i32 -911584259, i32 1655181056, i32 -1155153950, i32 901632758, i32 1897031941, i32 -1308360158, i32 -1228157060, i32 -847864789, i32 1393639104, i32 373351379, i32 950779232, i32 625454576, i32 -1170726756, i32 -146354570, i32 2007998917, i32 544563296, i32 -2050228658, i32 -1964470824, i32 2058025392, i32 1291430526, i32 424198748, i32 50039436, i32 29584100, i32 -689184263, i32 -1865090967, i32 -1503863136, i32 1057563949, i32 -1039604065, i32 -1219600078, i32 -831004069, i32 1469046755, i32 985887462]] } }, align 4
@BF_magic_w = internal unnamed_addr constant [6 x i32] [i32 1332899944, i32 1700884034, i32 1701343084, i32 1684370003, i32 1668446532, i32 1869963892], align 16
@BF_itoa64 = internal unnamed_addr constant [65 x i8] c"./ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789\00", align 16
@BF_atoi64 = internal unnamed_addr constant [96 x i8] c"@@@@@@@@@@@@@@\00\016789:;<=>?@@@@@@@\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\10\11\12\13\14\15\16\17\18\19\1A\1B@@@@@@\1C\1D\1E\1F !\22#$%&'()*+,-./012345@@@@@", align 16

; Function Attrs: nounwind optsize strictfp
define i8* @__crypt_blowfish(i8* nocapture noundef readonly %0, i8* noundef %1, i8* noundef %2) local_unnamed_addr #0 {
  %4 = alloca %struct.anon, align 1
  %5 = alloca [18 x i32], align 16
  %6 = alloca [18 x i32], align 16
  %7 = alloca [18 x i32], align 16
  %8 = alloca [18 x i32], align 16
  %9 = getelementptr inbounds %struct.anon, %struct.anon* %4, i64 0, i32 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 93, i8* nonnull %9) #6
  %10 = tail call fastcc i8* @BF_crypt(i8* noundef %0, i8* noundef %1, i8* noundef %2, i32 noundef 16) #7
  %11 = call i8* @memcpy(i8* noundef nonnull %9, i8* noundef getelementptr inbounds ([30 x i8], [30 x i8]* @.str.1, i64 0, i64 0), i64 noundef 30) #8
  %12 = icmp ne i8* %10, null
  br i1 %12, label %13, label %24

13:                                               ; preds = %3
  %14 = getelementptr inbounds i8, i8* %1, i64 2
  %15 = load i8, i8* %14, align 1, !tbaa !3
  %16 = sext i8 %15 to i64
  %17 = add nsw i64 %16, -97
  %18 = getelementptr inbounds [26 x i8], [26 x i8]* @flags_by_subtype, i64 0, i64 %17
  %19 = load i8, i8* %18, align 1, !tbaa !3
  %20 = and i8 %19, 1
  %21 = zext i8 %20 to i64
  %22 = getelementptr inbounds [2 x [34 x i8]], [2 x [34 x i8]]* @__crypt_blowfish.test_hashes, i64 0, i64 %21, i64 0
  %23 = getelementptr inbounds %struct.anon, %struct.anon* %4, i64 0, i32 0, i64 2
  store i8 %15, i8* %23, align 1, !tbaa !3
  br label %24

24:                                               ; preds = %13, %3
  %25 = phi i8* [ %22, %13 ], [ getelementptr inbounds ([2 x [34 x i8]], [2 x [34 x i8]]* @__crypt_blowfish.test_hashes, i64 0, i64 0, i64 0), %3 ]
  %26 = getelementptr inbounds %struct.anon, %struct.anon* %4, i64 0, i32 1, i64 0
  %27 = call i8* @memset(i8* noundef nonnull %26, i32 noundef 85, i64 noundef 63) #8
  %28 = getelementptr inbounds %struct.anon, %struct.anon* %4, i64 0, i32 1, i64 62
  store i8 0, i8* %28, align 1, !tbaa !3
  %29 = call fastcc i8* @BF_crypt(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i8* noundef nonnull %9, i8* noundef nonnull %26, i32 noundef 1) #7
  %30 = icmp eq i8* %29, %26
  br i1 %30, label %31, label %38

31:                                               ; preds = %24
  %32 = call i32 @memcmp(i8* noundef nonnull %26, i8* noundef nonnull %9, i64 noundef 29) #8
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %38

34:                                               ; preds = %31
  %35 = getelementptr inbounds %struct.anon, %struct.anon* %4, i64 0, i32 1, i64 29
  %36 = call i32 @memcmp(i8* noundef nonnull %35, i8* noundef %25, i64 noundef 34) #8
  %37 = icmp eq i32 %36, 0
  br label %38

38:                                               ; preds = %34, %31, %24
  %39 = phi i1 [ false, %31 ], [ false, %24 ], [ %37, %34 ]
  %40 = bitcast [18 x i32]* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 72, i8* nonnull %40) #6
  %41 = bitcast [18 x i32]* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 72, i8* nonnull %41) #6
  %42 = bitcast [18 x i32]* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 72, i8* nonnull %42) #6
  %43 = bitcast [18 x i32]* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 72, i8* nonnull %43) #6
  %44 = getelementptr inbounds [18 x i32], [18 x i32]* %5, i64 0, i64 0
  %45 = getelementptr inbounds [18 x i32], [18 x i32]* %6, i64 0, i64 0
  call fastcc void @BF_set_key(i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0), i32* noundef nonnull %44, i32* noundef nonnull %45, i8 noundef zeroext 2) #7
  %46 = getelementptr inbounds [18 x i32], [18 x i32]* %7, i64 0, i64 0
  %47 = getelementptr inbounds [18 x i32], [18 x i32]* %8, i64 0, i64 0
  call fastcc void @BF_set_key(i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0), i32* noundef nonnull %46, i32* noundef nonnull %47, i8 noundef zeroext 4) #7
  %48 = load i32, i32* %45, align 16, !tbaa !6
  %49 = xor i32 %48, 65536
  store i32 %49, i32* %45, align 16, !tbaa !6
  %50 = icmp eq i32 %49, -610510404
  %51 = select i1 %39, i1 %50, i1 false
  %52 = getelementptr inbounds [18 x i32], [18 x i32]* %7, i64 0, i64 17
  %53 = load i32, i32* %52, align 4
  %54 = icmp eq i32 %53, 859059456
  %55 = select i1 %51, i1 %54, i1 false
  br i1 %55, label %56, label %59

56:                                               ; preds = %38
  %57 = call i32 @memcmp(i8* noundef nonnull %40, i8* noundef nonnull %42, i64 noundef 72) #8
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %60, label %59

59:                                               ; preds = %56, %38
  call void @llvm.lifetime.end.p0i8(i64 72, i8* nonnull %43) #6
  call void @llvm.lifetime.end.p0i8(i64 72, i8* nonnull %42) #6
  call void @llvm.lifetime.end.p0i8(i64 72, i8* nonnull %41) #6
  call void @llvm.lifetime.end.p0i8(i64 72, i8* nonnull %40) #6
  br label %65

60:                                               ; preds = %56
  %61 = call i32 @memcmp(i8* noundef nonnull %41, i8* noundef nonnull %43, i64 noundef 72) #8
  %62 = icmp eq i32 %61, 0
  %63 = select i1 %62, i1 %12, i1 false
  call void @llvm.lifetime.end.p0i8(i64 72, i8* nonnull %43) #6
  call void @llvm.lifetime.end.p0i8(i64 72, i8* nonnull %42) #6
  call void @llvm.lifetime.end.p0i8(i64 72, i8* nonnull %41) #6
  call void @llvm.lifetime.end.p0i8(i64 72, i8* nonnull %40) #6
  %64 = select i1 %63, i8* %10, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)
  br label %65

65:                                               ; preds = %60, %59
  %66 = phi i8* [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0), %59 ], [ %64, %60 ]
  call void @llvm.lifetime.end.p0i8(i64 93, i8* nonnull %9) #6
  ret i8* %66
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define internal fastcc i8* @BF_crypt(i8* nocapture noundef readonly %0, i8* noundef %1, i8* noundef %2, i32 noundef %3) unnamed_addr #0 {
  %5 = alloca %struct.anon.0, align 4
  %6 = alloca [2 x i32], align 4
  %7 = bitcast %struct.anon.0* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4264, i8* nonnull %7) #6
  %8 = load i8, i8* %1, align 1, !tbaa !3
  %9 = icmp eq i8 %8, 36
  br i1 %9, label %10, label %192

10:                                               ; preds = %4
  %11 = getelementptr inbounds i8, i8* %1, i64 1
  %12 = load i8, i8* %11, align 1, !tbaa !3
  %13 = icmp eq i8 %12, 50
  br i1 %13, label %14, label %192

14:                                               ; preds = %10
  %15 = getelementptr inbounds i8, i8* %1, i64 2
  %16 = load i8, i8* %15, align 1, !tbaa !3
  %17 = sext i8 %16 to i32
  %18 = add nsw i32 %17, -97
  %19 = icmp ugt i32 %18, 25
  br i1 %19, label %192, label %20

20:                                               ; preds = %14
  %21 = zext i32 %18 to i64
  %22 = lshr i64 41943036, %21
  %23 = and i64 %22, 1
  %24 = icmp eq i64 %23, 0
  br i1 %24, label %25, label %192

25:                                               ; preds = %20
  %26 = getelementptr inbounds i8, i8* %1, i64 3
  %27 = load i8, i8* %26, align 1, !tbaa !3
  %28 = icmp eq i8 %27, 36
  br i1 %28, label %29, label %192

29:                                               ; preds = %25
  %30 = getelementptr inbounds i8, i8* %1, i64 4
  %31 = load i8, i8* %30, align 1, !tbaa !3
  %32 = sext i8 %31 to i32
  %33 = add nsw i32 %32, -48
  %34 = icmp ugt i32 %33, 1
  br i1 %34, label %192, label %35

35:                                               ; preds = %29
  %36 = getelementptr inbounds i8, i8* %1, i64 5
  %37 = load i8, i8* %36, align 1, !tbaa !3
  %38 = sext i8 %37 to i32
  %39 = add nsw i32 %38, -48
  %40 = icmp ugt i32 %39, 9
  br i1 %40, label %192, label %41

41:                                               ; preds = %35
  %42 = getelementptr inbounds i8, i8* %1, i64 6
  %43 = load i8, i8* %42, align 1, !tbaa !3
  %44 = icmp eq i8 %43, 36
  br i1 %44, label %45, label %192

45:                                               ; preds = %41
  %46 = mul nuw nsw i32 %33, 10
  %47 = add nuw nsw i32 %39, %46
  %48 = shl nuw nsw i32 1, %47
  %49 = icmp ult i32 %48, %3
  br i1 %49, label %192, label %50

50:                                               ; preds = %45
  %51 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %5, i64 0, i32 2, i32 0, i64 0
  %52 = getelementptr inbounds i8, i8* %1, i64 7
  %53 = call fastcc i32 @BF_decode(i32* noundef nonnull %51, i8* noundef nonnull %52) #7
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %55, label %192

55:                                               ; preds = %50
  %56 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %5, i64 0, i32 2, i32 0, i64 0
  %57 = bitcast i32* %56 to <4 x i32>*
  %58 = load <4 x i32>, <4 x i32>* %57, align 4, !tbaa !6
  %59 = call <4 x i32> @llvm.bswap.v4i32(<4 x i32> %58)
  %60 = bitcast i32* %56 to <4 x i32>*
  store <4 x i32> %59, <4 x i32>* %60, align 4, !tbaa !6
  %61 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %5, i64 0, i32 1, i64 0
  %62 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %5, i64 0, i32 0
  %63 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %5, i64 0, i32 0, i32 0, i32 0, i64 0
  %64 = load i8, i8* %15, align 1, !tbaa !3
  %65 = sext i8 %64 to i64
  %66 = add nsw i64 %65, -97
  %67 = getelementptr inbounds [26 x i8], [26 x i8]* @flags_by_subtype, i64 0, i64 %66
  %68 = load i8, i8* %67, align 1, !tbaa !3
  call fastcc void @BF_set_key(i8* noundef %0, i32* noundef nonnull %61, i32* noundef nonnull %63, i8 noundef zeroext %68) #7
  %69 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %5, i64 0, i32 0, i32 0, i32 1, i64 0
  %70 = bitcast [256 x i32]* %69 to i8*
  %71 = call i8* @memcpy(i8* noundef nonnull %70, i8* noundef bitcast ([256 x i32]* getelementptr inbounds (%union.BF_ctx, %union.BF_ctx* @BF_init_state, i64 0, i32 0, i32 1, i64 0) to i8*), i64 noundef 4096) #8
  %72 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %5, i64 0, i32 2, i32 0, i64 1
  %73 = load i32, i32* %51, align 4, !tbaa !3
  %74 = load i32, i32* %72, align 4, !tbaa !3
  %75 = call fastcc i32 @BF_encrypt(%union.BF_ctx* noundef nonnull %62, i32 noundef %73, i32 noundef %74, i32* noundef nonnull %63, i32* noundef nonnull %63) #7
  %76 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %5, i64 0, i32 0, i32 0, i32 0, i64 2
  %77 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %5, i64 0, i32 2, i32 0, i64 2
  %78 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %5, i64 0, i32 2, i32 0, i64 3
  br label %83

79:                                               ; preds = %83
  %80 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %5, i64 0, i32 0, i32 0, i32 0, i64 16
  %81 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %5, i64 0, i32 0, i32 0, i32 0, i64 17
  %82 = bitcast i32* %51 to <4 x i32>*
  br label %104

83:                                               ; preds = %55, %83
  %84 = phi i32* [ %76, %55 ], [ %102, %83 ]
  %85 = phi i32 [ %75, %55 ], [ %101, %83 ]
  %86 = phi i32* [ %63, %55 ], [ %96, %83 ]
  %87 = getelementptr inbounds i32, i32* %86, i64 1
  %88 = load i32, i32* %87, align 4, !tbaa !6
  %89 = load i32, i32* %77, align 4, !tbaa !3
  %90 = xor i32 %89, %85
  %91 = load i32, i32* %78, align 4, !tbaa !3
  %92 = xor i32 %91, %88
  %93 = call fastcc i32 @BF_encrypt(%union.BF_ctx* noundef nonnull %62, i32 noundef %90, i32 noundef %92, i32* noundef nonnull %84, i32* noundef nonnull %84) #7
  %94 = getelementptr inbounds i32, i32* %86, i64 3
  %95 = load i32, i32* %94, align 4, !tbaa !6
  %96 = getelementptr inbounds i32, i32* %86, i64 4
  %97 = load i32, i32* %51, align 4, !tbaa !3
  %98 = xor i32 %97, %93
  %99 = load i32, i32* %72, align 4, !tbaa !3
  %100 = xor i32 %99, %95
  %101 = call fastcc i32 @BF_encrypt(%union.BF_ctx* noundef nonnull %62, i32 noundef %98, i32 noundef %100, i32* noundef nonnull %96, i32* noundef nonnull %96) #7
  %102 = getelementptr inbounds i32, i32* %86, i64 6
  %103 = icmp ult i32* %102, %61
  br i1 %103, label %83, label %79

104:                                              ; preds = %79, %133
  %105 = phi i32 [ %141, %133 ], [ %48, %79 ]
  br label %106

106:                                              ; preds = %104, %106
  %107 = phi i64 [ 0, %104 ], [ %119, %106 ]
  %108 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %5, i64 0, i32 1, i64 %107
  %109 = load i32, i32* %108, align 4, !tbaa !6
  %110 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %5, i64 0, i32 0, i32 0, i32 0, i64 %107
  %111 = load i32, i32* %110, align 4, !tbaa !3
  %112 = xor i32 %111, %109
  store i32 %112, i32* %110, align 4, !tbaa !3
  %113 = or i64 %107, 1
  %114 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %5, i64 0, i32 1, i64 %113
  %115 = load i32, i32* %114, align 4, !tbaa !6
  %116 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %5, i64 0, i32 0, i32 0, i32 0, i64 %113
  %117 = load i32, i32* %116, align 4, !tbaa !3
  %118 = xor i32 %117, %115
  store i32 %118, i32* %116, align 4, !tbaa !3
  %119 = add nuw nsw i64 %107, 2
  %120 = icmp ult i64 %107, 16
  br i1 %120, label %106, label %121

121:                                              ; preds = %106
  %122 = call fastcc i32 @BF_encrypt(%union.BF_ctx* noundef nonnull %62, i32 noundef 0, i32 noundef 0, i32* noundef nonnull %63, i32* noundef nonnull %61) #7
  %123 = load <4 x i32>, <4 x i32>* %82, align 4, !tbaa !3
  br label %124

124:                                              ; preds = %121, %124
  %125 = phi i64 [ 0, %121 ], [ %131, %124 ]
  %126 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %5, i64 0, i32 0, i32 0, i32 0, i64 %125
  %127 = bitcast i32* %126 to <4 x i32>*
  %128 = load <4 x i32>, <4 x i32>* %127, align 4, !tbaa !3
  %129 = xor <4 x i32> %128, %123
  %130 = bitcast i32* %126 to <4 x i32>*
  store <4 x i32> %129, <4 x i32>* %130, align 4, !tbaa !3
  %131 = add nuw nsw i64 %125, 4
  %132 = icmp ult i64 %125, 12
  br i1 %132, label %124, label %133

133:                                              ; preds = %124
  %134 = load i32, i32* %80, align 4, !tbaa !3
  %135 = extractelement <4 x i32> %123, i64 0
  %136 = xor i32 %134, %135
  store i32 %136, i32* %80, align 4, !tbaa !3
  %137 = load i32, i32* %81, align 4, !tbaa !3
  %138 = extractelement <4 x i32> %123, i64 1
  %139 = xor i32 %137, %138
  store i32 %139, i32* %81, align 4, !tbaa !3
  %140 = call fastcc i32 @BF_encrypt(%union.BF_ctx* noundef nonnull %62, i32 noundef 0, i32 noundef 0, i32* noundef nonnull %63, i32* noundef nonnull %61) #7
  %141 = add i32 %105, -1
  %142 = icmp eq i32 %141, 0
  br i1 %142, label %143, label %104

143:                                              ; preds = %133
  %144 = bitcast [2 x i32]* %6 to i8*
  %145 = getelementptr inbounds [2 x i32], [2 x i32]* %6, i64 0, i64 1
  %146 = getelementptr inbounds [2 x i32], [2 x i32]* %6, i64 0, i64 0
  br label %147

147:                                              ; preds = %143, %162
  %148 = phi i64 [ 0, %143 ], [ %166, %162 ]
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %144) #6
  %149 = getelementptr inbounds [6 x i32], [6 x i32]* @BF_magic_w, i64 0, i64 %148
  %150 = load i32, i32* %149, align 8, !tbaa !6
  %151 = or i64 %148, 1
  %152 = getelementptr inbounds [6 x i32], [6 x i32]* @BF_magic_w, i64 0, i64 %151
  %153 = load i32, i32* %152, align 4, !tbaa !6
  store i32 %153, i32* %145, align 4, !tbaa !6
  %154 = call fastcc i32 @BF_encrypt(%union.BF_ctx* noundef nonnull %62, i32 noundef %150, i32 noundef %153, i32* noundef nonnull %146, i32* noundef nonnull %146) #7
  br label %155

155:                                              ; preds = %147, %155
  %156 = phi i32 [ 63, %147 ], [ %160, %155 ]
  %157 = phi i32 [ %154, %147 ], [ %159, %155 ]
  %158 = load i32, i32* %145, align 4, !tbaa !6
  %159 = call fastcc i32 @BF_encrypt(%union.BF_ctx* noundef nonnull %62, i32 noundef %157, i32 noundef %158, i32* noundef nonnull %146, i32* noundef nonnull %146) #7
  %160 = add nsw i32 %156, -1
  %161 = icmp eq i32 %160, 0
  br i1 %161, label %162, label %155

162:                                              ; preds = %155
  %163 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %5, i64 0, i32 2, i32 0, i64 %148
  store i32 %159, i32* %163, align 4, !tbaa !3
  %164 = load i32, i32* %145, align 4, !tbaa !6
  %165 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %5, i64 0, i32 2, i32 0, i64 %151
  store i32 %164, i32* %165, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %144) #6
  %166 = add nuw nsw i64 %148, 2
  %167 = icmp ult i64 %148, 4
  br i1 %167, label %147, label %168

168:                                              ; preds = %162
  %169 = call i8* @memcpy(i8* noundef %2, i8* noundef nonnull %1, i64 noundef 28) #8
  %170 = getelementptr inbounds i8, i8* %1, i64 28
  %171 = load i8, i8* %170, align 1, !tbaa !3
  %172 = sext i8 %171 to i64
  %173 = add nsw i64 %172, -32
  %174 = getelementptr inbounds [96 x i8], [96 x i8]* @BF_atoi64, i64 0, i64 %173
  %175 = load i8, i8* %174, align 1, !tbaa !3
  %176 = and i8 %175, 48
  %177 = zext i8 %176 to i64
  %178 = getelementptr inbounds [65 x i8], [65 x i8]* @BF_itoa64, i64 0, i64 %177
  %179 = load i8, i8* %178, align 16, !tbaa !3
  %180 = getelementptr inbounds i8, i8* %2, i64 28
  store i8 %179, i8* %180, align 1, !tbaa !3
  br label %181

181:                                              ; preds = %181, %168
  %182 = phi i32 [ 6, %168 ], [ %187, %181 ]
  %183 = phi i32* [ %51, %168 ], [ %186, %181 ]
  %184 = load i32, i32* %183, align 4, !tbaa !6
  %185 = call i32 @llvm.bswap.i32(i32 %184) #9
  %186 = getelementptr inbounds i32, i32* %183, i64 1
  store i32 %185, i32* %183, align 4, !tbaa !6
  %187 = add nsw i32 %182, -1
  %188 = icmp eq i32 %187, 0
  br i1 %188, label %189, label %181

189:                                              ; preds = %181
  %190 = getelementptr inbounds i8, i8* %2, i64 29
  call fastcc void @BF_encode(i8* noundef nonnull %190, i32* noundef nonnull %51) #7
  %191 = getelementptr inbounds i8, i8* %2, i64 60
  store i8 0, i8* %191, align 1, !tbaa !3
  br label %192

192:                                              ; preds = %45, %50, %4, %10, %14, %20, %25, %29, %35, %41, %189
  %193 = phi i8* [ %2, %189 ], [ null, %41 ], [ null, %35 ], [ null, %29 ], [ null, %25 ], [ null, %20 ], [ null, %14 ], [ null, %10 ], [ null, %4 ], [ null, %50 ], [ null, %45 ]
  call void @llvm.lifetime.end.p0i8(i64 4264, i8* nonnull %7) #6
  ret i8* %193
}

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @memcmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nofree nosync nounwind optsize strictfp
define internal fastcc void @BF_set_key(i8* nocapture noundef readonly %0, i32* nocapture noundef writeonly %1, i32* nocapture noundef %2, i8 noundef zeroext %3) unnamed_addr #3 {
  %5 = alloca [2 x i32], align 4
  %6 = bitcast [2 x i32]* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %6) #6
  %7 = zext i8 %3 to i32
  %8 = and i32 %7, 1
  %9 = getelementptr inbounds [2 x i32], [2 x i32]* %5, i64 0, i64 1
  %10 = getelementptr inbounds [2 x i32], [2 x i32]* %5, i64 0, i64 0
  %11 = zext i32 %8 to i64
  %12 = getelementptr inbounds [2 x i32], [2 x i32]* %5, i64 0, i64 %11
  br label %13

13:                                               ; preds = %4, %42
  %14 = phi i64 [ 0, %4 ], [ %51, %42 ]
  %15 = phi i32 [ 0, %4 ], [ %44, %42 ]
  %16 = phi i32 [ 0, %4 ], [ %35, %42 ]
  %17 = phi i8* [ %0, %4 ], [ %39, %42 ]
  store i32 0, i32* %9, align 4, !tbaa !6
  br label %18

18:                                               ; preds = %13, %18
  %19 = phi i32 [ 0, %13 ], [ %31, %18 ]
  %20 = phi i32 [ 0, %13 ], [ %27, %18 ]
  %21 = phi i32 [ %16, %13 ], [ %35, %18 ]
  %22 = phi i8* [ %17, %13 ], [ %39, %18 ]
  %23 = phi i32 [ 0, %13 ], [ %40, %18 ]
  %24 = shl i32 %20, 8
  store i32 %24, i32* %10, align 4, !tbaa !6
  %25 = load i8, i8* %22, align 1, !tbaa !3
  %26 = zext i8 %25 to i32
  %27 = or i32 %24, %26
  store i32 %27, i32* %10, align 4, !tbaa !6
  %28 = shl i32 %19, 8
  store i32 %28, i32* %9, align 4, !tbaa !6
  %29 = load i8, i8* %22, align 1, !tbaa !3
  %30 = sext i8 %29 to i32
  %31 = or i32 %28, %30
  store i32 %31, i32* %9, align 4, !tbaa !6
  %32 = icmp eq i32 %23, 0
  %33 = and i32 %30, 128
  %34 = select i1 %32, i32 0, i32 %33
  %35 = or i32 %34, %21
  %36 = load i8, i8* %22, align 1, !tbaa !3
  %37 = icmp eq i8 %36, 0
  %38 = getelementptr inbounds i8, i8* %22, i64 1
  %39 = select i1 %37, i8* %0, i8* %38
  %40 = add nuw nsw i32 %23, 1
  %41 = icmp eq i32 %40, 4
  br i1 %41, label %42, label %18

42:                                               ; preds = %18
  %43 = xor i32 %31, %27
  %44 = or i32 %43, %15
  %45 = load i32, i32* %12, align 4, !tbaa !6
  %46 = getelementptr inbounds i32, i32* %1, i64 %14
  store i32 %45, i32* %46, align 4, !tbaa !6
  %47 = getelementptr inbounds %union.BF_ctx, %union.BF_ctx* @BF_init_state, i64 0, i32 0, i32 0, i64 %14
  %48 = load i32, i32* %47, align 4, !tbaa !3
  %49 = xor i32 %48, %45
  %50 = getelementptr inbounds i32, i32* %2, i64 %14
  store i32 %49, i32* %50, align 4, !tbaa !6
  %51 = add nuw nsw i64 %14, 1
  %52 = icmp eq i64 %51, 18
  br i1 %52, label %53, label %13

53:                                               ; preds = %42
  %54 = shl nuw nsw i32 %7, 15
  %55 = and i32 %54, 65536
  %56 = lshr i32 %44, 16
  %57 = and i32 %44, 65535
  %58 = or i32 %57, %56
  %59 = shl i32 %35, 9
  %60 = sub nuw nsw i32 65536, %58
  %61 = and i32 %55, %59
  %62 = and i32 %61, %60
  %63 = load i32, i32* %2, align 4, !tbaa !6
  %64 = xor i32 %63, %62
  store i32 %64, i32* %2, align 4, !tbaa !6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %6) #6
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind optsize strictfp
define internal fastcc i32 @BF_decode(i32* noundef writeonly %0, i8* nocapture noundef readonly %1) unnamed_addr #4 {
  %3 = bitcast i32* %0 to i8*
  %4 = getelementptr inbounds i32, i32* %0, i64 4
  %5 = bitcast i32* %4 to i8*
  br label %6

6:                                                ; preds = %64, %2
  %7 = phi i8* [ %1, %2 ], [ %54, %64 ]
  %8 = phi i8* [ %3, %2 ], [ %67, %64 ]
  %9 = getelementptr inbounds i8, i8* %7, i64 1
  %10 = load i8, i8* %7, align 1, !tbaa !3
  %11 = zext i8 %10 to i32
  %12 = add nsw i32 %11, -32
  %13 = icmp ugt i32 %12, 95
  br i1 %13, label %69, label %14

14:                                               ; preds = %6
  %15 = zext i32 %12 to i64
  %16 = getelementptr inbounds [96 x i8], [96 x i8]* @BF_atoi64, i64 0, i64 %15
  %17 = load i8, i8* %16, align 1, !tbaa !3
  %18 = icmp ugt i8 %17, 63
  br i1 %18, label %69, label %19

19:                                               ; preds = %14
  %20 = getelementptr inbounds i8, i8* %7, i64 2
  %21 = load i8, i8* %9, align 1, !tbaa !3
  %22 = zext i8 %21 to i32
  %23 = add nsw i32 %22, -32
  %24 = icmp ugt i32 %23, 95
  br i1 %24, label %69, label %25

25:                                               ; preds = %19
  %26 = zext i32 %23 to i64
  %27 = getelementptr inbounds [96 x i8], [96 x i8]* @BF_atoi64, i64 0, i64 %26
  %28 = load i8, i8* %27, align 1, !tbaa !3
  %29 = icmp ugt i8 %28, 63
  br i1 %29, label %69, label %30

30:                                               ; preds = %25
  %31 = shl nuw i8 %17, 2
  %32 = lshr i8 %28, 4
  %33 = or i8 %32, %31
  %34 = getelementptr inbounds i8, i8* %8, i64 1
  store i8 %33, i8* %8, align 1, !tbaa !3
  %35 = icmp ult i8* %34, %5
  br i1 %35, label %36, label %69

36:                                               ; preds = %30
  %37 = getelementptr inbounds i8, i8* %7, i64 3
  %38 = load i8, i8* %20, align 1, !tbaa !3
  %39 = zext i8 %38 to i32
  %40 = add nsw i32 %39, -32
  %41 = icmp ugt i32 %40, 95
  br i1 %41, label %69, label %42

42:                                               ; preds = %36
  %43 = zext i32 %40 to i64
  %44 = getelementptr inbounds [96 x i8], [96 x i8]* @BF_atoi64, i64 0, i64 %43
  %45 = load i8, i8* %44, align 1, !tbaa !3
  %46 = icmp ugt i8 %45, 63
  br i1 %46, label %69, label %47

47:                                               ; preds = %42
  %48 = shl i8 %28, 4
  %49 = lshr i8 %45, 2
  %50 = or i8 %49, %48
  %51 = getelementptr inbounds i8, i8* %8, i64 2
  store i8 %50, i8* %34, align 1, !tbaa !3
  %52 = icmp ult i8* %51, %5
  br i1 %52, label %53, label %69

53:                                               ; preds = %47
  %54 = getelementptr inbounds i8, i8* %7, i64 4
  %55 = load i8, i8* %37, align 1, !tbaa !3
  %56 = zext i8 %55 to i32
  %57 = add nsw i32 %56, -32
  %58 = icmp ugt i32 %57, 95
  br i1 %58, label %69, label %59

59:                                               ; preds = %53
  %60 = zext i32 %57 to i64
  %61 = getelementptr inbounds [96 x i8], [96 x i8]* @BF_atoi64, i64 0, i64 %60
  %62 = load i8, i8* %61, align 1, !tbaa !3
  %63 = icmp ugt i8 %62, 63
  br i1 %63, label %69, label %64

64:                                               ; preds = %59
  %65 = shl i8 %45, 6
  %66 = or i8 %62, %65
  %67 = getelementptr inbounds i8, i8* %8, i64 3
  store i8 %66, i8* %51, align 1, !tbaa !3
  %68 = icmp ult i8* %67, %5
  br i1 %68, label %6, label %69

69:                                               ; preds = %64, %30, %47, %59, %53, %42, %36, %25, %19, %14, %6
  %70 = phi i32 [ -1, %6 ], [ -1, %14 ], [ -1, %19 ], [ -1, %25 ], [ -1, %36 ], [ -1, %42 ], [ -1, %53 ], [ -1, %59 ], [ 0, %47 ], [ 0, %30 ], [ 0, %64 ]
  ret i32 %70
}

; Function Attrs: nofree norecurse nosync nounwind optsize strictfp
define internal fastcc i32 @BF_encrypt(%union.BF_ctx* nocapture noundef readonly %0, i32 noundef %1, i32 noundef %2, i32* noundef writeonly %3, i32* noundef readnone %4) unnamed_addr #4 {
  %6 = getelementptr inbounds %union.BF_ctx, %union.BF_ctx* %0, i64 0, i32 0, i32 0, i64 17
  %7 = getelementptr inbounds %union.BF_ctx, %union.BF_ctx* %0, i64 0, i32 0, i32 0, i64 0
  br label %8

8:                                                ; preds = %14, %5
  %9 = phi i32 [ %2, %5 ], [ %75, %14 ]
  %10 = phi i32 [ %1, %5 ], [ %16, %14 ]
  %11 = phi i32* [ %3, %5 ], [ %18, %14 ]
  %12 = load i32, i32* %7, align 4, !tbaa !3
  %13 = xor i32 %12, %10
  br label %20

14:                                               ; preds = %20
  %15 = load i32, i32* %6, align 4, !tbaa !3
  %16 = xor i32 %15, %49
  %17 = getelementptr inbounds i32, i32* %11, i64 1
  store i32 %16, i32* %11, align 4, !tbaa !6
  %18 = getelementptr inbounds i32, i32* %11, i64 2
  store i32 %75, i32* %17, align 4, !tbaa !6
  %19 = icmp ult i32* %18, %4
  br i1 %19, label %8, label %77

20:                                               ; preds = %8, %20
  %21 = phi i64 [ 0, %8 ], [ %70, %20 ]
  %22 = phi i32 [ %13, %8 ], [ %75, %20 ]
  %23 = phi i32 [ %9, %8 ], [ %49, %20 ]
  %24 = and i32 %22, 255
  %25 = lshr i32 %22, 8
  %26 = and i32 %25, 255
  %27 = lshr i32 %22, 16
  %28 = and i32 %27, 255
  %29 = lshr i32 %22, 24
  %30 = zext i32 %24 to i64
  %31 = getelementptr inbounds %union.BF_ctx, %union.BF_ctx* %0, i64 0, i32 0, i32 1, i64 3, i64 %30
  %32 = load i32, i32* %31, align 4, !tbaa !3
  %33 = zext i32 %26 to i64
  %34 = getelementptr inbounds %union.BF_ctx, %union.BF_ctx* %0, i64 0, i32 0, i32 1, i64 2, i64 %33
  %35 = load i32, i32* %34, align 4, !tbaa !3
  %36 = zext i32 %28 to i64
  %37 = getelementptr inbounds %union.BF_ctx, %union.BF_ctx* %0, i64 0, i32 0, i32 1, i64 1, i64 %36
  %38 = load i32, i32* %37, align 4, !tbaa !3
  %39 = zext i32 %29 to i64
  %40 = getelementptr inbounds %union.BF_ctx, %union.BF_ctx* %0, i64 0, i32 0, i32 1, i64 0, i64 %39
  %41 = load i32, i32* %40, align 4, !tbaa !3
  %42 = add i32 %41, %38
  %43 = xor i32 %42, %35
  %44 = or i64 %21, 1
  %45 = getelementptr inbounds %union.BF_ctx, %union.BF_ctx* %0, i64 0, i32 0, i32 0, i64 %44
  %46 = load i32, i32* %45, align 4, !tbaa !3
  %47 = xor i32 %46, %23
  %48 = add i32 %43, %32
  %49 = xor i32 %47, %48
  %50 = and i32 %49, 255
  %51 = lshr i32 %49, 8
  %52 = and i32 %51, 255
  %53 = lshr i32 %49, 16
  %54 = and i32 %53, 255
  %55 = lshr i32 %49, 24
  %56 = zext i32 %50 to i64
  %57 = getelementptr inbounds %union.BF_ctx, %union.BF_ctx* %0, i64 0, i32 0, i32 1, i64 3, i64 %56
  %58 = load i32, i32* %57, align 4, !tbaa !3
  %59 = zext i32 %52 to i64
  %60 = getelementptr inbounds %union.BF_ctx, %union.BF_ctx* %0, i64 0, i32 0, i32 1, i64 2, i64 %59
  %61 = load i32, i32* %60, align 4, !tbaa !3
  %62 = zext i32 %54 to i64
  %63 = getelementptr inbounds %union.BF_ctx, %union.BF_ctx* %0, i64 0, i32 0, i32 1, i64 1, i64 %62
  %64 = load i32, i32* %63, align 4, !tbaa !3
  %65 = zext i32 %55 to i64
  %66 = getelementptr inbounds %union.BF_ctx, %union.BF_ctx* %0, i64 0, i32 0, i32 1, i64 0, i64 %65
  %67 = load i32, i32* %66, align 4, !tbaa !3
  %68 = add i32 %67, %64
  %69 = xor i32 %68, %61
  %70 = add nuw nsw i64 %21, 2
  %71 = getelementptr inbounds %union.BF_ctx, %union.BF_ctx* %0, i64 0, i32 0, i32 0, i64 %70
  %72 = load i32, i32* %71, align 4, !tbaa !3
  %73 = xor i32 %72, %22
  %74 = add i32 %69, %58
  %75 = xor i32 %73, %74
  %76 = icmp ult i64 %21, 14
  br i1 %76, label %20, label %14

77:                                               ; preds = %14
  ret i32 %16
}

; Function Attrs: nofree norecurse nosync nounwind optsize strictfp
define internal fastcc void @BF_encode(i8* nocapture noundef writeonly %0, i32* nocapture noundef readonly %1) unnamed_addr #4 {
  %3 = bitcast i32* %1 to i8*
  %4 = load i8, i8* %3, align 1, !tbaa !3
  %5 = zext i8 %4 to i32
  %6 = lshr i32 %5, 2
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds [65 x i8], [65 x i8]* @BF_itoa64, i64 0, i64 %7
  %9 = load i8, i8* %8, align 1, !tbaa !3
  store i8 %9, i8* %0, align 1, !tbaa !3
  %10 = shl nuw nsw i32 %5, 4
  %11 = and i32 %10, 48
  %12 = getelementptr inbounds i8, i8* %0, i64 1
  %13 = getelementptr inbounds i8, i8* %3, i64 1
  %14 = load i8, i8* %13, align 1, !tbaa !3
  %15 = zext i8 %14 to i32
  %16 = lshr i32 %15, 4
  %17 = or i32 %16, %11
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds [65 x i8], [65 x i8]* @BF_itoa64, i64 0, i64 %18
  %20 = load i8, i8* %19, align 1, !tbaa !3
  %21 = getelementptr inbounds i8, i8* %0, i64 2
  store i8 %20, i8* %12, align 1, !tbaa !3
  %22 = shl nuw nsw i32 %15, 2
  %23 = and i32 %22, 60
  br label %24

24:                                               ; preds = %2, %24
  %25 = phi i32 [ %23, %2 ], [ %66, %24 ]
  %26 = phi i8* [ %21, %2 ], [ %64, %24 ]
  %27 = phi i8* [ %0, %2 ], [ %44, %24 ]
  %28 = phi i64 [ 0, %2 ], [ %31, %24 ]
  %29 = add nuw nsw i64 %28, 2
  %30 = getelementptr inbounds i8, i8* %3, i64 %29
  %31 = add nuw nsw i64 %28, 3
  %32 = load i8, i8* %30, align 1, !tbaa !3
  %33 = zext i8 %32 to i32
  %34 = lshr i32 %33, 6
  %35 = or i32 %34, %25
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds [65 x i8], [65 x i8]* @BF_itoa64, i64 0, i64 %36
  %38 = load i8, i8* %37, align 1, !tbaa !3
  %39 = getelementptr inbounds i8, i8* %27, i64 3
  store i8 %38, i8* %26, align 1, !tbaa !3
  %40 = and i32 %33, 63
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds [65 x i8], [65 x i8]* @BF_itoa64, i64 0, i64 %41
  %43 = load i8, i8* %42, align 1, !tbaa !3
  %44 = getelementptr inbounds i8, i8* %27, i64 4
  store i8 %43, i8* %39, align 1, !tbaa !3
  %45 = getelementptr inbounds i8, i8* %3, i64 %31
  %46 = load i8, i8* %45, align 1, !tbaa !3
  %47 = zext i8 %46 to i32
  %48 = lshr i32 %47, 2
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds [65 x i8], [65 x i8]* @BF_itoa64, i64 0, i64 %49
  %51 = load i8, i8* %50, align 1, !tbaa !3
  store i8 %51, i8* %44, align 1, !tbaa !3
  %52 = shl nuw nsw i32 %47, 4
  %53 = and i32 %52, 48
  %54 = getelementptr inbounds i8, i8* %27, i64 5
  %55 = add nuw nsw i64 %28, 4
  %56 = getelementptr inbounds i8, i8* %3, i64 %55
  %57 = load i8, i8* %56, align 1, !tbaa !3
  %58 = zext i8 %57 to i32
  %59 = lshr i32 %58, 4
  %60 = or i32 %59, %53
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds [65 x i8], [65 x i8]* @BF_itoa64, i64 0, i64 %61
  %63 = load i8, i8* %62, align 1, !tbaa !3
  %64 = getelementptr inbounds i8, i8* %27, i64 6
  store i8 %63, i8* %54, align 1, !tbaa !3
  %65 = shl nuw nsw i32 %58, 2
  %66 = and i32 %65, 60
  %67 = icmp eq i64 %31, 21
  br i1 %67, label %68, label %24

68:                                               ; preds = %24
  %69 = zext i32 %66 to i64
  %70 = getelementptr inbounds [65 x i8], [65 x i8]* @BF_itoa64, i64 0, i64 %69
  %71 = load i8, i8* %70, align 4, !tbaa !3
  store i8 %71, i8* %64, align 1, !tbaa !3
  ret void
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.bswap.i32(i32) #5

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare <4 x i32> @llvm.bswap.v4i32(<4 x i32>) #5

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nosync nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree norecurse nosync nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { nounwind strictfp }
attributes #7 = { nobuiltin optsize strictfp "no-builtins" }
attributes #8 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #9 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
