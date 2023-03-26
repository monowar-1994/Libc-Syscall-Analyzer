; ModuleID = 'src/time/localtime_r.c'
source_filename = "src/time/localtime_r.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }

@localtime_r = weak alias %struct.tm* (i64*, %struct.tm*), %struct.tm* (i64*, %struct.tm*)* @__localtime_r

; Function Attrs: nounwind optsize strictfp
define hidden %struct.tm* @__localtime_r(i64* noalias nocapture noundef readonly %0, %struct.tm* noalias noundef %1) #0 {
  %3 = load i64, i64* %0, align 8, !tbaa !3
  %4 = add i64 %3, -67908586878892801
  %5 = icmp ult i64 %4, -135817173789408001
  br i1 %5, label %14, label %6

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.tm, %struct.tm* %1, i64 0, i32 8
  %8 = getelementptr inbounds %struct.tm, %struct.tm* %1, i64 0, i32 9
  %9 = getelementptr inbounds %struct.tm, %struct.tm* %1, i64 0, i32 10
  tail call void @__secs_to_zone(i64 noundef %3, i32 noundef 0, i32* noundef nonnull %7, i64* noundef nonnull %8, i64* noundef null, i8** noundef nonnull %9) #3
  %10 = load i64, i64* %8, align 8, !tbaa !7
  %11 = add nsw i64 %10, %3
  %12 = tail call i32 @__secs_to_tm(i64 noundef %11, %struct.tm* noundef %1) #3
  %13 = icmp slt i32 %12, 0
  br i1 %13, label %14, label %16

14:                                               ; preds = %6, %2
  %15 = tail call i32* @___errno_location() #4
  store i32 75, i32* %15, align 4, !tbaa !11
  br label %16

16:                                               ; preds = %14, %6
  %17 = phi %struct.tm* [ %1, %6 ], [ null, %14 ]
  ret %struct.tm* %17
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__secs_to_zone(i64 noundef, i32 noundef, i32* noundef, i64* noundef, i64* noundef, i8** noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__secs_to_tm(i64 noundef, %struct.tm* noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!7 = !{!8, !4, i64 40}
!8 = !{!"tm", !9, i64 0, !9, i64 4, !9, i64 8, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !9, i64 32, !4, i64 40, !10, i64 48}
!9 = !{!"int", !5, i64 0}
!10 = !{!"any pointer", !5, i64 0}
!11 = !{!9, !9, i64 0}
