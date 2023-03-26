; ModuleID = 'src/malloc/mallocng/malloc.c'
source_filename = "src/malloc/mallocng/malloc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.malloc_context = type { i64, i32, i32, %struct.meta*, %struct.meta*, i64, i64, i64, %struct.meta_area*, %struct.meta_area*, i8*, [48 x %struct.meta*], [48 x i64], [32 x i8], [32 x i8], i8, i64 }
%struct.meta = type { %struct.meta*, %struct.meta*, %struct.group*, i32, i32, i64 }
%struct.group = type { %struct.meta*, i8, [7 x i8], [0 x i8] }
%struct.meta_area = type { i64, %struct.meta_area*, i32, [0 x %struct.meta] }
%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque

@__malloc_size_classes = hidden local_unnamed_addr constant [48 x i16] [i16 1, i16 2, i16 3, i16 4, i16 5, i16 6, i16 7, i16 8, i16 9, i16 10, i16 12, i16 15, i16 18, i16 20, i16 25, i16 31, i16 36, i16 42, i16 50, i16 63, i16 72, i16 84, i16 102, i16 127, i16 146, i16 170, i16 204, i16 255, i16 292, i16 340, i16 409, i16 511, i16 584, i16 682, i16 818, i16 1023, i16 1169, i16 1364, i16 1637, i16 2047, i16 2340, i16 2730, i16 3276, i16 4095, i16 4680, i16 5460, i16 6552, i16 8191], align 16
@__malloc_context = hidden local_unnamed_addr global %struct.malloc_context zeroinitializer, align 8
@__malloc_lock = hidden global [1 x i32] zeroinitializer, align 4
@__libc = external hidden global %struct.__libc, align 8
@a_ctz_32.debruijn32 = internal unnamed_addr constant [32 x i8] c"\00\01\17\02\1D\18\13\03\1E\1B\19\0B\14\08\04\0D\1F\16\1C\12\1A\0A\07\0C\15\11\09\06\10\05\0F\0E", align 16
@small_cnt_tab = internal unnamed_addr constant [9 x [3 x i8]] [[3 x i8] c"\1E\1E\1E", [3 x i8] c"\1F\0F\0F", [3 x i8] c"\14\0A\0A", [3 x i8] c"\1F\0F\07", [3 x i8] c"\19\0C\06", [3 x i8] c"\15\0A\05", [3 x i8] c"\12\08\04", [3 x i8] c"\1F\0F\07", [3 x i8] c"\1C\0E\06"], align 16
@med_cnt_tab = internal unnamed_addr constant [4 x i8] c"\1C\18\14 ", align 1

; Function Attrs: nounwind optsize strictfp
define void @__malloc_atfork(i32 noundef %0) local_unnamed_addr #0 {
  %2 = icmp slt i32 %0, 0
  br i1 %2, label %3, label %7

3:                                                ; preds = %1
  %4 = load volatile i8, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 3), align 1, !tbaa !3
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %11, label %6

6:                                                ; preds = %3
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @__malloc_lock, i64 0, i64 0)) #6
  br label %11

7:                                                ; preds = %1
  %8 = icmp eq i32 %0, 0
  br i1 %8, label %10, label %9

9:                                                ; preds = %7
  store i32 0, i32* getelementptr inbounds ([1 x i32], [1 x i32]* @__malloc_lock, i64 0, i64 0), align 4, !tbaa !11
  br label %11

10:                                               ; preds = %7
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @__malloc_lock, i64 0, i64 0)) #6
  br label %11

11:                                               ; preds = %3, %6, %9, %10
  ret void
}

; Function Attrs: nounwind optsize strictfp
define hidden %struct.meta* @__malloc_alloc_meta() local_unnamed_addr #0 {
  %1 = alloca i64, align 8
  %2 = load i32, i32* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 1), align 8, !tbaa !12
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %27

4:                                                ; preds = %0
  %5 = bitcast i64* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %5) #7
  %6 = ptrtoint i64* %1 to i64
  %7 = mul i64 %6, 1103515245
  store i64 %7, i64* %1, align 8, !tbaa !14
  %8 = load i64*, i64** getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 5), align 8, !tbaa !15
  br label %9

9:                                                ; preds = %22, %4
  %10 = phi i64* [ %8, %4 ], [ %23, %22 ]
  %11 = phi i64 [ 0, %4 ], [ %24, %22 ]
  %12 = getelementptr inbounds i64, i64* %10, i64 %11
  %13 = load i64, i64* %12, align 8, !tbaa !14
  switch i64 %13, label %22 [
    i64 0, label %25
    i64 25, label %14
  ]

14:                                               ; preds = %9
  %15 = or i64 %11, 1
  %16 = getelementptr inbounds i64, i64* %10, i64 %15
  %17 = load i64, i64* %16, align 8, !tbaa !14
  %18 = inttoptr i64 %17 to i8*
  %19 = getelementptr inbounds i8, i8* %18, i64 8
  %20 = call i8* @memcpy(i8* noundef nonnull %5, i8* noundef nonnull %19, i64 noundef 8) #6
  %21 = load i64*, i64** getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 5), align 8, !tbaa !15
  br label %22

22:                                               ; preds = %14, %9
  %23 = phi i64* [ %10, %9 ], [ %21, %14 ]
  %24 = add i64 %11, 2
  br label %9

25:                                               ; preds = %9
  %26 = load i64, i64* %1, align 8, !tbaa !14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %5) #7
  store i64 %26, i64* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 0), align 8, !tbaa !16
  store i32 1, i32* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 1), align 8, !tbaa !12
  br label %27

27:                                               ; preds = %25, %0
  %28 = load %struct.meta*, %struct.meta** getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 3), align 8, !tbaa !17
  %29 = icmp eq %struct.meta* %28, null
  br i1 %29, label %44, label %30

30:                                               ; preds = %27
  %31 = getelementptr inbounds %struct.meta, %struct.meta* %28, i64 0, i32 1
  %32 = load %struct.meta*, %struct.meta** %31, align 8, !tbaa !18
  %33 = icmp eq %struct.meta* %32, %28
  br i1 %33, label %42, label %34

34:                                               ; preds = %30
  %35 = getelementptr inbounds %struct.meta, %struct.meta* %28, i64 0, i32 0
  %36 = load %struct.meta*, %struct.meta** %35, align 8, !tbaa !20
  %37 = getelementptr inbounds %struct.meta, %struct.meta* %36, i64 0, i32 1
  store %struct.meta* %32, %struct.meta** %37, align 8, !tbaa !18
  %38 = load %struct.meta*, %struct.meta** %31, align 8, !tbaa !18
  %39 = getelementptr inbounds %struct.meta, %struct.meta* %38, i64 0, i32 0
  store %struct.meta* %36, %struct.meta** %39, align 8, !tbaa !20
  %40 = load %struct.meta*, %struct.meta** getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 3), align 8, !tbaa !17
  %41 = icmp eq %struct.meta* %40, %28
  br i1 %41, label %42, label %129

42:                                               ; preds = %34, %30
  %43 = phi %struct.meta* [ %38, %34 ], [ null, %30 ]
  store %struct.meta* %43, %struct.meta** getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 3), align 8, !tbaa !17
  br label %129

44:                                               ; preds = %27
  %45 = load i64, i64* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 5), align 8, !tbaa !21
  %46 = icmp eq i64 %45, 0
  br i1 %46, label %50, label %47

47:                                               ; preds = %44
  %48 = load %struct.meta*, %struct.meta** getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 4), align 8, !tbaa !22
  %49 = add i64 %45, -1
  br label %124

50:                                               ; preds = %44
  %51 = load i64, i64* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 6), align 8, !tbaa !23
  %52 = icmp eq i64 %51, 0
  %53 = load i64, i64* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 16), align 8
  %54 = icmp ne i64 %53, -1
  %55 = select i1 %52, i1 %54, i1 false
  br i1 %55, label %56, label %80

56:                                               ; preds = %50
  %57 = add i64 %53, 4096
  %58 = icmp eq i64 %53, 0
  br i1 %58, label %59, label %67

59:                                               ; preds = %56
  %60 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 12, i64 0) #7, !srcloc !24
  %61 = sub i64 0, %60
  %62 = and i64 %61, 4095
  %63 = add i64 %62, %60
  store i64 %63, i64* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 16), align 8, !tbaa !25
  %64 = add i64 %63, 8192
  %65 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 12, i64 %64) #7, !srcloc !24
  %66 = icmp eq i64 %65, %64
  br i1 %66, label %72, label %70

67:                                               ; preds = %56
  %68 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 12, i64 %57) #7, !srcloc !24
  %69 = icmp eq i64 %68, %57
  br i1 %69, label %76, label %70

70:                                               ; preds = %67, %59
  store i64 -1, i64* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 16), align 8, !tbaa !25
  %71 = load i64, i64* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 6), align 8, !tbaa !23
  br label %80

72:                                               ; preds = %59
  %73 = load i64, i64* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 16), align 8, !tbaa !25
  %74 = inttoptr i64 %73 to i8*
  %75 = call i8* @__mmap(i8* noundef %74, i64 noundef 4096, i32 noundef 0, i32 noundef 50, i32 noundef -1, i64 noundef 0) #6
  br label %76

76:                                               ; preds = %67, %72
  %77 = phi i64 [ %64, %72 ], [ %57, %67 ]
  store i64 %77, i64* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 16), align 8, !tbaa !25
  %78 = add i64 %77, -4096
  %79 = inttoptr i64 %78 to i8*
  store i64 1, i64* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 6), align 8, !tbaa !23
  br label %108

80:                                               ; preds = %70, %50
  %81 = phi i64 [ %71, %70 ], [ %51, %50 ]
  %82 = icmp eq i64 %81, 0
  br i1 %82, label %85, label %83

83:                                               ; preds = %80
  %84 = load i8*, i8** getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 10), align 8, !tbaa !26
  br label %96

85:                                               ; preds = %80
  %86 = load i64, i64* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 7), align 8, !tbaa !27
  %87 = shl i64 2, %86
  %88 = shl i64 %87, 12
  %89 = call i8* @__mmap(i8* noundef null, i64 noundef %88, i32 noundef 0, i32 noundef 34, i32 noundef -1, i64 noundef 0) #6
  %90 = icmp eq i8* %89, inttoptr (i64 -1 to i8*)
  br i1 %90, label %133, label %91

91:                                               ; preds = %85
  %92 = getelementptr inbounds i8, i8* %89, i64 4096
  store i8* %92, i8** getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 10), align 8, !tbaa !26
  %93 = add i64 %87, -1
  store i64 %93, i64* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 6), align 8, !tbaa !23
  %94 = load i64, i64* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 7), align 8, !tbaa !27
  %95 = add i64 %94, 1
  store i64 %95, i64* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 7), align 8, !tbaa !27
  br label %96

96:                                               ; preds = %83, %91
  %97 = phi i8* [ %92, %91 ], [ %84, %83 ]
  %98 = ptrtoint i8* %97 to i64
  %99 = and i64 %98, 4095
  %100 = icmp eq i64 %99, 0
  br i1 %100, label %101, label %108

101:                                              ; preds = %96
  %102 = call i32 @mprotect(i8* noundef %97, i64 noundef 4096, i32 noundef 3) #6
  %103 = icmp eq i32 %102, 0
  br i1 %103, label %108, label %104

