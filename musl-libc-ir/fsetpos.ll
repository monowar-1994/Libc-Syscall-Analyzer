; ModuleID = 'src/stdio/fsetpos.c'
source_filename = "src/stdio/fsetpos.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque
%union._G_fpos64_t = type { i64, [8 x i8] }

@fsetpos64 = weak alias i32 (%struct._IO_FILE*, %union._G_fpos64_t*), i32 (%struct._IO_FILE*, %union._G_fpos64_t*)* @fsetpos

; Function Attrs: nounwind optsize strictfp
define i32 @fsetpos(%struct._IO_FILE* noundef %0, %union._G_fpos64_t* nocapture noundef readonly %1) #0 {
  %3 = getelementptr %union._G_fpos64_t, %union._G_fpos64_t* %1, i64 0, i32 0
  %4 = load i64, i64* %3, align 8, !tbaa !3
  %5 = tail call i32 @__fseeko(%struct._IO_FILE* noundef %0, i64 noundef %4, i32 noundef 0) #2
  ret i32 %5
}

; Function Attrs: optsize
declare hidden i32 @__fseeko(%struct._IO_FILE* noundef, i64 noundef, i32 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"long long", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
