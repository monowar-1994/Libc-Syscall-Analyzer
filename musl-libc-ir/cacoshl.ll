; ModuleID = 'src/complex/cacoshl.c'
source_filename = "src/complex/cacoshl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define { x86_fp80, x86_fp80 } @cacoshl({ x86_fp80, x86_fp80 }* nocapture noundef byval({ x86_fp80, x86_fp80 }) align 16 %0) local_unnamed_addr #0 {
  %2 = alloca { x86_fp80, x86_fp80 }, align 16
  %3 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %0, i64 0, i32 0
  %4 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %0, i64 0, i32 1
  %5 = load x86_fp80, x86_fp80* %4, align 16
  %6 = tail call i32 @__signbitl(x86_fp80 noundef %5) #2
  %7 = load x86_fp80, x86_fp80* %3, align 16
  %8 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %2, i64 0, i32 0
  %9 = getelementptr inbounds { x86_fp80, x86_fp80 }, { x86_fp80, x86_fp80 }* %2, i64 0, i32 1
  store x86_fp80 %7, x86_fp80* %8, align 16
  store x86_fp80 %5, x86_fp80* %9, align 16
  %10 = tail call { x86_fp80, x86_fp80 } @cacosl({ x86_fp80, x86_fp80 }* noundef nonnull byval({ x86_fp80, x86_fp80 }) align 16 %2) #2
  %11 = extractvalue { x86_fp80, x86_fp80 } %10, 0
  %12 = extractvalue { x86_fp80, x86_fp80 } %10, 1
  %13 = icmp eq i32 %6, 0
  %14 = fneg x86_fp80 %11
  %15 = fneg x86_fp80 %12
  %16 = select i1 %13, x86_fp80 %15, x86_fp80 %12
  %17 = select i1 %13, x86_fp80 %11, x86_fp80 %14
  %18 = insertvalue { x86_fp80, x86_fp80 } poison, x86_fp80 %16, 0
  %19 = insertvalue { x86_fp80, x86_fp80 } %18, x86_fp80 %17, 1
  ret { x86_fp80, x86_fp80 } %19
}

; Function Attrs: optsize
declare i32 @__signbitl(x86_fp80 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare { x86_fp80, x86_fp80 } @cacosl({ x86_fp80, x86_fp80 }* noundef byval({ x86_fp80, x86_fp80 }) align 16) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
