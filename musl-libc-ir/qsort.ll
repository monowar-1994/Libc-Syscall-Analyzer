; ModuleID = 'src/stdlib/qsort.c'
source_filename = "src/stdlib/qsort.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.__qsort_r.p = private unnamed_addr constant [2 x i64] [i64 1, i64 0], align 16

@qsort_r = weak alias void (i8*, i64, i64, i32 (i8*, i8*, i8*)*, i8*), void (i8*, i64, i64, i32 (i8*, i8*, i8*)*, i8*)* @__qsort_r

; Function Attrs: nounwind optsize strictfp
define hidden void @__qsort_r(i8* noundef %0, i64 noundef %1, i64 noundef %2, i32 (i8*, i8*, i8*)* nocapture noundef readonly %3, i8* noundef %4) #0 {
  %6 = alloca [96 x i64], align 16
  %7 = alloca [2 x i64], align 16
  %8 = bitcast [96 x i64]* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 768, i8* nonnull %8) #5
  %9 = mul i64 %2, %1
  %10 = bitcast [2 x i64]* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %10) #5
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(16) %10, i8* noundef nonnull align 16 dereferenceable(16) bitcast ([2 x i64]* @__const.__qsort_r.p to i8*), i64 16, i1 false) #6
  %11 = icmp eq i64 %9, 0
  br i1 %11, label %155, label %12

12:                                               ; preds = %5
  %13 = sub i64 0, %2
  %14 = getelementptr inbounds [96 x i64], [96 x i64]* %6, i64 0, i64 1
  store i64 %2, i64* %14, align 8, !tbaa !3
  %15 = getelementptr inbounds [96 x i64], [96 x i64]* %6, i64 0, i64 0
  store i64 %2, i64* %15, align 16, !tbaa !3
  br label %16

16:                                               ; preds = %16, %12
  %17 = phi i64 [ %2, %12 ], [ %21, %16 ]
  %18 = phi i64 [ %2, %12 ], [ %17, %16 ]
  %19 = phi i64 [ 2, %12 ], [ %24, %16 ]
  %20 = add i64 %18, %2
  %21 = add i64 %20, %17
  %22 = getelementptr inbounds [96 x i64], [96 x i64]* %6, i64 0, i64 %19
  store i64 %21, i64* %22, align 8, !tbaa !3
  %23 = icmp ult i64 %21, %9
  %24 = add i64 %19, 1
  br i1 %23, label %16, label %25

25:                                               ; preds = %16
  %26 = getelementptr inbounds i8, i8* %0, i64 %9
  %27 = getelementptr inbounds i8, i8* %26, i64 %13
  %28 = icmp ugt i8* %27, %0
  br i1 %28, label %29, label %79

29:                                               ; preds = %25
  %30 = getelementptr inbounds [2 x i64], [2 x i64]* %7, i64 0, i64 0
  %31 = ptrtoint i8* %27 to i64
  %32 = getelementptr inbounds [2 x i64], [2 x i64]* %7, i64 0, i64 1
  br label %33

33:                                               ; preds = %29, %72
  %34 = phi i64 [ 0, %29 ], [ %74, %72 ]
  %35 = phi i64 [ 1, %29 ], [ %76, %72 ]
  %36 = phi i32 [ 1, %29 ], [ %75, %72 ]
  %37 = phi i8* [ %0, %29 ], [ %77, %72 ]
  %38 = and i64 %35, 3
  %39 = icmp eq i64 %38, 3
  br i1 %39, label %40, label %44

40:                                               ; preds = %33
  call fastcc void @sift(i8* noundef %37, i64 noundef %2, i32 (i8*, i8*, i8*)* noundef %3, i8* noundef %4, i32 noundef %36, i64* noundef nonnull %15) #7
  %41 = tail call i64 @llvm.fshl.i64(i64 %34, i64 %35, i64 62)
  %42 = lshr i64 %34, 2
  store i64 %42, i64* %32, align 8, !tbaa !3
  %43 = add nsw i32 %36, 2
  br label %72

44:                                               ; preds = %33
  %45 = add nsw i32 %36, -1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [96 x i64], [96 x i64]* %6, i64 0, i64 %46
  %48 = load i64, i64* %47, align 8, !tbaa !3
  %49 = ptrtoint i8* %37 to i64
  %50 = sub i64 %31, %49
  %51 = icmp ult i64 %48, %50
  br i1 %51, label %53, label %52