104:                                              ; preds = %101
  %105 = tail call i32* @___errno_location() #8
  %106 = load i32, i32* %105, align 4, !tbaa !11
  %107 = icmp eq i32 %106, 38
  br i1 %107, label %108, label %133

108:                                              ; preds = %76, %101, %104, %96
  %109 = phi i8* [ %79, %76 ], [ %97, %101 ], [ %97, %104 ], [ %97, %96 ]
  %110 = load i64, i64* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 6), align 8, !tbaa !23
  %111 = add i64 %110, -1
  store i64 %111, i64* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 6), align 8, !tbaa !23
  %112 = getelementptr inbounds i8, i8* %109, i64 4096
  store i8* %112, i8** getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 10), align 8, !tbaa !26
  %113 = load %struct.meta_area*, %struct.meta_area** getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 9), align 8, !tbaa !28
  %114 = icmp eq %struct.meta_area* %113, null
  %115 = getelementptr inbounds %struct.meta_area, %struct.meta_area* %113, i64 0, i32 1
  %116 = bitcast %struct.meta_area** %115 to i8**
  %117 = select i1 %114, i8** bitcast (%struct.meta_area** getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 8) to i8**), i8** %116
  store i8* %109, i8** %117, align 8, !tbaa !17
  store i8* %109, i8** bitcast (%struct.meta_area** getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 9) to i8**), align 8, !tbaa !28
  %118 = load i64, i64* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 0), align 8, !tbaa !16
  %119 = bitcast i8* %109 to i64*
  store i64 %118, i64* %119, align 8, !tbaa !14
  %120 = getelementptr inbounds i8, i8* %109, i64 16
  %121 = bitcast i8* %120 to i32*
  store i32 101, i32* %121, align 8, !tbaa !11
  %122 = getelementptr inbounds i8, i8* %109, i64 24
  %123 = bitcast i8* %122 to %struct.meta*
  br label %124

124:                                              ; preds = %47, %108
  %125 = phi %struct.meta* [ %123, %108 ], [ %48, %47 ]
  %126 = phi i64 [ 100, %108 ], [ %49, %47 ]
  store i64 %126, i64* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 5), align 8, !tbaa !21
  %127 = getelementptr inbounds %struct.meta, %struct.meta* %125, i64 1
  store %struct.meta* %127, %struct.meta** getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 4), align 8, !tbaa !22
  %128 = getelementptr inbounds %struct.meta, %struct.meta* %125, i64 0, i32 1
  br label %129

129:                                              ; preds = %42, %34, %124
  %130 = phi %struct.meta** [ %128, %124 ], [ %31, %34 ], [ %31, %42 ]
  %131 = phi %struct.meta* [ %125, %124 ], [ %28, %34 ], [ %28, %42 ]
  store %struct.meta* null, %struct.meta** %130, align 8, !tbaa !18
  %132 = getelementptr inbounds %struct.meta, %struct.meta* %131, i64 0, i32 0
  store %struct.meta* null, %struct.meta** %132, align 8, !tbaa !20
  br label %133

133:                                              ; preds = %129, %104, %85
  %134 = phi %struct.meta* [ null, %85 ], [ null, %104 ], [ %131, %129 ]
  ret %struct.meta* %134
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i8* @__mmap(i8* noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @mprotect(i8* noundef, i64 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: nounwind optsize strictfp
define hidden i8* @__libc_malloc_impl(i64 noundef %0) local_unnamed_addr #0 {
  %2 = icmp ugt i64 %0, 9223372036854771710
  br i1 %2, label %3, label %5

3:                                                ; preds = %1
  %4 = tail call i32* @___errno_location() #8
  store i32 12, i32* %4, align 4, !tbaa !11
  br label %275

5:                                                ; preds = %1
  %6 = icmp ugt i64 %0, 131051
  br i1 %6, label %7, label %39

7:                                                ; preds = %5
  %8 = add nuw nsw i64 %0, 20
  %9 = tail call i8* @__mmap(i8* noundef null, i64 noundef %8, i32 noundef 3, i32 noundef 34, i32 noundef -1, i64 noundef 0) #6
  %10 = icmp eq i8* %9, inttoptr (i64 -1 to i8*)
  br i1 %10, label %275, label %11

11:                                               ; preds = %7
  %12 = load volatile i8, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 3), align 1, !tbaa !3
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %15, label %14

14:                                               ; preds = %11
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @__malloc_lock, i64 0, i64 0)) #6
  br label %15

15:                                               ; preds = %11, %14
  %16 = load i8, i8* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 15), align 8, !tbaa !29
  %17 = icmp eq i8 %16, -1
  br i1 %17, label %18, label %19

18:                                               ; preds = %15
  store <16 x i8> zeroinitializer, <16 x i8>* bitcast (i8* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 13, i64 0) to <16 x i8>*), align 8, !tbaa !30
  store <16 x i8> zeroinitializer, <16 x i8>* bitcast (i8* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 13, i64 16) to <16 x i8>*), align 8, !tbaa !30
  br label %21

19:                                               ; preds = %15
  %20 = add nuw i8 %16, 1
  br label %21

21:                                               ; preds = %18, %19
  %22 = phi i8 [ %20, %19 ], [ 1, %18 ]
  store i8 %22, i8* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 15), align 8, !tbaa !29
  %23 = tail call %struct.meta* @__malloc_alloc_meta() #9
  %24 = icmp eq %struct.meta* %23, null
  br i1 %24, label %25, label %27

25:                                               ; preds = %21
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @__malloc_lock, i64 0, i64 0)) #6
  %26 = tail call i32 @munmap(i8* noundef %9, i64 noundef %8) #6
  br label %275

27:                                               ; preds = %21
  %28 = getelementptr inbounds %struct.meta, %struct.meta* %23, i64 0, i32 2
  %29 = bitcast %struct.group** %28 to i8**
  store i8* %9, i8** %29, align 8, !tbaa !31
  %30 = bitcast i8* %9 to %struct.meta**
  store %struct.meta* %23, %struct.meta** %30, align 8, !tbaa !17
  %31 = getelementptr inbounds %struct.meta, %struct.meta* %23, i64 0, i32 5
  %32 = add i64 %0, 4115
  %33 = and i64 %32, -4096
  %34 = or i64 %33, 4064
  store i64 %34, i64* %31, align 8
  %35 = getelementptr inbounds %struct.meta, %struct.meta* %23, i64 0, i32 4
  store volatile i32 0, i32* %35, align 4, !tbaa !32
  %36 = getelementptr inbounds %struct.meta, %struct.meta* %23, i64 0, i32 3
  store volatile i32 0, i32* %36, align 8, !tbaa !33
  %37 = load i32, i32* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 2), align 4, !tbaa !34
  %38 = add i32 %37, 1
  store i32 %38, i32* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 2), align 4, !tbaa !34
  br label %161

39:                                               ; preds = %5
  %40 = add nuw nsw i64 %0, 3
  %41 = lshr i64 %40, 4
  %42 = icmp ult i64 %0, 157
  %43 = trunc i64 %41 to i32
  br i1 %42, label %82, label %44

44:                                               ; preds = %39
  %45 = add nuw nsw i32 %43, 1
  %46 = lshr i32 %45, 1
  %47 = lshr i32 %45, 2
  %48 = or i32 %46, %47
  %49 = lshr i32 %48, 2
  %50 = or i32 %49, %48
  %51 = lshr i32 %50, 4
  %52 = or i32 %51, %50
  %53 = lshr i32 %52, 8
  %54 = or i32 %53, %52
  %55 = lshr i32 %54, 16
  %56 = or i32 %55, %54
  %57 = add nuw i32 %56, 1
  %58 = xor i32 %56, -1
  %59 = and i32 %57, %58
  %60 = mul i32 %59, 124511785
  %61 = lshr i32 %60, 27
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds [32 x i8], [32 x i8]* @a_ctz_32.debruijn32, i64 0, i64 %62
  %64 = load i8, i8* %63, align 1, !tbaa !30
  %65 = sext i8 %64 to i32
  %66 = shl nsw i32 %65, 2
  %67 = add nsw i32 %66, -3
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [48 x i16], [48 x i16]* @__malloc_size_classes, i64 0, i64 %68
  %70 = load i16, i16* %69, align 2, !tbaa !35
  %71 = zext i16 %70 to i64
  %72 = icmp ult i64 %41, %71
  %73 = select i1 %72, i32 -4, i32 -2
  %74 = add nsw i32 %73, %66
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [48 x i16], [48 x i16]* @__malloc_size_classes, i64 0, i64 %75
  %77 = load i16, i16* %76, align 4, !tbaa !35
  %78 = zext i16 %77 to i64
  %79 = icmp uge i64 %41, %78
  %80 = zext i1 %79 to i32
  %81 = or i32 %74, %80
  br label %82

82:                                               ; preds = %39, %44
  %83 = phi i32 [ %81, %44 ], [ %43, %39 ]
  %84 = load volatile i8, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 3), align 1, !tbaa !3
  %85 = icmp eq i8 %84, 0
  br i1 %85, label %87, label %86

86:                                               ; preds = %82
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @__malloc_lock, i64 0, i64 0)) #6
  br label %87

87:                                               ; preds = %82, %86
  %88 = sext i32 %83 to i64
  %89 = getelementptr inbounds %struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 11, i64 %88
  %90 = load %struct.meta*, %struct.meta** %89, align 8, !tbaa !17
  %91 = icmp eq %struct.meta* %90, null
  %92 = icmp sgt i32 %83, 3
  %93 = select i1 %91, i1 %92, i1 false
  %94 = icmp slt i32 %83, 32
  %95 = select i1 %93, i1 %94, i1 false
  %96 = icmp ne i32 %83, 6
  %97 = select i1 %95, i1 %96, i1 false
  br i1 %97, label %98, label %130

98:                                               ; preds = %87
  %99 = and i32 %83, 1
  %100 = icmp eq i32 %99, 0
  br i1 %100, label %101, label %137

101:                                              ; preds = %98
  %102 = getelementptr inbounds %struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 12, i64 %88
  %103 = load i64, i64* %102, align 8, !tbaa !14
  %104 = icmp eq i64 %103, 0
  br i1 %104, label %105, label %137

105:                                              ; preds = %101
  %106 = or i32 %83, 1
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds %struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 12, i64 %107
  %109 = load i64, i64* %108, align 8, !tbaa !14
  %110 = getelementptr inbounds %struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 11, i64 %107
  %111 = load %struct.meta*, %struct.meta** %110, align 8, !tbaa !17
  %112 = icmp eq %struct.meta* %111, null
  br i1 %112, label %121, label %113

113:                                              ; preds = %105
  %114 = getelementptr inbounds %struct.meta, %struct.meta* %111, i64 0, i32 3
  %115 = load volatile i32, i32* %114, align 8, !tbaa !33
  %116 = icmp eq i32 %115, 0
  br i1 %116, label %117, label %123

117:                                              ; preds = %113
  %118 = getelementptr inbounds %struct.meta, %struct.meta* %111, i64 0, i32 4
  %119 = load volatile i32, i32* %118, align 4, !tbaa !32
  %120 = icmp eq i32 %119, 0
  br i1 %120, label %121, label %123

