; ModuleID = 'src/malloc/mallocng/free.c'
source_filename = "src/malloc/mallocng/free.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.malloc_context = type { i64, i32, i32, %struct.meta*, %struct.meta*, i64, i64, i64, %struct.meta_area*, %struct.meta_area*, i8*, [48 x %struct.meta*], [48 x i64], [32 x i8], [32 x i8], i8, i64 }
%struct.meta = type { %struct.meta*, %struct.meta*, %struct.group*, i32, i32, i64 }
%struct.group = type { %struct.meta*, i8, [7 x i8], [0 x i8] }
%struct.meta_area = type { i64, %struct.meta_area*, i32, [0 x %struct.meta] }

@__libc = external hidden global %struct.__libc, align 8
@__malloc_context = external hidden local_unnamed_addr global %struct.malloc_context, align 8
@__malloc_size_classes = external hidden local_unnamed_addr constant [0 x i16], align 2
@__malloc_lock = external hidden global [1 x i32], align 4

; Function Attrs: nounwind optsize strictfp
define hidden void @__libc_free(i8* noundef %0) local_unnamed_addr #0 {
  %2 = icmp eq i8* %0, null
  br i1 %2, label %133, label %3

3:                                                ; preds = %1
  %4 = tail call fastcc %struct.meta* @get_meta(i8* noundef nonnull %0) #7
  %5 = getelementptr inbounds i8, i8* %0, i64 -3
  %6 = load i8, i8* %5, align 1, !tbaa !3
  %7 = and i8 %6, 31
  %8 = zext i8 %7 to i32
  %9 = getelementptr inbounds %struct.meta, %struct.meta* %4, i64 0, i32 5
  %10 = load i64, i64* %9, align 8
  %11 = and i64 %10, 31
  %12 = icmp ne i64 %11, 0
  %13 = icmp ult i64 %10, 4096
  %14 = or i1 %13, %12
  br i1 %14, label %18, label %15

15:                                               ; preds = %3
  %16 = and i64 %10, -4096
  %17 = add i64 %16, -16
  br label %25

18:                                               ; preds = %3
  %19 = lshr i64 %10, 6
  %20 = and i64 %19, 63
  %21 = getelementptr inbounds [0 x i16], [0 x i16]* @__malloc_size_classes, i64 0, i64 %20
  %22 = load i16, i16* %21, align 2, !tbaa !6
  %23 = zext i16 %22 to i64
  %24 = shl nuw nsw i64 %23, 4
  br label %25

25:                                               ; preds = %15, %18
  %26 = phi i64 [ %24, %18 ], [ %17, %15 ]
  %27 = getelementptr inbounds %struct.meta, %struct.meta* %4, i64 0, i32 2
  %28 = load %struct.group*, %struct.group** %27, align 8, !tbaa !8
  %29 = zext i8 %7 to i64
  %30 = mul i64 %26, %29
  %31 = getelementptr inbounds %struct.group, %struct.group* %28, i64 0, i32 3, i64 %30
  %32 = getelementptr inbounds i8, i8* %31, i64 %26
  %33 = getelementptr inbounds i8, i8* %32, i64 -4
  %34 = lshr i8 %6, 5
  %35 = zext i8 %34 to i64
  %36 = icmp ugt i8 %6, -97
  br i1 %36, label %37, label %52

37:                                               ; preds = %25
  %38 = icmp eq i8 %34, 5
  br i1 %38, label %40, label %39

39:                                               ; preds = %37
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  br label %40

40:                                               ; preds = %39, %37
  %41 = getelementptr inbounds i8, i8* %33, i64 -4
  %42 = bitcast i8* %41 to i32*
  %43 = load i32, i32* %42, align 4, !tbaa !14
  %44 = zext i32 %43 to i64
  %45 = icmp ugt i32 %43, 4
  br i1 %45, label %47, label %46

46:                                               ; preds = %40
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  br label %47

47:                                               ; preds = %46, %40
  %48 = getelementptr inbounds i8, i8* %33, i64 -5
  %49 = load i8, i8* %48, align 1, !tbaa !3
  %50 = icmp eq i8 %49, 0
  br i1 %50, label %52, label %51

51:                                               ; preds = %47
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  br label %52

52:                                               ; preds = %51, %47, %25
  %53 = phi i64 [ %44, %51 ], [ %44, %47 ], [ %35, %25 ]
  %54 = ptrtoint i8* %33 to i64
  %55 = ptrtoint i8* %0 to i64
  %56 = sub i64 %54, %55
  %57 = icmp ugt i64 %53, %56
  br i1 %57, label %58, label %59

