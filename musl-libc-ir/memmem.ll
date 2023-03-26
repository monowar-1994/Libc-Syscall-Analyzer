; ModuleID = 'src/string/memmem.c'
source_filename = "src/string/memmem.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind strictfp
define i8* @memmem(i8* noundef %0, i64 noundef %1, i8* noundef %2, i64 noundef %3) local_unnamed_addr #0 {
  %5 = icmp eq i64 %3, 0
  br i1 %5, label %142, label %6

6:                                                ; preds = %4
  %7 = icmp ult i64 %1, %3
  br i1 %7, label %142, label %8

8:                                                ; preds = %6
  %9 = load i8, i8* %2, align 1, !tbaa !3
  %10 = zext i8 %9 to i32
  %11 = tail call i8* @memchr(i8* noundef %0, i32 noundef %10, i64 noundef %1) #5
  %12 = icmp eq i8* %11, null
  %13 = icmp eq i64 %3, 1
  %14 = or i1 %13, %12
  br i1 %14, label %142, label %15

15:                                               ; preds = %8
  %16 = ptrtoint i8* %11 to i64
  %17 = ptrtoint i8* %0 to i64
  %18 = sub i64 %17, %16
  %19 = add i64 %18, %1
  %20 = icmp ult i64 %19, %3
  br i1 %20, label %142, label %21

21:                                               ; preds = %15
  switch i64 %3, label %139 [
    i64 2, label %22
    i64 3, label %27
    i64 4, label %79
  ]

22:                                               ; preds = %21
  %23 = load i8, i8* %2, align 1, !tbaa !3
  %24 = getelementptr i8, i8* %2, i64 1
  %25 = load i8, i8* %24, align 1, !tbaa !3
  %26 = tail call fastcc i8* @twobyte_memmem(i8* noundef nonnull %11, i64 noundef %19, i8 %23, i8 %25) #6
  br label %142

27:                                               ; preds = %21
  %28 = load i8, i8* %2, align 1, !tbaa !3
  %29 = getelementptr i8, i8* %2, i64 1
  %30 = load i8, i8* %29, align 1, !tbaa !3
  %31 = getelementptr i8, i8* %2, i64 2
  %32 = load i8, i8* %31, align 1, !tbaa !3
  %33 = zext i8 %28 to i32
  %34 = shl nuw i32 %33, 24
  %35 = zext i8 %30 to i32
  %36 = shl nuw nsw i32 %35, 16
  %37 = or i32 %36, %34
  %38 = zext i8 %32 to i32
  %39 = shl nuw nsw i32 %38, 8
  %40 = or i32 %37, %39
  %41 = load i8, i8* %11, align 1, !tbaa !3
  %42 = zext i8 %41 to i32
  %43 = shl nuw i32 %42, 24
  %44 = getelementptr inbounds i8, i8* %11, i64 1
  %45 = load i8, i8* %44, align 1, !tbaa !3
  %46 = zext i8 %45 to i32
  %47 = shl nuw nsw i32 %46, 16
  %48 = or i32 %47, %43
  %49 = getelementptr inbounds i8, i8* %11, i64 2
  %50 = load i8, i8* %49, align 1, !tbaa !3
  %51 = zext i8 %50 to i32
  %52 = shl nuw nsw i32 %51, 8
  %53 = or i32 %48, %52
  %54 = add i64 %19, -3
  %55 = icmp eq i64 %54, 0
  br i1 %55, label %73, label %56

56:                                               ; preds = %27
  %57 = getelementptr inbounds i8, i8* %11, i64 3
  br label %58

58:                                               ; preds = %65, %56
  %59 = phi i32 [ %71, %65 ], [ %53, %56 ]
  %60 = phi i8* [ %67, %65 ], [ %57, %56 ]
  %61 = phi i64 [ %66, %65 ], [ %54, %56 ]
  %62 = icmp eq i32 %59, %40
  br i1 %62, label %63, label %65

63:                                               ; preds = %58
  %64 = getelementptr inbounds i8, i8* %60, i64 -3
  br label %142

65:                                               ; preds = %58
  %66 = add i64 %61, -1
  %67 = getelementptr inbounds i8, i8* %60, i64 1
  %68 = load i8, i8* %60, align 1, !tbaa !3
  %69 = zext i8 %68 to i32
  %70 = or i32 %59, %69
  %71 = shl i32 %70, 8
  %72 = icmp eq i64 %66, 0
  br i1 %72, label %73, label %58

