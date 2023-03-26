; ModuleID = 'src/fenv/__flt_rounds.c'
source_filename = "src/fenv/__flt_rounds.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@switch.table.__flt_rounds = private unnamed_addr constant [4 x i32] [i32 1, i32 3, i32 2, i32 0], align 4

; Function Attrs: nounwind optsize strictfp
define i32 @__flt_rounds() local_unnamed_addr #0 {
  %1 = tail call i32 @fegetround() #3
  %2 = tail call i32 @llvm.fshl.i32(i32 %1, i32 %1, i32 22)
  %3 = icmp ult i32 %2, 4
  br i1 %3, label %4, label %8

4:                                                ; preds = %0
  %5 = sext i32 %2 to i64
  %6 = getelementptr inbounds [4 x i32], [4 x i32]* @switch.table.__flt_rounds, i64 0, i64 %5
  %7 = load i32, i32* %6, align 4
  br label %8

8:                                                ; preds = %0, %4
  %9 = phi i32 [ %7, %4 ], [ -1, %0 ]
  ret i32 %9
}

; Function Attrs: optsize
declare i32 @fegetround() local_unnamed_addr #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
