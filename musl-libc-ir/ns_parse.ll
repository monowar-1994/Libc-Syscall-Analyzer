; ModuleID = 'src/network/ns_parse.c'
source_filename = "src/network/ns_parse.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._ns_flagdata = type { i32, i32 }
%struct.__ns_msg = type { i8*, i8*, i16, i16, [4 x i16], [4 x i8*], i32, i32, i8* }
%struct.__ns_rr = type { [1025 x i8], i16, i16, i32, i16, i8* }

@_ns_flagdata = local_unnamed_addr constant [16 x %struct._ns_flagdata] [%struct._ns_flagdata { i32 32768, i32 15 }, %struct._ns_flagdata { i32 30720, i32 11 }, %struct._ns_flagdata { i32 1024, i32 10 }, %struct._ns_flagdata { i32 512, i32 9 }, %struct._ns_flagdata { i32 256, i32 8 }, %struct._ns_flagdata { i32 128, i32 7 }, %struct._ns_flagdata { i32 64, i32 6 }, %struct._ns_flagdata { i32 32, i32 5 }, %struct._ns_flagdata { i32 16, i32 4 }, %struct._ns_flagdata { i32 15, i32 0 }, %struct._ns_flagdata zeroinitializer, %struct._ns_flagdata zeroinitializer, %struct._ns_flagdata zeroinitializer, %struct._ns_flagdata zeroinitializer, %struct._ns_flagdata zeroinitializer, %struct._ns_flagdata zeroinitializer], align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn
define i32 @ns_get16(i8* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = load i8, i8* %0, align 1, !tbaa !3
  %3 = zext i8 %2 to i32
  %4 = shl nuw nsw i32 %3, 8
  %5 = getelementptr inbounds i8, i8* %0, i64 1
  %6 = load i8, i8* %5, align 1, !tbaa !3
  %7 = zext i8 %6 to i32
  %8 = or i32 %4, %7
  ret i32 %8
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn
define i64 @ns_get32(i8* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = load i8, i8* %0, align 1, !tbaa !3
  %3 = zext i8 %2 to i64
  %4 = shl nuw nsw i64 %3, 24
  %5 = getelementptr inbounds i8, i8* %0, i64 1
  %6 = load i8, i8* %5, align 1, !tbaa !3
  %7 = zext i8 %6 to i64
  %8 = shl nuw nsw i64 %7, 16
  %9 = or i64 %8, %4
  %10 = getelementptr inbounds i8, i8* %0, i64 2
  %11 = load i8, i8* %10, align 1, !tbaa !3
  %12 = zext i8 %11 to i64
  %13 = shl nuw nsw i64 %12, 8
  %14 = or i64 %9, %13
  %15 = getelementptr inbounds i8, i8* %0, i64 3
  %16 = load i8, i8* %15, align 1, !tbaa !3
  %17 = zext i8 %16 to i64
  %18 = or i64 %14, %17
  ret i64 %18
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn writeonly
define void @ns_put16(i32 noundef %0, i8* nocapture noundef writeonly %1) local_unnamed_addr #1 {
  %3 = lshr i32 %0, 8
  %4 = trunc i32 %3 to i8
  %5 = getelementptr inbounds i8, i8* %1, i64 1
  store i8 %4, i8* %1, align 1, !tbaa !3
  %6 = trunc i32 %0 to i8
  store i8 %6, i8* %5, align 1, !tbaa !3
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn writeonly
define void @ns_put32(i64 noundef %0, i8* nocapture noundef writeonly %1) local_unnamed_addr #1 {
  %3 = lshr i64 %0, 24
  %4 = trunc i64 %3 to i8
  %5 = getelementptr inbounds i8, i8* %1, i64 1
  store i8 %4, i8* %1, align 1, !tbaa !3
  %6 = lshr i64 %0, 16
  %7 = trunc i64 %6 to i8
  %8 = getelementptr inbounds i8, i8* %1, i64 2
  store i8 %7, i8* %5, align 1, !tbaa !3
  %9 = lshr i64 %0, 8
  %10 = trunc i64 %9 to i8
  %11 = getelementptr inbounds i8, i8* %1, i64 3
  store i8 %10, i8* %8, align 1, !tbaa !3
  %12 = trunc i64 %0 to i8
  store i8 %12, i8* %11, align 1, !tbaa !3
  ret void
}

; Function Attrs: nounwind optsize strictfp
define i32 @ns_initparse(i8* noundef %0, i32 noundef %1, %struct.__ns_msg* nocapture noundef %2) local_unnamed_addr #2 {
  %4 = getelementptr inbounds %struct.__ns_msg, %struct.__ns_msg* %2, i64 0, i32 0
  store i8* %0, i8** %4, align 8, !tbaa !6
  %5 = sext i32 %1 to i64
  %6 = getelementptr inbounds i8, i8* %0, i64 %5
  %7 = getelementptr inbounds %struct.__ns_msg, %struct.__ns_msg* %2, i64 0, i32 1
  store i8* %6, i8** %7, align 8, !tbaa !11
  %8 = icmp slt i32 %1, 12
  br i1 %8, label %70, label %9

9:                                                ; preds = %3
  %10 = load i8, i8* %0, align 1, !tbaa !3
  %11 = zext i8 %10 to i16
  %12 = shl nuw i16 %11, 8
  %13 = getelementptr inbounds i8, i8* %0, i64 1
  %14 = load i8, i8* %13, align 1, !tbaa !3
  %15 = zext i8 %14 to i16
  %16 = or i16 %12, %15
  %17 = getelementptr inbounds %struct.__ns_msg, %struct.__ns_msg* %2, i64 0, i32 2
  store i16 %16, i16* %17, align 8, !tbaa !12
  %18 = getelementptr inbounds i8, i8* %0, i64 4
  %19 = getelementptr inbounds i8, i8* %0, i64 2
  %20 = load i8, i8* %19, align 1, !tbaa !3
  %21 = zext i8 %20 to i16
  %22 = shl nuw i16 %21, 8
  %23 = getelementptr inbounds i8, i8* %0, i64 3
  %24 = load i8, i8* %23, align 1, !tbaa !3
  %25 = zext i8 %24 to i16
  %26 = or i16 %22, %25
  %27 = getelementptr inbounds %struct.__ns_msg, %struct.__ns_msg* %2, i64 0, i32 3
  store i16 %26, i16* %27, align 2, !tbaa !13
  br label %28

28:                                               ; preds = %9, %28
  %29 = phi i64 [ 0, %9 ], [ %40, %28 ]
  %30 = phi i8* [ %18, %9 ], [ %31, %28 ]
  %31 = getelementptr inbounds i8, i8* %30, i64 2
  %32 = load i8, i8* %30, align 1, !tbaa !3
  %33 = zext i8 %32 to i16
  %34 = shl nuw i16 %33, 8
  %35 = getelementptr inbounds i8, i8* %30, i64 1
  %36 = load i8, i8* %35, align 1, !tbaa !3
  %37 = zext i8 %36 to i16
  %38 = or i16 %34, %37
  %39 = getelementptr inbounds %struct.__ns_msg, %struct.__ns_msg* %2, i64 0, i32 4, i64 %29
  store i16 %38, i16* %39, align 2, !tbaa !14
  %40 = add nuw nsw i64 %29, 1
  %41 = icmp eq i64 %40, 4
  br i1 %41, label %42, label %28

42:                                               ; preds = %28, %59
  %43 = phi i64 [ %61, %59 ], [ 0, %28 ]
  %44 = phi i8* [ %60, %59 ], [ %31, %28 ]
  %45 = getelementptr inbounds %struct.__ns_msg, %struct.__ns_msg* %2, i64 0, i32 4, i64 %43
  %46 = load i16, i16* %45, align 2, !tbaa !14
  %47 = icmp eq i16 %46, 0
  %48 = getelementptr inbounds %struct.__ns_msg, %struct.__ns_msg* %2, i64 0, i32 5, i64 %43
  br i1 %47, label %58, label %49

49:                                               ; preds = %42
  store i8* %44, i8** %48, align 8, !tbaa !15
  %50 = load i8*, i8** %7, align 8, !tbaa !11
  %51 = zext i16 %46 to i32
  %52 = trunc i64 %43 to i32
  %53 = tail call i32 @ns_skiprr(i8* noundef %44, i8* noundef %50, i32 noundef %52, i32 noundef %51) #5
  %54 = icmp slt i32 %53, 0
  br i1 %54, label %72, label %55

55:                                               ; preds = %49
  %56 = zext i32 %53 to i64
  %57 = getelementptr inbounds i8, i8* %44, i64 %56
  br label %59

58:                                               ; preds = %42
  store i8* null, i8** %48, align 8, !tbaa !15
  br label %59

59:                                               ; preds = %55, %58
  %60 = phi i8* [ %57, %55 ], [ %44, %58 ]
  %61 = add nuw nsw i64 %43, 1
  %62 = icmp eq i64 %61, 4
  br i1 %62, label %63, label %42

63:                                               ; preds = %59
  %64 = load i8*, i8** %7, align 8, !tbaa !11
  %65 = icmp eq i8* %60, %64
  br i1 %65, label %66, label %70

66:                                               ; preds = %63
  %67 = getelementptr inbounds %struct.__ns_msg, %struct.__ns_msg* %2, i64 0, i32 6
  store i32 4, i32* %67, align 8, !tbaa !16
  %68 = getelementptr inbounds %struct.__ns_msg, %struct.__ns_msg* %2, i64 0, i32 7
  store i32 -1, i32* %68, align 4, !tbaa !17
  %69 = getelementptr inbounds %struct.__ns_msg, %struct.__ns_msg* %2, i64 0, i32 8
  store i8* null, i8** %69, align 8, !tbaa !18
  br label %72

70:                                               ; preds = %63, %3
  %71 = tail call i32* @___errno_location() #6
  store i32 90, i32* %71, align 4, !tbaa !19
  br label %72

72:                                               ; preds = %49, %70, %66
  %73 = phi i32 [ -1, %70 ], [ 0, %66 ], [ -1, %49 ]
  ret i32 %73
}

