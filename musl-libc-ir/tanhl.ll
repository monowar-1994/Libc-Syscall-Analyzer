; ModuleID = 'src/math/tanhl.c'
source_filename = "src/math/tanhl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define x86_fp80 @tanhl(x86_fp80 noundef %0) local_unnamed_addr #0 {
  %2 = bitcast x86_fp80 %0 to i80
  %3 = lshr i80 %2, 64
  %4 = trunc i80 %3 to i32
  %5 = and i32 %4, 32767
  %6 = zext i32 %5 to i80
  %7 = shl nuw nsw i80 %6, 64
  %8 = and i80 %2, 18446744073709551615
  %9 = or i80 %7, %8
  %10 = bitcast i80 %9 to x86_fp80
  %11 = lshr i80 %2, 32
  %12 = trunc i80 %11 to i32
  %13 = icmp ugt i32 %5, 16382
  br i1 %13, label %18, label %14

14:                                               ; preds = %1
  %15 = icmp eq i32 %5, 16382
  %16 = icmp ugt i32 %12, -1935715371
  %17 = and i1 %16, %15
  br i1 %17, label %27, label %37

18:                                               ; preds = %1
  %19 = icmp ugt i32 %5, 16387
  br i1 %19, label %20, label %27

20:                                               ; preds = %18
  %21 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %22 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %23 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float 0x3870000000000000, metadata !"fpexcept.ignore") #3
  %24 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %10, x86_fp80 %23, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %25 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %22, x86_fp80 %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %26 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %21, x86_fp80 %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %58

27:                                               ; preds = %14, %18
  %28 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %29 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %28, x86_fp80 %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %30 = tail call x86_fp80 @expm1l(x86_fp80 noundef %29) #4
  %31 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %32 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %34 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %30, x86_fp80 %33, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %35 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %32, x86_fp80 %34, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %36 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %31, x86_fp80 %35, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %58

37:                                               ; preds = %14
  %38 = icmp ugt i32 %5, 16381
  br i1 %38, label %43, label %39

39:                                               ; preds = %37
  %40 = icmp eq i32 %5, 16381
  %41 = icmp ugt i32 %12, -2100987948
  %42 = and i1 %41, %40
  br i1 %42, label %43, label %50

43:                                               ; preds = %39, %37
  %44 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %45 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %44, x86_fp80 %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %46 = tail call x86_fp80 @expm1l(x86_fp80 noundef %45) #4
  %47 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %48 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %46, x86_fp80 %47, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %49 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %46, x86_fp80 %48, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %58

50:                                               ; preds = %39
  %51 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 -2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %52 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %51, x86_fp80 %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %53 = tail call x86_fp80 @expm1l(x86_fp80 noundef %52) #4
  %54 = fneg x86_fp80 %53
  %55 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %56 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %53, x86_fp80 %55, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %57 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %54, x86_fp80 %56, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %58

58:                                               ; preds = %43, %50, %20, %27
  %59 = phi x86_fp80 [ %26, %20 ], [ %36, %27 ], [ %49, %43 ], [ %57, %50 ]
  %60 = and i32 %4, 32768
  %61 = icmp eq i32 %60, 0
  %62 = fneg x86_fp80 %59
  %63 = select i1 %61, x86_fp80 %59, x86_fp80 %62
  ret x86_fp80 %63
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: optsize
declare x86_fp80 @expm1l(x86_fp80 noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80, x86_fp80, metadata, metadata) #1

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
