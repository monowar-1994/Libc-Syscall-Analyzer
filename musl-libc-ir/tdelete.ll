; ModuleID = 'src/search/tdelete.c'
source_filename = "src/search/tdelete.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { i8*, [2 x i8*], i32 }

; Function Attrs: nounwind optsize strictfp
define i8* @tdelete(i8* noalias noundef %0, i8** noalias noundef %1, i32 (i8*, i8*)* nocapture noundef readonly %2) local_unnamed_addr #0 {
  %4 = alloca [97 x i8**], align 16
  %5 = icmp eq i8** %1, null
  br i1 %5, label %96, label %6

6:                                                ; preds = %3
  %7 = bitcast [97 x i8**]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 776, i8* nonnull %7) #3
  %8 = bitcast i8** %1 to %struct.node**
  %9 = load %struct.node*, %struct.node** %8, align 8, !tbaa !3
  %10 = getelementptr inbounds [97 x i8**], [97 x i8**]* %4, i64 0, i64 0
  store i8** %1, i8*** %10, align 16, !tbaa !3
  %11 = getelementptr inbounds [97 x i8**], [97 x i8**]* %4, i64 0, i64 1
  store i8** %1, i8*** %11, align 8, !tbaa !3
  %12 = icmp eq %struct.node* %9, null
  br i1 %12, label %94, label %13

13:                                               ; preds = %6, %20
  %14 = phi i64 [ %24, %20 ], [ 2, %6 ]
  %15 = phi %struct.node* [ %27, %20 ], [ %9, %6 ]
  %16 = getelementptr inbounds %struct.node, %struct.node* %15, i64 0, i32 0
  %17 = load i8*, i8** %16, align 8, !tbaa !7
  %18 = tail call i32 %2(i8* noundef %0, i8* noundef %17) #4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %29, label %20

20:                                               ; preds = %13
  %21 = icmp sgt i32 %18, 0
  %22 = zext i1 %21 to i64
  %23 = getelementptr inbounds %struct.node, %struct.node* %15, i64 0, i32 1, i64 %22
  %24 = add nuw i64 %14, 1
  %25 = getelementptr inbounds [97 x i8**], [97 x i8**]* %4, i64 0, i64 %14
  store i8** %23, i8*** %25, align 8, !tbaa !3
  %26 = bitcast i8** %23 to %struct.node**
  %27 = load %struct.node*, %struct.node** %26, align 8, !tbaa !3
  %28 = icmp eq %struct.node* %27, null
  br i1 %28, label %94, label %13

29:                                               ; preds = %13
  %30 = getelementptr inbounds %struct.node, %struct.node* %15, i64 0, i32 0
  %31 = trunc i64 %14 to i32
  %32 = shl i64 %14, 32
  %33 = add i64 %32, -8589934592
  %34 = ashr exact i64 %33, 32
  %35 = getelementptr inbounds [97 x i8**], [97 x i8**]* %4, i64 0, i64 %34
  %36 = load i8**, i8*** %35, align 8, !tbaa !3
  %37 = load i8*, i8** %36, align 8, !tbaa !3
  %38 = getelementptr inbounds %struct.node, %struct.node* %15, i64 0, i32 1, i64 0
  %39 = load i8*, i8** %38, align 8, !tbaa !3
  %40 = icmp eq i8* %39, null
  br i1 %40, label %70, label %41

41:                                               ; preds = %29
  %42 = bitcast i8* %39 to %struct.node*
  %43 = and i64 %14, 4294967295
  %44 = getelementptr inbounds [97 x i8**], [97 x i8**]* %4, i64 0, i64 %43
  store i8** %38, i8*** %44, align 8, !tbaa !3
  %45 = add i32 %31, 1
  %46 = getelementptr inbounds i8, i8* %39, i64 16
  %47 = bitcast i8* %46 to i8**
  %48 = load i8*, i8** %47, align 8, !tbaa !3
  %49 = icmp eq i8* %48, null
  br i1 %49, label %64, label %50

