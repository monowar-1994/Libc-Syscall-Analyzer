; ModuleID = 'src/regex/regerror.c'
source_filename = "src/regex/regerror.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.re_pattern_buffer = type { i64, i8*, [4 x i8*], i64, i8 }

@messages = internal constant [286 x i8] c"No error\00No match\00Invalid regexp\00Unknown collating element\00Unknown character class name\00Trailing backslash\00Invalid back reference\00Missing ']'\00Missing ')'\00Missing '}'\00Invalid contents of {}\00Invalid character range\00Out of memory\00Repetition not preceded by valid expression\00\00Unknown error\00", align 16
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1

; Function Attrs: nounwind optsize strictfp
define i64 @regerror(i32 noundef %0, %struct.re_pattern_buffer* noalias nocapture noundef readnone %1, i8* noalias noundef %2, i64 noundef %3) local_unnamed_addr #0 {
  %5 = icmp eq i32 %0, 0
  br i1 %5, label %17, label %6

6:                                                ; preds = %4, %11
  %7 = phi i8* [ %15, %11 ], [ getelementptr inbounds ([286 x i8], [286 x i8]* @messages, i64 0, i64 0), %4 ]
  %8 = phi i32 [ %12, %11 ], [ %0, %4 ]
  %9 = load i8, i8* %7, align 1, !tbaa !3
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %17, label %11

11:                                               ; preds = %6
  %12 = add nsw i32 %8, -1
  %13 = tail call i64 @strlen(i8* noundef nonnull %7) #2
  %14 = add i64 %13, 1
  %15 = getelementptr inbounds i8, i8* %7, i64 %14
  %16 = icmp eq i32 %12, 0
  br i1 %16, label %17, label %6

17:                                               ; preds = %6, %11, %4
  %18 = phi i8* [ getelementptr inbounds ([286 x i8], [286 x i8]* @messages, i64 0, i64 0), %4 ], [ %15, %11 ], [ %7, %6 ]
  %19 = load i8, i8* %18, align 1, !tbaa !3
  %20 = icmp eq i8 %19, 0
  %21 = zext i1 %20 to i64
  %22 = getelementptr i8, i8* %18, i64 %21
  %23 = tail call i8* @__lctrans_cur(i8* noundef nonnull %22) #2
  %24 = tail call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef %2, i64 noundef %3, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* noundef %23) #2
  %25 = add nsw i32 %24, 1
  %26 = sext i32 %25 to i64
  ret i64 %26
}

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i8* @__lctrans_cur(i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @snprintf(i8* noundef, i64 noundef, i8* noundef, ...) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
