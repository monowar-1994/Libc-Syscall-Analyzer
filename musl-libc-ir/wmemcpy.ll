; ModuleID = 'src/string/wmemcpy.c'
source_filename = "src/string/wmemcpy.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind strictfp
define i32* @wmemcpy(i32* noalias noundef returned writeonly %0, i32* noalias nocapture noundef readonly %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = icmp eq i64 %2, 0
  br i1 %4, label %102, label %5

5:                                                ; preds = %3
  %6 = icmp ult i64 %2, 8
  br i1 %6, label %89, label %7

7:                                                ; preds = %5
  %8 = and i64 %2, -8
  %9 = getelementptr i32, i32* %0, i64 %8
  %10 = and i64 %2, 7
  %11 = getelementptr i32, i32* %1, i64 %8
  %12 = add i64 %8, -8
  %13 = lshr exact i64 %12, 3
  %14 = add nuw nsw i64 %13, 1
  %15 = and i64 %14, 3
  %16 = icmp ult i64 %12, 24
  br i1 %16, label %68, label %17

17:                                               ; preds = %7
  %18 = and i64 %14, 4611686018427387900
  br label %19

19:                                               ; preds = %19, %17
  %20 = phi i64 [ 0, %17 ], [ %65, %19 ]
  %21 = phi i64 [ 0, %17 ], [ %66, %19 ]
  %22 = getelementptr i32, i32* %0, i64 %20
  %23 = getelementptr i32, i32* %1, i64 %20
  %24 = bitcast i32* %23 to <4 x i32>*
  %25 = load <4 x i32>, <4 x i32>* %24, align 4, !tbaa !3
  %26 = getelementptr i32, i32* %23, i64 4
  %27 = bitcast i32* %26 to <4 x i32>*
  %28 = load <4 x i32>, <4 x i32>* %27, align 4, !tbaa !3
  %29 = bitcast i32* %22 to <4 x i32>*
  store <4 x i32> %25, <4 x i32>* %29, align 4, !tbaa !3
  %30 = getelementptr i32, i32* %22, i64 4
  %31 = bitcast i32* %30 to <4 x i32>*
  store <4 x i32> %28, <4 x i32>* %31, align 4, !tbaa !3
  %32 = or i64 %20, 8
  %33 = getelementptr i32, i32* %0, i64 %32
  %34 = getelementptr i32, i32* %1, i64 %32
  %35 = bitcast i32* %34 to <4 x i32>*
  %36 = load <4 x i32>, <4 x i32>* %35, align 4, !tbaa !3
  %37 = getelementptr i32, i32* %34, i64 4
  %38 = bitcast i32* %37 to <4 x i32>*
  %39 = load <4 x i32>, <4 x i32>* %38, align 4, !tbaa !3
  %40 = bitcast i32* %33 to <4 x i32>*
  store <4 x i32> %36, <4 x i32>* %40, align 4, !tbaa !3
  %41 = getelementptr i32, i32* %33, i64 4
  %42 = bitcast i32* %41 to <4 x i32>*
  store <4 x i32> %39, <4 x i32>* %42, align 4, !tbaa !3
  %43 = or i64 %20, 16
  %44 = getelementptr i32, i32* %0, i64 %43
  %45 = getelementptr i32, i32* %1, i64 %43
  %46 = bitcast i32* %45 to <4 x i32>*
  %47 = load <4 x i32>, <4 x i32>* %46, align 4, !tbaa !3
  %48 = getelementptr i32, i32* %45, i64 4
  %49 = bitcast i32* %48 to <4 x i32>*
  %50 = load <4 x i32>, <4 x i32>* %49, align 4, !tbaa !3
  %51 = bitcast i32* %44 to <4 x i32>*
  store <4 x i32> %47, <4 x i32>* %51, align 4, !tbaa !3
  %52 = getelementptr i32, i32* %44, i64 4
  %53 = bitcast i32* %52 to <4 x i32>*
  store <4 x i32> %50, <4 x i32>* %53, align 4, !tbaa !3
  %54 = or i64 %20, 24
  %55 = getelementptr i32, i32* %0, i64 %54
  %56 = getelementptr i32, i32* %1, i64 %54
  %57 = bitcast i32* %56 to <4 x i32>*
  %58 = load <4 x i32>, <4 x i32>* %57, align 4, !tbaa !3
  %59 = getelementptr i32, i32* %56, i64 4
  %60 = bitcast i32* %59 to <4 x i32>*
  %61 = load <4 x i32>, <4 x i32>* %60, align 4, !tbaa !3
  %62 = bitcast i32* %55 to <4 x i32>*
  store <4 x i32> %58, <4 x i32>* %62, align 4, !tbaa !3
  %63 = getelementptr i32, i32* %55, i64 4
  %64 = bitcast i32* %63 to <4 x i32>*
  store <4 x i32> %61, <4 x i32>* %64, align 4, !tbaa !3
  %65 = add nuw i64 %20, 32
  %66 = add i64 %21, 4
  %67 = icmp eq i64 %66, %18
  br i1 %67, label %68, label %19, !llvm.loop !7

68:                                               ; preds = %19, %7
  %69 = phi i64 [ 0, %7 ], [ %65, %19 ]
  %70 = icmp eq i64 %15, 0
  br i1 %70, label %87, label %71

71:                                               ; preds = %68, %71
  %72 = phi i64 [ %84, %71 ], [ %69, %68 ]
  %73 = phi i64 [ %85, %71 ], [ 0, %68 ]
  %74 = getelementptr i32, i32* %0, i64 %72
  %75 = getelementptr i32, i32* %1, i64 %72
  %76 = bitcast i32* %75 to <4 x i32>*
  %77 = load <4 x i32>, <4 x i32>* %76, align 4, !tbaa !3
  %78 = getelementptr i32, i32* %75, i64 4
  %79 = bitcast i32* %78 to <4 x i32>*
  %80 = load <4 x i32>, <4 x i32>* %79, align 4, !tbaa !3
  %81 = bitcast i32* %74 to <4 x i32>*
  store <4 x i32> %77, <4 x i32>* %81, align 4, !tbaa !3
  %82 = getelementptr i32, i32* %74, i64 4
  %83 = bitcast i32* %82 to <4 x i32>*
  store <4 x i32> %80, <4 x i32>* %83, align 4, !tbaa !3
  %84 = add nuw i64 %72, 8
  %85 = add i64 %73, 1
  %86 = icmp eq i64 %85, %15
  br i1 %86, label %87, label %71, !llvm.loop !9

87:                                               ; preds = %71, %68
  %88 = icmp eq i64 %8, %2
  br i1 %88, label %102, label %89

89:                                               ; preds = %5, %87
  %90 = phi i32* [ %0, %5 ], [ %9, %87 ]
  %91 = phi i64 [ %2, %5 ], [ %10, %87 ]
  %92 = phi i32* [ %1, %5 ], [ %11, %87 ]
  br label %93

93:                                               ; preds = %89, %93
  %94 = phi i32* [ %100, %93 ], [ %90, %89 ]
  %95 = phi i64 [ %97, %93 ], [ %91, %89 ]
  %96 = phi i32* [ %98, %93 ], [ %92, %89 ]
  %97 = add i64 %95, -1
  %98 = getelementptr inbounds i32, i32* %96, i64 1
  %99 = load i32, i32* %96, align 4, !tbaa !3
  %100 = getelementptr inbounds i32, i32* %94, i64 1
  store i32 %99, i32* %94, align 4, !tbaa !3
  %101 = icmp eq i64 %97, 0
  br i1 %101, label %102, label %93, !llvm.loop !11

102:                                              ; preds = %93, %87, %3
  ret i32* %0
}

attributes #0 = { nofree norecurse nosync nounwind strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
