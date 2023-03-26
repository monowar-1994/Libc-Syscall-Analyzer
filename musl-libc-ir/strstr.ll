; ModuleID = 'src/string/strstr.c'
source_filename = "src/string/strstr.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind strictfp
define i8* @strstr(i8* noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = load i8, i8* %1, align 1, !tbaa !3
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %103, label %5

5:                                                ; preds = %2
  %6 = sext i8 %3 to i32
  %7 = tail call i8* @strchr(i8* noundef %0, i32 noundef %6) #5
  %8 = icmp eq i8* %7, null
  br i1 %8, label %103, label %9

9:                                                ; preds = %5
  %10 = getelementptr inbounds i8, i8* %1, i64 1
  %11 = load i8, i8* %10, align 1, !tbaa !3
  %12 = icmp eq i8 %11, 0
  br i1 %12, label %103, label %13

13:                                               ; preds = %9
  %14 = getelementptr inbounds i8, i8* %7, i64 1
  %15 = load i8, i8* %14, align 1, !tbaa !3
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %103, label %17

17:                                               ; preds = %13
  %18 = getelementptr inbounds i8, i8* %1, i64 2
  %19 = load i8, i8* %18, align 1, !tbaa !3
  %20 = icmp eq i8 %19, 0
  br i1 %20, label %21, label %48

21:                                               ; preds = %17
  %22 = load i8, i8* %1, align 1, !tbaa !3
  %23 = zext i8 %22 to i32
  %24 = shl nuw nsw i32 %23, 8
  %25 = zext i8 %11 to i32
  %26 = or i32 %24, %25
  %27 = load i8, i8* %7, align 1, !tbaa !3
  %28 = zext i8 %27 to i32
  %29 = shl nuw nsw i32 %28, 8
  %30 = zext i8 %15 to i32
  %31 = or i32 %29, %30
  %32 = icmp eq i32 %31, %26
  br i1 %32, label %46, label %33

33:                                               ; preds = %21, %33
  %34 = phi i32 [ %42, %33 ], [ %31, %21 ]
  %35 = phi i8* [ %37, %33 ], [ %14, %21 ]
  %36 = shl nuw nsw i32 %34, 8
  %37 = getelementptr inbounds i8, i8* %35, i64 1
  %38 = load i8, i8* %37, align 1, !tbaa !3
  %39 = zext i8 %38 to i32
  %40 = icmp ne i8 %38, 0
  %41 = and i32 %36, 65280
  %42 = or i32 %41, %39
  %43 = icmp ne i32 %42, %26
  %44 = select i1 %40, i1 %43, i1 false
  br i1 %44, label %33, label %45

45:                                               ; preds = %33
  br i1 %40, label %46, label %103

46:                                               ; preds = %21, %45
  %47 = phi i8* [ %35, %45 ], [ %7, %21 ]
  br label %103

48:                                               ; preds = %17
  %49 = getelementptr inbounds i8, i8* %7, i64 2
  %50 = load i8, i8* %49, align 1, !tbaa !3
  %51 = icmp eq i8 %50, 0
  br i1 %51, label %103, label %52

52:                                               ; preds = %48
  %53 = getelementptr inbounds i8, i8* %1, i64 3
  %54 = load i8, i8* %53, align 1, !tbaa !3
  %55 = icmp eq i8 %54, 0
  br i1 %55, label %56, label %91

56:                                               ; preds = %52
  %57 = load i8, i8* %1, align 1, !tbaa !3
  %58 = zext i8 %57 to i32
  %59 = shl nuw i32 %58, 24
  %60 = zext i8 %11 to i32
  %61 = shl nuw nsw i32 %60, 16
  %62 = zext i8 %19 to i32
  %63 = shl nuw nsw i32 %62, 8
  %64 = or i32 %63, %61
  %65 = or i32 %64, %59
  %66 = load i8, i8* %7, align 1, !tbaa !3
  %67 = zext i8 %66 to i32
  %68 = shl nuw i32 %67, 24
  %69 = zext i8 %15 to i32
  %70 = shl nuw nsw i32 %69, 16
  %71 = zext i8 %50 to i32
  %72 = shl nuw nsw i32 %71, 8
  %73 = or i32 %72, %70
  %74 = or i32 %73, %68
  %75 = icmp eq i32 %74, %65
  br i1 %75, label %89, label %76

76:                                               ; preds = %56, %76
  %77 = phi i32 [ %83, %76 ], [ %74, %56 ]
  %78 = phi i8* [ %79, %76 ], [ %49, %56 ]
  %79 = getelementptr inbounds i8, i8* %78, i64 1
  %80 = load i8, i8* %79, align 1, !tbaa !3
  %81 = zext i8 %80 to i32
  %82 = or i32 %77, %81
  %83 = shl i32 %82, 8
  %84 = icmp ne i8 %80, 0
  %85 = icmp ne i32 %83, %65
  %86 = select i1 %84, i1 %85, i1 false
  br i1 %86, label %76, label %87

87:                                               ; preds = %76
  %88 = getelementptr inbounds i8, i8* %78, i64 -1
  br i1 %84, label %89, label %103

89:                                               ; preds = %56, %87
  %90 = phi i8* [ %88, %87 ], [ %7, %56 ]
  br label %103

91:                                               ; preds = %52
  %92 = getelementptr inbounds i8, i8* %7, i64 3
  %93 = load i8, i8* %92, align 1, !tbaa !3
  %94 = icmp eq i8 %93, 0
  br i1 %94, label %103, label %95

95:                                               ; preds = %91
  %96 = getelementptr inbounds i8, i8* %1, i64 4
  %97 = load i8, i8* %96, align 1, !tbaa !3
  %98 = icmp eq i8 %97, 0
  br i1 %98, label %99, label %101

99:                                               ; preds = %95
  %100 = tail call fastcc i8* @fourbyte_strstr(i8* noundef nonnull %7, i8* noundef nonnull %1) #6
  br label %103

101:                                              ; preds = %95
  %102 = tail call fastcc i8* @twoway_strstr(i8* noundef nonnull %7, i8* noundef nonnull %1) #6
  br label %103

103:                                              ; preds = %89, %87, %46, %45, %91, %48, %13, %5, %9, %2, %101, %99
  %104 = phi i8* [ %102, %101 ], [ %100, %99 ], [ %0, %2 ], [ %7, %9 ], [ null, %5 ], [ null, %13 ], [ null, %48 ], [ null, %91 ], [ %47, %46 ], [ null, %45 ], [ %90, %89 ], [ null, %87 ]
  ret i8* %104
}

