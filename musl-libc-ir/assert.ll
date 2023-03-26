; ModuleID = 'src/exit/assert.c'
source_filename = "src/exit/assert.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type opaque

@__stderr_FILE = external hidden global %struct._IO_FILE, align 1
@.str = private unnamed_addr constant [35 x i8] c"Assertion failed: %s (%s: %s: %d)\0A\00", align 1

; Function Attrs: noreturn nounwind optsize strictfp
define void @__assert_fail(i8* noundef %0, i8* noundef %1, i32 noundef %2, i8* noundef %3) local_unnamed_addr #0 {
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef nonnull @__stderr_FILE, i8* noundef getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0), i8* noundef %0, i8* noundef %1, i8* noundef %3, i32 noundef %2) #3
  tail call void @abort() #4
  unreachable
}

; Function Attrs: optsize
declare i32 @fprintf(%struct._IO_FILE* noundef, i8* noundef, ...) local_unnamed_addr #1

; Function Attrs: noreturn optsize
declare void @abort() local_unnamed_addr #2

attributes #0 = { noreturn nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { nobuiltin noreturn nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
