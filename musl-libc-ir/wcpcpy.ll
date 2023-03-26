; ModuleID = 'src/string/wcpcpy.c'
source_filename = "src/string/wcpcpy.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind strictfp
define i32* @wcpcpy(i32* noalias noundef %0, i32* noalias noundef %1) local_unnamed_addr #0 {
  %3 = tail call i32* @wcscpy(i32* noundef %0, i32* noundef %1) #2
  %4 = tail call i64 @wcslen(i32* noundef %1) #2
  %5 = getelementptr inbounds i32, i32* %3, i64 %4
  ret i32* %5
}

declare i32* @wcscpy(i32* noundef, i32* noundef) local_unnamed_addr #1

declare i64 @wcslen(i32* noundef) local_unnamed_addr #1

attributes #0 = { nounwind strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