52:                                               ; preds = %44
  call fastcc void @trinkle(i8* noundef %37, i64 noundef %2, i32 (i8*, i8*, i8*)* noundef %3, i8* noundef %4, i64* noundef nonnull %30, i32 noundef %36, i32 noundef 0, i64* noundef nonnull %15) #7
  br label %54

53:                                               ; preds = %44
  call fastcc void @sift(i8* noundef %37, i64 noundef %2, i32 (i8*, i8*, i8*)* noundef %3, i8* noundef %4, i32 noundef %36, i64* noundef nonnull %15) #7
  br label %54

54:                                               ; preds = %53, %52
  %55 = icmp eq i32 %36, 1
  br i1 %55, label %56, label %59

56:                                               ; preds = %54
  %57 = tail call i64 @llvm.fshl.i64(i64 %34, i64 %35, i64 1)
  store i64 %57, i64* %32, align 8, !tbaa !3
  %58 = shl i64 %35, 1
  br label %72

59:                                               ; preds = %54
  %60 = icmp ugt i32 %45, 63
  %61 = add i32 %36, -65
  %62 = select i1 %60, i64 0, i64 %35
  %63 = select i1 %60, i32 %61, i32 %45
  %64 = select i1 %60, i64 %35, i64 %34
  %65 = zext i32 %63 to i64
  %66 = shl i64 %64, %65
  %67 = sext i32 %63 to i64
  %68 = sub nsw i64 64, %67
  %69 = lshr i64 %62, %68
  %70 = or i64 %66, %69
  store i64 %70, i64* %32, align 8, !tbaa !3
  %71 = shl i64 %62, %65
  br label %72

72:                                               ; preds = %56, %59, %40
  %73 = phi i64 [ %41, %40 ], [ %58, %56 ], [ %71, %59 ]
  %74 = phi i64 [ %42, %40 ], [ %57, %56 ], [ %70, %59 ]
  %75 = phi i32 [ %43, %40 ], [ 0, %56 ], [ 1, %59 ]
  %76 = or i64 %73, 1
  store i64 %76, i64* %30, align 16, !tbaa !3
  %77 = getelementptr inbounds i8, i8* %37, i64 %2
  %78 = icmp ult i8* %77, %27
  br i1 %78, label %33, label %79

79:                                               ; preds = %72, %25
  %80 = phi i64 [ 0, %25 ], [ %74, %72 ]
  %81 = phi i64 [ 1, %25 ], [ %76, %72 ]
  %82 = phi i8* [ %0, %25 ], [ %77, %72 ]
  %83 = phi i32 [ 1, %25 ], [ %75, %72 ]
  %84 = getelementptr inbounds [2 x i64], [2 x i64]* %7, i64 0, i64 0
  call fastcc void @trinkle(i8* noundef %82, i64 noundef %2, i32 (i8*, i8*, i8*)* noundef %3, i8* noundef %4, i64* noundef nonnull %84, i32 noundef %83, i32 noundef 0, i64* noundef nonnull %15) #7
  %85 = getelementptr inbounds [2 x i64], [2 x i64]* %7, i64 0, i64 1
  %86 = icmp ne i32 %83, 1
  %87 = icmp ne i64 %81, 1
  %88 = select i1 %86, i1 true, i1 %87
  %89 = icmp ne i64 %80, 0
  %90 = select i1 %88, i1 true, i1 %89
  br i1 %90, label %91, label %155

91:                                               ; preds = %79, %145
  %92 = phi i64 [ %146, %145 ], [ %80, %79 ]
  %93 = phi i64 [ %147, %145 ], [ %81, %79 ]
  %94 = phi i32 [ %148, %145 ], [ %83, %79 ]
  %95 = phi i8* [ %149, %145 ], [ %82, %79 ]
  %96 = icmp slt i32 %94, 2
  br i1 %96, label %97, label %125

97:                                               ; preds = %91
  %98 = add i64 %93, -1
  %99 = tail call i64 asm "bsf $1,$0", "=r,r,~{dirflag},~{fpsr},~{flags}"(i64 %98) #8, !srcloc !7
  %100 = trunc i64 %99 to i32
  %101 = icmp eq i32 %100, 0
  br i1 %101, label %102, label %107