58:                                               ; preds = %52
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  br label %59

59:                                               ; preds = %58, %52
  %60 = sub nsw i64 0, %53
  %61 = getelementptr inbounds i8, i8* %33, i64 %60
  %62 = load i8, i8* %61, align 1, !tbaa !3
  %63 = icmp eq i8 %62, 0
  br i1 %63, label %65, label %64

64:                                               ; preds = %59
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  br label %65

65:                                               ; preds = %64, %59
  %66 = load i8, i8* %33, align 1, !tbaa !3
  %67 = icmp eq i8 %66, 0
  br i1 %67, label %69, label %68

68:                                               ; preds = %65
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  br label %69

69:                                               ; preds = %65, %68
  %70 = shl nuw i32 1, %8
  %71 = load i64, i64* %9, align 8
  %72 = trunc i64 %71 to i32
  %73 = and i32 %72, 31
  %74 = shl i32 2, %73
  %75 = add i32 %74, -1
  store i8 -1, i8* %5, align 1, !tbaa !3
  %76 = getelementptr inbounds i8, i8* %0, i64 -2
  %77 = bitcast i8* %76 to i16*
  store i16 0, i16* %77, align 2, !tbaa !6
  %78 = getelementptr inbounds i8, i8* %31, i64 -1
  %79 = ptrtoint i8* %78 to i64
  %80 = xor i64 %54, %79
  %81 = icmp ugt i64 %80, 8191
  br i1 %81, label %82, label %99

82:                                               ; preds = %69
  %83 = load i64, i64* %9, align 8
  %84 = and i64 %83, 31
  %85 = icmp eq i64 %84, 0
  br i1 %85, label %99, label %86

86:                                               ; preds = %82
  %87 = ptrtoint i8* %31 to i64
  %88 = sub i64 0, %87
  %89 = and i64 %88, 4095
  %90 = getelementptr inbounds i8, i8* %31, i64 %89
  %91 = ptrtoint i8* %90 to i64
  %92 = sub i64 %54, %91
  %93 = and i64 %92, -4096
  %94 = icmp eq i64 %93, 0
  br i1 %94, label %99, label %95

95:                                               ; preds = %86
  %96 = tail call i32* @___errno_location() #9
  %97 = load i32, i32* %96, align 4, !tbaa !14
  %98 = tail call i32 @__madvise(i8* noundef nonnull %90, i64 noundef %93, i32 noundef 8) #10
  store i32 %97, i32* %96, align 4, !tbaa !14
  br label %99

99:                                               ; preds = %86, %95, %82, %69
  %100 = getelementptr inbounds %struct.meta, %struct.meta* %4, i64 0, i32 4
  %101 = getelementptr inbounds %struct.meta, %struct.meta* %4, i64 0, i32 3
  br label %102

102:                                              ; preds = %119, %99
  %103 = load volatile i32, i32* %100, align 4, !tbaa !15
  %104 = load volatile i32, i32* %101, align 8, !tbaa !16
  %105 = or i32 %104, %103
  %106 = and i32 %105, %70
  %107 = icmp eq i32 %106, 0
  br i1 %107, label %109, label %108

108:                                              ; preds = %102
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  br label %109

109:                                              ; preds = %108, %102
  %110 = icmp eq i32 %103, 0
  %111 = add i32 %105, %70
  %112 = icmp eq i32 %111, %75
  %113 = select i1 %110, i1 true, i1 %112
  %114 = load volatile i8, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 3), align 1, !tbaa !17
  %115 = icmp eq i8 %114, 0
  br i1 %113, label %122, label %116

116:                                              ; preds = %109
  %117 = add i32 %103, %70
  br i1 %115, label %118, label %119

118:                                              ; preds = %116
  store volatile i32 %117, i32* %100, align 4, !tbaa !15
  br label %133

119:                                              ; preds = %116
  %120 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %100, i32 %103, i32 %117) #8, !srcloc !20
  %121 = icmp eq i32 %120, %103
  br i1 %121, label %133, label %102

122:                                              ; preds = %109
  br i1 %115, label %124, label %123

123:                                              ; preds = %122
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @__malloc_lock, i64 0, i64 0)) #10
  br label %124

124:                                              ; preds = %122, %123
  %125 = tail call fastcc { i8*, i64 } @nontrivial_free(%struct.meta* noundef nonnull %4, i32 noundef %8) #7
  %126 = extractvalue { i8*, i64 } %125, 1
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @__malloc_lock, i64 0, i64 0)) #10
  %127 = icmp eq i64 %126, 0
  br i1 %127, label %133, label %128

