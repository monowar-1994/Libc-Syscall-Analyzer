; ModuleID = 'src/regex/fnmatch.c'
source_filename = "src/regex/fnmatch.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }

; Function Attrs: nounwind optsize strictfp
define i32 @fnmatch(i8* noundef %0, i8* noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = alloca i64, align 8
  %5 = bitcast i64* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %5) #3
  %6 = and i32 %2, 1
  %7 = icmp eq i32 %6, 0
  %8 = and i32 %2, 8
  %9 = icmp eq i32 %8, 0
  br i1 %7, label %47, label %10

10:                                               ; preds = %3, %43
  %11 = phi i8* [ %44, %43 ], [ %1, %3 ]
  %12 = phi i8* [ %46, %43 ], [ %0, %3 ]
  br label %13

13:                                               ; preds = %17, %10
  %14 = phi i8* [ %11, %10 ], [ %18, %17 ]
  %15 = load i8, i8* %14, align 1, !tbaa !3
  switch i8 %15, label %17 [
    i8 0, label %16
    i8 47, label %16
  ]

16:                                               ; preds = %13, %13
  br label %19

17:                                               ; preds = %13
  %18 = getelementptr inbounds i8, i8* %14, i64 1
  br label %13

19:                                               ; preds = %16, %22
  %20 = phi i8* [ %24, %22 ], [ %12, %16 ]
  %21 = call fastcc i32 @pat_next(i8* noundef %20, i64 noundef -1, i64* noundef nonnull %4, i32 noundef %2) #4
  switch i32 %21, label %22 [
    i32 47, label %25
    i32 0, label %25
  ]

22:                                               ; preds = %19
  %23 = load i64, i64* %4, align 8, !tbaa !6
  %24 = getelementptr inbounds i8, i8* %20, i64 %23
  br label %19

25:                                               ; preds = %19, %19
  %26 = load i8, i8* %14, align 1, !tbaa !3
  %27 = sext i8 %26 to i32
  %28 = icmp ne i32 %21, %27
  %29 = icmp eq i8 %26, 0
  %30 = or i1 %9, %29
  %31 = and i1 %28, %30
  br i1 %31, label %64, label %32

32:                                               ; preds = %25
  %33 = icmp eq i32 %21, 0
  %34 = ptrtoint i8* %20 to i64
  %35 = ptrtoint i8* %12 to i64
  %36 = sub i64 %34, %35
  %37 = ptrtoint i8* %14 to i64
  %38 = ptrtoint i8* %11 to i64
  %39 = sub i64 %37, %38
  %40 = tail call fastcc i32 @fnmatch_internal(i8* noundef %12, i64 noundef %36, i8* noundef %11, i64 noundef %39, i32 noundef %2) #4
  %41 = icmp ne i32 %40, 0
  %42 = select i1 %41, i1 true, i1 %33
  br i1 %42, label %62, label %43

43:                                               ; preds = %32
  %44 = getelementptr inbounds i8, i8* %14, i64 1
  %45 = load i64, i64* %4, align 8, !tbaa !6
  %46 = getelementptr inbounds i8, i8* %20, i64 %45
  br label %10

47:                                               ; preds = %3
  br i1 %9, label %60, label %48

48:                                               ; preds = %47
  %49 = ptrtoint i8* %1 to i64
  br label %50

50:                                               ; preds = %48, %58
  %51 = phi i8* [ %59, %58 ], [ %1, %48 ]
  %52 = load i8, i8* %51, align 1, !tbaa !3
  switch i8 %52, label %58 [
    i8 0, label %60
    i8 47, label %53
  ]

53:                                               ; preds = %50
  %54 = ptrtoint i8* %51 to i64
  %55 = sub i64 %54, %49
  %56 = tail call fastcc i32 @fnmatch_internal(i8* noundef %0, i64 noundef -1, i8* noundef %1, i64 noundef %55, i32 noundef %2) #4
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %64, label %58

58:                                               ; preds = %50, %53
  %59 = getelementptr inbounds i8, i8* %51, i64 1
  br label %50

60:                                               ; preds = %50, %47
  %61 = tail call fastcc i32 @fnmatch_internal(i8* noundef %0, i64 noundef -1, i8* noundef %1, i64 noundef -1, i32 noundef %2) #4
  br label %64

62:                                               ; preds = %32
  %63 = zext i1 %41 to i32
  br label %64

64:                                               ; preds = %25, %53, %62, %60
  %65 = phi i32 [ %61, %60 ], [ %63, %62 ], [ 0, %53 ], [ 1, %25 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %5) #3
  ret i32 %65
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @pat_next(i8* noundef %0, i64 noundef %1, i64* nocapture noundef writeonly %2, i32 noundef %3) unnamed_addr #0 {
  %5 = alloca i32, align 4
  %6 = icmp eq i64 %1, 0
  br i1 %6, label %10, label %7

7:                                                ; preds = %4
  %8 = load i8, i8* %0, align 1, !tbaa !3
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %7, %4
  store i64 0, i64* %2, align 8, !tbaa !6
  br label %129

11:                                               ; preds = %7
  store i64 1, i64* %2, align 8, !tbaa !6
  %12 = load i8, i8* %0, align 1, !tbaa !3
  switch i8 %12, label %110 [
    i8 92, label %13
    i8 91, label %22
    i8 42, label %129
    i8 63, label %109
  ]