73:                                               ; preds = %65, %27
  %74 = phi i32 [ %53, %27 ], [ %71, %65 ]
  %75 = getelementptr inbounds i8, i8* %11, i64 %19
  %76 = icmp eq i32 %74, %40
  %77 = getelementptr inbounds i8, i8* %75, i64 -3
  %78 = select i1 %76, i8* %77, i8* null
  br label %142

79:                                               ; preds = %21
  %80 = load i8, i8* %2, align 1, !tbaa !3
  %81 = zext i8 %80 to i32
  %82 = shl nuw i32 %81, 24
  %83 = getelementptr inbounds i8, i8* %2, i64 1
  %84 = load i8, i8* %83, align 1, !tbaa !3
  %85 = zext i8 %84 to i32
  %86 = shl nuw nsw i32 %85, 16
  %87 = or i32 %86, %82
  %88 = getelementptr inbounds i8, i8* %2, i64 2
  %89 = load i8, i8* %88, align 1, !tbaa !3
  %90 = zext i8 %89 to i32
  %91 = shl nuw nsw i32 %90, 8
  %92 = or i32 %87, %91
  %93 = getelementptr inbounds i8, i8* %2, i64 3
  %94 = load i8, i8* %93, align 1, !tbaa !3
  %95 = zext i8 %94 to i32
  %96 = or i32 %92, %95
  %97 = load i8, i8* %11, align 1, !tbaa !3
  %98 = zext i8 %97 to i32
  %99 = shl nuw i32 %98, 24
  %100 = getelementptr inbounds i8, i8* %11, i64 1
  %101 = load i8, i8* %100, align 1, !tbaa !3
  %102 = zext i8 %101 to i32
  %103 = shl nuw nsw i32 %102, 16
  %104 = or i32 %103, %99
  %105 = getelementptr inbounds i8, i8* %11, i64 2
  %106 = load i8, i8* %105, align 1, !tbaa !3
  %107 = zext i8 %106 to i32
  %108 = shl nuw nsw i32 %107, 8
  %109 = or i32 %104, %108
  %110 = getelementptr inbounds i8, i8* %11, i64 3
  %111 = load i8, i8* %110, align 1, !tbaa !3
  %112 = zext i8 %111 to i32
  %113 = or i32 %109, %112
  %114 = add i64 %19, -4
  %115 = icmp eq i64 %114, 0
  br i1 %115, label %133, label %116

116:                                              ; preds = %79
  %117 = getelementptr inbounds i8, i8* %11, i64 4
  br label %118

118:                                              ; preds = %125, %116
  %119 = phi i32 [ %131, %125 ], [ %113, %116 ]
  %120 = phi i8* [ %128, %125 ], [ %117, %116 ]
  %121 = phi i64 [ %126, %125 ], [ %114, %116 ]
  %122 = icmp eq i32 %119, %96
  br i1 %122, label %123, label %125

123:                                              ; preds = %118
  %124 = getelementptr inbounds i8, i8* %120, i64 -4
  br label %142

125:                                              ; preds = %118
  %126 = add i64 %121, -1
  %127 = shl i32 %119, 8
  %128 = getelementptr inbounds i8, i8* %120, i64 1
  %129 = load i8, i8* %120, align 1, !tbaa !3
  %130 = zext i8 %129 to i32
  %131 = or i32 %127, %130
  %132 = icmp eq i64 %126, 0
  br i1 %132, label %133, label %118

133:                                              ; preds = %125, %79
  %134 = phi i32 [ %113, %79 ], [ %131, %125 ]
  %135 = getelementptr inbounds i8, i8* %11, i64 %19
  %136 = icmp eq i32 %134, %96
  %137 = getelementptr inbounds i8, i8* %135, i64 -4
  %138 = select i1 %136, i8* %137, i8* null
  br label %142

139:                                              ; preds = %21
  %140 = getelementptr inbounds i8, i8* %11, i64 %19
  %141 = tail call fastcc i8* @twoway_memmem(i8* noundef nonnull %11, i8* noundef %140, i8* noundef nonnull %2, i64 noundef %3) #6
  br label %142

