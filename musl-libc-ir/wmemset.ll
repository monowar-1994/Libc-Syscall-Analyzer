; ModuleID = 'src/string/wmemset.c'
source_filename = "src/string/wmemset.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind strictfp writeonly
define i32* @wmemset(i32* noundef returned writeonly %0, i32 noundef %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = icmp eq i64 %2, 0
  br i1 %4, label %91, label %5

5:                                                ; preds = %3
  %6 = icmp ult i64 %2, 8
  br i1 %6, label %82, label %7

7:                                                ; preds = %5
  %8 = and i64 %2, -8
  %9 = getelementptr i32, i32* %0, i64 %8
  %10 = and i64 %2, 7
  %11 = insertelement <4 x i32> poison, i32 %1, i64 0
  %12 = shufflevector <4 x i32> %11, <4 x i32> poison, <4 x i32> zeroinitializer
  %13 = insertelement <4 x i32> poison, i32 %1, i64 0
  %14 = shufflevector <4 x i32> %13, <4 x i32> poison, <4 x i32> zeroinitializer
  %15 = add i64 %8, -8
  %16 = lshr exact i64 %15, 3
  %17 = add nuw nsw i64 %16, 1
  %18 = and i64 %17, 7
  %19 = icmp ult i64 %15, 56
  br i1 %19, label %67, label %20

20:                                               ; preds = %7
  %21 = and i64 %17, 4611686018427387896
  br label %22

22:                                               ; preds = %22, %20
  %23 = phi i64 [ 0, %20 ], [ %64, %22 ]
  %24 = phi i64 [ 0, %20 ], [ %65, %22 ]
  %25 = getelementptr i32, i32* %0, i64 %23
  %26 = bitcast i32* %25 to <4 x i32>*
  store <4 x i32> %12, <4 x i32>* %26, align 4, !tbaa !3
  %27 = getelementptr i32, i32* %25, i64 4
  %28 = bitcast i32* %27 to <4 x i32>*
  store <4 x i32> %14, <4 x i32>* %28, align 4, !tbaa !3
  %29 = or i64 %23, 8
  %30 = getelementptr i32, i32* %0, i64 %29
  %31 = bitcast i32* %30 to <4 x i32>*
  store <4 x i32> %12, <4 x i32>* %31, align 4, !tbaa !3
  %32 = getelementptr i32, i32* %30, i64 4
  %33 = bitcast i32* %32 to <4 x i32>*
  store <4 x i32> %14, <4 x i32>* %33, align 4, !tbaa !3
  %34 = or i64 %23, 16
  %35 = getelementptr i32, i32* %0, i64 %34
  %36 = bitcast i32* %35 to <4 x i32>*
  store <4 x i32> %12, <4 x i32>* %36, align 4, !tbaa !3
  %37 = getelementptr i32, i32* %35, i64 4
  %38 = bitcast i32* %37 to <4 x i32>*
  store <4 x i32> %14, <4 x i32>* %38, align 4, !tbaa !3
  %39 = or i64 %23, 24
  %40 = getelementptr i32, i32* %0, i64 %39
  %41 = bitcast i32* %40 to <4 x i32>*
  store <4 x i32> %12, <4 x i32>* %41, align 4, !tbaa !3
  %42 = getelementptr i32, i32* %40, i64 4
  %43 = bitcast i32* %42 to <4 x i32>*
  store <4 x i32> %14, <4 x i32>* %43, align 4, !tbaa !3
  %44 = or i64 %23, 32
  %45 = getelementptr i32, i32* %0, i64 %44
  %46 = bitcast i32* %45 to <4 x i32>*
  store <4 x i32> %12, <4 x i32>* %46, align 4, !tbaa !3
  %47 = getelementptr i32, i32* %45, i64 4
  %48 = bitcast i32* %47 to <4 x i32>*
  store <4 x i32> %14, <4 x i32>* %48, align 4, !tbaa !3
  %49 = or i64 %23, 40
  %50 = getelementptr i32, i32* %0, i64 %49
  %51 = bitcast i32* %50 to <4 x i32>*
  store <4 x i32> %12, <4 x i32>* %51, align 4, !tbaa !3
  %52 = getelementptr i32, i32* %50, i64 4
  %53 = bitcast i32* %52 to <4 x i32>*
  store <4 x i32> %14, <4 x i32>* %53, align 4, !tbaa !3
  %54 = or i64 %23, 48
  %55 = getelementptr i32, i32* %0, i64 %54
  %56 = bitcast i32* %55 to <4 x i32>*
  store <4 x i32> %12, <4 x i32>* %56, align 4, !tbaa !3
  %57 = getelementptr i32, i32* %55, i64 4
  %58 = bitcast i32* %57 to <4 x i32>*
  store <4 x i32> %14, <4 x i32>* %58, align 4, !tbaa !3
  %59 = or i64 %23, 56
  %60 = getelementptr i32, i32* %0, i64 %59
  %61 = bitcast i32* %60 to <4 x i32>*
  store <4 x i32> %12, <4 x i32>* %61, align 4, !tbaa !3
  %62 = getelementptr i32, i32* %60, i64 4
  %63 = bitcast i32* %62 to <4 x i32>*
  store <4 x i32> %14, <4 x i32>* %63, align 4, !tbaa !3
  %64 = add nuw i64 %23, 64
  %65 = add nuw i64 %24, 8
  %66 = icmp eq i64 %65, %21
  br i1 %66, label %67, label %22, !llvm.loop !7

67:                                               ; preds = %22, %7
  %68 = phi i64 [ 0, %7 ], [ %64, %22 ]
  %69 = icmp eq i64 %18, 0
  br i1 %69, label %80, label %70

70:                                               ; preds = %67, %70
  %71 = phi i64 [ %77, %70 ], [ %68, %67 ]
  %72 = phi i64 [ %78, %70 ], [ 0, %67 ]
  %73 = getelementptr i32, i32* %0, i64 %71
  %74 = bitcast i32* %73 to <4 x i32>*
  store <4 x i32> %12, <4 x i32>* %74, align 4, !tbaa !3
  %75 = getelementptr i32, i32* %73, i64 4
  %76 = bitcast i32* %75 to <4 x i32>*
  store <4 x i32> %14, <4 x i32>* %76, align 4, !tbaa !3
  %77 = add nuw i64 %71, 8
  %78 = add i64 %72, 1
  %79 = icmp eq i64 %78, %18
  br i1 %79, label %80, label %70, !llvm.loop !9

80:                                               ; preds = %70, %67
  %81 = icmp eq i64 %8, %2
  br i1 %81, label %91, label %82

82:                                               ; preds = %5, %80
  %83 = phi i32* [ %0, %5 ], [ %9, %80 ]
  %84 = phi i64 [ %2, %5 ], [ %10, %80 ]
  br label %85

85:                                               ; preds = %82, %85
  %86 = phi i32* [ %89, %85 ], [ %83, %82 ]
  %87 = phi i64 [ %88, %85 ], [ %84, %82 ]
  %88 = add i64 %87, -1
  %89 = getelementptr inbounds i32, i32* %86, i64 1
  store i32 %1, i32* %86, align 4, !tbaa !3
  %90 = icmp eq i64 %88, 0
  br i1 %90, label %91, label %85, !llvm.loop !11

91:                                               ; preds = %85, %80, %3
  ret i32* %0
}

attributes #0 = { nofree norecurse nosync nounwind strictfp writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.isvectorized", i32 1}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = distinct !{!11, !12, !8}
!12 = !{!"llvm.loop.unroll.runtime.disable"}
