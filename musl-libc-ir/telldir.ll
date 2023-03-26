; ModuleID = 'src/dirent/telldir.c'
source_filename = "src/dirent/telldir.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__dirstream = type { i64, i32, i32, i32, [1 x i32], [2048 x i8] }

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn
define i64 @telldir(%struct.__dirstream* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.__dirstream, %struct.__dirstream* %0, i64 0, i32 0
  %3 = load i64, i64* %2, align 8, !tbaa !3
  ret i64 %3
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"__dirstream", !5, i64 0, !8, i64 8, !8, i64 12, !8, i64 16, !6, i64 20, !6, i64 24}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"int", !6, i64 0}
