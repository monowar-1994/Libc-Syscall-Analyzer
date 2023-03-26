; ModuleID = 'src/stdio/vfprintf.c'
source_filename = "src/stdio/vfprintf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%union.arg = type { x86_fp80 }

@.str = private unnamed_addr constant [10 x i8] c"-+   0X0x\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"(null)\00", align 1
@states = internal unnamed_addr constant <{ [58 x i8], [58 x i8], [58 x i8], [58 x i8], [58 x i8], <{ [46 x i8], [12 x i8] }>, [58 x i8], [58 x i8] }> <{ [58 x i8] c"\19\00\0A\00\19\19\19\00\00\00\00\05\00\00\00\00\00\00\09\00\00\00\00\0B\00\00\00\00\00\00\00\00\19\00\11\0A\19\19\19\03\0A\07\00\01\1B\09\0B\18\00\00\09\06\0B\00\00\0B\00\06", [58 x i8] c"\19\00\00\00\19\19\19\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0E\00\00\00\00\00\00\00\00\19\00\0A\0D\19\19\19\00\0D\00\00\02\00\09\0E\00\00\00\09\00\0E\00\00\0E\00\00", [58 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0C\00\00\00\00\00\00\00\00\00\00\00\13\00\00\00\00\13\00\00\00\00\09\0C\00\00\00\00\00\0C\00\00\0C\00\00", [58 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\00\00\00\00\0F\00\00\00\04\0F\00\00\00\00\09\10\00\00\00\00\00\10\00\00\10\00\00", [58 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\12\00\00\00\00\00\00\00\00\00\00\00\11\00\00\00\00\11\00\00\00\00\09\12\00\00\00\00\00\12\00\00\12\00\00", <{ [46 x i8], [12 x i8] }> <{ [46 x i8] c"\1A\00\00\00\1A\1A\1A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\1A\00\00\00\1A\1A\1A\00\00\00\00\00\00\09", [12 x i8] zeroinitializer }>, [58 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\14\00\00\00\00\00\00\00\00\00\00\00\17\00\00\00\00\17\00\00\00\00\09\14\00\00\00\00\00\14\00\00\14\00\00", [58 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\16\00\00\00\00\00\00\00\00\00\00\00\15\00\00\00\00\15\00\00\00\00\09\16\00\00\00\00\00\16\00\00\16\00\00" }>, align 16
@xdigits = internal unnamed_addr constant [16 x i8] c"0123456789ABCDEF", align 16
@.str.3 = private unnamed_addr constant [19 x i8] c"-0X+0X 0X-0x+0x 0x\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"inf\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"INF\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"nan\00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c"NAN\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c".\00", align 1

; Function Attrs: nounwind optsize strictfp
define i32 @vfprintf(%struct._IO_FILE* noalias noundef %0, i8* noalias noundef %1, %struct.__va_list_tag* noundef %2) local_unnamed_addr #0 {
  %4 = alloca [1 x %struct.__va_list_tag], align 16
  %5 = alloca [10 x i32], align 16
  %6 = alloca [10 x %union.arg], align 16
  %7 = alloca [80 x i8], align 16
  %8 = bitcast [1 x %struct.__va_list_tag]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %8) #11
  %9 = bitcast [10 x i32]* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %9) #11
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %9, i8 0, i64 40, i1 false) #12
  %10 = bitcast [10 x %union.arg]* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 160, i8* nonnull %10) #11
  %11 = getelementptr inbounds [80 x i8], [80 x i8]* %7, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 80, i8* nonnull %11) #11
  %12 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_copy(i8* nonnull %8, i8* %12) #12
  %13 = getelementptr inbounds [10 x %union.arg], [10 x %union.arg]* %6, i64 0, i64 0
  %14 = getelementptr inbounds [10 x i32], [10 x i32]* %5, i64 0, i64 0
  %15 = call fastcc i32 @printf_core(%struct._IO_FILE* noundef null, i8* noundef %1, [1 x %struct.__va_list_tag]* noundef nonnull %4, %union.arg* noundef nonnull %13, i32* noundef nonnull %14) #13
  %16 = icmp slt i32 %15, 0
  br i1 %16, label %82, label %17

17:                                               ; preds = %3
  %18 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 19
  %19 = load volatile i32, i32* %18, align 4, !tbaa !3
  %20 = icmp sgt i32 %19, -1
  br i1 %20, label %21, label %23

21:                                               ; preds = %17
  %22 = call i32 @__lockfile(%struct._IO_FILE* noundef nonnull %0) #14
  br label %23

23:                                               ; preds = %17, %21
  %24 = phi i32 [ %22, %21 ], [ 0, %17 ]
  %25 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  %26 = load i32, i32* %25, align 8, !tbaa !10
  %27 = and i32 %26, 32
  %28 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 18
  %29 = load i32, i32* %28, align 8, !tbaa !11
  %30 = icmp slt i32 %29, 1
  br i1 %30, label %31, label %33

31:                                               ; preds = %23
  %32 = and i32 %26, -33
  store i32 %32, i32* %25, align 8, !tbaa !10
  br label %33

33:                                               ; preds = %31, %23
  %34 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 12
  %35 = load i64, i64* %34, align 8, !tbaa !12
  %36 = icmp eq i64 %35, 0
  br i1 %36, label %37, label %44

37:                                               ; preds = %33
  %38 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 11
  %39 = load i8*, i8** %38, align 8, !tbaa !13
  store i8* %11, i8** %38, align 8, !tbaa !13
  store i64 80, i64* %34, align 8, !tbaa !12
  %40 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 4
  %41 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 7
  store i8* null, i8** %41, align 8, !tbaa !14
  %42 = bitcast i8** %40 to <2 x i8*>*
  store <2 x i8*> zeroinitializer, <2 x i8*>* %42, align 8, !tbaa !15
  %43 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 4
  br label %49

44:                                               ; preds = %33
  %45 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 4
  %46 = load i8*, i8** %45, align 8, !tbaa !16
  %47 = icmp eq i8* %46, null
  %48 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 4
  br i1 %47, label %49, label %54

49:                                               ; preds = %37, %44
  %50 = phi i8** [ %43, %37 ], [ %48, %44 ]
  %51 = phi i8* [ %39, %37 ], [ null, %44 ]
  %52 = call i32 @__towrite(%struct._IO_FILE* noundef nonnull %0) #14
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %54, label %58

54:                                               ; preds = %49, %44
  %55 = phi i8** [ %50, %49 ], [ %48, %44 ]
  %56 = phi i8* [ %51, %49 ], [ null, %44 ]
  %57 = call fastcc i32 @printf_core(%struct._IO_FILE* noundef nonnull %0, i8* noundef %1, [1 x %struct.__va_list_tag]* noundef nonnull %4, %union.arg* noundef nonnull %13, i32* noundef nonnull %14) #13
  br label %58

58:                                               ; preds = %49, %54
  %59 = phi i8** [ %55, %54 ], [ %50, %49 ]
  %60 = phi i8* [ %56, %54 ], [ %51, %49 ]
  %61 = phi i32 [ %57, %54 ], [ -1, %49 ]
  %62 = icmp eq i8* %60, null
  br i1 %62, label %73, label %63

63:                                               ; preds = %58
  %64 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 9
  %65 = load i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)** %64, align 8, !tbaa !17
  %66 = call i64 %65(%struct._IO_FILE* noundef nonnull %0, i8* noundef null, i64 noundef 0) #14
  %67 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 5
  %68 = load i8*, i8** %67, align 8, !tbaa !18
  %69 = icmp eq i8* %68, null
  %70 = select i1 %69, i32 -1, i32 %61
  %71 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 11
  store i8* %60, i8** %71, align 8, !tbaa !13
  store i64 0, i64* %34, align 8, !tbaa !12
  store i8* null, i8** %59, align 8, !tbaa !16
  %72 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 7
  store i8* null, i8** %72, align 8, !tbaa !14
  store i8* null, i8** %67, align 8, !tbaa !18
  br label %73

73:                                               ; preds = %63, %58
  %74 = phi i32 [ %70, %63 ], [ %61, %58 ]
  %75 = load i32, i32* %25, align 8, !tbaa !10
  %76 = and i32 %75, 32
  %77 = icmp eq i32 %76, 0
  %78 = select i1 %77, i32 %74, i32 -1
  %79 = or i32 %75, %27
  store i32 %79, i32* %25, align 8, !tbaa !10
  %80 = icmp eq i32 %24, 0
  br i1 %80, label %82, label %81

81:                                               ; preds = %73
  call void @__unlockfile(%struct._IO_FILE* noundef nonnull %0) #14
  br label %82

82:                                               ; preds = %73, %81, %3
  %83 = phi i32 [ -1, %3 ], [ %78, %81 ], [ %78, %73 ]
  call void @llvm.va_end(i8* nonnull %8) #12
  call void @llvm.lifetime.end.p0i8(i64 80, i8* nonnull %11) #11
  call void @llvm.lifetime.end.p0i8(i64 160, i8* nonnull %10) #11
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %9) #11
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %8) #11
  ret i32 %83
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_copy(i8*, i8*) #3

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @printf_core(%struct._IO_FILE* noundef %0, i8* noundef %1, [1 x %struct.__va_list_tag]* noundef %2, %union.arg* nocapture noundef %3, i32* nocapture noundef %4) unnamed_addr #0 {
  %6 = alloca [1835 x i32], align 16
  %7 = alloca i32, align 4
  %8 = alloca [25 x i8], align 16
  %9 = alloca [12 x i8], align 1
  %10 = alloca %union.arg, align 16
  %11 = alloca [43 x i8], align 16
  %12 = alloca [2 x i32], align 4
  %13 = alloca [4 x i8], align 1
  %14 = bitcast %union.arg* %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %14) #11
  %15 = getelementptr inbounds [43 x i8], [43 x i8]* %11, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 43, i8* nonnull %15) #11
  %16 = bitcast [2 x i32]* %12 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %16) #11
  %17 = getelementptr inbounds [4 x i8], [4 x i8]* %13, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %17) #11
  %18 = icmp eq %struct._IO_FILE* %0, null
  %19 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  %20 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %21 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %22 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %23 = getelementptr inbounds [43 x i8], [43 x i8]* %11, i64 0, i64 43
  %24 = getelementptr inbounds %union.arg, %union.arg* %10, i64 0, i32 0
  %25 = bitcast [1835 x i32]* %6 to i8*
  %26 = bitcast i32* %7 to i8*
  %27 = getelementptr inbounds [25 x i8], [25 x i8]* %8, i64 0, i64 0
  %28 = getelementptr inbounds [12 x i8], [12 x i8]* %9, i64 0, i64 0
  %29 = getelementptr inbounds [12 x i8], [12 x i8]* %9, i64 0, i64 12
  %30 = getelementptr inbounds [1835 x i32], [1835 x i32]* %6, i64 0, i64 0
  %31 = getelementptr inbounds [1835 x i32], [1835 x i32]* %6, i64 0, i64 1770
  %32 = getelementptr inbounds [1835 x i32], [1835 x i32]* %6, i64 0, i64 1
  %33 = getelementptr inbounds [1835 x i32], [1835 x i32]* %6, i64 0, i64 1771
  %34 = ptrtoint i8* %29 to i64
  %35 = getelementptr inbounds [25 x i8], [25 x i8]* %8, i64 0, i64 9
  %36 = ptrtoint i8* %35 to i64
  %37 = getelementptr inbounds [25 x i8], [25 x i8]* %8, i64 0, i64 8
  %38 = getelementptr inbounds [12 x i8], [12 x i8]* %9, i64 0, i64 11
  %39 = ptrtoint [25 x i8]* %8 to i64
  %40 = sub nuw nsw i64 -2, %39
  %41 = bitcast %union.arg* %10 to i64*
  %42 = getelementptr inbounds [2 x i32], [2 x i32]* %12, i64 0, i64 0
  %43 = getelementptr inbounds [2 x i32], [2 x i32]* %12, i64 0, i64 1
  %44 = bitcast %union.arg* %10 to [2 x i32]**
  %45 = bitcast %union.arg* %10 to i32**
  %46 = bitcast %union.arg* %10 to i8**
  %47 = getelementptr inbounds [43 x i8], [43 x i8]* %11, i64 0, i64 42
  %48 = ptrtoint i8* %23 to i64
  %49 = bitcast %union.arg* %10 to i64**
  %50 = bitcast %union.arg* %10 to i16**
  %51 = getelementptr inbounds [2 x i32], [2 x i32]* %12, i64 0, i64 0
  br label %52

52:                                               ; preds = %622, %5
  %53 = phi i8* [ %1, %5 ], [ %319, %622 ]
  %54 = phi i32 [ 0, %5 ], [ %231, %622 ]
  %55 = phi i32 [ 0, %5 ], [ %64, %622 ]
  %56 = phi i32 [ 0, %5 ], [ %623, %622 ]
  br label %57

57:                                               ; preds = %52, %103
  %58 = phi i8* [ %85, %103 ], [ %53, %52 ]
  %59 = phi i32 [ %64, %103 ], [ %55, %52 ]
  %60 = phi i32 [ %94, %103 ], [ %56, %52 ]
  %61 = sub nsw i32 2147483647, %59
  %62 = icmp sgt i32 %60, %61
  br i1 %62, label %1437, label %63

63:                                               ; preds = %57
  %64 = add nsw i32 %60, %59
  %65 = load i8, i8* %58, align 1, !tbaa !19
  %66 = icmp eq i8 %65, 0
  br i1 %66, label %1415, label %67

67:                                               ; preds = %63, %70
  %68 = phi i8 [ %72, %70 ], [ %65, %63 ]
  %69 = phi i8* [ %71, %70 ], [ %58, %63 ]
  switch i8 %68, label %70 [
    i8 37, label %73
    i8 0, label %84
  ]

70:                                               ; preds = %67
  %71 = getelementptr inbounds i8, i8* %69, i64 1
  %72 = load i8, i8* %71, align 1, !tbaa !19
  br label %67

73:                                               ; preds = %67, %79
  %74 = phi i8* [ %80, %79 ], [ %69, %67 ]
  %75 = phi i8* [ %81, %79 ], [ %69, %67 ]
  %76 = getelementptr inbounds i8, i8* %75, i64 1
  %77 = load i8, i8* %76, align 1, !tbaa !19
  %78 = icmp eq i8 %77, 37
  br i1 %78, label %79, label %84

79:                                               ; preds = %73
  %80 = getelementptr inbounds i8, i8* %74, i64 1
  %81 = getelementptr inbounds i8, i8* %75, i64 2
  %82 = load i8, i8* %81, align 1, !tbaa !19
  %83 = icmp eq i8 %82, 37
  br i1 %83, label %73, label %84

84:                                               ; preds = %67, %73, %79
  %85 = phi i8* [ %81, %79 ], [ %75, %73 ], [ %69, %67 ]
  %86 = phi i8* [ %80, %79 ], [ %74, %73 ], [ %69, %67 ]
  %87 = ptrtoint i8* %86 to i64
  %88 = ptrtoint i8* %58 to i64
  %89 = sub i64 %87, %88
  %90 = sub nsw i32 2147483647, %64
  %91 = zext i32 %90 to i64
  %92 = icmp sgt i64 %89, %91
  br i1 %92, label %1437, label %93

93:                                               ; preds = %84
  %94 = trunc i64 %89 to i32
  br i1 %18, label %103, label %95

95:                                               ; preds = %93
  %96 = load i32, i32* %19, align 8, !tbaa !10
  %97 = and i32 %96, 32
  %98 = icmp eq i32 %97, 0
  br i1 %98, label %99, label %103

99:                                               ; preds = %95
  %100 = shl i64 %89, 32
  %101 = ashr exact i64 %100, 32
  %102 = call i64 @__fwritex(i8* noundef nonnull %58, i64 noundef %101, %struct._IO_FILE* noundef nonnull %0) #14
  br label %103

103:                                              ; preds = %99, %95, %93
  %104 = icmp eq i32 %94, 0
  br i1 %104, label %105, label %57

105:                                              ; preds = %103
  %106 = getelementptr inbounds i8, i8* %85, i64 1
  %107 = load i8, i8* %106, align 1, !tbaa !19
  %108 = sext i8 %107 to i32
  %109 = add nsw i32 %108, -48
  %110 = icmp ult i32 %109, 10
  br i1 %110, label %111, label %119

111:                                              ; preds = %105
  %112 = getelementptr inbounds i8, i8* %85, i64 2
  %113 = load i8, i8* %112, align 1, !tbaa !19
  %114 = icmp eq i8 %113, 36
  br i1 %114, label %115, label %119

115:                                              ; preds = %111
  %116 = getelementptr inbounds i8, i8* %85, i64 3
  %117 = load i8, i8* %116, align 1, !tbaa !19
  %118 = sext i8 %117 to i32
  br label %119