142:                                              ; preds = %133, %123, %73, %63, %15, %8, %6, %4, %139, %22
  %143 = phi i8* [ %26, %22 ], [ %141, %139 ], [ %0, %4 ], [ null, %6 ], [ %11, %8 ], [ null, %15 ], [ %64, %63 ], [ %78, %73 ], [ %124, %123 ], [ %138, %133 ]
  ret i8* %143
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

declare i8* @memchr(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nofree norecurse nosync nounwind readonly strictfp
define internal fastcc i8* @twobyte_memmem(i8* noundef readonly %0, i64 noundef %1, i8 %2, i8 %3) unnamed_addr #3 {
  %5 = zext i8 %2 to i16
  %6 = shl nuw i16 %5, 8
  %7 = zext i8 %3 to i16
  %8 = or i16 %6, %7
  %9 = load i8, i8* %0, align 1, !tbaa !3
  %10 = zext i8 %9 to i16
  %11 = shl nuw i16 %10, 8
  %12 = getelementptr inbounds i8, i8* %0, i64 1
  %13 = load i8, i8* %12, align 1, !tbaa !3
  %14 = zext i8 %13 to i16
  %15 = or i16 %11, %14
  %16 = add i64 %1, -2
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %35, label %18

18:                                               ; preds = %4
  %19 = getelementptr inbounds i8, i8* %0, i64 2
  br label %20

20:                                               ; preds = %18, %27
  %21 = phi i16 [ %33, %27 ], [ %15, %18 ]
  %22 = phi i8* [ %30, %27 ], [ %19, %18 ]
  %23 = phi i64 [ %28, %27 ], [ %16, %18 ]
  %24 = icmp eq i16 %21, %8
  br i1 %24, label %25, label %27

25:                                               ; preds = %20
  %26 = getelementptr inbounds i8, i8* %22, i64 -2
  br label %41

27:                                               ; preds = %20
  %28 = add i64 %23, -1
  %29 = shl i16 %21, 8
  %30 = getelementptr inbounds i8, i8* %22, i64 1
  %31 = load i8, i8* %22, align 1, !tbaa !3
  %32 = zext i8 %31 to i16
  %33 = or i16 %29, %32
  %34 = icmp eq i64 %28, 0
  br i1 %34, label %35, label %20

35:                                               ; preds = %27, %4
  %36 = phi i16 [ %15, %4 ], [ %33, %27 ]
  %37 = getelementptr inbounds i8, i8* %0, i64 %1
  %38 = icmp eq i16 %36, %8
  %39 = getelementptr inbounds i8, i8* %37, i64 -2
  %40 = select i1 %38, i8* %39, i8* null
  br label %41

41:                                               ; preds = %35, %25
  %42 = phi i8* [ %26, %25 ], [ %40, %35 ]
  ret i8* %42
}

; Function Attrs: nounwind strictfp
define internal fastcc i8* @twoway_memmem(i8* noundef %0, i8* noundef %1, i8* noundef %2, i64 noundef %3) unnamed_addr #0 {
  %5 = alloca [4 x i64], align 16
  %6 = alloca [256 x i64], align 16
  %7 = bitcast [4 x i64]* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %7) #7
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(32) %7, i8 0, i64 32, i1 false) #8
  %8 = bitcast [256 x i64]* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 2048, i8* nonnull %8) #7
  %9 = icmp eq i64 %3, 0
  br i1 %9, label %122, label %10

10:                                               ; preds = %4
  %11 = and i64 %3, 1
  %12 = icmp eq i64 %3, 1
  br i1 %12, label %15, label %13

13:                                               ; preds = %10
  %14 = and i64 %3, -2
  br label %32

15:                                               ; preds = %32, %10
  %16 = phi i64 [ 0, %10 ], [ %55, %32 ]
  %17 = icmp eq i64 %11, 0
  br i1 %17, label %30, label %18

18:                                               ; preds = %15
  %19 = getelementptr inbounds i8, i8* %2, i64 %16
  %20 = load i8, i8* %19, align 1, !tbaa !3
  %21 = zext i8 %20 to i64
  %22 = and i64 %21, 63
  %23 = shl nuw i64 1, %22
  %24 = lshr i64 %21, 6
  %25 = getelementptr inbounds [4 x i64], [4 x i64]* %5, i64 0, i64 %24
  %26 = load i64, i64* %25, align 8, !tbaa !6
  %27 = or i64 %23, %26
  store i64 %27, i64* %25, align 8, !tbaa !6
  %28 = add nuw i64 %16, 1
  %29 = getelementptr inbounds [256 x i64], [256 x i64]* %6, i64 0, i64 %21
  store i64 %28, i64* %29, align 8, !tbaa !6
  br label %30

