; ModuleID = 'src/locale/pleval.c'
source_filename = "src/locale/pleval.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.st = type { i64, i64, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@evalbinop.prec = internal unnamed_addr constant [14 x i8] c"\01\02\03\03\04\04\04\04\05\05\06\06\06\00", align 1
@parseop.opch = internal unnamed_addr constant [11 x i8] c"|&=!><+-*%/", align 1
@parseop.opch2 = internal unnamed_addr constant [6 x i8] c"|&====", align 1

; Function Attrs: nounwind optsize strictfp
define hidden i64 @__pleval(i8* noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = alloca %struct.st, align 8
  %4 = bitcast %struct.st* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %4) #3
  %5 = getelementptr inbounds %struct.st, %struct.st* %3, i64 0, i32 1
  store i64 %1, i64* %5, align 8, !tbaa !3
  %6 = call fastcc i8* @evalexpr(%struct.st* noundef nonnull %3, i8* noundef %0, i32 noundef 100) #4
  %7 = load i8, i8* %6, align 1, !tbaa !9
  %8 = icmp eq i8 %7, 59
  %9 = getelementptr inbounds %struct.st, %struct.st* %3, i64 0, i32 0
  %10 = load i64, i64* %9, align 8
  %11 = select i1 %8, i64 %10, i64 -1
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %4) #3
  ret i64 %11
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define internal fastcc i8* @evalexpr(%struct.st* nocapture noundef %0, i8* noundef %1, i32 noundef %2) unnamed_addr #0 {
  %4 = add nsw i32 %2, -1
  %5 = icmp slt i32 %2, 1
  br i1 %5, label %26, label %6

6:                                                ; preds = %3
  %7 = tail call fastcc i8* @evalbinop(%struct.st* noundef %0, i8* noundef %1, i32 noundef 0, i32 noundef %4) #4
  %8 = load i8, i8* %7, align 1, !tbaa !9
  %9 = icmp eq i8 %8, 63
  br i1 %9, label %10, label %26

10:                                               ; preds = %6
  %11 = getelementptr inbounds %struct.st, %struct.st* %0, i64 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !10
  %13 = getelementptr inbounds i8, i8* %7, i64 1
  %14 = tail call fastcc i8* @evalexpr(%struct.st* noundef %0, i8* noundef nonnull %13, i32 noundef %4) #4
  %15 = load i8, i8* %14, align 1, !tbaa !9
  %16 = icmp eq i8 %15, 58
  br i1 %16, label %17, label %26

17:                                               ; preds = %10
  %18 = load i64, i64* %11, align 8, !tbaa !10
  %19 = getelementptr inbounds i8, i8* %14, i64 1
  %20 = tail call fastcc i8* @evalexpr(%struct.st* noundef nonnull %0, i8* noundef nonnull %19, i32 noundef %4) #4
  %21 = icmp eq i64 %12, 0
  br i1 %21, label %22, label %24

22:                                               ; preds = %17
  %23 = load i64, i64* %11, align 8, !tbaa !10
  br label %24

24:                                               ; preds = %17, %22
  %25 = phi i64 [ %23, %22 ], [ %18, %17 ]
  store i64 %25, i64* %11, align 8, !tbaa !10
  br label %26