50:                                               ; preds = %41
  %51 = zext i32 %45 to i64
  br label %52

52:                                               ; preds = %50, %52
  %53 = phi i64 [ %51, %50 ], [ %58, %52 ]
  %54 = phi i8** [ %47, %50 ], [ %59, %52 ]
  %55 = getelementptr inbounds [97 x i8**], [97 x i8**]* %4, i64 0, i64 %53
  store i8** %54, i8*** %55, align 8, !tbaa !3
  %56 = bitcast i8** %54 to %struct.node**
  %57 = load %struct.node*, %struct.node** %56, align 8, !tbaa !3
  %58 = add nuw i64 %53, 1
  %59 = getelementptr inbounds %struct.node, %struct.node* %57, i64 0, i32 1, i64 1
  %60 = load i8*, i8** %59, align 8, !tbaa !3
  %61 = icmp eq i8* %60, null
  br i1 %61, label %62, label %52

62:                                               ; preds = %52
  %63 = trunc i64 %58 to i32
  br label %64

64:                                               ; preds = %62, %41
  %65 = phi %struct.node* [ %42, %41 ], [ %57, %62 ]
  %66 = phi i32 [ %45, %41 ], [ %63, %62 ]
  %67 = getelementptr inbounds %struct.node, %struct.node* %65, i64 0, i32 0
  %68 = load i8*, i8** %67, align 8, !tbaa !7
  store i8* %68, i8** %30, align 8, !tbaa !7
  %69 = getelementptr inbounds %struct.node, %struct.node* %65, i64 0, i32 1, i64 0
  br label %72

70:                                               ; preds = %29
  %71 = getelementptr inbounds %struct.node, %struct.node* %15, i64 0, i32 1, i64 1
  br label %72

72:                                               ; preds = %70, %64
  %73 = phi i8** [ %69, %64 ], [ %71, %70 ]
  %74 = phi i32 [ %66, %64 ], [ %31, %70 ]
  %75 = phi %struct.node* [ %65, %64 ], [ %15, %70 ]
  %76 = bitcast i8** %73 to %struct.node**
  %77 = load %struct.node*, %struct.node** %76, align 8, !tbaa !3
  %78 = bitcast %struct.node* %75 to i8*
  tail call void @free(i8* noundef %78) #4
  %79 = add nsw i32 %74, -1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [97 x i8**], [97 x i8**]* %4, i64 0, i64 %80
  %82 = bitcast i8*** %81 to %struct.node***
  %83 = load %struct.node**, %struct.node*** %82, align 8, !tbaa !3
  store %struct.node* %77, %struct.node** %83, align 8, !tbaa !3
  br label %84

84:                                               ; preds = %89, %72
  %85 = phi i64 [ %86, %89 ], [ %80, %72 ]
  %86 = add nsw i64 %85, -1
  %87 = trunc i64 %86 to i32
  %88 = icmp eq i32 %87, 0
  br i1 %88, label %94, label %89

89:                                               ; preds = %84
  %90 = getelementptr inbounds [97 x i8**], [97 x i8**]* %4, i64 0, i64 %86
  %91 = load i8**, i8*** %90, align 8, !tbaa !3
  %92 = tail call i32 @__tsearch_balance(i8** noundef %91) #4
  %93 = icmp eq i32 %92, 0
  br i1 %93, label %94, label %84

94:                                               ; preds = %20, %89, %84, %6
  %95 = phi i8* [ null, %6 ], [ %37, %84 ], [ %37, %89 ], [ null, %20 ]
  call void @llvm.lifetime.end.p0i8(i64 776, i8* nonnull %7) #3
  br label %96

96:                                               ; preds = %3, %94
  %97 = phi i8* [ %95, %94 ], [ null, %3 ]
  ret i8* %97
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__tsearch_balance(i8** noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

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
