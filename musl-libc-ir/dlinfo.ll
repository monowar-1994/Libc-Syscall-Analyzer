; ModuleID = 'src/ldso/dlinfo.c'
source_filename = "src/ldso/dlinfo.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"Unsupported request %d\00", align 1

; Function Attrs: nounwind optsize strictfp
define i32 @dlinfo(i8* noundef %0, i32 noundef %1, i8* nocapture noundef writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @__dl_invalid_handle(i8* noundef %0) #2
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %11

6:                                                ; preds = %3
  %7 = icmp eq i32 %1, 2
  br i1 %7, label %9, label %8

8:                                                ; preds = %6
  tail call void (i8*, ...) @__dl_seterr(i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0), i32 noundef %1) #2
  br label %11

9:                                                ; preds = %6
  %10 = bitcast i8* %2 to i8**
  store i8* %0, i8** %10, align 8, !tbaa !3
  br label %11

11:                                               ; preds = %3, %9, %8
  %12 = phi i32 [ -1, %8 ], [ 0, %9 ], [ -1, %3 ]
  ret i32 %12
}

; Function Attrs: optsize
declare hidden i32 @__dl_invalid_handle(i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__dl_seterr(i8* noundef, ...) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