121:                                              ; preds = %117, %105
  %122 = add i64 %109, 3
  br label %123

123:                                              ; preds = %121, %117, %113
  %124 = phi i64 [ %109, %113 ], [ %109, %117 ], [ %122, %121 ]
  %125 = icmp ult i64 %124, 13
  %126 = select i1 %125, i32 %106, i32 %83
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds %struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 11, i64 %127
  %129 = load %struct.meta*, %struct.meta** %128, align 8, !tbaa !17
  br label %130

130:                                              ; preds = %87, %123
  %131 = phi i32 [ %126, %123 ], [ %83, %87 ]
  %132 = phi %struct.meta* [ %129, %123 ], [ %90, %87 ]
  %133 = icmp eq %struct.meta* %132, null
  br i1 %133, label %137, label %134

134:                                              ; preds = %130
  %135 = getelementptr inbounds %struct.meta, %struct.meta* %132, i64 0, i32 3
  %136 = load volatile i32, i32* %135, align 8, !tbaa !33
  br label %137

137:                                              ; preds = %101, %98, %130, %134
  %138 = phi %struct.meta* [ %132, %134 ], [ null, %130 ], [ null, %98 ], [ null, %101 ]
  %139 = phi i32 [ %131, %134 ], [ %131, %130 ], [ %83, %98 ], [ %83, %101 ]
  %140 = phi i32 [ %136, %134 ], [ 0, %130 ], [ 0, %98 ], [ 0, %101 ]
  %141 = sub i32 0, %140
  %142 = and i32 %140, %141
  %143 = icmp eq i32 %142, 0
  br i1 %143, label %153, label %144

144:                                              ; preds = %137
  %145 = sub i32 %140, %142
  %146 = getelementptr inbounds %struct.meta, %struct.meta* %138, i64 0, i32 3
  store volatile i32 %145, i32* %146, align 8, !tbaa !33
  %147 = mul i32 %142, 124511785
  %148 = lshr i32 %147, 27
  %149 = zext i32 %148 to i64
  %150 = getelementptr inbounds [32 x i8], [32 x i8]* @a_ctz_32.debruijn32, i64 0, i64 %149
  %151 = load i8, i8* %150, align 1, !tbaa !30
  %152 = sext i8 %151 to i32
  br label %161

153:                                              ; preds = %137
  %154 = tail call fastcc i32 @alloc_slot(i32 noundef %139, i64 noundef %0) #9
  %155 = icmp slt i32 %154, 0
  br i1 %155, label %156, label %157

156:                                              ; preds = %153
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @__malloc_lock, i64 0, i64 0)) #6
  br label %275

157:                                              ; preds = %153
  %158 = sext i32 %139 to i64
  %159 = getelementptr inbounds %struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 11, i64 %158
  %160 = load %struct.meta*, %struct.meta** %159, align 8, !tbaa !17
  br label %161

161:                                              ; preds = %27, %157, %144
  %162 = phi i32 [ 0, %27 ], [ %152, %144 ], [ %154, %157 ]
  %163 = phi %struct.meta* [ %23, %27 ], [ %138, %144 ], [ %160, %157 ]
  %164 = load i32, i32* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 2), align 4, !tbaa !34
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @__malloc_lock, i64 0, i64 0)) #6
  %165 = getelementptr inbounds %struct.meta, %struct.meta* %163, i64 0, i32 5
  %166 = load i64, i64* %165, align 8
  %167 = and i64 %166, 31
  %168 = icmp ne i64 %167, 0
  %169 = icmp ult i64 %166, 4096
  %170 = or i1 %169, %168
  br i1 %170, label %174, label %171

171:                                              ; preds = %161
  %172 = and i64 %166, -4096
  %173 = add i64 %172, -16
  br label %181

174:                                              ; preds = %161
  %175 = lshr i64 %166, 6
  %176 = and i64 %175, 63
  %177 = getelementptr inbounds [48 x i16], [48 x i16]* @__malloc_size_classes, i64 0, i64 %176
  %178 = load i16, i16* %177, align 2, !tbaa !35
  %179 = zext i16 %178 to i64
  %180 = shl nuw nsw i64 %179, 4
  br label %181

181:                                              ; preds = %174, %171
  %182 = phi i64 [ %180, %174 ], [ %173, %171 ]
  %183 = sub i64 -4, %0
  %184 = add i64 %182, %183
  %185 = lshr i64 %184, 4
  %186 = getelementptr inbounds %struct.meta, %struct.meta* %163, i64 0, i32 2
  %187 = load %struct.group*, %struct.group** %186, align 8, !tbaa !31
  %188 = sext i32 %162 to i64
  %189 = mul i64 %182, %188
  %190 = getelementptr inbounds %struct.group, %struct.group* %187, i64 0, i32 3, i64 %189
  %191 = getelementptr inbounds i8, i8* %190, i64 -3
  %192 = load i8, i8* %191, align 1, !tbaa !30
  %193 = icmp eq i8 %192, 0
  br i1 %193, label %200, label %194

194:                                              ; preds = %181
  %195 = getelementptr inbounds i8, i8* %190, i64 -2
  %196 = bitcast i8* %195 to i16*
  %197 = load i16, i16* %196, align 2, !tbaa !35
  %198 = zext i16 %197 to i32
  %199 = add nuw nsw i32 %198, 1
  br label %200

200:                                              ; preds = %194, %181
  %201 = phi i32 [ %199, %194 ], [ %164, %181 ]
  %202 = and i32 %201, 255
  %203 = getelementptr inbounds i8, i8* %190, i64 -4
  %204 = load i8, i8* %203, align 1, !tbaa !30
  %205 = icmp eq i8 %204, 0
  br i1 %205, label %207, label %206

206:                                              ; preds = %200
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !37
  br label %207

207:                                              ; preds = %206, %200
  %208 = zext i32 %202 to i64
  %209 = icmp ult i64 %185, %208
  br i1 %209, label %210, label %228

210:                                              ; preds = %207
  %211 = lshr i64 %184, 5
  %212 = or i64 %185, %211
  %213 = lshr i64 %212, 2
  %214 = or i64 %213, %212
  %215 = lshr i64 %214, 4
  %216 = or i64 %215, %214
  %217 = trunc i64 %216 to i32
  %218 = and i32 %202, %217
  %219 = zext i32 %218 to i64
  %220 = icmp ult i64 %185, %219
  %221 = trunc i64 %185 to i32
  %222 = xor i32 %221, -1
  %223 = select i1 %220, i32 %222, i32 0
  %224 = add i32 %223, %218
  %225 = sext i32 %224 to i64
  %226 = icmp ult i64 %185, %225
  br i1 %226, label %227, label %228

227:                                              ; preds = %210
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !37
  br label %228

228:                                              ; preds = %227, %210, %207
  %229 = phi i32 [ %202, %207 ], [ %224, %227 ], [ %224, %210 ]
  %230 = icmp eq i32 %229, 0
  br i1 %230, label %239, label %231

231:                                              ; preds = %228
  %232 = trunc i32 %229 to i16
  %233 = getelementptr inbounds i8, i8* %190, i64 -2
  %234 = bitcast i8* %233 to i16*
  store i16 %232, i16* %234, align 2, !tbaa !35
  store i8 -32, i8* %191, align 1, !tbaa !30
  %235 = shl nsw i32 %229, 4
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds i8, i8* %190, i64 %236
  %238 = getelementptr inbounds i8, i8* %237, i64 -4
  store i8 0, i8* %238, align 1, !tbaa !30
  br label %239

239:                                              ; preds = %231, %228
  %240 = phi i8* [ %237, %231 ], [ %190, %228 ]
  %241 = getelementptr inbounds i8, i8* %190, i64 %182
  %242 = getelementptr inbounds i8, i8* %241, i64 -4
  %243 = load %struct.group*, %struct.group** %186, align 8, !tbaa !31
  %244 = getelementptr inbounds %struct.group, %struct.group* %243, i64 0, i32 3, i64 0
  %245 = ptrtoint i8* %240 to i64
  %246 = ptrtoint i8* %244 to i64
  %247 = sub i64 %245, %246
  %248 = lshr i64 %247, 4
  %249 = trunc i64 %248 to i16
  %250 = getelementptr inbounds i8, i8* %240, i64 -2
  %251 = bitcast i8* %250 to i16*
  store i16 %249, i16* %251, align 2, !tbaa !35
  %252 = trunc i32 %162 to i8
  %253 = getelementptr inbounds i8, i8* %240, i64 -3
  store i8 %252, i8* %253, align 1, !tbaa !30
  %254 = ptrtoint i8* %242 to i64
  %255 = add i64 %245, %0
  %256 = sub i64 %254, %255
  %257 = trunc i64 %256 to i32
  %258 = icmp eq i32 %257, 0
  br i1 %258, label %268, label %259

259:                                              ; preds = %239
  %260 = mul i64 %256, -4294967296
  %261 = ashr exact i64 %260, 32
  %262 = getelementptr inbounds i8, i8* %242, i64 %261
  store i8 0, i8* %262, align 1, !tbaa !30
  %263 = icmp sgt i32 %257, 4
  br i1 %263, label %264, label %268

264:                                              ; preds = %259
  %265 = getelementptr inbounds i8, i8* %242, i64 -4
  %266 = bitcast i8* %265 to i32*
  store i32 %257, i32* %266, align 4, !tbaa !11
  %267 = getelementptr inbounds i8, i8* %242, i64 -5
  store i8 0, i8* %267, align 1, !tbaa !30
  br label %268

268:                                              ; preds = %239, %259, %264
  %269 = phi i32 [ 5, %264 ], [ %257, %259 ], [ 0, %239 ]
  %270 = load i8, i8* %253, align 1, !tbaa !30
  %271 = and i8 %270, 31
  %272 = trunc i32 %269 to i8
  %273 = shl i8 %272, 5
  %274 = or i8 %273, %271
  store i8 %274, i8* %253, align 1, !tbaa !30
  br label %275

275:                                              ; preds = %7, %25, %3, %156, %268
  %276 = phi i8* [ null, %3 ], [ %240, %268 ], [ null, %156 ], [ null, %25 ], [ null, %7 ]
  ret i8* %276
}

