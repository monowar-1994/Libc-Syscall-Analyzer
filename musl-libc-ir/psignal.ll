; ModuleID = 'src/signal/psignal.c'
source_filename = "src/signal/psignal.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@__stderr_FILE = external hidden global %struct._IO_FILE, align 8
@.str = private unnamed_addr constant [8 x i8] c"%s%s%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [3 x i8] c": \00", align 1

; Function Attrs: nounwind optsize strictfp
define void @psignal(i32 noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = tail call i8* @strsignal(i32 noundef %0) #3
  %4 = load volatile i32, i32* getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stderr_FILE, i64 0, i32 19), align 4, !tbaa !3
  %5 = icmp sgt i32 %4, -1
  br i1 %5, label %6, label %8

6:                                                ; preds = %2
  %7 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull @__stderr_FILE) #3
  br label %8

8:                                                ; preds = %2, %6
  %9 = phi i32 [ %7, %6 ], [ 0, %2 ]
  %10 = load %struct.__locale_struct*, %struct.__locale_struct** getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stderr_FILE, i64 0, i32 30), align 8, !tbaa !10
  %11 = load i32, i32* getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stderr_FILE, i64 0, i32 18), align 8, !tbaa !11
  %12 = tail call i32* @___errno_location() #4
  %13 = load i32, i32* %12, align 4, !tbaa !12
  %14 = icmp eq i8* %1, null
  %15 = select i1 %14, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0), i8* %1
  %16 = select i1 %14, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0)
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef nonnull @__stderr_FILE, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i8* noundef %15, i8* noundef %16, i8* noundef %3) #3
  %18 = icmp sgt i32 %17, -1
  br i1 %18, label %19, label %20

19:                                               ; preds = %8
  store i32 %13, i32* %12, align 4, !tbaa !12
  br label %20

20:                                               ; preds = %19, %8
  store i32 %11, i32* getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stderr_FILE, i64 0, i32 18), align 8, !tbaa !11
  store %struct.__locale_struct* %10, %struct.__locale_struct** getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stderr_FILE, i64 0, i32 30), align 8, !tbaa !10
  %21 = icmp eq i32 %9, 0
  br i1 %21, label %23, label %22

22:                                               ; preds = %20
  tail call void @__unlockfile(%struct._IO_FILE* noundef nonnull @__stderr_FILE) #3
  br label %23

23:                                               ; preds = %22, %20
  ret void
}

; Function Attrs: optsize
declare i8* @strsignal(i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @fprintf(%struct._IO_FILE* noundef, i8* noundef, ...) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__unlockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 140}
!4 = !{!"_IO_FILE", !5, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !9, i64 96, !8, i64 104, !8, i64 112, !5, i64 120, !5, i64 124, !9, i64 128, !5, i64 136, !5, i64 140, !5, i64 144, !8, i64 152, !9, i64 160, !8, i64 168, !8, i64 176, !8, i64 184, !9, i64 192, !9, i64 200, !8, i64 208, !8, i64 216, !8, i64 224}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{!4, !8, i64 224}
!11 = !{!4, !5, i64 136}
!12 = !{!5, !5, i64 0}
