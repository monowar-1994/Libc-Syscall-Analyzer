; ModuleID = 'src/ctype/iswalnum.c'
source_filename = "src/ctype/iswalnum.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__locale_struct = type opaque

@iswalnum_l = weak alias i32 (i32, %struct.__locale_struct*), i32 (i32, %struct.__locale_struct*)* @__iswalnum_l

; Function Attrs: nounwind optsize strictfp
define i32 @iswalnum(i32 noundef %0) local_unnamed_addr #0 {
  %2 = add i32 %0, -48
  %3 = icmp ult i32 %2, 10
  br i1 %3, label %8, label %4

4:                                                ; preds = %1
  %5 = tail call i32 @iswalpha(i32 noundef %0) #2
  %6 = icmp ne i32 %5, 0
  %7 = zext i1 %6 to i32
  br label %8

8:                                                ; preds = %4, %1
  %9 = phi i32 [ 1, %1 ], [ %7, %4 ]
  ret i32 %9
}

; Function Attrs: optsize
declare i32 @iswalpha(i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i32 @__iswalnum_l(i32 noundef %0, %struct.__locale_struct* nocapture readnone %1) #0 {
  %3 = add i32 %0, -48
  %4 = icmp ult i32 %3, 10
  br i1 %4, label %9, label %5

5:                                                ; preds = %2
  %6 = tail call i32 @iswalpha(i32 noundef %0) #2
  %7 = icmp ne i32 %6, 0
  %8 = zext i1 %7 to i32
  br label %9

9:                                                ; preds = %2, %5
  %10 = phi i32 [ 1, %2 ], [ %8, %5 ]
  ret i32 %10
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
