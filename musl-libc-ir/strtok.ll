; ModuleID = 'src/string/strtok.c'
source_filename = "src/string/strtok.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@strtok.p = internal unnamed_addr global i8* null, align 8

; Function Attrs: nounwind strictfp
define i8* @strtok(i8* noalias noundef %0, i8* noalias noundef %1) local_unnamed_addr #0 {
  %3 = icmp eq i8* %0, null
  br i1 %3, label %4, label %7

4:                                                ; preds = %2
  %5 = load i8*, i8** @strtok.p, align 8, !tbaa !3
  %6 = icmp eq i8* %5, null
  br i1 %6, label %22, label %7

7:                                                ; preds = %4, %2
  %8 = phi i8* [ %0, %2 ], [ %5, %4 ]
  %9 = tail call i64 @strspn(i8* noundef nonnull %8, i8* noundef %1) #2
  %10 = getelementptr inbounds i8, i8* %8, i64 %9
  %11 = load i8, i8* %10, align 1, !tbaa !7
  %12 = icmp eq i8 %11, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %7
  store i8* null, i8** @strtok.p, align 8, !tbaa !3
  br label %22

14:                                               ; preds = %7
  %15 = tail call i64 @strcspn(i8* noundef nonnull %10, i8* noundef %1) #2
  %16 = getelementptr inbounds i8, i8* %10, i64 %15
  %17 = load i8, i8* %16, align 1, !tbaa !7
  %18 = icmp eq i8 %17, 0
  br i1 %18, label %21, label %19

19:                                               ; preds = %14
  %20 = getelementptr inbounds i8, i8* %16, i64 1
  store i8* %20, i8** @strtok.p, align 8, !tbaa !3
  store i8 0, i8* %16, align 1, !tbaa !7
  br label %22

21:                                               ; preds = %14
  store i8* null, i8** @strtok.p, align 8, !tbaa !3
  br label %22

22:                                               ; preds = %19, %21, %4, %13
  %23 = phi i8* [ null, %13 ], [ null, %4 ], [ %10, %21 ], [ %10, %19 ]
  ret i8* %23
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