102:                                              ; preds = %97
  %103 = tail call i64 asm "bsf $1,$0", "=r,r,~{dirflag},~{fpsr},~{flags}"(i64 %92) #8, !srcloc !7
  %104 = trunc i64 %103 to i32
  %105 = add i32 %104, 64
  %106 = icmp eq i32 %104, 0
  br i1 %106, label %112, label %107

107:                                              ; preds = %102, %97
  %108 = phi i32 [ %100, %97 ], [ %105, %102 ]
  %109 = icmp ugt i32 %108, 63
  br i1 %109, label %110, label %112

110:                                              ; preds = %107
  %111 = add i32 %108, -64
  br label %112

112:                                              ; preds = %107, %102, %110
  %113 = phi i64 [ %92, %110 ], [ %93, %102 ], [ %93, %107 ]
  %114 = phi i32 [ %108, %110 ], [ 0, %102 ], [ %108, %107 ]
  %115 = phi i64 [ 0, %110 ], [ %92, %102 ], [ %92, %107 ]
  %116 = phi i32 [ %111, %110 ], [ 0, %102 ], [ %108, %107 ]
  %117 = zext i32 %116 to i64
  %118 = lshr i64 %113, %117
  %119 = sext i32 %116 to i64
  %120 = sub nsw i64 64, %119
  %121 = shl i64 %115, %120
  %122 = or i64 %121, %118
  store i64 %122, i64* %84, align 16, !tbaa !3
  %123 = lshr i64 %115, %117
  store i64 %123, i64* %85, align 8, !tbaa !3
  %124 = add nsw i32 %114, %94
  br label %145

125:                                              ; preds = %91
  %126 = tail call i64 @llvm.fshl.i64(i64 %92, i64 %93, i64 2)
  %127 = add nsw i32 %94, -2
  %128 = shl i64 %93, 1
  %129 = and i64 %128, 9223372036854775806
  %130 = shl i64 %126, 63
  %131 = or i64 %130, %129
  %132 = xor i64 %131, 3
  store i64 %132, i64* %84, align 16, !tbaa !3
  %133 = lshr i64 %126, 1
  store i64 %133, i64* %85, align 8, !tbaa !3
  %134 = zext i32 %127 to i64
  %135 = getelementptr inbounds [96 x i64], [96 x i64]* %6, i64 0, i64 %134
  %136 = load i64, i64* %135, align 8, !tbaa !3
  %137 = sub i64 0, %136
  %138 = getelementptr inbounds i8, i8* %95, i64 %13
  %139 = getelementptr inbounds i8, i8* %138, i64 %137
  %140 = add nsw i32 %94, -1
  call fastcc void @trinkle(i8* noundef %139, i64 noundef %2, i32 (i8*, i8*, i8*)* noundef %3, i8* noundef %4, i64* noundef nonnull %84, i32 noundef %140, i32 noundef 1, i64* noundef nonnull %15) #7
  %141 = tail call i64 @llvm.fshl.i64(i64 %133, i64 %130, i64 1)
  store i64 %141, i64* %85, align 8, !tbaa !3
  %142 = shl i64 %132, 1
  %143 = or i64 %142, 1
  store i64 %143, i64* %84, align 16, !tbaa !3
  %144 = getelementptr inbounds i8, i8* %95, i64 %13
  call fastcc void @trinkle(i8* noundef %144, i64 noundef %2, i32 (i8*, i8*, i8*)* noundef %3, i8* noundef %4, i64* noundef nonnull %84, i32 noundef %127, i32 noundef 1, i64* noundef nonnull %15) #7
  br label %145

145:                                              ; preds = %125, %112
  %146 = phi i64 [ %123, %112 ], [ %141, %125 ]
  %147 = phi i64 [ %122, %112 ], [ %143, %125 ]
  %148 = phi i32 [ %124, %112 ], [ %127, %125 ]
  %149 = getelementptr inbounds i8, i8* %95, i64 %13
  %150 = icmp ne i32 %148, 1
  %151 = icmp ne i64 %147, 1
  %152 = select i1 %150, i1 true, i1 %151
  %153 = icmp ne i64 %146, 0
  %154 = select i1 %152, i1 true, i1 %153
  br i1 %154, label %91, label %155

