; ModuleID = 'src/math/modfl.c'
source_filename = "src/math/modfl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define x86_fp80 @modfl(x86_fp80 noundef %0, x86_fp80* nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = bitcast x86_fp80 %0 to i80
  %4 = lshr i80 %3, 64
  %5 = trunc i80 %4 to i32
  %6 = and i32 %5, 32767
  %7 = icmp ugt i32 %6, 16445
  br i1 %7, label %8, label %15

8:                                                ; preds = %2
  store x86_fp80 %0, x86_fp80* %1, align 16, !tbaa !3
  %9 = tail call i32 @__fpclassifyl(x86_fp80 noundef %0) #3
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %44, label %11

11:                                               ; preds = %8
  %12 = icmp ult i32 %5, 32768
  %13 = select i1 %12, double 0.000000e+00, double -0.000000e+00
  %14 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %13, metadata !"fpexcept.ignore") #4
  br label %44

15:                                               ; preds = %2
  %16 = icmp ult i32 %6, 16383
  %17 = icmp ult i32 %5, 32768
  br i1 %16, label %18, label %21

18:                                               ; preds = %15
  %19 = select i1 %17, double 0.000000e+00, double -0.000000e+00
  %20 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %19, metadata !"fpexcept.ignore") #4
  store x86_fp80 %20, x86_fp80* %1, align 16, !tbaa !3
  br label %44

21:                                               ; preds = %15
  %22 = fneg x86_fp80 %0
  %23 = select i1 %17, x86_fp80 %0, x86_fp80 %22
  %24 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %23, x86_fp80 0xK403E8000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %25 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %24, x86_fp80 0xK403E8000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %26 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %25, x86_fp80 %23, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %27 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %28 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %26, x86_fp80 %27, metadata !"oeq", metadata !"fpexcept.ignore") #4
  br i1 %28, label %29, label %32

29:                                               ; preds = %21
  store x86_fp80 %0, x86_fp80* %1, align 16, !tbaa !3
  %30 = select i1 %17, double 0.000000e+00, double -0.000000e+00
  %31 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %30, metadata !"fpexcept.ignore") #4
  br label %44

32:                                               ; preds = %21
  %33 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %34 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %26, x86_fp80 %33, metadata !"ogt", metadata !"fpexcept.ignore") #4
  br i1 %34, label %35, label %38

35:                                               ; preds = %32
  %36 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %37 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %26, x86_fp80 %36, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %38

38:                                               ; preds = %35, %32
  %39 = phi x86_fp80 [ %37, %35 ], [ %26, %32 ]
  %40 = fneg x86_fp80 %39
  %41 = select i1 %17, x86_fp80 %39, x86_fp80 %40
  %42 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %0, x86_fp80 %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  store x86_fp80 %42, x86_fp80* %1, align 16, !tbaa !3
  %43 = fneg x86_fp80 %41
  br label %44

44:                                               ; preds = %8, %38, %29, %18, %11
  %45 = phi x86_fp80 [ %14, %11 ], [ %0, %18 ], [ %31, %29 ], [ %43, %38 ], [ %0, %8 ]
  ret x86_fp80 %45
}

; Function Attrs: optsize
declare i32 @__fpclassifyl(x86_fp80 noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80, x86_fp80, metadata, metadata) #2

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
!3 = !{!4, !4, i64 0}
!4 = !{!"long double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
