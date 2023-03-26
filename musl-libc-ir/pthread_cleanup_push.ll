; ModuleID = 'src/thread/pthread_cleanup_push.c'
source_filename = "src/thread/pthread_cleanup_push.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }

@__do_cleanup_push = weak hidden alias void (%struct.__ptcb*), void (%struct.__ptcb*)* @dummy
@__do_cleanup_pop = weak hidden alias void (%struct.__ptcb*), void (%struct.__ptcb*)* @dummy

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal void @dummy(%struct.__ptcb* nocapture noundef %0) #0 {
  ret void
}

; Function Attrs: nounwind optsize strictfp
define void @_pthread_cleanup_push(%struct.__ptcb* noundef %0, void (i8*)* noundef %1, i8* noundef %2) local_unnamed_addr #1 {
  %4 = getelementptr inbounds %struct.__ptcb, %struct.__ptcb* %0, i64 0, i32 0
  store void (i8*)* %1, void (i8*)** %4, align 8, !tbaa !3
  %5 = getelementptr inbounds %struct.__ptcb, %struct.__ptcb* %0, i64 0, i32 1
  store i8* %2, i8** %5, align 8, !tbaa !8
  tail call void @__do_cleanup_push(%struct.__ptcb* noundef %0) #2
  ret void
}

; Function Attrs: nounwind optsize strictfp
define void @_pthread_cleanup_pop(%struct.__ptcb* noundef %0, i32 noundef %1) local_unnamed_addr #1 {
  tail call void @__do_cleanup_pop(%struct.__ptcb* noundef %0) #2
  %3 = icmp eq i32 %1, 0
  br i1 %3, label %9, label %4

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct.__ptcb, %struct.__ptcb* %0, i64 0, i32 0
  %6 = load void (i8*)*, void (i8*)** %5, align 8, !tbaa !3
  %7 = getelementptr inbounds %struct.__ptcb, %struct.__ptcb* %0, i64 0, i32 1
  %8 = load i8*, i8** %7, align 8, !tbaa !8
  tail call void %6(i8* noundef %8) #2
  br label %9

9:                                                ; preds = %4, %2
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"__ptcb", !5, i64 0, !5, i64 8, !5, i64 16}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!4, !5, i64 8}
