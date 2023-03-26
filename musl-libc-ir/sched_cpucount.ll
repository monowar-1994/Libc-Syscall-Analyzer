; ModuleID = 'src/sched/sched_cpucount.c'
source_filename = "src/sched/sched_cpucount.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.cpu_set_t = type { [16 x i64] }

; Function Attrs: nofree norecurse nosync nounwind optsize readonly strictfp
define i32 @__sched_cpucount(i64 noundef %0, %struct.cpu_set_t* nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = bitcast %struct.cpu_set_t* %1 to i8*
  %4 = icmp eq i64 %0, 0
  br i1 %4, label %27, label %5

5:                                                ; preds = %2, %22
  %6 = phi i64 [ %23, %22 ], [ 0, %2 ]
  %7 = phi i64 [ %19, %22 ], [ 0, %2 ]
  %8 = getelementptr inbounds i8, i8* %3, i64 %6
  %9 = load i8, i8* %8, align 1, !tbaa !3
  %10 = zext i8 %9 to i32
  br label %11

11:                                               ; preds = %5, %11
  %12 = phi i64 [ %7, %5 ], [ %19, %11 ]
  %13 = phi i64 [ 0, %5 ], [ %20, %11 ]
  %14 = trunc i64 %13 to i32
  %15 = shl nuw nsw i32 1, %14
  %16 = and i32 %15, %10
  %17 = icmp ne i32 %16, 0
  %18 = zext i1 %17 to i64
  %19 = add i64 %12, %18
  %20 = add nuw nsw i64 %13, 1
  %21 = icmp eq i64 %20, 8
  br i1 %21, label %22, label %11

22:                                               ; preds = %11
  %23 = add nuw i64 %6, 1
  %24 = icmp eq i64 %23, %0
  br i1 %24, label %25, label %5

25:                                               ; preds = %22
  %26 = trunc i64 %19 to i32
  br label %27

27:                                               ; preds = %25, %2
  %28 = phi i32 [ 0, %2 ], [ %26, %25 ]
  ret i32 %28
}

attributes #0 = { nofree norecurse nosync nounwind optsize readonly strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