119:                                              ; preds = %105, %111, %115
  %120 = phi i32 [ %108, %105 ], [ %108, %111 ], [ %118, %115 ]
  %121 = phi i8 [ %107, %105 ], [ %107, %111 ], [ %117, %115 ]
  %122 = phi i8* [ %106, %105 ], [ %106, %111 ], [ %116, %115 ]
  %123 = phi i32 [ %54, %105 ], [ %54, %111 ], [ 1, %115 ]
  %124 = phi i32 [ -1, %105 ], [ -1, %111 ], [ %109, %115 ]
  %125 = add nsw i32 %120, -32
  %126 = icmp ult i32 %125, 32
  br i1 %126, label %127, label %145

127:                                              ; preds = %119
  %128 = shl nuw i32 1, %125
  %129 = and i32 %128, 75913
  %130 = icmp eq i32 %129, 0
  br i1 %130, label %145, label %135

131:                                              ; preds = %135
  %132 = shl nuw i32 1, %143
  %133 = and i32 %132, 75913
  %134 = icmp eq i32 %133, 0
  br i1 %134, label %145, label %135

135:                                              ; preds = %127, %131
  %136 = phi i32 [ %132, %131 ], [ %128, %127 ]
  %137 = phi i8* [ %140, %131 ], [ %122, %127 ]
  %138 = phi i32 [ %139, %131 ], [ 0, %127 ]
  %139 = or i32 %136, %138
  %140 = getelementptr inbounds i8, i8* %137, i64 1
  %141 = load i8, i8* %140, align 1, !tbaa !19
  %142 = sext i8 %141 to i32
  %143 = add nsw i32 %142, -32
  %144 = icmp ult i32 %143, 32
  br i1 %144, label %131, label %145

145:                                              ; preds = %135, %131, %127, %119
  %146 = phi i8 [ %121, %119 ], [ %121, %127 ], [ %141, %131 ], [ %141, %135 ]
  %147 = phi i8* [ %122, %119 ], [ %122, %127 ], [ %140, %131 ], [ %140, %135 ]
  %148 = phi i32 [ 0, %119 ], [ 0, %127 ], [ %139, %131 ], [ %139, %135 ]
  %149 = icmp eq i8 %146, 42
  br i1 %149, label %150, label %197

150:                                              ; preds = %145
  %151 = getelementptr inbounds i8, i8* %147, i64 1
  %152 = load i8, i8* %151, align 1, !tbaa !19
  %153 = sext i8 %152 to i32
  %154 = add nsw i32 %153, -48
  %155 = icmp ult i32 %154, 10
  br i1 %155, label %156, label %171

156:                                              ; preds = %150
  %157 = getelementptr inbounds i8, i8* %147, i64 2
  %158 = load i8, i8* %157, align 1, !tbaa !19
  %159 = icmp eq i8 %158, 36
  br i1 %159, label %160, label %171

160:                                              ; preds = %156
  %161 = zext i32 %154 to i64
  %162 = getelementptr inbounds i32, i32* %4, i64 %161
  store i32 10, i32* %162, align 4, !tbaa !20
  %163 = load i8, i8* %151, align 1, !tbaa !19
  %164 = sext i8 %163 to i64
  %165 = add nsw i64 %164, -48
  %166 = getelementptr inbounds %union.arg, %union.arg* %3, i64 %165
  %167 = bitcast %union.arg* %166 to i64*
  %168 = load i64, i64* %167, align 16, !tbaa !19
  %169 = trunc i64 %168 to i32
  %170 = getelementptr inbounds i8, i8* %147, i64 3
  br label %189

171:                                              ; preds = %156, %150
  %172 = icmp eq i32 %123, 0
  br i1 %172, label %173, label %1437

173:                                              ; preds = %171
  br i1 %18, label %229, label %174

174:                                              ; preds = %173
  %175 = load i32, i32* %20, align 8
  %176 = icmp ult i32 %175, 41
  br i1 %176, label %177, label %182

177:                                              ; preds = %174
  %178 = load i8*, i8** %22, align 8
  %179 = zext i32 %175 to i64
  %180 = getelementptr i8, i8* %178, i64 %179
  %181 = add nuw nsw i32 %175, 8
  store i32 %181, i32* %20, align 8
  br label %185

182:                                              ; preds = %174
  %183 = load i8*, i8** %21, align 8
  %184 = getelementptr i8, i8* %183, i64 8
  store i8* %184, i8** %21, align 8
  br label %185

185:                                              ; preds = %182, %177
  %186 = phi i8* [ %180, %177 ], [ %183, %182 ]
  %187 = bitcast i8* %186 to i32*
  %188 = load i32, i32* %187, align 4
  br label %189

189:                                              ; preds = %185, %160
  %190 = phi i8* [ %170, %160 ], [ %151, %185 ]
  %191 = phi i32 [ 1, %160 ], [ 0, %185 ]
  %192 = phi i32 [ %169, %160 ], [ %188, %185 ]
  %193 = icmp slt i32 %192, 0
  br i1 %193, label %194, label %229

194:                                              ; preds = %189
  %195 = or i32 %148, 8192
  %196 = sub nsw i32 0, %192
  br label %229

197:                                              ; preds = %145
  %198 = sext i8 %146 to i32
  %199 = add nsw i32 %198, -48
  %200 = icmp ult i32 %199, 10
  br i1 %200, label %201, label %229

201:                                              ; preds = %197, %217
  %202 = phi i32 [ %218, %217 ], [ %199, %197 ]
  %203 = phi i8* [ %219, %217 ], [ %147, %197 ]
  %204 = phi i32 [ %220, %217 ], [ 0, %197 ]
  %205 = icmp ugt i32 %204, 214748364
  br i1 %205, label %221, label %206

206:                                              ; preds = %201
  %207 = mul nuw nsw i32 %204, 10
  %208 = sub nuw nsw i32 2147483647, %207
  %209 = icmp ugt i32 %202, %208
  %210 = add nuw nsw i32 %207, %202
  %211 = select i1 %209, i32 -1, i32 %210
  %212 = getelementptr inbounds i8, i8* %203, i64 1
  %213 = load i8, i8* %212, align 1, !tbaa !19
  %214 = sext i8 %213 to i32
  %215 = add nsw i32 %214, -48
  %216 = icmp ult i32 %215, 10
  br i1 %216, label %217, label %227

217:                                              ; preds = %206, %221
  %218 = phi i32 [ %215, %206 ], [ %225, %221 ]
  %219 = phi i8* [ %212, %206 ], [ %222, %221 ]
  %220 = phi i32 [ %211, %206 ], [ -1, %221 ]
  br label %201

221:                                              ; preds = %201
  %222 = getelementptr inbounds i8, i8* %203, i64 1
  %223 = load i8, i8* %222, align 1, !tbaa !19
  %224 = sext i8 %223 to i32
  %225 = add nsw i32 %224, -48
  %226 = icmp ult i32 %225, 10
  br i1 %226, label %217, label %1437

227:                                              ; preds = %206
  %228 = icmp slt i32 %211, 0
  br i1 %228, label %1437, label %229

229:                                              ; preds = %197, %173, %227, %189, %194
  %230 = phi i8* [ %190, %194 ], [ %190, %189 ], [ %212, %227 ], [ %151, %173 ], [ %147, %197 ]
  %231 = phi i32 [ %191, %194 ], [ %191, %189 ], [ %123, %227 ], [ 0, %173 ], [ %123, %197 ]
  %232 = phi i32 [ %195, %194 ], [ %148, %189 ], [ %148, %227 ], [ %148, %173 ], [ %148, %197 ]
  %233 = phi i32 [ %196, %194 ], [ %192, %189 ], [ %211, %227 ], [ 0, %173 ], [ 0, %197 ]
  %234 = load i8, i8* %230, align 1, !tbaa !19
  %235 = icmp eq i8 %234, 46
  br i1 %235, label %236, label %306

236:                                              ; preds = %229
  %237 = getelementptr inbounds i8, i8* %230, i64 1
  %238 = load i8, i8* %237, align 1, !tbaa !19
  %239 = icmp eq i8 %238, 42
  br i1 %239, label %240, label %284

240:                                              ; preds = %236
  %241 = getelementptr inbounds i8, i8* %230, i64 2
  %242 = load i8, i8* %241, align 1, !tbaa !19
  %243 = sext i8 %242 to i32
  %244 = add nsw i32 %243, -48
  %245 = icmp ult i32 %244, 10
  br i1 %245, label %246, label %261

246:                                              ; preds = %240
  %247 = getelementptr inbounds i8, i8* %230, i64 3
  %248 = load i8, i8* %247, align 1, !tbaa !19
  %249 = icmp eq i8 %248, 36
  br i1 %249, label %250, label %261

250:                                              ; preds = %246
  %251 = zext i32 %244 to i64
  %252 = getelementptr inbounds i32, i32* %4, i64 %251
  store i32 10, i32* %252, align 4, !tbaa !20
  %253 = load i8, i8* %241, align 1, !tbaa !19
  %254 = sext i8 %253 to i64
  %255 = add nsw i64 %254, -48
  %256 = getelementptr inbounds %union.arg, %union.arg* %3, i64 %255
  %257 = bitcast %union.arg* %256 to i64*
  %258 = load i64, i64* %257, align 16, !tbaa !19
  %259 = trunc i64 %258 to i32
  %260 = getelementptr inbounds i8, i8* %230, i64 4
  br label %279

261:                                              ; preds = %246, %240
  %262 = icmp eq i32 %231, 0
  br i1 %262, label %263, label %1437

263:                                              ; preds = %261
  br i1 %18, label %279, label %264

264:                                              ; preds = %263
  %265 = load i32, i32* %20, align 8
  %266 = icmp ult i32 %265, 41
  br i1 %266, label %267, label %272

267:                                              ; preds = %264
  %268 = load i8*, i8** %22, align 8
  %269 = zext i32 %265 to i64
  %270 = getelementptr i8, i8* %268, i64 %269
  %271 = add nuw nsw i32 %265, 8
  store i32 %271, i32* %20, align 8
  br label %275

272:                                              ; preds = %264
  %273 = load i8*, i8** %21, align 8
  %274 = getelementptr i8, i8* %273, i64 8
  store i8* %274, i8** %21, align 8
  br label %275

275:                                              ; preds = %272, %267
  %276 = phi i8* [ %270, %267 ], [ %273, %272 ]
  %277 = bitcast i8* %276 to i32*
  %278 = load i32, i32* %277, align 4
  br label %279

279:                                              ; preds = %275, %263, %250
  %280 = phi i8* [ %260, %250 ], [ %241, %263 ], [ %241, %275 ]
  %281 = phi i32 [ %259, %250 ], [ 0, %263 ], [ %278, %275 ]
  %282 = xor i32 %281, -1
  %283 = lshr i32 %282, 31
  br label %306

284:                                              ; preds = %236
  %285 = sext i8 %238 to i32
  %286 = add nsw i32 %285, -48
  %287 = icmp ult i32 %286, 10
  br i1 %287, label %288, label %306

288:                                              ; preds = %284, %299
  %289 = phi i32 [ %304, %299 ], [ %286, %284 ]
  %290 = phi i8* [ %301, %299 ], [ %237, %284 ]
  %291 = phi i32 [ %300, %299 ], [ 0, %284 ]
  %292 = icmp ugt i32 %291, 214748364
  br i1 %292, label %299, label %293

293:                                              ; preds = %288
  %294 = mul nuw nsw i32 %291, 10
  %295 = sub nuw nsw i32 2147483647, %294
  %296 = icmp ugt i32 %289, %295
  %297 = add nuw nsw i32 %294, %289
  %298 = select i1 %296, i32 -1, i32 %297
  br label %299

299:                                              ; preds = %293, %288
  %300 = phi i32 [ -1, %288 ], [ %298, %293 ]
  %301 = getelementptr inbounds i8, i8* %290, i64 1
  %302 = load i8, i8* %301, align 1, !tbaa !19
  %303 = sext i8 %302 to i32
  %304 = add nsw i32 %303, -48
  %305 = icmp ult i32 %304, 10
  br i1 %305, label %288, label %306

306:                                              ; preds = %299, %284, %229, %279
  %307 = phi i8* [ %280, %279 ], [ %230, %229 ], [ %237, %284 ], [ %301, %299 ]
  %308 = phi i32 [ %281, %279 ], [ -1, %229 ], [ 0, %284 ], [ %300, %299 ]
  %309 = phi i32 [ %283, %279 ], [ 0, %229 ], [ 1, %284 ], [ 1, %299 ]
  br label %310

310:                                              ; preds = %317, %306
  %311 = phi i8* [ %307, %306 ], [ %319, %317 ]
  %312 = phi i32 [ 0, %306 ], [ %324, %317 ]
  %313 = load i8, i8* %311, align 1, !tbaa !19
  %314 = sext i8 %313 to i32
  %315 = add nsw i32 %314, -123
  %316 = icmp ult i32 %315, -58
  br i1 %316, label %1437, label %317

317:                                              ; preds = %310
  %318 = zext i32 %312 to i64
  %319 = getelementptr inbounds i8, i8* %311, i64 1
  %320 = sext i8 %313 to i64
  %321 = add nsw i64 %320, -65
  %322 = getelementptr inbounds [8 x [58 x i8]], [8 x [58 x i8]]* bitcast (<{ [58 x i8], [58 x i8], [58 x i8], [58 x i8], [58 x i8], <{ [46 x i8], [12 x i8] }>, [58 x i8], [58 x i8] }>* @states to [8 x [58 x i8]]*), i64 0, i64 %318, i64 %321
  %323 = load i8, i8* %322, align 1, !tbaa !19
  %324 = zext i8 %323 to i32
  %325 = add nsw i32 %324, -1
  %326 = icmp ult i32 %325, 8
  br i1 %326, label %310, label %327

327:                                              ; preds = %317
  %328 = zext i8 %323 to i32
  switch i8 %323, label %331 [
    i8 0, label %1437
    i8 27, label %329
  ]

329:                                              ; preds = %327
  %330 = icmp sgt i32 %124, -1
  br i1 %330, label %1437, label %340

331:                                              ; preds = %327
  %332 = icmp sgt i32 %124, -1
  br i1 %332, label %333, label %338

333:                                              ; preds = %331
  %334 = zext i32 %124 to i64
  %335 = getelementptr inbounds i32, i32* %4, i64 %334
  store i32 %328, i32* %335, align 4, !tbaa !20
  %336 = getelementptr inbounds %union.arg, %union.arg* %3, i64 %334
  %337 = bitcast %union.arg* %336 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(16) %14, i8* noundef nonnull align 16 dereferenceable(16) %337, i64 16, i1 false) #12, !tbaa.struct !21
  br label %340

338:                                              ; preds = %331
  br i1 %18, label %1440, label %339

339:                                              ; preds = %338
  call fastcc void @pop_arg(%union.arg* noundef nonnull %10, i32 noundef %328, [1 x %struct.__va_list_tag]* noundef %2) #13
  br label %341

340:                                              ; preds = %333, %329
  br i1 %18, label %622, label %341

341:                                              ; preds = %339, %340
  %342 = load i8, i8* %311, align 1, !tbaa !19
  %343 = sext i8 %342 to i32
  %344 = icmp ne i32 %312, 0
  %345 = and i32 %343, 15
  %346 = icmp eq i32 %345, 3
  %347 = select i1 %344, i1 %346, i1 false
  %348 = and i32 %343, -33
  %349 = select i1 %347, i32 %348, i32 %343
  %350 = and i32 %232, 8192
  %351 = icmp eq i32 %350, 0
  %352 = and i32 %232, -65537
  %353 = select i1 %351, i32 %232, i32 %352
  switch i32 %349, label %1379 [
    i32 110, label %356
    i32 112, label %378
    i32 120, label %382
    i32 88, label %382
    i32 111, label %408
    i32 100, label %432
    i32 105, label %432
    i32 117, label %354
    i32 99, label %490
    i32 109, label %493
    i32 115, label %497
    i32 67, label %514
    i32 83, label %517
    i32 101, label %571
    i32 102, label %571
    i32 103, label %571
    i32 97, label %571
    i32 69, label %571
    i32 70, label %571
    i32 71, label %571
    i32 65, label %571
  ]

354:                                              ; preds = %341
  %355 = load i64, i64* %41, align 16, !tbaa !19
  br label %446

356:                                              ; preds = %341
  %357 = trunc i32 %312 to i8
  switch i8 %357, label %622 [
    i8 0, label %358
    i8 1, label %360
    i8 2, label %363
    i8 3, label %366
    i8 4, label %369
    i8 6, label %372
    i8 7, label %375
  ]

358:                                              ; preds = %356
  %359 = load i32*, i32** %45, align 16, !tbaa !19
  store i32 %64, i32* %359, align 4, !tbaa !20
  br label %622

360:                                              ; preds = %356
  %361 = sext i32 %64 to i64
  %362 = load i64*, i64** %49, align 16, !tbaa !19
  store i64 %361, i64* %362, align 8, !tbaa !22
  br label %622

363:                                              ; preds = %356
  %364 = sext i32 %64 to i64
  %365 = load i64*, i64** %49, align 16, !tbaa !19
  store i64 %364, i64* %365, align 8, !tbaa !25
  br label %622

366:                                              ; preds = %356
  %367 = trunc i32 %64 to i16
  %368 = load i16*, i16** %50, align 16, !tbaa !19
  store i16 %367, i16* %368, align 2, !tbaa !27
  br label %622

