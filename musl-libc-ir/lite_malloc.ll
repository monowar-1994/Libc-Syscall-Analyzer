; ModuleID = 'src/malloc/lite_malloc.c'
source_filename = "src/malloc/lite_malloc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque

@lock = internal global [1 x i32] zeroinitializer, align 4
@__bump_lockptr = hidden local_unnamed_addr constant i32* getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0), align 8
@__simple_malloc.brk = internal unnamed_addr global i64 0, align 8
@__simple_malloc.cur = internal unnamed_addr global i64 0, align 8
@__simple_malloc.end = internal unnamed_addr global i64 0, align 8
@__simple_malloc.mmap_step = internal unnamed_addr global i32 0, align 4
@__libc = external hidden local_unnamed_addr global %struct.__libc, align 8

@__libc_malloc_impl = weak hidden alias i8* (i64), i8* (i64)* @__simple_malloc
@malloc = weak alias i8* (i64), i8* (i64)* @default_malloc

; Function Attrs: nounwind strictfp
define internal i8* @__simple_malloc(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = icmp slt i64 %0, 0
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  %5 = tail call i32* @___errno_location() #4
  store i32 12, i32* %5, align 4, !tbaa !3
  br label %112

6:                                                ; preds = %1
  %7 = icmp eq i64 %0, 0
  %8 = select i1 %7, i64 1, i64 %0
  %9 = icmp ugt i64 %8, 1
  br i1 %9, label %10, label %17

10:                                               ; preds = %6
  %11 = icmp eq i64 %8, 2
  br i1 %11, label %17, label %12

12:                                               ; preds = %10
  %13 = icmp ugt i64 %8, 4
  br i1 %13, label %14, label %17

14:                                               ; preds = %12
  %15 = icmp ugt i64 %8, 8
  %16 = select i1 %15, i64 15, i64 7
  br label %17

17:                                               ; preds = %14, %12, %10, %6
  %18 = phi i64 [ 0, %6 ], [ 1, %10 ], [ 3, %12 ], [ %16, %14 ]
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #5
  %19 = load i64, i64* @__simple_malloc.cur, align 8, !tbaa !7
  %20 = sub i64 0, %19
  %21 = and i64 %18, %20
  %22 = add i64 %21, %19
  store i64 %22, i64* @__simple_malloc.cur, align 8, !tbaa !7
  %23 = load i64, i64* @__simple_malloc.end, align 8, !tbaa !7
  %24 = sub i64 %23, %22
  %25 = icmp ugt i64 %8, %24
  br i1 %25, label %26, label %108

26:                                               ; preds = %17
  %27 = add i64 %8, 4095
  %28 = sub i64 %27, %24
  %29 = and i64 %28, -4096
  %30 = icmp eq i64 %22, 0
  br i1 %30, label %33, label %31

31:                                               ; preds = %26
  %32 = load i64, i64* @__simple_malloc.brk, align 8, !tbaa !7
  br label %38

33:                                               ; preds = %26
  %34 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 12, i64 0) #6, !srcloc !9
  %35 = sub i64 0, %34
  %36 = and i64 %35, 4095
  %37 = add i64 %36, %34
  store i64 %37, i64* @__simple_malloc.brk, align 8, !tbaa !7
  store i64 %37, i64* @__simple_malloc.end, align 8, !tbaa !7
  store i64 %37, i64* @__simple_malloc.cur, align 8, !tbaa !7
  br label %38

38:                                               ; preds = %31, %33
  %39 = phi i64 [ %23, %31 ], [ %37, %33 ]
  %40 = phi i64 [ %32, %31 ], [ %37, %33 ]
  %41 = icmp eq i64 %40, %39
  %42 = xor i64 %40, -1
  %43 = icmp ult i64 %29, %42
  %44 = select i1 %41, i1 %43, i1 false
  br i1 %44, label %45, label %74

45:                                               ; preds = %38
  %46 = add i64 %39, %29
  %47 = bitcast i64* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %47) #6
  %48 = load i64*, i64** getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 5), align 8, !tbaa !10
  %49 = ptrtoint i64* %48 to i64
  %50 = icmp ugt i64* %48, inttoptr (i64 8388608 to i64*)
  %51 = add i64 %49, -8388608
  %52 = select i1 %50, i64 %51, i64 0
  %53 = icmp ult i64 %52, %46
  %54 = icmp ult i64 %39, %49
  %55 = select i1 %53, i1 %54, i1 false
  br i1 %55, label %56, label %57

56:                                               ; preds = %45
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %47) #6
  br label %74

57:                                               ; preds = %45
  %58 = ptrtoint i64* %2 to i64
  %59 = icmp ugt i64* %2, inttoptr (i64 8388608 to i64*)
  %60 = add i64 %58, -8388608
  %61 = select i1 %59, i64 %60, i64 0
  %62 = icmp uge i64 %61, %46
  %63 = icmp uge i64 %39, %58
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %47) #6
  %64 = or i1 %63, %62
  br i1 %64, label %65, label %74

