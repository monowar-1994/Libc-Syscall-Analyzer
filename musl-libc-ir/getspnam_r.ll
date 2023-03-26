; ModuleID = 'src/passwd/getspnam_r.c'
source_filename = "src/passwd/getspnam_r.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.spwd = type { i8*, i8*, i64, i64, i64, i64, i64, i64, i64 }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct._IO_FILE = type opaque

@.str = private unnamed_addr constant [19 x i8] c"/etc/tcb/%s/shadow\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"/etc/shadow\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"rbe\00", align 1

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__parsespent(i8* noundef %0, %struct.spwd* nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.spwd, %struct.spwd* %1, i64 0, i32 0
  store i8* %0, i8** %3, align 8, !tbaa !3
  %4 = tail call i8* @strchr(i8* noundef %0, i32 noundef 58) #5
  %5 = icmp eq i8* %4, null
  br i1 %5, label %187, label %6

6:                                                ; preds = %2
  store i8 0, i8* %4, align 1, !tbaa !9
  %7 = getelementptr inbounds i8, i8* %4, i64 1
  %8 = getelementptr inbounds %struct.spwd, %struct.spwd* %1, i64 0, i32 1
  store i8* %7, i8** %8, align 8, !tbaa !10
  %9 = tail call i8* @strchr(i8* noundef nonnull %7, i32 noundef 58) #5
  %10 = icmp eq i8* %9, null
  br i1 %10, label %187, label %11

11:                                               ; preds = %6
  store i8 0, i8* %9, align 1, !tbaa !9
  %12 = getelementptr inbounds i8, i8* %9, i64 1
  %13 = load i8, i8* %12, align 1, !tbaa !9
  switch i8 %13, label %14 [
    i8 58, label %30
    i8 10, label %30
  ]

14:                                               ; preds = %11
  %15 = sext i8 %13 to i32
  %16 = add nsw i32 %15, -48
  %17 = icmp ult i32 %16, 10
  br i1 %17, label %18, label %30

18:                                               ; preds = %14, %18
  %19 = phi i32 [ %28, %18 ], [ %16, %14 ]
  %20 = phi i8* [ %25, %18 ], [ %12, %14 ]
  %21 = phi i64 [ %24, %18 ], [ 0, %14 ]
  %22 = mul nsw i64 %21, 10
  %23 = zext i32 %19 to i64
  %24 = add nsw i64 %22, %23
  %25 = getelementptr inbounds i8, i8* %20, i64 1
  %26 = load i8, i8* %25, align 1, !tbaa !9
  %27 = sext i8 %26 to i32
  %28 = add nsw i32 %27, -48
  %29 = icmp ult i32 %28, 10
  br i1 %29, label %18, label %30

30:                                               ; preds = %18, %11, %11, %14
  %31 = phi i8* [ %12, %14 ], [ %12, %11 ], [ %12, %11 ], [ %25, %18 ]
  %32 = phi i64 [ 0, %14 ], [ -1, %11 ], [ -1, %11 ], [ %24, %18 ]
  %33 = getelementptr inbounds %struct.spwd, %struct.spwd* %1, i64 0, i32 2
  store i64 %32, i64* %33, align 8, !tbaa !11
  %34 = load i8, i8* %31, align 1, !tbaa !9
  %35 = icmp eq i8 %34, 58
  br i1 %35, label %36, label %187

36:                                               ; preds = %30
  %37 = getelementptr inbounds i8, i8* %31, i64 1
  %38 = load i8, i8* %37, align 1, !tbaa !9
  switch i8 %38, label %39 [
    i8 58, label %55
    i8 10, label %55
  ]

39:                                               ; preds = %36
  %40 = sext i8 %38 to i32
  %41 = add nsw i32 %40, -48
  %42 = icmp ult i32 %41, 10
  br i1 %42, label %43, label %55

43:                                               ; preds = %39, %43
  %44 = phi i32 [ %53, %43 ], [ %41, %39 ]
  %45 = phi i8* [ %50, %43 ], [ %37, %39 ]
  %46 = phi i64 [ %49, %43 ], [ 0, %39 ]
  %47 = mul nsw i64 %46, 10
  %48 = zext i32 %44 to i64
  %49 = add nsw i64 %47, %48
  %50 = getelementptr inbounds i8, i8* %45, i64 1
  %51 = load i8, i8* %50, align 1, !tbaa !9
  %52 = sext i8 %51 to i32
  %53 = add nsw i32 %52, -48
  %54 = icmp ult i32 %53, 10
  br i1 %54, label %43, label %55

55:                                               ; preds = %43, %36, %36, %39
  %56 = phi i8* [ %37, %39 ], [ %37, %36 ], [ %37, %36 ], [ %50, %43 ]
  %57 = phi i64 [ 0, %39 ], [ -1, %36 ], [ -1, %36 ], [ %49, %43 ]
  %58 = getelementptr inbounds %struct.spwd, %struct.spwd* %1, i64 0, i32 3
  store i64 %57, i64* %58, align 8, !tbaa !12
  %59 = load i8, i8* %56, align 1, !tbaa !9
  %60 = icmp eq i8 %59, 58
  br i1 %60, label %61, label %187

61:                                               ; preds = %55
  %62 = getelementptr inbounds i8, i8* %56, i64 1
  %63 = load i8, i8* %62, align 1, !tbaa !9
  switch i8 %63, label %64 [
    i8 58, label %80
    i8 10, label %80
  ]

64:                                               ; preds = %61
  %65 = sext i8 %63 to i32
  %66 = add nsw i32 %65, -48
  %67 = icmp ult i32 %66, 10
  br i1 %67, label %68, label %80

68:                                               ; preds = %64, %68
  %69 = phi i32 [ %78, %68 ], [ %66, %64 ]
  %70 = phi i8* [ %75, %68 ], [ %62, %64 ]
  %71 = phi i64 [ %74, %68 ], [ 0, %64 ]
  %72 = mul nsw i64 %71, 10
  %73 = zext i32 %69 to i64
  %74 = add nsw i64 %72, %73
  %75 = getelementptr inbounds i8, i8* %70, i64 1
  %76 = load i8, i8* %75, align 1, !tbaa !9
  %77 = sext i8 %76 to i32
  %78 = add nsw i32 %77, -48
  %79 = icmp ult i32 %78, 10
  br i1 %79, label %68, label %80

80:                                               ; preds = %68, %61, %61, %64
  %81 = phi i8* [ %62, %64 ], [ %62, %61 ], [ %62, %61 ], [ %75, %68 ]
  %82 = phi i64 [ 0, %64 ], [ -1, %61 ], [ -1, %61 ], [ %74, %68 ]
  %83 = getelementptr inbounds %struct.spwd, %struct.spwd* %1, i64 0, i32 4
  store i64 %82, i64* %83, align 8, !tbaa !13
  %84 = load i8, i8* %81, align 1, !tbaa !9
  %85 = icmp eq i8 %84, 58
  br i1 %85, label %86, label %187

86:                                               ; preds = %80
  %87 = getelementptr inbounds i8, i8* %81, i64 1
  %88 = load i8, i8* %87, align 1, !tbaa !9
  switch i8 %88, label %89 [
    i8 58, label %105
    i8 10, label %105
  ]

89:                                               ; preds = %86
  %90 = sext i8 %88 to i32
  %91 = add nsw i32 %90, -48
  %92 = icmp ult i32 %91, 10
  br i1 %92, label %93, label %105

93:                                               ; preds = %89, %93
  %94 = phi i32 [ %103, %93 ], [ %91, %89 ]
  %95 = phi i8* [ %100, %93 ], [ %87, %89 ]
  %96 = phi i64 [ %99, %93 ], [ 0, %89 ]
  %97 = mul nsw i64 %96, 10
  %98 = zext i32 %94 to i64
  %99 = add nsw i64 %97, %98
  %100 = getelementptr inbounds i8, i8* %95, i64 1
  %101 = load i8, i8* %100, align 1, !tbaa !9
  %102 = sext i8 %101 to i32
  %103 = add nsw i32 %102, -48
  %104 = icmp ult i32 %103, 10
  br i1 %104, label %93, label %105

105:                                              ; preds = %93, %86, %86, %89
  %106 = phi i8* [ %87, %89 ], [ %87, %86 ], [ %87, %86 ], [ %100, %93 ]
  %107 = phi i64 [ 0, %89 ], [ -1, %86 ], [ -1, %86 ], [ %99, %93 ]
  %108 = getelementptr inbounds %struct.spwd, %struct.spwd* %1, i64 0, i32 5
  store i64 %107, i64* %108, align 8, !tbaa !14
  %109 = load i8, i8* %106, align 1, !tbaa !9
  %110 = icmp eq i8 %109, 58
  br i1 %110, label %111, label %187

111:                                              ; preds = %105
  %112 = getelementptr inbounds i8, i8* %106, i64 1
  %113 = load i8, i8* %112, align 1, !tbaa !9
  switch i8 %113, label %114 [
    i8 58, label %130
    i8 10, label %130
  ]

114:                                              ; preds = %111
  %115 = sext i8 %113 to i32
  %116 = add nsw i32 %115, -48
  %117 = icmp ult i32 %116, 10
  br i1 %117, label %118, label %130

118:                                              ; preds = %114, %118
  %119 = phi i32 [ %128, %118 ], [ %116, %114 ]
  %120 = phi i8* [ %125, %118 ], [ %112, %114 ]
  %121 = phi i64 [ %124, %118 ], [ 0, %114 ]
  %122 = mul nsw i64 %121, 10
  %123 = zext i32 %119 to i64
  %124 = add nsw i64 %122, %123
  %125 = getelementptr inbounds i8, i8* %120, i64 1
  %126 = load i8, i8* %125, align 1, !tbaa !9
  %127 = sext i8 %126 to i32
  %128 = add nsw i32 %127, -48
  %129 = icmp ult i32 %128, 10
  br i1 %129, label %118, label %130

130:                                              ; preds = %118, %111, %111, %114
  %131 = phi i8* [ %112, %114 ], [ %112, %111 ], [ %112, %111 ], [ %125, %118 ]
  %132 = phi i64 [ 0, %114 ], [ -1, %111 ], [ -1, %111 ], [ %124, %118 ]
  %133 = getelementptr inbounds %struct.spwd, %struct.spwd* %1, i64 0, i32 6
  store i64 %132, i64* %133, align 8, !tbaa !15
  %134 = load i8, i8* %131, align 1, !tbaa !9
  %135 = icmp eq i8 %134, 58
  br i1 %135, label %136, label %187

136:                                              ; preds = %130
  %137 = getelementptr inbounds i8, i8* %131, i64 1
  %138 = load i8, i8* %137, align 1, !tbaa !9
  switch i8 %138, label %139 [
    i8 58, label %155
    i8 10, label %155
  ]

139:                                              ; preds = %136
  %140 = sext i8 %138 to i32
  %141 = add nsw i32 %140, -48
  %142 = icmp ult i32 %141, 10
  br i1 %142, label %143, label %155

143:                                              ; preds = %139, %143
  %144 = phi i32 [ %153, %143 ], [ %141, %139 ]
  %145 = phi i8* [ %150, %143 ], [ %137, %139 ]
  %146 = phi i64 [ %149, %143 ], [ 0, %139 ]
  %147 = mul nsw i64 %146, 10
  %148 = zext i32 %144 to i64
  %149 = add nsw i64 %147, %148
  %150 = getelementptr inbounds i8, i8* %145, i64 1
  %151 = load i8, i8* %150, align 1, !tbaa !9
  %152 = sext i8 %151 to i32
  %153 = add nsw i32 %152, -48
  %154 = icmp ult i32 %153, 10
  br i1 %154, label %143, label %155

155:                                              ; preds = %143, %136, %136, %139
  %156 = phi i8* [ %137, %139 ], [ %137, %136 ], [ %137, %136 ], [ %150, %143 ]
  %157 = phi i64 [ 0, %139 ], [ -1, %136 ], [ -1, %136 ], [ %149, %143 ]
  %158 = getelementptr inbounds %struct.spwd, %struct.spwd* %1, i64 0, i32 7
  store i64 %157, i64* %158, align 8, !tbaa !16
  %159 = load i8, i8* %156, align 1, !tbaa !9
  %160 = icmp eq i8 %159, 58
  br i1 %160, label %161, label %187

161:                                              ; preds = %155
  %162 = getelementptr inbounds i8, i8* %156, i64 1
  %163 = load i8, i8* %162, align 1, !tbaa !9
  switch i8 %163, label %164 [
    i8 58, label %180
    i8 10, label %180
  ]

164:                                              ; preds = %161
  %165 = sext i8 %163 to i32
  %166 = add nsw i32 %165, -48
  %167 = icmp ult i32 %166, 10
  br i1 %167, label %168, label %180

168:                                              ; preds = %164, %168
  %169 = phi i32 [ %178, %168 ], [ %166, %164 ]
  %170 = phi i8* [ %175, %168 ], [ %162, %164 ]
  %171 = phi i64 [ %174, %168 ], [ 0, %164 ]
  %172 = mul nsw i64 %171, 10
  %173 = zext i32 %169 to i64
  %174 = add nsw i64 %172, %173
  %175 = getelementptr inbounds i8, i8* %170, i64 1
  %176 = load i8, i8* %175, align 1, !tbaa !9
  %177 = sext i8 %176 to i32
  %178 = add nsw i32 %177, -48
  %179 = icmp ult i32 %178, 10
  br i1 %179, label %168, label %180

180:                                              ; preds = %168, %161, %161, %164
  %181 = phi i8* [ %162, %164 ], [ %162, %161 ], [ %162, %161 ], [ %175, %168 ]
  %182 = phi i64 [ 0, %164 ], [ -1, %161 ], [ -1, %161 ], [ %174, %168 ]
  %183 = getelementptr inbounds %struct.spwd, %struct.spwd* %1, i64 0, i32 8
  store i64 %182, i64* %183, align 8, !tbaa !17
  %184 = load i8, i8* %181, align 1, !tbaa !9
  %185 = icmp ne i8 %184, 10
  %186 = sext i1 %185 to i32
  br label %187

187:                                              ; preds = %180, %155, %130, %105, %80, %55, %30, %6, %2
  %188 = phi i32 [ -1, %2 ], [ -1, %6 ], [ -1, %30 ], [ -1, %55 ], [ -1, %80 ], [ -1, %105 ], [ -1, %130 ], [ -1, %155 ], [ %186, %180 ]
  ret i32 %188
}

