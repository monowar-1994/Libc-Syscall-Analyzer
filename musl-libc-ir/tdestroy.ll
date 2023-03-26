; ModuleID = 'src/search/tdestroy.c'
source_filename = "src/search/tdestroy.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define void @tdestroy(i8* noundef %0, void (i8*)* noundef %1) local_unnamed_addr #0 {
  %3 = icmp eq i8* %0, null
  br i1 %3, label %16, label %4

4:                                                ; preds = %2
  %5 = getelementptr inbounds i8, i8* %0, i64 8
  %6 = bitcast i8* %5 to i8**
  %7 = load i8*, i8** %6, align 8, !tbaa !3
  tail call void @tdestroy(i8* noundef %7, void (i8*)* noundef %1) #2
  %8 = getelementptr inbounds i8, i8* %0, i64 16
  %9 = bitcast i8* %8 to i8**
  %10 = load i8*, i8** %9, align 8, !tbaa !3
  tail call void @tdestroy(i8* noundef %10, void (i8*)* noundef %1) #2
  %11 = icmp eq void (i8*)* %1, null
  br i1 %11, label %15, label %12

12:                                               ; preds = %4
  %13 = bitcast i8* %0 to i8**
  %14 = load i8*, i8** %13, align 8, !tbaa !7
  tail call void %1(i8* noundef %14) #3
  br label %15

15:                                               ; preds = %12, %4
  tail call void @free(i8* noundef nonnull %0) #3
  br label %16

16:                                               ; preds = %2, %15
  ret void
}

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin optsize strictfp "no-builtins" }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !4, i64 0}
!8 = !{!"node", !4, i64 0, !5, i64 8, !9, i64 24}
!9 = !{!"int", !5, i64 0}
