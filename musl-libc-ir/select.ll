; ModuleID = 'src/select/select.c'
source_filename = "src/select/select.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.fd_set = type { [16 x i64] }
%struct.timeval = type { i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @select(i32 noundef %0, %struct.fd_set* noalias noundef %1, %struct.fd_set* noalias noundef %2, %struct.fd_set* noalias noundef %3, %struct.timeval* noalias noundef readonly %4) local_unnamed_addr #0 {
  %6 = alloca [2 x i64], align 8
  %7 = icmp eq %struct.timeval* %4, null
  br i1 %7, label %13, label %8

8:                                                ; preds = %5
  %9 = getelementptr inbounds %struct.timeval, %struct.timeval* %4, i64 0, i32 0
  %10 = load i64, i64* %9, align 8, !tbaa !3
  %11 = getelementptr inbounds %struct.timeval, %struct.timeval* %4, i64 0, i32 1
  %12 = load i64, i64* %11, align 8, !tbaa !8
  br label %13

13:                                               ; preds = %5, %8
  %14 = phi i64 [ %10, %8 ], [ 0, %5 ]
  %15 = phi i64 [ %12, %8 ], [ 0, %5 ]
  %16 = icmp slt i64 %14, 0
  %17 = icmp slt i64 %15, 0
  %18 = select i1 %16, i1 true, i1 %17
  br i1 %18, label %19, label %21

19:                                               ; preds = %13
  %20 = tail call i64 @__syscall_ret(i64 noundef -22) #2
  br label %41

21:                                               ; preds = %13
  %22 = udiv i64 %15, 1000000
  %23 = urem i64 %15, 1000000
  %24 = sub nuw nsw i64 9223372036854775807, %14
  %25 = icmp ugt i64 %22, %24
  %26 = add nuw nsw i64 %22, %14
  %27 = select i1 %25, i64 9223372036854775807, i64 %26
  %28 = select i1 %25, i64 999999, i64 %23
  %29 = sext i32 %0 to i64
  %30 = ptrtoint %struct.fd_set* %1 to i64
  %31 = ptrtoint %struct.fd_set* %2 to i64
  %32 = ptrtoint %struct.fd_set* %3 to i64
  br i1 %7, label %37, label %33

33:                                               ; preds = %21
  %34 = getelementptr inbounds [2 x i64], [2 x i64]* %6, i64 0, i64 0
  store i64 %27, i64* %34, align 8, !tbaa !9
  %35 = getelementptr inbounds [2 x i64], [2 x i64]* %6, i64 0, i64 1
  store i64 %28, i64* %35, align 8, !tbaa !9
  %36 = ptrtoint [2 x i64]* %6 to i64
  br label %37

37:                                               ; preds = %21, %33
  %38 = phi i64 [ %36, %33 ], [ 0, %21 ]
  %39 = call i64 @__syscall_cp(i64 noundef 23, i64 noundef %29, i64 noundef %30, i64 noundef %31, i64 noundef %32, i64 noundef %38, i64 noundef 0) #2
  %40 = call i64 @__syscall_ret(i64 noundef %39) #2
  br label %41

41:                                               ; preds = %37, %19
  %42 = phi i64 [ %20, %19 ], [ %40, %37 ]
  %43 = trunc i64 %42 to i32
  ret i32 %43
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
!3 = !{!4, !5, i64 0}
!4 = !{!"timeval", !5, i64 0, !5, i64 8}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!4, !5, i64 8}
!9 = !{!5, !5, i64 0}