; Function Attrs: optsize
declare i8* @strchr(i8* noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i32 @getspnam_r(i8* noundef %0, %struct.spwd* noundef %1, i8* noundef %2, i64 noundef %3, %struct.spwd** nocapture noundef writeonly %4) local_unnamed_addr #0 {
  %6 = alloca [275 x i8], align 16
  %7 = alloca i32, align 4
  %8 = alloca %struct.stat, align 8
  %9 = alloca %struct.__ptcb, align 8
  %10 = getelementptr inbounds [275 x i8], [275 x i8]* %6, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 275, i8* nonnull %10) #6
  %11 = tail call i64 @strlen(i8* noundef %0) #5
  %12 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %12) #6
  %13 = tail call i32* @___errno_location() #7
  %14 = load i32, i32* %13, align 4, !tbaa !18
  store %struct.spwd* null, %struct.spwd** %4, align 8, !tbaa !20
  %15 = load i8, i8* %0, align 1, !tbaa !9
  %16 = icmp eq i8 %15, 46
  br i1 %16, label %22, label %17

17:                                               ; preds = %5
  %18 = tail call i8* @strchr(i8* noundef nonnull %0, i32 noundef 47) #5
  %19 = icmp eq i8* %18, null
  %20 = icmp ne i64 %11, 0
  %21 = select i1 %19, i1 %20, i1 false
  br i1 %21, label %23, label %22