26:                                               ; preds = %10, %6, %3, %24
  %27 = phi i8* [ %20, %24 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i64 0, i64 0), %3 ], [ %7, %6 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i64 0, i64 0), %10 ]
  ret i8* %27
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define internal fastcc i8* @evalbinop(%struct.st* nocapture noundef %0, i8* noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #0 {
  %5 = add nsw i32 %3, -1
  %6 = tail call fastcc i8* @evalprim(%struct.st* noundef %0, i8* noundef %1, i32 noundef %5) #4
  %7 = load i8, i8* %6, align 1, !tbaa !9
  br label %8

8:                                                ; preds = %32, %4
  %9 = phi i64 [ 0, %4 ], [ %33, %32 ]
  %10 = getelementptr inbounds [11 x i8], [11 x i8]* @parseop.opch, i64 0, i64 %9
  %11 = load i8, i8* %10, align 1, !tbaa !9
  %12 = icmp eq i8 %7, %11
  br i1 %12, label %13, label %32

13:                                               ; preds = %8
  %14 = trunc i64 %9 to i32
  %15 = icmp ult i32 %14, 6
  br i1 %15, label %16, label %28

16:                                               ; preds = %13
  %17 = and i64 %9, 4294967295
  %18 = getelementptr inbounds i8, i8* %6, i64 1
  %19 = load i8, i8* %18, align 1, !tbaa !9
  %20 = getelementptr inbounds [6 x i8], [6 x i8]* @parseop.opch2, i64 0, i64 %17
  %21 = load i8, i8* %20, align 1, !tbaa !9
  %22 = icmp eq i8 %19, %21
  br i1 %22, label %23, label %26

23:                                               ; preds = %16
  %24 = getelementptr inbounds %struct.st, %struct.st* %0, i64 0, i32 2
  store i32 %14, i32* %24, align 8, !tbaa !11
  %25 = getelementptr inbounds i8, i8* %6, i64 2
  br label %37

26:                                               ; preds = %16
  %27 = icmp ugt i32 %14, 3
  br i1 %27, label %28, label %35

28:                                               ; preds = %26, %13
  %29 = add nuw nsw i32 %14, 2
  %30 = getelementptr inbounds %struct.st, %struct.st* %0, i64 0, i32 2
  store i32 %29, i32* %30, align 8, !tbaa !11
  %31 = getelementptr inbounds i8, i8* %6, i64 1
  br label %37

32:                                               ; preds = %8
  %33 = add nuw nsw i64 %9, 1
  %34 = icmp eq i64 %33, 11
  br i1 %34, label %35, label %8

35:                                               ; preds = %32, %26
  %36 = getelementptr inbounds %struct.st, %struct.st* %0, i64 0, i32 2
  store i32 13, i32* %36, align 8, !tbaa !11
  br label %37

37:                                               ; preds = %23, %28, %35
  %38 = phi i32 [ %14, %23 ], [ %29, %28 ], [ 13, %35 ]
  %39 = phi i8* [ %25, %23 ], [ %31, %28 ], [ %6, %35 ]
  %40 = getelementptr inbounds %struct.st, %struct.st* %0, i64 0, i32 2
  %41 = sext i32 %38 to i64
  %42 = getelementptr inbounds [14 x i8], [14 x i8]* @evalbinop.prec, i64 0, i64 %41
  %43 = load i8, i8* %42, align 1, !tbaa !9
  %44 = sext i8 %43 to i32
  %45 = icmp sgt i32 %44, %2
  br i1 %45, label %46, label %106

46:                                               ; preds = %37
  %47 = getelementptr inbounds %struct.st, %struct.st* %0, i64 0, i32 0
  %48 = load i64, i64* %47, align 8, !tbaa !10
  br label %49

49:                                               ; preds = %46, %98
  %50 = phi i64 [ %48, %46 ], [ %99, %98 ]
  %51 = phi i32 [ %44, %46 ], [ %104, %98 ]
  %52 = phi i32 [ %38, %46 ], [ %100, %98 ]
  %53 = phi i8* [ %39, %46 ], [ %54, %98 ]
  %54 = tail call fastcc i8* @evalbinop(%struct.st* noundef nonnull %0, i8* noundef %53, i32 noundef %51, i32 noundef %5) #4
  %55 = load i64, i64* %47, align 8, !tbaa !10
  switch i32 %52, label %106 [
    i32 0, label %56
    i32 1, label %61
    i32 2, label %66
    i32 3, label %69
    i32 4, label %72
    i32 5, label %75
    i32 6, label %78
    i32 7, label %81
    i32 8, label %84
    i32 9, label %86
    i32 10, label %88
    i32 11, label %90
    i32 12, label %94
  ]

56:                                               ; preds = %49
  %57 = icmp ne i64 %50, 0
  %58 = icmp ne i64 %55, 0
  %59 = select i1 %57, i1 true, i1 %58
  %60 = zext i1 %59 to i64
  br label %98

61:                                               ; preds = %49
  %62 = icmp ne i64 %50, 0
  %63 = icmp ne i64 %55, 0
  %64 = select i1 %62, i1 %63, i1 false
  %65 = zext i1 %64 to i64
  br label %98

66:                                               ; preds = %49
  %67 = icmp eq i64 %50, %55
  %68 = zext i1 %67 to i64
  br label %98

69:                                               ; preds = %49
  %70 = icmp ne i64 %50, %55
  %71 = zext i1 %70 to i64
  br label %98

72:                                               ; preds = %49
  %73 = icmp uge i64 %50, %55
  %74 = zext i1 %73 to i64
  br label %98

75:                                               ; preds = %49
  %76 = icmp ule i64 %50, %55
  %77 = zext i1 %76 to i64
  br label %98

78:                                               ; preds = %49
  %79 = icmp ugt i64 %50, %55
  %80 = zext i1 %79 to i64
  br label %98

81:                                               ; preds = %49
  %82 = icmp ult i64 %50, %55
  %83 = zext i1 %82 to i64
  br label %98

84:                                               ; preds = %49
  %85 = add i64 %55, %50
  br label %98

86:                                               ; preds = %49
  %87 = sub i64 %50, %55
  br label %98

88:                                               ; preds = %49
  %89 = mul i64 %55, %50
  br label %98

90:                                               ; preds = %49
  %91 = icmp eq i64 %55, 0
  br i1 %91, label %106, label %92

92:                                               ; preds = %90
  %93 = urem i64 %50, %55
  br label %98

94:                                               ; preds = %49
  %95 = icmp eq i64 %55, 0
  br i1 %95, label %106, label %96

96:                                               ; preds = %94
  %97 = udiv i64 %50, %55
  br label %98

98:                                               ; preds = %56, %61, %66, %69, %72, %75, %78, %81, %84, %86, %88, %92, %96
  %99 = phi i64 [ %97, %96 ], [ %93, %92 ], [ %89, %88 ], [ %87, %86 ], [ %85, %84 ], [ %83, %81 ], [ %80, %78 ], [ %77, %75 ], [ %74, %72 ], [ %71, %69 ], [ %68, %66 ], [ %65, %61 ], [ %60, %56 ]
  store i64 %99, i64* %47, align 8, !tbaa !10
  %100 = load i32, i32* %40, align 8, !tbaa !11
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [14 x i8], [14 x i8]* @evalbinop.prec, i64 0, i64 %101
  %103 = load i8, i8* %102, align 1, !tbaa !9
  %104 = sext i8 %103 to i32
  %105 = icmp sgt i32 %104, %2
  br i1 %105, label %49, label %106

106:                                              ; preds = %98, %90, %94, %49, %37
  %107 = phi i8* [ %39, %37 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i64 0, i64 0), %49 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i64 0, i64 0), %94 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i64 0, i64 0), %90 ], [ %54, %98 ]
  ret i8* %107
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc i8* @evalprim(%struct.st* nocapture noundef %0, i8* noundef %1, i32 noundef %2) unnamed_addr #0 {
  %4 = alloca i8*, align 8
  %5 = bitcast i8** %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %5) #3
  %6 = add nsw i32 %2, -1
  %7 = icmp slt i32 %2, 1
  br i1 %7, label %70, label %8

