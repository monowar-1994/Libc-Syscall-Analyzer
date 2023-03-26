; ModuleID = 'src/ctype/__ctype_b_loc.c'
source_filename = "src/ctype/__ctype_b_loc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@ptable = internal constant i16* getelementptr inbounds (<{ [256 x i16], [128 x i16] }>, <{ [256 x i16], [128 x i16] }>* @table, i64 0, i32 0, i64 128), align 8
@table = internal constant <{ [256 x i16], [128 x i16] }> <{ [256 x i16] [i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 8195, i16 8194, i16 8194, i16 8194, i16 8194, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 24577, i16 -16380, i16 -16380, i16 -16380, i16 -16380, i16 -16380, i16 -16380, i16 -16380, i16 -16380, i16 -16380, i16 -16380, i16 -16380, i16 -16380, i16 -16380, i16 -16380, i16 -16380, i16 -10232, i16 -10232, i16 -10232, i16 -10232, i16 -10232, i16 -10232, i16 -10232, i16 -10232, i16 -10232, i16 -10232, i16 -16380, i16 -16380, i16 -16380, i16 -16380, i16 -16380, i16 -16380, i16 -16380, i16 -11000, i16 -11000, i16 -11000, i16 -11000, i16 -11000, i16 -11000, i16 -15096, i16 -15096, i16 -15096, i16 -15096, i16 -15096, i16 -15096, i16 -15096, i16 -15096, i16 -15096, i16 -15096, i16 -15096, i16 -15096, i16 -15096, i16 -15096, i16 -15096, i16 -15096, i16 -15096, i16 -15096, i16 -15096, i16 -15096, i16 -16380, i16 -16380, i16 -16380, i16 -16380, i16 -16380, i16 -16380, i16 -10744, i16 -10744, i16 -10744, i16 -10744, i16 -10744, i16 -10744, i16 -14840, i16 -14840, i16 -14840, i16 -14840, i16 -14840, i16 -14840, i16 -14840, i16 -14840, i16 -14840, i16 -14840, i16 -14840, i16 -14840, i16 -14840, i16 -14840, i16 -14840, i16 -14840, i16 -14840, i16 -14840, i16 -14840, i16 -14840, i16 -16380, i16 -16380, i16 -16380, i16 -16380, i16 2], [128 x i16] zeroinitializer }>, align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define nonnull i16** @__ctype_b_loc() local_unnamed_addr #0 {
  ret i16** @ptable
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
