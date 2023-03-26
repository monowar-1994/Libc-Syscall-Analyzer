; ModuleID = 'src/thread/sem_init.c'
source_filename = "src/thread/sem_init.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sem_t = type { [8 x i32] }

; Function Attrs: nofree nounwind optsize strictfp
define i32 @sem_init(%struct.sem_t* noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = icmp slt i32 %2, 0
  br i1 %4, label %5, label %7

5:                                                ; preds = %3
  %6 = tail call i32* @___errno_location() #2
  store i32 22, i32* %6, align 4, !tbaa !3
  br label %13

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.sem_t, %struct.sem_t* %0, i64 0, i32 0, i64 0
  store volatile i32 %2, i32* %8, align 4, !tbaa !3
  %9 = getelementptr inbounds %struct.sem_t, %struct.sem_t* %0, i64 0, i32 0, i64 1
  store volatile i32 0, i32* %9, align 4, !tbaa !3
  %10 = icmp eq i32 %1, 0
  %11 = select i1 %10, i32 128, i32 0
  %12 = getelementptr inbounds %struct.sem_t, %struct.sem_t* %0, i64 0, i32 0, i64 2
  store volatile i32 %11, i32* %12, align 4, !tbaa !3
  br label %13

13:                                               ; preds = %7, %5
  %14 = phi i32 [ -1, %5 ], [ 0, %7 ]
  ret i32 %14
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #1

attributes #0 = { nofree nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