369:                                              ; preds = %356
  %370 = trunc i32 %64 to i8
  %371 = load i8*, i8** %46, align 16, !tbaa !19
  store i8 %370, i8* %371, align 1, !tbaa !19
  br label %622

372:                                              ; preds = %356
  %373 = sext i32 %64 to i64
  %374 = load i64*, i64** %49, align 16, !tbaa !19
  store i64 %373, i64* %374, align 8, !tbaa !22
  br label %622

375:                                              ; preds = %356
  %376 = sext i32 %64 to i64
  %377 = load i64*, i64** %49, align 16, !tbaa !19
  store i64 %376, i64* %377, align 8, !tbaa !22
  br label %622

378:                                              ; preds = %341
  %379 = icmp ugt i32 %308, 16
  %380 = select i1 %379, i32 %308, i32 16
  %381 = or i32 %353, 8
  br label %382

382:                                              ; preds = %341, %341, %378
  %383 = phi i32 [ %353, %341 ], [ %353, %341 ], [ %381, %378 ]
  %384 = phi i32 [ %308, %341 ], [ %308, %341 ], [ %380, %378 ]
  %385 = phi i32 [ %349, %341 ], [ %349, %341 ], [ 120, %378 ]
  %386 = load i64, i64* %41, align 16, !tbaa !19
  %387 = icmp eq i64 %386, 0
  br i1 %387, label %464, label %388

388:                                              ; preds = %382
  %389 = trunc i32 %385 to i8
  %390 = and i8 %389, 32
  br label %391

391:                                              ; preds = %391, %388
  %392 = phi i64 [ %386, %388 ], [ %399, %391 ]
  %393 = phi i8* [ %23, %388 ], [ %398, %391 ]
  %394 = and i64 %392, 15
  %395 = getelementptr inbounds [16 x i8], [16 x i8]* @xdigits, i64 0, i64 %394
  %396 = load i8, i8* %395, align 1, !tbaa !19
  %397 = or i8 %396, %390
  %398 = getelementptr inbounds i8, i8* %393, i64 -1
  store i8 %397, i8* %398, align 1, !tbaa !19
  %399 = lshr i64 %392, 4
  %400 = icmp ult i64 %392, 16
  br i1 %400, label %401, label %391

401:                                              ; preds = %391
  %402 = and i32 %383, 8
  %403 = icmp eq i32 %402, 0
  br i1 %403, label %464, label %404

404:                                              ; preds = %401
  %405 = ashr i32 %385, 4
  %406 = sext i32 %405 to i64
  %407 = getelementptr inbounds [10 x i8], [10 x i8]* @.str, i64 0, i64 %406
  br label %464

408:                                              ; preds = %341
  %409 = load i64, i64* %41, align 16, !tbaa !19
  %410 = icmp eq i64 %409, 0
  br i1 %410, label %420, label %411

411:                                              ; preds = %408, %411
  %412 = phi i8* [ %417, %411 ], [ %23, %408 ]
  %413 = phi i64 [ %418, %411 ], [ %409, %408 ]
  %414 = trunc i64 %413 to i8
  %415 = and i8 %414, 7
  %416 = or i8 %415, 48
  %417 = getelementptr inbounds i8, i8* %412, i64 -1
  store i8 %416, i8* %417, align 1, !tbaa !19
  %418 = lshr i64 %413, 3
  %419 = icmp ult i64 %413, 8
  br i1 %419, label %420, label %411

420:                                              ; preds = %411, %408
  %421 = phi i8* [ %23, %408 ], [ %417, %411 ]
  %422 = and i32 %353, 8
  %423 = icmp eq i32 %422, 0
  br i1 %423, label %464, label %424

424:                                              ; preds = %420
  %425 = sext i32 %308 to i64
  %426 = ptrtoint i8* %421 to i64
  %427 = sub i64 %48, %426
  %428 = icmp slt i64 %427, %425
  br i1 %428, label %464, label %429

429:                                              ; preds = %424
  %430 = trunc i64 %427 to i32
  %431 = add i32 %430, 1
  br label %464

432:                                              ; preds = %341, %341
  %433 = load i64, i64* %41, align 16, !tbaa !19
  %434 = icmp slt i64 %433, 0
  br i1 %434, label %435, label %437

435:                                              ; preds = %432
  %436 = sub i64 0, %433
  store i64 %436, i64* %41, align 16, !tbaa !19
  br label %451

437:                                              ; preds = %432
  %438 = and i32 %353, 2048
  %439 = icmp eq i32 %438, 0
  br i1 %439, label %440, label %446

440:                                              ; preds = %437
  %441 = and i32 %353, 1
  %442 = icmp eq i32 %441, 0
  %443 = select i1 %442, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 2)
  %444 = xor i1 %442, true
  %445 = zext i1 %444 to i32
  br label %446

446:                                              ; preds = %354, %440, %437
  %447 = phi i64 [ %355, %354 ], [ %433, %437 ], [ %433, %440 ]
  %448 = phi i8* [ getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), %354 ], [ getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 1), %437 ], [ %443, %440 ]
  %449 = phi i32 [ 0, %354 ], [ 1, %437 ], [ %445, %440 ]
  %450 = icmp eq i64 %447, 0
  br i1 %450, label %464, label %451

451:                                              ; preds = %435, %446
  %452 = phi i32 [ 1, %435 ], [ %449, %446 ]
  %453 = phi i8* [ getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), %435 ], [ %448, %446 ]
  %454 = phi i64 [ %436, %435 ], [ %447, %446 ]
  br label %455

455:                                              ; preds = %451, %455
  %456 = phi i64 [ %462, %455 ], [ %454, %451 ]
  %457 = phi i8* [ %461, %455 ], [ %23, %451 ]
  %458 = urem i64 %456, 10
  %459 = trunc i64 %458 to i8
  %460 = or i8 %459, 48
  %461 = getelementptr inbounds i8, i8* %457, i64 -1
  store i8 %460, i8* %461, align 1, !tbaa !19
  %462 = udiv i64 %456, 10
  %463 = icmp ult i64 %456, 10
  br i1 %463, label %464, label %455

464:                                              ; preds = %455, %382, %446, %404, %401, %429, %424, %420
  %465 = phi i64 [ %409, %429 ], [ %409, %424 ], [ %409, %420 ], [ 1, %404 ], [ 1, %401 ], [ 0, %446 ], [ 0, %382 ], [ 1, %455 ]
  %466 = phi i8* [ %421, %429 ], [ %421, %424 ], [ %421, %420 ], [ %398, %404 ], [ %398, %401 ], [ %23, %446 ], [ %23, %382 ], [ %461, %455 ]
  %467 = phi i32 [ %353, %429 ], [ %353, %424 ], [ %353, %420 ], [ %383, %404 ], [ %383, %401 ], [ %353, %446 ], [ %383, %382 ], [ %353, %455 ]
  %468 = phi i32 [ %431, %429 ], [ %308, %424 ], [ %308, %420 ], [ %384, %404 ], [ %384, %401 ], [ %308, %446 ], [ %384, %382 ], [ %308, %455 ]
  %469 = phi i8* [ getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), %429 ], [ getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), %424 ], [ getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), %420 ], [ %407, %404 ], [ getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), %401 ], [ %448, %446 ], [ getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), %382 ], [ %453, %455 ]
  %470 = phi i32 [ 0, %429 ], [ 0, %424 ], [ 0, %420 ], [ 2, %404 ], [ 0, %401 ], [ %449, %446 ], [ 0, %382 ], [ %452, %455 ]
  %471 = icmp ne i32 %309, 0
  %472 = icmp slt i32 %468, 0
  %473 = select i1 %471, i1 %472, i1 false
  br i1 %473, label %1437, label %474

474:                                              ; preds = %464
  %475 = and i32 %467, -65537
  %476 = select i1 %471, i32 %475, i32 %467
  %477 = icmp ne i64 %465, 0
  %478 = icmp ne i32 %468, 0
  %479 = select i1 %477, i1 true, i1 %478
  br i1 %479, label %480, label %1379

480:                                              ; preds = %474
  %481 = sext i32 %468 to i64
  %482 = ptrtoint i8* %466 to i64
  %483 = sub i64 %48, %482
  %484 = xor i1 %477, true
  %485 = zext i1 %484 to i64
  %486 = add nsw i64 %483, %485
  %487 = icmp slt i64 %486, %481
  %488 = select i1 %487, i64 %481, i64 %486
  %489 = trunc i64 %488 to i32
  br label %1379

490:                                              ; preds = %341
  %491 = load i64, i64* %41, align 16, !tbaa !19
  %492 = trunc i64 %491 to i8
  store i8 %492, i8* %47, align 2, !tbaa !19
  br label %1379

493:                                              ; preds = %341
  %494 = tail call i32* @___errno_location() #15
  %495 = load i32, i32* %494, align 4, !tbaa !20
  %496 = call i8* @strerror(i32 noundef %495) #14
  br label %501

497:                                              ; preds = %341
  %498 = load i8*, i8** %46, align 16, !tbaa !19
  %499 = icmp eq i8* %498, null
  %500 = select i1 %499, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i8* %498
  br label %501

501:                                              ; preds = %497, %493
  %502 = phi i8* [ %500, %497 ], [ %496, %493 ]
  %503 = icmp slt i32 %308, 0
  %504 = select i1 %503, i32 2147483647, i32 %308
  %505 = zext i32 %504 to i64
  %506 = call i64 @strnlen(i8* noundef %502, i64 noundef %505) #14
  %507 = getelementptr inbounds i8, i8* %502, i64 %506
  br i1 %503, label %508, label %511

508:                                              ; preds = %501
  %509 = load i8, i8* %507, align 1, !tbaa !19
  %510 = icmp eq i8 %509, 0
  br i1 %510, label %511, label %1437

511:                                              ; preds = %508, %501
  %512 = trunc i64 %506 to i32
  %513 = ptrtoint i8* %507 to i64
  br label %1379

514:                                              ; preds = %341
  %515 = load i64, i64* %41, align 16, !tbaa !19
  %516 = trunc i64 %515 to i32
  store i32 %516, i32* %42, align 4, !tbaa !20
  store i32 0, i32* %43, align 4, !tbaa !20
  store [2 x i32]* %12, [2 x i32]** %44, align 16, !tbaa !19
  br label %522

517:                                              ; preds = %341
  %518 = load i32*, i32** %45, align 16, !tbaa !19
  %519 = sext i32 %308 to i64
  %520 = icmp eq i32 %308, 0
  br i1 %520, label %521, label %522

521:                                              ; preds = %517
  call fastcc void @pad(%struct._IO_FILE* noundef nonnull %0, i8 noundef signext 32, i32 noundef %233, i32 noundef 0, i32 noundef %353) #13
  br label %566

522:                                              ; preds = %514, %517
  %523 = phi i64 [ -1, %514 ], [ %519, %517 ]
  %524 = phi i32* [ %51, %514 ], [ %518, %517 ]
  br label %527

525:                                              ; preds = %536
  %526 = icmp ult i64 %540, %523
  br i1 %526, label %527, label %541

527:                                              ; preds = %522, %525
  %528 = phi i32* [ %533, %525 ], [ %524, %522 ]
  %529 = phi i64 [ %540, %525 ], [ 0, %522 ]
  %530 = load i32, i32* %528, align 4, !tbaa !20
  %531 = icmp eq i32 %530, 0
  br i1 %531, label %541, label %532

532:                                              ; preds = %527
  %533 = getelementptr inbounds i32, i32* %528, i64 1
  %534 = call i32 @wctomb(i8* noundef nonnull %17, i32 noundef %530) #14
  %535 = icmp sgt i32 %534, -1
  br i1 %535, label %536, label %1440

536:                                              ; preds = %532
  %537 = zext i32 %534 to i64
  %538 = sub i64 %523, %529
  %539 = icmp ult i64 %538, %537
  %540 = add i64 %529, %537
  br i1 %539, label %541, label %525

541:                                              ; preds = %525, %527, %536
  %542 = phi i64 [ %540, %525 ], [ %529, %527 ], [ %529, %536 ]
  %543 = icmp ugt i64 %542, 2147483647
  br i1 %543, label %1437, label %544

544:                                              ; preds = %541
  %545 = trunc i64 %542 to i32
  call fastcc void @pad(%struct._IO_FILE* noundef nonnull %0, i8 noundef signext 32, i32 noundef %233, i32 noundef %545, i32 noundef %353) #13
  %546 = icmp eq i64 %542, 0
  br i1 %546, label %566, label %547

547:                                              ; preds = %544, %564
  %548 = phi i32* [ %558, %564 ], [ %524, %544 ]
  %549 = phi i64 [ %555, %564 ], [ 0, %544 ]
  %550 = load i32, i32* %548, align 4, !tbaa !20
  %551 = icmp eq i32 %550, 0
  br i1 %551, label %566, label %552

552:                                              ; preds = %547
  %553 = call i32 @wctomb(i8* noundef nonnull %17, i32 noundef %550) #14
  %554 = sext i32 %553 to i64
  %555 = add i64 %549, %554
  %556 = icmp ugt i64 %555, %542
  br i1 %556, label %566, label %557

557:                                              ; preds = %552
  %558 = getelementptr inbounds i32, i32* %548, i64 1
  %559 = load i32, i32* %19, align 8, !tbaa !10
  %560 = and i32 %559, 32
  %561 = icmp eq i32 %560, 0
  br i1 %561, label %562, label %564

562:                                              ; preds = %557
  %563 = call i64 @__fwritex(i8* noundef nonnull %17, i64 noundef %554, %struct._IO_FILE* noundef nonnull %0) #14
  br label %564

564:                                              ; preds = %557, %562
  %565 = icmp ult i64 %555, %542
  br i1 %565, label %547, label %566

566:                                              ; preds = %552, %547, %564, %521, %544
  %567 = phi i32 [ 0, %521 ], [ 0, %544 ], [ %545, %564 ], [ %545, %547 ], [ %545, %552 ]
  %568 = xor i32 %353, 8192
  call fastcc void @pad(%struct._IO_FILE* noundef nonnull %0, i8 noundef signext 32, i32 noundef %233, i32 noundef %567, i32 noundef %568) #13
  %569 = icmp sgt i32 %233, %567
  %570 = select i1 %569, i32 %233, i32 %567
  br label %622

571:                                              ; preds = %341, %341, %341, %341, %341, %341, %341, %341
  %572 = icmp ne i32 %309, 0
  %573 = icmp slt i32 %308, 0
  %574 = select i1 %572, i1 %573, i1 false
  br i1 %574, label %1437, label %575

575:                                              ; preds = %571
  %576 = load x86_fp80, x86_fp80* %24, align 16, !tbaa !19
  call void @llvm.lifetime.start.p0i8(i64 7340, i8* nonnull %25) #11
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %26) #11
  store i32 0, i32* %7, align 4, !tbaa !20
  call void @llvm.lifetime.start.p0i8(i64 25, i8* nonnull %27) #11
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %28) #11
  %577 = call i32 @__signbitl(x86_fp80 noundef %576) #14
  %578 = icmp eq i32 %577, 0
  br i1 %578, label %581, label %579

579:                                              ; preds = %575
  %580 = fneg x86_fp80 %576
  br label %590

581:                                              ; preds = %575
  %582 = and i32 %353, 2048
  %583 = icmp eq i32 %582, 0
  br i1 %583, label %584, label %590

584:                                              ; preds = %581
  %585 = and i32 %353, 1
  %586 = icmp eq i32 %585, 0
  %587 = select i1 %586, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 1), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 6)
  %588 = xor i1 %586, true
  %589 = zext i1 %588 to i32
  br label %590

590:                                              ; preds = %584, %581, %579
  %591 = phi i8* [ getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0), %579 ], [ getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 3), %581 ], [ %587, %584 ]
  %592 = phi i1 [ false, %579 ], [ false, %581 ], [ %586, %584 ]
  %593 = phi i32 [ 1, %579 ], [ 1, %581 ], [ %589, %584 ]
  %594 = phi x86_fp80 [ %580, %579 ], [ %576, %581 ], [ %576, %584 ]
  %595 = call i32 @__fpclassifyl(x86_fp80 noundef %594) #14
  %596 = icmp sgt i32 %595, 1
  br i1 %596, label %624, label %597

597:                                              ; preds = %590
  %598 = and i32 %349, 32
  %599 = icmp eq i32 %598, 0
  %600 = select i1 %599, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0)
  %601 = call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %594, x86_fp80 %594, metadata !"une", metadata !"fpexcept.ignore") #11
  %602 = select i1 %599, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i64 0, i64 0)
  %603 = select i1 %601, i8* %602, i8* %600
  %604 = add nuw nsw i32 %593, 3
  call fastcc void @pad(%struct._IO_FILE* noundef nonnull %0, i8 noundef signext 32, i32 noundef %233, i32 noundef %604, i32 noundef %352) #14
  %605 = load i32, i32* %19, align 8, !tbaa !10
  %606 = and i32 %605, 32
  %607 = icmp eq i32 %606, 0
  br i1 %607, label %608, label %612

