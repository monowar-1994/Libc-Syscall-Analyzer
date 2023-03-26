; ModuleID = 'src/multibyte/wcsrtombs.c'
source_filename = "src/multibyte/wcsrtombs.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__mbstate_t = type { i32, i32 }

; Function Attrs: nounwind optsize strictfp
define i64 @wcsrtombs(i8* noalias noundef %0, i32** noalias nocapture noundef %1, i64 noundef %2, %struct.__mbstate_t* noalias nocapture noundef readnone %3) local_unnamed_addr #0 {
  %5 = alloca [4 x i8], align 1
  %6 = getelementptr inbounds [4 x i8], [4 x i8]* %5, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %6) #3
  %7 = icmp eq i8* %0, null
  br i1 %7, label %12, label %8

8:                                                ; preds = %4
  %9 = icmp ugt i64 %2, 3
  br i1 %9, label %10, label %30

10:                                               ; preds = %8
  %11 = load i32*, i32** %1, align 8, !tbaa !3
  br label %36

12:                                               ; preds = %4
  %13 = load i32*, i32** %1, align 8, !tbaa !3
  %14 = load i32, i32* %13, align 4, !tbaa !7
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %98, label %16

16:                                               ; preds = %12, %24
  %17 = phi i32 [ %28, %24 ], [ %14, %12 ]
  %18 = phi i32* [ %27, %24 ], [ %13, %12 ]
  %19 = phi i64 [ %26, %24 ], [ 0, %12 ]
  %20 = icmp ugt i32 %17, 127
  br i1 %20, label %21, label %24

21:                                               ; preds = %16
  %22 = call i64 @wcrtomb(i8* noundef nonnull %6, i32 noundef %17, %struct.__mbstate_t* noundef null) #4
  %23 = icmp eq i64 %22, -1
  br i1 %23, label %98, label %24

24:                                               ; preds = %16, %21
  %25 = phi i64 [ %22, %21 ], [ 1, %16 ]
  %26 = add i64 %25, %19
  %27 = getelementptr inbounds i32, i32* %18, i64 1
  %28 = load i32, i32* %27, align 4, !tbaa !7
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %98, label %16

30:                                               ; preds = %58, %8
  %31 = phi i64 [ %2, %8 ], [ %60, %58 ]
  %32 = phi i8* [ %0, %8 ], [ %61, %58 ]
  %33 = icmp eq i64 %31, 0
  br i1 %33, label %98, label %34

34:                                               ; preds = %30
  %35 = load i32*, i32** %1, align 8, !tbaa !3
  br label %64

36:                                               ; preds = %10, %58
  %37 = phi i32* [ %62, %58 ], [ %11, %10 ]
  %38 = phi i8* [ %61, %58 ], [ %0, %10 ]
  %39 = phi i64 [ %60, %58 ], [ %2, %10 ]
  %40 = load i32, i32* %37, align 4, !tbaa !7
  %41 = add i32 %40, -128
  %42 = icmp ult i32 %41, -127
  br i1 %42, label %43, label %53

43:                                               ; preds = %36
  %44 = icmp eq i32 %40, 0
  br i1 %44, label %45, label %47

45:                                               ; preds = %43
  store i8 0, i8* %38, align 1, !tbaa !9
  store i32* null, i32** %1, align 8, !tbaa !3
  %46 = sub i64 %2, %39
  br label %98

47:                                               ; preds = %43
  %48 = tail call i64 @wcrtomb(i8* noundef %38, i32 noundef %40, %struct.__mbstate_t* noundef null) #4
  %49 = icmp eq i64 %48, -1
  br i1 %49, label %98, label %50

50:                                               ; preds = %47
  %51 = getelementptr inbounds i8, i8* %38, i64 %48
  %52 = sub i64 %39, %48
  br label %58

53:                                               ; preds = %36
  %54 = trunc i32 %40 to i8
  %55 = getelementptr inbounds i8, i8* %38, i64 1
  store i8 %54, i8* %38, align 1, !tbaa !9
  %56 = add i64 %39, -1
  %57 = load i32*, i32** %1, align 8, !tbaa !3
  br label %58

58:                                               ; preds = %53, %50
  %59 = phi i32* [ %37, %50 ], [ %57, %53 ]
  %60 = phi i64 [ %52, %50 ], [ %56, %53 ]
  %61 = phi i8* [ %51, %50 ], [ %55, %53 ]
  %62 = getelementptr inbounds i32, i32* %59, i64 1
  store i32* %62, i32** %1, align 8, !tbaa !3
  %63 = icmp ugt i64 %60, 3
  br i1 %63, label %36, label %30

64:                                               ; preds = %34, %92
  %65 = phi i32* [ %96, %92 ], [ %35, %34 ]
  %66 = phi i8* [ %95, %92 ], [ %32, %34 ]
  %67 = phi i64 [ %94, %92 ], [ %31, %34 ]
  %68 = load i32, i32* %65, align 4, !tbaa !7
  %69 = add i32 %68, -128
  %70 = icmp ult i32 %69, -127
  br i1 %70, label %71, label %87

71:                                               ; preds = %64
  %72 = icmp eq i32 %68, 0
  br i1 %72, label %73, label %75

73:                                               ; preds = %71
  store i8 0, i8* %66, align 1, !tbaa !9
  store i32* null, i32** %1, align 8, !tbaa !3
  %74 = sub i64 %2, %67
  br label %98

75:                                               ; preds = %71
  %76 = call i64 @wcrtomb(i8* noundef nonnull %6, i32 noundef %68, %struct.__mbstate_t* noundef null) #4
  %77 = icmp eq i64 %76, -1
  br i1 %77, label %98, label %78

78:                                               ; preds = %75
  %79 = icmp ult i64 %67, %76
  br i1 %79, label %80, label %82

80:                                               ; preds = %78
  %81 = sub i64 %2, %67
  br label %98

82:                                               ; preds = %78
  %83 = load i32, i32* %65, align 4, !tbaa !7
  %84 = call i64 @wcrtomb(i8* noundef %66, i32 noundef %83, %struct.__mbstate_t* noundef null) #4
  %85 = getelementptr inbounds i8, i8* %66, i64 %76
  %86 = sub i64 %67, %76
  br label %92

87:                                               ; preds = %64
  %88 = trunc i32 %68 to i8
  %89 = getelementptr inbounds i8, i8* %66, i64 1
  store i8 %88, i8* %66, align 1, !tbaa !9
  %90 = add i64 %67, -1
  %91 = load i32*, i32** %1, align 8, !tbaa !3
  br label %92

92:                                               ; preds = %87, %82
  %93 = phi i32* [ %65, %82 ], [ %91, %87 ]
  %94 = phi i64 [ %86, %82 ], [ %90, %87 ]
  %95 = phi i8* [ %85, %82 ], [ %89, %87 ]
  %96 = getelementptr inbounds i32, i32* %93, i64 1
  store i32* %96, i32** %1, align 8, !tbaa !3
  %97 = icmp eq i64 %94, 0
  br i1 %97, label %98, label %64

98:                                               ; preds = %47, %75, %92, %21, %24, %30, %12, %80, %73, %45
  %99 = phi i64 [ %46, %45 ], [ %81, %80 ], [ %74, %73 ], [ 0, %12 ], [ %2, %30 ], [ -1, %21 ], [ %26, %24 ], [ -1, %75 ], [ %2, %92 ], [ -1, %47 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %6) #3
  ret i64 %99
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i64 @wcrtomb(i8* noundef, i32 noundef, %struct.__mbstate_t* noundef) local_unnamed_addr #2

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
!9 = !{!5, !5, i64 0}
