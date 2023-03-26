; ModuleID = 'src/signal/sigdelset.c'
source_filename = "src/signal/sigdelset.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__sigset_t = type { [16 x i64] }

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define i32 @sigdelset(%struct.__sigset_t* nocapture noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = add nsw i32 %1, -1
  %4 = icmp ugt i32 %3, 63
  %5 = add i32 %1, -32
  %6 = icmp ult i32 %5, 3
  %7 = or i1 %4, %6
  br i1 %7, label %8, label %10

8:                                                ; preds = %2
  %9 = tail call i32* @___errno_location() #2
  store i32 22, i32* %9, align 4, !tbaa !3
  br label %17

10:                                               ; preds = %2
  %11 = zext i32 %3 to i64
  %12 = shl nuw i64 1, %11
  %13 = xor i64 %12, -1
  %14 = getelementptr inbounds %struct.__sigset_t, %struct.__sigset_t* %0, i64 0, i32 0, i64 0
  %15 = load i64, i64* %14, align 8, !tbaa !7
  %16 = and i64 %15, %13
  store i64 %16, i64* %14, align 8, !tbaa !7
  br label %17

17:                                               ; preds = %10, %8
  %18 = phi i32 [ -1, %8 ], [ 0, %10 ]
  ret i32 %18
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #1

attributes #0 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"long", !5, i64 0}