30:                                               ; preds = %15, %18
  %31 = icmp ugt i64 %3, 1
  br i1 %31, label %60, label %122

32:                                               ; preds = %32, %13
  %33 = phi i64 [ 0, %13 ], [ %55, %32 ]
  %34 = phi i64 [ 0, %13 ], [ %57, %32 ]
  %35 = getelementptr inbounds i8, i8* %2, i64 %33
  %36 = load i8, i8* %35, align 1, !tbaa !3
  %37 = zext i8 %36 to i64
  %38 = and i64 %37, 63
  %39 = shl nuw i64 1, %38
  %40 = lshr i64 %37, 6
  %41 = getelementptr inbounds [4 x i64], [4 x i64]* %5, i64 0, i64 %40
  %42 = load i64, i64* %41, align 8, !tbaa !6
  %43 = or i64 %39, %42
  store i64 %43, i64* %41, align 8, !tbaa !6
  %44 = or i64 %33, 1
  %45 = getelementptr inbounds [256 x i64], [256 x i64]* %6, i64 0, i64 %37
  store i64 %44, i64* %45, align 8, !tbaa !6
  %46 = getelementptr inbounds i8, i8* %2, i64 %44
  %47 = load i8, i8* %46, align 1, !tbaa !3
  %48 = zext i8 %47 to i64
  %49 = and i64 %48, 63
  %50 = shl nuw i64 1, %49
  %51 = lshr i64 %48, 6
  %52 = getelementptr inbounds [4 x i64], [4 x i64]* %5, i64 0, i64 %51
  %53 = load i64, i64* %52, align 8, !tbaa !6
  %54 = or i64 %50, %53
  store i64 %54, i64* %52, align 8, !tbaa !6
  %55 = add nuw i64 %33, 2
  %56 = getelementptr inbounds [256 x i64], [256 x i64]* %6, i64 0, i64 %48
  store i64 %55, i64* %56, align 8, !tbaa !6
  %57 = add i64 %34, 2
  %58 = icmp eq i64 %57, %14
  br i1 %58, label %15, label %32

59:                                               ; preds = %84
  br i1 %31, label %91, label %122

60:                                               ; preds = %30, %84
  %61 = phi i64 [ %89, %84 ], [ 1, %30 ]
  %62 = phi i64 [ %88, %84 ], [ 1, %30 ]
  %63 = phi i64 [ %87, %84 ], [ 1, %30 ]
  %64 = phi i64 [ %86, %84 ], [ 0, %30 ]
  %65 = phi i64 [ %85, %84 ], [ -1, %30 ]
  %66 = add i64 %63, %65
  %67 = getelementptr inbounds i8, i8* %2, i64 %66
  %68 = load i8, i8* %67, align 1, !tbaa !3
  %69 = getelementptr inbounds i8, i8* %2, i64 %61
  %70 = load i8, i8* %69, align 1, !tbaa !3
  %71 = icmp eq i8 %68, %70
  br i1 %71, label %72, label %78

72:                                               ; preds = %60
  %73 = icmp eq i64 %63, %62
  br i1 %73, label %74, label %76

74:                                               ; preds = %72
  %75 = add i64 %62, %64
  br label %84

76:                                               ; preds = %72
  %77 = add i64 %63, 1
  br label %84

78:                                               ; preds = %60
  %79 = icmp ugt i8 %68, %70
  br i1 %79, label %80, label %82

80:                                               ; preds = %78
  %81 = sub i64 %61, %65
  br label %84

82:                                               ; preds = %78
  %83 = add i64 %64, 1
  br label %84

84:                                               ; preds = %80, %82, %74, %76
  %85 = phi i64 [ %65, %74 ], [ %65, %76 ], [ %65, %80 ], [ %64, %82 ]
  %86 = phi i64 [ %75, %74 ], [ %64, %76 ], [ %61, %80 ], [ %83, %82 ]
  %87 = phi i64 [ 1, %74 ], [ %77, %76 ], [ 1, %80 ], [ 1, %82 ]
  %88 = phi i64 [ %62, %74 ], [ %62, %76 ], [ %81, %80 ], [ 1, %82 ]
  %89 = add i64 %87, %86
  %90 = icmp ult i64 %89, %3
  br i1 %90, label %60, label %59