; Function Attrs: nounwind optsize strictfp
define i32 @ns_skiprr(i8* noundef %0, i8* noundef %1, i32 noundef %2, i32 noundef %3) local_unnamed_addr #2 {
  %5 = icmp eq i32 %3, 0
  br i1 %5, label %46, label %6

6:                                                ; preds = %4
  %7 = ptrtoint i8* %1 to i64
  %8 = icmp eq i32 %2, 0
  br label %9

9:                                                ; preds = %6, %43
  %10 = phi i32 [ %3, %6 ], [ %12, %43 ]
  %11 = phi i8* [ %0, %6 ], [ %44, %43 ]
  %12 = add nsw i32 %10, -1
  %13 = tail call i32 @dn_skipname(i8* noundef %11, i8* noundef %1) #7
  %14 = icmp slt i32 %13, 0
  br i1 %14, label %52, label %15

15:                                               ; preds = %9
  %16 = add nuw nsw i32 %13, 4
  %17 = zext i32 %16 to i64
  %18 = ptrtoint i8* %11 to i64
  %19 = sub i64 %7, %18
  %20 = icmp slt i64 %19, %17
  br i1 %20, label %52, label %21

21:                                               ; preds = %15
  %22 = getelementptr inbounds i8, i8* %11, i64 %17
  br i1 %8, label %43, label %23

