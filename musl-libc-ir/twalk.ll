; ModuleID = 'src/search/twalk.c'
source_filename = "src/search/twalk.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { i8*, [2 x i8*], i32 }

; Function Attrs: nounwind optsize strictfp
define void @twalk(i8* noundef %0, void (i8*, i32, i32)* noundef %1) local_unnamed_addr #0 {
  %3 = bitcast i8* %0 to %struct.node*
  tail call fastcc void @walk(%struct.node* noundef %3, void (i8*, i32, i32)* noundef %1, i32 noundef 0) #1
  ret void
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @walk(%struct.node* noundef %0, void (i8*, i32, i32)* noundef %1, i32 noundef %2) unnamed_addr #0 {
  %4 = icmp eq %struct.node* %0, null
  br i1 %4, label %12, label %5

5:                                                ; preds = %3
  %6 = getelementptr inbounds %struct.node, %struct.node* %0, i64 0, i32 2
  %7 = load i32, i32* %6, align 8, !tbaa !3
  %8 = icmp eq i32 %7, 1
  %9 = bitcast %struct.node* %0 to i8*
  br i1 %8, label %10, label %13

10:                                               ; preds = %5, %13
  %11 = phi i32 [ 2, %13 ], [ 3, %5 ]
  tail call void %1(i8* noundef nonnull %9, i32 noundef %11, i32 noundef %2) #2
  br label %12

12:                                               ; preds = %10, %3
  ret void

13:                                               ; preds = %5
  tail call void %1(i8* noundef nonnull %9, i32 noundef 0, i32 noundef %2) #2
  %14 = getelementptr inbounds %struct.node, %struct.node* %0, i64 0, i32 1
  %15 = bitcast [2 x i8*]* %14 to %struct.node**
  %16 = load %struct.node*, %struct.node** %15, align 8, !tbaa !9
  %17 = add nsw i32 %2, 1
  tail call fastcc void @walk(%struct.node* noundef %16, void (i8*, i32, i32)* noundef %1, i32 noundef %17) #1
  tail call void %1(i8* noundef nonnull %9, i32 noundef 1, i32 noundef %2) #2
  %18 = getelementptr inbounds %struct.node, %struct.node* %0, i64 0, i32 1, i64 1
  %19 = bitcast i8** %18 to %struct.node**
  %20 = load %struct.node*, %struct.node** %19, align 8, !tbaa !9
  tail call fastcc void @walk(%struct.node* noundef %20, void (i8*, i32, i32)* noundef %1, i32 noundef %17) #1
  br label %10
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nobuiltin optsize strictfp "no-builtins" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !8, i64 24}
!4 = !{!"node", !5, i64 0, !6, i64 8, !8, i64 24}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"int", !6, i64 0}
!9 = !{!5, !5, i64 0}
