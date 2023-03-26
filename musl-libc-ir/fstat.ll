; ModuleID = 'src/stat/fstat.c'
source_filename = "src/stat/fstat.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

@fstat64 = weak alias i32 (i32, %struct.stat*), i32 (i32, %struct.stat*)* @fstat

; Function Attrs: nounwind optsize strictfp
define i32 @fstat(i32 noundef %0, %struct.stat* noundef %1) #0 {
  %3 = icmp slt i32 %0, 0
  br i1 %3, label %4, label %7

4:                                                ; preds = %2
  %5 = tail call i64 @__syscall_ret(i64 noundef -9) #2
  %6 = trunc i64 %5 to i32
  br label %9

7:                                                ; preds = %2
  %8 = tail call i32 @fstatat(i32 noundef %0, i8* noundef getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i64 0, i64 0), %struct.stat* noundef %1, i32 noundef 4096) #2
  br label %9

9:                                                ; preds = %7, %4
  %10 = phi i32 [ %6, %4 ], [ %8, %7 ]
  ret i32 %10
}

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @fstatat(i32 noundef, i8* noundef, %struct.stat* noundef, i32 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
