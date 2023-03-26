; ModuleID = 'src/time/ctime.c'
source_filename = "src/time/ctime.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }

; Function Attrs: nounwind optsize strictfp
define i8* @ctime(i64* noundef %0) local_unnamed_addr #0 {
  %2 = tail call %struct.tm* @localtime(i64* noundef %0) #2
  %3 = icmp eq %struct.tm* %2, null
  br i1 %3, label %6, label %4

4:                                                ; preds = %1
  %5 = tail call i8* @asctime(%struct.tm* noundef nonnull %2) #2
  br label %6

6:                                                ; preds = %1, %4
  %7 = phi i8* [ %5, %4 ], [ null, %1 ]
  ret i8* %7
}

; Function Attrs: optsize
declare %struct.tm* @localtime(i64* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @asctime(%struct.tm* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
