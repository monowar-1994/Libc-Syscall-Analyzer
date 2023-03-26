; ModuleID = 'src/math/log10.c'
source_filename = "src/math/log10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define double @log10(double noundef %0) local_unnamed_addr #0 {
  %2 = bitcast double %0 to i64
  %3 = lshr i64 %2, 32
  %4 = trunc i64 %3 to i32
  %5 = icmp ugt i32 %4, 1048575
  %6 = icmp sgt i64 %2, -1
  %7 = and i1 %6, %5
  br i1 %7, label %24, label %8

8:                                                ; preds = %1
  %9 = and i64 %2, 9223372036854775807
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %11, label %15

11:                                               ; preds = %8
  %12 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 -1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %13 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %14 = tail call double @llvm.experimental.constrained.fdiv.f64(double %12, double %13, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %82

15:                                               ; preds = %8
  br i1 %6, label %19, label %16

16:                                               ; preds = %15
  %17 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %18 = tail call double @llvm.experimental.constrained.fdiv.f64(double %17, double 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %82

19:                                               ; preds = %15
  %20 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double 0x4350000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %21 = bitcast double %20 to i64
  %22 = lshr i64 %21, 32
  %23 = trunc i64 %22 to i32
  br label %33

24:                                               ; preds = %1
  %25 = icmp ugt i32 %4, 2146435071
  br i1 %25, label %82, label %26

26:                                               ; preds = %24
  %27 = icmp eq i32 %4, 1072693248
  br i1 %27, label %28, label %33

28:                                               ; preds = %26
  %29 = and i64 %2, 4294967295
  %30 = icmp eq i64 %29, 0
  br i1 %30, label %31, label %33

31:                                               ; preds = %28
  %32 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %82

33:                                               ; preds = %28, %26, %19
  %34 = phi i64 [ %2, %28 ], [ %2, %26 ], [ %21, %19 ]
  %35 = phi i32 [ 1072693248, %28 ], [ %4, %26 ], [ %23, %19 ]
  %36 = phi i32 [ -1023, %28 ], [ -1023, %26 ], [ -1077, %19 ]
  %37 = add i32 %35, 614242
  %38 = lshr i32 %37, 20
  %39 = add nsw i32 %36, %38
  %40 = and i32 %37, 1048575
  %41 = add nuw nsw i32 %40, 1072079006
  %42 = zext i32 %41 to i64
  %43 = shl nuw nsw i64 %42, 32
  %44 = and i64 %34, 4294967295
  %45 = or i64 %43, %44
  %46 = bitcast i64 %45 to double
  %47 = tail call double @llvm.experimental.constrained.fsub.f64(double %46, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %48 = tail call double @llvm.experimental.constrained.fmul.f64(double 5.000000e-01, double %47, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %49 = tail call double @llvm.experimental.constrained.fmul.f64(double %48, double %47, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %50 = tail call double @llvm.experimental.constrained.fadd.f64(double 2.000000e+00, double %47, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %51 = tail call double @llvm.experimental.constrained.fdiv.f64(double %47, double %50, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %52 = tail call double @llvm.experimental.constrained.fmul.f64(double %51, double %51, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %53 = tail call double @llvm.experimental.constrained.fmul.f64(double %52, double %52, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %54 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %53, double 0x3FC39A09D078C69F, double 0x3FCC71C51D8E78AF, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %55 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %53, double %54, double 0x3FD999999997FA04, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %56 = tail call double @llvm.experimental.constrained.fmul.f64(double %53, double %55, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %57 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %53, double 0x3FC2F112DF3E5244, double 0x3FC7466496CB03DE, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %58 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %53, double %57, double 0x3FD2492494229359, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %59 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %53, double %58, double 0x3FE5555555555593, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %60 = tail call double @llvm.experimental.constrained.fmul.f64(double %52, double %59, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %61 = tail call double @llvm.experimental.constrained.fadd.f64(double %60, double %56, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %62 = tail call double @llvm.experimental.constrained.fsub.f64(double %47, double %49, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %63 = bitcast double %62 to i64
  %64 = and i64 %63, -4294967296
  %65 = bitcast i64 %64 to double
  %66 = tail call double @llvm.experimental.constrained.fsub.f64(double %47, double %65, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %67 = tail call double @llvm.experimental.constrained.fsub.f64(double %66, double %49, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %68 = tail call double @llvm.experimental.constrained.fadd.f64(double %49, double %61, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %69 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %51, double %68, double %67, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %70 = tail call double @llvm.experimental.constrained.fmul.f64(double %65, double 0x3FDBCB7B15200000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %71 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %39, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %72 = tail call double @llvm.experimental.constrained.fmul.f64(double %71, double 0x3FD34413509F6000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %73 = tail call double @llvm.experimental.constrained.fadd.f64(double %69, double %65, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %74 = tail call double @llvm.experimental.constrained.fmul.f64(double %73, double 0x3DBB9438CA9AADD5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %75 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %71, double 0x3D59FEF311F12B36, double %74, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %76 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %69, double 0x3FDBCB7B15200000, double %75, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %77 = tail call double @llvm.experimental.constrained.fadd.f64(double %72, double %70, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %78 = tail call double @llvm.experimental.constrained.fsub.f64(double %72, double %77, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %79 = tail call double @llvm.experimental.constrained.fadd.f64(double %78, double %70, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %80 = tail call double @llvm.experimental.constrained.fadd.f64(double %76, double %79, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %81 = tail call double @llvm.experimental.constrained.fadd.f64(double %80, double %77, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %82

82:                                               ; preds = %24, %33, %31, %16, %11
  %83 = phi double [ %14, %11 ], [ %18, %16 ], [ %81, %33 ], [ %32, %31 ], [ %0, %24 ]
  ret double %83
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #1

attributes #0 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