13:                                               ; preds = %11
  %14 = getelementptr inbounds i8, i8* %0, i64 1
  %15 = load i8, i8* %14, align 1, !tbaa !3
  %16 = icmp ne i8 %15, 0
  %17 = and i32 %3, 2
  %18 = icmp eq i32 %17, 0
  %19 = and i1 %18, %16
  br i1 %19, label %20, label %126

20:                                               ; preds = %13
  store i64 2, i64* %2, align 8, !tbaa !6
  %21 = load i8, i8* %14, align 1, !tbaa !3
  br label %110

22:                                               ; preds = %11
  %23 = icmp ugt i64 %1, 1
  br i1 %23, label %24, label %31

24:                                               ; preds = %22
  %25 = getelementptr inbounds i8, i8* %0, i64 1
  %26 = load i8, i8* %25, align 1, !tbaa !3
  %27 = icmp eq i8 %26, 94
  %28 = icmp eq i8 %26, 33
  %29 = or i1 %27, %28
  %30 = select i1 %29, i64 2, i64 1
  br label %31

31:                                               ; preds = %24, %22
  %32 = phi i64 [ 1, %22 ], [ %30, %24 ]
  %33 = icmp ult i64 %32, %1
  br i1 %33, label %34, label %40

34:                                               ; preds = %31
  %35 = getelementptr inbounds i8, i8* %0, i64 %32
  %36 = load i8, i8* %35, align 1, !tbaa !3
  %37 = icmp eq i8 %36, 93
  %38 = zext i1 %37 to i64
  %39 = add nuw nsw i64 %32, %38
  br label %40

40:                                               ; preds = %34, %31
  %41 = phi i64 [ %32, %31 ], [ %39, %34 ]
  %42 = icmp ult i64 %41, %1
  br i1 %42, label %43, label %96

43:                                               ; preds = %40, %93
  %44 = phi i64 [ %94, %93 ], [ %41, %40 ]
  %45 = getelementptr inbounds i8, i8* %0, i64 %44
  %46 = load i8, i8* %45, align 1, !tbaa !3
  switch i8 %46, label %47 [
    i8 0, label %96
    i8 93, label %96
  ]

47:                                               ; preds = %43
  %48 = add nuw i64 %44, 1
  %49 = icmp ult i64 %48, %1
  br i1 %49, label %50, label %93

50:                                               ; preds = %47
  %51 = getelementptr inbounds i8, i8* %0, i64 %48
  %52 = load i8, i8* %51, align 1, !tbaa !3
  %53 = icmp ne i8 %52, 0
  %54 = icmp eq i8 %46, 91
  %55 = select i1 %53, i1 %54, i1 false
  br i1 %55, label %56, label %93

56:                                               ; preds = %50
  switch i8 %52, label %93 [
    i8 58, label %57
    i8 46, label %57
    i8 61, label %57
  ]

57:                                               ; preds = %56, %56, %56
  %58 = add nuw i64 %44, 2
  %59 = icmp ult i64 %58, %1
  br i1 %59, label %60, label %66

60:                                               ; preds = %57
  %61 = getelementptr inbounds i8, i8* %0, i64 %58
  %62 = load i8, i8* %61, align 1, !tbaa !3
  %63 = icmp eq i8 %62, 0
  %64 = add nuw i64 %44, 3
  %65 = select i1 %63, i64 %58, i64 %64
  br label %66

66:                                               ; preds = %60, %57
  %67 = phi i64 [ %58, %57 ], [ %65, %60 ]
  %68 = icmp ult i64 %67, %1
  br i1 %68, label %69, label %84

69:                                               ; preds = %66, %81
  %70 = phi i64 [ %82, %81 ], [ %67, %66 ]
  %71 = getelementptr inbounds i8, i8* %0, i64 %70
  %72 = load i8, i8* %71, align 1, !tbaa !3
  %73 = icmp eq i8 %72, 0
  br i1 %73, label %84, label %74

74:                                               ; preds = %69
  %75 = add i64 %70, -1
  %76 = getelementptr inbounds i8, i8* %0, i64 %75
  %77 = load i8, i8* %76, align 1, !tbaa !3
  %78 = icmp eq i8 %77, %52
  %79 = icmp eq i8 %72, 93
  %80 = select i1 %78, i1 %79, i1 false
  br i1 %80, label %84, label %81

81:                                               ; preds = %74
  %82 = add nuw i64 %70, 1
  %83 = icmp eq i64 %82, %1
  br i1 %83, label %106, label %69

84:                                               ; preds = %69, %74, %66
  %85 = phi i64 [ %67, %66 ], [ %70, %74 ], [ %70, %69 ]
  %86 = icmp eq i64 %85, %1
  br i1 %86, label %106, label %87

87:                                               ; preds = %84
  %88 = getelementptr inbounds i8, i8* %0, i64 %85
  %89 = load i8, i8* %88, align 1, !tbaa !3
  %90 = icmp eq i8 %89, 0
  br i1 %90, label %96, label %91

91:                                               ; preds = %87
  %92 = add i64 %85, 1
  br label %93

93:                                               ; preds = %91, %56, %47, %50
  %94 = phi i64 [ %92, %91 ], [ %48, %56 ], [ %48, %47 ], [ %48, %50 ]
  %95 = icmp ult i64 %94, %1
  br i1 %95, label %43, label %96

