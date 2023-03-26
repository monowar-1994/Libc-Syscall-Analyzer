; ModuleID = 'src/exit/exit.c'
source_filename = "src/exit/exit.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__fini_array_end = extern_weak hidden constant void ()*, align 8
@__fini_array_start = extern_weak hidden constant void ()*, align 8

@__funcs_on_exit = weak hidden alias void (), void ()* @dummy
@__stdio_exit = weak alias void (...), bitcast (void ()* @dummy to void (...)*)
@_fini = weak alias void (...), bitcast (void ()* @dummy to void (...)*)
@__libc_exit_fini = weak hidden alias void (), void ()* @libc_exit_fini

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal void @dummy() #0 {
  ret void
}

; Function Attrs: nounwind optsize strictfp
define internal void @libc_exit_fini() #1 {
  br i1 icmp ugt (void ()** @__fini_array_end, void ()** @__fini_array_start), label %1, label %7

1:                                                ; preds = %0, %1
  %2 = phi i64 [ %3, %1 ], [ ptrtoint (void ()** @__fini_array_end to i64), %0 ]
  %3 = add i64 %2, -8
  %4 = inttoptr i64 %3 to void (...)**
  %5 = load void (...)*, void (...)** %4, align 8, !tbaa !3
  tail call void (...) %5() #4
  %6 = icmp ugt i64 %3, ptrtoint (void ()** @__fini_array_start to i64)
  br i1 %6, label %1, label %7

7:                                                ; preds = %1, %0
  tail call void (...) @_fini() #4
  ret void
}

; Function Attrs: noreturn nounwind optsize strictfp
define void @exit(i32 noundef %0) local_unnamed_addr #2 {
  tail call void @__funcs_on_exit() #4
  tail call void @__libc_exit_fini() #4
  tail call void (...) @__stdio_exit() #4
  tail call void @_Exit(i32 noundef %0) #5
  unreachable
}

; Function Attrs: noreturn optsize
declare void @_Exit(i32 noundef) local_unnamed_addr #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nobuiltin noreturn nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