23:                                               ; preds = %21
  %24 = ptrtoint i8* %22 to i64
  %25 = sub i64 %7, %24
  %26 = icmp slt i64 %25, 6
  br i1 %26, label %52, label %27

27:                                               ; preds = %23
  %28 = getelementptr inbounds i8, i8* %22, i64 4
  %29 = getelementptr inbounds i8, i8* %28, i64 2
  %30 = getelementptr inbounds i8, i8* %29, i64 -2
  %31 = load i8, i8* %30, align 1, !tbaa !3
  %32 = zext i8 %31 to i64
  %33 = shl nuw nsw i64 %32, 8
  %34 = getelementptr inbounds i8, i8* %30, i64 1
  %35 = load i8, i8* %34, align 1, !tbaa !3
  %36 = zext i8 %35 to i64
  %37 = or i64 %33, %36
  %38 = ptrtoint i8* %29 to i64
  %39 = sub i64 %7, %38
  %40 = icmp slt i64 %39, %37
  br i1 %40, label %52, label %41

41:                                               ; preds = %27
  %42 = getelementptr inbounds i8, i8* %29, i64 %37
  br label %43

43:                                               ; preds = %41, %21
  %44 = phi i8* [ %42, %41 ], [ %22, %21 ]
  %45 = icmp eq i32 %12, 0
  br i1 %45, label %46, label %9