96:                                               ; preds = %93, %43, %43, %87, %40
  %97 = phi i64 [ %41, %40 ], [ %85, %87 ], [ %44, %43 ], [ %44, %43 ], [ %94, %93 ]
  %98 = icmp eq i64 %97, %1
  br i1 %98, label %106, label %99

99:                                               ; preds = %96
  %100 = getelementptr inbounds i8, i8* %0, i64 %97
  %101 = load i8, i8* %100, align 1, !tbaa !3
  %102 = icmp eq i8 %101, 0
  %103 = add i64 %97, 1
  %104 = select i1 %102, i64 1, i64 %103
  %105 = select i1 %102, i32 91, i32 -3
  br label %106

106:                                              ; preds = %84, %81, %99, %96
  %107 = phi i64 [ 1, %96 ], [ %104, %99 ], [ 1, %81 ], [ 1, %84 ]
  %108 = phi i32 [ 91, %96 ], [ %105, %99 ], [ 91, %81 ], [ 91, %84 ]
  store i64 %107, i64* %2, align 8, !tbaa !6
  br label %129

109:                                              ; preds = %11
  br label %129

110:                                              ; preds = %20, %11
  %111 = phi i8 [ %12, %11 ], [ %21, %20 ]
  %112 = phi i32 [ 0, %11 ], [ 1, %20 ]
  %113 = phi i8* [ %0, %11 ], [ %14, %20 ]
  %114 = icmp slt i8 %111, 0
  br i1 %114, label %115, label %126

115:                                              ; preds = %110
  %116 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %116) #3
  %117 = call i32 @mbtowc(i32* noundef nonnull %5, i8* noundef nonnull %113, i64 noundef %1) #5
  %118 = icmp slt i32 %117, 0
  br i1 %118, label %119, label %120

119:                                              ; preds = %115
  store i64 0, i64* %2, align 8, !tbaa !6
  br label %124

120:                                              ; preds = %115
  %121 = add nuw nsw i32 %117, %112
  %122 = zext i32 %121 to i64
  store i64 %122, i64* %2, align 8, !tbaa !6
  %123 = load i32, i32* %5, align 4, !tbaa !8
  br label %124

124:                                              ; preds = %120, %119
  %125 = phi i32 [ -2, %119 ], [ %123, %120 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %116) #3
  br label %129

126:                                              ; preds = %13, %110
  %127 = phi i8 [ %111, %110 ], [ 92, %13 ]
  %128 = zext i8 %127 to i32
  br label %129

129:                                              ; preds = %11, %126, %124, %109, %106, %10
  %130 = phi i32 [ %108, %106 ], [ -4, %109 ], [ %125, %124 ], [ %128, %126 ], [ 0, %10 ], [ -5, %11 ]
  ret i32 %130
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @fnmatch_internal(i8* noundef %0, i64 noundef %1, i8* noundef %2, i64 noundef %3, i32 noundef %4) unnamed_addr #0 {
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = bitcast i64* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %8) #3
  %9 = bitcast i64* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %9) #3
  %10 = and i32 %4, 4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %18, label %12

12:                                               ; preds = %5
  %13 = load i8, i8* %2, align 1, !tbaa !3
  %14 = icmp eq i8 %13, 46
  br i1 %14, label %15, label %18

15:                                               ; preds = %12
  %16 = load i8, i8* %0, align 1, !tbaa !3
  %17 = icmp eq i8 %16, 46
  br i1 %17, label %18, label %259

18:                                               ; preds = %12, %15, %5
  %19 = and i32 %4, 16
  %20 = icmp eq i32 %19, 0
  br label %21

21:                                               ; preds = %64, %18
  %22 = phi i64 [ %1, %18 ], [ %67, %64 ]
  %23 = phi i8* [ %2, %18 ], [ %48, %64 ]
  %24 = phi i64 [ %3, %18 ], [ %49, %64 ]
  %25 = phi i8* [ %0, %18 ], [ %66, %64 ]
  %26 = call fastcc i32 @pat_next(i8* noundef %25, i64 noundef %22, i64* noundef nonnull %6, i32 noundef %4) #4
  switch i32 %26, label %40 [
    i32 -2, label %259
    i32 -5, label %27
  ]

27:                                               ; preds = %21
  %28 = getelementptr inbounds i8, i8* %25, i64 1
  %29 = add i64 %22, -1
  %30 = tail call i64 @strnlen(i8* noundef nonnull %28, i64 noundef %29) #5
  %31 = add nsw i64 %30, 1
  %32 = getelementptr inbounds i8, i8* %25, i64 %31
  %33 = icmp sgt i64 %30, 0
  br i1 %33, label %38, label %34

34:                                               ; preds = %27
  %35 = getelementptr inbounds i8, i8* %25, i64 1
  %36 = tail call i64 @strnlen(i8* noundef %23, i64 noundef %24) #5
  %37 = getelementptr inbounds i8, i8* %23, i64 %36
  br label %134

38:                                               ; preds = %27
  %39 = ptrtoint i8* %32 to i64
  br label %68

40:                                               ; preds = %21
  %41 = call fastcc i32 @str_next(i8* noundef %23, i64 noundef %24, i64* noundef nonnull %7) #4
  %42 = icmp slt i32 %41, 1
  br i1 %42, label %43, label %46

