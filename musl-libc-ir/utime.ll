; ModuleID = 'src/time/utime.c'
source_filename = "src/time/utime.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.utimbuf = type { i64, i64 }
%struct.timespec = type { i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @utime(i8* noundef %0, %struct.utimbuf* noundef readonly %1) local_unnamed_addr #0 {
  %3 = alloca [2 x %struct.timespec], align 8
  %4 = icmp eq %struct.utimbuf* %1, null
  br i1 %4, label %15, label %5

5:                                                ; preds = %2
  %6 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %3, i64 0, i64 0
  %7 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %3, i64 0, i64 0, i32 0
  %8 = getelementptr inbounds %struct.utimbuf, %struct.utimbuf* %1, i64 0, i32 0
  %9 = load i64, i64* %8, align 8, !tbaa !3
  store i64 %9, i64* %7, align 8, !tbaa !8
  %10 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %3, i64 0, i64 0, i32 1
  store i64 0, i64* %10, align 8, !tbaa !10
  %11 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %3, i64 0, i64 1, i32 0
  %12 = getelementptr inbounds %struct.utimbuf, %struct.utimbuf* %1, i64 0, i32 1
  %13 = load i64, i64* %12, align 8, !tbaa !11
  store i64 %13, i64* %11, align 8, !tbaa !8
  %14 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %3, i64 0, i64 1, i32 1
  store i64 0, i64* %14, align 8, !tbaa !10
  br label %15

15:                                               ; preds = %2, %5
  %16 = phi %struct.timespec* [ %6, %5 ], [ null, %2 ]
  %17 = call i32 @utimensat(i32 noundef -100, i8* noundef %0, %struct.timespec* noundef %16, i32 noundef 0) #2
  ret i32 %17
}

; Function Attrs: optsize
declare i32 @utimensat(i32 noundef, i8* noundef, %struct.timespec* noundef, i32 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"utimbuf", !5, i64 0, !5, i64 8}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9, !5, i64 0}
!9 = !{!"timespec", !5, i64 0, !5, i64 8}
!10 = !{!9, !5, i64 8}
!11 = !{!4, !5, i64 8}
