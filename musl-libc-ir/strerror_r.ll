; ModuleID = 'src/string/strerror_r.c'
source_filename = "src/string/strerror_r.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__xpg_strerror_r = weak alias i32 (i32, i8*, i64), i32 (i32, i8*, i64)* @strerror_r

; Function Attrs: nounwind strictfp
define i32 @strerror_r(i32 noundef %0, i8* noundef %1, i64 noundef %2) #0 {
  %4 = tail call i8* @strerror(i32 noundef %0) #2
  %5 = tail call i64 @strlen(i8* noundef %4) #2
  %6 = icmp ult i64 %5, %2
  br i1 %6, label %13, label %7

7:                                                ; preds = %3
  %8 = icmp eq i64 %2, 0
  br i1 %8, label %16, label %9

9:                                                ; preds = %7
  %10 = add i64 %2, -1
  %11 = tail call i8* @memcpy(i8* noundef %1, i8* noundef %4, i64 noundef %10) #2
  %12 = getelementptr inbounds i8, i8* %1, i64 %10
  store i8 0, i8* %12, align 1, !tbaa !3
  br label %16

13:                                               ; preds = %3
  %14 = add nuw i64 %5, 1
  %15 = tail call i8* @memcpy(i8* noundef %1, i8* noundef %4, i64 noundef %14) #2
  br label %16

16:                                               ; preds = %7, %9, %13
  %17 = phi i32 [ 0, %13 ], [ 34, %9 ], [ 34, %7 ]
  ret i32 %17
}

declare i8* @strerror(i32 noundef) local_unnamed_addr #1

declare i64 @strlen(i8* noundef) local_unnamed_addr #1

declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

attributes #0 = { nounwind strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