43:                                               ; preds = %40
  %44 = icmp ne i32 %26, 0
  %45 = zext i1 %44 to i32
  br label %259

46:                                               ; preds = %40
  %47 = load i64, i64* %7, align 8, !tbaa !6
  %48 = getelementptr inbounds i8, i8* %23, i64 %47
  %49 = sub i64 %24, %47
  br i1 %20, label %55, label %50

50:                                               ; preds = %46
  %51 = tail call i32 @towupper(i32 noundef %41) #5
  %52 = icmp eq i32 %51, %41
  br i1 %52, label %53, label %55

53:                                               ; preds = %50
  %54 = tail call i32 @towlower(i32 noundef %41) #5
  br label %55

55:                                               ; preds = %53, %50, %46
  %56 = phi i32 [ %41, %46 ], [ %54, %53 ], [ %51, %50 ]
  switch i32 %26, label %60 [
    i32 -3, label %57
    i32 -4, label %64
  ]

57:                                               ; preds = %55
  %58 = tail call fastcc i32 @match_bracket(i8* noundef %25, i32 noundef %41, i32 noundef %56) #4
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %259, label %64

60:                                               ; preds = %55
  %61 = icmp eq i32 %41, %26
  %62 = icmp eq i32 %56, %26
  %63 = select i1 %61, i1 true, i1 %62
  br i1 %63, label %64, label %259

64:                                               ; preds = %55, %60, %57
  %65 = load i64, i64* %6, align 8, !tbaa !6
  %66 = getelementptr inbounds i8, i8* %25, i64 %65
  %67 = sub i64 %22, %65
  br label %21

68:                                               ; preds = %38, %80
  %69 = phi i64 [ 0, %38 ], [ %82, %80 ]
  %70 = phi i64 [ 1, %38 ], [ %81, %80 ]
  %71 = phi i64 [ 1, %38 ], [ %84, %80 ]
  %72 = getelementptr inbounds i8, i8* %25, i64 %71
  %73 = ptrtoint i8* %72 to i64
  %74 = sub i64 %39, %73
  %75 = call fastcc i32 @pat_next(i8* noundef %72, i64 noundef %74, i64* noundef nonnull %6, i32 noundef %4) #4
  switch i32 %75, label %78 [
    i32 -2, label %259
    i32 -5, label %76
  ]

76:                                               ; preds = %68
  %77 = add nsw i64 %71, 1
  br label %80

78:                                               ; preds = %68
  %79 = add i64 %69, 1
  br label %80

80:                                               ; preds = %76, %78
  %81 = phi i64 [ %70, %78 ], [ %77, %76 ]
  %82 = phi i64 [ %79, %78 ], [ 0, %76 ]
  %83 = load i64, i64* %6, align 8, !tbaa !6
  %84 = add nsw i64 %71, %83
  %85 = icmp sgt i64 %84, %30
  br i1 %85, label %86, label %68

86:                                               ; preds = %80
  %87 = getelementptr inbounds i8, i8* %25, i64 %81
  %88 = tail call i64 @strnlen(i8* noundef %23, i64 noundef %24) #5
  %89 = getelementptr inbounds i8, i8* %23, i64 %88
  %90 = icmp ult i64 %88, %82
  br i1 %90, label %259, label %91

91:                                               ; preds = %86
  %92 = icmp sgt i64 %88, 0
  %93 = icmp ne i64 %82, 0
  %94 = select i1 %92, i1 %93, i1 false
  br i1 %94, label %95, label %131

95:                                               ; preds = %91, %125
  %96 = phi i64 [ %127, %125 ], [ %82, %91 ]
  %97 = phi i8* [ %126, %125 ], [ %89, %91 ]
  %98 = getelementptr inbounds i8, i8* %97, i64 -1
  %99 = load i8, i8* %98, align 1, !tbaa !3
  %100 = icmp sgt i8 %99, -1
  br i1 %100, label %125, label %101

101:                                              ; preds = %95
  %102 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !10
  %103 = inttoptr i64 %102 to %struct.__pthread*
  %104 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %103, i64 0, i32 24
  %105 = load %struct.__locale_struct*, %struct.__locale_struct** %104, align 8, !tbaa !11
  %106 = getelementptr inbounds %struct.__locale_struct, %struct.__locale_struct* %105, i64 0, i32 0, i64 0
  %107 = load %struct.__locale_map*, %struct.__locale_map** %106, align 8, !tbaa !15
  %108 = icmp eq %struct.__locale_map* %107, null
  br i1 %108, label %125, label %109

109:                                              ; preds = %101
  %110 = getelementptr inbounds i8, i8* %97, i64 -1
  %111 = and i8 %99, -64
  %112 = icmp eq i8 %111, -128
  %113 = icmp ugt i8* %110, %23
  %114 = select i1 %112, i1 %113, i1 false
  br i1 %114, label %115, label %125

115:                                              ; preds = %109, %115
  %116 = phi i8* [ %120, %115 ], [ %110, %109 ]
  %117 = phi i8* [ %116, %115 ], [ %97, %109 ]
  %118 = getelementptr inbounds i8, i8* %117, i64 -2
  %119 = load i8, i8* %118, align 1, !tbaa !3
  %120 = getelementptr inbounds i8, i8* %116, i64 -1
  %121 = and i8 %119, -64
  %122 = icmp eq i8 %121, -128
  %123 = icmp ugt i8* %120, %23
  %124 = select i1 %122, i1 %123, i1 false
  br i1 %124, label %115, label %125

