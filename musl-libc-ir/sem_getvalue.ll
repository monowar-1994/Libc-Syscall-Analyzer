; ModuleID = 'src/thread/sem_getvalue.c'
source_filename = "src/thread/sem_getvalue.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sem_t = type { [8 x i32] }

; Function Attrs: mustprogress nofree norecurse nounwind optsize strictfp willreturn
define i32 @sem_getvalue(%struct.sem_t* noalias noundef %0, i32* noalias nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.sem_t, %struct.sem_t* %0, i64 0, i32 0, i64 0
  %4 = load volatile i32, i32* %3, align 4, !tbaa !3
  %5 = icmp sgt i32 %4, 0
  %6 = select i1 %5, i32 %4, i32 0
  store i32 %6, i32* %1, align 4, !tbaa !3
  ret i32 0
}

attributes #0 = { mustprogress nofree norecurse nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
