; ModuleID = 'src/thread/pthread_attr_setinheritsched.c'
source_filename = "src/thread/pthread_attr_setinheritsched.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_attr_t = type { %union.anon }
%union.anon = type { [7 x i64] }

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn writeonly
define i32 @pthread_attr_setinheritsched(%struct.pthread_attr_t* nocapture noundef writeonly %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp ugt i32 %1, 1
  br i1 %3, label %7, label %4

4:                                                ; preds = %2
  %5 = bitcast %struct.pthread_attr_t* %0 to [14 x i32]*
  %6 = getelementptr inbounds [14 x i32], [14 x i32]* %5, i64 0, i64 7
  store i32 %1, i32* %6, align 4, !tbaa !3
  br label %7

7:                                                ; preds = %2, %4
  %8 = phi i32 [ 0, %4 ], [ 22, %2 ]
  ret i32 %8
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