65:                                               ; preds = %57
  %66 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 12, i64 %46) #6, !srcloc !9
  %67 = load i64, i64* @__simple_malloc.brk, align 8, !tbaa !7
  %68 = add i64 %67, %29
  %69 = icmp eq i64 %66, %68
  br i1 %69, label %70, label %74

70:                                               ; preds = %65
  %71 = load i64, i64* @__simple_malloc.end, align 8, !tbaa !7
  %72 = add i64 %71, %29
  store i64 %72, i64* @__simple_malloc.end, align 8, !tbaa !7
  store i64 %72, i64* @__simple_malloc.brk, align 8, !tbaa !7
  %73 = load i64, i64* @__simple_malloc.cur, align 8, !tbaa !7
  br label %108

74:                                               ; preds = %56, %65, %57, %38
  %75 = and i64 %27, -4096
  %76 = sub i64 %75, %8
  %77 = lshr exact i64 %75, 3
  %78 = icmp ugt i64 %76, %77
  br i1 %78, label %79, label %95

79:                                               ; preds = %74
  %80 = load i32, i32* @__simple_malloc.mmap_step, align 4, !tbaa !3
  %81 = lshr i32 %80, 1
  %82 = shl i32 4096, %81
  %83 = sext i32 %82 to i64
  %84 = sub i64 %83, %8
  %85 = load i64, i64* @__simple_malloc.end, align 8, !tbaa !7
  %86 = load i64, i64* @__simple_malloc.cur, align 8, !tbaa !7
  %87 = sub i64 %85, %86
  %88 = icmp ugt i64 %84, %87
  br i1 %88, label %89, label %95

89:                                               ; preds = %79
  %90 = icmp ult i64 %75, %83
  br i1 %90, label %91, label %97

91:                                               ; preds = %89
  %92 = icmp ult i32 %80, 12
  br i1 %92, label %93, label %97

93:                                               ; preds = %91
  %94 = add nuw nsw i32 %80, 1
  store i32 %94, i32* @__simple_malloc.mmap_step, align 4, !tbaa !3
  br label %97

95:                                               ; preds = %74, %79
  %96 = call i8* @__mmap(i8* noundef null, i64 noundef %75, i32 noundef 3, i32 noundef 34, i32 noundef -1, i64 noundef 0) #5
  br label %104

97:                                               ; preds = %91, %93, %89
  %98 = phi i64 [ %83, %93 ], [ %83, %91 ], [ %75, %89 ]
  %99 = call i8* @__mmap(i8* noundef null, i64 noundef %98, i32 noundef 3, i32 noundef 34, i32 noundef -1, i64 noundef 0) #5
  %100 = icmp eq i8* %99, inttoptr (i64 -1 to i8*)
  br i1 %100, label %104, label %101

101:                                              ; preds = %97
  %102 = ptrtoint i8* %99 to i64
  %103 = add i64 %98, %102
  store i64 %103, i64* @__simple_malloc.end, align 8, !tbaa !7
  br label %108

104:                                              ; preds = %95, %97
  %105 = phi i8* [ %96, %95 ], [ %99, %97 ]
  call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #5
  %106 = icmp eq i8* %105, inttoptr (i64 -1 to i8*)
  %107 = select i1 %106, i8* null, i8* %105
  br label %112

108:                                              ; preds = %70, %101, %17
  %109 = phi i64 [ %73, %70 ], [ %102, %101 ], [ %22, %17 ]
  %110 = inttoptr i64 %109 to i8*
  %111 = add i64 %109, %8
  store i64 %111, i64* @__simple_malloc.cur, align 8, !tbaa !7
  call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #5
  br label %112

112:                                              ; preds = %104, %108, %4
  %113 = phi i8* [ null, %4 ], [ %110, %108 ], [ %107, %104 ]
  ret i8* %113
}

; Function Attrs: nounwind strictfp
define hidden i8* @__libc_malloc(i64 noundef %0) local_unnamed_addr #0 {
  %2 = tail call i8* @__libc_malloc_impl(i64 noundef %0) #5
  ret i8* %2
}

; Function Attrs: nounwind strictfp
define internal i8* @default_malloc(i64 noundef %0) #0 {
  %2 = tail call i8* @__libc_malloc_impl(i64 noundef %0) #5
  ret i8* %2
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

declare hidden void @__lock(i32* noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

declare hidden i8* @__mmap(i8* noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef) local_unnamed_addr #3

declare hidden void @__unlock(i32* noundef) local_unnamed_addr #3

attributes #0 = { nounwind strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nobuiltin nounwind readnone strictfp willreturn "no-builtins" }
attributes #5 = { nobuiltin nounwind strictfp "no-builtins" }
attributes #6 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"long", !5, i64 0}
!9 = !{i64 135741}
!10 = !{!11, !12, i64 8}
!11 = !{!"__libc", !5, i64 0, !5, i64 1, !5, i64 2, !5, i64 3, !4, i64 4, !12, i64 8, !12, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !13, i64 56}
!12 = !{!"any pointer", !5, i64 0}
!13 = !{!"__locale_struct", !5, i64 0}
