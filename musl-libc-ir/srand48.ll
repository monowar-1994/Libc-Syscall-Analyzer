; ModuleID = 'src/prng/srand48.c'
source_filename = "src/prng/srand48.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define void @srand48(i64 noundef %0) local_unnamed_addr #0 {
  %2 = alloca [3 x i16], align 2
  %3 = getelementptr inbounds [3 x i16], [3 x i16]* %2, i64 0, i64 0
  store i16 13070, i16* %3, align 2, !tbaa !3
  %4 = getelementptr inbounds [3 x i16], [3 x i16]* %2, i64 0, i64 1
  %5 = trunc i64 %0 to i16
  store i16 %5, i16* %4, align 2, !tbaa !3
  %6 = getelementptr inbounds [3 x i16], [3 x i16]* %2, i64 0, i64 2
  %7 = lshr i64 %0, 16
  %8 = trunc i64 %7 to i16
  store i16 %8, i16* %6, align 2, !tbaa !3
  %9 = call i16* @seed48(i16* noundef nonnull %3) #2
  ret void
}

; Function Attrs: optsize
declare i16* @seed48(i16* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"short", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
