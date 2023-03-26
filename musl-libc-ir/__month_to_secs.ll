; ModuleID = 'src/time/__month_to_secs.c'
source_filename = "src/time/__month_to_secs.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__month_to_secs.secs_through_month = internal unnamed_addr constant [12 x i32] [i32 0, i32 2678400, i32 5097600, i32 7776000, i32 10368000, i32 13046400, i32 15638400, i32 18316800, i32 20995200, i32 23587200, i32 26265600, i32 28857600], align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define i32 @__month_to_secs(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = sext i32 %0 to i64
  %4 = getelementptr inbounds [12 x i32], [12 x i32]* @__month_to_secs.secs_through_month, i64 0, i64 %3
  %5 = load i32, i32* %4, align 4, !tbaa !3
  %6 = icmp ne i32 %1, 0
  %7 = icmp sgt i32 %0, 1
  %8 = and i1 %7, %6
  %9 = add nsw i32 %5, 86400
  %10 = select i1 %8, i32 %9, i32 %5
  ret i32 %10
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