128:                                              ; preds = %124
  %129 = extractvalue { i8*, i64 } %125, 0
  %130 = tail call i32* @___errno_location() #9
  %131 = load i32, i32* %130, align 4, !tbaa !14
  %132 = tail call i32 @munmap(i8* noundef %129, i64 noundef %126) #10
  store i32 %131, i32* %130, align 4, !tbaa !14
  br label %133

133:                                              ; preds = %119, %118, %128, %124, %1
  ret void
}

; Function Attrs: inlinehint nounwind optsize strictfp
define internal fastcc %struct.meta* @get_meta(i8* noundef %0) unnamed_addr #1 {
  %2 = ptrtoint i8* %0 to i64
  %3 = and i64 %2, 15
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %6, label %5

5:                                                ; preds = %1
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  br label %6

6:                                                ; preds = %1, %5
  %7 = getelementptr inbounds i8, i8* %0, i64 -2
  %8 = bitcast i8* %7 to i16*
  %9 = load i16, i16* %8, align 2, !tbaa !6
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8* %0, i64 -3
  %12 = load i8, i8* %11, align 1, !tbaa !3
  %13 = and i8 %12, 31
  %14 = zext i8 %13 to i32
  %15 = getelementptr inbounds i8, i8* %0, i64 -4
  %16 = load i8, i8* %15, align 1, !tbaa !3
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %27, label %18

18:                                               ; preds = %6
  %19 = icmp eq i16 %9, 0
  br i1 %19, label %21, label %20

20:                                               ; preds = %18
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  br label %21

21:                                               ; preds = %20, %18
  %22 = getelementptr inbounds i8, i8* %0, i64 -8
  %23 = bitcast i8* %22 to i32*
  %24 = load i32, i32* %23, align 4, !tbaa !14
  %25 = icmp sgt i32 %24, 65535
  br i1 %25, label %27, label %26

26:                                               ; preds = %21
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  br label %27

27:                                               ; preds = %21, %26, %6
  %28 = phi i32 [ %24, %21 ], [ %24, %26 ], [ %10, %6 ]
  %29 = shl nsw i32 %28, 4
  %30 = sext i32 %29 to i64
  %31 = sub nsw i64 0, %30
  %32 = getelementptr inbounds i8, i8* %0, i64 %31
  %33 = getelementptr inbounds i8, i8* %32, i64 -16
  %34 = bitcast i8* %33 to %struct.group*
  %35 = bitcast i8* %33 to %struct.meta**
  %36 = load %struct.meta*, %struct.meta** %35, align 8, !tbaa !21
  %37 = getelementptr inbounds %struct.meta, %struct.meta* %36, i64 0, i32 2
  %38 = load %struct.group*, %struct.group** %37, align 8, !tbaa !8
  %39 = icmp eq %struct.group* %38, %34
  br i1 %39, label %41, label %40

40:                                               ; preds = %27
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  br label %41

41:                                               ; preds = %27, %40
  %42 = getelementptr inbounds %struct.meta, %struct.meta* %36, i64 0, i32 5
  %43 = load i64, i64* %42, align 8
  %44 = trunc i64 %43 to i32
  %45 = and i32 %44, 31
  %46 = icmp ult i32 %45, %14
  br i1 %46, label %47, label %48

47:                                               ; preds = %41
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  br label %48

48:                                               ; preds = %41, %47
  %49 = getelementptr inbounds %struct.meta, %struct.meta* %36, i64 0, i32 3
  %50 = load volatile i32, i32* %49, align 8, !tbaa !16
  %51 = shl nuw i32 1, %14
  %52 = and i32 %50, %51
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %55, label %54

54:                                               ; preds = %48
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  br label %55

55:                                               ; preds = %48, %54
  %56 = getelementptr inbounds %struct.meta, %struct.meta* %36, i64 0, i32 4
  %57 = load volatile i32, i32* %56, align 4, !tbaa !15
  %58 = and i32 %57, %51
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %61, label %60

60:                                               ; preds = %55
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  br label %61

61:                                               ; preds = %60, %55
  %62 = ptrtoint %struct.meta* %36 to i64
  %63 = and i64 %62, -4096
  %64 = inttoptr i64 %63 to %struct.meta_area*
  %65 = getelementptr inbounds %struct.meta_area, %struct.meta_area* %64, i64 0, i32 0
  %66 = load i64, i64* %65, align 4096, !tbaa !22
  %67 = load i64, i64* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 0), align 8, !tbaa !23
  %68 = icmp eq i64 %66, %67
  br i1 %68, label %70, label %69

