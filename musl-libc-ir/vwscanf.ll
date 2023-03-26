; ModuleID = 'src/stdio/vwscanf.c'
source_filename = "src/stdio/vwscanf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type opaque
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@__stdin_FILE = external hidden global %struct._IO_FILE, align 1

@__isoc99_vwscanf = weak alias i32 (i32*, %struct.__va_list_tag*), i32 (i32*, %struct.__va_list_tag*)* @vwscanf

; Function Attrs: nounwind optsize strictfp
define i32 @vwscanf(i32* noalias noundef %0, %struct.__va_list_tag* noundef %1) #0 {
  %3 = tail call i32 @vfwscanf(%struct._IO_FILE* noundef nonnull @__stdin_FILE, i32* noundef %0, %struct.__va_list_tag* noundef %1) #2
  ret i32 %3
}

; Function Attrs: optsize
declare i32 @vfwscanf(%struct._IO_FILE* noundef, i32* noundef, %struct.__va_list_tag* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