; Function Attrs: optsize
declare i32 @munmap(i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @alloc_slot(i32 noundef %0, i64 noundef %1) unnamed_addr #0 {
  %3 = alloca %struct.meta, align 8
  %4 = alloca %struct.meta, align 8
  %5 = sext i32 %0 to i64
  %6 = getelementptr inbounds %struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 11, i64 %5
  %7 = load %struct.meta*, %struct.meta** %6, align 8, !tbaa !17
  %8 = icmp eq %struct.meta* %7, null
  br i1 %8, label %160, label %9

9:                                                ; preds = %2
  %10 = getelementptr inbounds %struct.meta, %struct.meta* %7, i64 0, i32 3
  %11 = load volatile i32, i32* %10, align 8, !tbaa !33
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %145

13:                                               ; preds = %9
  %14 = getelementptr inbounds %struct.meta, %struct.meta* %7, i64 0, i32 4
  %15 = load volatile i32, i32* %14, align 4, !tbaa !32
  %16 = icmp eq i32 %15, 0
  %17 = getelementptr inbounds %struct.meta, %struct.meta* %7, i64 0, i32 1
  %18 = load %struct.meta*, %struct.meta** %17, align 8, !tbaa !18
  br i1 %16, label %19, label %35

19:                                               ; preds = %13
  %20 = icmp eq %struct.meta* %18, %7
  br i1 %20, label %29, label %21

21:                                               ; preds = %19
  %22 = getelementptr inbounds %struct.meta, %struct.meta* %7, i64 0, i32 0
  %23 = load %struct.meta*, %struct.meta** %22, align 8, !tbaa !20
  %24 = getelementptr inbounds %struct.meta, %struct.meta* %23, i64 0, i32 1
  store %struct.meta* %18, %struct.meta** %24, align 8, !tbaa !18
  %25 = load %struct.meta*, %struct.meta** %17, align 8, !tbaa !18
  %26 = getelementptr inbounds %struct.meta, %struct.meta* %25, i64 0, i32 0
  store %struct.meta* %23, %struct.meta** %26, align 8, !tbaa !20
  %27 = load %struct.meta*, %struct.meta** %6, align 8, !tbaa !17
  %28 = icmp eq %struct.meta* %27, %7
  br i1 %28, label %29, label %31

29:                                               ; preds = %21, %19
  %30 = phi %struct.meta* [ %25, %21 ], [ null, %19 ]
  store %struct.meta* %30, %struct.meta** %6, align 8, !tbaa !17
  br label %31

31:                                               ; preds = %29, %21
  %32 = bitcast %struct.meta* %7 to <2 x %struct.meta*>*
  store <2 x %struct.meta*> zeroinitializer, <2 x %struct.meta*>* %32, align 8, !tbaa !17
  %33 = load %struct.meta*, %struct.meta** %6, align 8, !tbaa !17
  %34 = icmp eq %struct.meta* %33, null
  br i1 %34, label %160, label %36

35:                                               ; preds = %13
  store %struct.meta* %18, %struct.meta** %6, align 8, !tbaa !17
  br label %36

36:                                               ; preds = %35, %31
  %37 = phi %struct.meta* [ %18, %35 ], [ %33, %31 ]
  %38 = getelementptr inbounds %struct.meta, %struct.meta* %37, i64 0, i32 4
  %39 = load volatile i32, i32* %38, align 4, !tbaa !32
  %40 = getelementptr inbounds %struct.meta, %struct.meta* %37, i64 0, i32 5
  %41 = load i64, i64* %40, align 8
  %42 = trunc i64 %41 to i32
  %43 = and i32 %42, 31
  %44 = shl i32 2, %43
  %45 = add i32 %44, -1
  %46 = icmp ne i32 %39, %45
  %47 = and i64 %41, 32
  %48 = icmp eq i64 %47, 0
  %49 = select i1 %46, i1 true, i1 %48
  br i1 %49, label %55, label %50

50:                                               ; preds = %36
  %51 = getelementptr inbounds %struct.meta, %struct.meta* %37, i64 0, i32 1
  %52 = load %struct.meta*, %struct.meta** %51, align 8, !tbaa !18
  store %struct.meta* %52, %struct.meta** %6, align 8, !tbaa !17
  %53 = getelementptr inbounds %struct.meta, %struct.meta* %52, i64 0, i32 4
  %54 = load volatile i32, i32* %53, align 4, !tbaa !32
  br label %55

55:                                               ; preds = %50, %36
  %56 = phi %struct.meta* [ %52, %50 ], [ %37, %36 ]
  %57 = phi i32 [ %54, %50 ], [ %39, %36 ]
  %58 = getelementptr inbounds %struct.meta, %struct.meta* %56, i64 0, i32 2
  %59 = load %struct.group*, %struct.group** %58, align 8, !tbaa !31
  %60 = getelementptr inbounds %struct.group, %struct.group* %59, i64 0, i32 1
  %61 = load i8, i8* %60, align 8
  %62 = and i8 %61, 31
  %63 = zext i8 %62 to i32
  %64 = shl i32 2, %63
  %65 = add i32 %64, -1
  %66 = and i32 %65, %57
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %68, label %104

68:                                               ; preds = %55
  %69 = getelementptr inbounds %struct.meta, %struct.meta* %56, i64 0, i32 1
  %70 = load %struct.meta*, %struct.meta** %69, align 8, !tbaa !18
  %71 = icmp eq %struct.meta* %70, %56
  br i1 %71, label %73, label %72

72:                                               ; preds = %68
  store %struct.meta* %70, %struct.meta** %6, align 8, !tbaa !17
  br label %104

73:                                               ; preds = %68
  %74 = add nuw nsw i32 %63, 2
  %75 = getelementptr inbounds %struct.meta, %struct.meta* %56, i64 0, i32 5
  %76 = load i64, i64* %75, align 8
  %77 = lshr i64 %76, 6
  %78 = and i64 %77, 63
  %79 = getelementptr inbounds [48 x i16], [48 x i16]* @__malloc_size_classes, i64 0, i64 %78
  %80 = load i16, i16* %79, align 2, !tbaa !35
  %81 = zext i16 %80 to i32
  %82 = shl nuw nsw i32 %81, 4
  %83 = mul nuw nsw i32 %82, %74
  %84 = add nuw nsw i32 %83, 16
  br label %85

85:                                               ; preds = %85, %73
  %86 = phi i32 [ %74, %73 ], [ %92, %85 ]
  %87 = phi i32 [ %84, %73 ], [ %88, %85 ]
  %88 = add nuw nsw i32 %87, %82
  %89 = add nsw i32 %88, -1
  %90 = xor i32 %89, %87
  %91 = icmp slt i32 %90, 4096
  %92 = add nuw nsw i32 %86, 1
  br i1 %91, label %85, label %93

93:                                               ; preds = %85
  %94 = trunc i64 %76 to i32
  %95 = and i32 %94, 31
  %96 = add nuw nsw i32 %95, 1
  %97 = icmp ugt i32 %86, %96
  %98 = select i1 %97, i32 %96, i32 %86
  %99 = trunc i32 %98 to i8
  %100 = add nuw nsw i8 %99, 31
  %101 = and i8 %100, 31
  %102 = and i8 %61, -32
  %103 = or i8 %101, %102
  store i8 %103, i8* %60, align 8
  br label %104

104:                                              ; preds = %93, %72, %55
  %105 = phi %struct.meta* [ %56, %55 ], [ %70, %72 ], [ %56, %93 ]
  %106 = getelementptr inbounds %struct.meta, %struct.meta* %105, i64 0, i32 3
  %107 = load volatile i32, i32* %106, align 8, !tbaa !33
  %108 = icmp eq i32 %107, 0
  br i1 %108, label %110, label %109

109:                                              ; preds = %104
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !37
  br label %110

110:                                              ; preds = %109, %104
  %111 = getelementptr inbounds %struct.meta, %struct.meta* %105, i64 0, i32 2
  %112 = load %struct.group*, %struct.group** %111, align 8, !tbaa !31
  %113 = getelementptr inbounds %struct.group, %struct.group* %112, i64 0, i32 1
  %114 = load i8, i8* %113, align 8
  %115 = and i8 %114, 31
  %116 = zext i8 %115 to i32
  %117 = shl i32 2, %116
  %118 = getelementptr inbounds %struct.meta, %struct.meta* %105, i64 0, i32 4
  %119 = sub i32 0, %117
  br label %120

120:                                              ; preds = %120, %110
  %121 = load volatile i32, i32* %118, align 4, !tbaa !32
  %122 = and i32 %121, %119
  %123 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %118, i32 %121, i32 %122) #7, !srcloc !38
  %124 = icmp eq i32 %123, %121
  br i1 %124, label %125, label %120

125:                                              ; preds = %120
  %126 = add i32 %117, -1
  %127 = and i32 %121, %126
  store volatile i32 %127, i32* %106, align 8, !tbaa !33
  %128 = icmp eq i32 %127, 0
  br i1 %128, label %129, label %130

129:                                              ; preds = %125
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !37
  br label %130

130:                                              ; preds = %129, %125
  %131 = getelementptr inbounds %struct.meta, %struct.meta* %105, i64 0, i32 5
  %132 = load i64, i64* %131, align 8
  %133 = trunc i64 %132 to i32
  %134 = lshr i32 %133, 6
  %135 = and i32 %134, 63
  %136 = add nsw i32 %135, -7
  %137 = icmp ult i32 %136, 32
  br i1 %137, label %138, label %145

138:                                              ; preds = %130
  %139 = zext i32 %136 to i64
  %140 = getelementptr inbounds %struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 14, i64 %139
  %141 = load i8, i8* %140, align 1, !tbaa !30
  %142 = icmp eq i8 %141, 0
  br i1 %142, label %145, label %143

143:                                              ; preds = %138
  %144 = add i8 %141, -1
  store i8 %144, i8* %140, align 1, !tbaa !30
  br label %145

145:                                              ; preds = %9, %130, %138, %143
  %146 = phi %struct.meta* [ %7, %9 ], [ %105, %130 ], [ %105, %138 ], [ %105, %143 ]
  %147 = phi i32 [ %11, %9 ], [ %127, %130 ], [ %127, %138 ], [ %127, %143 ]
  %148 = sub i32 0, %147
  %149 = and i32 %147, %148
  %150 = sub i32 %147, %149
  %151 = getelementptr inbounds %struct.meta, %struct.meta* %146, i64 0, i32 3
  store volatile i32 %150, i32* %151, align 8, !tbaa !33
  %152 = icmp eq i32 %149, 0
  br i1 %152, label %160, label %153

153:                                              ; preds = %145
  %154 = mul i32 %149, 124511785
  %155 = lshr i32 %154, 27
  %156 = zext i32 %155 to i64
  %157 = getelementptr inbounds [32 x i8], [32 x i8]* @a_ctz_32.debruijn32, i64 0, i64 %156
  %158 = load i8, i8* %157, align 1, !tbaa !30
  %159 = sext i8 %158 to i32
  br label %681

160:                                              ; preds = %31, %2, %145
  %161 = getelementptr inbounds [48 x i16], [48 x i16]* @__malloc_size_classes, i64 0, i64 %5
  %162 = load i16, i16* %161, align 2, !tbaa !35
  %163 = zext i16 %162 to i64
  %164 = shl nuw nsw i64 %163, 4
  %165 = tail call %struct.meta* @__malloc_alloc_meta() #6
  %166 = icmp eq %struct.meta* %165, null
  br i1 %166, label %681, label %167

167:                                              ; preds = %160
  %168 = getelementptr inbounds %struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 12, i64 %5
  %169 = load i64, i64* %168, align 8, !tbaa !14
  %170 = icmp slt i32 %0, 9
  br i1 %170, label %171, label %185

171:                                              ; preds = %167, %171
  %172 = phi i1 [ true, %171 ], [ false, %167 ]
  %173 = phi i64 [ 1, %171 ], [ 0, %167 ]
  %174 = getelementptr inbounds [9 x [3 x i8]], [9 x [3 x i8]]* @small_cnt_tab, i64 0, i64 %5, i64 %173
  %175 = load i8, i8* %174, align 1, !tbaa !30
  %176 = zext i8 %175 to i64
  %177 = shl nuw nsw i64 %176, 2
  %178 = icmp ule i64 %177, %169
  %179 = or i1 %172, %178
  br i1 %179, label %180, label %171