declare i8* @strchr(i8* noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nofree norecurse nosync nounwind readonly strictfp
define internal fastcc i8* @fourbyte_strstr(i8* noundef readonly %0, i8* nocapture noundef readonly %1) unnamed_addr #2 {
  %3 = load i8, i8* %1, align 1, !tbaa !3
  %4 = zext i8 %3 to i32
  %5 = shl nuw i32 %4, 24
  %6 = getelementptr inbounds i8, i8* %1, i64 1
  %7 = load i8, i8* %6, align 1, !tbaa !3
  %8 = zext i8 %7 to i32
  %9 = shl nuw nsw i32 %8, 16
  %10 = or i32 %9, %5
  %11 = getelementptr inbounds i8, i8* %1, i64 2
  %12 = load i8, i8* %11, align 1, !tbaa !3
  %13 = zext i8 %12 to i32
  %14 = shl nuw nsw i32 %13, 8
  %15 = or i32 %10, %14
  %16 = getelementptr inbounds i8, i8* %1, i64 3
  %17 = load i8, i8* %16, align 1, !tbaa !3
  %18 = zext i8 %17 to i32
  %19 = or i32 %15, %18
  %20 = load i8, i8* %0, align 1, !tbaa !3
  %21 = zext i8 %20 to i32
  %22 = shl nuw i32 %21, 24
  %23 = getelementptr inbounds i8, i8* %0, i64 1
  %24 = load i8, i8* %23, align 1, !tbaa !3
  %25 = zext i8 %24 to i32
  %26 = shl nuw nsw i32 %25, 16
  %27 = or i32 %26, %22
  %28 = getelementptr inbounds i8, i8* %0, i64 2
  %29 = load i8, i8* %28, align 1, !tbaa !3
  %30 = zext i8 %29 to i32
  %31 = shl nuw nsw i32 %30, 8
  %32 = or i32 %27, %31
  %33 = getelementptr inbounds i8, i8* %0, i64 3
  %34 = load i8, i8* %33, align 1, !tbaa !3
  %35 = zext i8 %34 to i32
  %36 = or i32 %32, %35
  %37 = icmp ne i8 %34, 0
  %38 = icmp ne i32 %36, %19
  %39 = select i1 %37, i1 %38, i1 false
  br i1 %39, label %40, label %51

40:                                               ; preds = %2, %40
  %41 = phi i32 [ %47, %40 ], [ %36, %2 ]
  %42 = phi i8* [ %44, %40 ], [ %33, %2 ]
  %43 = shl i32 %41, 8
  %44 = getelementptr inbounds i8, i8* %42, i64 1
  %45 = load i8, i8* %44, align 1, !tbaa !3
  %46 = zext i8 %45 to i32
  %47 = or i32 %43, %46
  %48 = icmp ne i8 %45, 0
  %49 = icmp ne i32 %47, %19
  %50 = select i1 %48, i1 %49, i1 false
  br i1 %50, label %40, label %51

51:                                               ; preds = %40, %2
  %52 = phi i8* [ %33, %2 ], [ %44, %40 ]
  %53 = phi i1 [ %37, %2 ], [ %48, %40 ]
  %54 = getelementptr inbounds i8, i8* %52, i64 -3
  %55 = select i1 %53, i8* %54, i8* null
  ret i8* %55
}

