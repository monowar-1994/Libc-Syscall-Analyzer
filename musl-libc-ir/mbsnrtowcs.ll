; ModuleID = 'src/multibyte/mbsnrtowcs.c'
source_filename = "src/multibyte/mbsnrtowcs.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__mbstate_t = type { i32, i32 }

; Function Attrs: nounwind optsize strictfp
define i64 @mbsnrtowcs(i32* noalias noundef %0, i8** noalias nocapture noundef %1, i64 noundef %2, i64 noundef %3, %struct.__mbstate_t* noalias noundef %4) local_unnamed_addr #0 {
  %6 = alloca [256 x i32], align 16
  %7 = alloca i8*, align 8
  %8 = bitcast [256 x i32]* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 1024, i8* nonnull %8) #3
  %9 = bitcast i8** %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %9) #3
  %10 = load i8*, i8** %1, align 8, !tbaa !3
  store i8* %10, i8** %7, align 8, !tbaa !3
  %11 = icmp eq i32* %0, null
  %12 = getelementptr inbounds [256 x i32], [256 x i32]* %6, i64 0, i64 0
  %13 = select i1 %11, i64 256, i64 %3
  %14 = select i1 %11, i32* %12, i32* %0
  %15 = icmp ne i8* %10, null
  %16 = icmp ne i64 %13, 0
  %17 = and i1 %15, %16
  br i1 %17, label %18, label %50

18:                                               ; preds = %5, %34
  %19 = phi i8* [ %39, %34 ], [ %10, %5 ]
  %20 = phi i64 [ %45, %34 ], [ %2, %5 ]
  %21 = phi i32* [ %38, %34 ], [ %14, %5 ]
  %22 = phi i64 [ %46, %34 ], [ 0, %5 ]
  %23 = phi i64 [ %37, %34 ], [ %13, %5 ]
  %24 = lshr i64 %20, 2
  %25 = icmp uge i64 %24, %23
  %26 = icmp ugt i64 %20, 131
  %27 = or i1 %26, %25
  br i1 %27, label %28, label %57

28:                                               ; preds = %18
  %29 = select i1 %25, i64 %23, i64 %24
  %30 = call i64 @mbsrtowcs(i32* noundef %21, i8** noundef nonnull %7, i64 noundef %29, %struct.__mbstate_t* noundef %4) #4
  %31 = icmp eq i64 %30, -1
  br i1 %31, label %32, label %34

32:                                               ; preds = %28
  %33 = load i8*, i8** %7, align 8, !tbaa !3
  br label %50

34:                                               ; preds = %28
  %35 = icmp eq i32* %21, %12
  %36 = select i1 %35, i64 0, i64 %30
  %37 = sub i64 %23, %36
  %38 = getelementptr i32, i32* %21, i64 %36
  %39 = load i8*, i8** %7, align 8, !tbaa !3
  %40 = icmp eq i8* %39, null
  %41 = ptrtoint i8* %39 to i64
  %42 = ptrtoint i8* %19 to i64
  %43 = add i64 %20, %42
  %44 = sub i64 %43, %41
  %45 = select i1 %40, i64 0, i64 %44
  %46 = add i64 %30, %22
  %47 = icmp ne i8* %39, null
  %48 = icmp ne i64 %37, 0
  %49 = select i1 %47, i1 %48, i1 false
  br i1 %49, label %18, label %50

50:                                               ; preds = %34, %32, %5
  %51 = phi i32* [ %14, %5 ], [ %21, %32 ], [ %38, %34 ]
  %52 = phi i64 [ %2, %5 ], [ %20, %32 ], [ %45, %34 ]
  %53 = phi i8* [ %10, %5 ], [ %33, %32 ], [ %39, %34 ]
  %54 = phi i64 [ %13, %5 ], [ 0, %32 ], [ %37, %34 ]
  %55 = phi i64 [ 0, %5 ], [ -1, %32 ], [ %46, %34 ]
  %56 = icmp eq i8* %53, null
  br i1 %56, label %89, label %57

57:                                               ; preds = %18, %50
  %58 = phi i64 [ %55, %50 ], [ %22, %18 ]
  %59 = phi i64 [ %54, %50 ], [ %23, %18 ]
  %60 = phi i8* [ %53, %50 ], [ %19, %18 ]
  %61 = phi i64 [ %52, %50 ], [ %20, %18 ]
  %62 = phi i32* [ %51, %50 ], [ %21, %18 ]
  %63 = icmp ne i64 %59, 0
  %64 = icmp ne i64 %61, 0
  %65 = select i1 %63, i1 %64, i1 false
  br i1 %65, label %66, label %89

66:                                               ; preds = %57, %79
  %67 = phi i8* [ %81, %79 ], [ %60, %57 ]
  %68 = phi i64 [ %82, %79 ], [ %61, %57 ]
  %69 = phi i32* [ %83, %79 ], [ %62, %57 ]
  %70 = phi i64 [ %85, %79 ], [ %58, %57 ]
  %71 = phi i64 [ %84, %79 ], [ %59, %57 ]
  %72 = call i64 @mbrtowc(i32* noundef %69, i8* noundef %67, i64 noundef %68, %struct.__mbstate_t* noundef %4) #4
  %73 = add i64 %72, 2
  %74 = icmp ult i64 %73, 3
  br i1 %74, label %75, label %79

75:                                               ; preds = %66
  switch i64 %72, label %77 [
    i64 -1, label %89
    i64 0, label %76
  ]

76:                                               ; preds = %75
  store i8* null, i8** %7, align 8, !tbaa !3
  br label %89

77:                                               ; preds = %75
  %78 = getelementptr %struct.__mbstate_t, %struct.__mbstate_t* %4, i64 0, i32 0
  store i32 0, i32* %78, align 4, !tbaa !7
  br label %89

79:                                               ; preds = %66
  %80 = load i8*, i8** %7, align 8, !tbaa !3
  %81 = getelementptr inbounds i8, i8* %80, i64 %72
  store i8* %81, i8** %7, align 8, !tbaa !3
  %82 = sub i64 %68, %72
  %83 = getelementptr inbounds i32, i32* %69, i64 1
  %84 = add i64 %71, -1
  %85 = add i64 %70, 1
  %86 = icmp ne i64 %84, 0
  %87 = icmp ne i64 %82, 0
  %88 = select i1 %86, i1 %87, i1 false
  br i1 %88, label %66, label %89

89:                                               ; preds = %79, %57, %75, %76, %77, %50
  %90 = phi i64 [ %70, %77 ], [ %70, %76 ], [ %55, %50 ], [ %72, %75 ], [ %58, %57 ], [ %85, %79 ]
  br i1 %11, label %93, label %91

91:                                               ; preds = %89
  %92 = load i8*, i8** %7, align 8, !tbaa !3
  store i8* %92, i8** %1, align 8, !tbaa !3
  br label %93

93:                                               ; preds = %91, %89
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %9) #3
  call void @llvm.lifetime.end.p0i8(i64 1024, i8* nonnull %8) #3
  ret i64 %90
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i64 @mbsrtowcs(i32* noundef, i8** noundef, i64 noundef, %struct.__mbstate_t* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @mbrtowc(i32* noundef, i8* noundef, i64 noundef, %struct.__mbstate_t* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

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
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
