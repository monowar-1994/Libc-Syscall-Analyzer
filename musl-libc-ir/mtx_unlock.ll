; ModuleID = 'src/thread/mtx_unlock.c'
source_filename = "src/thread/mtx_unlock.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.mtx_t = type { %union.anon }
%union.anon = type { [5 x i8*] }
%struct.pthread_mutex_t = type { %union.anon.0 }
%union.anon.0 = type { [5 x i8*] }

; Function Attrs: nounwind optsize strictfp
define i32 @mtx_unlock(%struct.mtx_t* noundef %0) local_unnamed_addr #0 {
  %2 = bitcast %struct.mtx_t* %0 to %struct.pthread_mutex_t*
  %3 = tail call i32 @__pthread_mutex_unlock(%struct.pthread_mutex_t* noundef %2) #2
  ret i32 %3
}

; Function Attrs: optsize
declare hidden i32 @__pthread_mutex_unlock(%struct.pthread_mutex_t* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
