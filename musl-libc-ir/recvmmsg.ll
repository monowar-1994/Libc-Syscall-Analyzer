; ModuleID = 'src/network/recvmmsg.c'
source_filename = "src/network/recvmmsg.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.mmsghdr = type { %struct.msghdr, i32 }
%struct.msghdr = type { i8*, i32, %struct.iovec*, i32, i32, i8*, i32, i32, i32 }
%struct.iovec = type { i8*, i64 }
%struct.timespec = type { i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @recvmmsg(i32 noundef %0, %struct.mmsghdr* noundef %1, i32 noundef %2, i32 noundef %3, %struct.timespec* noundef %4) local_unnamed_addr #0 {
  %6 = icmp eq i32 %2, 0
  br i1 %6, label %15, label %7

7:                                                ; preds = %5, %7
  %8 = phi i32 [ %12, %7 ], [ %2, %5 ]
  %9 = phi %struct.mmsghdr* [ %13, %7 ], [ %1, %5 ]
  %10 = getelementptr inbounds %struct.mmsghdr, %struct.mmsghdr* %9, i64 0, i32 0, i32 7
  store i32 0, i32* %10, align 4, !tbaa !3
  %11 = getelementptr inbounds %struct.mmsghdr, %struct.mmsghdr* %9, i64 0, i32 0, i32 4
  store i32 0, i32* %11, align 4, !tbaa !10
  %12 = add i32 %8, -1
  %13 = getelementptr inbounds %struct.mmsghdr, %struct.mmsghdr* %9, i64 1
  %14 = icmp eq i32 %12, 0
  br i1 %14, label %15, label %7

15:                                               ; preds = %7, %5
  %16 = sext i32 %0 to i64
  %17 = ptrtoint %struct.mmsghdr* %1 to i64
  %18 = zext i32 %2 to i64
  %19 = zext i32 %3 to i64
  %20 = ptrtoint %struct.timespec* %4 to i64
  %21 = tail call i64 @__syscall_cp(i64 noundef 299, i64 noundef %16, i64 noundef %17, i64 noundef %18, i64 noundef %19, i64 noundef %20, i64 noundef 0) #2
  %22 = tail call i64 @__syscall_ret(i64 noundef %21) #2
  %23 = trunc i64 %22 to i32
  ret i32 %23
}

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i64 @__syscall_cp(i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !9, i64 44}
!4 = !{!"mmsghdr", !5, i64 0, !9, i64 56}
!5 = !{!"msghdr", !6, i64 0, !9, i64 8, !6, i64 16, !9, i64 24, !9, i64 28, !6, i64 32, !9, i64 40, !9, i64 44, !9, i64 48}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!4, !9, i64 28}
