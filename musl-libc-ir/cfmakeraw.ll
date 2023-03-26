; ModuleID = 'src/termios/cfmakeraw.c'
source_filename = "src/termios/cfmakeraw.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.termios = type { i32, i32, i32, i32, i8, [32 x i8], i32, i32 }

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define void @cfmakeraw(%struct.termios* nocapture noundef %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.termios, %struct.termios* %0, i64 0, i32 0
  %3 = load i32, i32* %2, align 4, !tbaa !3
  %4 = and i32 %3, -1516
  store i32 %4, i32* %2, align 4, !tbaa !3
  %5 = getelementptr inbounds %struct.termios, %struct.termios* %0, i64 0, i32 1
  %6 = load i32, i32* %5, align 4, !tbaa !8
  %7 = and i32 %6, -2
  store i32 %7, i32* %5, align 4, !tbaa !8
  %8 = getelementptr inbounds %struct.termios, %struct.termios* %0, i64 0, i32 3
  %9 = load i32, i32* %8, align 4, !tbaa !9
  %10 = and i32 %9, -32844
  store i32 %10, i32* %8, align 4, !tbaa !9
  %11 = getelementptr inbounds %struct.termios, %struct.termios* %0, i64 0, i32 2
  %12 = load i32, i32* %11, align 4, !tbaa !10
  %13 = and i32 %12, -305
  %14 = or i32 %13, 48
  store i32 %14, i32* %11, align 4, !tbaa !10
  %15 = getelementptr inbounds %struct.termios, %struct.termios* %0, i64 0, i32 5, i64 6
  store i8 1, i8* %15, align 1, !tbaa !11
  %16 = getelementptr inbounds %struct.termios, %struct.termios* %0, i64 0, i32 5, i64 5
  store i8 0, i8* %16, align 1, !tbaa !11
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"termios", !5, i64 0, !5, i64 4, !5, i64 8, !5, i64 12, !6, i64 16, !6, i64 17, !5, i64 52, !5, i64 56}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!4, !5, i64 4}
!9 = !{!4, !5, i64 12}
!10 = !{!4, !5, i64 8}
!11 = !{!6, !6, i64 0}
