; ModuleID = 'src/complex/cprojl.c'
source_filename = "src/complex/cprojl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define { x86_fp80, x86_fp80 } @cprojl({ x86_fp80, x86_fp80 }* nocapture noundef readonly byval({ x86_fp80, x86_fp80 }) align 16 %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %0, i64 0, i32 0
  %3 = load x86_fp80, x86_fp80* %2, align 16
  %4 = tail call i32 @__fpclassifyl(x86_fp80 noundef %3) #3
  %5 = icmp eq i32 %4, 1
  %6 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %0, i64 0, i32 1
  %7 = load x86_fp80, x86_fp80* %6, align 16
  br i1 %5, label %11, label %8

8:                                                ; preds = %1
  %9 = tail call i32 @__fpclassifyl(x86_fp80 noundef %7) #3
  %10 = icmp eq i32 %9, 1
  br i1 %10, label %11, label %15

11:                                               ; preds = %1, %8
  %12 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float 0x7FF0000000000000, metadata !"fpexcept.ignore") #4
  %13 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #4
  %14 = tail call x86_fp80 @copysignl(x86_fp80 noundef %13, x86_fp80 noundef %7) #3
  br label %15

15:                                               ; preds = %8, %11
  %16 = phi x86_fp80 [ %12, %11 ], [ %3, %8 ]
  %17 = phi x86_fp80 [ %14, %11 ], [ %7, %8 ]
  %18 = insertvalue { x86_fp80, x86_fp80 } poison, x86_fp80 %16, 0
  %19 = insertvalue { x86_fp80, x86_fp80 } %18, x86_fp80 %17, 1
  ret { x86_fp80, x86_fp80 } %19
}

; Function Attrs: optsize
declare i32 @__fpclassifyl(x86_fp80 noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float, metadata) #2

; Function Attrs: optsize
declare x86_fp80 @copysignl(x86_fp80 noundef, x86_fp80 noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
