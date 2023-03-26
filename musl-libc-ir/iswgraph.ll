; ModuleID = 'src/ctype/iswgraph.c'
source_filename = "src/ctype/iswgraph.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__locale_struct = type opaque

@iswgraph_l = weak alias i32 (i32, %struct.__locale_struct*), i32 (i32, %struct.__locale_struct*)* @__iswgraph_l

; Function Attrs: nounwind optsize strictfp
define i32 @iswgraph(i32 noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @iswspace(i32 noundef %0) #2
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %8

4:                                                ; preds = %1
  %5 = tail call i32 @iswprint(i32 noundef %0) #2
  %6 = icmp ne i32 %5, 0
  %7 = zext i1 %6 to i32
  br label %8

8:                                                ; preds = %4, %1
  %9 = phi i32 [ 0, %1 ], [ %7, %4 ]
  ret i32 %9
}

; Function Attrs: optsize
declare i32 @iswspace(i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @iswprint(i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i32 @__iswgraph_l(i32 noundef %0, %struct.__locale_struct* nocapture readnone %1) #0 {
  %3 = tail call i32 @iswgraph(i32 noundef %0) #3
  ret i32 %3
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #3 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
