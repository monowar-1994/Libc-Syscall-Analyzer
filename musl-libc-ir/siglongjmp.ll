; ModuleID = 'src/signal/siglongjmp.c'
source_filename = "src/signal/siglongjmp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__jmp_buf_tag = type { [8 x i64], i64, [16 x i64] }

; Function Attrs: noreturn nounwind optsize strictfp
define void @siglongjmp(%struct.__jmp_buf_tag* noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  tail call void @longjmp(%struct.__jmp_buf_tag* noundef %0, i32 noundef %1) #2
  unreachable
}

; Function Attrs: noreturn optsize
declare void @longjmp(%struct.__jmp_buf_tag* noundef, i32 noundef) local_unnamed_addr #1

attributes #0 = { noreturn nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { noreturn optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin noreturn nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