22:                                               ; preds = %17, %5
  store i32 22, i32* %13, align 4, !tbaa !18
  br label %104

23:                                               ; preds = %17
  %24 = add i64 %11, 100
  %25 = icmp ugt i64 %24, %3
  br i1 %25, label %26, label %27

26:                                               ; preds = %23
  store i32 34, i32* %13, align 4, !tbaa !18
  br label %104

27:                                               ; preds = %23
  %28 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef nonnull %10, i64 noundef 275, i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0), i8* noundef nonnull %0) #5
  %29 = icmp ugt i32 %28, 274
  br i1 %29, label %30, label %31

30:                                               ; preds = %27
  store i32 22, i32* %13, align 4, !tbaa !18
  br label %104

31:                                               ; preds = %27
  %32 = call i32 (i8*, i32, ...) @open(i8* noundef nonnull %10, i32 noundef 657408) #5
  %33 = icmp sgt i32 %32, -1
  br i1 %33, label %34, label %53

34:                                               ; preds = %31
  %35 = bitcast %struct.stat* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %35) #6
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(144) %35, i8 0, i64 144, i1 false) #8
  store i32 22, i32* %13, align 4, !tbaa !18
  %36 = call i32 @fstat(i32 noundef %32, %struct.stat* noundef nonnull %8) #5
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %47

