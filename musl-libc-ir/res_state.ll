; ModuleID = 'src/network/res_state.c'
source_filename = "src/network/res_state.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__res_state = type { i32, i32, i64, i32, [3 x %struct.sockaddr_in], i16, [7 x i8*], [256 x i8], i64, i32, [10 x %struct.anon], i8*, i8*, i32, i32, i32, %union.anon }
%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.anon = type { %struct.in_addr, i32 }
%union.anon = type { %struct.anon.0 }
%struct.anon.0 = type { i16, [3 x i16], [3 x i32], i16, i16, [3 x %struct.sockaddr_in6*], [2 x i32] }
%struct.sockaddr_in6 = type { i16, i16, i32, %struct.in6_addr, i32 }
%struct.in6_addr = type { %union.anon.1 }
%union.anon.1 = type { [4 x i32] }

@__res_state.res = internal global %struct.__res_state zeroinitializer, align 8

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define nonnull %struct.__res_state* @__res_state() local_unnamed_addr #0 {
  ret %struct.__res_state* @__res_state.res
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
