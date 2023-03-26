; ModuleID = 'src/unistd/nice.c'
source_filename = "src/unistd/nice.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @nice(i32 noundef %0) local_unnamed_addr #0 {
  %2 = add i32 %0, 39
  %3 = icmp ult i32 %2, 79
  br i1 %3, label %4, label %7

4:                                                ; preds = %1
  %5 = tail call i32 @getpriority(i32 noundef 0, i32 noundef 0) #3
  %6 = add nsw i32 %5, %0
  br label %7

7:                                                ; preds = %4, %1
  %8 = phi i32 [ %6, %4 ], [ %0, %1 ]
  %9 = icmp slt i32 %8, 19
  %10 = select i1 %9, i32 %8, i32 19
  %11 = icmp sgt i32 %10, -20
  %12 = select i1 %11, i32 %10, i32 -20
  %13 = tail call i32 @setpriority(i32 noundef 0, i32 noundef 0, i32 noundef %12) #3
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %20, label %15

15:                                               ; preds = %7
  %16 = tail call i32* @___errno_location() #4
  %17 = load i32, i32* %16, align 4, !tbaa !3
  %18 = icmp eq i32 %17, 13
  br i1 %18, label %19, label %20

19:                                               ; preds = %15
  store i32 1, i32* %16, align 4, !tbaa !3
  br label %20

20:                                               ; preds = %7, %15, %19
  %21 = phi i32 [ -1, %19 ], [ -1, %15 ], [ %12, %7 ]
  ret i32 %21
}

; Function Attrs: optsize
declare i32 @getpriority(i32 noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @setpriority(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #1

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
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