8:                                                ; preds = %3, %8
  %9 = phi i8* [ %16, %8 ], [ %1, %3 ]
  %10 = load i8, i8* %9, align 1, !tbaa !9
  %11 = sext i8 %10 to i32
  %12 = icmp ne i8 %10, 32
  %13 = add nsw i32 %11, -14
  %14 = icmp ult i32 %13, -5
  %15 = and i1 %12, %14
  %16 = getelementptr inbounds i8, i8* %9, i64 1
  br i1 %15, label %17, label %8

17:                                               ; preds = %8
  %18 = sext i8 %10 to i32
  %19 = add nsw i32 %18, -48
  %20 = icmp ult i32 %19, 10
  br i1 %20, label %21, label %37

21:                                               ; preds = %17
  %22 = call i64 @strtoul(i8* noundef nonnull %9, i8** noundef nonnull %4, i32 noundef 10) #5
  %23 = getelementptr inbounds %struct.st, %struct.st* %0, i64 0, i32 0
  store i64 %22, i64* %23, align 8, !tbaa !10
  %24 = load i8*, i8** %4, align 8, !tbaa !12
  %25 = icmp eq i8* %24, %9
  %26 = icmp eq i64 %22, -1
  %27 = select i1 %25, i1 true, i1 %26
  br i1 %27, label %70, label %28