; Function Attrs: nounwind strictfp
define internal fastcc i8* @twoway_strstr(i8* noundef %0, i8* noundef %1) unnamed_addr #0 {
  %3 = alloca [4 x i64], align 16
  %4 = alloca [256 x i64], align 16
  %5 = bitcast [4 x i64]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %5) #7
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(32) %5, i8 0, i64 32, i1 false) #8
  %6 = bitcast [256 x i64]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 2048, i8* nonnull %6) #7
  %7 = load i8, i8* %1, align 1, !tbaa !3
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %93, label %11

9:                                                ; preds = %17
  %10 = icmp ugt i64 %25, 1
  br i1 %10, label %31, label %93

11:                                               ; preds = %2, %17
  %12 = phi i8 [ %28, %17 ], [ %7, %2 ]
  %13 = phi i64 [ %25, %17 ], [ 0, %2 ]
  %14 = getelementptr inbounds i8, i8* %0, i64 %13
  %15 = load i8, i8* %14, align 1, !tbaa !3
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %192, label %17

17:                                               ; preds = %11
  %18 = zext i8 %12 to i64
  %19 = and i64 %18, 63
  %20 = shl nuw i64 1, %19
  %21 = lshr i64 %18, 6
  %22 = getelementptr inbounds [4 x i64], [4 x i64]* %3, i64 0, i64 %21
  %23 = load i64, i64* %22, align 8, !tbaa !6
  %24 = or i64 %23, %20
  store i64 %24, i64* %22, align 8, !tbaa !6
  %25 = add i64 %13, 1
  %26 = getelementptr inbounds [256 x i64], [256 x i64]* %4, i64 0, i64 %18
  store i64 %25, i64* %26, align 8, !tbaa !6
  %27 = getelementptr inbounds i8, i8* %1, i64 %25
  %28 = load i8, i8* %27, align 1, !tbaa !3
  %29 = icmp eq i8 %28, 0
  br i1 %29, label %9, label %11

