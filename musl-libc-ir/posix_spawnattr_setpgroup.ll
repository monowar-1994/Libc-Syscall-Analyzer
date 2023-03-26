; ModuleID = 'src/process/posix_spawnattr_setpgroup.c'
source_filename = "src/process/posix_spawnattr_setpgroup.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.posix_spawnattr_t = type { i32, i32, %struct.__sigset_t, %struct.__sigset_t, i32, i32, i8*, [56 x i8] }
%struct.__sigset_t = type { [16 x i64] }

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn writeonly
define i32 @posix_spawnattr_setpgroup(%struct.posix_spawnattr_t* nocapture noundef writeonly %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.posix_spawnattr_t, %struct.posix_spawnattr_t* %0, i64 0, i32 1
  store i32 %1, i32* %3, align 4, !tbaa !3
  ret i32 0
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 4}
!4 = !{!"", !5, i64 0, !5, i64 4, !8, i64 8, !8, i64 136, !5, i64 264, !5, i64 268, !9, i64 272, !6, i64 280}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"__sigset_t", !6, i64 0}
!9 = !{!"any pointer", !6, i64 0}