608:                                              ; preds = %597
  %609 = zext i32 %593 to i64
  %610 = call i64 @__fwritex(i8* noundef %591, i64 noundef %609, %struct._IO_FILE* noundef nonnull %0) #14
  %611 = load i32, i32* %19, align 8, !tbaa !10
  br label %612

612:                                              ; preds = %608, %597
  %613 = phi i32 [ %605, %597 ], [ %611, %608 ]
  %614 = and i32 %613, 32
  %615 = icmp eq i32 %614, 0
  br i1 %615, label %616, label %618

616:                                              ; preds = %612
  %617 = call i64 @__fwritex(i8* noundef %603, i64 noundef 3, %struct._IO_FILE* noundef nonnull %0) #14
  br label %618

618:                                              ; preds = %616, %612
  %619 = xor i32 %353, 8192
  call fastcc void @pad(%struct._IO_FILE* noundef nonnull %0, i8 noundef signext 32, i32 noundef %233, i32 noundef %604, i32 noundef %619) #14
  %620 = icmp slt i32 %604, %233
  br i1 %620, label %1376, label %621

621:                                              ; preds = %618
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %28) #11
  call void @llvm.lifetime.end.p0i8(i64 25, i8* nonnull %27) #11
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %26) #11
  call void @llvm.lifetime.end.p0i8(i64 7340, i8* nonnull %25) #11
  br label %622

622:                                              ; preds = %621, %358, %360, %363, %366, %369, %372, %375, %356, %340, %1413, %1376, %566
  %623 = phi i32 [ %604, %621 ], [ 0, %358 ], [ 0, %360 ], [ 0, %363 ], [ 0, %366 ], [ 0, %369 ], [ 0, %372 ], [ 0, %375 ], [ 0, %356 ], [ 0, %340 ], [ %1397, %1413 ], [ %1377, %1376 ], [ %570, %566 ]
  br label %52

624:                                              ; preds = %590
  %625 = call x86_fp80 @frexpl(x86_fp80 noundef %594, i32* noundef nonnull %7) #14
  %626 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  %627 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %625, x86_fp80 %626, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  %628 = call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %627, x86_fp80 0xK00000000000000000000, metadata !"une", metadata !"fpexcept.ignore") #11
  br i1 %628, label %629, label %634

629:                                              ; preds = %624
  %630 = load i32, i32* %7, align 4, !tbaa !20
  %631 = add nsw i32 %630, -1
  store i32 %631, i32* %7, align 4, !tbaa !20
  %632 = or i32 %349, 32
  %633 = icmp eq i32 %632, 97
  br i1 %633, label %640, label %768

634:                                              ; preds = %624
  %635 = or i32 %349, 32
  %636 = icmp eq i32 %635, 97
  br i1 %636, label %640, label %637

637:                                              ; preds = %634
  %638 = select i1 %573, i32 6, i32 %308
  %639 = load i32, i32* %7, align 4, !tbaa !20
  br label %773

640:                                              ; preds = %634, %629
  %641 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 8.000000e+00, metadata !"fpexcept.ignore") #11
  %642 = and i32 %349, 32
  %643 = icmp eq i32 %642, 0
  %644 = select i1 %643, i64 0, i64 9
  %645 = getelementptr i8, i8* %591, i64 %644
  %646 = or i32 %593, 2
  %647 = icmp ugt i32 %308, 14
  br i1 %647, label %670, label %648

648:                                              ; preds = %640
  %649 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  %650 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %641, x86_fp80 %649, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  %651 = sub nuw nsw i32 15, %308
  br label %652

652:                                              ; preds = %652, %648
  %653 = phi i32 [ %655, %652 ], [ %651, %648 ]
  %654 = phi x86_fp80 [ %657, %652 ], [ %650, %648 ]
  %655 = add nsw i32 %653, -1
  %656 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 16, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  %657 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %654, x86_fp80 %656, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  %658 = icmp eq i32 %655, 0
  br i1 %658, label %659, label %652

659:                                              ; preds = %652
  %660 = load i8, i8* %645, align 1, !tbaa !19
  %661 = icmp eq i8 %660, 45
  br i1 %661, label %662, label %667

662:                                              ; preds = %659
  %663 = fneg x86_fp80 %627
  %664 = call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %663, x86_fp80 %657, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  %665 = call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %664, x86_fp80 %657, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  %666 = fneg x86_fp80 %665
  br label %670

667:                                              ; preds = %659
  %668 = call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %627, x86_fp80 %657, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  %669 = call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %668, x86_fp80 %657, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  br label %670

670:                                              ; preds = %667, %662, %640
  %671 = phi x86_fp80 [ %666, %662 ], [ %669, %667 ], [ %627, %640 ]
  %672 = load i32, i32* %7, align 4, !tbaa !20
  %673 = icmp eq i32 %672, 0
  br i1 %673, label %688, label %674

674:                                              ; preds = %670
  %675 = call i32 @llvm.abs.i32(i32 %672, i1 true) #16
  %676 = zext i32 %675 to i64
  br label %677

677:                                              ; preds = %677, %674
  %678 = phi i64 [ %684, %677 ], [ %676, %674 ]
  %679 = phi i8* [ %683, %677 ], [ %29, %674 ]
  %680 = urem i64 %678, 10
  %681 = trunc i64 %680 to i8
  %682 = or i8 %681, 48
  %683 = getelementptr inbounds i8, i8* %679, i64 -1
  store i8 %682, i8* %683, align 1, !tbaa !19
  %684 = udiv i64 %678, 10
  %685 = icmp ult i64 %678, 10
  br i1 %685, label %686, label %677

686:                                              ; preds = %677
  %687 = icmp eq i8* %683, %29
  br i1 %687, label %688, label %689

688:                                              ; preds = %686, %670
  store i8 48, i8* %38, align 1, !tbaa !19
  br label %689

689:                                              ; preds = %688, %686
  %690 = phi i8* [ %38, %688 ], [ %683, %686 ]
  %691 = icmp slt i32 %672, 0
  %692 = select i1 %691, i8 45, i8 43
  %693 = getelementptr inbounds i8, i8* %690, i64 -1
  store i8 %692, i8* %693, align 1, !tbaa !19
  %694 = trunc i32 %349 to i8
  %695 = add i8 %694, 15
  %696 = getelementptr inbounds i8, i8* %690, i64 -2
  store i8 %695, i8* %696, align 1, !tbaa !19
  %697 = trunc i32 %642 to i8
  %698 = icmp sgt i32 %308, 0
  %699 = and i32 %353, 8
  %700 = icmp ne i32 %699, 0
  br label %701

701:                                              ; preds = %723, %689
  %702 = phi i8* [ %27, %689 ], [ %724, %723 ]
  %703 = phi x86_fp80 [ %671, %689 ], [ %713, %723 ]
  %704 = call i32 @llvm.experimental.constrained.fptosi.i32.f80(x86_fp80 %703, metadata !"fpexcept.ignore") #11
  %705 = sext i32 %704 to i64
  %706 = getelementptr inbounds [16 x i8], [16 x i8]* @xdigits, i64 0, i64 %705
  %707 = load i8, i8* %706, align 1, !tbaa !19
  %708 = or i8 %707, %697
  %709 = getelementptr inbounds i8, i8* %702, i64 1
  store i8 %708, i8* %702, align 1, !tbaa !19
  %710 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 16, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  %711 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 %704, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  %712 = call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %703, x86_fp80 %711, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  %713 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %710, x86_fp80 %712, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  %714 = ptrtoint i8* %709 to i64
  %715 = sub i64 %714, %39
  %716 = icmp eq i64 %715, 1
  br i1 %716, label %717, label %723

717:                                              ; preds = %701
  %718 = call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %713, x86_fp80 0xK00000000000000000000, metadata !"une", metadata !"fpexcept.ignore") #11
  %719 = or i1 %698, %718
  %720 = or i1 %700, %719
  br i1 %720, label %721, label %723

721:                                              ; preds = %717
  %722 = getelementptr inbounds i8, i8* %702, i64 2
  store i8 46, i8* %709, align 1, !tbaa !19
  br label %723

723:                                              ; preds = %721, %717, %701
  %724 = phi i8* [ %722, %721 ], [ %709, %701 ], [ %709, %717 ]
  %725 = call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %713, x86_fp80 0xK00000000000000000000, metadata !"une", metadata !"fpexcept.ignore") #11
  br i1 %725, label %701, label %726

726:                                              ; preds = %723
  %727 = sext i32 %308 to i64
  %728 = ptrtoint i8* %696 to i64
  %729 = sub i64 %34, %728
  %730 = zext i32 %646 to i64
  %731 = add i64 %729, %730
  %732 = sub i64 2147483645, %731
  %733 = icmp slt i64 %732, %727
  br i1 %733, label %1370, label %734

734:                                              ; preds = %726
  %735 = icmp ne i32 %308, 0
  %736 = ptrtoint i8* %724 to i64
  %737 = add i64 %40, %736
  %738 = icmp slt i64 %737, %727
  %739 = select i1 %735, i1 %738, i1 false
  %740 = add nsw i32 %308, 2
  %741 = zext i32 %740 to i64
  %742 = sub i64 %736, %39
  %743 = select i1 %739, i64 %741, i64 %742
  %744 = add i64 %743, %729
  %745 = trunc i64 %744 to i32
  %746 = add nsw i32 %646, %745
  call fastcc void @pad(%struct._IO_FILE* noundef %0, i8 noundef signext 32, i32 noundef %233, i32 noundef %746, i32 noundef %353) #14
  %747 = load i32, i32* %19, align 8, !tbaa !10
  %748 = and i32 %747, 32
  %749 = icmp eq i32 %748, 0
  br i1 %749, label %750, label %752

750:                                              ; preds = %734
  %751 = call i64 @__fwritex(i8* noundef %645, i64 noundef %730, %struct._IO_FILE* noundef nonnull %0) #14
  br label %752

752:                                              ; preds = %750, %734
  %753 = xor i32 %353, 65536
  call fastcc void @pad(%struct._IO_FILE* noundef nonnull %0, i8 noundef signext 48, i32 noundef %233, i32 noundef %746, i32 noundef %753) #14
  %754 = load i32, i32* %19, align 8, !tbaa !10
  %755 = and i32 %754, 32
  %756 = icmp eq i32 %755, 0
  br i1 %756, label %757, label %759

757:                                              ; preds = %752
  %758 = call i64 @__fwritex(i8* noundef nonnull %27, i64 noundef %742, %struct._IO_FILE* noundef nonnull %0) #14
  br label %759

759:                                              ; preds = %757, %752
  %760 = add i64 %742, %729
  %761 = sub i64 %744, %760
  %762 = trunc i64 %761 to i32
  call fastcc void @pad(%struct._IO_FILE* noundef nonnull %0, i8 noundef signext 48, i32 noundef %762, i32 noundef 0, i32 noundef 0) #14
  %763 = load i32, i32* %19, align 8, !tbaa !10
  %764 = and i32 %763, 32
  %765 = icmp eq i32 %764, 0
  br i1 %765, label %766, label %1371

766:                                              ; preds = %759
  %767 = call i64 @__fwritex(i8* noundef nonnull %696, i64 noundef %729, %struct._IO_FILE* noundef nonnull %0) #14
  br label %1371

768:                                              ; preds = %629
  %769 = select i1 %573, i32 6, i32 %308
  %770 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x41B0000000000000, metadata !"fpexcept.ignore") #11
  %771 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %627, x86_fp80 %770, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  %772 = add nsw i32 %630, -29
  store i32 %772, i32* %7, align 4, !tbaa !20
  br label %773

773:                                              ; preds = %768, %637
  %774 = phi i32 [ %772, %768 ], [ %639, %637 ]
  %775 = phi i32 [ %769, %768 ], [ %638, %637 ]
  %776 = phi i32 [ %632, %768 ], [ %635, %637 ]
  %777 = phi x86_fp80 [ %771, %768 ], [ %627, %637 ]
  %778 = icmp slt i32 %774, 0
  %779 = select i1 %778, i32* %30, i32* %31
  br label %780

780:                                              ; preds = %780, %773
  %781 = phi i32* [ %779, %773 ], [ %785, %780 ]
  %782 = phi x86_fp80 [ %777, %773 ], [ %788, %780 ]
  %783 = call i32 @llvm.experimental.constrained.fptoui.i32.f80(x86_fp80 %782, metadata !"fpexcept.ignore") #11
  store i32 %783, i32* %781, align 4, !tbaa !20
  %784 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  %785 = getelementptr inbounds i32, i32* %781, i64 1
  %786 = call x86_fp80 @llvm.experimental.constrained.uitofp.f80.i32(i32 %783, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  %787 = call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %782, x86_fp80 %786, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  %788 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %784, x86_fp80 %787, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  %789 = call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %788, x86_fp80 0xK00000000000000000000, metadata !"une", metadata !"fpexcept.ignore") #11
  br i1 %789, label %780, label %790

790:                                              ; preds = %780
  %791 = icmp sgt i32 %774, 0
  br i1 %791, label %792, label %833

792:                                              ; preds = %790, %829
  %793 = phi i32* [ %821, %829 ], [ %779, %790 ]
  %794 = phi i32* [ %823, %829 ], [ %785, %790 ]
  %795 = phi i32 [ %831, %829 ], [ %774, %790 ]
  %796 = icmp ult i32 %795, 29
  %797 = select i1 %796, i32 %795, i32 29
  %798 = getelementptr inbounds i32, i32* %794, i64 -1
  %799 = icmp ult i32* %798, %793
  br i1 %799, label %820, label %800

800:                                              ; preds = %792
  %801 = zext i32 %797 to i64
  br label %802

802:                                              ; preds = %802, %800
  %803 = phi i32* [ %798, %800 ], [ %813, %802 ]
  %804 = phi i64 [ 0, %800 ], [ %812, %802 ]
  %805 = load i32, i32* %803, align 4, !tbaa !20
  %806 = zext i32 %805 to i64
  %807 = shl i64 %806, %801
  %808 = and i64 %804, 4294967295
  %809 = add nuw i64 %807, %808
  %810 = urem i64 %809, 1000000000
  %811 = trunc i64 %810 to i32
  store i32 %811, i32* %803, align 4, !tbaa !20
  %812 = udiv i64 %809, 1000000000
  %813 = getelementptr inbounds i32, i32* %803, i64 -1
  %814 = icmp ult i32* %813, %793
  br i1 %814, label %815, label %802

815:                                              ; preds = %802
  %816 = trunc i64 %812 to i32
  %817 = icmp eq i32 %816, 0
  br i1 %817, label %820, label %818

818:                                              ; preds = %815
  %819 = getelementptr inbounds i32, i32* %793, i64 -1
  store i32 %816, i32* %819, align 4, !tbaa !20
  br label %820

820:                                              ; preds = %818, %815, %792
  %821 = phi i32* [ %819, %818 ], [ %793, %815 ], [ %793, %792 ]
  br label %822

822:                                              ; preds = %825, %820
  %823 = phi i32* [ %794, %820 ], [ %826, %825 ]
  %824 = icmp ugt i32* %823, %821
  br i1 %824, label %825, label %829

825:                                              ; preds = %822
  %826 = getelementptr inbounds i32, i32* %823, i64 -1
  %827 = load i32, i32* %826, align 4, !tbaa !20
  %828 = icmp eq i32 %827, 0
  br i1 %828, label %822, label %829

829:                                              ; preds = %825, %822
  %830 = load i32, i32* %7, align 4, !tbaa !20
  %831 = sub nsw i32 %830, %797
  store i32 %831, i32* %7, align 4, !tbaa !20
  %832 = icmp sgt i32 %831, 0
  br i1 %832, label %792, label %833

833:                                              ; preds = %829, %790
  %834 = phi i32 [ %774, %790 ], [ %831, %829 ]
  %835 = phi i32* [ %785, %790 ], [ %823, %829 ]
  %836 = phi i32* [ %779, %790 ], [ %821, %829 ]
  %837 = icmp slt i32 %834, 0
  br i1 %837, label %838, label %890

838:                                              ; preds = %833
  %839 = add i32 %775, 29
  %840 = udiv i32 %839, 9
  %841 = add nuw nsw i32 %840, 1
  %842 = icmp eq i32 %776, 102
  %843 = zext i32 %841 to i64
  br label %844

844:                                              ; preds = %873, %838
  %845 = phi i32* [ %836, %838 ], [ %878, %873 ]
  %846 = phi i32* [ %835, %838 ], [ %886, %873 ]
  %847 = phi i32 [ %834, %838 ], [ %888, %873 ]
  %848 = sub nsw i32 0, %847
  %849 = icmp ult i32 %848, 9
  %850 = select i1 %849, i32 %848, i32 9
  %851 = icmp ult i32* %845, %846
  br i1 %851, label %854, label %852

852:                                              ; preds = %844
  %853 = load i32, i32* %845, align 4, !tbaa !20
  br label %873

854:                                              ; preds = %844
  %855 = shl nsw i32 -1, %850
  %856 = xor i32 %855, -1
  %857 = lshr i32 1000000000, %850
  br label %858

