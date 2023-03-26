; ModuleID = 'src/process/posix_spawnattr_sched.c'
source_filename = "src/process/posix_spawnattr_sched.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.posix_spawnattr_t = type { i32, i32, %struct.__sigset_t, %struct.__sigset_t, i32, i32, i8*, [56 x i8] }
%struct.__sigset_t = type { [16 x i64] }
%struct.sched_param = type { i32, i32, [2 x %struct.anon], i32 }
%struct.anon = type { i64, i64 }

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define i32 @posix_spawnattr_getschedparam(%struct.posix_spawnattr_t* noalias nocapture noundef readnone %0, %struct.sched_param* noalias nocapture noundef readnone %1) local_unnamed_addr #0 {
  ret i32 38
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define i32 @posix_spawnattr_setschedparam(%struct.posix_spawnattr_t* noalias nocapture noundef readnone %0, %struct.sched_param* noalias nocapture noundef readnone %1) local_unnamed_addr #0 {
  ret i32 38
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define i32 @posix_spawnattr_getschedpolicy(%struct.posix_spawnattr_t* noalias nocapture noundef readnone %0, i32* noalias nocapture noundef readnone %1) local_unnamed_addr #0 {
  ret i32 38
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define i32 @posix_spawnattr_setschedpolicy(%struct.posix_spawnattr_t* nocapture noundef readnone %0, i32 noundef %1) local_unnamed_addr #0 {
  ret i32 38
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
