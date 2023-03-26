; ModuleID = 'src/thread/pthread_getcpuclockid.c'
source_filename = "src/thread/pthread_getcpuclockid.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define i32 @pthread_getcpuclockid(%struct.__pthread* nocapture noundef readonly %0, i32* nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %0, i64 0, i32 6
  %4 = load i32, i32* %3, align 8, !tbaa !3
  %5 = xor i32 %4, -1
  %6 = shl i32 %5, 3
  %7 = or i32 %6, 6
  store i32 %7, i32* %1, align 4, !tbaa !11
  ret i32 0
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !9, i64 48}
!4 = !{!"__pthread", !5, i64 0, !5, i64 8, !5, i64 16, !5, i64 24, !8, i64 32, !8, i64 40, !9, i64 48, !9, i64 52, !9, i64 56, !9, i64 60, !6, i64 64, !6, i64 65, !6, i64 66, !6, i64 66, !5, i64 72, !8, i64 80, !5, i64 88, !8, i64 96, !8, i64 104, !5, i64 112, !5, i64 120, !5, i64 128, !10, i64 136, !9, i64 160, !9, i64 164, !5, i64 168, !6, i64 176, !5, i64 184, !5, i64 192}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"long", !6, i64 0}
!9 = !{!"int", !6, i64 0}
!10 = !{!"", !5, i64 0, !8, i64 8, !5, i64 16}
!11 = !{!9, !9, i64 0}