91:                                               ; preds = %59, %115
  %92 = phi i64 [ %120, %115 ], [ 1, %59 ]
  %93 = phi i64 [ %119, %115 ], [ 1, %59 ]
  %94 = phi i64 [ %118, %115 ], [ 1, %59 ]
  %95 = phi i64 [ %117, %115 ], [ 0, %59 ]
  %96 = phi i64 [ %116, %115 ], [ -1, %59 ]
  %97 = add i64 %94, %96
  %98 = getelementptr inbounds i8, i8* %2, i64 %97
  %99 = load i8, i8* %98, align 1, !tbaa !3
  %100 = getelementptr inbounds i8, i8* %2, i64 %92
  %101 = load i8, i8* %100, align 1, !tbaa !3
  %102 = icmp eq i8 %99, %101
  br i1 %102, label %103, label %109

103:                                              ; preds = %91
  %104 = icmp eq i64 %94, %93
  br i1 %104, label %105, label %107

105:                                              ; preds = %103
  %106 = add i64 %93, %95
  br label %115

107:                                              ; preds = %103
  %108 = add i64 %94, 1
  br label %115

109:                                              ; preds = %91
  %110 = icmp ult i8 %99, %101
  br i1 %110, label %111, label %113

111:                                              ; preds = %109
  %112 = sub i64 %92, %96
  br label %115

113:                                              ; preds = %109
  %114 = add i64 %95, 1
  br label %115

115:                                              ; preds = %111, %113, %105, %107
  %116 = phi i64 [ %96, %105 ], [ %96, %107 ], [ %96, %111 ], [ %95, %113 ]
  %117 = phi i64 [ %106, %105 ], [ %95, %107 ], [ %92, %111 ], [ %114, %113 ]
  %118 = phi i64 [ 1, %105 ], [ %108, %107 ], [ 1, %111 ], [ 1, %113 ]
  %119 = phi i64 [ %93, %105 ], [ %93, %107 ], [ %112, %111 ], [ 1, %113 ]
  %120 = add i64 %118, %117
  %121 = icmp ult i64 %120, %3
  br i1 %121, label %91, label %122

122:                                              ; preds = %115, %30, %4, %59
  %123 = phi i64 [ %88, %59 ], [ 1, %4 ], [ 1, %30 ], [ %88, %115 ]
  %124 = phi i64 [ %85, %59 ], [ -1, %4 ], [ -1, %30 ], [ %85, %115 ]
  %125 = phi i64 [ -1, %59 ], [ -1, %4 ], [ -1, %30 ], [ %116, %115 ]
  %126 = phi i64 [ 1, %59 ], [ 1, %4 ], [ 1, %30 ], [ %119, %115 ]
  %127 = add i64 %125, 1
  %128 = add i64 %124, 1
  %129 = icmp ugt i64 %127, %128
  %130 = select i1 %129, i64 %126, i64 %123
  %131 = select i1 %129, i64 %125, i64 %124
  %132 = getelementptr inbounds i8, i8* %2, i64 %130
  %133 = add i64 %131, 1
  %134 = tail call i32 @memcmp(i8* noundef %2, i8* noundef %132, i64 noundef %133) #5
  %135 = icmp eq i32 %134, 0
  br i1 %135, label %142, label %136

136:                                              ; preds = %122
  %137 = xor i64 %131, -1
  %138 = add i64 %137, %3
  %139 = icmp ugt i64 %131, %138
  %140 = select i1 %139, i64 %131, i64 %138
  %141 = add i64 %140, 1
  br label %144

142:                                              ; preds = %122
  %143 = sub i64 %3, %130
  br label %144

144:                                              ; preds = %142, %136
  %145 = phi i64 [ %141, %136 ], [ %130, %142 ]
  %146 = phi i64 [ 0, %136 ], [ %143, %142 ]
  %147 = ptrtoint i8* %1 to i64
  %148 = ptrtoint i8* %0 to i64
  %149 = sub i64 %147, %148
  %150 = icmp ult i64 %149, %3
  br i1 %150, label %208, label %151

