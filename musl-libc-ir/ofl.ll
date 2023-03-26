; ModuleID = 'src/stdio/ofl.c'
source_filename = "src/stdio/ofl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@ofl_lock = internal global [1 x i32] zeroinitializer, align 4
@__stdio_ofl_lockptr = hidden local_unnamed_addr constant i32* getelementptr inbounds ([1 x i32], [1 x i32]* @ofl_lock, i64 0, i64 0), align 8
@ofl_head = internal global %struct._IO_FILE* null, align 8

; Function Attrs: nounwind optsize strictfp
define hidden nonnull %struct._IO_FILE** @__ofl_lock() local_unnamed_addr #0 {
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @ofl_lock, i64 0, i64 0)) #2
  ret %struct._IO_FILE** @ofl_head
}

; Function Attrs: optsize
declare hidden void @__lock(i32* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define hidden void @__ofl_unlock() local_unnamed_addr #0 {
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @ofl_lock, i64 0, i64 0)) #2
  ret void
}

; Function Attrs: optsize
declare hidden void @__unlock(i32* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