180:                                              ; preds = %171
  %181 = select i1 %178, i64 %173, i64 2
  %182 = getelementptr inbounds [9 x [3 x i8]], [9 x [3 x i8]]* @small_cnt_tab, i64 0, i64 %5, i64 %181
  %183 = load i8, i8* %182, align 1, !tbaa !30
  %184 = zext i8 %183 to i32
  br label %206

185:                                              ; preds = %167
  %186 = and i32 %0, 3
  %187 = zext i32 %186 to i64
  %188 = getelementptr inbounds [4 x i8], [4 x i8]* @med_cnt_tab, i64 0, i64 %187
  %189 = load i8, i8* %188, align 1, !tbaa !30
  %190 = zext i8 %189 to i32
  br label %191

191:                                              ; preds = %191, %185
  %192 = phi i32 [ %190, %185 ], [ %199, %191 ]
  %193 = and i32 %192, 1
  %194 = icmp eq i32 %193, 0
  %195 = shl nuw nsw i32 %192, 2
  %196 = zext i32 %195 to i64
  %197 = icmp ult i64 %169, %196
  %198 = select i1 %194, i1 %197, i1 false
  %199 = lshr i32 %192, 1
  br i1 %198, label %191, label %200

200:                                              ; preds = %191, %200
  %201 = phi i32 [ %205, %200 ], [ %192, %191 ]
  %202 = zext i32 %201 to i64
  %203 = mul nuw nsw i64 %164, %202
  %204 = icmp ugt i64 %203, 1048575
  %205 = lshr i32 %201, 1
  br i1 %204, label %200, label %206

206:                                              ; preds = %200, %180
  %207 = phi i32 [ %184, %180 ], [ %201, %200 ]
  %208 = icmp eq i32 %207, 1
  %209 = icmp ult i32 %0, 24
  %210 = select i1 %209, i32 2, i32 1
  %211 = select i1 %208, i32 %210, i32 %207
  %212 = zext i32 %211 to i64
  %213 = mul nuw nsw i64 %164, %212
  %214 = add nsw i64 %213, -2033
  %215 = icmp ult i64 %214, -2049
  br i1 %215, label %216, label %354

216:                                              ; preds = %206
  %217 = add i32 %0, -7
  %218 = icmp ult i32 %217, 32
  br i1 %218, label %219, label %238

219:                                              ; preds = %216
  %220 = zext i32 %217 to i64
  %221 = getelementptr inbounds %struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 14, i64 %220
  %222 = load i8, i8* %221, align 1, !tbaa !30
  %223 = icmp ugt i8 %222, 99
  %224 = zext i1 %223 to i32
  %225 = getelementptr inbounds %struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 13, i64 %220
  %226 = load i8, i8* %225, align 1, !tbaa !30
  %227 = icmp eq i8 %226, 0
  br i1 %227, label %238, label %228

228:                                              ; preds = %219
  %229 = zext i8 %226 to i32
  %230 = load i8, i8* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 15), align 8, !tbaa !29
  %231 = zext i8 %230 to i32
  %232 = sub nsw i32 %231, %229
  %233 = icmp slt i32 %232, 10
  br i1 %233, label %234, label %241

234:                                              ; preds = %228
  %235 = icmp ult i8 %222, 99
  %236 = add nuw nsw i8 %222, 1
  %237 = select i1 %235, i8 %236, i8 -106
  store i8 %237, i8* %221, align 1, !tbaa !30
  br label %238

238:                                              ; preds = %234, %219, %216
  %239 = phi i32 [ 0, %216 ], [ %224, %234 ], [ %224, %219 ]
  %240 = load i8, i8* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 15), align 8, !tbaa !29
  br label %241

241:                                              ; preds = %238, %228
  %242 = phi i8 [ %240, %238 ], [ %230, %228 ]
  %243 = phi i32 [ %239, %238 ], [ %224, %228 ]
  %244 = icmp eq i8 %242, -1
  br i1 %244, label %245, label %246

245:                                              ; preds = %241
  store <16 x i8> zeroinitializer, <16 x i8>* bitcast (i8* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 13, i64 0) to <16 x i8>*), align 8, !tbaa !30
  store <16 x i8> zeroinitializer, <16 x i8>* bitcast (i8* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 13, i64 16) to <16 x i8>*), align 8, !tbaa !30
  br label %248

246:                                              ; preds = %241
  %247 = add nuw i8 %242, 1
  br label %248

248:                                              ; preds = %245, %246
  %249 = phi i8 [ %247, %246 ], [ 1, %245 ]
  store i8 %249, i8* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 15), align 8, !tbaa !29
  %250 = and i32 %0, 1
  %251 = icmp eq i32 %250, 0
  %252 = icmp slt i32 %0, 32
  %253 = and i1 %252, %251
  br i1 %253, label %254, label %260

254:                                              ; preds = %248
  %255 = add nsw i32 %0, 1
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds %struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 12, i64 %256
  %258 = load i64, i64* %257, align 8, !tbaa !14
  %259 = add i64 %258, %169
  br label %260

260:                                              ; preds = %254, %248
  %261 = phi i64 [ %259, %254 ], [ %169, %248 ]
  %262 = shl nsw i32 %211, 2
  %263 = zext i32 %262 to i64
  %264 = icmp uge i64 %261, %263
  %265 = icmp ne i32 %243, 0
  %266 = select i1 %264, i1 true, i1 %265
  br i1 %266, label %285, label %267

267:                                              ; preds = %260
  %268 = and i32 %0, 3
  %269 = icmp eq i32 %268, 1
  %270 = icmp ugt i64 %213, 32768
  %271 = select i1 %269, i1 %270, i1 false
  br i1 %271, label %285, label %272

272:                                              ; preds = %267
  %273 = icmp eq i32 %268, 2
  %274 = icmp ugt i64 %213, 16384
  %275 = select i1 %273, i1 %274, i1 false
  br i1 %275, label %285, label %276

276:                                              ; preds = %272
  %277 = icmp eq i32 %268, 0
  %278 = select i1 %277, i1 %270, i1 false
  %279 = xor i1 %277, true
  %280 = or i1 %278, %279
  %281 = select i1 %278, i32 3, i32 %211
  br i1 %280, label %285, label %282

282:                                              ; preds = %276
  %283 = icmp ugt i64 %213, 8192
  %284 = select i1 %283, i32 5, i32 %211
  br label %285

285:                                              ; preds = %282, %276, %272, %267, %260
  %286 = phi i32 [ %211, %260 ], [ 2, %267 ], [ 3, %272 ], [ %281, %276 ], [ %284, %282 ]
  %287 = zext i32 %286 to i64
  %288 = mul nuw nsw i64 %164, %287
  %289 = add nuw nsw i64 %288, 16
  %290 = sub nsw i64 4080, %288
  %291 = and i64 %290, 4080
  %292 = add nuw nsw i64 %289, %291
  %293 = icmp eq i32 %243, 0
  %294 = icmp slt i32 %286, 8
  %295 = select i1 %293, i1 %294, i1 false
  br i1 %295, label %296, label %310

296:                                              ; preds = %285
  %297 = add i64 %1, 20
  %298 = sub i64 4076, %1
  %299 = and i64 %298, 4095
  %300 = add i64 %297, %299
  %301 = add nuw nsw i64 %164, 16
  %302 = icmp ult i64 %300, %301
  br i1 %302, label %309, label %303

303:                                              ; preds = %296
  %304 = icmp ugt i64 %300, 16383
  %305 = shl nsw i32 %286, 1
  %306 = zext i32 %305 to i64
  %307 = icmp ult i64 %261, %306
  %308 = select i1 %304, i1 %307, i1 false
  br i1 %308, label %309, label %310

309:                                              ; preds = %303, %296
  br label %310

310:                                              ; preds = %309, %303, %285
  %311 = phi i32 [ 1, %309 ], [ %286, %303 ], [ %286, %285 ]
  %312 = phi i64 [ %300, %309 ], [ %292, %303 ], [ %292, %285 ]
  %313 = tail call i8* @__mmap(i8* noundef null, i64 noundef %312, i32 noundef 3, i32 noundef 34, i32 noundef -1, i64 noundef 0) #6
  %314 = icmp eq i8* %313, inttoptr (i64 -1 to i8*)
  br i1 %314, label %315, label %339

315:                                              ; preds = %310
  %316 = bitcast %struct.meta* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %316)
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(40) %316, i8 0, i64 40, i1 false)
  %317 = bitcast %struct.meta* %165 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %317, i8* nonnull align 8 %316, i64 40, i1 true) #7, !tbaa.struct !39
  %318 = getelementptr inbounds %struct.meta, %struct.meta* %165, i64 0, i32 1
  %319 = load %struct.meta*, %struct.meta** %318, align 8, !tbaa !18
  %320 = icmp eq %struct.meta* %319, null
  br i1 %320, label %322, label %321

321:                                              ; preds = %315
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !37
  br label %322

322:                                              ; preds = %321, %315
  %323 = getelementptr inbounds %struct.meta, %struct.meta* %165, i64 0, i32 0
  %324 = load %struct.meta*, %struct.meta** %323, align 8, !tbaa !20
  %325 = icmp eq %struct.meta* %324, null
  br i1 %325, label %327, label %326

326:                                              ; preds = %322
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !37
  br label %327

327:                                              ; preds = %326, %322
  %328 = load %struct.meta*, %struct.meta** getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 3), align 8, !tbaa !17
  %329 = icmp eq %struct.meta* %328, null
  br i1 %329, label %336, label %330

330:                                              ; preds = %327
  store %struct.meta* %328, %struct.meta** %318, align 8, !tbaa !18
  %331 = getelementptr inbounds %struct.meta, %struct.meta* %328, i64 0, i32 0
  %332 = load %struct.meta*, %struct.meta** %331, align 8, !tbaa !20
  store %struct.meta* %332, %struct.meta** %323, align 8, !tbaa !20
  %333 = getelementptr inbounds %struct.meta, %struct.meta* %332, i64 0, i32 1
  store %struct.meta* %165, %struct.meta** %333, align 8, !tbaa !18
  %334 = load %struct.meta*, %struct.meta** %318, align 8, !tbaa !18
  %335 = getelementptr inbounds %struct.meta, %struct.meta* %334, i64 0, i32 0
  br label %337

336:                                              ; preds = %327
  store %struct.meta* %165, %struct.meta** %318, align 8, !tbaa !18
  store %struct.meta* %165, %struct.meta** %323, align 8, !tbaa !20
  br label %337

337:                                              ; preds = %336, %330
  %338 = phi %struct.meta** [ getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 3), %336 ], [ %335, %330 ]
  store %struct.meta* %165, %struct.meta** %338, align 8, !tbaa !17
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %316)
  br label %681

