; ModuleID = 'src/passwd/putpwent.c'
source_filename = "src/passwd/putpwent.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.passwd = type { i8*, i8*, i32, i32, i8*, i8*, i8* }
%struct._IO_FILE = type opaque

@.str = private unnamed_addr constant [22 x i8] c"%s:%s:%u:%u:%s:%s:%s\0A\00", align 1

; Function Attrs: nounwind optsize strictfp
define i32 @putpwent(%struct.passwd* nocapture noundef readonly %0, %struct._IO_FILE* noundef %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.passwd, %struct.passwd* %0, i64 0, i32 0
  %4 = load i8*, i8** %3, align 8, !tbaa !3
  %5 = getelementptr inbounds %struct.passwd, %struct.passwd* %0, i64 0, i32 1
  %6 = load i8*, i8** %5, align 8, !tbaa !9
  %7 = getelementptr inbounds %struct.passwd, %struct.passwd* %0, i64 0, i32 2
  %8 = load i32, i32* %7, align 8, !tbaa !10
  %9 = getelementptr inbounds %struct.passwd, %struct.passwd* %0, i64 0, i32 3
  %10 = load i32, i32* %9, align 4, !tbaa !11
  %11 = getelementptr inbounds %struct.passwd, %struct.passwd* %0, i64 0, i32 4
  %12 = load i8*, i8** %11, align 8, !tbaa !12
  %13 = getelementptr inbounds %struct.passwd, %struct.passwd* %0, i64 0, i32 5
  %14 = load i8*, i8** %13, align 8, !tbaa !13
  %15 = getelementptr inbounds %struct.passwd, %struct.passwd* %0, i64 0, i32 6
  %16 = load i8*, i8** %15, align 8, !tbaa !14
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %1, i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0), i8* noundef %4, i8* noundef %6, i32 noundef %8, i32 noundef %10, i8* noundef %12, i8* noundef %14, i8* noundef %16) #2
  %18 = ashr i32 %17, 31
  ret i32 %18
}

; Function Attrs: optsize
declare i32 @fprintf(%struct._IO_FILE* noundef, i8* noundef, ...) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"passwd", !5, i64 0, !5, i64 8, !8, i64 16, !8, i64 20, !5, i64 24, !5, i64 32, !5, i64 40}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"int", !6, i64 0}
!9 = !{!4, !5, i64 8}
!10 = !{!4, !8, i64 16}
!11 = !{!4, !8, i64 20}
!12 = !{!4, !5, i64 24}
!13 = !{!4, !5, i64 32}
!14 = !{!4, !5, i64 40}