69:                                               ; preds = %61
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  br label %70

70:                                               ; preds = %69, %61
  %71 = load i64, i64* %42, align 8
  %72 = lshr i64 %71, 6
  %73 = and i64 %72, 63
  %74 = trunc i64 %73 to i32
  %75 = icmp ult i32 %74, 48
  br i1 %75, label %76, label %95

76:                                               ; preds = %70
  %77 = getelementptr inbounds [0 x i16], [0 x i16]* @__malloc_size_classes, i64 0, i64 %73
  %78 = load i16, i16* %77, align 2, !tbaa !6
  %79 = zext i16 %78 to i32
  %80 = mul nuw nsw i32 %79, %14
  %81 = icmp slt i32 %28, %80
  br i1 %81, label %82, label %86

82:                                               ; preds = %76
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  %83 = load i64, i64* %42, align 8
  %84 = lshr i64 %83, 6
  %85 = and i64 %84, 63
  br label %86

86:                                               ; preds = %76, %82
  %87 = phi i64 [ %73, %76 ], [ %85, %82 ]
  %88 = getelementptr inbounds [0 x i16], [0 x i16]* @__malloc_size_classes, i64 0, i64 %87
  %89 = load i16, i16* %88, align 2, !tbaa !6
  %90 = zext i16 %89 to i32
  %91 = add nuw nsw i32 %14, 1
  %92 = mul nuw nsw i32 %91, %90
  %93 = icmp slt i32 %28, %92
  br i1 %93, label %98, label %94

94:                                               ; preds = %86
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  br label %98

95:                                               ; preds = %70
  %96 = icmp eq i32 %74, 63
  br i1 %96, label %98, label %97

97:                                               ; preds = %95
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  br label %98

98:                                               ; preds = %95, %97, %86, %94
  %99 = load i64, i64* %42, align 8
  %100 = icmp ult i64 %99, 4096
  br i1 %100, label %108, label %101

101:                                              ; preds = %98
  %102 = sext i32 %28 to i64
  %103 = lshr i64 %99, 4
  %104 = and i64 %103, 1152921504606846720
  %105 = add nsw i64 %104, -1
  %106 = icmp ult i64 %105, %102
  br i1 %106, label %107, label %108

107:                                              ; preds = %101
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  br label %108