858:                                              ; preds = %858, %854
  %859 = phi i32* [ %845, %854 ], [ %866, %858 ]
  %860 = phi i32 [ 0, %854 ], [ %865, %858 ]
  %861 = load i32, i32* %859, align 4, !tbaa !20
  %862 = and i32 %861, %856
  %863 = lshr i32 %861, %850
  %864 = add i32 %863, %860
  store i32 %864, i32* %859, align 4, !tbaa !20
  %865 = mul i32 %862, %857
  %866 = getelementptr inbounds i32, i32* %859, i64 1
  %867 = icmp ult i32* %866, %846
  br i1 %867, label %858, label %868

868:                                              ; preds = %858
  %869 = load i32, i32* %845, align 4, !tbaa !20
  %870 = icmp eq i32 %865, 0
  br i1 %870, label %873, label %871

871:                                              ; preds = %868
  %872 = getelementptr inbounds i32, i32* %846, i64 1
  store i32 %865, i32* %846, align 4, !tbaa !20
  br label %873

873:                                              ; preds = %871, %868, %852
  %874 = phi i32 [ %869, %871 ], [ %869, %868 ], [ %853, %852 ]
  %875 = phi i32* [ %872, %871 ], [ %846, %868 ], [ %846, %852 ]
  %876 = icmp eq i32 %874, 0
  %877 = zext i1 %876 to i64
  %878 = getelementptr i32, i32* %845, i64 %877
  %879 = select i1 %842, i32* %779, i32* %878
  %880 = ptrtoint i32* %875 to i64
  %881 = ptrtoint i32* %879 to i64
  %882 = sub i64 %880, %881
  %883 = ashr exact i64 %882, 2
  %884 = icmp sgt i64 %883, %843
  %885 = getelementptr inbounds i32, i32* %879, i64 %843
  %886 = select i1 %884, i32* %885, i32* %875
  %887 = load i32, i32* %7, align 4, !tbaa !20
  %888 = add nsw i32 %887, %850
  store i32 %888, i32* %7, align 4, !tbaa !20
  %889 = icmp slt i32 %888, 0
  br i1 %889, label %844, label %890

890:                                              ; preds = %873, %833
  %891 = phi i32* [ %835, %833 ], [ %886, %873 ]
  %892 = phi i32* [ %836, %833 ], [ %878, %873 ]
  %893 = icmp ult i32* %892, %891
  %894 = ptrtoint i32* %779 to i64
  br i1 %893, label %895, label %909

895:                                              ; preds = %890
  %896 = ptrtoint i32* %892 to i64
  %897 = sub i64 %894, %896
  %898 = lshr exact i64 %897, 2
  %899 = trunc i64 %898 to i32
  %900 = mul i32 %899, 9
  %901 = load i32, i32* %892, align 4, !tbaa !20
  %902 = icmp ult i32 %901, 10
  br i1 %902, label %909, label %903

903:                                              ; preds = %895, %903
  %904 = phi i32 [ %907, %903 ], [ %900, %895 ]
  %905 = phi i32 [ %906, %903 ], [ 10, %895 ]
  %906 = mul nsw i32 %905, 10
  %907 = add nsw i32 %904, 1
  %908 = icmp ult i32 %901, %906
  br i1 %908, label %909, label %903

909:                                              ; preds = %903, %895, %890
  %910 = phi i32 [ %900, %895 ], [ 0, %890 ], [ %907, %903 ]
  %911 = icmp eq i32 %776, 102
  %912 = select i1 %911, i32 0, i32 %910
  %913 = sub nsw i32 %775, %912
  %914 = icmp eq i32 %776, 103
  %915 = icmp ne i32 %775, 0
  %916 = and i1 %915, %914
  %917 = sext i1 %916 to i32
  %918 = add i32 %913, %917
  %919 = sext i32 %918 to i64
  %920 = ptrtoint i32* %891 to i64
  %921 = sub i64 %920, %894
  %922 = ashr exact i64 %921, 2
  %923 = mul i64 %922, 9
  %924 = add i64 %923, -9
  %925 = icmp sgt i64 %924, %919
  br i1 %925, label %926, label %1047

926:                                              ; preds = %909
  %927 = select i1 %778, i32* %32, i32* %33
  %928 = add nsw i32 %918, 147456
  %929 = sdiv i32 %928, 9
  %930 = add nsw i32 %929, -16384
  %931 = sext i32 %930 to i64
  %932 = getelementptr inbounds i32, i32* %927, i64 %931
  %933 = srem i32 %928, 9
  %934 = icmp slt i32 %933, 8
  br i1 %934, label %935, label %954

935:                                              ; preds = %926
  %936 = sub nsw i32 11, %933
  %937 = and i32 %936, -4
  %938 = sub nsw i32 7, %933
  %939 = insertelement <4 x i32> poison, i32 %938, i64 0
  %940 = shufflevector <4 x i32> %939, <4 x i32> poison, <4 x i32> zeroinitializer
  br label %941

941:                                              ; preds = %941, %935
  %942 = phi i32 [ 0, %935 ], [ %945, %941 ]
  %943 = phi <4 x i32> [ <i32 10, i32 1, i32 1, i32 1>, %935 ], [ %944, %941 ]
  %944 = mul <4 x i32> %943, <i32 10, i32 10, i32 10, i32 10>
  %945 = add i32 %942, 4
  %946 = icmp eq i32 %945, %937
  br i1 %946, label %947, label %941, !llvm.loop !29

947:                                              ; preds = %941
  %948 = insertelement <4 x i32> poison, i32 %942, i64 0
  %949 = shufflevector <4 x i32> %948, <4 x i32> poison, <4 x i32> zeroinitializer
  %950 = or <4 x i32> %949, <i32 0, i32 1, i32 2, i32 3>
  %951 = icmp ugt <4 x i32> %950, %940
  %952 = select <4 x i1> %951, <4 x i32> %943, <4 x i32> %944
  %953 = call i32 @llvm.vector.reduce.mul.v4i32(<4 x i32> %952)
  br label %954

954:                                              ; preds = %947, %926
  %955 = phi i32 [ 10, %926 ], [ %953, %947 ]
  %956 = load i32, i32* %932, align 4, !tbaa !20
  %957 = urem i32 %956, %955
  %958 = udiv i32 %956, %955
  %959 = icmp eq i32 %957, 0
  %960 = getelementptr inbounds i32, i32* %932, i64 1
  %961 = icmp eq i32* %960, %891
  %962 = select i1 %959, i1 %961, i1 false
  br i1 %962, label %1040, label %963

963:                                              ; preds = %954
  %964 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  %965 = call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %964, x86_fp80 0xK3FC08000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  %966 = and i32 %958, 1
  %967 = icmp eq i32 %966, 0
  br i1 %967, label %968, label %977

968:                                              ; preds = %963
  %969 = icmp eq i32 %955, 1000000000
  %970 = icmp ugt i32* %932, %892
  %971 = select i1 %969, i1 %970, i1 false
  br i1 %971, label %972, label %980

972:                                              ; preds = %968
  %973 = getelementptr inbounds i32, i32* %932, i64 -1
  %974 = load i32, i32* %973, align 4, !tbaa !20
  %975 = and i32 %974, 1
  %976 = icmp eq i32 %975, 0
  br i1 %976, label %980, label %977

977:                                              ; preds = %972, %963
  %978 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  %979 = call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %965, x86_fp80 %978, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  br label %980

980:                                              ; preds = %977, %972, %968
  %981 = phi x86_fp80 [ %979, %977 ], [ %965, %972 ], [ %965, %968 ]
  %982 = lshr exact i32 %955, 1
  %983 = icmp ult i32 %957, %982
  br i1 %983, label %984, label %986

984:                                              ; preds = %980
  %985 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #11
  br label %993

986:                                              ; preds = %980
  %987 = icmp eq i32 %957, %982
  %988 = select i1 %987, i1 %961, i1 false
  br i1 %988, label %989, label %991

989:                                              ; preds = %986
  %990 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #11
  br label %993

991:                                              ; preds = %986
  %992 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.500000e+00, metadata !"fpexcept.ignore") #11
  br label %993

993:                                              ; preds = %991, %989, %984
  %994 = phi x86_fp80 [ %985, %984 ], [ %990, %989 ], [ %992, %991 ]
  br i1 %592, label %1003, label %995

995:                                              ; preds = %993
  %996 = load i8, i8* %591, align 1, !tbaa !19
  %997 = icmp eq i8 %996, 45
  br i1 %997, label %998, label %1003

998:                                              ; preds = %995
  %999 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 -1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  %1000 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %981, x86_fp80 %999, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  %1001 = call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 -1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  %1002 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %994, x86_fp80 %1001, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  br label %1003

1003:                                             ; preds = %998, %995, %993
  %1004 = phi x86_fp80 [ %1000, %998 ], [ %981, %995 ], [ %981, %993 ]
  %1005 = phi x86_fp80 [ %1002, %998 ], [ %994, %995 ], [ %994, %993 ]
  %1006 = sub i32 %956, %957
  store i32 %1006, i32* %932, align 4, !tbaa !20
  %1007 = call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %1004, x86_fp80 %1005, metadata !"round.dynamic", metadata !"fpexcept.ignore") #11
  %1008 = call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %1007, x86_fp80 %1004, metadata !"une", metadata !"fpexcept.ignore") #11
  br i1 %1008, label %1009, label %1040

1009:                                             ; preds = %1003
  %1010 = add i32 %1006, %955
  store i32 %1010, i32* %932, align 4, !tbaa !20
  %1011 = icmp ugt i32 %1010, 999999999
  br i1 %1011, label %1012, label %1024

1012:                                             ; preds = %1009, %1019
  %1013 = phi i32* [ %1020, %1019 ], [ %892, %1009 ]
  %1014 = phi i32* [ %1015, %1019 ], [ %932, %1009 ]
  %1015 = getelementptr inbounds i32, i32* %1014, i64 -1
  store i32 0, i32* %1014, align 4, !tbaa !20
  %1016 = icmp ult i32* %1015, %1013
  br i1 %1016, label %1017, label %1019

1017:                                             ; preds = %1012
  %1018 = getelementptr inbounds i32, i32* %1013, i64 -1
  store i32 0, i32* %1018, align 4, !tbaa !20
  br label %1019

1019:                                             ; preds = %1017, %1012
  %1020 = phi i32* [ %1018, %1017 ], [ %1013, %1012 ]
  %1021 = load i32, i32* %1015, align 4, !tbaa !20
  %1022 = add i32 %1021, 1
  store i32 %1022, i32* %1015, align 4, !tbaa !20
  %1023 = icmp ugt i32 %1022, 999999999
  br i1 %1023, label %1012, label %1024

1024:                                             ; preds = %1019, %1009
  %1025 = phi i32* [ %932, %1009 ], [ %1015, %1019 ]
  %1026 = phi i32* [ %892, %1009 ], [ %1020, %1019 ]
  %1027 = ptrtoint i32* %1026 to i64
  %1028 = sub i64 %894, %1027
  %1029 = lshr exact i64 %1028, 2
  %1030 = trunc i64 %1029 to i32
  %1031 = mul i32 %1030, 9
  %1032 = load i32, i32* %1026, align 4, !tbaa !20
  %1033 = icmp ult i32 %1032, 10
  br i1 %1033, label %1040, label %1034

1034:                                             ; preds = %1024, %1034
  %1035 = phi i32 [ %1038, %1034 ], [ %1031, %1024 ]
  %1036 = phi i32 [ %1037, %1034 ], [ 10, %1024 ]
  %1037 = mul nsw i32 %1036, 10
  %1038 = add nsw i32 %1035, 1
  %1039 = icmp ult i32 %1032, %1037
  br i1 %1039, label %1040, label %1034

1040:                                             ; preds = %1034, %1024, %1003, %954
  %1041 = phi i32 [ %910, %954 ], [ %910, %1003 ], [ %1031, %1024 ], [ %1038, %1034 ]
  %1042 = phi i32* [ %932, %954 ], [ %932, %1003 ], [ %1025, %1024 ], [ %1025, %1034 ]
  %1043 = phi i32* [ %892, %954 ], [ %892, %1003 ], [ %1026, %1024 ], [ %1026, %1034 ]
  %1044 = getelementptr inbounds i32, i32* %1042, i64 1
  %1045 = icmp ugt i32* %891, %1044
  %1046 = select i1 %1045, i32* %1044, i32* %891
  br label %1047

1047:                                             ; preds = %1040, %909
  %1048 = phi i32 [ %1041, %1040 ], [ %910, %909 ]
  %1049 = phi i32* [ %1046, %1040 ], [ %891, %909 ]
  %1050 = phi i32* [ %1043, %1040 ], [ %892, %909 ]
  br label %1051

1051:                                             ; preds = %1054, %1047
  %1052 = phi i32* [ %1049, %1047 ], [ %1055, %1054 ]
  %1053 = icmp ugt i32* %1052, %1050
  br i1 %1053, label %1054, label %1058

1054:                                             ; preds = %1051
  %1055 = getelementptr inbounds i32, i32* %1052, i64 -1
  %1056 = load i32, i32* %1055, align 4, !tbaa !20
  %1057 = icmp eq i32 %1056, 0
  br i1 %1057, label %1051, label %1058

1058:                                             ; preds = %1054, %1051
  br i1 %914, label %1061, label %1059

1059:                                             ; preds = %1058
  %1060 = and i32 %353, 8
  br label %1117

1061:                                             ; preds = %1058
  %1062 = select i1 %915, i32 %775, i32 1
  %1063 = icmp sgt i32 %1062, %1048
  %1064 = icmp sgt i32 %1048, -5
  %1065 = and i1 %1063, %1064
  %1066 = xor i32 %1048, -1
  %1067 = select i1 %1065, i32 -1, i32 -2
  %1068 = add nsw i32 %1067, %349
  %1069 = select i1 %1065, i32 %1066, i32 -1
  %1070 = add i32 %1069, %1062
  %1071 = and i32 %353, 8
  %1072 = icmp eq i32 %1071, 0
  br i1 %1072, label %1073, label %1117

1073:                                             ; preds = %1061
  br i1 %1053, label %1074, label %1088

1074:                                             ; preds = %1073
  %1075 = getelementptr inbounds i32, i32* %1052, i64 -1
  %1076 = load i32, i32* %1075, align 4, !tbaa !20
  %1077 = icmp eq i32 %1076, 0
  br i1 %1077, label %1088, label %1078

1078:                                             ; preds = %1074
  %1079 = urem i32 %1076, 10
  %1080 = icmp eq i32 %1079, 0
  br i1 %1080, label %1081, label %1088

1081:                                             ; preds = %1078, %1081
  %1082 = phi i32 [ %1084, %1081 ], [ 10, %1078 ]
  %1083 = phi i32 [ %1085, %1081 ], [ 0, %1078 ]
  %1084 = mul nuw nsw i32 %1082, 10
  %1085 = add nuw nsw i32 %1083, 1
  %1086 = urem i32 %1076, %1084
  %1087 = icmp eq i32 %1086, 0
  br i1 %1087, label %1081, label %1088

1088:                                             ; preds = %1081, %1078, %1074, %1073
  %1089 = phi i32 [ 9, %1074 ], [ 9, %1073 ], [ 0, %1078 ], [ %1085, %1081 ]
  %1090 = and i32 %1068, -33
  %1091 = icmp eq i32 %1090, 70
  %1092 = sext i32 %1070 to i64
  %1093 = ptrtoint i32* %1052 to i64
  %1094 = sub i64 %1093, %894
  %1095 = ashr exact i64 %1094, 2
  %1096 = mul i64 %1095, 9
  br i1 %1091, label %1097, label %1106

1097:                                             ; preds = %1088
  %1098 = add i64 %1096, -9
  %1099 = zext i32 %1089 to i64
  %1100 = sub i64 %1098, %1099
  %1101 = icmp sgt i64 %1100, 0
  %1102 = select i1 %1101, i64 %1100, i64 0
  %1103 = icmp sgt i64 %1102, %1092
  %1104 = select i1 %1103, i64 %1092, i64 %1102
  %1105 = trunc i64 %1104 to i32
  br label %1117

1106:                                             ; preds = %1088
  %1107 = sext i32 %1048 to i64
  %1108 = zext i32 %1089 to i64
  %1109 = add i64 %1096, -9
  %1110 = add i64 %1109, %1107
  %1111 = sub i64 %1110, %1108
  %1112 = icmp sgt i64 %1111, 0
  %1113 = select i1 %1112, i64 %1111, i64 0
  %1114 = icmp sgt i64 %1113, %1092
  %1115 = select i1 %1114, i64 %1092, i64 %1113
  %1116 = trunc i64 %1115 to i32
  br label %1117

1117:                                             ; preds = %1106, %1097, %1061, %1059
  %1118 = phi i32 [ %1060, %1059 ], [ %1071, %1061 ], [ 0, %1106 ], [ 0, %1097 ]
  %1119 = phi i32 [ %349, %1059 ], [ %1068, %1061 ], [ %1068, %1106 ], [ %1068, %1097 ]
  %1120 = phi i32 [ %775, %1059 ], [ %1070, %1061 ], [ %1116, %1106 ], [ %1105, %1097 ]
  %1121 = icmp eq i32 %1118, 0
  %1122 = or i32 %1120, %1118
  %1123 = icmp ne i32 %1122, 0
  %1124 = select i1 %1123, i32 2147483645, i32 2147483646
  %1125 = icmp sgt i32 %1120, %1124
  br i1 %1125, label %1370, label %1126