125:                                              ; preds = %115, %109, %95, %101
  %126 = phi i8* [ %98, %101 ], [ %98, %95 ], [ %110, %109 ], [ %120, %115 ]
  %127 = add i64 %96, -1
  %128 = icmp ugt i8* %126, %23
  %129 = icmp ne i64 %127, 0
  %130 = select i1 %128, i1 %129, i1 false
  br i1 %130, label %95, label %131

131:                                              ; preds = %125, %91
  %132 = phi i8* [ %89, %91 ], [ %126, %125 ]
  %133 = phi i1 [ %93, %91 ], [ %129, %125 ]
  br i1 %133, label %259, label %134

134:                                              ; preds = %34, %131
  %135 = phi i8* [ %37, %34 ], [ %132, %131 ]
  %136 = phi i8* [ %37, %34 ], [ %89, %131 ]
  %137 = phi i8* [ %35, %34 ], [ %87, %131 ]
  %138 = phi i64 [ 1, %34 ], [ %81, %131 ]
  %139 = ptrtoint i8* %32 to i64
  %140 = ptrtoint i8* %137 to i64
  %141 = sub i64 %139, %140
  %142 = call fastcc i32 @pat_next(i8* noundef %137, i64 noundef %141, i64* noundef nonnull %6, i32 noundef %4) #4
  %143 = load i64, i64* %6, align 8, !tbaa !6
  %144 = ptrtoint i8* %136 to i64
  %145 = ptrtoint i8* %135 to i64
  %146 = sub i64 %144, %145
  %147 = call fastcc i32 @str_next(i8* noundef %135, i64 noundef %146, i64* noundef nonnull %7) #4
  %148 = icmp slt i32 %147, 1
  br i1 %148, label %151, label %149

149:                                              ; preds = %134
  %150 = getelementptr inbounds i8, i8* %137, i64 %143
  br label %156

151:                                              ; preds = %178, %134
  %152 = phi i32 [ %142, %134 ], [ %181, %178 ]
  %153 = icmp eq i32 %152, 0
  br i1 %153, label %154, label %259

154:                                              ; preds = %151
  %155 = icmp sgt i64 %138, 1
  br i1 %155, label %192, label %259

156:                                              ; preds = %149, %178
  %157 = phi i32 [ %147, %149 ], [ %186, %178 ]
  %158 = phi i8* [ %150, %149 ], [ %183, %178 ]
  %159 = phi i32 [ %142, %149 ], [ %181, %178 ]
  %160 = phi i8* [ %135, %149 ], [ %163, %178 ]
  %161 = phi i8* [ %137, %149 ], [ %158, %178 ]
  %162 = load i64, i64* %7, align 8, !tbaa !6
  %163 = getelementptr inbounds i8, i8* %160, i64 %162
  br i1 %20, label %169, label %164

164:                                              ; preds = %156
  %165 = tail call i32 @towupper(i32 noundef %157) #5
  %166 = icmp eq i32 %165, %157
  br i1 %166, label %167, label %169

167:                                              ; preds = %164
  %168 = tail call i32 @towlower(i32 noundef %157) #5
  br label %169

169:                                              ; preds = %167, %164, %156
  %170 = phi i32 [ %157, %156 ], [ %168, %167 ], [ %165, %164 ]
  switch i32 %159, label %174 [
    i32 -3, label %171
    i32 -4, label %178
  ]

171:                                              ; preds = %169
  %172 = tail call fastcc i32 @match_bracket(i8* noundef %161, i32 noundef %157, i32 noundef %170) #4
  %173 = icmp eq i32 %172, 0
  br i1 %173, label %259, label %178

174:                                              ; preds = %169
  %175 = icmp eq i32 %157, %159
  %176 = icmp eq i32 %170, %159
  %177 = select i1 %175, i1 true, i1 %176
  br i1 %177, label %178, label %259

178:                                              ; preds = %169, %174, %171
  %179 = ptrtoint i8* %158 to i64
  %180 = sub i64 %139, %179
  %181 = call fastcc i32 @pat_next(i8* noundef %158, i64 noundef %180, i64* noundef nonnull %6, i32 noundef %4) #4
  %182 = load i64, i64* %6, align 8, !tbaa !6
  %183 = getelementptr inbounds i8, i8* %158, i64 %182
  %184 = ptrtoint i8* %163 to i64
  %185 = sub i64 %144, %184
  %186 = call fastcc i32 @str_next(i8* noundef %163, i64 noundef %185, i64* noundef nonnull %7) #4
  %187 = icmp slt i32 %186, 1
  br i1 %187, label %151, label %156

188:                                              ; preds = %253, %229, %192
  %189 = phi i8* [ %194, %192 ], [ %231, %229 ], [ %254, %253 ]
  %190 = phi i8* [ %199, %192 ], [ %236, %229 ], [ %257, %253 ]
  %191 = icmp ult i8* %190, %137
  br i1 %191, label %192, label %259