46:                                               ; preds = %43, %4
  %47 = phi i8* [ %0, %4 ], [ %44, %43 ]
  %48 = ptrtoint i8* %47 to i64
  %49 = ptrtoint i8* %0 to i64
  %50 = sub i64 %48, %49
  %51 = trunc i64 %50 to i32
  br label %54

52:                                               ; preds = %27, %23, %15, %9
  %53 = tail call i32* @___errno_location() #6
  store i32 90, i32* %53, align 4, !tbaa !19
  br label %54

54:                                               ; preds = %52, %46
  %55 = phi i32 [ -1, %52 ], [ %51, %46 ]
  ret i32 %55
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @dn_skipname(i8* noundef, i8* noundef) local_unnamed_addr #4

; Function Attrs: nounwind optsize strictfp
define i32 @ns_parserr(%struct.__ns_msg* nocapture noundef %0, i32 noundef %1, i32 noundef %2, %struct.__ns_rr* noundef %3) local_unnamed_addr #2 {
  %5 = icmp ugt i32 %1, 3
  br i1 %5, label %151, label %6

6:                                                ; preds = %4
  %7 = getelementptr inbounds %struct.__ns_msg, %struct.__ns_msg* %0, i64 0, i32 6
  %8 = load i32, i32* %7, align 8, !tbaa !16
  %9 = icmp eq i32 %8, %1
  br i1 %9, label %16, label %10

10:                                               ; preds = %6
  store i32 %1, i32* %7, align 8, !tbaa !16
  %11 = getelementptr inbounds %struct.__ns_msg, %struct.__ns_msg* %0, i64 0, i32 7
  store i32 0, i32* %11, align 4, !tbaa !17
  %12 = zext i32 %1 to i64
  %13 = getelementptr inbounds %struct.__ns_msg, %struct.__ns_msg* %0, i64 0, i32 5, i64 %12
  %14 = load i8*, i8** %13, align 8, !tbaa !15
  %15 = getelementptr inbounds %struct.__ns_msg, %struct.__ns_msg* %0, i64 0, i32 8
  store i8* %14, i8** %15, align 8, !tbaa !18
  br label %16

16:                                               ; preds = %10, %6
  %17 = icmp eq i32 %2, -1
  br i1 %17, label %18, label %21

18:                                               ; preds = %16
  %19 = getelementptr inbounds %struct.__ns_msg, %struct.__ns_msg* %0, i64 0, i32 7
  %20 = load i32, i32* %19, align 4, !tbaa !17
  br label %21

21:                                               ; preds = %18, %16
  %22 = phi i32 [ %20, %18 ], [ %2, %16 ]
  %23 = icmp slt i32 %22, 0
  br i1 %23, label %151, label %24

24:                                               ; preds = %21
  %25 = zext i32 %1 to i64
  %26 = getelementptr inbounds %struct.__ns_msg, %struct.__ns_msg* %0, i64 0, i32 4, i64 %25
  %27 = load i16, i16* %26, align 2, !tbaa !14
  %28 = zext i16 %27 to i32
  %29 = icmp ult i32 %22, %28
  br i1 %29, label %30, label %151

30:                                               ; preds = %24
  %31 = getelementptr inbounds %struct.__ns_msg, %struct.__ns_msg* %0, i64 0, i32 7
  %32 = load i32, i32* %31, align 4, !tbaa !17
  %33 = icmp slt i32 %22, %32
  br i1 %33, label %34, label %38