30:                                               ; preds = %55
  br i1 %10, label %62, label %93

31:                                               ; preds = %9, %55
  %32 = phi i64 [ %60, %55 ], [ 1, %9 ]
  %33 = phi i64 [ %59, %55 ], [ 1, %9 ]
  %34 = phi i64 [ %58, %55 ], [ 1, %9 ]
  %35 = phi i64 [ %57, %55 ], [ 0, %9 ]
  %36 = phi i64 [ %56, %55 ], [ -1, %9 ]
  %37 = add i64 %34, %36
  %38 = getelementptr inbounds i8, i8* %1, i64 %37
  %39 = load i8, i8* %38, align 1, !tbaa !3
  %40 = getelementptr inbounds i8, i8* %1, i64 %32
  %41 = load i8, i8* %40, align 1, !tbaa !3
  %42 = icmp eq i8 %39, %41
  br i1 %42, label %43, label %49

43:                                               ; preds = %31
  %44 = icmp eq i64 %34, %33
  br i1 %44, label %45, label %47

45:                                               ; preds = %43
  %46 = add i64 %33, %35
  br label %55

47:                                               ; preds = %43
  %48 = add i64 %34, 1
  br label %55

49:                                               ; preds = %31
  %50 = icmp ugt i8 %39, %41
  br i1 %50, label %51, label %53

51:                                               ; preds = %49
  %52 = sub i64 %32, %36
  br label %55

53:                                               ; preds = %49
  %54 = add i64 %35, 1
  br label %55

55:                                               ; preds = %51, %53, %45, %47
  %56 = phi i64 [ %36, %45 ], [ %36, %47 ], [ %36, %51 ], [ %35, %53 ]
  %57 = phi i64 [ %46, %45 ], [ %35, %47 ], [ %32, %51 ], [ %54, %53 ]
  %58 = phi i64 [ 1, %45 ], [ %48, %47 ], [ 1, %51 ], [ 1, %53 ]
  %59 = phi i64 [ %33, %45 ], [ %33, %47 ], [ %52, %51 ], [ 1, %53 ]
  %60 = add i64 %58, %57
  %61 = icmp ult i64 %60, %25
  br i1 %61, label %31, label %30

62:                                               ; preds = %30, %86
  %63 = phi i64 [ %91, %86 ], [ 1, %30 ]
  %64 = phi i64 [ %90, %86 ], [ 1, %30 ]
  %65 = phi i64 [ %89, %86 ], [ 1, %30 ]
  %66 = phi i64 [ %88, %86 ], [ 0, %30 ]
  %67 = phi i64 [ %87, %86 ], [ -1, %30 ]
  %68 = add i64 %65, %67
  %69 = getelementptr inbounds i8, i8* %1, i64 %68
  %70 = load i8, i8* %69, align 1, !tbaa !3
  %71 = getelementptr inbounds i8, i8* %1, i64 %63
  %72 = load i8, i8* %71, align 1, !tbaa !3
  %73 = icmp eq i8 %70, %72
  br i1 %73, label %74, label %80

74:                                               ; preds = %62
  %75 = icmp eq i64 %65, %64
  br i1 %75, label %76, label %78

76:                                               ; preds = %74
  %77 = add i64 %64, %66
  br label %86

78:                                               ; preds = %74
  %79 = add i64 %65, 1
  br label %86

80:                                               ; preds = %62
  %81 = icmp ult i8 %70, %72
  br i1 %81, label %82, label %84

82:                                               ; preds = %80
  %83 = sub i64 %63, %67
  br label %86

84:                                               ; preds = %80
  %85 = add i64 %66, 1
  br label %86