192:                                              ; preds = %154, %188
  %193 = phi i8* [ %190, %188 ], [ %28, %154 ]
  %194 = phi i8* [ %189, %188 ], [ %23, %154 ]
  %195 = ptrtoint i8* %193 to i64
  %196 = sub i64 %140, %195
  %197 = call fastcc i32 @pat_next(i8* noundef %193, i64 noundef %196, i64* noundef nonnull %6, i32 noundef %4) #4
  %198 = load i64, i64* %6, align 8, !tbaa !6
  %199 = getelementptr inbounds i8, i8* %193, i64 %198
  %200 = icmp eq i32 %197, -5
  br i1 %200, label %188, label %201

201:                                              ; preds = %192, %253
  %202 = phi i8* [ %257, %253 ], [ %199, %192 ]
  %203 = phi i32 [ %255, %253 ], [ %197, %192 ]
  %204 = phi i8* [ %254, %253 ], [ %194, %192 ]
  br label %205

205:                                              ; preds = %201, %229
  %206 = phi i8* [ %236, %229 ], [ %202, %201 ]
  %207 = phi i32 [ %234, %229 ], [ %203, %201 ]
  %208 = phi i8* [ %231, %229 ], [ %204, %201 ]
  %209 = phi i8* [ %206, %229 ], [ %193, %201 ]
  %210 = ptrtoint i8* %208 to i64
  %211 = sub i64 %145, %210
  %212 = call fastcc i32 @str_next(i8* noundef %208, i64 noundef %211, i64* noundef nonnull %7) #4
  %213 = icmp eq i32 %212, 0
  br i1 %213, label %259, label %214

214:                                              ; preds = %205
  br i1 %20, label %220, label %215

215:                                              ; preds = %214
  %216 = tail call i32 @towupper(i32 noundef %212) #5
  %217 = icmp eq i32 %216, %212
  br i1 %217, label %218, label %220

218:                                              ; preds = %215
  %219 = tail call i32 @towlower(i32 noundef %212) #5
  br label %220

220:                                              ; preds = %218, %215, %214
  %221 = phi i32 [ %212, %214 ], [ %219, %218 ], [ %216, %215 ]
  switch i32 %207, label %225 [
    i32 -3, label %222
    i32 -4, label %229
  ]

222:                                              ; preds = %220
  %223 = tail call fastcc i32 @match_bracket(i8* noundef %209, i32 noundef %212, i32 noundef %221) #4
  %224 = icmp eq i32 %223, 0
  br i1 %224, label %238, label %229

225:                                              ; preds = %220
  %226 = icmp eq i32 %212, %207
  %227 = icmp eq i32 %221, %207
  %228 = select i1 %226, i1 true, i1 %227
  br i1 %228, label %229, label %238

229:                                              ; preds = %220, %225, %222
  %230 = load i64, i64* %7, align 8, !tbaa !6
  %231 = getelementptr inbounds i8, i8* %208, i64 %230
  %232 = ptrtoint i8* %206 to i64
  %233 = sub i64 %140, %232
  %234 = call fastcc i32 @pat_next(i8* noundef %206, i64 noundef %233, i64* noundef nonnull %6, i32 noundef %4) #4
  %235 = load i64, i64* %6, align 8, !tbaa !6
  %236 = getelementptr inbounds i8, i8* %206, i64 %235
  %237 = icmp eq i32 %234, -5
  br i1 %237, label %188, label %205

238:                                              ; preds = %225, %222
  %239 = ptrtoint i8* %204 to i64
  %240 = sub i64 %145, %239
  %241 = call fastcc i32 @str_next(i8* noundef %204, i64 noundef %240, i64* noundef nonnull %7) #4
  %242 = icmp sgt i32 %241, 0
  br i1 %242, label %243, label %246

243:                                              ; preds = %238
  %244 = load i64, i64* %7, align 8, !tbaa !6
  %245 = getelementptr inbounds i8, i8* %204, i64 %244
  br label %253

246:                                              ; preds = %238, %246
  %247 = phi i8* [ %248, %246 ], [ %204, %238 ]
  %248 = getelementptr inbounds i8, i8* %247, i64 1
  %249 = ptrtoint i8* %248 to i64
  %250 = sub i64 %145, %249
  %251 = call fastcc i32 @str_next(i8* noundef nonnull %248, i64 noundef %250, i64* noundef nonnull %7) #4
  %252 = icmp slt i32 %251, 0
  br i1 %252, label %246, label %253

253:                                              ; preds = %246, %243
  %254 = phi i8* [ %245, %243 ], [ %248, %246 ]
  %255 = call fastcc i32 @pat_next(i8* noundef %193, i64 noundef %196, i64* noundef nonnull %6, i32 noundef %4) #4
  %256 = load i64, i64* %6, align 8, !tbaa !6
  %257 = getelementptr inbounds i8, i8* %193, i64 %256
  %258 = icmp eq i32 %255, -5
  br i1 %258, label %188, label %201

