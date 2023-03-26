; ModuleID = 'src/linux/ppoll.c'
source_filename = "src/linux/ppoll.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pollfd = type { i32, i16, i16 }
%struct.timespec = type { i64, i64 }
%struct.__sigset_t = type { [16 x i64] }

; Function Attrs: nounwind optsize strictfp
define i32 @ppoll(%struct.pollfd* noundef %0, i64 noundef %1, %struct.timespec* noundef readonly %2, %struct.__sigset_t* noundef %3) local_unnamed_addr #0 {
  %5 = alloca <2 x i64>, align 16
  %6 = icmp eq %struct.timespec* %2, null
  br i1 %6, label %11, label %7

7:                                                ; preds = %4
  %8 = bitcast %struct.timespec* %2 to <2 x i64>*
  %9 = load <2 x i64>, <2 x i64>* %8, align 8, !tbaa !3
  store <2 x i64> %9, <2 x i64>* %5, align 16, !tbaa !3
  %10 = ptrtoint <2 x i64>* %5 to i64
  br label %11

11:                                               ; preds = %4, %7
  %12 = phi i64 [ %10, %7 ], [ 0, %4 ]
  %13 = ptrtoint %struct.pollfd* %0 to i64
  %14 = ptrtoint %struct.__sigset_t* %3 to i64
  %15 = call i64 @__syscall_cp(i64 noundef 271, i64 noundef %13, i64 noundef %1, i64 noundef %12, i64 noundef %14, i64 noundef 8, i64 noundef 0) #2
  %16 = call i64 @__syscall_ret(i64 noundef %15) #2
  %17 = trunc i64 %16 to i32
  ret i32 %17
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
!3 = !{!4, !4, i64 0}
!4 = !{!"long", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
