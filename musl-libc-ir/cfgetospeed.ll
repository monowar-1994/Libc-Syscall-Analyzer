; ModuleID = 'src/termios/cfgetospeed.c'
source_filename = "src/termios/cfgetospeed.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.termios = type { i32, i32, i32, i32, i8, [32 x i8], i32, i32 }

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn
define i32 @cfgetospeed(%struct.termios* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.termios, %struct.termios* %0, i64 0, i32 2
  %3 = load i32, i32* %2, align 4, !tbaa !3
  %4 = and i32 %3, 4111
  ret i32 %4
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn
define i32 @cfgetispeed(%struct.termios* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.termios, %struct.termios* %0, i64 0, i32 2
  %3 = load i32, i32* %2, align 4, !tbaa !3
  %4 = and i32 %3, 4111
  ret i32 %4
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 8}
!4 = !{!"termios", !5, i64 0, !5, i64 4, !5, i64 8, !5, i64 12, !6, i64 16, !6, i64 17, !5, i64 52, !5, i64 56}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