259:                                              ; preds = %60, %57, %21, %68, %174, %171, %188, %205, %154, %151, %131, %86, %15, %43
  %260 = phi i32 [ %45, %43 ], [ 1, %15 ], [ 1, %86 ], [ 1, %131 ], [ 1, %151 ], [ 0, %154 ], [ 1, %205 ], [ 0, %188 ], [ 1, %171 ], [ 1, %174 ], [ 1, %68 ], [ 1, %21 ], [ 1, %57 ], [ 1, %60 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %9) #3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %8) #3
  ret i32 %260
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @mbtowc(i32* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @str_next(i8* noundef %0, i64 noundef %1, i64* nocapture noundef writeonly %2) unnamed_addr #0 {
  %4 = alloca i32, align 4
  %5 = icmp eq i64 %1, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %3
  store i64 0, i64* %2, align 8, !tbaa !6
  br label %23

7:                                                ; preds = %3
  %8 = load i8, i8* %0, align 1, !tbaa !3
  %9 = icmp slt i8 %8, 0
  br i1 %9, label %10, label %20

10:                                               ; preds = %7
  %11 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %11) #3
  %12 = call i32 @mbtowc(i32* noundef nonnull %4, i8* noundef nonnull %0, i64 noundef %1) #5
  %13 = icmp slt i32 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %10
  store i64 1, i64* %2, align 8, !tbaa !6
  br label %18

15:                                               ; preds = %10
  %16 = zext i32 %12 to i64
  store i64 %16, i64* %2, align 8, !tbaa !6
  %17 = load i32, i32* %4, align 4, !tbaa !8
  br label %18

18:                                               ; preds = %15, %14
  %19 = phi i32 [ -1, %14 ], [ %17, %15 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %11) #3
  br label %23

20:                                               ; preds = %7
  store i64 1, i64* %2, align 8, !tbaa !6
  %21 = load i8, i8* %0, align 1, !tbaa !3
  %22 = sext i8 %21 to i32
  br label %23

23:                                               ; preds = %20, %18, %6
  %24 = phi i32 [ %19, %18 ], [ %22, %20 ], [ 0, %6 ]
  ret i32 %24
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @match_bracket(i8* noundef %0, i32 noundef %1, i32 noundef %2) unnamed_addr #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [16 x i8], align 16
  %7 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %7) #3
  %8 = getelementptr inbounds i8, i8* %0, i64 1
  %9 = load i8, i8* %8, align 1, !tbaa !3
  switch i8 %9, label %13 [
    i8 94, label %10
    i8 33, label %10
  ]

10:                                               ; preds = %3, %3
  %11 = getelementptr inbounds i8, i8* %0, i64 2
  %12 = load i8, i8* %11, align 1, !tbaa !3
  br label %13

13:                                               ; preds = %3, %10
  %14 = phi i8 [ %9, %3 ], [ %12, %10 ]
  %15 = phi i32 [ 1, %3 ], [ 0, %10 ]
  %16 = phi i32 [ 0, %3 ], [ 1, %10 ]
  %17 = phi i8* [ %8, %3 ], [ %11, %10 ]
  switch i8 %14, label %26 [
    i8 93, label %18
    i8 45, label %22
  ]

18:                                               ; preds = %13
  %19 = icmp eq i32 %1, 93
  br i1 %19, label %116, label %20

20:                                               ; preds = %18
  %21 = getelementptr inbounds i8, i8* %17, i64 1
  br label %26

22:                                               ; preds = %13
  %23 = icmp eq i32 %1, 45
  br i1 %23, label %116, label %24

24:                                               ; preds = %22
  %25 = getelementptr inbounds i8, i8* %17, i64 1
  br label %26

26:                                               ; preds = %13, %24, %20
  %27 = phi i8* [ %21, %20 ], [ %25, %24 ], [ %17, %13 ]
  %28 = getelementptr inbounds i8, i8* %27, i64 -1
  %29 = load i8, i8* %28, align 1, !tbaa !3
  %30 = sext i8 %29 to i32
  store i32 %30, i32* %4, align 4, !tbaa !8
  %31 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 0
  %32 = bitcast i32* %5 to i8*
  br label %33

33:                                               ; preds = %113, %26
  %34 = phi i8* [ %27, %26 ], [ %115, %113 ]
  %35 = load i8, i8* %34, align 1, !tbaa !3
  switch i8 %35, label %95 [
    i8 93, label %116
    i8 45, label %36
    i8 91, label %60
  ]

36:                                               ; preds = %33
  %37 = getelementptr inbounds i8, i8* %34, i64 1
  %38 = load i8, i8* %37, align 1, !tbaa !3
  %39 = icmp eq i8 %38, 93
  br i1 %39, label %97, label %40

40:                                               ; preds = %36
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %32) #3
  %41 = call i32 @mbtowc(i32* noundef nonnull %5, i8* noundef nonnull %37, i64 noundef 4) #5
  %42 = icmp slt i32 %41, 0
  br i1 %42, label %54, label %43

43:                                               ; preds = %40
  %44 = load i32, i32* %4, align 4, !tbaa !8
  %45 = load i32, i32* %5, align 4, !tbaa !8
  %46 = icmp slt i32 %45, %44
  br i1 %46, label %56, label %47

47:                                               ; preds = %43
  %48 = sub i32 %1, %44
  %49 = sub nsw i32 %45, %44
  %50 = icmp ugt i32 %48, %49
  %51 = sub i32 %2, %44
  %52 = icmp ugt i32 %51, %49
  %53 = and i1 %50, %52
  br i1 %53, label %56, label %54

54:                                               ; preds = %40, %47
  %55 = phi i32 [ %15, %47 ], [ 0, %40 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %32) #3
  br label %116

56:                                               ; preds = %43, %47
  %57 = add nsw i32 %41, -1
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i8, i8* %34, i64 %58
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %32) #3
  br label %113

