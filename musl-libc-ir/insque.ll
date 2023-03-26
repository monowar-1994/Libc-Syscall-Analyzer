; ModuleID = 'src/search/insque.c'
source_filename = "src/search/insque.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { %struct.node*, %struct.node* }

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define void @insque(i8* noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = icmp eq i8* %1, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  %5 = bitcast i8* %0 to <2 x %struct.node*>*
  store <2 x %struct.node*> zeroinitializer, <2 x %struct.node*>* %5, align 8, !tbaa !3
  br label %18

6:                                                ; preds = %2
  %7 = bitcast i8* %1 to %struct.node**
  %8 = load %struct.node*, %struct.node** %7, align 8, !tbaa !7
  %9 = bitcast i8* %0 to %struct.node**
  store %struct.node* %8, %struct.node** %9, align 8, !tbaa !7
  %10 = getelementptr inbounds i8, i8* %0, i64 8
  %11 = bitcast i8* %10 to i8**
  store i8* %1, i8** %11, align 8, !tbaa !9
  %12 = bitcast i8* %1 to i8**
  store i8* %0, i8** %12, align 8, !tbaa !7
  %13 = load %struct.node*, %struct.node** %9, align 8, !tbaa !7
  %14 = icmp eq %struct.node* %13, null
  br i1 %14, label %18, label %15

15:                                               ; preds = %6
  %16 = getelementptr inbounds %struct.node, %struct.node* %13, i64 0, i32 1
  %17 = bitcast %struct.node** %16 to i8**
  store i8* %0, i8** %17, align 8, !tbaa !9
  br label %18

18:                                               ; preds = %6, %15, %4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define void @remque(i8* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = bitcast i8* %0 to %struct.node**
  %3 = load %struct.node*, %struct.node** %2, align 8, !tbaa !7
  %4 = icmp eq %struct.node* %3, null
  br i1 %4, label %10, label %5

5:                                                ; preds = %1
  %6 = getelementptr inbounds i8, i8* %0, i64 8
  %7 = bitcast i8* %6 to %struct.node**
  %8 = load %struct.node*, %struct.node** %7, align 8, !tbaa !9
  %9 = getelementptr inbounds %struct.node, %struct.node* %3, i64 0, i32 1
  store %struct.node* %8, %struct.node** %9, align 8, !tbaa !9
  br label %10

10:                                               ; preds = %1, %5
  %11 = getelementptr inbounds i8, i8* %0, i64 8
  %12 = bitcast i8* %11 to %struct.node**
  %13 = load %struct.node*, %struct.node** %12, align 8, !tbaa !9
  %14 = icmp eq %struct.node* %13, null
  br i1 %14, label %17, label %15

15:                                               ; preds = %10
  %16 = getelementptr inbounds %struct.node, %struct.node* %13, i64 0, i32 0
  store %struct.node* %3, %struct.node** %16, align 8, !tbaa !7
  br label %17

17:                                               ; preds = %15, %10
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
!8 = !{!"node", !4, i64 0, !4, i64 8}
!9 = !{!8, !4, i64 8}