38:                                               ; preds = %34
  %39 = getelementptr inbounds %struct.stat, %struct.stat* %8, i64 0, i32 3
  %40 = load i32, i32* %39, align 8, !tbaa !21
  %41 = and i32 %40, 61440
  %42 = icmp eq i32 %41, 32768
  br i1 %42, label %43, label %47

43:                                               ; preds = %38
  %44 = call %struct._IO_FILE* @fdopen(i32 noundef %32, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0)) #5
  %45 = icmp eq %struct._IO_FILE* %44, null
  br i1 %45, label %47, label %46

46:                                               ; preds = %43
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %35) #6
  br label %61

47:                                               ; preds = %34, %38, %43
  %48 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %7) #5
  %49 = call i32 @close(i32 noundef %32) #5
  %50 = load i32, i32* %7, align 4, !tbaa !18
  %51 = call i32 @pthread_setcancelstate(i32 noundef %50, i32* noundef null) #5
  %52 = load i32, i32* %13, align 4, !tbaa !18
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %35) #6
  br label %104

53:                                               ; preds = %31
  %54 = load i32, i32* %13, align 4, !tbaa !18
  switch i32 %54, label %104 [
    i32 2, label %55
    i32 20, label %55
  ]

55:                                               ; preds = %53, %53
  %56 = call %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %57 = icmp eq %struct._IO_FILE* %56, null
  br i1 %57, label %58, label %61