60:                                               ; preds = %33
  %61 = getelementptr inbounds i8, i8* %34, i64 1
  %62 = load i8, i8* %61, align 1, !tbaa !3
  switch i8 %62, label %97 [
    i8 58, label %63
    i8 46, label %63
    i8 61, label %63
  ]

63:                                               ; preds = %60, %60, %60
  %64 = getelementptr inbounds i8, i8* %34, i64 3
  br label %65

65:                                               ; preds = %73, %63
  %66 = phi i8* [ %64, %63 ], [ %74, %73 ]
  %67 = getelementptr inbounds i8, i8* %66, i64 -1
  %68 = load i8, i8* %67, align 1, !tbaa !3
  %69 = icmp eq i8 %68, %62
  br i1 %69, label %70, label %73

70:                                               ; preds = %65
  %71 = load i8, i8* %66, align 1, !tbaa !3
  %72 = icmp eq i8 %71, 93
  br i1 %72, label %75, label %73

73:                                               ; preds = %65, %70
  %74 = getelementptr inbounds i8, i8* %66, i64 1
  br label %65

75:                                               ; preds = %70
  %76 = getelementptr inbounds i8, i8* %34, i64 2
  %77 = icmp eq i8 %62, 58
  br i1 %77, label %78, label %113

78:                                               ; preds = %75
  %79 = getelementptr inbounds i8, i8* %66, i64 -1
  %80 = ptrtoint i8* %79 to i64
  %81 = ptrtoint i8* %76 to i64
  %82 = sub i64 %80, %81
  %83 = icmp slt i64 %82, 16
  br i1 %83, label %84, label %113

84:                                               ; preds = %78
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %31) #3
  %85 = call i8* @memcpy(i8* noundef nonnull %31, i8* noundef nonnull %76, i64 noundef %82) #5
  %86 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 %82
  store i8 0, i8* %86, align 1, !tbaa !3
  %87 = call i64 @wctype(i8* noundef nonnull %31) #5
  %88 = call i32 @iswctype(i32 noundef %1, i64 noundef %87) #5
  %89 = icmp eq i32 %88, 0
  br i1 %89, label %91, label %90

90:                                               ; preds = %84
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %31) #3
  br label %116

91:                                               ; preds = %84
  %92 = call i64 @wctype(i8* noundef nonnull %31) #5
  %93 = call i32 @iswctype(i32 noundef %2, i64 noundef %92) #5
  %94 = icmp eq i32 %93, 0
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %31) #3
  br i1 %94, label %113, label %116

95:                                               ; preds = %33
  %96 = icmp sgt i8 %35, -1
  br i1 %96, label %97, label %99

97:                                               ; preds = %36, %60, %95
  %98 = zext i8 %35 to i32
  store i32 %98, i32* %4, align 4, !tbaa !8
  br label %107

99:                                               ; preds = %95
  %100 = call i32 @mbtowc(i32* noundef nonnull %4, i8* noundef nonnull %34, i64 noundef 4) #5
  %101 = icmp slt i32 %100, 0
  br i1 %101, label %116, label %102

102:                                              ; preds = %99
  %103 = add nsw i32 %100, -1
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i8, i8* %34, i64 %104
  %106 = load i32, i32* %4, align 4, !tbaa !8
  br label %107

107:                                              ; preds = %102, %97
  %108 = phi i32 [ %98, %97 ], [ %106, %102 ]
  %109 = phi i8* [ %34, %97 ], [ %105, %102 ]
  %110 = icmp eq i32 %108, %1
  %111 = icmp eq i32 %108, %2
  %112 = or i1 %110, %111
  br i1 %112, label %116, label %113

113:                                              ; preds = %91, %78, %75, %56, %107
  %114 = phi i8* [ %59, %56 ], [ %109, %107 ], [ %66, %75 ], [ %66, %78 ], [ %66, %91 ]
  %115 = getelementptr inbounds i8, i8* %114, i64 1
  br label %33

116:                                              ; preds = %33, %91, %107, %99, %90, %54, %22, %18
  %117 = phi i32 [ %15, %18 ], [ %15, %22 ], [ %55, %54 ], [ %15, %90 ], [ %15, %91 ], [ %16, %33 ], [ %15, %107 ], [ 0, %99 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %7) #3
  ret i32 %117
}

; Function Attrs: optsize
declare i64 @strnlen(i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @towupper(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @towlower(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @iswctype(i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @wctype(i8* noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin optsize strictfp "no-builtins" }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nounwind readnone strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"long", !4, i64 0}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !4, i64 0}
!10 = !{i64 303966}
!11 = !{!12, !13, i64 168}
!12 = !{!"__pthread", !13, i64 0, !13, i64 8, !13, i64 16, !13, i64 24, !7, i64 32, !7, i64 40, !9, i64 48, !9, i64 52, !9, i64 56, !9, i64 60, !4, i64 64, !4, i64 65, !4, i64 66, !4, i64 66, !13, i64 72, !7, i64 80, !13, i64 88, !7, i64 96, !7, i64 104, !13, i64 112, !13, i64 120, !13, i64 128, !14, i64 136, !9, i64 160, !9, i64 164, !13, i64 168, !4, i64 176, !13, i64 184, !13, i64 192}
!13 = !{!"any pointer", !4, i64 0}
!14 = !{!"", !13, i64 0, !7, i64 8, !13, i64 16}
!15 = !{!13, !13, i64 0}
