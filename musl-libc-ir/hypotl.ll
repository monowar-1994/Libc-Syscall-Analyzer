; ModuleID = 'src/math/hypotl.c'
source_filename = "src/math/hypotl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define x86_fp80 @hypotl(x86_fp80 noundef %0, x86_fp80 noundef %1) local_unnamed_addr #0 {
  %3 = bitcast x86_fp80 %0 to i80
  %4 = and i80 %3, 604462909807314587353087
  %5 = bitcast i80 %4 to x86_fp80
  %6 = bitcast x86_fp80 %1 to i80
  %7 = and i80 %6, 604462909807314587353087
  %8 = bitcast i80 %7 to x86_fp80
  %9 = lshr i80 %4, 64
  %10 = trunc i80 %9 to i32
  %11 = lshr i80 %7, 64
  %12 = trunc i80 %11 to i32
  %13 = icmp ult i32 %10, %12
  %14 = select i1 %13, x86_fp80 %5, x86_fp80 %8
  %15 = select i1 %13, x86_fp80 %8, x86_fp80 %5
  %16 = select i1 %13, i32 %12, i32 %10
  %17 = select i1 %13, i32 %10, i32 %12
  %18 = icmp eq i32 %16, 32767
  br i1 %18, label %19, label %23

19:                                               ; preds = %2
  %20 = tail call i32 @__fpclassifyl(x86_fp80 noundef %14) #3
  %21 = icmp eq i32 %20, 1
  %22 = select i1 %21, x86_fp80 %14, x86_fp80 %15
  br label %77

23:                                               ; preds = %2
  %24 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %25 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %14, x86_fp80 %24, metadata !"oeq", metadata !"fpexcept.ignore") #4
  br i1 %25, label %77, label %26

26:                                               ; preds = %23
  %27 = sub nsw i32 %16, %17
  %28 = icmp sgt i32 %27, 64
  br i1 %28, label %29, label %31

29:                                               ; preds = %26
  %30 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %15, x86_fp80 %14, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %77

31:                                               ; preds = %26
  %32 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %33 = icmp ugt i32 %16, 24383
  br i1 %33, label %34, label %37

34:                                               ; preds = %31
  %35 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %15, x86_fp80 0xK18EF8000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %36 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %14, x86_fp80 0xK18EF8000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %42

37:                                               ; preds = %31
  %38 = icmp ult i32 %17, 8383
  br i1 %38, label %39, label %42

39:                                               ; preds = %37
  %40 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %15, x86_fp80 0xK670F8000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %41 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %14, x86_fp80 0xK670F8000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %42

42:                                               ; preds = %37, %39, %34
  %43 = phi x86_fp80 [ %36, %34 ], [ %41, %39 ], [ %14, %37 ]
  %44 = phi x86_fp80 [ %35, %34 ], [ %40, %39 ], [ %15, %37 ]
  %45 = phi x86_fp80 [ 0xK670F8000000000000000, %34 ], [ 0xK18EF8000000000000000, %39 ], [ %32, %37 ]
  %46 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %47 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 0xK401F8000000000000000, x86_fp80 %46, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %48 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %44, x86_fp80 %47, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %49 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %44, x86_fp80 %48, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %50 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %49, x86_fp80 %48, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %51 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %44, x86_fp80 %50, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %52 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %44, x86_fp80 %44, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %53 = fneg x86_fp80 %52
  %54 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %50, x86_fp80 %50, x86_fp80 %53, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %55 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %56 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %55, x86_fp80 %50, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %57 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %56, x86_fp80 %51, x86_fp80 %54, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %58 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %51, x86_fp80 %51, x86_fp80 %57, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %59 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %60 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 0xK401F8000000000000000, x86_fp80 %59, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %61 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %43, x86_fp80 %60, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %62 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %43, x86_fp80 %61, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %63 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %62, x86_fp80 %61, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %64 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %43, x86_fp80 %63, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %65 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %43, x86_fp80 %43, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %66 = fneg x86_fp80 %65
  %67 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %63, x86_fp80 %63, x86_fp80 %66, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %68 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %69 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %68, x86_fp80 %63, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %70 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %69, x86_fp80 %64, x86_fp80 %67, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %71 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %64, x86_fp80 %64, x86_fp80 %70, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %72 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %71, x86_fp80 %58, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %73 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %72, x86_fp80 %65, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %74 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %73, x86_fp80 %52, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %75 = tail call x86_fp80 @sqrtl(x86_fp80 noundef %74) #3
  %76 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %45, x86_fp80 %75, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %77

77:                                               ; preds = %19, %23, %42, %29
  %78 = phi x86_fp80 [ %30, %29 ], [ %76, %42 ], [ %22, %19 ], [ %15, %23 ]
  ret x86_fp80 %78
}

; Function Attrs: optsize
declare i32 @__fpclassifyl(x86_fp80 noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: optsize
declare x86_fp80 @sqrtl(x86_fp80 noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80, metadata, metadata) #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { strictfp }
attributes #5 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
