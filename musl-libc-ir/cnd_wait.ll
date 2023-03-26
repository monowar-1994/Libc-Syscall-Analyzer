; ModuleID = 'src/thread/cnd_wait.c'
source_filename = "src/thread/cnd_wait.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.cnd_t = type { %union.anon }
%union.anon = type { [6 x i8*] }
%struct.mtx_t = type { %union.anon.0 }
%union.anon.0 = type { [5 x i8*] }
%struct.timespec = type { i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @cnd_wait(%struct.cnd_t* noundef %0, %struct.mtx_t* noundef %1) local_unnamed_addr #0 {
  %3 = tail call i32 @cnd_timedwait(%struct.cnd_t* noundef %0, %struct.mtx_t* noundef %1, %struct.timespec* noundef null) #2
  ret i32 %3
}

; Function Attrs: optsize
declare i32 @cnd_timedwait(%struct.cnd_t* noundef, %struct.mtx_t* noundef, %struct.timespec* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