155:                                              ; preds = %145, %79, %5
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %10) #5
  call void @llvm.lifetime.end.p0i8(i64 768, i8* nonnull %8) #5
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @sift(i8* noundef %0, i64 noundef %1, i32 (i8*, i8*, i8*)* nocapture noundef readonly %2, i8* noundef %3, i32 noundef %4, i64* nocapture noundef readonly %5) unnamed_addr #0 {
  %7 = alloca [113 x i8*], align 16
  %8 = bitcast [113 x i8*]* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 904, i8* nonnull %8) #5
  %9 = getelementptr inbounds [113 x i8*], [113 x i8*]* %7, i64 0, i64 0
  store i8* %0, i8** %9, align 16, !tbaa !8
  %10 = icmp sgt i32 %4, 1
  br i1 %10, label %11, label %41

11:                                               ; preds = %6
  %12 = sub i64 0, %1
  br label %13

13:                                               ; preds = %11, %29
  %14 = phi i64 [ 1, %11 ], [ %36, %29 ]
  %15 = phi i8* [ %0, %11 ], [ %33, %29 ]
  %16 = phi i32 [ %4, %11 ], [ %34, %29 ]
  %17 = getelementptr inbounds i8, i8* %15, i64 %12
  %18 = add nsw i32 %16, -2
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds i64, i64* %5, i64 %19
  %21 = load i64, i64* %20, align 8, !tbaa !3
  %22 = sub i64 0, %21
  %23 = getelementptr inbounds i8, i8* %17, i64 %22
  %24 = tail call i32 %2(i8* noundef %0, i8* noundef %23, i8* noundef %3) #9
  %25 = icmp sgt i32 %24, -1
  br i1 %25, label %26, label %29

26:                                               ; preds = %13
  %27 = tail call i32 %2(i8* noundef %0, i8* noundef %17, i8* noundef %3) #9
  %28 = icmp sgt i32 %27, -1
  br i1 %28, label %38, label %29

29:                                               ; preds = %26, %13
  %30 = tail call i32 %2(i8* noundef %23, i8* noundef %17, i8* noundef %3) #9
  %31 = icmp sgt i32 %30, -1
  %32 = add nsw i32 %16, -1
  %33 = select i1 %31, i8* %23, i8* %17
  %34 = select i1 %31, i32 %32, i32 %18
  %35 = getelementptr inbounds [113 x i8*], [113 x i8*]* %7, i64 0, i64 %14
  store i8* %33, i8** %35, align 8
  %36 = add nuw i64 %14, 1
  %37 = icmp sgt i32 %34, 1
  br i1 %37, label %13, label %38

38:                                               ; preds = %26, %29
  %39 = phi i64 [ %36, %29 ], [ %14, %26 ]
  %40 = trunc i64 %39 to i32
  br label %41

41:                                               ; preds = %38, %6
  %42 = phi i32 [ 1, %6 ], [ %40, %38 ]
  call fastcc void @cycle(i64 noundef %1, i8** noundef nonnull %9, i32 noundef %42) #7
  call void @llvm.lifetime.end.p0i8(i64 904, i8* nonnull %8) #5
  ret void
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @trinkle(i8* noundef %0, i64 noundef %1, i32 (i8*, i8*, i8*)* nocapture noundef readonly %2, i8* noundef %3, i64* nocapture noundef readonly %4, i32 noundef %5, i32 noundef %6, i64* nocapture noundef readonly %7) unnamed_addr #0 {
  %9 = alloca [113 x i8*], align 16
  %10 = bitcast [113 x i8*]* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 904, i8* nonnull %10) #5
  %11 = load i64, i64* %4, align 8, !tbaa !3
  %12 = getelementptr inbounds i64, i64* %4, i64 1
  %13 = load i64, i64* %12, align 8, !tbaa !3
  %14 = getelementptr inbounds [113 x i8*], [113 x i8*]* %9, i64 0, i64 0
  store i8* %0, i8** %14, align 16, !tbaa !8
  %15 = icmp ne i64 %11, 1
  %16 = icmp ne i64 %13, 0
  %17 = select i1 %15, i1 true, i1 %16
  br i1 %17, label %18, label %86

18:                                               ; preds = %8
  %19 = sub i64 0, %1
  br label %20