28:                                               ; preds = %21, %28
  %29 = phi i8* [ %36, %28 ], [ %24, %21 ]
  %30 = load i8, i8* %29, align 1, !tbaa !9
  %31 = sext i8 %30 to i32
  %32 = icmp ne i8 %30, 32
  %33 = add nsw i32 %31, -14
  %34 = icmp ult i32 %33, -5
  %35 = and i1 %32, %34
  %36 = getelementptr inbounds i8, i8* %29, i64 1
  br i1 %35, label %70, label %28

37:                                               ; preds = %17
  switch i8 %10, label %70 [
    i8 110, label %38
    i8 40, label %51
    i8 33, label %64
  ]

38:                                               ; preds = %37
  %39 = getelementptr inbounds %struct.st, %struct.st* %0, i64 0, i32 1
  %40 = load i64, i64* %39, align 8, !tbaa !3
  %41 = getelementptr inbounds %struct.st, %struct.st* %0, i64 0, i32 0
  store i64 %40, i64* %41, align 8, !tbaa !10
  br label %42

42:                                               ; preds = %42, %38
  %43 = phi i8* [ %16, %38 ], [ %50, %42 ]
  %44 = load i8, i8* %43, align 1, !tbaa !9
  %45 = sext i8 %44 to i32
  %46 = icmp ne i8 %44, 32
  %47 = add nsw i32 %45, -14
  %48 = icmp ult i32 %47, -5
  %49 = and i1 %46, %48
  %50 = getelementptr inbounds i8, i8* %43, i64 1
  br i1 %49, label %70, label %42

51:                                               ; preds = %37
  %52 = tail call fastcc i8* @evalexpr(%struct.st* noundef %0, i8* noundef nonnull %16, i32 noundef %6) #4
  %53 = load i8, i8* %52, align 1, !tbaa !9
  %54 = icmp eq i8 %53, 41
  br i1 %54, label %55, label %70

55:                                               ; preds = %51, %55
  %56 = phi i8* [ %57, %55 ], [ %52, %51 ]
  %57 = getelementptr inbounds i8, i8* %56, i64 1
  %58 = load i8, i8* %57, align 1, !tbaa !9
  %59 = sext i8 %58 to i32
  %60 = icmp ne i8 %58, 32
  %61 = add nsw i32 %59, -14
  %62 = icmp ult i32 %61, -5
  %63 = and i1 %60, %62
  br i1 %63, label %70, label %55

64:                                               ; preds = %37
  %65 = tail call fastcc i8* @evalprim(%struct.st* noundef %0, i8* noundef nonnull %16, i32 noundef %6) #4
  %66 = getelementptr inbounds %struct.st, %struct.st* %0, i64 0, i32 0
  %67 = load i64, i64* %66, align 8, !tbaa !10
  %68 = icmp eq i64 %67, 0
  %69 = zext i1 %68 to i64
  store i64 %69, i64* %66, align 8, !tbaa !10
  br label %70

70:                                               ; preds = %55, %42, %28, %37, %51, %21, %3, %64
  %71 = phi i8* [ %65, %64 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i64 0, i64 0), %3 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i64 0, i64 0), %21 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i64 0, i64 0), %51 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i64 0, i64 0), %37 ], [ %29, %28 ], [ %43, %42 ], [ %57, %55 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %5) #3
  ret i8* %71
}

; Function Attrs: optsize
declare i64 @strtoul(i8* noundef, i8** noundef, i32 noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin optsize strictfp "no-builtins" }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 8}
!4 = !{!"st", !5, i64 0, !5, i64 8, !8, i64 16}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"int", !6, i64 0}
!9 = !{!6, !6, i64 0}
!10 = !{!4, !5, i64 0}
!11 = !{!4, !8, i64 16}
!12 = !{!13, !13, i64 0}
!13 = !{!"any pointer", !6, i64 0}
