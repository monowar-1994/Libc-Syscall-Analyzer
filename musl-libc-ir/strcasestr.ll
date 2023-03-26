; ModuleID = 'src/string/strcasestr.c'
source_filename = "src/string/strcasestr.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind strictfp
define i8* @strcasestr(i8* noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = tail call i64 @strlen(i8* noundef %1) #2
  %4 = load i8, i8* %0, align 1, !tbaa !3
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %14, label %6

6:                                                ; preds = %2, %10
  %7 = phi i8* [ %11, %10 ], [ %0, %2 ]
  %8 = tail call i32 @strncasecmp(i8* noundef nonnull %7, i8* noundef %1, i64 noundef %3) #2
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %14, label %10

10:                                               ; preds = %6
  %11 = getelementptr inbounds i8, i8* %7, i64 1
  %12 = load i8, i8* %11, align 1, !tbaa !3
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %14, label %6

14:                                               ; preds = %6, %10, %2
  %15 = phi i8* [ null, %2 ], [ null, %10 ], [ %7, %6 ]
  ret i8* %15
}

declare i64 @strlen(i8* noundef) local_unnamed_addr #1

declare i32 @strncasecmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

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