339:                                              ; preds = %310
  %340 = and i64 %312, -4096
  %341 = getelementptr inbounds %struct.meta, %struct.meta* %165, i64 0, i32 5
  %342 = load i64, i64* %341, align 8
  %343 = and i64 %342, 4095
  %344 = or i64 %343, %340
  store i64 %344, i64* %341, align 8
  %345 = load i32, i32* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 2), align 4, !tbaa !34
  %346 = add i32 %345, 1
  store i32 %346, i32* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 2), align 4, !tbaa !34
  %347 = udiv i64 4080, %164
  %348 = trunc i64 %347 to i32
  %349 = icmp slt i32 %311, %348
  %350 = select i1 %349, i32 %311, i32 %348
  %351 = icmp sgt i32 %350, 1
  %352 = select i1 %351, i32 %350, i32 1
  %353 = zext i32 %311 to i64
  br label %621

354:                                              ; preds = %206
  %355 = or i64 %213, 12
  %356 = lshr exact i64 %213, 4
  %357 = icmp ult i64 %213, 160
  %358 = trunc i64 %356 to i32
  br i1 %357, label %397, label %359

359:                                              ; preds = %354
  %360 = add i32 %358, 1
  %361 = lshr i32 %360, 1
  %362 = lshr i32 %360, 2
  %363 = or i32 %361, %362
  %364 = lshr i32 %363, 2
  %365 = or i32 %364, %363
  %366 = lshr i32 %365, 4
  %367 = or i32 %366, %365
  %368 = lshr i32 %367, 8
  %369 = or i32 %368, %367
  %370 = lshr i32 %369, 16
  %371 = or i32 %370, %369
  %372 = add nuw i32 %371, 1
  %373 = xor i32 %371, -1
  %374 = and i32 %372, %373
  %375 = mul i32 %374, 124511785
  %376 = lshr i32 %375, 27
  %377 = zext i32 %376 to i64
  %378 = getelementptr inbounds [32 x i8], [32 x i8]* @a_ctz_32.debruijn32, i64 0, i64 %377
  %379 = load i8, i8* %378, align 1, !tbaa !30
  %380 = sext i8 %379 to i32
  %381 = shl nsw i32 %380, 2
  %382 = add nsw i32 %381, -3
  %383 = sext i32 %382 to i64
  %384 = getelementptr inbounds [48 x i16], [48 x i16]* @__malloc_size_classes, i64 0, i64 %383
  %385 = load i16, i16* %384, align 2, !tbaa !35
  %386 = zext i16 %385 to i64
  %387 = icmp ult i64 %356, %386
  %388 = select i1 %387, i32 -4, i32 -2
  %389 = add nsw i32 %388, %381
  %390 = sext i32 %389 to i64
  %391 = getelementptr inbounds [48 x i16], [48 x i16]* @__malloc_size_classes, i64 0, i64 %390
  %392 = load i16, i16* %391, align 4, !tbaa !35
  %393 = zext i16 %392 to i64
  %394 = icmp uge i64 %356, %393
  %395 = zext i1 %394 to i32
  %396 = or i32 %389, %395
  br label %397

397:                                              ; preds = %354, %359
  %398 = phi i32 [ %396, %359 ], [ %358, %354 ]
  %399 = tail call fastcc i32 @alloc_slot(i32 noundef %398, i64 noundef %355) #6
  %400 = icmp slt i32 %399, 0
  br i1 %400, label %401, label %425

401:                                              ; preds = %397
  %402 = bitcast %struct.meta* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %402)
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(40) %402, i8 0, i64 40, i1 false)
  %403 = bitcast %struct.meta* %165 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %403, i8* nonnull align 8 %402, i64 40, i1 true) #7, !tbaa.struct !39
  %404 = getelementptr inbounds %struct.meta, %struct.meta* %165, i64 0, i32 1
  %405 = load %struct.meta*, %struct.meta** %404, align 8, !tbaa !18
  %406 = icmp eq %struct.meta* %405, null
  br i1 %406, label %408, label %407

407:                                              ; preds = %401
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !37
  br label %408

408:                                              ; preds = %407, %401
  %409 = getelementptr inbounds %struct.meta, %struct.meta* %165, i64 0, i32 0
  %410 = load %struct.meta*, %struct.meta** %409, align 8, !tbaa !20
  %411 = icmp eq %struct.meta* %410, null
  br i1 %411, label %413, label %412

412:                                              ; preds = %408
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !37
  br label %413

413:                                              ; preds = %412, %408
  %414 = load %struct.meta*, %struct.meta** getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 3), align 8, !tbaa !17
  %415 = icmp eq %struct.meta* %414, null
  br i1 %415, label %422, label %416

416:                                              ; preds = %413
  store %struct.meta* %414, %struct.meta** %404, align 8, !tbaa !18
  %417 = getelementptr inbounds %struct.meta, %struct.meta* %414, i64 0, i32 0
  %418 = load %struct.meta*, %struct.meta** %417, align 8, !tbaa !20
  store %struct.meta* %418, %struct.meta** %409, align 8, !tbaa !20
  %419 = getelementptr inbounds %struct.meta, %struct.meta* %418, i64 0, i32 1
  store %struct.meta* %165, %struct.meta** %419, align 8, !tbaa !18
  %420 = load %struct.meta*, %struct.meta** %404, align 8, !tbaa !18
  %421 = getelementptr inbounds %struct.meta, %struct.meta* %420, i64 0, i32 0
  br label %423

422:                                              ; preds = %413
  store %struct.meta* %165, %struct.meta** %404, align 8, !tbaa !18
  store %struct.meta* %165, %struct.meta** %409, align 8, !tbaa !20
  br label %423

423:                                              ; preds = %422, %416
  %424 = phi %struct.meta** [ getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 3), %422 ], [ %421, %416 ]
  store %struct.meta* %165, %struct.meta** %424, align 8, !tbaa !17
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %402)
  br label %681

425:                                              ; preds = %397
  %426 = sext i32 %398 to i64
  %427 = getelementptr inbounds %struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 11, i64 %426
  %428 = load %struct.meta*, %struct.meta** %427, align 8, !tbaa !17
  %429 = getelementptr inbounds [48 x i16], [48 x i16]* @__malloc_size_classes, i64 0, i64 %426
  %430 = load i16, i16* %429, align 2, !tbaa !35
  %431 = zext i16 %430 to i32
  %432 = shl nuw nsw i32 %431, 4
  %433 = add nsw i32 %432, -4
  %434 = sext i32 %433 to i64
  %435 = load i32, i32* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 2), align 4, !tbaa !34
  %436 = getelementptr inbounds %struct.meta, %struct.meta* %428, i64 0, i32 5
  %437 = load i64, i64* %436, align 8
  %438 = and i64 %437, 31
  %439 = icmp ne i64 %438, 0
  %440 = icmp ult i64 %437, 4096
  %441 = or i1 %440, %439
  br i1 %441, label %445, label %442

442:                                              ; preds = %425
  %443 = and i64 %437, -4096
  %444 = add i64 %443, -16
  br label %452

445:                                              ; preds = %425
  %446 = lshr i64 %437, 6
  %447 = and i64 %446, 63
  %448 = getelementptr inbounds [48 x i16], [48 x i16]* @__malloc_size_classes, i64 0, i64 %447
  %449 = load i16, i16* %448, align 2, !tbaa !35
  %450 = zext i16 %449 to i64
  %451 = shl nuw nsw i64 %450, 4
  br label %452

452:                                              ; preds = %445, %442
  %453 = phi i64 [ %451, %445 ], [ %444, %442 ]
  %454 = sub nuw nsw i64 -4, %434
  %455 = add i64 %453, %454
  %456 = lshr i64 %455, 4
  %457 = getelementptr inbounds %struct.meta, %struct.meta* %428, i64 0, i32 2
  %458 = load %struct.group*, %struct.group** %457, align 8, !tbaa !31
  %459 = zext i32 %399 to i64
  %460 = mul i64 %453, %459
  %461 = getelementptr inbounds %struct.group, %struct.group* %458, i64 0, i32 3, i64 %460
  %462 = getelementptr inbounds i8, i8* %461, i64 -3
  %463 = load i8, i8* %462, align 1, !tbaa !30
  %464 = icmp eq i8 %463, 0
  br i1 %464, label %471, label %465

465:                                              ; preds = %452
  %466 = getelementptr inbounds i8, i8* %461, i64 -2
  %467 = bitcast i8* %466 to i16*
  %468 = load i16, i16* %467, align 2, !tbaa !35
  %469 = zext i16 %468 to i32
  %470 = add nuw nsw i32 %469, 1
  br label %471

471:                                              ; preds = %465, %452
  %472 = phi i32 [ %470, %465 ], [ %435, %452 ]
  %473 = and i32 %472, 255
  %474 = getelementptr inbounds i8, i8* %461, i64 -4
  %475 = load i8, i8* %474, align 1, !tbaa !30
  %476 = icmp eq i8 %475, 0
  br i1 %476, label %478, label %477

477:                                              ; preds = %471
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !37
  br label %478

478:                                              ; preds = %477, %471
  %479 = zext i32 %473 to i64
  %480 = icmp ult i64 %456, %479
  br i1 %480, label %481, label %499

481:                                              ; preds = %478
  %482 = lshr i64 %455, 5
  %483 = or i64 %456, %482
  %484 = lshr i64 %483, 2
  %485 = or i64 %484, %483
  %486 = lshr i64 %485, 4
  %487 = or i64 %486, %485
  %488 = trunc i64 %487 to i32
  %489 = and i32 %473, %488
  %490 = zext i32 %489 to i64
  %491 = icmp ult i64 %456, %490
  %492 = trunc i64 %456 to i32
  %493 = xor i32 %492, -1
  %494 = select i1 %491, i32 %493, i32 0
  %495 = add i32 %494, %489
  %496 = sext i32 %495 to i64
  %497 = icmp ult i64 %456, %496
  br i1 %497, label %498, label %499

498:                                              ; preds = %481
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !37
  br label %499

499:                                              ; preds = %498, %481, %478
  %500 = phi i32 [ %473, %478 ], [ %495, %498 ], [ %495, %481 ]
  %501 = icmp eq i32 %500, 0
  br i1 %501, label %510, label %502

502:                                              ; preds = %499
  %503 = trunc i32 %500 to i16
  %504 = getelementptr inbounds i8, i8* %461, i64 -2
  %505 = bitcast i8* %504 to i16*
  store i16 %503, i16* %505, align 2, !tbaa !35
  store i8 -32, i8* %462, align 1, !tbaa !30
  %506 = shl nsw i32 %500, 4
  %507 = sext i32 %506 to i64
  %508 = getelementptr inbounds i8, i8* %461, i64 %507
  %509 = getelementptr inbounds i8, i8* %508, i64 -4
  store i8 0, i8* %509, align 1, !tbaa !30
  br label %510

510:                                              ; preds = %502, %499
  %511 = phi i8* [ %508, %502 ], [ %461, %499 ]
  %512 = getelementptr inbounds i8, i8* %461, i64 %453
  %513 = getelementptr inbounds i8, i8* %512, i64 -4
  %514 = load %struct.group*, %struct.group** %457, align 8, !tbaa !31
  %515 = getelementptr inbounds %struct.group, %struct.group* %514, i64 0, i32 3, i64 0
  %516 = ptrtoint i8* %511 to i64
  %517 = ptrtoint i8* %515 to i64
  %518 = sub i64 %516, %517
  %519 = lshr i64 %518, 4
  %520 = trunc i64 %519 to i16
  %521 = getelementptr inbounds i8, i8* %511, i64 -2
  %522 = bitcast i8* %521 to i16*
  store i16 %520, i16* %522, align 2, !tbaa !35
  %523 = trunc i32 %399 to i8
  %524 = getelementptr inbounds i8, i8* %511, i64 -3
  store i8 %523, i8* %524, align 1, !tbaa !30
  %525 = ptrtoint i8* %513 to i64
  %526 = add i64 %434, %516
  %527 = sub i64 %525, %526
  %528 = trunc i64 %527 to i32
  %529 = icmp eq i32 %528, 0
  br i1 %529, label %539, label %530