34:                                               ; preds = %30
  store i32 0, i32* %31, align 4, !tbaa !17
  %35 = getelementptr inbounds %struct.__ns_msg, %struct.__ns_msg* %0, i64 0, i32 5, i64 %25
  %36 = load i8*, i8** %35, align 8, !tbaa !15
  %37 = getelementptr inbounds %struct.__ns_msg, %struct.__ns_msg* %0, i64 0, i32 8
  store i8* %36, i8** %37, align 8, !tbaa !18
  br label %38

38:                                               ; preds = %34, %30
  %39 = phi i32 [ 0, %34 ], [ %32, %30 ]
  %40 = icmp sgt i32 %22, %39
  %41 = getelementptr inbounds %struct.__ns_msg, %struct.__ns_msg* %0, i64 0, i32 8
  %42 = load i8*, i8** %41, align 8, !tbaa !18
  br i1 %40, label %43, label %53

43:                                               ; preds = %38
  %44 = getelementptr inbounds %struct.__ns_msg, %struct.__ns_msg* %0, i64 0, i32 1
  %45 = load i8*, i8** %44, align 8, !tbaa !11
  %46 = sub nsw i32 %22, %39
  %47 = tail call i32 @ns_skiprr(i8* noundef %42, i8* noundef %45, i32 noundef %1, i32 noundef %46) #5
  %48 = icmp slt i32 %47, 0
  br i1 %48, label %155, label %49

49:                                               ; preds = %43
  %50 = load i8*, i8** %41, align 8, !tbaa !18
  %51 = zext i32 %47 to i64
  %52 = getelementptr inbounds i8, i8* %50, i64 %51
  store i8* %52, i8** %41, align 8, !tbaa !18
  store i32 %22, i32* %31, align 4, !tbaa !17
  br label %53

53:                                               ; preds = %38, %49
  %54 = phi i8* [ %52, %49 ], [ %42, %38 ]
  %55 = getelementptr inbounds %struct.__ns_msg, %struct.__ns_msg* %0, i64 0, i32 0
  %56 = load i8*, i8** %55, align 8, !tbaa !6
  %57 = getelementptr inbounds %struct.__ns_msg, %struct.__ns_msg* %0, i64 0, i32 1
  %58 = load i8*, i8** %57, align 8, !tbaa !11
  %59 = getelementptr inbounds %struct.__ns_msg, %struct.__ns_msg* %0, i64 0, i32 8
  %60 = getelementptr inbounds %struct.__ns_rr, %struct.__ns_rr* %3, i64 0, i32 0, i64 0
  %61 = tail call i32 @dn_expand(i8* noundef %56, i8* noundef %58, i8* noundef %54, i8* noundef %60, i32 noundef 1025) #7
  %62 = icmp slt i32 %61, 0
  br i1 %62, label %63, label %65

63:                                               ; preds = %53
  %64 = tail call i32* @___errno_location() #6
  store i32 90, i32* %64, align 4, !tbaa !19
  br label %155

65:                                               ; preds = %53
  %66 = load i8*, i8** %59, align 8, !tbaa !18
  %67 = zext i32 %61 to i64
  %68 = getelementptr inbounds i8, i8* %66, i64 %67
  store i8* %68, i8** %59, align 8, !tbaa !18
  %69 = load i8*, i8** %57, align 8, !tbaa !11
  %70 = ptrtoint i8* %69 to i64
  %71 = ptrtoint i8* %68 to i64
  %72 = sub i64 %70, %71
  %73 = icmp slt i64 %72, 4
  br i1 %73, label %153, label %74

