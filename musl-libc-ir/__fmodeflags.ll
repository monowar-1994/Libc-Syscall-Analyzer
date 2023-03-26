; ModuleID = 'src/stdio/__fmodeflags.c'
source_filename = "src/stdio/__fmodeflags.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @__fmodeflags(i8* noundef %0) local_unnamed_addr #0 {
  %2 = tail call i8* @strchr(i8* noundef %0, i32 noundef 43) #2
  %3 = icmp eq i8* %2, null
  br i1 %3, label %4, label %8

4:                                                ; preds = %1
  %5 = load i8, i8* %0, align 1, !tbaa !3
  %6 = icmp ne i8 %5, 114
  %7 = zext i1 %6 to i32
  br label %8

8:                                                ; preds = %4, %1
  %9 = phi i32 [ 2, %1 ], [ %7, %4 ]
  %10 = tail call i8* @strchr(i8* noundef %0, i32 noundef 120) #2
  %11 = icmp eq i8* %10, null
  %12 = or i32 %9, 128
  %13 = select i1 %11, i32 %9, i32 %12
  %14 = tail call i8* @strchr(i8* noundef %0, i32 noundef 101) #2
  %15 = icmp eq i8* %14, null
  %16 = or i32 %13, 524288
  %17 = select i1 %15, i32 %13, i32 %16
  %18 = load i8, i8* %0, align 1, !tbaa !3
  %19 = icmp eq i8 %18, 114
  %20 = or i32 %17, 64
  %21 = select i1 %19, i32 %17, i32 %20
  %22 = icmp eq i8 %18, 119
  %23 = or i32 %21, 512
  %24 = select i1 %22, i32 %23, i32 %21
  %25 = icmp eq i8 %18, 97
  %26 = or i32 %24, 1024
  %27 = select i1 %25, i32 %26, i32 %24
  ret i32 %27
}

; Function Attrs: optsize
declare i8* @strchr(i8* noundef, i32 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
