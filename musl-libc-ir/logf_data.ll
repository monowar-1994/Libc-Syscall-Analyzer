; ModuleID = 'src/math/logf_data.c'
source_filename = "src/math/logf_data.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.logf_data = type { [16 x %struct.anon], double, [3 x double] }
%struct.anon = type { double, double }

@__logf_data = hidden local_unnamed_addr constant %struct.logf_data { [16 x %struct.anon] [%struct.anon { double 0x3FF661EC79F8F3BE, double 0xBFD57BF7808CAADE }, %struct.anon { double 0x3FF571ED4AAF883D, double 0xBFD2BEF0A7C06DDB }, %struct.anon { double 0x3FF49539F0F010B0, double 0xBFD01EAE7F513A67 }, %struct.anon { double 0x3FF3C995B0B80385, double 0xBFCB31D8A68224E9 }, %struct.anon { double 0x3FF30D190C8864A5, double 0xBFC6574F0AC07758 }, %struct.anon { double 0x3FF25E227B0B8EA0, double 0xBFC1AA2BC79C8100 }, %struct.anon { double 0x3FF1BB4A4A1A343F, double 0xBFBA4E76CE8C0E5E }, %struct.anon { double 0x3FF12358F08AE5BA, double 0xBFB1973C5A611CCC }, %struct.anon { double 0x3FF0953F419900A7, double 0xBFA252F438E10C1E }, %struct.anon { double 1.000000e+00, double 0.000000e+00 }, %struct.anon { double 0x3FEE608CFD9A47AC, double 0x3FAAA5AA5DF25984 }, %struct.anon { double 0x3FECA4B31F026AA0, double 0x3FBC5E53AA362EB4 }, %struct.anon { double 0x3FEB2036576AFCE6, double 0x3FC526E57720DB08 }, %struct.anon { double 0x3FE9C2D163A1AA2D, double 0x3FCBC2860D224770 }, %struct.anon { double 0x3FE886E6037841ED, double 0x3FD1058BC8A07EE1 }, %struct.anon { double 0x3FE767DCF5534862, double 0x3FD4043057B6EE09 }], double 0x3FE62E42FEFA39EF, [3 x double] [double 0xBFD00EA348B88334, double 0x3FD5575B0BE00B6A, double 0xBFDFFFFEF20A4123] }, align 8

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
