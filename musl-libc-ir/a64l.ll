; ModuleID = 'src/misc/a64l.c'
source_filename = "src/misc/a64l.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@digits = internal constant [65 x i8] c"./0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz\00", align 16
@l64a.s = internal global [7 x i8] zeroinitializer, align 1

; Function Attrs: nounwind optsize strictfp
define i64 @a64l(i8* nocapture noundef readonly %0) local_unnamed_addr #0 {
  br label %2

2:                                                ; preds = %1, %12
  %3 = phi i8* [ %0, %1 ], [ %19, %12 ]
  %4 = phi i32 [ 0, %1 ], [ %17, %12 ]
  %5 = phi i32 [ 0, %1 ], [ %18, %12 ]
  %6 = load i8, i8* %3, align 1, !tbaa !3
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %21, label %8

8:                                                ; preds = %2
  %9 = sext i8 %6 to i32
  %10 = tail call i8* @strchr(i8* noundef getelementptr inbounds ([65 x i8], [65 x i8]* @digits, i64 0, i64 0), i32 noundef %9) #3
  %11 = icmp eq i8* %10, null
  br i1 %11, label %21, label %12

12:                                               ; preds = %8
  %13 = ptrtoint i8* %10 to i64
  %14 = trunc i64 %13 to i32
  %15 = sub i32 %14, ptrtoint ([65 x i8]* @digits to i32)
  %16 = shl i32 %15, %5
  %17 = or i32 %16, %4
  %18 = add nuw nsw i32 %5, 6
  %19 = getelementptr inbounds i8, i8* %3, i64 1
  %20 = icmp ult i32 %5, 30
  br i1 %20, label %2, label %21

21:                                               ; preds = %8, %12, %2
  %22 = phi i32 [ %4, %8 ], [ %17, %12 ], [ %4, %2 ]
  %23 = sext i32 %22 to i64
  ret i64 %23
}

; Function Attrs: optsize
declare i8* @strchr(i8* noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nofree norecurse nosync nounwind optsize strictfp writeonly
define i8* @l64a(i64 noundef %0) local_unnamed_addr #2 {
  %2 = trunc i64 %0 to i32
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %14, label %4

4:                                                ; preds = %1, %4
  %5 = phi i32 [ %12, %4 ], [ %2, %1 ]
  %6 = phi i8* [ %11, %4 ], [ getelementptr inbounds ([7 x i8], [7 x i8]* @l64a.s, i64 0, i64 0), %1 ]
  %7 = and i32 %5, 63
  %8 = zext i32 %7 to i64
  %9 = getelementptr inbounds [65 x i8], [65 x i8]* @digits, i64 0, i64 %8
  %10 = load i8, i8* %9, align 1, !tbaa !3
  store i8 %10, i8* %6, align 1, !tbaa !3
  %11 = getelementptr inbounds i8, i8* %6, i64 1
  %12 = lshr i32 %5, 6
  %13 = icmp ult i32 %5, 64
  br i1 %13, label %14, label %4

14:                                               ; preds = %4, %1
  %15 = phi i8* [ getelementptr inbounds ([7 x i8], [7 x i8]* @l64a.s, i64 0, i64 0), %1 ], [ %11, %4 ]
  store i8 0, i8* %15, align 1, !tbaa !3
  ret i8* getelementptr inbounds ([7 x i8], [7 x i8]* @l64a.s, i64 0, i64 0)
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree norecurse nosync nounwind optsize strictfp writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
