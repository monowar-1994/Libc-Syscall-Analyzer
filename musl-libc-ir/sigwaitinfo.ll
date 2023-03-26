; ModuleID = 'src/signal/sigwaitinfo.c'
source_filename = "src/signal/sigwaitinfo.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__sigset_t = type { [16 x i64] }
%struct.siginfo_t = type { i32, i32, i32, %union.anon }
%union.anon = type { %struct.anon, [80 x i8] }
%struct.anon = type { %union.anon.0, %union.anon.3 }
%union.anon.0 = type { %struct.anon.1 }
%struct.anon.1 = type { i32, i32 }
%union.anon.3 = type { %struct.anon.4 }
%struct.anon.4 = type { i32, i64, i64 }
%struct.timespec = type { i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @sigwaitinfo(%struct.__sigset_t* noalias noundef %0, %struct.siginfo_t* noalias noundef %1) local_unnamed_addr #0 {
  %3 = tail call i32 @sigtimedwait(%struct.__sigset_t* noundef %0, %struct.siginfo_t* noundef %1, %struct.timespec* noundef null) #2
  ret i32 %3
}

; Function Attrs: optsize
declare i32 @sigtimedwait(%struct.__sigset_t* noundef, %struct.siginfo_t* noundef, %struct.timespec* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
