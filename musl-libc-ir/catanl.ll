; ModuleID = 'src/complex/catanl.c'
source_filename = "src/complex/catanl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define { x86_fp80, x86_fp80 } @catanl({ x86_fp80, x86_fp80 }* nocapture noundef readonly byval({ x86_fp80, x86_fp80 }) align 16 %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %0, i64 0, i32 0
  %3 = load x86_fp80, x86_fp80* %2, align 16
  %4 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %0, i64 0, i32 1
  %5 = load x86_fp80, x86_fp80* %4, align 16
  %6 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %3, x86_fp80 %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %7 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 0xK3FFF8000000000000000, x86_fp80 %6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %8 = fneg x86_fp80 %5
  %9 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %8, x86_fp80 %5, x86_fp80 %7, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %10 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 0xK40008000000000000000, x86_fp80 %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %11 = tail call x86_fp80 @atan2l(x86_fp80 noundef %10, x86_fp80 noundef %9) #4
  %12 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %11, x86_fp80 0xK3FFE8000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %13 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %12, x86_fp80 0xK4000C90FDAA22168C235, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %14 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %13, x86_fp80 0xK00000000000000000000, metadata !"oge", metadata !"fpexcept.ignore") #5
  br i1 %14, label %15, label %17

15:                                               ; preds = %1
  %16 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %13, x86_fp80 0xK3FFE8000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %19

17:                                               ; preds = %1
  %18 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %13, x86_fp80 0xK3FFE8000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %19

19:                                               ; preds = %15, %17
  %20 = phi x86_fp80 [ %16, %15 ], [ %18, %17 ]
  %21 = tail call i64 @llvm.experimental.constrained.fptosi.i64.f80(x86_fp80 %20, metadata !"fpexcept.ignore") #5
  %22 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i64(i64 %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %23 = fneg x86_fp80 %22
  %24 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %23, x86_fp80 0xK4000C90FDAA22168C234, x86_fp80 %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %25 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %23, x86_fp80 0xK3FC0C4C6628B80DC1CD1, x86_fp80 %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %26 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %23, x86_fp80 0xK3F7EA4093822299F31D0, x86_fp80 %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %27 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %5, x86_fp80 0xK3FFF8000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %28 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %27, x86_fp80 %27, x86_fp80 %6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %29 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %5, x86_fp80 0xK3FFF8000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %30 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %29, x86_fp80 %29, x86_fp80 %6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %31 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %30, x86_fp80 %28, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %32 = tail call float @llvm.experimental.constrained.fptrunc.f32.f80(x86_fp80 %26, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = tail call x86_fp80 @logl(x86_fp80 noundef %31) #4
  %34 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 0xK3FFD8000000000000000, x86_fp80 %33, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %35 = tail call float @llvm.experimental.constrained.fptrunc.f32.f80(x86_fp80 %34, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %36 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float %32, metadata !"fpexcept.ignore") #3
  %37 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float %35, metadata !"fpexcept.ignore") #3
  %38 = insertvalue { x86_fp80, x86_fp80 } poison, x86_fp80 %36, 0
  %39 = insertvalue { x86_fp80, x86_fp80 } %38, x86_fp80 %37, 1
  ret { x86_fp80, x86_fp80 } %39
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: optsize
declare x86_fp80 @atan2l(x86_fp80 noundef, x86_fp80 noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f80(x86_fp80, metadata, metadata) #1

; Function Attrs: optsize
declare x86_fp80 @logl(x86_fp80 noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i64 @llvm.experimental.constrained.fptosi.i64.f80(x86_fp80, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.sitofp.f80.i64(i64, metadata, metadata) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
