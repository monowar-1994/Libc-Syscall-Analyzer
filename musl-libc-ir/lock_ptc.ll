; ModuleID = 'src/thread/lock_ptc.c'
source_filename = "src/thread/lock_ptc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_rwlock_t = type { %union.anon }
%union.anon = type { [7 x i8*] }

@lock = internal global { { [14 x i32] } } zeroinitializer, align 8

; Function Attrs: nounwind optsize strictfp
define void @__inhibit_ptc() local_unnamed_addr #0 {
  %1 = tail call i32 @pthread_rwlock_wrlock(%struct.pthread_rwlock_t* noundef bitcast ({ { [14 x i32] } }* @lock to %struct.pthread_rwlock_t*)) #2
  ret void
}

; Function Attrs: optsize
declare i32 @pthread_rwlock_wrlock(%struct.pthread_rwlock_t* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define void @__acquire_ptc() local_unnamed_addr #0 {
  %1 = tail call i32 @pthread_rwlock_rdlock(%struct.pthread_rwlock_t* noundef bitcast ({ { [14 x i32] } }* @lock to %struct.pthread_rwlock_t*)) #2
  ret void
}

; Function Attrs: optsize
declare i32 @pthread_rwlock_rdlock(%struct.pthread_rwlock_t* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define void @__release_ptc() local_unnamed_addr #0 {
  %1 = tail call i32 @pthread_rwlock_unlock(%struct.pthread_rwlock_t* noundef bitcast ({ { [14 x i32] } }* @lock to %struct.pthread_rwlock_t*)) #2
  ret void
}

; Function Attrs: optsize
declare i32 @pthread_rwlock_unlock(%struct.pthread_rwlock_t* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
