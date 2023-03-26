; ModuleID = 'src/math/sinhl.c'
source_filename = "src/math/sinhl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define x86_fp80 @sinhl(x86_fp80 noundef %0) local_unnamed_addr #0 {
  %2 = bitcast x86_fp80 %0 to i80
  %3 = lshr i80 %2, 64
  %4 = trunc i80 %3 to i32
  %5 = and i32 %4, 32767
  %6 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #3
  %7 = and i32 %4, 32768
  %8 = icmp eq i32 %7, 0
  %9 = fneg x86_fp80 %6
  %10 = select i1 %8, x86_fp80 %6, x86_fp80 %9
  %11 = zext i32 %5 to i80
  %12 = shl nuw nsw i80 %11, 64
  %13 = and i80 %2, 18446744073709551615
  %14 = or i80 %12, %13
  %15 = bitcast i80 %14 to x86_fp80
  %16 = icmp ult i32 %5, 16396
  br i1 %16, label %24, label %17

17:                                               ; preds = %1
  %18 = icmp eq i32 %5, 16396
  %19 = trunc i80 %2 to i64
  %20 = icmp ult i64 %19, -5660435432026931200
  %21 = and i1 %20, %18
  br i1 %21, label %22, label %45

22:                                               ; preds = %17
  %23 = tail call x86_fp80 @expm1l(x86_fp80 noundef %15) #4
  br label %38

24:                                               ; preds = %1
  %25 = tail call x86_fp80 @expm1l(x86_fp80 noundef %15) #4
  %26 = icmp ult i32 %5, 16383
  br i1 %26, label %27, label %38

27:                                               ; preds = %24
  %28 = icmp ult i32 %5, 16351
  br i1 %28, label %51, label %29

29:                                               ; preds = %27
  %30 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %31 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %25, x86_fp80 %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %32 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %32, x86_fp80 %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %34 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %31, x86_fp80 %33, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %35 = fneg x86_fp80 %34
  %36 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %30, x86_fp80 %25, x86_fp80 %35, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %37 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %10, x86_fp80 %36, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %51

38:                                               ; preds = %22, %24
  %39 = phi x86_fp80 [ %23, %22 ], [ %25, %24 ]
  %40 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %41 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %39, x86_fp80 %40, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %42 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %39, x86_fp80 %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %43 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %39, x86_fp80 %42, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %44 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %10, x86_fp80 %43, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %51

45:                                               ; preds = %17
  %46 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #3
  %47 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %46, x86_fp80 %15, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %48 = tail call x86_fp80 @expl(x86_fp80 noundef %47) #4
  %49 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %10, x86_fp80 %48, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %50 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %49, x86_fp80 %48, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %51

51:                                               ; preds = %27, %45, %38, %29
  %52 = phi x86_fp80 [ %37, %29 ], [ %44, %38 ], [ %50, %45 ], [ %0, %27 ]
  ret x86_fp80 %52
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #1

; Function Attrs: optsize
declare x86_fp80 @expm1l(x86_fp80 noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: optsize
declare x86_fp80 @expl(x86_fp80 noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
