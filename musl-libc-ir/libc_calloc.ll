; ModuleID = 'src/malloc/libc_calloc.c'
source_filename = "src/malloc/libc_calloc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__malloc_replaced = external hidden local_unnamed_addr global i32, align 4

@__malloc_allzerop = weak hidden alias i32 (i8*), i32 (i8*)* @allzerop

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone strictfp willreturn
define internal i32 @allzerop(i8* nocapture noundef readnone %0) #0 {
  ret i32 0
}

; Function Attrs: nounwind strictfp
define hidden i8* @__libc_calloc(i64 noundef %0, i64 noundef %1) local_unnamed_addr #1 {
  %3 = icmp eq i64 %1, 0
  br i1 %3, label %9, label %4

4:                                                ; preds = %2
  %5 = tail call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %1, i64 %0)
  %6 = extractvalue { i64, i1 } %5, 1
  br i1 %6, label %7, label %9

7:                                                ; preds = %4
  %8 = tail call i32* @___errno_location() #5
  store i32 12, i32* %8, align 4, !tbaa !3
  br label %94

9:                                                ; preds = %4, %2
  %10 = mul i64 %1, %0
  %11 = tail call i8* @__libc_malloc(i64 noundef %10) #6
  %12 = icmp eq i8* %11, null
  br i1 %12, label %94, label %13

13:                                               ; preds = %9
  %14 = load i32, i32* @__malloc_replaced, align 4, !tbaa !3
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %19

16:                                               ; preds = %13
  %17 = tail call i32 @__malloc_allzerop(i8* noundef nonnull %11) #6
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %94

19:                                               ; preds = %16, %13
  %20 = icmp ult i64 %10, 4096
  br i1 %20, label %91, label %21

21:                                               ; preds = %19
  %22 = getelementptr inbounds i8, i8* %11, i64 %10
  %23 = ptrtoint i8* %22 to i64
  %24 = and i64 %23, 4095
  %25 = sub nsw i64 0, %24
  %26 = getelementptr inbounds i8, i8* %22, i64 %25
  %27 = tail call i8* @memset(i8* noundef nonnull %26, i32 noundef 0, i64 noundef %24) #6
  %28 = ptrtoint i8* %27 to i64
  %29 = ptrtoint i8* %11 to i64
  %30 = sub i64 %28, %29
  %31 = icmp ult i64 %30, 4096
  br i1 %31, label %91, label %32

32:                                               ; preds = %21, %82
  %33 = phi i8* [ %87, %82 ], [ %27, %21 ]
  %34 = getelementptr i8, i8* %33, i64 -4096
  br label %35

35:                                               ; preds = %73, %32
  %36 = phi i64 [ 4096, %32 ], [ %74, %73 ]
  %37 = phi i8* [ %33, %32 ], [ %68, %73 ]
  %38 = getelementptr inbounds i8, i8* %37, i64 -8
  %39 = bitcast i8* %38 to i64*
  %40 = load i64, i64* %39, align 8, !tbaa !7
  %41 = getelementptr inbounds i8, i8* %37, i64 -16
  %42 = bitcast i8* %41 to i64*
  %43 = load i64, i64* %42, align 8, !tbaa !7
  %44 = or i64 %43, %40
  %45 = icmp eq i64 %44, 0
  br i1 %45, label %46, label %82

46:                                               ; preds = %35
  %47 = getelementptr inbounds i8, i8* %37, i64 -24
  %48 = bitcast i8* %47 to i64*
  %49 = load i64, i64* %48, align 8, !tbaa !7
  %50 = getelementptr inbounds i8, i8* %37, i64 -32
  %51 = bitcast i8* %50 to i64*
  %52 = load i64, i64* %51, align 8, !tbaa !7
  %53 = or i64 %52, %49
  %54 = icmp eq i64 %53, 0
  br i1 %54, label %55, label %80

55:                                               ; preds = %46
  %56 = getelementptr inbounds i8, i8* %37, i64 -40
  %57 = bitcast i8* %56 to i64*
  %58 = load i64, i64* %57, align 8, !tbaa !7
  %59 = getelementptr inbounds i8, i8* %37, i64 -48
  %60 = bitcast i8* %59 to i64*
  %61 = load i64, i64* %60, align 8, !tbaa !7
  %62 = or i64 %61, %58
  %63 = icmp eq i64 %62, 0
  br i1 %63, label %64, label %78

64:                                               ; preds = %55
  %65 = getelementptr inbounds i8, i8* %37, i64 -56
  %66 = bitcast i8* %65 to i64*
  %67 = load i64, i64* %66, align 8, !tbaa !7
  %68 = getelementptr inbounds i8, i8* %37, i64 -64
  %69 = bitcast i8* %68 to i64*
  %70 = load i64, i64* %69, align 8, !tbaa !7
  %71 = or i64 %70, %67
  %72 = icmp eq i64 %71, 0
  br i1 %72, label %73, label %76

73:                                               ; preds = %64
  %74 = add nsw i64 %36, -64
  %75 = icmp eq i64 %74, 0
  br i1 %75, label %82, label %35

76:                                               ; preds = %64
  %77 = add nsw i64 %36, -48
  br label %82

78:                                               ; preds = %55
  %79 = add nsw i64 %36, -32
  br label %82

80:                                               ; preds = %46
  %81 = add nsw i64 %36, -16
  br label %82

82:                                               ; preds = %35, %73, %80, %78, %76
  %83 = phi i8* [ %59, %76 ], [ %50, %78 ], [ %41, %80 ], [ %34, %73 ], [ %37, %35 ]
  %84 = phi i64 [ %77, %76 ], [ %79, %78 ], [ %81, %80 ], [ 0, %73 ], [ %36, %35 ]
  %85 = sub i64 0, %84
  %86 = getelementptr inbounds i8, i8* %83, i64 %85
  %87 = tail call i8* @memset(i8* noundef %86, i32 noundef 0, i64 noundef %84) #6
  %88 = ptrtoint i8* %87 to i64
  %89 = sub i64 %88, %29
  %90 = icmp ult i64 %89, 4096
  br i1 %90, label %91, label %32

91:                                               ; preds = %82, %19, %21
  %92 = phi i64 [ %10, %19 ], [ %30, %21 ], [ %89, %82 ]
  %93 = tail call i8* @memset(i8* noundef nonnull %11, i32 noundef 0, i64 noundef %92) #6
  br label %94

94:                                               ; preds = %91, %16, %9, %7
  %95 = phi i8* [ null, %7 ], [ %93, %91 ], [ %11, %16 ], [ null, %9 ]
  ret i8* %95
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

declare hidden i8* @__libc_malloc(i64 noundef) local_unnamed_addr #3

declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #4

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree nosync nounwind readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { nobuiltin nounwind readnone strictfp willreturn "no-builtins" }
attributes #6 = { nobuiltin nounwind strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!5, !5, i64 0}