1126:                                             ; preds = %1117
  %1127 = zext i1 %1123 to i32
  %1128 = add nsw i32 %1120, 1
  %1129 = add nsw i32 %1128, %1127
  %1130 = and i32 %1119, -33
  %1131 = icmp eq i32 %1130, 70
  br i1 %1131, label %1132, label %1138

1132:                                             ; preds = %1126
  %1133 = sub nsw i32 2147483647, %1129
  %1134 = icmp sgt i32 %1048, %1133
  br i1 %1134, label %1370, label %1135

1135:                                             ; preds = %1132
  %1136 = icmp sgt i32 %1048, 0
  %1137 = select i1 %1136, i32 %1048, i32 0
  br label %1180

1138:                                             ; preds = %1126
  %1139 = icmp slt i32 %1048, 0
  %1140 = sub nsw i32 0, %1048
  %1141 = select i1 %1139, i32 %1140, i32 %1048
  %1142 = icmp eq i32 %1141, 0
  br i1 %1142, label %1156, label %1143

1143:                                             ; preds = %1138
  %1144 = zext i32 %1141 to i64
  br label %1145

1145:                                             ; preds = %1145, %1143
  %1146 = phi i64 [ %1152, %1145 ], [ %1144, %1143 ]
  %1147 = phi i8* [ %1151, %1145 ], [ %29, %1143 ]
  %1148 = urem i64 %1146, 10
  %1149 = trunc i64 %1148 to i8
  %1150 = or i8 %1149, 48
  %1151 = getelementptr inbounds i8, i8* %1147, i64 -1
  store i8 %1150, i8* %1151, align 1, !tbaa !19
  %1152 = udiv i64 %1146, 10
  %1153 = icmp ult i64 %1146, 10
  br i1 %1153, label %1154, label %1145

1154:                                             ; preds = %1145
  %1155 = ptrtoint i8* %1151 to i64
  br label %1156

1156:                                             ; preds = %1154, %1138
  %1157 = phi i64 [ %1155, %1154 ], [ %34, %1138 ]
  %1158 = phi i8* [ %1151, %1154 ], [ %29, %1138 ]
  %1159 = sub i64 %34, %1157
  %1160 = icmp slt i64 %1159, 2
  br i1 %1160, label %1161, label %1167

1161:                                             ; preds = %1156, %1161
  %1162 = phi i8* [ %1163, %1161 ], [ %1158, %1156 ]
  %1163 = getelementptr inbounds i8, i8* %1162, i64 -1
  store i8 48, i8* %1163, align 1, !tbaa !19
  %1164 = ptrtoint i8* %1163 to i64
  %1165 = sub i64 %34, %1164
  %1166 = icmp slt i64 %1165, 2
  br i1 %1166, label %1161, label %1167

1167:                                             ; preds = %1161, %1156
  %1168 = phi i8* [ %1158, %1156 ], [ %1163, %1161 ]
  %1169 = select i1 %1139, i8 45, i8 43
  %1170 = getelementptr inbounds i8, i8* %1168, i64 -1
  store i8 %1169, i8* %1170, align 1, !tbaa !19
  %1171 = trunc i32 %1119 to i8
  %1172 = getelementptr inbounds i8, i8* %1168, i64 -2
  store i8 %1171, i8* %1172, align 1, !tbaa !19
  %1173 = ptrtoint i8* %1172 to i64
  %1174 = sub i64 %34, %1173
  %1175 = sub nsw i32 2147483647, %1129
  %1176 = zext i32 %1175 to i64
  %1177 = icmp sgt i64 %1174, %1176
  br i1 %1177, label %1370, label %1178

1178:                                             ; preds = %1167
  %1179 = trunc i64 %1174 to i32
  br label %1180

1180:                                             ; preds = %1178, %1135
  %1181 = phi i32 [ %1179, %1178 ], [ %1137, %1135 ]
  %1182 = phi i8* [ %1172, %1178 ], [ undef, %1135 ]
  %1183 = add i32 %1181, %1129
  %1184 = xor i32 %593, 2147483647
  %1185 = icmp sgt i32 %1183, %1184
  br i1 %1185, label %1370, label %1186

1186:                                             ; preds = %1180
  %1187 = add nsw i32 %1183, %593
  call fastcc void @pad(%struct._IO_FILE* noundef %0, i8 noundef signext 32, i32 noundef %233, i32 noundef %1187, i32 noundef %353) #14
  %1188 = load i32, i32* %19, align 8, !tbaa !10
  %1189 = and i32 %1188, 32
  %1190 = icmp eq i32 %1189, 0
  br i1 %1190, label %1191, label %1194

1191:                                             ; preds = %1186
  %1192 = zext i32 %593 to i64
  %1193 = call i64 @__fwritex(i8* noundef %591, i64 noundef %1192, %struct._IO_FILE* noundef nonnull %0) #14
  br label %1194

1194:                                             ; preds = %1191, %1186
  %1195 = xor i32 %353, 65536
  call fastcc void @pad(%struct._IO_FILE* noundef nonnull %0, i8 noundef signext 48, i32 noundef %233, i32 noundef %1187, i32 noundef %1195) #14
  br i1 %1131, label %1196, label %1293

1196:                                             ; preds = %1194
  %1197 = icmp ugt i32* %1050, %779
  %1198 = select i1 %1197, i32* %779, i32* %1050
  br label %1199

1199:                                             ; preds = %1235, %1196
  %1200 = phi i32* [ %1198, %1196 ], [ %1236, %1235 ]
  %1201 = load i32, i32* %1200, align 4, !tbaa !20
  %1202 = icmp eq i32 %1201, 0
  br i1 %1202, label %1214, label %1203

1203:                                             ; preds = %1199
  %1204 = zext i32 %1201 to i64
  br label %1205

1205:                                             ; preds = %1205, %1203
  %1206 = phi i64 [ %1212, %1205 ], [ %1204, %1203 ]
  %1207 = phi i8* [ %1211, %1205 ], [ %35, %1203 ]
  %1208 = urem i64 %1206, 10
  %1209 = trunc i64 %1208 to i8
  %1210 = or i8 %1209, 48
  %1211 = getelementptr inbounds i8, i8* %1207, i64 -1
  store i8 %1210, i8* %1211, align 1, !tbaa !19
  %1212 = udiv i64 %1206, 10
  %1213 = icmp ult i64 %1206, 10
  br i1 %1213, label %1214, label %1205

1214:                                             ; preds = %1205, %1199
  %1215 = phi i8* [ %35, %1199 ], [ %1211, %1205 ]
  %1216 = icmp eq i32* %1200, %1198
  br i1 %1216, label %1223, label %1217

1217:                                             ; preds = %1214
  %1218 = icmp ugt i8* %1215, %27
  br i1 %1218, label %1219, label %1226

1219:                                             ; preds = %1217, %1219
  %1220 = phi i8* [ %1221, %1219 ], [ %1215, %1217 ]
  %1221 = getelementptr inbounds i8, i8* %1220, i64 -1
  store i8 48, i8* %1221, align 1, !tbaa !19
  %1222 = icmp ugt i8* %1221, %27
  br i1 %1222, label %1219, label %1226

1223:                                             ; preds = %1214
  %1224 = icmp eq i8* %1215, %35
  br i1 %1224, label %1225, label %1226

1225:                                             ; preds = %1223
  store i8 48, i8* %37, align 8, !tbaa !19
  br label %1226

1226:                                             ; preds = %1219, %1225, %1223, %1217
  %1227 = phi i8* [ %37, %1225 ], [ %1215, %1223 ], [ %1215, %1217 ], [ %1221, %1219 ]
  %1228 = load i32, i32* %19, align 8, !tbaa !10
  %1229 = and i32 %1228, 32
  %1230 = icmp eq i32 %1229, 0
  br i1 %1230, label %1231, label %1235

1231:                                             ; preds = %1226
  %1232 = ptrtoint i8* %1227 to i64
  %1233 = sub i64 %36, %1232
  %1234 = call i64 @__fwritex(i8* noundef nonnull %1227, i64 noundef %1233, %struct._IO_FILE* noundef nonnull %0) #14
  br label %1235

1235:                                             ; preds = %1231, %1226
  %1236 = getelementptr inbounds i32, i32* %1200, i64 1
  %1237 = icmp ugt i32* %1236, %779
  br i1 %1237, label %1238, label %1199

1238:                                             ; preds = %1235
  %1239 = icmp eq i32 %1122, 0
  br i1 %1239, label %1246, label %1240

1240:                                             ; preds = %1238
  %1241 = load i32, i32* %19, align 8, !tbaa !10
  %1242 = and i32 %1241, 32
  %1243 = icmp eq i32 %1242, 0
  br i1 %1243, label %1244, label %1246

1244:                                             ; preds = %1240
  %1245 = call i64 @__fwritex(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i64 0, i64 0), i64 noundef 1, %struct._IO_FILE* noundef nonnull %0) #14
  br label %1246

1246:                                             ; preds = %1244, %1240, %1238
  %1247 = icmp ult i32* %1236, %1052
  %1248 = icmp sgt i32 %1120, 0
  %1249 = select i1 %1247, i1 %1248, i1 false
  br i1 %1249, label %1250, label %1290

1250:                                             ; preds = %1246, %1284
  %1251 = phi i32 [ %1286, %1284 ], [ %1120, %1246 ]
  %1252 = phi i32* [ %1285, %1284 ], [ %1236, %1246 ]
  %1253 = load i32, i32* %1252, align 4, !tbaa !20
  %1254 = icmp eq i32 %1253, 0
  br i1 %1254, label %1268, label %1255

1255:                                             ; preds = %1250
  %1256 = zext i32 %1253 to i64
  br label %1257

1257:                                             ; preds = %1257, %1255
  %1258 = phi i64 [ %1264, %1257 ], [ %1256, %1255 ]
  %1259 = phi i8* [ %1263, %1257 ], [ %35, %1255 ]
  %1260 = urem i64 %1258, 10
  %1261 = trunc i64 %1260 to i8
  %1262 = or i8 %1261, 48
  %1263 = getelementptr inbounds i8, i8* %1259, i64 -1
  store i8 %1262, i8* %1263, align 1, !tbaa !19
  %1264 = udiv i64 %1258, 10
  %1265 = icmp ult i64 %1258, 10
  br i1 %1265, label %1266, label %1257

1266:                                             ; preds = %1257
  %1267 = icmp ugt i8* %1263, %27
  br i1 %1267, label %1268, label %1274

1268:                                             ; preds = %1266, %1250
  %1269 = phi i8* [ %35, %1250 ], [ %1263, %1266 ]
  br label %1270

1270:                                             ; preds = %1268, %1270
  %1271 = phi i8* [ %1272, %1270 ], [ %1269, %1268 ]
  %1272 = getelementptr inbounds i8, i8* %1271, i64 -1
  store i8 48, i8* %1272, align 1, !tbaa !19
  %1273 = icmp ugt i8* %1272, %27
  br i1 %1273, label %1270, label %1274

1274:                                             ; preds = %1270, %1266
  %1275 = phi i8* [ %1263, %1266 ], [ %1272, %1270 ]
  %1276 = load i32, i32* %19, align 8, !tbaa !10
  %1277 = and i32 %1276, 32
  %1278 = icmp eq i32 %1277, 0
  br i1 %1278, label %1279, label %1284

1279:                                             ; preds = %1274
  %1280 = icmp slt i32 %1251, 9
  %1281 = select i1 %1280, i32 %1251, i32 9
  %1282 = sext i32 %1281 to i64
  %1283 = call i64 @__fwritex(i8* noundef nonnull %1275, i64 noundef %1282, %struct._IO_FILE* noundef nonnull %0) #14
  br label %1284

1284:                                             ; preds = %1279, %1274
  %1285 = getelementptr inbounds i32, i32* %1252, i64 1
  %1286 = add nsw i32 %1251, -9
  %1287 = icmp ult i32* %1285, %1052
  %1288 = icmp sgt i32 %1251, 9
  %1289 = select i1 %1287, i1 %1288, i1 false
  br i1 %1289, label %1250, label %1290

1290:                                             ; preds = %1284, %1246
  %1291 = phi i32 [ %1120, %1246 ], [ %1286, %1284 ]
  %1292 = add nsw i32 %1291, 9
  call fastcc void @pad(%struct._IO_FILE* noundef nonnull %0, i8 noundef signext 48, i32 noundef %1292, i32 noundef 9, i32 noundef 0) #14
  br label %1371

1293:                                             ; preds = %1194
  %1294 = getelementptr inbounds i32, i32* %1050, i64 1
  %1295 = select i1 %1053, i32* %1052, i32* %1294
  %1296 = icmp sgt i32 %1120, -1
  br i1 %1296, label %1297, label %1360

1297:                                             ; preds = %1293, %1353
  %1298 = phi i32 [ %1355, %1353 ], [ %1120, %1293 ]
  %1299 = phi i32* [ %1356, %1353 ], [ %1050, %1293 ]
  %1300 = load i32, i32* %1299, align 4, !tbaa !20
  %1301 = icmp eq i32 %1300, 0
  br i1 %1301, label %1315, label %1302

1302:                                             ; preds = %1297
  %1303 = zext i32 %1300 to i64
  br label %1304

1304:                                             ; preds = %1304, %1302
  %1305 = phi i64 [ %1311, %1304 ], [ %1303, %1302 ]
  %1306 = phi i8* [ %1310, %1304 ], [ %35, %1302 ]
  %1307 = urem i64 %1305, 10
  %1308 = trunc i64 %1307 to i8
  %1309 = or i8 %1308, 48
  %1310 = getelementptr inbounds i8, i8* %1306, i64 -1
  store i8 %1309, i8* %1310, align 1, !tbaa !19
  %1311 = udiv i64 %1305, 10
  %1312 = icmp ult i64 %1305, 10
  br i1 %1312, label %1313, label %1304

1313:                                             ; preds = %1304
  %1314 = icmp eq i8* %1310, %35
  br i1 %1314, label %1315, label %1316

1315:                                             ; preds = %1313, %1297
  store i8 48, i8* %37, align 8, !tbaa !19
  br label %1316

1316:                                             ; preds = %1315, %1313
  %1317 = phi i8* [ %37, %1315 ], [ %1310, %1313 ]
  %1318 = icmp eq i32* %1299, %1050
  br i1 %1318, label %1325, label %1319

1319:                                             ; preds = %1316
  %1320 = icmp ugt i8* %1317, %27
  br i1 %1320, label %1321, label %1341

1321:                                             ; preds = %1319, %1321
  %1322 = phi i8* [ %1323, %1321 ], [ %1317, %1319 ]
  %1323 = getelementptr inbounds i8, i8* %1322, i64 -1
  store i8 48, i8* %1323, align 1, !tbaa !19
  %1324 = icmp ugt i8* %1323, %27
  br i1 %1324, label %1321, label %1341

1325:                                             ; preds = %1316
  %1326 = getelementptr inbounds i8, i8* %1317, i64 1
  %1327 = load i32, i32* %19, align 8, !tbaa !10
  %1328 = and i32 %1327, 32
  %1329 = icmp eq i32 %1328, 0
  br i1 %1329, label %1330, label %1332

1330:                                             ; preds = %1325
  %1331 = call i64 @__fwritex(i8* noundef nonnull %1317, i64 noundef 1, %struct._IO_FILE* noundef nonnull %0) #14
  br label %1332

1332:                                             ; preds = %1330, %1325
  %1333 = icmp slt i32 %1298, 1
  %1334 = and i1 %1121, %1333
  br i1 %1334, label %1341, label %1335

1335:                                             ; preds = %1332
  %1336 = load i32, i32* %19, align 8, !tbaa !10
  %1337 = and i32 %1336, 32
  %1338 = icmp eq i32 %1337, 0
  br i1 %1338, label %1339, label %1341

1339:                                             ; preds = %1335
  %1340 = call i64 @__fwritex(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i64 0, i64 0), i64 noundef 1, %struct._IO_FILE* noundef nonnull %0) #14
  br label %1341

1341:                                             ; preds = %1321, %1339, %1335, %1332, %1319
  %1342 = phi i8* [ %1326, %1332 ], [ %1326, %1335 ], [ %1326, %1339 ], [ %1317, %1319 ], [ %1323, %1321 ]
  %1343 = ptrtoint i8* %1342 to i64
  %1344 = sub i64 %36, %1343
  %1345 = sext i32 %1298 to i64
  %1346 = load i32, i32* %19, align 8, !tbaa !10
  %1347 = and i32 %1346, 32
  %1348 = icmp eq i32 %1347, 0
  br i1 %1348, label %1349, label %1353

1349:                                             ; preds = %1341
  %1350 = icmp slt i64 %1344, %1345
  %1351 = select i1 %1350, i64 %1344, i64 %1345
  %1352 = call i64 @__fwritex(i8* noundef nonnull %1342, i64 noundef %1351, %struct._IO_FILE* noundef nonnull %0) #14
  br label %1353

