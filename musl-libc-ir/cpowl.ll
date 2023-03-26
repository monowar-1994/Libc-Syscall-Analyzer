; ModuleID = 'src/complex/cpowl.c'
source_filename = "src/complex/cpowl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define { x86_fp80, x86_fp80 } @cpowl({ x86_fp80, x86_fp80 }* nocapture noundef readonly byval({ x86_fp80, x86_fp80 }) align 16 %0, { x86_fp80, x86_fp80 }* nocapture noundef readonly byval({ x86_fp80, x86_fp80 }) align 16 %1) local_unnamed_addr #0 {
  %3 = alloca { x86_fp80, x86_fp80 }, align 16
  %4 = alloca { x86_fp80, x86_fp80 }, align 16
  %5 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %1, i64 0, i32 0
  %6 = load x86_fp80, x86_fp80* %5, align 16
  %7 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %1, i64 0, i32 1
  %8 = load x86_fp80, x86_fp80* %7, align 16
  %9 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %0, i64 0, i32 0
  %10 = load x86_fp80, x86_fp80* %9, align 16
  %11 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %0, i64 0, i32 1
  %12 = load x86_fp80, x86_fp80* %11, align 16
  %13 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %3, i64 0, i32 0
  %14 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %3, i64 0, i32 1
  store x86_fp80 %10, x86_fp80* %13, align 16
  store x86_fp80 %12, x86_fp80* %14, align 16
  %15 = tail call { x86_fp80, x86_fp80 } @clogl({ x86_fp80, x86_fp80 }* noundef nonnull byval({ x86_fp80, x86_fp80 }) align 16 %3) #3
  %16 = extractvalue { x86_fp80, x86_fp80 } %15, 0
  %17 = extractvalue { x86_fp80, x86_fp80 } %15, 1
  %18 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %6, x86_fp80 %16, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %19 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %8, x86_fp80 %17, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %20 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %6, x86_fp80 %17, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %21 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %8, x86_fp80 %16, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %22 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %18, x86_fp80 %19, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %23 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %20, x86_fp80 %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %24 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %22, x86_fp80 %22, metadata !"uno", metadata !"fpexcept.ignore") #4
  br i1 %24, label %25, label %31, !prof !3

25:                                               ; preds = %2
  %26 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %23, x86_fp80 %23, metadata !"uno", metadata !"fpexcept.ignore") #4
  br i1 %26, label %27, label %31, !prof !3

27:                                               ; preds = %25
  %28 = tail call { x86_fp80, x86_fp80 } @__mulxc3(x86_fp80 noundef %6, x86_fp80 noundef %8, x86_fp80 noundef %16, x86_fp80 noundef %17) #3
  %29 = extractvalue { x86_fp80, x86_fp80 } %28, 0
  %30 = extractvalue { x86_fp80, x86_fp80 } %28, 1
  br label %31

31:                                               ; preds = %27, %25, %2
  %32 = phi x86_fp80 [ %22, %2 ], [ %22, %25 ], [ %29, %27 ]
  %33 = phi x86_fp80 [ %23, %2 ], [ %23, %25 ], [ %30, %27 ]
  %34 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %4, i64 0, i32 0
  %35 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %4, i64 0, i32 1
  store x86_fp80 %32, x86_fp80* %34, align 16
  store x86_fp80 %33, x86_fp80* %35, align 16
  %36 = tail call { x86_fp80, x86_fp80 } @cexpl({ x86_fp80, x86_fp80 }* noundef nonnull byval({ x86_fp80, x86_fp80 }) align 16 %4) #3
  ret { x86_fp80, x86_fp80 } %36
}

; Function Attrs: optsize
declare { x86_fp80, x86_fp80 } @cexpl({ x86_fp80, x86_fp80 }* noundef byval({ x86_fp80, x86_fp80 }) align 16) local_unnamed_addr #1

; Function Attrs: optsize
declare { x86_fp80, x86_fp80 } @clogl({ x86_fp80, x86_fp80 }* noundef byval({ x86_fp80, x86_fp80 }) align 16) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80, x86_fp80, metadata, metadata) #2

declare { x86_fp80, x86_fp80 } @__mulxc3(x86_fp80, x86_fp80, x86_fp80, x86_fp80) local_unnamed_addr

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
!3 = !{!"branch_weights", i32 1, i32 1048575}