20:                                               ; preds = %18, %68
  %21 = phi i64 [ 1, %18 ], [ %52, %68 ]
  %22 = phi i8* [ %0, %18 ], [ %31, %68 ]
  %23 = phi i32 [ %5, %18 ], [ %80, %68 ]
  %24 = phi i32 [ %6, %18 ], [ 0, %68 ]
  %25 = phi i64 [ %13, %18 ], [ %79, %68 ]
  %26 = phi i64 [ %11, %18 ], [ %78, %68 ]
  %27 = sext i32 %23 to i64
  %28 = getelementptr inbounds i64, i64* %7, i64 %27
  %29 = load i64, i64* %28, align 8, !tbaa !3
  %30 = sub i64 0, %29
  %31 = getelementptr inbounds i8, i8* %22, i64 %30
  %32 = tail call i32 %2(i8* noundef %31, i8* noundef %0, i8* noundef %3) #9
  %33 = icmp slt i32 %32, 1
  br i1 %33, label %84, label %34

34:                                               ; preds = %20
  %35 = icmp eq i32 %24, 0
  %36 = icmp sgt i32 %23, 1
  %37 = select i1 %35, i1 %36, i1 false
  br i1 %37, label %38, label %51

38:                                               ; preds = %34
  %39 = getelementptr inbounds i8, i8* %22, i64 %19
  %40 = add nsw i32 %23, -2
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds i64, i64* %7, i64 %41
  %43 = load i64, i64* %42, align 8, !tbaa !3
  %44 = tail call i32 %2(i8* noundef %39, i8* noundef %31, i8* noundef %3) #9
  %45 = icmp sgt i32 %44, -1
  br i1 %45, label %92, label %46

46:                                               ; preds = %38
  %47 = sub i64 0, %43
  %48 = getelementptr inbounds i8, i8* %39, i64 %47
  %49 = tail call i32 %2(i8* noundef %48, i8* noundef %31, i8* noundef %3) #9
  %50 = icmp sgt i32 %49, -1
  br i1 %50, label %92, label %51

51:                                               ; preds = %46, %34
  %52 = add nuw i64 %21, 1
  %53 = getelementptr inbounds [113 x i8*], [113 x i8*]* %9, i64 0, i64 %21
  store i8* %31, i8** %53, align 8, !tbaa !8
  %54 = add i64 %26, -1
  %55 = tail call i64 asm "bsf $1,$0", "=r,r,~{dirflag},~{fpsr},~{flags}"(i64 %54) #8, !srcloc !7
  %56 = trunc i64 %55 to i32
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %58, label %63

58:                                               ; preds = %51
  %59 = tail call i64 asm "bsf $1,$0", "=r,r,~{dirflag},~{fpsr},~{flags}"(i64 %25) #8, !srcloc !7
  %60 = trunc i64 %59 to i32
  %61 = add i32 %60, 64
  %62 = icmp eq i32 %60, 0
  br i1 %62, label %68, label %63

63:                                               ; preds = %58, %51
  %64 = phi i32 [ %56, %51 ], [ %61, %58 ]
  %65 = icmp ugt i32 %64, 63
  br i1 %65, label %66, label %68

66:                                               ; preds = %63
  %67 = add i32 %64, -64
  br label %68

68:                                               ; preds = %58, %63, %66
  %69 = phi i32 [ %64, %66 ], [ %64, %63 ], [ 0, %58 ]
  %70 = phi i64 [ 0, %66 ], [ %25, %63 ], [ %25, %58 ]
  %71 = phi i64 [ %25, %66 ], [ %26, %63 ], [ %26, %58 ]
  %72 = phi i32 [ %67, %66 ], [ %64, %63 ], [ 0, %58 ]
  %73 = zext i32 %72 to i64
  %74 = lshr i64 %71, %73
  %75 = sext i32 %72 to i64
  %76 = sub nsw i64 64, %75
  %77 = shl i64 %70, %76
  %78 = or i64 %77, %74
  %79 = lshr i64 %70, %73
  %80 = add nsw i32 %69, %23
  %81 = icmp ne i64 %78, 1
  %82 = icmp ne i64 %79, 0
  %83 = select i1 %81, i1 true, i1 %82
  br i1 %83, label %20, label %92

84:                                               ; preds = %20
  %85 = trunc i64 %21 to i32
  br label %86

