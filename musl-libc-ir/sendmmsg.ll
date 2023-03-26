; ModuleID = 'src/network/sendmmsg.c'
source_filename = "src/network/sendmmsg.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.mmsghdr = type { %struct.msghdr, i32 }
%struct.msghdr = type { i8*, i32, %struct.iovec*, i32, i32, i8*, i32, i32, i32 }
%struct.iovec = type { i8*, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @sendmmsg(i32 noundef %0, %struct.mmsghdr* noundef %1, i32 noundef %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = icmp ult i32 %2, 1024
  %6 = select i1 %5, i32 %2, i32 1024
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %26, label %8

8:                                                ; preds = %4
  %9 = zext i32 %6 to i64
  br label %10

10:                                               ; preds = %8, %15
  %11 = phi i64 [ 0, %8 ], [ %18, %15 ]
  %12 = getelementptr inbounds %struct.mmsghdr, %struct.mmsghdr* %1, i64 %11, i32 0
  %13 = tail call i64 @sendmsg(i32 noundef %0, %struct.msghdr* noundef %12, i32 noundef %3) #2
  %14 = icmp slt i64 %13, 0
  br i1 %14, label %20, label %15

15:                                               ; preds = %10
  %16 = trunc i64 %13 to i32
  %17 = getelementptr inbounds %struct.mmsghdr, %struct.mmsghdr* %1, i64 %11, i32 1
  store i32 %16, i32* %17, align 8, !tbaa !3
  %18 = add nuw nsw i64 %11, 1
  %19 = icmp eq i64 %18, %9
  br i1 %19, label %22, label %10

20:                                               ; preds = %10
  %21 = trunc i64 %11 to i32
  br label %22

22:                                               ; preds = %15, %20
  %23 = phi i32 [ %21, %20 ], [ %6, %15 ]
  %24 = icmp eq i32 %23, 0
  %25 = select i1 %24, i32 -1, i32 %23
  br label %26

26:                                               ; preds = %4, %22
  %27 = phi i32 [ %25, %22 ], [ 0, %4 ]
  ret i32 %27
}

; Function Attrs: optsize
declare i64 @sendmsg(i32 noundef, %struct.msghdr* noundef, i32 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !9, i64 56}
!4 = !{!"mmsghdr", !5, i64 0, !9, i64 56}
!5 = !{!"msghdr", !6, i64 0, !9, i64 8, !6, i64 16, !9, i64 24, !9, i64 28, !6, i64 32, !9, i64 40, !9, i64 44, !9, i64 48}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
