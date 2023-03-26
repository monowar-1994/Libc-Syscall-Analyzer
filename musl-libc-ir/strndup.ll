; ModuleID = 'src/string/strndup.c'
source_filename = "src/string/strndup.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind strictfp
define i8* @strndup(i8* noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = tail call i64 @strnlen(i8* noundef %0, i64 noundef %1) #2
  %4 = add i64 %3, 1
  %5 = tail call i8* @malloc(i64 noundef %4) #2
  %6 = icmp eq i8* %5, null
  br i1 %6, label %10, label %7

7:                                                ; preds = %2
  %8 = tail call i8* @memcpy(i8* noundef nonnull %5, i8* noundef %0, i64 noundef %3) #2
  %9 = getelementptr inbounds i8, i8* %5, i64 %3
  store i8 0, i8* %9, align 1, !tbaa !3
  br label %10

10:                                               ; preds = %2, %7
  ret i8* %5
}

declare i64 @strnlen(i8* noundef, i64 noundef) local_unnamed_addr #1

declare i8* @malloc(i64 noundef) local_unnamed_addr #1

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