108:                                              ; preds = %101, %107, %98
  ret %struct.meta* %36
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__madvise(i8* noundef, i64 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: nounwind optsize strictfp
define internal fastcc { i8*, i64 } @nontrivial_free(%struct.meta* noundef %0, i32 noundef %1) unnamed_addr #0 {
  %3 = alloca %struct.meta, align 8
  %4 = shl nuw i32 1, %1
  %5 = getelementptr inbounds %struct.meta, %struct.meta* %0, i64 0, i32 5
  %6 = load i64, i64* %5, align 8
  %7 = trunc i64 %6 to i32
  %8 = lshr i32 %7, 6
  %9 = and i32 %8, 63
  %10 = getelementptr inbounds %struct.meta, %struct.meta* %0, i64 0, i32 4
  %11 = load volatile i32, i32* %10, align 4, !tbaa !15
  %12 = getelementptr inbounds %struct.meta, %struct.meta* %0, i64 0, i32 3
  %13 = load volatile i32, i32* %12, align 8, !tbaa !16
  %14 = or i32 %13, %11
  %15 = add i32 %14, %4
  %16 = and i32 %7, 31
  %17 = shl i32 2, %16
  %18 = add i32 %17, -1
  %19 = icmp ne i32 %15, %18
  %20 = and i64 %6, 32
  %21 = icmp eq i64 %20, 0
  %22 = select i1 %19, i1 true, i1 %21
  br i1 %22, label %197, label %23

23:                                               ; preds = %2
  %24 = icmp ugt i32 %9, 47
  br i1 %24, label %69, label %25

25:                                               ; preds = %23
  %26 = and i64 %6, 31
  %27 = icmp ne i64 %26, 0
  %28 = icmp ult i64 %6, 4096
  %29 = or i1 %28, %27
  br i1 %29, label %33, label %30

30:                                               ; preds = %25
  %31 = and i64 %6, -4096
  %32 = add i64 %31, -16
  br label %40

33:                                               ; preds = %25
  %34 = lshr i64 %6, 6
  %35 = and i64 %34, 63
  %36 = getelementptr inbounds [0 x i16], [0 x i16]* @__malloc_size_classes, i64 0, i64 %35
  %37 = load i16, i16* %36, align 2, !tbaa !6
  %38 = zext i16 %37 to i64
  %39 = shl nuw nsw i64 %38, 4
  br label %40

40:                                               ; preds = %33, %30
  %41 = phi i64 [ %39, %33 ], [ %32, %30 ]
  %42 = zext i32 %9 to i64
  %43 = getelementptr inbounds [0 x i16], [0 x i16]* @__malloc_size_classes, i64 0, i64 %42
  %44 = load i16, i16* %43, align 2, !tbaa !6
  %45 = zext i16 %44 to i64
  %46 = shl nuw nsw i64 %45, 4
  %47 = icmp ult i64 %41, %46
  %48 = select i1 %47, i1 true, i1 %28
  br i1 %48, label %69, label %49

49:                                               ; preds = %40
  %50 = getelementptr inbounds %struct.meta, %struct.meta* %0, i64 0, i32 1
  %51 = load %struct.meta*, %struct.meta** %50, align 8, !tbaa !25
  %52 = icmp eq %struct.meta* %51, %0
  br i1 %52, label %53, label %69

53:                                               ; preds = %49
  %54 = add nsw i32 %9, -7
  %55 = icmp ult i32 %54, 32
  br i1 %55, label %56, label %69

56:                                               ; preds = %53
  %57 = zext i32 %54 to i64
  %58 = getelementptr inbounds %struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 14, i64 %57
  %59 = load i8, i8* %58, align 1, !tbaa !3
  %60 = icmp ult i8 %59, 100
  br i1 %60, label %69, label %61

61:                                               ; preds = %56
  %62 = getelementptr inbounds %struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 12, i64 %42
  %63 = load i64, i64* %62, align 8, !tbaa !22
  %64 = mul nuw nsw i64 %26, 9
  %65 = add nuw nsw i64 %64, 9
  %66 = icmp ugt i64 %65, %63
  %67 = icmp ugt i64 %26, 18
  %68 = select i1 %66, i1 true, i1 %67
  br i1 %68, label %197, label %69

69:                                               ; preds = %53, %56, %49, %23, %40, %61
  %70 = getelementptr inbounds %struct.meta, %struct.meta* %0, i64 0, i32 1
  %71 = load %struct.meta*, %struct.meta** %70, align 8, !tbaa !25
  %72 = icmp eq %struct.meta* %71, null
  br i1 %72, label %122, label %73

73:                                               ; preds = %69
  %74 = icmp ult i32 %9, 48
  br i1 %74, label %77, label %75

75:                                               ; preds = %73
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  %76 = load %struct.meta*, %struct.meta** %70, align 8, !tbaa !25
  br label %77

77:                                               ; preds = %75, %73
  %78 = phi %struct.meta* [ %76, %75 ], [ %71, %73 ]
  %79 = zext i32 %9 to i64
  %80 = getelementptr inbounds %struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 11, i64 %79
  %81 = load %struct.meta*, %struct.meta** %80, align 8, !tbaa !21
  %82 = icmp eq %struct.meta* %81, %0
  %83 = icmp eq %struct.meta* %78, %0
  br i1 %83, label %92, label %84

84:                                               ; preds = %77
  %85 = getelementptr inbounds %struct.meta, %struct.meta* %0, i64 0, i32 0
  %86 = load %struct.meta*, %struct.meta** %85, align 8, !tbaa !26
  %87 = getelementptr inbounds %struct.meta, %struct.meta* %86, i64 0, i32 1
  store %struct.meta* %78, %struct.meta** %87, align 8, !tbaa !25
  %88 = load %struct.meta*, %struct.meta** %70, align 8, !tbaa !25
  %89 = getelementptr inbounds %struct.meta, %struct.meta* %88, i64 0, i32 0
  store %struct.meta* %86, %struct.meta** %89, align 8, !tbaa !26
  %90 = load %struct.meta*, %struct.meta** %80, align 8, !tbaa !21
  %91 = icmp eq %struct.meta* %90, %0
  br i1 %91, label %92, label %94

92:                                               ; preds = %84, %77
  %93 = phi %struct.meta* [ %88, %84 ], [ null, %77 ]
  store %struct.meta* %93, %struct.meta** %80, align 8, !tbaa !21
  br label %94

94:                                               ; preds = %84, %92
  %95 = bitcast %struct.meta* %0 to <2 x %struct.meta*>*
  store <2 x %struct.meta*> zeroinitializer, <2 x %struct.meta*>* %95, align 8, !tbaa !21
  br i1 %82, label %96, label %122

96:                                               ; preds = %94
  %97 = load %struct.meta*, %struct.meta** %80, align 8, !tbaa !21
  %98 = icmp eq %struct.meta* %97, null
  br i1 %98, label %122, label %99

99:                                               ; preds = %96
  %100 = getelementptr inbounds %struct.meta, %struct.meta* %97, i64 0, i32 3
  %101 = load volatile i32, i32* %100, align 8, !tbaa !16
  %102 = icmp eq i32 %101, 0
  br i1 %102, label %104, label %103

103:                                              ; preds = %99
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  br label %104

104:                                              ; preds = %103, %99
  %105 = getelementptr inbounds %struct.meta, %struct.meta* %97, i64 0, i32 2
  %106 = load %struct.group*, %struct.group** %105, align 8, !tbaa !8
  %107 = getelementptr inbounds %struct.group, %struct.group* %106, i64 0, i32 1
  %108 = load i8, i8* %107, align 8
  %109 = and i8 %108, 31
  %110 = zext i8 %109 to i32
  %111 = shl i32 2, %110
  %112 = getelementptr inbounds %struct.meta, %struct.meta* %97, i64 0, i32 4
  %113 = sub i32 0, %111
  br label %114

114:                                              ; preds = %114, %104
  %115 = load volatile i32, i32* %112, align 4, !tbaa !15
  %116 = and i32 %115, %113
  %117 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %112, i32 %115, i32 %116) #8, !srcloc !20
  %118 = icmp eq i32 %117, %115
  br i1 %118, label %119, label %114

