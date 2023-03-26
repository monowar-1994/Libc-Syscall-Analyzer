; ModuleID = 'src/internal/syscall_ret.c'
source_filename = "src/internal/syscall_ret.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree nosync nounwind strictfp willreturn writeonly
define hidden i64 @__syscall_ret(i64 noundef %0) local_unnamed_addr #0 {
  %2 = icmp ugt i64 %0, -4096
  br i1 %2, label %3, label %7

3:                                                ; preds = %1
  %4 = trunc i64 %0 to i32
  %5 = sub nsw i32 0, %4
  %6 = tail call i32* @___errno_location() #2
  store i32 %5, i32* %6, align 4, !tbaa !3
  br label %7

7:                                                ; preds = %1, %3
  %8 = phi i64 [ -1, %3 ], [ %0, %1 ]
  ret i64 %8
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #1

attributes #0 = { mustprogress nofree nosync nounwind strictfp willreturn writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
