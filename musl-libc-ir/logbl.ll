; ModuleID = 'src/math/logbl.c'
source_filename = "src/math/logbl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define x86_fp80 @logbl(x86_fp80 noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @__fpclassifyl(x86_fp80 noundef %0) #3
  %3 = icmp sgt i32 %2, 1
  br i1 %3, label %6, label %4

4:                                                ; preds = %1
  %5 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %0, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %16

6:                                                ; preds = %1
  %7 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %8 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %0, x86_fp80 %7, metadata !"oeq", metadata !"fpexcept.ignore") #4
  br i1 %8, label %9, label %13

9:                                                ; preds = %6
  %10 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 -1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %11 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %0, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %12 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %10, x86_fp80 %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %16

13:                                               ; preds = %6
  %14 = tail call i32 @ilogbl(x86_fp80 noundef %0) #3
  %15 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 %14, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %16

16:                                               ; preds = %13, %9, %4
  %17 = phi x86_fp80 [ %12, %9 ], [ %15, %13 ], [ %5, %4 ]
  ret x86_fp80 %17
}

; Function Attrs: optsize
declare i32 @__fpclassifyl(x86_fp80 noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: optsize
declare i32 @ilogbl(x86_fp80 noundef) local_unnamed_addr #1

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