74:                                               ; preds = %65
  %75 = getelementptr inbounds i8, i8* %68, i64 2
  store i8* %75, i8** %59, align 8, !tbaa !18
  %76 = getelementptr inbounds i8, i8* %75, i64 -2
  %77 = load i8, i8* %76, align 1, !tbaa !3
  %78 = zext i8 %77 to i16
  %79 = shl nuw i16 %78, 8
  %80 = getelementptr inbounds i8, i8* %76, i64 1
  %81 = load i8, i8* %80, align 1, !tbaa !3
  %82 = zext i8 %81 to i16
  %83 = or i16 %79, %82
  %84 = getelementptr inbounds %struct.__ns_rr, %struct.__ns_rr* %3, i64 0, i32 1
  store i16 %83, i16* %84, align 2, !tbaa !20
  %85 = getelementptr inbounds i8, i8* %75, i64 2
  store i8* %85, i8** %59, align 8, !tbaa !18
  %86 = load i8, i8* %75, align 1, !tbaa !3
  %87 = zext i8 %86 to i16
  %88 = shl nuw i16 %87, 8
  %89 = getelementptr inbounds i8, i8* %75, i64 1
  %90 = load i8, i8* %89, align 1, !tbaa !3
  %91 = zext i8 %90 to i16
  %92 = or i16 %88, %91
  %93 = getelementptr inbounds %struct.__ns_rr, %struct.__ns_rr* %3, i64 0, i32 2
  store i16 %92, i16* %93, align 4, !tbaa !22
  %94 = icmp eq i32 %1, 0
  br i1 %94, label %136, label %95

95:                                               ; preds = %74
  %96 = ptrtoint i8* %85 to i64
  %97 = sub i64 %70, %96
  %98 = icmp slt i64 %97, 6
  br i1 %98, label %153, label %99

99:                                               ; preds = %95
  %100 = getelementptr inbounds i8, i8* %85, i64 4
  store i8* %100, i8** %59, align 8, !tbaa !18
  %101 = load i8, i8* %85, align 1, !tbaa !3
  %102 = zext i8 %101 to i32
  %103 = shl nuw i32 %102, 24
  %104 = getelementptr inbounds i8, i8* %85, i64 1
  %105 = load i8, i8* %104, align 1, !tbaa !3
  %106 = zext i8 %105 to i32
  %107 = shl nuw nsw i32 %106, 16
  %108 = or i32 %107, %103
  %109 = getelementptr inbounds i8, i8* %85, i64 2
  %110 = load i8, i8* %109, align 1, !tbaa !3
  %111 = zext i8 %110 to i32
  %112 = shl nuw nsw i32 %111, 8
  %113 = or i32 %108, %112
  %114 = getelementptr inbounds i8, i8* %85, i64 3
  %115 = load i8, i8* %114, align 1, !tbaa !3
  %116 = zext i8 %115 to i32
  %117 = or i32 %113, %116
  %118 = getelementptr inbounds %struct.__ns_rr, %struct.__ns_rr* %3, i64 0, i32 3
  store i32 %117, i32* %118, align 8, !tbaa !23
  %119 = getelementptr inbounds i8, i8* %100, i64 2
  store i8* %119, i8** %59, align 8, !tbaa !18
  %120 = load i8, i8* %100, align 1, !tbaa !3
  %121 = zext i8 %120 to i32
  %122 = shl nuw nsw i32 %121, 8
  %123 = getelementptr inbounds i8, i8* %100, i64 1
  %124 = load i8, i8* %123, align 1, !tbaa !3
  %125 = zext i8 %124 to i32
  %126 = or i32 %122, %125
  %127 = trunc i32 %126 to i16
  %128 = getelementptr inbounds %struct.__ns_rr, %struct.__ns_rr* %3, i64 0, i32 4
  store i16 %127, i16* %128, align 4, !tbaa !24
  %129 = zext i32 %126 to i64
  %130 = ptrtoint i8* %119 to i64
  %131 = sub i64 %70, %130
  %132 = icmp slt i64 %131, %129
  br i1 %132, label %153, label %133

133:                                              ; preds = %99
  %134 = getelementptr inbounds %struct.__ns_rr, %struct.__ns_rr* %3, i64 0, i32 5
  store i8* %119, i8** %134, align 8, !tbaa !25
  %135 = getelementptr inbounds i8, i8* %119, i64 %129
  store i8* %135, i8** %59, align 8, !tbaa !18
  br label %140