58:                                               ; preds = %55
  %59 = load i32, i32* %13, align 4, !tbaa !18
  switch i32 %59, label %104 [
    i32 2, label %60
    i32 20, label %60
  ]

60:                                               ; preds = %58, %58
  br label %104

61:                                               ; preds = %46, %55
  %62 = phi %struct._IO_FILE* [ %56, %55 ], [ %44, %46 ]
  %63 = bitcast %struct.__ptcb* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %63) #6
  %64 = bitcast %struct._IO_FILE* %62 to i8*
  call void @_pthread_cleanup_push(%struct.__ptcb* noundef nonnull %9, void (i8*)* noundef nonnull @cleanup, i8* noundef %64) #5
  %65 = trunc i64 %3 to i32
  %66 = call i8* @fgets(i8* noundef %2, i32 noundef %65, %struct._IO_FILE* noundef nonnull %62) #5
  %67 = icmp eq i8* %66, null
  br i1 %67, label %101, label %68

68:                                               ; preds = %61
  %69 = getelementptr inbounds i8, i8* %2, i64 %11
  br label %70

70:                                               ; preds = %68, %88
  %71 = phi i32 [ 0, %68 ], [ %89, %88 ]
  %72 = call i64 @strlen(i8* noundef %2) #5
  %73 = icmp eq i64 %72, 0
  br i1 %73, label %101, label %74

74:                                               ; preds = %70
  %75 = icmp eq i32 %71, 0
  br i1 %75, label %76, label %82

76:                                               ; preds = %74
  %77 = call i32 @strncmp(i8* noundef nonnull %0, i8* noundef %2, i64 noundef %11) #5
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %79, label %82

79:                                               ; preds = %76
  %80 = load i8, i8* %69, align 1, !tbaa !9
  %81 = icmp eq i8 %80, 58
  br i1 %81, label %92, label %82

82:                                               ; preds = %79, %76, %74
  %83 = add i64 %72, -1
  %84 = getelementptr inbounds i8, i8* %2, i64 %83
  %85 = load i8, i8* %84, align 1, !tbaa !9
  %86 = icmp ne i8 %85, 10
  %87 = zext i1 %86 to i32
  br label %88

