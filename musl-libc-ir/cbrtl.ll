; ModuleID = 'src/math/cbrtl.c'
source_filename = "src/math/cbrtl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define x86_fp80 @cbrtl(x86_fp80 noundef %0) local_unnamed_addr #0 {
  %2 = bitcast x86_fp80 %0 to i80
  %3 = lshr i80 %2, 64
  %4 = trunc i80 %3 to i32
  %5 = and i32 %4, 32767
  %6 = and i32 %4, 32768
  switch i32 %5, label %19 [
    i32 32767, label %7
    i32 0, label %9
  ]

7:                                                ; preds = %1
  %8 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %0, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %89

9:                                                ; preds = %1
  %10 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x4770000000000000, metadata !"fpexcept.ignore") #2
  %11 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %0, x86_fp80 %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %12 = bitcast x86_fp80 %11 to i80
  %13 = lshr i80 %12, 64
  %14 = trunc i80 %13 to i32
  %15 = and i32 %14, 32767
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %89, label %17

17:                                               ; preds = %9
  %18 = add nsw i32 %15, -120
  br label %19

19:                                               ; preds = %1, %17
  %20 = phi i80 [ %2, %1 ], [ %12, %17 ]
  %21 = phi i32 [ %5, %1 ], [ %18, %17 ]
  %22 = add nsw i32 %21, -16383
  %23 = and i80 %20, 18446744073709551615
  %24 = or i80 %23, 302213008159583584124928
  %25 = bitcast i80 %24 to x86_fp80
  %26 = trunc i32 %22 to i16
  %27 = srem i16 %26, 3
  %28 = sext i16 %27 to i32
  switch i32 %28, label %38 [
    i32 1, label %29
    i32 -2, label %29
    i32 2, label %31
    i32 -1, label %31
  ]

29:                                               ; preds = %19, %19
  %30 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %33

31:                                               ; preds = %19, %19
  %32 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %33

33:                                               ; preds = %29, %31
  %34 = phi x86_fp80 [ %32, %31 ], [ %30, %29 ]
  %35 = phi i32 [ -16385, %31 ], [ -16384, %29 ]
  %36 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %25, x86_fp80 %34, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %37 = add nsw i32 %21, %35
  br label %38

38:                                               ; preds = %33, %19
  %39 = phi x86_fp80 [ %25, %19 ], [ %36, %33 ]
  %40 = phi i32 [ %22, %19 ], [ %37, %33 ]
  %41 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #2
  %42 = trunc i32 %40 to i16
  %43 = sdiv i16 %42, 3
  %44 = add nsw i16 %43, 16383
  %45 = zext i16 %44 to i32
  %46 = bitcast x86_fp80 %41 to i80
  %47 = or i32 %6, %45
  %48 = zext i32 %47 to i80
  %49 = shl nuw i80 %48, 64
  %50 = and i80 %46, 18446744073709551615
  %51 = or i80 %49, %50
  %52 = bitcast i80 %51 to x86_fp80
  %53 = tail call float @llvm.experimental.constrained.fptrunc.f32.f80(x86_fp80 %39, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %54 = bitcast float %53 to i32
  %55 = and i32 %54, 2147483647
  %56 = udiv i32 %55, 3
  %57 = add nuw nsw i32 %56, 709958130
  %58 = bitcast i32 %57 to float
  %59 = tail call double @llvm.experimental.constrained.fptrunc.f64.f80(x86_fp80 %39, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %60 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %58, metadata !"fpexcept.ignore") #2
  %61 = tail call double @llvm.experimental.constrained.fmul.f64(double %60, double %60, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %62 = tail call double @llvm.experimental.constrained.fmul.f64(double %61, double %60, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %63 = tail call double @llvm.experimental.constrained.fadd.f64(double %59, double %59, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %64 = tail call double @llvm.experimental.constrained.fadd.f64(double %63, double %62, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %65 = tail call double @llvm.experimental.constrained.fmul.f64(double %60, double %64, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %66 = tail call double @llvm.experimental.constrained.fadd.f64(double %59, double %62, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %67 = tail call double @llvm.experimental.constrained.fadd.f64(double %66, double %62, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %68 = tail call double @llvm.experimental.constrained.fdiv.f64(double %65, double %67, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %69 = tail call double @llvm.experimental.constrained.fmul.f64(double %68, double %68, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %70 = tail call double @llvm.experimental.constrained.fmul.f64(double %69, double %68, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %71 = tail call double @llvm.experimental.constrained.fadd.f64(double %59, double %59, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %72 = tail call double @llvm.experimental.constrained.fadd.f64(double %71, double %70, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %73 = tail call double @llvm.experimental.constrained.fmul.f64(double %68, double %72, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %74 = tail call double @llvm.experimental.constrained.fadd.f64(double %59, double %70, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %75 = tail call double @llvm.experimental.constrained.fadd.f64(double %74, double %70, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %76 = tail call double @llvm.experimental.constrained.fdiv.f64(double %73, double %75, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %77 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %76, metadata !"fpexcept.ignore") #2
  %78 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %77, x86_fp80 0xK401F8000000000000001, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %79 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x41F0000000000000, metadata !"fpexcept.ignore") #2
  %80 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %78, x86_fp80 %79, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %81 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %80, x86_fp80 %80, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %82 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %39, x86_fp80 %81, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %83 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %80, x86_fp80 %80, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %84 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %82, x86_fp80 %80, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %85 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %83, x86_fp80 %82, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %86 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %84, x86_fp80 %85, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %87 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %80, x86_fp80 %86, x86_fp80 %80, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %88 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %87, x86_fp80 %52, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %89

89:                                               ; preds = %9, %38, %7
  %90 = phi x86_fp80 [ %8, %7 ], [ %88, %38 ], [ %0, %9 ]
  ret x86_fp80 %90
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f80(x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fptrunc.f64.f80(x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80, metadata, metadata) #1

attributes #0 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