119:                                              ; preds = %114
  %120 = add i32 %111, -1
  %121 = and i32 %115, %120
  store volatile i32 %121, i32* %100, align 8, !tbaa !16
  br label %122

122:                                              ; preds = %94, %96, %119, %69
  %123 = load i64, i64* %5, align 8
  %124 = trunc i64 %123 to i32
  %125 = lshr i32 %124, 6
  %126 = and i32 %125, 63
  %127 = icmp ult i32 %126, 48
  br i1 %127, label %128, label %136

128:                                              ; preds = %122
  %129 = and i64 %123, 31
  %130 = xor i64 %129, -1
  %131 = zext i32 %126 to i64
  %132 = getelementptr inbounds %struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 12, i64 %131
  %133 = load i64, i64* %132, align 8, !tbaa !22
  %134 = add i64 %133, %130
  store i64 %134, i64* %132, align 8, !tbaa !22
  %135 = load i64, i64* %5, align 8
  br label %136

136:                                              ; preds = %128, %122
  %137 = phi i64 [ %135, %128 ], [ %123, %122 ]
  %138 = icmp ult i64 %137, 4096
  br i1 %138, label %158, label %139

139:                                              ; preds = %136
  %140 = load i8, i8* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 15), align 8, !tbaa !27
  %141 = icmp eq i8 %140, -1
  br i1 %141, label %142, label %143

142:                                              ; preds = %139
  store <16 x i8> zeroinitializer, <16 x i8>* bitcast (i8* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 13, i64 0) to <16 x i8>*), align 8, !tbaa !3
  store <16 x i8> zeroinitializer, <16 x i8>* bitcast (i8* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 13, i64 16) to <16 x i8>*), align 8, !tbaa !3
  br label %145

143:                                              ; preds = %139
  %144 = add nuw i8 %140, 1
  br label %145

145:                                              ; preds = %142, %143
  %146 = phi i8 [ %144, %143 ], [ 1, %142 ]
  store i8 %146, i8* getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 15), align 8, !tbaa !27
  %147 = add nsw i32 %126, -7
  %148 = icmp ult i32 %147, 32
  br i1 %148, label %149, label %152

149:                                              ; preds = %145
  %150 = zext i32 %147 to i64
  %151 = getelementptr inbounds %struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 13, i64 %150
  store i8 %146, i8* %151, align 1, !tbaa !3
  br label %152

152:                                              ; preds = %145, %149
  %153 = getelementptr inbounds %struct.meta, %struct.meta* %0, i64 0, i32 2
  %154 = bitcast %struct.group** %153 to i8**
  %155 = load i8*, i8** %154, align 8, !tbaa !8
  %156 = load i64, i64* %5, align 8
  %157 = and i64 %156, -4096
  br label %172