88:                                               ; preds = %82, %97
  %89 = phi i32 [ %87, %82 ], [ 0, %97 ]
  %90 = call i8* @fgets(i8* noundef nonnull %2, i32 noundef %65, %struct._IO_FILE* noundef %62) #5
  %91 = icmp eq i8* %90, null
  br i1 %91, label %101, label %70

92:                                               ; preds = %79
  %93 = add i64 %72, -1
  %94 = getelementptr inbounds i8, i8* %2, i64 %93
  %95 = load i8, i8* %94, align 1, !tbaa !9
  %96 = icmp eq i8 %95, 10
  br i1 %96, label %97, label %101

97:                                               ; preds = %92
  %98 = call i32 @__parsespent(i8* noundef nonnull %2, %struct.spwd* noundef %1) #9
  %99 = icmp slt i32 %98, 0
  br i1 %99, label %88, label %100

100:                                              ; preds = %97
  store %struct.spwd* %1, %struct.spwd** %4, align 8, !tbaa !20
  br label %101

101:                                              ; preds = %70, %88, %92, %61, %100
  %102 = phi i32 [ %14, %100 ], [ %14, %61 ], [ %14, %70 ], [ %14, %88 ], [ 34, %92 ]
  %103 = phi i32 [ 0, %100 ], [ 0, %61 ], [ 0, %70 ], [ 0, %88 ], [ 34, %92 ]
  call void @_pthread_cleanup_pop(%struct.__ptcb* noundef nonnull %9, i32 noundef 1) #5
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %63) #6
  store i32 %102, i32* %13, align 4, !tbaa !18
  br label %104

104:                                              ; preds = %47, %58, %53, %101, %60, %30, %26, %22
  %105 = phi i32 [ 22, %22 ], [ 34, %26 ], [ 22, %30 ], [ %103, %101 ], [ %52, %47 ], [ 0, %60 ], [ %54, %53 ], [ %59, %58 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %12) #6
  call void @llvm.lifetime.end.p0i8(i64 275, i8* nonnull %10) #6
  ret i32 %105
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @snprintf(i8* noundef, i64 noundef, i8* noundef, ...) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @open(i8* noundef, i32 noundef, ...) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: optsize
declare i32 @fstat(i32 noundef, %struct.stat* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare %struct._IO_FILE* @fdopen(i32 noundef, i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @close(i32 noundef) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: optsize
declare %struct._IO_FILE* @fopen(i8* noundef, i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare void @_pthread_cleanup_push(%struct.__ptcb* noundef, void (i8*)* noundef, i8* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define internal void @cleanup(i8* noundef %0) #0 {
  %2 = bitcast i8* %0 to %struct._IO_FILE*
  %3 = tail call i32 @fclose(%struct._IO_FILE* noundef %2) #5
  ret void
}

; Function Attrs: optsize
declare i8* @fgets(i8* noundef, i32 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @strncmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare void @_pthread_cleanup_pop(%struct.__ptcb* noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @fclose(%struct._IO_FILE* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nounwind strictfp }
attributes #7 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #8 = { strictfp }
attributes #9 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"spwd", !5, i64 0, !5, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"long", !6, i64 0}
!9 = !{!6, !6, i64 0}
!10 = !{!4, !5, i64 8}
!11 = !{!4, !8, i64 16}
!12 = !{!4, !8, i64 24}
!13 = !{!4, !8, i64 32}
!14 = !{!4, !8, i64 40}
!15 = !{!4, !8, i64 48}
!16 = !{!4, !8, i64 56}
!17 = !{!4, !8, i64 64}
!18 = !{!19, !19, i64 0}
!19 = !{!"int", !6, i64 0}
!20 = !{!5, !5, i64 0}
!21 = !{!22, !19, i64 24}
!22 = !{!"stat", !8, i64 0, !8, i64 8, !8, i64 16, !19, i64 24, !19, i64 28, !19, i64 32, !19, i64 36, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !23, i64 72, !23, i64 88, !23, i64 104, !6, i64 120}
!23 = !{!"timespec", !8, i64 0, !8, i64 8}
