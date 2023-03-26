; ModuleID = 'src/string/strtok_r.c'
source_filename = "src/string/strtok_r.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind strictfp
define i8* @strtok_r(i8* noalias noundef %0, i8* noalias noundef %1, i8** noalias nocapture noundef %2) local_unnamed_addr #0 {
  %4 = icmp eq i8* %0, null
  br i1 %4, label %5, label %8

5:                                                ; preds = %3
  %6 = load i8*, i8** %2, align 8, !tbaa !3
  %7 = icmp eq i8* %6, null
  br i1 %7, label %23, label %8

8:                                                ; preds = %5, %3
  %9 = phi i8* [ %0, %3 ], [ %6, %5 ]
  %10 = tail call i64 @strspn(i8* noundef nonnull %9, i8* noundef %1) #2
  %11 = getelementptr inbounds i8, i8* %9, i64 %10
  %12 = load i8, i8* %11, align 1, !tbaa !7
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %8
  store i8* null, i8** %2, align 8, !tbaa !3
  br label %23

15:                                               ; preds = %8
  %16 = tail call i64 @strcspn(i8* noundef nonnull %11, i8* noundef %1) #2
  %17 = getelementptr inbounds i8, i8* %11, i64 %16
  %18 = load i8, i8* %17, align 1, !tbaa !7
  %19 = icmp eq i8 %18, 0
  br i1 %19, label %22, label %20

20:                                               ; preds = %15
  %21 = getelementptr inbounds i8, i8* %17, i64 1
  store i8* %21, i8** %2, align 8, !tbaa !3
  store i8 0, i8* %17, align 1, !tbaa !7
  br label %23

22:                                               ; preds = %15
  store i8* null, i8** %2, align 8, !tbaa !3
  br label %23

23:                                               ; preds = %20, %22, %5, %14
  %24 = phi i8* [ null, %14 ], [ null, %5 ], [ %11, %22 ], [ %11, %20 ]
  ret i8* %24
}

declare i64 @strspn(i8* noundef, i8* noundef) local_unnamed_addr #1

declare i64 @strcspn(i8* noundef, i8* noundef) local_unnamed_addr #1

attributes #0 = { nounwind strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!5, !5, i64 0}
