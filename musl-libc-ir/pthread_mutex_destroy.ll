; ModuleID = 'src/thread/pthread_mutex_destroy.c'
source_filename = "src/thread/pthread_mutex_destroy.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_mutex_t = type { %union.anon }
%union.anon = type { [5 x i8*] }

; Function Attrs: nounwind optsize strictfp
define i32 @pthread_mutex_destroy(%struct.pthread_mutex_t* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = bitcast %struct.pthread_mutex_t* %0 to i32*
  %3 = load i32, i32* %2, align 8, !tbaa !3
  %4 = icmp sgt i32 %3, 128
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  tail call void @__vm_wait() #2
  br label %6

6:                                                ; preds = %5, %1
  ret i32 0
}

; Function Attrs: optsize
declare hidden void @__vm_wait() local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
