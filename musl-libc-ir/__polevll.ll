; ModuleID = 'src/math/__polevll.c'
source_filename = "src/math/__polevll.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nosync nounwind optsize strictfp
define hidden x86_fp80 @__polevll(x86_fp80 noundef %0, x86_fp80* nocapture noundef readonly %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = load x86_fp80, x86_fp80* %1, align 16, !tbaa !3
  br label %5

5:                                                ; preds = %5, %3
  %6 = phi i32 [ %2, %3 ], [ %12, %5 ]
  %7 = phi x86_fp80* [ %1, %3 ], [ %9, %5 ]
  %8 = phi x86_fp80 [ %4, %3 ], [ %11, %5 ]
  %9 = getelementptr inbounds x86_fp80, x86_fp80* %7, i64 1
  %10 = load x86_fp80, x86_fp80* %9, align 16, !tbaa !3
  %11 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %8, x86_fp80 %0, x86_fp80 %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %12 = add nsw i32 %6, -1
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %5

14:                                               ; preds = %5
  ret x86_fp80 %11
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind optsize strictfp
define hidden x86_fp80 @__p1evll(x86_fp80 noundef %0, x86_fp80* nocapture noundef readonly %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = add nsw i32 %2, -1
  %5 = load x86_fp80, x86_fp80* %1, align 16, !tbaa !3
  %6 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %0, x86_fp80 %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %7

7:                                                ; preds = %7, %3
  %8 = phi i32 [ %4, %3 ], [ %14, %7 ]
  %9 = phi x86_fp80* [ %1, %3 ], [ %11, %7 ]
  %10 = phi x86_fp80 [ %6, %3 ], [ %13, %7 ]
  %11 = getelementptr inbounds x86_fp80, x86_fp80* %9, i64 1
  %12 = load x86_fp80, x86_fp80* %11, align 16, !tbaa !3
  %13 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %10, x86_fp80 %0, x86_fp80 %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %14 = add nsw i32 %8, -1
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %7

16:                                               ; preds = %7
  ret x86_fp80 %13
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #1

attributes #0 = { nofree nosync nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"long double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