86:                                               ; preds = %84, %8
  %87 = phi i32 [ %6, %8 ], [ %24, %84 ]
  %88 = phi i32 [ %5, %8 ], [ %23, %84 ]
  %89 = phi i32 [ 1, %8 ], [ %85, %84 ]
  %90 = phi i8* [ %0, %8 ], [ %22, %84 ]
  %91 = icmp eq i32 %87, 0
  br i1 %91, label %97, label %101

92:                                               ; preds = %68, %46, %38
  %93 = phi i64 [ %21, %38 ], [ %21, %46 ], [ %52, %68 ]
  %94 = phi i32 [ %23, %38 ], [ %23, %46 ], [ %80, %68 ]
  %95 = phi i8* [ %22, %38 ], [ %22, %46 ], [ %31, %68 ]
  %96 = trunc i64 %93 to i32
  br label %97

97:                                               ; preds = %92, %86
  %98 = phi i32 [ %88, %86 ], [ %94, %92 ]
  %99 = phi i32 [ %89, %86 ], [ %96, %92 ]
  %100 = phi i8* [ %90, %86 ], [ %95, %92 ]
  call fastcc void @cycle(i64 noundef %1, i8** noundef nonnull %14, i32 noundef %99) #7
  tail call fastcc void @sift(i8* noundef %100, i64 noundef %1, i32 (i8*, i8*, i8*)* noundef %2, i8* noundef %3, i32 noundef %98, i64* noundef %7) #7
  br label %101

101:                                              ; preds = %97, %86
  call void @llvm.lifetime.end.p0i8(i64 904, i8* nonnull %10) #5
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @cycle(i64 noundef %0, i8** nocapture noundef %1, i32 noundef %2) unnamed_addr #0 {
  %4 = alloca [256 x i8], align 16
  %5 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %5) #5
  %6 = icmp slt i32 %2, 2
  br i1 %6, label %34, label %7

7:                                                ; preds = %3
  %8 = zext i32 %2 to i64
  %9 = getelementptr inbounds i8*, i8** %1, i64 %8
  store i8* %5, i8** %9, align 8, !tbaa !8
  %10 = icmp eq i64 %0, 0
  br i1 %10, label %34, label %11

11:                                               ; preds = %7, %32
  %12 = phi i8* [ %33, %32 ], [ %5, %7 ]
  %13 = phi i64 [ %30, %32 ], [ %0, %7 ]
  %14 = icmp ult i64 %13, 256
  %15 = select i1 %14, i64 %13, i64 256
  %16 = load i8*, i8** %1, align 8, !tbaa !8
  %17 = call i8* @memcpy(i8* noundef %12, i8* noundef %16, i64 noundef %15) #9
  br label %18

18:                                               ; preds = %11, %18
  %19 = phi i64 [ 0, %11 ], [ %22, %18 ]
  %20 = getelementptr inbounds i8*, i8** %1, i64 %19
  %21 = load i8*, i8** %20, align 8, !tbaa !8
  %22 = add nuw nsw i64 %19, 1
  %23 = getelementptr inbounds i8*, i8** %1, i64 %22
  %24 = load i8*, i8** %23, align 8, !tbaa !8
  %25 = call i8* @memcpy(i8* noundef %21, i8* noundef %24, i64 noundef %15) #9
  %26 = load i8*, i8** %20, align 8, !tbaa !8
  %27 = getelementptr inbounds i8, i8* %26, i64 %15
  store i8* %27, i8** %20, align 8, !tbaa !8
  %28 = icmp eq i64 %22, %8
  br i1 %28, label %29, label %18

29:                                               ; preds = %18
  %30 = sub i64 %13, %15
  %31 = icmp eq i64 %30, 0
  br i1 %31, label %34, label %32

32:                                               ; preds = %29
  %33 = load i8*, i8** %9, align 8, !tbaa !8
  br label %11

34:                                               ; preds = %29, %7, %3
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %5) #5
  ret void
}

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.fshl.i64(i64, i64, i64) #4

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { nounwind strictfp }
attributes #6 = { strictfp }
attributes #7 = { nobuiltin optsize strictfp "no-builtins" }
attributes #8 = { nounwind readnone strictfp }
attributes #9 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"long", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{i64 97789}
!8 = !{!9, !9, i64 0}
!9 = !{!"any pointer", !5, i64 0}