1353:                                             ; preds = %1349, %1341
  %1354 = trunc i64 %1344 to i32
  %1355 = sub i32 %1298, %1354
  %1356 = getelementptr inbounds i32, i32* %1299, i64 1
  %1357 = icmp ult i32* %1356, %1295
  %1358 = icmp sgt i32 %1355, -1
  %1359 = select i1 %1357, i1 %1358, i1 false
  br i1 %1359, label %1297, label %1360

1360:                                             ; preds = %1353, %1293
  %1361 = phi i32 [ %1120, %1293 ], [ %1355, %1353 ]
  %1362 = add nsw i32 %1361, 18
  call fastcc void @pad(%struct._IO_FILE* noundef nonnull %0, i8 noundef signext 48, i32 noundef %1362, i32 noundef 18, i32 noundef 0) #14
  %1363 = load i32, i32* %19, align 8, !tbaa !10
  %1364 = and i32 %1363, 32
  %1365 = icmp eq i32 %1364, 0
  br i1 %1365, label %1366, label %1371

1366:                                             ; preds = %1360
  %1367 = ptrtoint i8* %1182 to i64
  %1368 = sub i64 %34, %1367
  %1369 = call i64 @__fwritex(i8* noundef %1182, i64 noundef %1368, %struct._IO_FILE* noundef nonnull %0) #14
  br label %1371

1370:                                             ; preds = %726, %1117, %1132, %1167, %1180
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %28) #11
  call void @llvm.lifetime.end.p0i8(i64 25, i8* nonnull %27) #11
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %26) #11
  call void @llvm.lifetime.end.p0i8(i64 7340, i8* nonnull %25) #11
  br label %1437

1371:                                             ; preds = %1290, %1360, %1366, %759, %766
  %1372 = phi i32 [ %746, %766 ], [ %746, %759 ], [ %1187, %1366 ], [ %1187, %1360 ], [ %1187, %1290 ]
  %1373 = xor i32 %353, 8192
  call fastcc void @pad(%struct._IO_FILE* noundef nonnull %0, i8 noundef signext 32, i32 noundef %233, i32 noundef %1372, i32 noundef %1373) #14
  %1374 = icmp slt i32 %1372, %233
  %1375 = select i1 %1374, i32 %233, i32 %1372
  br label %1376

1376:                                             ; preds = %1371, %618
  %1377 = phi i32 [ %233, %618 ], [ %1375, %1371 ]
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %28) #11
  call void @llvm.lifetime.end.p0i8(i64 25, i8* nonnull %27) #11
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %26) #11
  call void @llvm.lifetime.end.p0i8(i64 7340, i8* nonnull %25) #11
  %1378 = icmp slt i32 %1377, 0
  br i1 %1378, label %1437, label %622

1379:                                             ; preds = %474, %341, %511, %490, %480
  %1380 = phi i64 [ %48, %474 ], [ %48, %341 ], [ %513, %511 ], [ %48, %490 ], [ %48, %480 ]
  %1381 = phi i8* [ %23, %474 ], [ %58, %341 ], [ %502, %511 ], [ %47, %490 ], [ %466, %480 ]
  %1382 = phi i32 [ %476, %474 ], [ %353, %341 ], [ %352, %511 ], [ %352, %490 ], [ %476, %480 ]
  %1383 = phi i32 [ 0, %474 ], [ %308, %341 ], [ %512, %511 ], [ 1, %490 ], [ %489, %480 ]
  %1384 = phi i8* [ %469, %474 ], [ getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), %341 ], [ getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), %511 ], [ getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), %490 ], [ %469, %480 ]
  %1385 = phi i32 [ %470, %474 ], [ 0, %341 ], [ 0, %511 ], [ 0, %490 ], [ %470, %480 ]
  %1386 = sext i32 %1383 to i64
  %1387 = ptrtoint i8* %1381 to i64
  %1388 = sub i64 %1380, %1387
  %1389 = icmp sgt i64 %1388, %1386
  %1390 = trunc i64 %1388 to i32
  %1391 = select i1 %1389, i32 %1390, i32 %1383
  %1392 = sub nsw i32 2147483647, %1385
  %1393 = icmp sgt i32 %1391, %1392
  br i1 %1393, label %1437, label %1394

1394:                                             ; preds = %1379
  %1395 = add nsw i32 %1391, %1385
  %1396 = icmp slt i32 %233, %1395
  %1397 = select i1 %1396, i32 %1395, i32 %233
  %1398 = icmp sgt i32 %1397, %90
  br i1 %1398, label %1437, label %1399

1399:                                             ; preds = %1394
  call fastcc void @pad(%struct._IO_FILE* noundef nonnull %0, i8 noundef signext 32, i32 noundef %1397, i32 noundef %1395, i32 noundef %1382) #13
  %1400 = load i32, i32* %19, align 8, !tbaa !10
  %1401 = and i32 %1400, 32
  %1402 = icmp eq i32 %1401, 0
  br i1 %1402, label %1403, label %1406

1403:                                             ; preds = %1399
  %1404 = zext i32 %1385 to i64
  %1405 = call i64 @__fwritex(i8* noundef %1384, i64 noundef %1404, %struct._IO_FILE* noundef nonnull %0) #14
  br label %1406

1406:                                             ; preds = %1399, %1403
  %1407 = xor i32 %1382, 65536
  call fastcc void @pad(%struct._IO_FILE* noundef nonnull %0, i8 noundef signext 48, i32 noundef %1397, i32 noundef %1395, i32 noundef %1407) #13
  call fastcc void @pad(%struct._IO_FILE* noundef nonnull %0, i8 noundef signext 48, i32 noundef %1391, i32 noundef %1390, i32 noundef 0) #13
  %1408 = load i32, i32* %19, align 8, !tbaa !10
  %1409 = and i32 %1408, 32
  %1410 = icmp eq i32 %1409, 0
  br i1 %1410, label %1411, label %1413

1411:                                             ; preds = %1406
  %1412 = call i64 @__fwritex(i8* noundef %1381, i64 noundef %1388, %struct._IO_FILE* noundef nonnull %0) #14
  br label %1413

1413:                                             ; preds = %1406, %1411
  %1414 = xor i32 %1382, 8192
  call fastcc void @pad(%struct._IO_FILE* noundef nonnull %0, i8 noundef signext 32, i32 noundef %1397, i32 noundef %1395, i32 noundef %1414) #13
  br label %622

1415:                                             ; preds = %63
  br i1 %18, label %1416, label %1440

1416:                                             ; preds = %1415
  %1417 = icmp eq i32 %54, 0
  br i1 %1417, label %1440, label %1418

1418:                                             ; preds = %1416, %1423
  %1419 = phi i64 [ %1425, %1423 ], [ 1, %1416 ]
  %1420 = getelementptr inbounds i32, i32* %4, i64 %1419
  %1421 = load i32, i32* %1420, align 4, !tbaa !20
  %1422 = icmp eq i32 %1421, 0
  br i1 %1422, label %1427, label %1423

1423:                                             ; preds = %1418
  %1424 = getelementptr inbounds %union.arg, %union.arg* %3, i64 %1419
  call fastcc void @pop_arg(%union.arg* noundef nonnull %1424, i32 noundef %1421, [1 x %struct.__va_list_tag]* noundef %2) #13
  %1425 = add nuw nsw i64 %1419, 1
  %1426 = icmp eq i64 %1425, 10
  br i1 %1426, label %1440, label %1418

1427:                                             ; preds = %1418
  %1428 = icmp ult i64 %1419, 10
  br i1 %1428, label %1432, label %1440

1429:                                             ; preds = %1432
  %1430 = add nuw nsw i64 %1433, 1
  %1431 = icmp eq i64 %1430, 10
  br i1 %1431, label %1440, label %1432

1432:                                             ; preds = %1427, %1429
  %1433 = phi i64 [ %1430, %1429 ], [ %1419, %1427 ]
  %1434 = getelementptr inbounds i32, i32* %4, i64 %1433
  %1435 = load i32, i32* %1434, align 4, !tbaa !20
  %1436 = icmp eq i32 %1435, 0
  br i1 %1436, label %1429, label %1437

1437:                                             ; preds = %227, %464, %508, %541, %571, %1376, %1379, %1394, %171, %261, %329, %327, %57, %84, %221, %310, %1432, %1370
  %1438 = phi i32 [ 75, %1370 ], [ 22, %1432 ], [ 22, %310 ], [ 75, %221 ], [ 75, %84 ], [ 75, %57 ], [ 22, %327 ], [ 22, %329 ], [ 22, %261 ], [ 22, %171 ], [ 75, %1394 ], [ 75, %1379 ], [ 75, %1376 ], [ 75, %571 ], [ 75, %541 ], [ 75, %508 ], [ 75, %464 ], [ 75, %227 ]
  %1439 = tail call i32* @___errno_location() #15
  store i32 %1438, i32* %1439, align 4, !tbaa !20
  br label %1440

