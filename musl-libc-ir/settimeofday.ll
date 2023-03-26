; ModuleID = 'src/linux/settimeofday.c'
source_filename = "src/linux/settimeofday.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }
%struct.timespec = type { i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @settimeofday(%struct.timeval* noundef readonly %0, %struct.timezone* nocapture noundef readnone %1) local_unnamed_addr #0 {
  %3 = alloca %struct.timespec, align 8
  %4 = icmp eq %struct.timeval* %0, null
  br i1 %4, label %19, label %5

5:                                                ; preds = %2
  %6 = getelementptr inbounds %struct.timeval, %struct.timeval* %0, i64 0, i32 1
  %7 = load i64, i64* %6, align 8, !tbaa !3
  %8 = icmp ugt i64 %7, 999999
  br i1 %8, label %9, label %12

9:                                                ; preds = %5
  %10 = tail call i64 @__syscall_ret(i64 noundef -22) #2
  %11 = trunc i64 %10 to i32
  br label %19

12:                                               ; preds = %5
  %13 = getelementptr inbounds %struct.timespec, %struct.timespec* %3, i64 0, i32 0
  %14 = getelementptr inbounds %struct.timeval, %struct.timeval* %0, i64 0, i32 0
  %15 = load i64, i64* %14, align 8, !tbaa !8
  store i64 %15, i64* %13, align 8, !tbaa !9
  %16 = getelementptr inbounds %struct.timespec, %struct.timespec* %3, i64 0, i32 1
  %17 = mul nuw nsw i64 %7, 1000
  store i64 %17, i64* %16, align 8, !tbaa !11
  %18 = call i32 @clock_settime(i32 noundef 0, %struct.timespec* noundef nonnull %3) #2
  br label %19

19:                                               ; preds = %2, %12, %9
  %20 = phi i32 [ %11, %9 ], [ %18, %12 ], [ 0, %2 ]
  ret i32 %20
}

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @clock_settime(i32 noundef, %struct.timespec* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 8}
!4 = !{!"timeval", !5, i64 0, !5, i64 8}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!4, !5, i64 0}
!9 = !{!10, !5, i64 0}
!10 = !{!"timespec", !5, i64 0, !5, i64 8}
!11 = !{!10, !5, i64 8}