86:                                               ; preds = %82, %84, %76, %78
  %87 = phi i64 [ %67, %76 ], [ %67, %78 ], [ %67, %82 ], [ %66, %84 ]
  %88 = phi i64 [ %77, %76 ], [ %66, %78 ], [ %63, %82 ], [ %85, %84 ]
  %89 = phi i64 [ 1, %76 ], [ %79, %78 ], [ 1, %82 ], [ 1, %84 ]
  %90 = phi i64 [ %64, %76 ], [ %64, %78 ], [ %83, %82 ], [ 1, %84 ]
  %91 = add i64 %89, %88
  %92 = icmp ult i64 %91, %25
  br i1 %92, label %62, label %93

93:                                               ; preds = %86, %2, %9, %30
  %94 = phi i64 [ %59, %30 ], [ 1, %9 ], [ 1, %2 ], [ %59, %86 ]
  %95 = phi i64 [ %56, %30 ], [ -1, %9 ], [ -1, %2 ], [ %56, %86 ]
  %96 = phi i64 [ %25, %30 ], [ %25, %9 ], [ 0, %2 ], [ %25, %86 ]
  %97 = phi i64 [ -1, %30 ], [ -1, %9 ], [ -1, %2 ], [ %87, %86 ]
  %98 = phi i64 [ 1, %30 ], [ 1, %9 ], [ 1, %2 ], [ %90, %86 ]
  %99 = add i64 %97, 1
  %100 = add i64 %95, 1
  %101 = icmp ugt i64 %99, %100
  %102 = select i1 %101, i64 %98, i64 %94
  %103 = select i1 %101, i64 %97, i64 %95
  %104 = getelementptr inbounds i8, i8* %1, i64 %102
  %105 = add i64 %103, 1
  %106 = tail call i32 @memcmp(i8* noundef nonnull %1, i8* noundef nonnull %104, i64 noundef %105) #5
  %107 = icmp eq i32 %106, 0
  br i1 %107, label %114, label %108

108:                                              ; preds = %93
  %109 = xor i64 %103, -1
  %110 = add i64 %96, %109
  %111 = icmp ugt i64 %103, %110
  %112 = select i1 %111, i64 %103, i64 %110
  %113 = add i64 %112, 1
  br label %116

114:                                              ; preds = %93
  %115 = sub i64 %96, %102
  br label %116

116:                                              ; preds = %114, %108
  %117 = phi i64 [ %113, %108 ], [ %102, %114 ]
  %118 = phi i64 [ 0, %108 ], [ %115, %114 ]
  %119 = or i64 %96, 63
  %120 = add i64 %96, -1
  br label %121

121:                                              ; preds = %158, %116
  %122 = phi i8* [ %0, %116 ], [ %139, %158 ]
  %123 = phi i64 [ 0, %116 ], [ %160, %158 ]
  %124 = phi i8* [ %0, %116 ], [ %161, %158 ]
  %125 = ptrtoint i8* %122 to i64
  %126 = ptrtoint i8* %124 to i64
  %127 = sub i64 %125, %126
  %128 = icmp ult i64 %127, %96
  br i1 %128, label %129, label %138

129:                                              ; preds = %121
  %130 = tail call i8* @memchr(i8* noundef %122, i32 noundef 0, i64 noundef %119) #5
  %131 = icmp eq i8* %130, null
  br i1 %131, label %136, label %132

132:                                              ; preds = %129
  %133 = ptrtoint i8* %130 to i64
  %134 = sub i64 %133, %126
  %135 = icmp ult i64 %134, %96
  br i1 %135, label %192, label %138

136:                                              ; preds = %129
  %137 = getelementptr inbounds i8, i8* %122, i64 %119
  br label %138

