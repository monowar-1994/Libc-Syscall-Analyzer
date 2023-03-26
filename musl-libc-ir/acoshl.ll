; ModuleID = 'src/math/acoshl.c'
source_filename = "src/math/acoshl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define x86_fp80 @acoshl(x86_fp80 noundef %0) local_unnamed_addr #0 {
  %2 = bitcast x86_fp80 %0 to i80
  %3 = lshr i80 %2, 64
  %4 = trunc i80 %3 to i32
  %5 = and i32 %4, 32767
  %6 = icmp ult i32 %5, 16384
  br i1 %6, label %7, label %22

7:                                                ; preds = %1
  %8 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %9 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %0, x86_fp80 %8, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %10 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %11 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %0, x86_fp80 %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %12 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %13 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %0, x86_fp80 %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %14 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %15 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %16 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %0, x86_fp80 %15, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %17 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %14, x86_fp80 %16, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %18 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %11, x86_fp80 %13, x86_fp80 %17, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %19 = tail call x86_fp80 @sqrtl(x86_fp80 noundef %18) #4
  %20 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %9, x86_fp80 %19, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %21 = tail call x86_fp80 @log1pl(x86_fp80 noundef %20) #4
  br label %39

22:                                               ; preds = %1
  %23 = icmp ult i32 %5, 16415
  br i1 %23, label %24, label %36

24:                                               ; preds = %22
  %25 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %26 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %27 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = fneg x86_fp80 %27
  %29 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %0, x86_fp80 %0, x86_fp80 %28, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %30 = tail call x86_fp80 @sqrtl(x86_fp80 noundef %29) #4
  %31 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %0, x86_fp80 %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %32 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %26, x86_fp80 %31, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = fneg x86_fp80 %32
  %34 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %25, x86_fp80 %0, x86_fp80 %33, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %35 = tail call x86_fp80 @logl(x86_fp80 noundef %34) #4
  br label %39

36:                                               ; preds = %22
  %37 = tail call x86_fp80 @logl(x86_fp80 noundef %0) #4
  %38 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %37, x86_fp80 0xK3FFEB17217F7D1CF79AC, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %39

39:                                               ; preds = %36, %24, %7
  %40 = phi x86_fp80 [ %21, %7 ], [ %35, %24 ], [ %38, %36 ]
  ret x86_fp80 %40
}

; Function Attrs: optsize
declare x86_fp80 @log1pl(x86_fp80 noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: optsize
declare x86_fp80 @sqrtl(x86_fp80 noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: optsize
declare x86_fp80 @logl(x86_fp80 noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80, x86_fp80, metadata, metadata) #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