530:                                              ; preds = %510
  %531 = mul i64 %527, -4294967296
  %532 = ashr exact i64 %531, 32
  %533 = getelementptr inbounds i8, i8* %513, i64 %532
  store i8 0, i8* %533, align 1, !tbaa !30
  %534 = icmp sgt i32 %528, 4
  br i1 %534, label %535, label %539

535:                                              ; preds = %530
  %536 = getelementptr inbounds i8, i8* %513, i64 -4
  %537 = bitcast i8* %536 to i32*
  store i32 %528, i32* %537, align 4, !tbaa !11
  %538 = getelementptr inbounds i8, i8* %513, i64 -5
  store i8 0, i8* %538, align 1, !tbaa !30
  br label %539

539:                                              ; preds = %535, %530, %510
  %540 = phi i32 [ 5, %535 ], [ %528, %530 ], [ 0, %510 ]
  %541 = load i8, i8* %524, align 1, !tbaa !30
  %542 = and i8 %541, 31
  %543 = trunc i32 %540 to i8
  %544 = shl i8 %543, 5
  %545 = or i8 %544, %542
  store i8 %545, i8* %524, align 1, !tbaa !30
  %546 = getelementptr inbounds %struct.meta, %struct.meta* %165, i64 0, i32 5
  %547 = load i64, i64* %546, align 8
  %548 = and i64 %547, 4095
  store i64 %548, i64* %546, align 8
  %549 = load i8, i8* %524, align 1, !tbaa !30
  %550 = and i8 %549, 31
  %551 = or i8 %550, -64
  store i8 %551, i8* %524, align 1, !tbaa !30
  %552 = add nuw i32 %211, 1
  %553 = zext i32 %552 to i64
  %554 = add nuw nsw i64 %553, 7
  %555 = and i64 %554, 8589934584
  %556 = add nsw i64 %553, -1
  %557 = insertelement <8 x i64> poison, i64 %556, i64 0
  %558 = shufflevector <8 x i64> %557, <8 x i64> poison, <8 x i32> zeroinitializer
  br label %559

559:                                              ; preds = %617, %539
  %560 = phi i64 [ 0, %539 ], [ %618, %617 ]
  %561 = phi <8 x i64> [ <i64 0, i64 1, i64 2, i64 3, i64 4, i64 5, i64 6, i64 7>, %539 ], [ %619, %617 ]
  %562 = icmp ule <8 x i64> %561, %558
  %563 = extractelement <8 x i1> %562, i64 0
  br i1 %563, label %564, label %568

564:                                              ; preds = %559
  %565 = mul nuw nsw i64 %560, %164
  %566 = or i64 %565, 12
  %567 = getelementptr inbounds i8, i8* %511, i64 %566
  store i8 0, i8* %567, align 1, !tbaa !30
  br label %568

568:                                              ; preds = %564, %559
  %569 = extractelement <8 x i1> %562, i64 1
  br i1 %569, label %570, label %575

570:                                              ; preds = %568
  %571 = or i64 %560, 1
  %572 = mul nuw nsw i64 %571, %164
  %573 = or i64 %572, 12
  %574 = getelementptr inbounds i8, i8* %511, i64 %573
  store i8 0, i8* %574, align 1, !tbaa !30
  br label %575

575:                                              ; preds = %570, %568
  %576 = extractelement <8 x i1> %562, i64 2
  br i1 %576, label %577, label %582

577:                                              ; preds = %575
  %578 = or i64 %560, 2
  %579 = mul nuw nsw i64 %578, %164
  %580 = or i64 %579, 12
  %581 = getelementptr inbounds i8, i8* %511, i64 %580
  store i8 0, i8* %581, align 1, !tbaa !30
  br label %582

582:                                              ; preds = %577, %575
  %583 = extractelement <8 x i1> %562, i64 3
  br i1 %583, label %584, label %589

584:                                              ; preds = %582
  %585 = or i64 %560, 3
  %586 = mul nuw nsw i64 %585, %164
  %587 = or i64 %586, 12
  %588 = getelementptr inbounds i8, i8* %511, i64 %587
  store i8 0, i8* %588, align 1, !tbaa !30
  br label %589

589:                                              ; preds = %584, %582
  %590 = extractelement <8 x i1> %562, i64 4
  br i1 %590, label %591, label %596

591:                                              ; preds = %589
  %592 = or i64 %560, 4
  %593 = mul nuw nsw i64 %592, %164
  %594 = or i64 %593, 12
  %595 = getelementptr inbounds i8, i8* %511, i64 %594
  store i8 0, i8* %595, align 1, !tbaa !30
  br label %596

596:                                              ; preds = %591, %589
  %597 = extractelement <8 x i1> %562, i64 5
  br i1 %597, label %598, label %603

598:                                              ; preds = %596
  %599 = or i64 %560, 5
  %600 = mul nuw nsw i64 %599, %164
  %601 = or i64 %600, 12
  %602 = getelementptr inbounds i8, i8* %511, i64 %601
  store i8 0, i8* %602, align 1, !tbaa !30
  br label %603

603:                                              ; preds = %598, %596
  %604 = extractelement <8 x i1> %562, i64 6
  br i1 %604, label %605, label %610

605:                                              ; preds = %603
  %606 = or i64 %560, 6
  %607 = mul nuw nsw i64 %606, %164
  %608 = or i64 %607, 12
  %609 = getelementptr inbounds i8, i8* %511, i64 %608
  store i8 0, i8* %609, align 1, !tbaa !30
  br label %610

610:                                              ; preds = %605, %603
  %611 = extractelement <8 x i1> %562, i64 7
  br i1 %611, label %612, label %617

612:                                              ; preds = %610
  %613 = or i64 %560, 7
  %614 = mul nuw nsw i64 %613, %164
  %615 = or i64 %614, 12
  %616 = getelementptr inbounds i8, i8* %511, i64 %615
  store i8 0, i8* %616, align 1, !tbaa !30
  br label %617

617:                                              ; preds = %612, %610
  %618 = add i64 %560, 8
  %619 = add <8 x i64> %561, <i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8>
  %620 = icmp eq i64 %618, %555
  br i1 %620, label %621, label %559, !llvm.loop !40

621:                                              ; preds = %617, %339
  %622 = phi i64 [ %353, %339 ], [ %212, %617 ]
  %623 = phi i8* [ %313, %339 ], [ %511, %617 ]
  %624 = phi i32 [ %352, %339 ], [ %211, %617 ]
  %625 = phi i32 [ %311, %339 ], [ %211, %617 ]
  %626 = add nsw i32 %624, -1
  %627 = load i64, i64* %168, align 8, !tbaa !14
  %628 = add i64 %627, %622
  store i64 %628, i64* %168, align 8, !tbaa !14
  %629 = shl i32 2, %626
  %630 = add i32 %629, -1
  %631 = getelementptr inbounds %struct.meta, %struct.meta* %165, i64 0, i32 3
  store volatile i32 %630, i32* %631, align 8, !tbaa !33
  %632 = add nsw i32 %625, -1
  %633 = shl i32 2, %632
  %634 = load volatile i32, i32* %631, align 8, !tbaa !33
  %635 = xor i32 %634, -1
  %636 = add i32 %633, %635
  %637 = getelementptr inbounds %struct.meta, %struct.meta* %165, i64 0, i32 4
  store volatile i32 %636, i32* %637, align 4, !tbaa !32
  %638 = getelementptr inbounds %struct.meta, %struct.meta* %165, i64 0, i32 2
  %639 = bitcast %struct.group** %638 to i8**
  store i8* %623, i8** %639, align 8, !tbaa !31
  %640 = bitcast i8* %623 to %struct.meta**
  store %struct.meta* %165, %struct.meta** %640, align 8, !tbaa !17
  %641 = trunc i32 %626 to i8
  %642 = load %struct.group*, %struct.group** %638, align 8, !tbaa !31
  %643 = getelementptr inbounds %struct.group, %struct.group* %642, i64 0, i32 1
  %644 = load i8, i8* %643, align 8
  %645 = and i8 %641, 31
  %646 = and i8 %644, -32
  %647 = or i8 %646, %645
  store i8 %647, i8* %643, align 8
  %648 = getelementptr inbounds %struct.meta, %struct.meta* %165, i64 0, i32 5
  %649 = load i64, i64* %648, align 8
  %650 = and i32 %632, 31
  %651 = zext i32 %650 to i64
  %652 = and i64 %649, -4096
  %653 = shl nsw i64 %5, 6
  %654 = and i64 %653, 4032
  %655 = or i64 %654, %651
  %656 = or i64 %655, %652
  %657 = or i64 %656, 32
  store i64 %657, i64* %648, align 8
  %658 = load volatile i32, i32* %631, align 8, !tbaa !33
  %659 = add nsw i32 %658, -1
  store volatile i32 %659, i32* %631, align 8, !tbaa !33
  %660 = getelementptr inbounds %struct.meta, %struct.meta* %165, i64 0, i32 1
  %661 = load %struct.meta*, %struct.meta** %660, align 8, !tbaa !18
  %662 = icmp eq %struct.meta* %661, null
  br i1 %662, label %664, label %663

663:                                              ; preds = %621
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !37
  br label %664

664:                                              ; preds = %663, %621
  %665 = getelementptr inbounds %struct.meta, %struct.meta* %165, i64 0, i32 0
  %666 = load %struct.meta*, %struct.meta** %665, align 8, !tbaa !20
  %667 = icmp eq %struct.meta* %666, null
  br i1 %667, label %669, label %668

668:                                              ; preds = %664
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !37
  br label %669

669:                                              ; preds = %668, %664
  %670 = load %struct.meta*, %struct.meta** %6, align 8, !tbaa !17
  %671 = icmp eq %struct.meta* %670, null
  br i1 %671, label %678, label %672

672:                                              ; preds = %669
  store %struct.meta* %670, %struct.meta** %660, align 8, !tbaa !18
  %673 = getelementptr inbounds %struct.meta, %struct.meta* %670, i64 0, i32 0
  %674 = load %struct.meta*, %struct.meta** %673, align 8, !tbaa !20
  store %struct.meta* %674, %struct.meta** %665, align 8, !tbaa !20
  %675 = getelementptr inbounds %struct.meta, %struct.meta* %674, i64 0, i32 1
  store %struct.meta* %165, %struct.meta** %675, align 8, !tbaa !18
  %676 = load %struct.meta*, %struct.meta** %660, align 8, !tbaa !18
  %677 = getelementptr inbounds %struct.meta, %struct.meta* %676, i64 0, i32 0
  br label %679

678:                                              ; preds = %669
  store %struct.meta* %165, %struct.meta** %660, align 8, !tbaa !18
  store %struct.meta* %165, %struct.meta** %665, align 8, !tbaa !20
  br label %679

