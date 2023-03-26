; ModuleID = 'src/search/tsearch.c'
source_filename = "src/search/tsearch.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { i8*, [2 x i8*], i32 }

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define hidden i32 @__tsearch_balance(i8** nocapture noundef %0) local_unnamed_addr #0 {
  %2 = bitcast i8** %0 to %struct.node**
  %3 = load %struct.node*, %struct.node** %2, align 8, !tbaa !3
  %4 = getelementptr inbounds %struct.node, %struct.node* %3, i64 0, i32 1
  %5 = bitcast [2 x i8*]* %4 to %struct.node**
  %6 = load %struct.node*, %struct.node** %5, align 8, !tbaa !3
  %7 = icmp eq %struct.node* %6, null
  br i1 %7, label %11, label %8

8:                                                ; preds = %1
  %9 = getelementptr inbounds %struct.node, %struct.node* %6, i64 0, i32 2
  %10 = load i32, i32* %9, align 8, !tbaa !7
  br label %11

11:                                               ; preds = %1, %8
  %12 = phi i32 [ %10, %8 ], [ 0, %1 ]
  %13 = getelementptr inbounds %struct.node, %struct.node* %3, i64 0, i32 1, i64 1
  %14 = bitcast i8** %13 to %struct.node**
  %15 = load %struct.node*, %struct.node** %14, align 8, !tbaa !3
  %16 = icmp eq %struct.node* %15, null
  br i1 %16, label %20, label %17

17:                                               ; preds = %11
  %18 = getelementptr inbounds %struct.node, %struct.node* %15, i64 0, i32 2
  %19 = load i32, i32* %18, align 8, !tbaa !7
  br label %20

20:                                               ; preds = %11, %17
  %21 = phi i32 [ %19, %17 ], [ 0, %11 ]
  %22 = add i32 %12, 1
  %23 = sub i32 %22, %21
  %24 = icmp ult i32 %23, 3
  br i1 %24, label %25, label %32

25:                                               ; preds = %20
  %26 = getelementptr inbounds %struct.node, %struct.node* %3, i64 0, i32 2
  %27 = load i32, i32* %26, align 8, !tbaa !7
  %28 = icmp slt i32 %12, %21
  %29 = select i1 %28, i32 %21, i32 %12
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %26, align 8, !tbaa !7
  %31 = sub nsw i32 %30, %27
  br label %82

32:                                               ; preds = %20
  %33 = icmp slt i32 %12, %21
  %34 = zext i1 %33 to i64
  %35 = getelementptr inbounds %struct.node, %struct.node* %3, i64 0, i32 1, i64 %34
  %36 = load i8*, i8** %35, align 8, !tbaa !3
  %37 = getelementptr inbounds i8, i8* %36, i64 8
  %38 = bitcast i8* %37 to [2 x i8*]*
  %39 = xor i1 %33, true
  %40 = zext i1 %39 to i64
  %41 = getelementptr inbounds [2 x i8*], [2 x i8*]* %38, i64 0, i64 %40
  %42 = load i8*, i8** %41, align 8, !tbaa !3
  %43 = getelementptr inbounds %struct.node, %struct.node* %3, i64 0, i32 2
  %44 = load i32, i32* %43, align 8, !tbaa !7
  %45 = icmp eq i8* %42, null
  br i1 %45, label %50, label %46

46:                                               ; preds = %32
  %47 = getelementptr inbounds i8, i8* %42, i64 24
  %48 = bitcast i8* %47 to i32*
  %49 = load i32, i32* %48, align 8, !tbaa !7
  br label %50

50:                                               ; preds = %46, %32
  %51 = phi i32 [ %49, %46 ], [ 0, %32 ]
  %52 = getelementptr inbounds [2 x i8*], [2 x i8*]* %38, i64 0, i64 %34
  %53 = bitcast i8** %52 to %struct.node**
  %54 = load %struct.node*, %struct.node** %53, align 8, !tbaa !3
  %55 = icmp eq %struct.node* %54, null
  br i1 %55, label %59, label %56

56:                                               ; preds = %50
  %57 = getelementptr inbounds %struct.node, %struct.node* %54, i64 0, i32 2
  %58 = load i32, i32* %57, align 8, !tbaa !7
  br label %59

59:                                               ; preds = %56, %50
  %60 = phi i32 [ %58, %56 ], [ 0, %50 ]
  %61 = icmp sgt i32 %51, %60
  br i1 %61, label %62, label %72

62:                                               ; preds = %59
  %63 = getelementptr inbounds i8, i8* %42, i64 8
  %64 = bitcast i8* %63 to [2 x i8*]*
  %65 = getelementptr inbounds [2 x i8*], [2 x i8*]* %64, i64 0, i64 %40
  %66 = load i8*, i8** %65, align 8, !tbaa !3
  store i8* %66, i8** %35, align 8, !tbaa !3
  %67 = getelementptr inbounds [2 x i8*], [2 x i8*]* %64, i64 0, i64 %34
  %68 = load i8*, i8** %67, align 8, !tbaa !3
  store i8* %68, i8** %41, align 8, !tbaa !3
  %69 = bitcast i8** %65 to %struct.node**
  store %struct.node* %3, %struct.node** %69, align 8, !tbaa !3
  store i8* %36, i8** %67, align 8, !tbaa !3
  store i32 %51, i32* %43, align 8, !tbaa !7
  %70 = getelementptr inbounds i8, i8* %36, i64 24
  %71 = bitcast i8* %70 to i32*
  store i32 %51, i32* %71, align 8, !tbaa !7
  br label %75

72:                                               ; preds = %59
  store i8* %42, i8** %35, align 8, !tbaa !3
  %73 = bitcast i8** %41 to %struct.node**
  store %struct.node* %3, %struct.node** %73, align 8, !tbaa !3
  %74 = add nsw i32 %51, 1
  store i32 %74, i32* %43, align 8, !tbaa !7
  br label %75

