; ModuleID = 'src/thread/cnd_timedwait.c'
source_filename = "src/thread/cnd_timedwait.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.cnd_t = type { %union.anon }
%union.anon = type { [6 x i8*] }
%struct.mtx_t = type { %union.anon.0 }
%union.anon.0 = type { [5 x i8*] }
%struct.timespec = type { i64, i64 }
%struct.pthread_cond_t = type { %union.anon.1 }
%union.anon.1 = type { [6 x i8*] }
%struct.pthread_mutex_t = type { %union.anon.2 }
%union.anon.2 = type { [5 x i8*] }

; Function Attrs: nounwind optsize strictfp
define i32 @cnd_timedwait(%struct.cnd_t* noalias noundef %0, %struct.mtx_t* noalias noundef %1, %struct.timespec* noalias noundef %2) local_unnamed_addr #0 {
  %4 = bitcast %struct.cnd_t* %0 to %struct.pthread_cond_t*
  %5 = bitcast %struct.mtx_t* %1 to %struct.pthread_mutex_t*
  %6 = tail call i32 @__pthread_cond_timedwait(%struct.pthread_cond_t* noundef %4, %struct.pthread_mutex_t* noundef %5, %struct.timespec* noundef %2) #2
  %7 = icmp eq i32 %6, 110
  %8 = select i1 %7, i32 4, i32 2
  %9 = icmp eq i32 %6, 0
  %10 = select i1 %9, i32 0, i32 %8
  ret i32 %10
}

; Function Attrs: optsize
declare hidden i32 @__pthread_cond_timedwait(%struct.pthread_cond_t* noundef, %struct.pthread_mutex_t* noundef, %struct.timespec* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
