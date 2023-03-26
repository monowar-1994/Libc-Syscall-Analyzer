; ModuleID = 'src/complex/cacosl.c'
source_filename = "src/complex/cacosl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define { x86_fp80, x86_fp80 } @cacosl({ x86_fp80, x86_fp80 }* nocapture noundef byval({ x86_fp80, x86_fp80 }) align 16 %0) local_unnamed_addr #0 {
  %2 = alloca { x86_fp80, x86_fp80 }, align 16
  %3 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %0, i64 0, i32 0
  %4 = load x86_fp80, x86_fp80* %3, align 16
  %5 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %0, i64 0, i32 1
  %6 = load x86_fp80, x86_fp80* %5, align 16
  %7 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %2, i64 0, i32 0
  %8 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %2, i64 0, i32 1
  store x86_fp80 %4, x86_fp80* %7, align 16
  store x86_fp80 %6, x86_fp80* %8, align 16
  %9 = tail call { x86_fp80, x86_fp80 } @casinl({ x86_fp80, x86_fp80 }* noundef nonnull byval({ x86_fp80, x86_fp80 }) align 16 %2) #3
  %10 = extractvalue { x86_fp80, x86_fp80 } %9, 0
  %11 = extractvalue { x86_fp80, x86_fp80 } %9, 1
  %12 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 0xK3FFFC90FDAA22168C235, x86_fp80 %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %13 = fneg x86_fp80 %11
  %14 = insertvalue { x86_fp80, x86_fp80 } poison, x86_fp80 %12, 0
  %15 = insertvalue { x86_fp80, x86_fp80 } %14, x86_fp80 %13, 1
  ret { x86_fp80, x86_fp80 } %15
}

; Function Attrs: optsize
declare { x86_fp80, x86_fp80 } @casinl({ x86_fp80, x86_fp80 }* noundef byval({ x86_fp80, x86_fp80 }) align 16) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80, x86_fp80, metadata, metadata) #2

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