136:                                              ; preds = %74
  %137 = getelementptr inbounds %struct.__ns_rr, %struct.__ns_rr* %3, i64 0, i32 3
  store i32 0, i32* %137, align 8, !tbaa !23
  %138 = getelementptr inbounds %struct.__ns_rr, %struct.__ns_rr* %3, i64 0, i32 4
  store i16 0, i16* %138, align 4, !tbaa !24
  %139 = getelementptr inbounds %struct.__ns_rr, %struct.__ns_rr* %3, i64 0, i32 5
  store i8* null, i8** %139, align 8, !tbaa !25
  br label %140

140:                                              ; preds = %136, %133
  %141 = load i32, i32* %31, align 4, !tbaa !17
  %142 = add nsw i32 %141, 1
  store i32 %142, i32* %31, align 4, !tbaa !17
  %143 = load i16, i16* %26, align 2, !tbaa !14
  %144 = zext i16 %143 to i32
  %145 = icmp slt i32 %141, %144
  br i1 %145, label %155, label %146

146:                                              ; preds = %140
  %147 = add nuw nsw i32 %1, 1
  store i32 %147, i32* %7, align 8, !tbaa !16
  %148 = icmp eq i32 %147, 4
  br i1 %148, label %149, label %150

149:                                              ; preds = %146
  store i32 -1, i32* %31, align 4, !tbaa !17
  store i8* null, i8** %59, align 8, !tbaa !18
  br label %155

150:                                              ; preds = %146
  store i32 0, i32* %31, align 4, !tbaa !17
  br label %155

151:                                              ; preds = %21, %24, %4
  %152 = tail call i32* @___errno_location() #6
  store i32 19, i32* %152, align 4, !tbaa !19
  br label %155

153:                                              ; preds = %99, %95, %65
  %154 = tail call i32* @___errno_location() #6
  store i32 90, i32* %154, align 4, !tbaa !19
  br label %155

155:                                              ; preds = %63, %140, %150, %149, %43, %153, %151
  %156 = phi i32 [ -1, %151 ], [ -1, %153 ], [ -1, %43 ], [ 0, %149 ], [ 0, %150 ], [ 0, %140 ], [ -1, %63 ]
  ret i32 %156
}

; Function Attrs: nounwind optsize strictfp
define i32 @ns_name_uncompress(i8* noundef %0, i8* noundef %1, i8* noundef %2, i8* noundef %3, i64 noundef %4) local_unnamed_addr #2 {
  %6 = trunc i64 %4 to i32
  %7 = tail call i32 @dn_expand(i8* noundef %0, i8* noundef %1, i8* noundef %2, i8* noundef %3, i32 noundef %6) #7
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %9, label %11

9:                                                ; preds = %5
  %10 = tail call i32* @___errno_location() #6
  store i32 90, i32* %10, align 4, !tbaa !19
  br label %11

11:                                               ; preds = %9, %5
  ret i32 %7
}

; Function Attrs: optsize
declare i32 @dn_expand(i8* noundef, i8* noundef, i8* noundef, i8* noundef, i32 noundef) local_unnamed_addr #4

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nobuiltin optsize strictfp "no-builtins" }
attributes #6 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #7 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !8, i64 0}
!7 = !{!"__ns_msg", !8, i64 0, !8, i64 8, !9, i64 16, !9, i64 18, !4, i64 20, !4, i64 32, !4, i64 64, !10, i64 68, !8, i64 72}
!8 = !{!"any pointer", !4, i64 0}
!9 = !{!"short", !4, i64 0}
!10 = !{!"int", !4, i64 0}
!11 = !{!7, !8, i64 8}
!12 = !{!7, !9, i64 16}
!13 = !{!7, !9, i64 18}
!14 = !{!9, !9, i64 0}
!15 = !{!8, !8, i64 0}
!16 = !{!7, !4, i64 64}
!17 = !{!7, !10, i64 68}
!18 = !{!7, !8, i64 72}
!19 = !{!10, !10, i64 0}
!20 = !{!21, !9, i64 1026}
!21 = !{!"__ns_rr", !4, i64 0, !9, i64 1026, !9, i64 1028, !10, i64 1032, !9, i64 1036, !8, i64 1040}
!22 = !{!21, !9, i64 1028}
!23 = !{!21, !10, i64 1032}
!24 = !{!21, !9, i64 1036}
!25 = !{!21, !8, i64 1040}
