; ModuleID = 'src/unistd/getlogin_r.c'
source_filename = "src/unistd/getlogin_r.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @getlogin_r(i8* noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = tail call i8* @getlogin() #2
  %4 = icmp eq i8* %3, null
  br i1 %4, label %10, label %5

5:                                                ; preds = %2
  %6 = tail call i64 @strlen(i8* noundef nonnull %3) #2
  %7 = icmp ult i64 %6, %1
  br i1 %7, label %8, label %10

8:                                                ; preds = %5
  %9 = tail call i8* @strcpy(i8* noundef %0, i8* noundef nonnull %3) #2
  br label %10

10:                                               ; preds = %5, %2, %8
  %11 = phi i32 [ 0, %8 ], [ 6, %2 ], [ 34, %5 ]
  ret i32 %11
}

; Function Attrs: optsize
declare i8* @getlogin() local_unnamed_addr #1

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @strcpy(i8* noundef, i8* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
