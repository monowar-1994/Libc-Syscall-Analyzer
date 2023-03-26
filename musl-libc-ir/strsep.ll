; ModuleID = 'src/string/strsep.c'
source_filename = "src/string/strsep.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind strictfp
define i8* @strsep(i8** nocapture noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = load i8*, i8** %0, align 8, !tbaa !3
  %4 = icmp eq i8* %3, null
  br i1 %4, label %14, label %5

5:                                                ; preds = %2
  %6 = tail call i64 @strcspn(i8* noundef nonnull %3, i8* noundef %1) #2
  %7 = getelementptr inbounds i8, i8* %3, i64 %6
  %8 = load i8, i8* %7, align 1, !tbaa !7
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %12, label %10

10:                                               ; preds = %5
  %11 = getelementptr inbounds i8, i8* %7, i64 1
  store i8 0, i8* %7, align 1, !tbaa !7
  br label %12

12:                                               ; preds = %5, %10
  %13 = phi i8* [ %11, %10 ], [ null, %5 ]
  store i8* %13, i8** %0, align 8, !tbaa !3
  br label %14

14:                                               ; preds = %2, %12
  ret i8* %3
}

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
