; ModuleID = 'src/stdio/getline.c'
source_filename = "src/stdio/getline.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type opaque

; Function Attrs: nounwind optsize strictfp
define i64 @getline(i8** noalias noundef %0, i64* noalias noundef %1, %struct._IO_FILE* noalias noundef %2) local_unnamed_addr #0 {
  %4 = tail call i64 @getdelim(i8** noundef %0, i64* noundef %1, i32 noundef 10, %struct._IO_FILE* noundef %2) #2
  ret i64 %4
}

; Function Attrs: optsize
declare i64 @getdelim(i8** noundef, i64* noundef, i32 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