1440:                                             ; preds = %338, %532, %1423, %1429, %1437, %1427, %1416, %1415
  %1441 = phi i32 [ %64, %1415 ], [ 0, %1416 ], [ 1, %1427 ], [ -1, %1437 ], [ 1, %1429 ], [ 1, %1423 ], [ -1, %532 ], [ 0, %338 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %17) #11
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %16) #11
  call void @llvm.lifetime.end.p0i8(i64 43, i8* nonnull %15) #11
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %14) #11
  ret i32 %1441
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #3

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare hidden i32 @__towrite(%struct._IO_FILE* noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare hidden void @__unlockfile(%struct._IO_FILE* noundef) local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define internal fastcc void @pop_arg(%union.arg* nocapture noundef writeonly %0, i32 noundef %1, [1 x %struct.__va_list_tag]* noundef %2) unnamed_addr #6 {
  switch i32 %1, label %352 [
    i32 9, label %4
    i32 10, label %23
    i32 11, label %43
    i32 13, label %63
    i32 14, label %82
    i32 12, label %101
    i32 15, label %120
    i32 16, label %142
    i32 17, label %163
    i32 18, label %185
    i32 19, label %206
    i32 20, label %225
    i32 21, label %244
    i32 22, label %263
    i32 23, label %282
    i32 24, label %301
    i32 25, label %321
    i32 26, label %341
  ]

4:                                                ; preds = %3
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %6 = load i32, i32* %5, align 8
  %7 = icmp ult i32 %6, 41
  br i1 %7, label %8, label %14

8:                                                ; preds = %4
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %10 = load i8*, i8** %9, align 8
  %11 = zext i32 %6 to i64
  %12 = getelementptr i8, i8* %10, i64 %11
  %13 = add nuw nsw i32 %6, 8
  store i32 %13, i32* %5, align 8
  br label %18

14:                                               ; preds = %4
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %16 = load i8*, i8** %15, align 8
  %17 = getelementptr i8, i8* %16, i64 8
  store i8* %17, i8** %15, align 8
  br label %18

18:                                               ; preds = %14, %8
  %19 = phi i8* [ %12, %8 ], [ %16, %14 ]
  %20 = bitcast i8* %19 to i8**
  %21 = load i8*, i8** %20, align 8
  %22 = bitcast %union.arg* %0 to i8**
  store i8* %21, i8** %22, align 16, !tbaa !19
  br label %352

23:                                               ; preds = %3
  %24 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %25 = load i32, i32* %24, align 8
  %26 = icmp ult i32 %25, 41
  br i1 %26, label %27, label %33

27:                                               ; preds = %23
  %28 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %29 = load i8*, i8** %28, align 8
  %30 = zext i32 %25 to i64
  %31 = getelementptr i8, i8* %29, i64 %30
  %32 = add nuw nsw i32 %25, 8
  store i32 %32, i32* %24, align 8
  br label %37

33:                                               ; preds = %23
  %34 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %35 = load i8*, i8** %34, align 8
  %36 = getelementptr i8, i8* %35, i64 8
  store i8* %36, i8** %34, align 8
  br label %37

37:                                               ; preds = %33, %27
  %38 = phi i8* [ %31, %27 ], [ %35, %33 ]
  %39 = bitcast i8* %38 to i32*
  %40 = load i32, i32* %39, align 4
  %41 = sext i32 %40 to i64
  %42 = bitcast %union.arg* %0 to i64*
  store i64 %41, i64* %42, align 16, !tbaa !19
  br label %352

43:                                               ; preds = %3
  %44 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %45 = load i32, i32* %44, align 8
  %46 = icmp ult i32 %45, 41
  br i1 %46, label %47, label %53

47:                                               ; preds = %43
  %48 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %49 = load i8*, i8** %48, align 8
  %50 = zext i32 %45 to i64
  %51 = getelementptr i8, i8* %49, i64 %50
  %52 = add nuw nsw i32 %45, 8
  store i32 %52, i32* %44, align 8
  br label %57

53:                                               ; preds = %43
  %54 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %55 = load i8*, i8** %54, align 8
  %56 = getelementptr i8, i8* %55, i64 8
  store i8* %56, i8** %54, align 8
  br label %57

57:                                               ; preds = %53, %47
  %58 = phi i8* [ %51, %47 ], [ %55, %53 ]
  %59 = bitcast i8* %58 to i32*
  %60 = load i32, i32* %59, align 4
  %61 = zext i32 %60 to i64
  %62 = bitcast %union.arg* %0 to i64*
  store i64 %61, i64* %62, align 16, !tbaa !19
  br label %352

63:                                               ; preds = %3
  %64 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %65 = load i32, i32* %64, align 8
  %66 = icmp ult i32 %65, 41
  br i1 %66, label %67, label %73

67:                                               ; preds = %63
  %68 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %69 = load i8*, i8** %68, align 8
  %70 = zext i32 %65 to i64
  %71 = getelementptr i8, i8* %69, i64 %70
  %72 = add nuw nsw i32 %65, 8
  store i32 %72, i32* %64, align 8
  br label %77

73:                                               ; preds = %63
  %74 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %75 = load i8*, i8** %74, align 8
  %76 = getelementptr i8, i8* %75, i64 8
  store i8* %76, i8** %74, align 8
  br label %77

77:                                               ; preds = %73, %67
  %78 = phi i8* [ %71, %67 ], [ %75, %73 ]
  %79 = bitcast i8* %78 to i64*
  %80 = load i64, i64* %79, align 8
  %81 = bitcast %union.arg* %0 to i64*
  store i64 %80, i64* %81, align 16, !tbaa !19
  br label %352

82:                                               ; preds = %3
  %83 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %84 = load i32, i32* %83, align 8
  %85 = icmp ult i32 %84, 41
  br i1 %85, label %86, label %92

86:                                               ; preds = %82
  %87 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %88 = load i8*, i8** %87, align 8
  %89 = zext i32 %84 to i64
  %90 = getelementptr i8, i8* %88, i64 %89
  %91 = add nuw nsw i32 %84, 8
  store i32 %91, i32* %83, align 8
  br label %96

92:                                               ; preds = %82
  %93 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %94 = load i8*, i8** %93, align 8
  %95 = getelementptr i8, i8* %94, i64 8
  store i8* %95, i8** %93, align 8
  br label %96

96:                                               ; preds = %92, %86
  %97 = phi i8* [ %90, %86 ], [ %94, %92 ]
  %98 = bitcast i8* %97 to i64*
  %99 = load i64, i64* %98, align 8
  %100 = bitcast %union.arg* %0 to i64*
  store i64 %99, i64* %100, align 16, !tbaa !19
  br label %352

101:                                              ; preds = %3
  %102 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %103 = load i32, i32* %102, align 8
  %104 = icmp ult i32 %103, 41
  br i1 %104, label %105, label %111

105:                                              ; preds = %101
  %106 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %107 = load i8*, i8** %106, align 8
  %108 = zext i32 %103 to i64
  %109 = getelementptr i8, i8* %107, i64 %108
  %110 = add nuw nsw i32 %103, 8
  store i32 %110, i32* %102, align 8
  br label %115

111:                                              ; preds = %101
  %112 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %113 = load i8*, i8** %112, align 8
  %114 = getelementptr i8, i8* %113, i64 8
  store i8* %114, i8** %112, align 8
  br label %115

115:                                              ; preds = %111, %105
  %116 = phi i8* [ %109, %105 ], [ %113, %111 ]
  %117 = bitcast i8* %116 to i64*
  %118 = load i64, i64* %117, align 8
  %119 = bitcast %union.arg* %0 to i64*
  store i64 %118, i64* %119, align 16, !tbaa !19
  br label %352

120:                                              ; preds = %3
  %121 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %122 = load i32, i32* %121, align 8
  %123 = icmp ult i32 %122, 41
  br i1 %123, label %124, label %130

124:                                              ; preds = %120
  %125 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %126 = load i8*, i8** %125, align 8
  %127 = zext i32 %122 to i64
  %128 = getelementptr i8, i8* %126, i64 %127
  %129 = add nuw nsw i32 %122, 8
  store i32 %129, i32* %121, align 8
  br label %134

130:                                              ; preds = %120
  %131 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %132 = load i8*, i8** %131, align 8
  %133 = getelementptr i8, i8* %132, i64 8
  store i8* %133, i8** %131, align 8
  br label %134

134:                                              ; preds = %130, %124
  %135 = phi i8* [ %128, %124 ], [ %132, %130 ]
  %136 = bitcast i8* %135 to i32*
  %137 = load i32, i32* %136, align 4
  %138 = zext i32 %137 to i64
  %139 = shl i64 %138, 48
  %140 = ashr exact i64 %139, 48
  %141 = bitcast %union.arg* %0 to i64*
  store i64 %140, i64* %141, align 16, !tbaa !19
  br label %352

142:                                              ; preds = %3
  %143 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %144 = load i32, i32* %143, align 8
  %145 = icmp ult i32 %144, 41
  br i1 %145, label %146, label %152

146:                                              ; preds = %142
  %147 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %148 = load i8*, i8** %147, align 8
  %149 = zext i32 %144 to i64
  %150 = getelementptr i8, i8* %148, i64 %149
  %151 = add nuw nsw i32 %144, 8
  store i32 %151, i32* %143, align 8
  br label %156

152:                                              ; preds = %142
  %153 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %154 = load i8*, i8** %153, align 8
  %155 = getelementptr i8, i8* %154, i64 8
  store i8* %155, i8** %153, align 8
  br label %156

156:                                              ; preds = %152, %146
  %157 = phi i8* [ %150, %146 ], [ %154, %152 ]
  %158 = bitcast i8* %157 to i32*
  %159 = load i32, i32* %158, align 4
  %160 = and i32 %159, 65535
  %161 = zext i32 %160 to i64
  %162 = bitcast %union.arg* %0 to i64*
  store i64 %161, i64* %162, align 16, !tbaa !19
  br label %352

163:                                              ; preds = %3
  %164 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %165 = load i32, i32* %164, align 8
  %166 = icmp ult i32 %165, 41
  br i1 %166, label %167, label %173

167:                                              ; preds = %163
  %168 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %169 = load i8*, i8** %168, align 8
  %170 = zext i32 %165 to i64
  %171 = getelementptr i8, i8* %169, i64 %170
  %172 = add nuw nsw i32 %165, 8
  store i32 %172, i32* %164, align 8
  br label %177

173:                                              ; preds = %163
  %174 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %175 = load i8*, i8** %174, align 8
  %176 = getelementptr i8, i8* %175, i64 8
  store i8* %176, i8** %174, align 8
  br label %177

177:                                              ; preds = %173, %167
  %178 = phi i8* [ %171, %167 ], [ %175, %173 ]
  %179 = bitcast i8* %178 to i32*
  %180 = load i32, i32* %179, align 4
  %181 = zext i32 %180 to i64
  %182 = shl i64 %181, 56
  %183 = ashr exact i64 %182, 56
  %184 = bitcast %union.arg* %0 to i64*
  store i64 %183, i64* %184, align 16, !tbaa !19
  br label %352

185:                                              ; preds = %3
  %186 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %187 = load i32, i32* %186, align 8
  %188 = icmp ult i32 %187, 41
  br i1 %188, label %189, label %195

189:                                              ; preds = %185
  %190 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %191 = load i8*, i8** %190, align 8
  %192 = zext i32 %187 to i64
  %193 = getelementptr i8, i8* %191, i64 %192
  %194 = add nuw nsw i32 %187, 8
  store i32 %194, i32* %186, align 8
  br label %199

195:                                              ; preds = %185
  %196 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %197 = load i8*, i8** %196, align 8
  %198 = getelementptr i8, i8* %197, i64 8
  store i8* %198, i8** %196, align 8
  br label %199

199:                                              ; preds = %195, %189
  %200 = phi i8* [ %193, %189 ], [ %197, %195 ]
  %201 = bitcast i8* %200 to i32*
  %202 = load i32, i32* %201, align 4
  %203 = and i32 %202, 255
  %204 = zext i32 %203 to i64
  %205 = bitcast %union.arg* %0 to i64*
  store i64 %204, i64* %205, align 16, !tbaa !19
  br label %352

206:                                              ; preds = %3
  %207 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %208 = load i32, i32* %207, align 8
  %209 = icmp ult i32 %208, 41
  br i1 %209, label %210, label %216

210:                                              ; preds = %206
  %211 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %212 = load i8*, i8** %211, align 8
  %213 = zext i32 %208 to i64
  %214 = getelementptr i8, i8* %212, i64 %213
  %215 = add nuw nsw i32 %208, 8
  store i32 %215, i32* %207, align 8
  br label %220

216:                                              ; preds = %206
  %217 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %218 = load i8*, i8** %217, align 8
  %219 = getelementptr i8, i8* %218, i64 8
  store i8* %219, i8** %217, align 8
  br label %220

220:                                              ; preds = %216, %210
  %221 = phi i8* [ %214, %210 ], [ %218, %216 ]
  %222 = bitcast i8* %221 to i64*
  %223 = load i64, i64* %222, align 8
  %224 = bitcast %union.arg* %0 to i64*
  store i64 %223, i64* %224, align 16, !tbaa !19
  br label %352

225:                                              ; preds = %3
  %226 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %227 = load i32, i32* %226, align 8
  %228 = icmp ult i32 %227, 41
  br i1 %228, label %229, label %235

229:                                              ; preds = %225
  %230 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %231 = load i8*, i8** %230, align 8
  %232 = zext i32 %227 to i64
  %233 = getelementptr i8, i8* %231, i64 %232
  %234 = add nuw nsw i32 %227, 8
  store i32 %234, i32* %226, align 8
  br label %239

235:                                              ; preds = %225
  %236 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %237 = load i8*, i8** %236, align 8
  %238 = getelementptr i8, i8* %237, i64 8
  store i8* %238, i8** %236, align 8
  br label %239

239:                                              ; preds = %235, %229
  %240 = phi i8* [ %233, %229 ], [ %237, %235 ]
  %241 = bitcast i8* %240 to i64*
  %242 = load i64, i64* %241, align 8
  %243 = bitcast %union.arg* %0 to i64*
  store i64 %242, i64* %243, align 16, !tbaa !19
  br label %352

244:                                              ; preds = %3
  %245 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %246 = load i32, i32* %245, align 8
  %247 = icmp ult i32 %246, 41
  br i1 %247, label %248, label %254

248:                                              ; preds = %244
  %249 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %250 = load i8*, i8** %249, align 8
  %251 = zext i32 %246 to i64
  %252 = getelementptr i8, i8* %250, i64 %251
  %253 = add nuw nsw i32 %246, 8
  store i32 %253, i32* %245, align 8
  br label %258

254:                                              ; preds = %244
  %255 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %256 = load i8*, i8** %255, align 8
  %257 = getelementptr i8, i8* %256, i64 8
  store i8* %257, i8** %255, align 8
  br label %258

258:                                              ; preds = %254, %248
  %259 = phi i8* [ %252, %248 ], [ %256, %254 ]
  %260 = bitcast i8* %259 to i64*
  %261 = load i64, i64* %260, align 8
  %262 = bitcast %union.arg* %0 to i64*
  store i64 %261, i64* %262, align 16, !tbaa !19
  br label %352

263:                                              ; preds = %3
  %264 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %265 = load i32, i32* %264, align 8
  %266 = icmp ult i32 %265, 41
  br i1 %266, label %267, label %273

267:                                              ; preds = %263
  %268 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %269 = load i8*, i8** %268, align 8
  %270 = zext i32 %265 to i64
  %271 = getelementptr i8, i8* %269, i64 %270
  %272 = add nuw nsw i32 %265, 8
  store i32 %272, i32* %264, align 8
  br label %277

273:                                              ; preds = %263
  %274 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %275 = load i8*, i8** %274, align 8
  %276 = getelementptr i8, i8* %275, i64 8
  store i8* %276, i8** %274, align 8
  br label %277

277:                                              ; preds = %273, %267
  %278 = phi i8* [ %271, %267 ], [ %275, %273 ]
  %279 = bitcast i8* %278 to i64*
  %280 = load i64, i64* %279, align 8
  %281 = bitcast %union.arg* %0 to i64*
  store i64 %280, i64* %281, align 16, !tbaa !19
  br label %352

282:                                              ; preds = %3
  %283 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %284 = load i32, i32* %283, align 8
  %285 = icmp ult i32 %284, 41
  br i1 %285, label %286, label %292

286:                                              ; preds = %282
  %287 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %288 = load i8*, i8** %287, align 8
  %289 = zext i32 %284 to i64
  %290 = getelementptr i8, i8* %288, i64 %289
  %291 = add nuw nsw i32 %284, 8
  store i32 %291, i32* %283, align 8
  br label %296

292:                                              ; preds = %282
  %293 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %294 = load i8*, i8** %293, align 8
  %295 = getelementptr i8, i8* %294, i64 8
  store i8* %295, i8** %293, align 8
  br label %296

296:                                              ; preds = %292, %286
  %297 = phi i8* [ %290, %286 ], [ %294, %292 ]
  %298 = bitcast i8* %297 to i64*
  %299 = load i64, i64* %298, align 8
  %300 = bitcast %union.arg* %0 to i64*
  store i64 %299, i64* %300, align 16, !tbaa !19
  br label %352

301:                                              ; preds = %3
  %302 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %303 = load i32, i32* %302, align 8
  %304 = icmp ult i32 %303, 41
  br i1 %304, label %305, label %311

305:                                              ; preds = %301
  %306 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %307 = load i8*, i8** %306, align 8
  %308 = zext i32 %303 to i64
  %309 = getelementptr i8, i8* %307, i64 %308
  %310 = add nuw nsw i32 %303, 8
  store i32 %310, i32* %302, align 8
  br label %315

311:                                              ; preds = %301
  %312 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %313 = load i8*, i8** %312, align 8
  %314 = getelementptr i8, i8* %313, i64 8
  store i8* %314, i8** %312, align 8
  br label %315

315:                                              ; preds = %311, %305
  %316 = phi i8* [ %309, %305 ], [ %313, %311 ]
  %317 = bitcast i8* %316 to i8**
  %318 = load i8*, i8** %317, align 8
  %319 = ptrtoint i8* %318 to i64
  %320 = bitcast %union.arg* %0 to i64*
  store i64 %319, i64* %320, align 16, !tbaa !19
  br label %352

321:                                              ; preds = %3
  %322 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 1
  %323 = load i32, i32* %322, align 4
  %324 = icmp ult i32 %323, 161
  br i1 %324, label %325, label %331

325:                                              ; preds = %321
  %326 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %327 = load i8*, i8** %326, align 8
  %328 = zext i32 %323 to i64
  %329 = getelementptr i8, i8* %327, i64 %328
  %330 = add nuw nsw i32 %323, 16
  store i32 %330, i32* %322, align 4
  br label %335

331:                                              ; preds = %321
  %332 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %333 = load i8*, i8** %332, align 8
  %334 = getelementptr i8, i8* %333, i64 8
  store i8* %334, i8** %332, align 8
  br label %335

335:                                              ; preds = %331, %325
  %336 = phi i8* [ %329, %325 ], [ %333, %331 ]
  %337 = bitcast i8* %336 to double*
  %338 = load double, double* %337, align 8
  %339 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %338, metadata !"fpexcept.ignore") #12
  %340 = getelementptr %union.arg, %union.arg* %0, i64 0, i32 0
  store x86_fp80 %339, x86_fp80* %340, align 16, !tbaa !19
  br label %352

341:                                              ; preds = %3
  %342 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %343 = load i8*, i8** %342, align 8
  %344 = ptrtoint i8* %343 to i64
  %345 = add i64 %344, 15
  %346 = and i64 %345, -16
  %347 = inttoptr i64 %346 to i8*
  %348 = inttoptr i64 %346 to x86_fp80*
  %349 = getelementptr i8, i8* %347, i64 16
  store i8* %349, i8** %342, align 8
  %350 = load x86_fp80, x86_fp80* %348, align 16
  %351 = getelementptr %union.arg, %union.arg* %0, i64 0, i32 0
  store x86_fp80 %350, x86_fp80* %351, align 16, !tbaa !19
  br label %352

352:                                              ; preds = %341, %3, %335, %315, %296, %277, %258, %239, %220, %199, %177, %156, %134, %115, %96, %77, %57, %37, %18
  ret void
}

; Function Attrs: optsize
declare i8* @strerror(i32 noundef) local_unnamed_addr #4

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #7

; Function Attrs: optsize
declare i64 @strnlen(i8* noundef, i64 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @wctomb(i8* noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @pad(%struct._IO_FILE* noundef %0, i8 noundef signext %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) unnamed_addr #0 {
  %6 = alloca [256 x i8], align 16
  %7 = getelementptr inbounds [256 x i8], [256 x i8]* %6, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %7) #11
  %8 = and i32 %4, 73728
  %9 = icmp eq i32 %8, 0
  %10 = icmp sgt i32 %2, %3
  %11 = and i1 %10, %9
  br i1 %11, label %12, label %41

12:                                               ; preds = %5
  %13 = sub nsw i32 %2, %3
  %14 = zext i8 %1 to i32
  %15 = sext i32 %13 to i64
  %16 = icmp ult i64 %15, 256
  %17 = select i1 %16, i64 %15, i64 256
  %18 = call i8* @memset(i8* noundef nonnull %7, i32 noundef %14, i64 noundef %17) #14
  %19 = icmp ugt i32 %13, 255
  br i1 %19, label %20, label %32

20:                                               ; preds = %12
  %21 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  br label %22

22:                                               ; preds = %20, %29
  %23 = phi i32 [ %13, %20 ], [ %30, %29 ]
  %24 = load i32, i32* %21, align 8, !tbaa !10
  %25 = and i32 %24, 32
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %29

27:                                               ; preds = %22
  %28 = call i64 @__fwritex(i8* noundef nonnull %7, i64 noundef 256, %struct._IO_FILE* noundef nonnull %0) #14
  br label %29

29:                                               ; preds = %22, %27
  %30 = add i32 %23, -256
  %31 = icmp ugt i32 %30, 255
  br i1 %31, label %22, label %32

32:                                               ; preds = %29, %12
  %33 = phi i32 [ %13, %12 ], [ %30, %29 ]
  %34 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  %35 = load i32, i32* %34, align 8, !tbaa !10
  %36 = and i32 %35, 32
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %41

38:                                               ; preds = %32
  %39 = zext i32 %33 to i64
  %40 = call i64 @__fwritex(i8* noundef nonnull %7, i64 noundef %39, %struct._IO_FILE* noundef nonnull %0) #14
  br label %41

41:                                               ; preds = %38, %32, %5
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %7) #11
  ret void
}

; Function Attrs: optsize
declare hidden i64 @__fwritex(i8* noundef, i64 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #4

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #8

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @__signbitl(x86_fp80 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @__fpclassifyl(x86_fp80 noundef) local_unnamed_addr #4

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80, x86_fp80, metadata, metadata) #8

; Function Attrs: optsize
declare x86_fp80 @frexpl(x86_fp80 noundef, i32* noundef) local_unnamed_addr #4

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32, metadata, metadata) #8

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #8

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80, x86_fp80, metadata, metadata) #8

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #8

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i32 @llvm.experimental.constrained.fptosi.i32.f80(x86_fp80, metadata) #8

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i32 @llvm.experimental.constrained.fptoui.i32.f80(x86_fp80, metadata) #8

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.uitofp.f80.i32(i32, metadata, metadata) #8

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80, x86_fp80, metadata, metadata) #8

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #9

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.mul.v4i32(<4 x i32>) #10

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { mustprogress nofree nosync nounwind willreturn }
attributes #4 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #6 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #9 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #10 = { nofree nosync nounwind readnone willreturn }
attributes #11 = { nounwind strictfp }
attributes #12 = { strictfp }
attributes #13 = { nobuiltin optsize strictfp "no-builtins" }
attributes #14 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #15 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #16 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 140}
!4 = !{!"_IO_FILE", !5, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !9, i64 96, !8, i64 104, !8, i64 112, !5, i64 120, !5, i64 124, !9, i64 128, !5, i64 136, !5, i64 140, !5, i64 144, !8, i64 152, !9, i64 160, !8, i64 168, !8, i64 176, !8, i64 184, !9, i64 192, !9, i64 200, !8, i64 208, !8, i64 216, !8, i64 224}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{!4, !5, i64 0}
!11 = !{!4, !5, i64 136}
!12 = !{!4, !9, i64 96}
!13 = !{!4, !8, i64 88}
!14 = !{!4, !8, i64 56}
!15 = !{!8, !8, i64 0}
!16 = !{!4, !8, i64 32}
!17 = !{!4, !8, i64 72}
!18 = !{!4, !8, i64 40}
!19 = !{!6, !6, i64 0}
!20 = !{!5, !5, i64 0}
!21 = !{i64 0, i64 8, !22, i64 0, i64 16, !23, i64 0, i64 8, !15}
!22 = !{!9, !9, i64 0}
!23 = !{!24, !24, i64 0}
!24 = !{!"long double", !6, i64 0}
!25 = !{!26, !26, i64 0}
!26 = !{!"long long", !6, i64 0}
!27 = !{!28, !28, i64 0}
!28 = !{!"short", !6, i64 0}
!29 = distinct !{!29, !30}
!30 = !{!"llvm.loop.isvectorized", i32 1}