75:                                               ; preds = %62, %72
  %76 = phi i32 [ 1, %62 ], [ 2, %72 ]
  %77 = phi i8* [ %42, %62 ], [ %36, %72 ]
  %78 = add nsw i32 %51, %76
  %79 = getelementptr inbounds i8, i8* %77, i64 24
  %80 = bitcast i8* %79 to i32*
  store i32 %78, i32* %80, align 8, !tbaa !7
  store i8* %77, i8** %0, align 8, !tbaa !3
  %81 = sub nsw i32 %78, %44
  br label %82

82:                                               ; preds = %75, %25
  %83 = phi i32 [ %31, %25 ], [ %81, %75 ]
  ret i32 %83
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define i8* @tsearch(i8* noundef %0, i8** noundef %1, i32 (i8*, i8*)* nocapture noundef readonly %2) local_unnamed_addr #2 {
  %4 = alloca [96 x i8**], align 16
  %5 = icmp eq i8** %1, null
  br i1 %5, label %59, label %6

6:                                                ; preds = %3
  %7 = bitcast [96 x i8**]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 768, i8* nonnull %7) #4
  %8 = bitcast i8** %1 to %struct.node**
  %9 = load %struct.node*, %struct.node** %8, align 8, !tbaa !3
  %10 = getelementptr inbounds [96 x i8**], [96 x i8**]* %4, i64 0, i64 0
  store i8** %1, i8*** %10, align 16, !tbaa !3
  %11 = icmp eq %struct.node* %9, null
  br i1 %11, label %33, label %12

12:                                               ; preds = %6, %21
  %13 = phi i64 [ %25, %21 ], [ 1, %6 ]
  %14 = phi %struct.node* [ %28, %21 ], [ %9, %6 ]
  %15 = getelementptr inbounds %struct.node, %struct.node* %14, i64 0, i32 0
  %16 = load i8*, i8** %15, align 8, !tbaa !10
  %17 = tail call i32 %2(i8* noundef %0, i8* noundef %16) #5
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %21

19:                                               ; preds = %12
  %20 = bitcast %struct.node* %14 to i8*
  br label %57

21:                                               ; preds = %12
  %22 = icmp sgt i32 %17, 0
  %23 = zext i1 %22 to i64
  %24 = getelementptr inbounds %struct.node, %struct.node* %14, i64 0, i32 1, i64 %23
  %25 = add nuw i64 %13, 1
  %26 = getelementptr inbounds [96 x i8**], [96 x i8**]* %4, i64 0, i64 %13
  store i8** %24, i8*** %26, align 8, !tbaa !3
  %27 = bitcast i8** %24 to %struct.node**
  %28 = load %struct.node*, %struct.node** %27, align 8, !tbaa !3
  %29 = icmp eq %struct.node* %28, null
  br i1 %29, label %30, label %12

30:                                               ; preds = %21
  %31 = trunc i64 %25 to i32
  %32 = add i32 %31, -1
  br label %33

33:                                               ; preds = %30, %6
  %34 = phi i32 [ 0, %6 ], [ %32, %30 ]
  %35 = tail call i8* @malloc(i64 noundef 32) #5
  %36 = icmp eq i8* %35, null
  br i1 %36, label %57, label %37

37:                                               ; preds = %33
  %38 = bitcast i8* %35 to i8**
  store i8* %0, i8** %38, align 8, !tbaa !10
  %39 = getelementptr inbounds i8, i8* %35, i64 8
  %40 = bitcast i8* %39 to <2 x i8*>*
  store <2 x i8*> zeroinitializer, <2 x i8*>* %40, align 8, !tbaa !3
  %41 = getelementptr inbounds i8, i8* %35, i64 24
  %42 = bitcast i8* %41 to i32*
  store i32 1, i32* %42, align 8, !tbaa !7
  %43 = sext i32 %34 to i64
  %44 = getelementptr inbounds [96 x i8**], [96 x i8**]* %4, i64 0, i64 %43
  %45 = load i8**, i8*** %44, align 8, !tbaa !3
  store i8* %35, i8** %45, align 8, !tbaa !3
  %46 = icmp eq i32 %34, 0
  br i1 %46, label %57, label %47

47:                                               ; preds = %37, %47
  %48 = phi i64 [ %49, %47 ], [ %43, %37 ]
  %49 = add nsw i64 %48, -1
  %50 = getelementptr inbounds [96 x i8**], [96 x i8**]* %4, i64 0, i64 %49
  %51 = load i8**, i8*** %50, align 8, !tbaa !3
  %52 = tail call i32 @__tsearch_balance(i8** noundef %51) #6
  %53 = icmp ne i32 %52, 0
  %54 = trunc i64 %49 to i32
  %55 = icmp ne i32 %54, 0
  %56 = select i1 %53, i1 %55, i1 false
  br i1 %56, label %47, label %57

57:                                               ; preds = %47, %19, %37, %33
  %58 = phi i8* [ null, %33 ], [ %35, %37 ], [ %20, %19 ], [ %35, %47 ]
  call void @llvm.lifetime.end.p0i8(i64 768, i8* nonnull %7) #4
  br label %59

59:                                               ; preds = %3, %57
  %60 = phi i8* [ %58, %57 ], [ null, %3 ]
  ret i8* %60
}

; Function Attrs: optsize
declare i8* @malloc(i64 noundef) local_unnamed_addr #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !9, i64 24}
!8 = !{!"node", !4, i64 0, !5, i64 8, !9, i64 24}
!9 = !{!"int", !5, i64 0}
!10 = !{!8, !4, i64 0}