138:                                              ; preds = %132, %136, %121
  %139 = phi i8* [ %122, %121 ], [ %130, %132 ], [ %137, %136 ]
  %140 = getelementptr inbounds i8, i8* %124, i64 %120
  %141 = load i8, i8* %140, align 1, !tbaa !3
  %142 = zext i8 %141 to i64
  %143 = lshr i64 %142, 6
  %144 = getelementptr inbounds [4 x i64], [4 x i64]* %3, i64 0, i64 %143
  %145 = load i64, i64* %144, align 8, !tbaa !6
  %146 = and i64 %142, 63
  %147 = shl nuw i64 1, %146
  %148 = and i64 %147, %145
  %149 = icmp eq i64 %148, 0
  br i1 %149, label %158, label %150

150:                                              ; preds = %138
  %151 = getelementptr inbounds [256 x i64], [256 x i64]* %4, i64 0, i64 %142
  %152 = load i64, i64* %151, align 8, !tbaa !6
  %153 = sub i64 %96, %152
  %154 = icmp eq i64 %153, 0
  br i1 %154, label %162, label %155

155:                                              ; preds = %150
  %156 = icmp ult i64 %153, %123
  %157 = select i1 %156, i64 %123, i64 %153
  br label %158

158:                                              ; preds = %185, %138, %155, %180
  %159 = phi i64 [ %157, %155 ], [ %181, %180 ], [ %96, %138 ], [ %117, %185 ]
  %160 = phi i64 [ 0, %155 ], [ 0, %180 ], [ 0, %138 ], [ %118, %185 ]
  %161 = getelementptr inbounds i8, i8* %124, i64 %159
  br label %121

162:                                              ; preds = %150
  %163 = icmp ugt i64 %105, %123
  %164 = select i1 %163, i64 %105, i64 %123
  %165 = getelementptr inbounds i8, i8* %1, i64 %164
  %166 = load i8, i8* %165, align 1, !tbaa !3
  %167 = icmp eq i8 %166, 0
  br i1 %167, label %168, label %169

168:                                              ; preds = %175, %162
  br label %182

169:                                              ; preds = %162, %175
  %170 = phi i8 [ %178, %175 ], [ %166, %162 ]
  %171 = phi i64 [ %176, %175 ], [ %164, %162 ]
  %172 = getelementptr inbounds i8, i8* %124, i64 %171
  %173 = load i8, i8* %172, align 1, !tbaa !3
  %174 = icmp eq i8 %170, %173
  br i1 %174, label %175, label %180

175:                                              ; preds = %169
  %176 = add i64 %171, 1
  %177 = getelementptr inbounds i8, i8* %1, i64 %176
  %178 = load i8, i8* %177, align 1, !tbaa !3
  %179 = icmp eq i8 %178, 0
  br i1 %179, label %168, label %169

180:                                              ; preds = %169
  %181 = sub i64 %171, %103
  br label %158

182:                                              ; preds = %168, %185
  %183 = phi i64 [ %186, %185 ], [ %105, %168 ]
  %184 = icmp ugt i64 %183, %123
  br i1 %184, label %185, label %192

185:                                              ; preds = %182
  %186 = add i64 %183, -1
  %187 = getelementptr inbounds i8, i8* %1, i64 %186
  %188 = load i8, i8* %187, align 1, !tbaa !3
  %189 = getelementptr inbounds i8, i8* %124, i64 %186
  %190 = load i8, i8* %189, align 1, !tbaa !3
  %191 = icmp eq i8 %188, %190
  br i1 %191, label %182, label %158

192:                                              ; preds = %11, %132, %182
  %193 = phi i8* [ %124, %182 ], [ null, %132 ], [ null, %11 ]
  call void @llvm.lifetime.end.p0i8(i64 2048, i8* nonnull %6) #7
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %5) #7
  ret i8* %193
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare i32 @memcmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

declare i8* @memchr(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #1

attributes #0 = { nounwind strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree norecurse nosync nounwind readonly strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nosync nounwind willreturn }
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
