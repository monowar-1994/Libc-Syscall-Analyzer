; ModuleID = 'src/thread/pthread_attr_setstacksize.c'
source_filename = "src/thread/pthread_attr_setstacksize.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_attr_t = type { %union.anon }
%union.anon = type { [7 x i64] }

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn writeonly
define i32 @pthread_attr_setstacksize(%struct.pthread_attr_t* nocapture noundef writeonly %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = add i64 %1, -4611686018427389952
  %4 = icmp ult i64 %3, -4611686018427387904
  br i1 %4, label %8, label %5

5:                                                ; preds = %2
  %6 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %0, i64 0, i32 0, i32 0, i64 2
  store i64 0, i64* %6, align 8, !tbaa !3
  %7 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %0, i64 0, i32 0, i32 0, i64 0
  store i64 %1, i64* %7, align 8, !tbaa !3
  br label %8

8:                                                ; preds = %2, %5
  %9 = phi i32 [ 0, %5 ], [ 22, %2 ]
  ret i32 %9
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
