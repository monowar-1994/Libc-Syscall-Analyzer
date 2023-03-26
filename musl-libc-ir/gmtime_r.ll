; ModuleID = 'src/time/gmtime_r.c'
source_filename = "src/time/gmtime_r.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }

@__utc = external hidden constant [0 x i8], align 1

@gmtime_r = weak alias %struct.tm* (i64*, %struct.tm*), %struct.tm* (i64*, %struct.tm*)* @__gmtime_r

; Function Attrs: nounwind optsize strictfp
define hidden %struct.tm* @__gmtime_r(i64* noalias nocapture noundef readonly %0, %struct.tm* noalias noundef %1) #0 {
  %3 = load i64, i64* %0, align 8, !tbaa !3
  %4 = tail call i32 @__secs_to_tm(i64 noundef %3, %struct.tm* noundef %1) #3
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %6, label %8

6:                                                ; preds = %2
  %7 = tail call i32* @___errno_location() #4
  store i32 75, i32* %7, align 4, !tbaa !7
  br label %12

8:                                                ; preds = %2
  %9 = getelementptr inbounds %struct.tm, %struct.tm* %1, i64 0, i32 8
  store i32 0, i32* %9, align 8, !tbaa !9
  %10 = getelementptr inbounds %struct.tm, %struct.tm* %1, i64 0, i32 9
  store i64 0, i64* %10, align 8, !tbaa !12
  %11 = getelementptr inbounds %struct.tm, %struct.tm* %1, i64 0, i32 10
  store i8* getelementptr inbounds ([0 x i8], [0 x i8]* @__utc, i64 0, i64 0), i8** %11, align 8, !tbaa !13
  br label %12

12:                                               ; preds = %8, %6
  %13 = phi %struct.tm* [ null, %6 ], [ %1, %8 ]
  ret %struct.tm* %13
}

; Function Attrs: optsize
declare hidden i32 @__secs_to_tm(i64 noundef, %struct.tm* noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"long", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
!9 = !{!10, !8, i64 32}
!10 = !{!"tm", !8, i64 0, !8, i64 4, !8, i64 8, !8, i64 12, !8, i64 16, !8, i64 20, !8, i64 24, !8, i64 28, !8, i64 32, !4, i64 40, !11, i64 48}
!11 = !{!"any pointer", !5, i64 0}
!12 = !{!10, !4, i64 40}
!13 = !{!10, !11, i64 48}
