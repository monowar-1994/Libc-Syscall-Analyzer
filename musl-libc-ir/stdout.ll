; ModuleID = 'src/stdio/stdout.c'
source_filename = "src/stdio/stdout.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, {}*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@buf = internal global [1032 x i8] zeroinitializer, align 16
@__stdout_FILE = hidden global { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* } { i32 5, i8* null, i8* null, i32 (%struct._IO_FILE*)* @__stdio_close, i8* null, i8* null, i8* null, i8* null, i64 (%struct._IO_FILE*, i8*, i64)* null, i64 (%struct._IO_FILE*, i8*, i64)* @__stdout_write, i64 (%struct._IO_FILE*, i64, i32)* @__stdio_seek, i8* getelementptr inbounds ([1032 x i8], [1032 x i8]* @buf, i32 0, i64 8), i64 1024, %struct._IO_FILE* null, %struct._IO_FILE* null, i32 1, i32 0, i64 0, i32 0, i32 -1, i32 10, i8* null, i64 0, i8* null, i8* null, i8* null, i64 0, i64 0, %struct._IO_FILE* null, %struct._IO_FILE* null, %struct.__locale_struct* null }, align 8
@stdout = local_unnamed_addr constant %struct._IO_FILE* bitcast ({ i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }* @__stdout_FILE to %struct._IO_FILE*), align 8
@__stdout_used = hidden local_unnamed_addr global %struct._IO_FILE* bitcast ({ i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }* @__stdout_FILE to %struct._IO_FILE*), align 8

; Function Attrs: optsize
declare hidden i32 @__stdio_close(%struct._IO_FILE* noundef) #0

; Function Attrs: optsize
declare hidden i64 @__stdout_write(%struct._IO_FILE* noundef, i8* noundef, i64 noundef) #0

; Function Attrs: optsize
declare hidden i64 @__stdio_seek(%struct._IO_FILE* noundef, i64 noundef, i32 noundef) #0

attributes #0 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