158:                                              ; preds = %136
  %159 = getelementptr inbounds %struct.meta, %struct.meta* %0, i64 0, i32 2
  %160 = bitcast %struct.group** %159 to i8**
  %161 = load i8*, i8** %160, align 8, !tbaa !8
  %162 = tail call fastcc %struct.meta* @get_meta(i8* noundef %161) #10
  %163 = getelementptr inbounds i8, i8* %161, i64 -3
  %164 = load i8, i8* %163, align 1, !tbaa !3
  %165 = and i8 %164, 31
  %166 = zext i8 %165 to i32
  %167 = load %struct.group*, %struct.group** %159, align 8, !tbaa !8
  %168 = getelementptr inbounds %struct.group, %struct.group* %167, i64 0, i32 0
  store %struct.meta* null, %struct.meta** %168, align 8, !tbaa !21
  %169 = tail call fastcc { i8*, i64 } @nontrivial_free(%struct.meta* noundef %162, i32 noundef %166) #10
  %170 = extractvalue { i8*, i64 } %169, 0
  %171 = extractvalue { i8*, i64 } %169, 1
  br label %172

172:                                              ; preds = %152, %158
  %173 = phi i64 [ %157, %152 ], [ %171, %158 ]
  %174 = phi i8* [ %155, %152 ], [ %170, %158 ]
  %175 = bitcast %struct.meta* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %175)
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(40) %175, i8 0, i64 40, i1 false)
  %176 = bitcast %struct.meta* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %176, i8* nonnull align 8 %175, i64 40, i1 true) #8, !tbaa.struct !28
  %177 = load %struct.meta*, %struct.meta** %70, align 8, !tbaa !25
  %178 = icmp eq %struct.meta* %177, null
  br i1 %178, label %180, label %179

179:                                              ; preds = %172
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  br label %180

180:                                              ; preds = %179, %172
  %181 = getelementptr inbounds %struct.meta, %struct.meta* %0, i64 0, i32 0
  %182 = load %struct.meta*, %struct.meta** %181, align 8, !tbaa !26
  %183 = icmp eq %struct.meta* %182, null
  br i1 %183, label %185, label %184

184:                                              ; preds = %180
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  br label %185

185:                                              ; preds = %184, %180
  %186 = load %struct.meta*, %struct.meta** getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 3), align 8, !tbaa !21
  %187 = icmp eq %struct.meta* %186, null
  br i1 %187, label %194, label %188

188:                                              ; preds = %185
  store %struct.meta* %186, %struct.meta** %70, align 8, !tbaa !25
  %189 = getelementptr inbounds %struct.meta, %struct.meta* %186, i64 0, i32 0
  %190 = load %struct.meta*, %struct.meta** %189, align 8, !tbaa !26
  store %struct.meta* %190, %struct.meta** %181, align 8, !tbaa !26
  %191 = getelementptr inbounds %struct.meta, %struct.meta* %190, i64 0, i32 1
  store %struct.meta* %0, %struct.meta** %191, align 8, !tbaa !25
  %192 = load %struct.meta*, %struct.meta** %70, align 8, !tbaa !25
  %193 = getelementptr inbounds %struct.meta, %struct.meta* %192, i64 0, i32 0
  br label %195

194:                                              ; preds = %185
  store %struct.meta* %0, %struct.meta** %70, align 8, !tbaa !25
  store %struct.meta* %0, %struct.meta** %181, align 8, !tbaa !26
  br label %195

195:                                              ; preds = %188, %194
  %196 = phi %struct.meta** [ getelementptr inbounds (%struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 3), %194 ], [ %193, %188 ]
  store %struct.meta* %0, %struct.meta** %196, align 8, !tbaa !21
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %175)
  br label %230

197:                                              ; preds = %61, %2
  %198 = icmp eq i32 %14, 0
  br i1 %198, label %199, label %229

199:                                              ; preds = %197
  %200 = icmp ult i32 %9, 48
  br i1 %200, label %202, label %201

201:                                              ; preds = %199
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  br label %202

202:                                              ; preds = %201, %199
  %203 = zext i32 %9 to i64
  %204 = getelementptr inbounds %struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 11, i64 %203
  %205 = load %struct.meta*, %struct.meta** %204, align 8, !tbaa !21
  %206 = icmp eq %struct.meta* %205, %0
  br i1 %206, label %229, label %207

207:                                              ; preds = %202
  %208 = getelementptr inbounds %struct.meta, %struct.meta* %0, i64 0, i32 1
  %209 = load %struct.meta*, %struct.meta** %208, align 8, !tbaa !25
  %210 = icmp eq %struct.meta* %209, null
  br i1 %210, label %212, label %211

211:                                              ; preds = %207
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  br label %212

212:                                              ; preds = %211, %207
  %213 = getelementptr inbounds %struct.meta, %struct.meta* %0, i64 0, i32 0
  %214 = load %struct.meta*, %struct.meta** %213, align 8, !tbaa !26
  %215 = icmp eq %struct.meta* %214, null
  br i1 %215, label %217, label %216