151:                                              ; preds = %144
  %152 = add i64 %3, -1
  br label %153

153:                                              ; preds = %151, %174
  %154 = phi i64 [ 0, %151 ], [ %176, %174 ]
  %155 = phi i8* [ %0, %151 ], [ %177, %174 ]
  %156 = getelementptr inbounds i8, i8* %155, i64 %152
  %157 = load i8, i8* %156, align 1, !tbaa !3
  %158 = zext i8 %157 to i64
  %159 = lshr i64 %158, 6
  %160 = getelementptr inbounds [4 x i64], [4 x i64]* %5, i64 0, i64 %159
  %161 = load i64, i64* %160, align 8, !tbaa !6
  %162 = and i64 %158, 63
  %163 = shl nuw i64 1, %162
  %164 = and i64 %163, %161
  %165 = icmp eq i64 %164, 0
  br i1 %165, label %174, label %166

166:                                              ; preds = %153
  %167 = getelementptr inbounds [256 x i64], [256 x i64]* %6, i64 0, i64 %158
  %168 = load i64, i64* %167, align 8, !tbaa !6
  %169 = sub i64 %3, %168
  %170 = icmp eq i64 %169, 0
  br i1 %170, label %181, label %171

171:                                              ; preds = %166
  %172 = icmp ult i64 %169, %154
  %173 = select i1 %172, i64 %154, i64 %169
  br label %174

174:                                              ; preds = %201, %153, %171, %196
  %175 = phi i64 [ %173, %171 ], [ %197, %196 ], [ %3, %153 ], [ %145, %201 ]
  %176 = phi i64 [ 0, %171 ], [ 0, %196 ], [ 0, %153 ], [ %146, %201 ]
  %177 = getelementptr inbounds i8, i8* %155, i64 %175
  %178 = ptrtoint i8* %177 to i64
  %179 = sub i64 %147, %178
  %180 = icmp ult i64 %179, %3
  br i1 %180, label %208, label %153

181:                                              ; preds = %166
  %182 = icmp ugt i64 %133, %154
  %183 = select i1 %182, i64 %133, i64 %154
  %184 = icmp ult i64 %183, %3
  br i1 %184, label %186, label %185

185:                                              ; preds = %193, %181
  br label %198

186:                                              ; preds = %181, %193
  %187 = phi i64 [ %194, %193 ], [ %183, %181 ]
  %188 = getelementptr inbounds i8, i8* %2, i64 %187
  %189 = load i8, i8* %188, align 1, !tbaa !3
  %190 = getelementptr inbounds i8, i8* %155, i64 %187
  %191 = load i8, i8* %190, align 1, !tbaa !3
  %192 = icmp eq i8 %189, %191
  br i1 %192, label %193, label %196

193:                                              ; preds = %186
  %194 = add i64 %187, 1
  %195 = icmp eq i64 %194, %3
  br i1 %195, label %185, label %186

196:                                              ; preds = %186
  %197 = sub i64 %187, %131
  br label %174

198:                                              ; preds = %185, %201
  %199 = phi i64 [ %202, %201 ], [ %133, %185 ]
  %200 = icmp ugt i64 %199, %154
  br i1 %200, label %201, label %208

201:                                              ; preds = %198
  %202 = add i64 %199, -1
  %203 = getelementptr inbounds i8, i8* %2, i64 %202
  %204 = load i8, i8* %203, align 1, !tbaa !3
  %205 = getelementptr inbounds i8, i8* %155, i64 %202
  %206 = load i8, i8* %205, align 1, !tbaa !3
  %207 = icmp eq i8 %204, %206
  br i1 %207, label %198, label %174

208:                                              ; preds = %174, %198, %144
  %209 = phi i8* [ null, %144 ], [ %155, %198 ], [ null, %174 ]
  call void @llvm.lifetime.end.p0i8(i64 2048, i8* nonnull %8) #7
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %7) #7
  ret i8* %209
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare i32 @memcmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

attributes #0 = { nounwind strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree norecurse nosync nounwind readonly strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #5 = { nobuiltin nounwind strictfp "no-builtins" }
attributes #6 = { nobuiltin strictfp "no-builtins" }
attributes #7 = { nounwind strictfp }
attributes #8 = { strictfp }

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
