; ModuleID = 'src/internal/procfdname.c'
source_filename = "src/internal/procfdname.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind strictfp writeonly
define hidden void @__procfdname(i8* nocapture noundef writeonly %0, i32 noundef %1) local_unnamed_addr #0 {
  store i8 47, i8* %0, align 1, !tbaa !3
  %3 = getelementptr inbounds i8, i8* %0, i64 1
  store i8 112, i8* %3, align 1, !tbaa !3
  %4 = getelementptr inbounds i8, i8* %0, i64 2
  store i8 114, i8* %4, align 1, !tbaa !3
  %5 = getelementptr inbounds i8, i8* %0, i64 3
  store i8 111, i8* %5, align 1, !tbaa !3
  %6 = getelementptr inbounds i8, i8* %0, i64 4
  store i8 99, i8* %6, align 1, !tbaa !3
  %7 = getelementptr inbounds i8, i8* %0, i64 5
  store i8 47, i8* %7, align 1, !tbaa !3
  %8 = getelementptr inbounds i8, i8* %0, i64 6
  store i8 115, i8* %8, align 1, !tbaa !3
  %9 = getelementptr inbounds i8, i8* %0, i64 7
  store i8 101, i8* %9, align 1, !tbaa !3
  %10 = getelementptr inbounds i8, i8* %0, i64 8
  store i8 108, i8* %10, align 1, !tbaa !3
  %11 = getelementptr inbounds i8, i8* %0, i64 9
  store i8 102, i8* %11, align 1, !tbaa !3
  %12 = getelementptr inbounds i8, i8* %0, i64 10
  store i8 47, i8* %12, align 1, !tbaa !3
  %13 = getelementptr inbounds i8, i8* %0, i64 11
  store i8 102, i8* %13, align 1, !tbaa !3
  %14 = getelementptr inbounds i8, i8* %0, i64 12
  store i8 100, i8* %14, align 1, !tbaa !3
  %15 = getelementptr inbounds i8, i8* %0, i64 13
  store i8 47, i8* %15, align 1, !tbaa !3
  %16 = getelementptr inbounds i8, i8* %0, i64 14
  store i8 0, i8* %16, align 1, !tbaa !3
  %17 = icmp eq i32 %1, 0
  br i1 %17, label %18, label %20

18:                                               ; preds = %2
  store i8 48, i8* %16, align 1, !tbaa !3
  %19 = getelementptr inbounds i8, i8* %0, i64 15
  store i8 0, i8* %19, align 1, !tbaa !3
  br label %40

20:                                               ; preds = %2, %20
  %21 = phi i32 [ %23, %20 ], [ %1, %2 ]
  %22 = phi i32 [ %24, %20 ], [ 14, %2 ]
  %23 = udiv i32 %21, 10
  %24 = add i32 %22, 1
  %25 = icmp ult i32 %21, 10
  br i1 %25, label %26, label %20

26:                                               ; preds = %20
  %27 = zext i32 %24 to i64
  %28 = getelementptr inbounds i8, i8* %0, i64 %27
  store i8 0, i8* %28, align 1, !tbaa !3
  br label %29

29:                                               ; preds = %26, %29
  %30 = phi i32 [ %35, %29 ], [ %24, %26 ]
  %31 = phi i32 [ %38, %29 ], [ %1, %26 ]
  %32 = urem i32 %31, 10
  %33 = trunc i32 %32 to i8
  %34 = or i8 %33, 48
  %35 = add i32 %30, -1
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds i8, i8* %0, i64 %36
  store i8 %34, i8* %37, align 1, !tbaa !3
  %38 = udiv i32 %31, 10
  %39 = icmp ult i32 %31, 10
  br i1 %39, label %40, label %29

40:                                               ; preds = %29, %18
  ret void
}

attributes #0 = { nofree norecurse nosync nounwind strictfp writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
