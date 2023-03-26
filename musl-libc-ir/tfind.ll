; ModuleID = 'src/search/tfind.c'
source_filename = "src/search/tfind.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { i8*, [2 x i8*], i32 }

; Function Attrs: nounwind optsize strictfp
define i8* @tfind(i8* noundef %0, i8** noundef readonly %1, i32 (i8*, i8*)* nocapture noundef readonly %2) local_unnamed_addr #0 {
  %4 = icmp eq i8** %1, null
  br i1 %4, label %25, label %5

5:                                                ; preds = %3
  %6 = bitcast i8** %1 to %struct.node**
  %7 = load %struct.node*, %struct.node** %6, align 8, !tbaa !3
  %8 = icmp eq %struct.node* %7, null
  br i1 %8, label %22, label %9

9:                                                ; preds = %5, %15
  %10 = phi %struct.node* [ %20, %15 ], [ %7, %5 ]
  %11 = getelementptr inbounds %struct.node, %struct.node* %10, i64 0, i32 0
  %12 = load i8*, i8** %11, align 8, !tbaa !7
  %13 = tail call i32 %2(i8* noundef %0, i8* noundef %12) #1
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %22, label %15

15:                                               ; preds = %9
  %16 = icmp sgt i32 %13, 0
  %17 = zext i1 %16 to i64
  %18 = getelementptr inbounds %struct.node, %struct.node* %10, i64 0, i32 1, i64 %17
  %19 = bitcast i8** %18 to %struct.node**
  %20 = load %struct.node*, %struct.node** %19, align 8, !tbaa !3
  %21 = icmp eq %struct.node* %20, null
  br i1 %21, label %22, label %9

22:                                               ; preds = %15, %9, %5
  %23 = phi %struct.node* [ null, %5 ], [ %10, %9 ], [ null, %15 ]
  %24 = bitcast %struct.node* %23 to i8*
  br label %25

25:                                               ; preds = %3, %22
  %26 = phi i8* [ %24, %22 ], [ null, %3 ]
  ret i8* %26
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nobuiltin nounwind optsize strictfp "no-builtins" }

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