679:                                              ; preds = %672, %678
  %680 = phi %struct.meta** [ %6, %678 ], [ %677, %672 ]
  store %struct.meta* %165, %struct.meta** %680, align 8, !tbaa !17
  br label %681

681:                                              ; preds = %423, %337, %160, %679, %153
  %682 = phi i32 [ %159, %153 ], [ 0, %679 ], [ -1, %160 ], [ -1, %337 ], [ -1, %423 ]
  ret i32 %682
}

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__malloc_allzerop(i8* noundef %0) local_unnamed_addr #0 {
  %2 = ptrtoint i8* %0 to i64
  %3 = and i64 %2, 15
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %6, label %5

5:                                                ; preds = %1
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !37
  br label %6

6:                                                ; preds = %5, %1
  %7 = getelementptr inbounds i8, i8* %0, i64 -2
  %8 = bitcast i8* %7 to i16*
  %9 = load i16, i16* %8, align 2, !tbaa !35
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8* %0, i64 -3
  %12 = load i8, i8* %11, align 1, !tbaa !30
  %13 = and i8 %12, 31
  %14 = zext i8 %13 to i32
  %15 = getelementptr inbounds i8, i8* %0, i64 -4
  %16 = load i8, i8* %15, align 1, !tbaa !30
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %27, label %18

18:                                               ; preds = %6
  %19 = icmp eq i16 %9, 0
  br i1 %19, label %21, label %20

20:                                               ; preds = %18
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !37
  br label %21

21:                                               ; preds = %20, %18
  %22 = getelementptr inbounds i8, i8* %0, i64 -8
  %23 = bitcast i8* %22 to i32*
  %24 = load i32, i32* %23, align 4, !tbaa !11
  %25 = icmp sgt i32 %24, 65535
  br i1 %25, label %27, label %26

26:                                               ; preds = %21
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !37
  br label %27

27:                                               ; preds = %26, %21, %6
  %28 = phi i32 [ %24, %21 ], [ %24, %26 ], [ %10, %6 ]
  %29 = shl nsw i32 %28, 4
  %30 = sext i32 %29 to i64
  %31 = sub nsw i64 0, %30
  %32 = getelementptr inbounds i8, i8* %0, i64 %31
  %33 = getelementptr inbounds i8, i8* %32, i64 -16
  %34 = bitcast i8* %33 to %struct.group*
  %35 = bitcast i8* %33 to %struct.meta**
  %36 = load %struct.meta*, %struct.meta** %35, align 8, !tbaa !17
  %37 = getelementptr inbounds %struct.meta, %struct.meta* %36, i64 0, i32 2
  %38 = load %struct.group*, %struct.group** %37, align 8, !tbaa !31
  %39 = icmp eq %struct.group* %38, %34
  br i1 %39, label %41, label %40

40:                                               ; preds = %27
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !37
  br label %41

41:                                               ; preds = %40, %27
  %42 = getelementptr inbounds %struct.meta, %struct.meta* %36, i64 0, i32 5
  %43 = load i64, i64* %42, align 8
  %44 = trunc i64 %43 to i32
  %45 = and i32 %44, 31
  %46 = icmp ult i32 %45, %14
  br i1 %46, label %47, label %48

47:                                               ; preds = %41
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !37
  br label %48

48:                                               ; preds = %47, %41
  %49 = getelementptr inbounds %struct.meta, %struct.meta* %36, i64 0, i32 3
  %50 = load volatile i32, i32* %49, align 8, !tbaa !33
  %51 = shl nuw i32 1, %14
  %52 = and i32 %50, %51
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %55, label %54

54:                                               ; preds = %48
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !37
  br label %55

55:                                               ; preds = %54, %48
  %56 = getelementptr inbounds %struct.meta, %struct.meta* %36, i64 0, i32 4
  %57 = load volatile i32, i32* %56, align 4, !tbaa !32
  %58 = and i32 %57, %51
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %61, label %60

60:                                               ; preds = %55
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !37
  br label %61

61:                                               ; preds = %60, %55
  %62 = ptrtoint %struct.meta* %36 to i64
  %63 = and i64 %62, -4096
  %64 = inttoptr i64 %63 to %struct.meta_area*
  %65 = getelementptr inbounds %struct.meta_area, %struct.meta_area* %64, i64 0, i32 0
  %66 = load i64, i64* %65, align 4096, !tbaa !14
  %67 = load i64, i64* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 0), align 8, !tbaa !16
  %68 = icmp eq i64 %66, %67
  br i1 %68, label %70, label %69

69:                                               ; preds = %61
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !37
  br label %70

70:                                               ; preds = %69, %61
  %71 = load i64, i64* %42, align 8
  %72 = lshr i64 %71, 6
  %73 = and i64 %72, 63
  %74 = trunc i64 %73 to i32
  %75 = icmp ult i32 %74, 48
  br i1 %75, label %76, label %95

76:                                               ; preds = %70
  %77 = getelementptr inbounds [48 x i16], [48 x i16]* @__malloc_size_classes, i64 0, i64 %73
  %78 = load i16, i16* %77, align 2, !tbaa !35
  %79 = zext i16 %78 to i32
  %80 = mul nuw nsw i32 %79, %14
  %81 = icmp slt i32 %28, %80
  br i1 %81, label %82, label %89

82:                                               ; preds = %76
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !37
  %83 = load i64, i64* %42, align 8
  %84 = lshr i64 %83, 6
  %85 = and i64 %84, 63
  %86 = getelementptr inbounds [48 x i16], [48 x i16]* @__malloc_size_classes, i64 0, i64 %85
  %87 = load i16, i16* %86, align 2, !tbaa !35
  %88 = zext i16 %87 to i32
  br label %89

89:                                               ; preds = %82, %76
  %90 = phi i32 [ %88, %82 ], [ %79, %76 ]
  %91 = add nuw nsw i32 %14, 1
  %92 = mul nuw nsw i32 %91, %90
  %93 = icmp slt i32 %28, %92
  br i1 %93, label %98, label %94

94:                                               ; preds = %89
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !37
  br label %98

95:                                               ; preds = %70
  %96 = icmp eq i32 %74, 63
  br i1 %96, label %98, label %97

97:                                               ; preds = %95
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !37
  br label %98

98:                                               ; preds = %97, %95, %94, %89
  %99 = load i64, i64* %42, align 8
  %100 = icmp ult i64 %99, 4096
  br i1 %100, label %109, label %101

101:                                              ; preds = %98
  %102 = sext i32 %28 to i64
  %103 = lshr i64 %99, 4
  %104 = and i64 %103, 1152921504606846720
  %105 = add nsw i64 %104, -1
  %106 = icmp ult i64 %105, %102
  br i1 %106, label %107, label %109

107:                                              ; preds = %101
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !37
  %108 = load i64, i64* %42, align 8
  br label %109

109:                                              ; preds = %98, %101, %107
  %110 = phi i64 [ %99, %98 ], [ %99, %101 ], [ %108, %107 ]
  %111 = and i64 %110, 3072
  %112 = icmp eq i64 %111, 3072
  br i1 %112, label %139, label %113

113:                                              ; preds = %109
  %114 = and i64 %110, 31
  %115 = icmp ne i64 %114, 0
  %116 = icmp ult i64 %110, 4096
  %117 = or i1 %116, %115
  br i1 %117, label %123, label %118

118:                                              ; preds = %113
  %119 = and i64 %110, -4096
  %120 = add i64 %119, -16
  %121 = lshr i64 %110, 6
  %122 = and i64 %121, 63
  br label %130

123:                                              ; preds = %113
  %124 = lshr i64 %110, 6
  %125 = and i64 %124, 63
  %126 = getelementptr inbounds [48 x i16], [48 x i16]* @__malloc_size_classes, i64 0, i64 %125
  %127 = load i16, i16* %126, align 2, !tbaa !35
  %128 = zext i16 %127 to i64
  %129 = shl nuw nsw i64 %128, 4
  br label %130

130:                                              ; preds = %118, %123
  %131 = phi i64 [ %122, %118 ], [ %125, %123 ]
  %132 = phi i64 [ %120, %118 ], [ %129, %123 ]
  %133 = getelementptr inbounds [48 x i16], [48 x i16]* @__malloc_size_classes, i64 0, i64 %131
  %134 = load i16, i16* %133, align 2, !tbaa !35
  %135 = zext i16 %134 to i64
  %136 = shl nuw nsw i64 %135, 4
  %137 = icmp ult i64 %132, %136
  %138 = zext i1 %137 to i32
  br label %139

139:                                              ; preds = %130, %109
  %140 = phi i32 [ 1, %109 ], [ %138, %130 ]
  ret i32 %140
}

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__lock(i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__unlock(i32* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #7 = { nounwind strictfp }
attributes #8 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #9 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 3}
!4 = !{!"__libc", !5, i64 0, !5, i64 1, !5, i64 2, !5, i64 3, !7, i64 4, !8, i64 8, !8, i64 16, !9, i64 24, !9, i64 32, !9, i64 40, !9, i64 48, !10, i64 56}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!"int", !5, i64 0}
!8 = !{!"any pointer", !5, i64 0}
!9 = !{!"long", !5, i64 0}
!10 = !{!"__locale_struct", !5, i64 0}
!11 = !{!7, !7, i64 0}
!12 = !{!13, !7, i64 8}
!13 = !{!"malloc_context", !9, i64 0, !7, i64 8, !7, i64 12, !8, i64 16, !8, i64 24, !9, i64 32, !9, i64 40, !9, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !5, i64 80, !5, i64 464, !5, i64 848, !5, i64 880, !5, i64 912, !9, i64 920}
!14 = !{!9, !9, i64 0}
!15 = !{!4, !8, i64 8}
!16 = !{!13, !9, i64 0}
!17 = !{!8, !8, i64 0}
!18 = !{!19, !8, i64 8}
!19 = !{!"meta", !8, i64 0, !8, i64 8, !8, i64 16, !7, i64 24, !7, i64 28, !9, i64 32, !9, i64 32, !9, i64 32, !9, i64 33}
!20 = !{!19, !8, i64 0}
!21 = !{!13, !9, i64 32}
!22 = !{!13, !8, i64 24}
!23 = !{!13, !9, i64 40}
!24 = !{i64 317374}
!25 = !{!13, !9, i64 920}
!26 = !{!13, !8, i64 72}
!27 = !{!13, !9, i64 48}
!28 = !{!13, !8, i64 64}
!29 = !{!13, !5, i64 912}
!30 = !{!5, !5, i64 0}
!31 = !{!19, !8, i64 16}
!32 = !{!19, !7, i64 28}
!33 = !{!19, !7, i64 24}
!34 = !{!13, !7, i64 12}
!35 = !{!36, !36, i64 0}
!36 = !{!"short", !5, i64 0}
!37 = !{i64 285291}
!38 = !{i64 283215}
!39 = !{i64 0, i64 8, !17, i64 8, i64 8, !17, i64 16, i64 8, !17, i64 24, i64 4, !11, i64 28, i64 4, !11, i64 32, i64 8, !14, i64 32, i64 8, !14, i64 32, i64 8, !14, i64 33, i64 8, !14}
!40 = distinct !{!40, !41}
!41 = !{!"llvm.loop.isvectorized", i32 1}