216:                                              ; preds = %212
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !13
  br label %217

217:                                              ; preds = %216, %212
  %218 = load %struct.meta*, %struct.meta** %204, align 8, !tbaa !21
  %219 = icmp eq %struct.meta* %218, null
  br i1 %219, label %226, label %220

220:                                              ; preds = %217
  store %struct.meta* %218, %struct.meta** %208, align 8, !tbaa !25
  %221 = getelementptr inbounds %struct.meta, %struct.meta* %218, i64 0, i32 0
  %222 = load %struct.meta*, %struct.meta** %221, align 8, !tbaa !26
  store %struct.meta* %222, %struct.meta** %213, align 8, !tbaa !26
  %223 = getelementptr inbounds %struct.meta, %struct.meta* %222, i64 0, i32 1
  store %struct.meta* %0, %struct.meta** %223, align 8, !tbaa !25
  %224 = load %struct.meta*, %struct.meta** %208, align 8, !tbaa !25
  %225 = getelementptr inbounds %struct.meta, %struct.meta* %224, i64 0, i32 0
  br label %227

226:                                              ; preds = %217
  store %struct.meta* %0, %struct.meta** %208, align 8, !tbaa !25
  store %struct.meta* %0, %struct.meta** %213, align 8, !tbaa !26
  br label %227

227:                                              ; preds = %220, %226
  %228 = phi %struct.meta** [ %204, %226 ], [ %225, %220 ]
  store %struct.meta* %0, %struct.meta** %228, align 8, !tbaa !21
  br label %229

229:                                              ; preds = %197, %227, %202
  tail call void asm sideeffect "lock ; or $1, $0", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %10, i32 %4) #8, !srcloc !29
  br label %230

230:                                              ; preds = %229, %195
  %231 = phi i8* [ %174, %195 ], [ null, %229 ]
  %232 = phi i64 [ %173, %195 ], [ 0, %229 ]
  %233 = insertvalue { i8*, i64 } poison, i8* %231, 0
  %234 = insertvalue { i8*, i64 } %233, i64 %232, 1
  ret { i8*, i64 } %234
}

; Function Attrs: optsize
declare i32 @munmap(i8* noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden void @__lock(i32* noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: optsize
declare hidden void @__unlock(i32* noundef) local_unnamed_addr #3

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #6

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #6

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inlinehint nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #6 = { argmemonly nofree nosync nounwind willreturn }
attributes #7 = { nobuiltin optsize strictfp "no-builtins" }
attributes #8 = { nounwind strictfp }
attributes #9 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #10 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"short", !4, i64 0}
!8 = !{!9, !10, i64 16}
!9 = !{!"meta", !10, i64 0, !10, i64 8, !10, i64 16, !11, i64 24, !11, i64 28, !12, i64 32, !12, i64 32, !12, i64 32, !12, i64 33}
!10 = !{!"any pointer", !4, i64 0}
!11 = !{!"int", !4, i64 0}
!12 = !{!"long", !4, i64 0}
!13 = !{i64 303340}
!14 = !{!11, !11, i64 0}
!15 = !{!9, !11, i64 28}
!16 = !{!9, !11, i64 24}
!17 = !{!18, !4, i64 3}
!18 = !{!"__libc", !4, i64 0, !4, i64 1, !4, i64 2, !4, i64 3, !11, i64 4, !10, i64 8, !10, i64 16, !12, i64 24, !12, i64 32, !12, i64 40, !12, i64 48, !19, i64 56}
!19 = !{!"__locale_struct", !4, i64 0}
!20 = !{i64 301264}
!21 = !{!10, !10, i64 0}
!22 = !{!12, !12, i64 0}
!23 = !{!24, !12, i64 0}
!24 = !{!"malloc_context", !12, i64 0, !11, i64 8, !11, i64 12, !10, i64 16, !10, i64 24, !12, i64 32, !12, i64 40, !12, i64 48, !10, i64 56, !10, i64 64, !10, i64 72, !4, i64 80, !4, i64 464, !4, i64 848, !4, i64 880, !4, i64 912, !12, i64 920}
!25 = !{!9, !10, i64 8}
!26 = !{!9, !10, i64 0}
!27 = !{!24, !4, i64 912}
!28 = !{i64 0, i64 8, !21, i64 8, i64 8, !21, i64 16, i64 8, !21, i64 24, i64 4, !14, i64 28, i64 4, !14, i64 32, i64 8, !22, i64 32, i64 8, !22, i64 32, i64 8, !22, i64 33, i64 8, !22}
!29 = !{i64 302178}
