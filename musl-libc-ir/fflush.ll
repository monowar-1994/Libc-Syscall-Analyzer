; ModuleID = 'src/stdio/fflush.c'
source_filename = "src/stdio/fflush.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@dummy = internal global %struct._IO_FILE* null, align 8

@__stdout_used = weak hidden alias %struct._IO_FILE*, %struct._IO_FILE** @dummy
@__stderr_used = weak hidden alias %struct._IO_FILE*, %struct._IO_FILE** @dummy
@fflush_unlocked = weak alias i32 (%struct._IO_FILE*), i32 (%struct._IO_FILE*)* @fflush

; Function Attrs: nounwind optsize strictfp
define i32 @fflush(%struct._IO_FILE* noundef %0) #0 {
  %2 = icmp eq %struct._IO_FILE* %0, null
  br i1 %2, label %3, label %50

3:                                                ; preds = %1
  %4 = load volatile %struct._IO_FILE*, %struct._IO_FILE** @__stdout_used, align 8, !tbaa !3
  %5 = icmp eq %struct._IO_FILE* %4, null
  br i1 %5, label %9, label %6

6:                                                ; preds = %3
  %7 = load volatile %struct._IO_FILE*, %struct._IO_FILE** @__stdout_used, align 8, !tbaa !3
  %8 = tail call i32 @fflush(%struct._IO_FILE* noundef %7) #2
  br label %9

9:                                                ; preds = %6, %3
  %10 = phi i32 [ %8, %6 ], [ 0, %3 ]
  %11 = load volatile %struct._IO_FILE*, %struct._IO_FILE** @__stderr_used, align 8, !tbaa !3
  %12 = icmp eq %struct._IO_FILE* %11, null
  br i1 %12, label %17, label %13

13:                                               ; preds = %9
  %14 = load volatile %struct._IO_FILE*, %struct._IO_FILE** @__stderr_used, align 8, !tbaa !3
  %15 = tail call i32 @fflush(%struct._IO_FILE* noundef %14) #2
  %16 = or i32 %15, %10
  br label %17

17:                                               ; preds = %13, %9
  %18 = phi i32 [ %16, %13 ], [ %10, %9 ]
  %19 = tail call %struct._IO_FILE** @__ofl_lock() #3
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** %19, align 8, !tbaa !3
  %21 = icmp eq %struct._IO_FILE* %20, null
  br i1 %21, label %48, label %22

22:                                               ; preds = %17, %44
  %23 = phi %struct._IO_FILE* [ %46, %44 ], [ %20, %17 ]
  %24 = phi i32 [ %41, %44 ], [ %18, %17 ]
  %25 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %23, i64 0, i32 19
  %26 = load volatile i32, i32* %25, align 4, !tbaa !7
  %27 = icmp sgt i32 %26, -1
  br i1 %27, label %28, label %30

28:                                               ; preds = %22
  %29 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull %23) #3
  br label %30

30:                                               ; preds = %22, %28
  %31 = phi i32 [ %29, %28 ], [ 0, %22 ]
  %32 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %23, i64 0, i32 5
  %33 = load i8*, i8** %32, align 8, !tbaa !11
  %34 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %23, i64 0, i32 7
  %35 = load i8*, i8** %34, align 8, !tbaa !12
  %36 = icmp eq i8* %33, %35
  br i1 %36, label %40, label %37

37:                                               ; preds = %30
  %38 = tail call i32 @fflush(%struct._IO_FILE* noundef nonnull %23) #2
  %39 = or i32 %38, %24
  br label %40

40:                                               ; preds = %30, %37
  %41 = phi i32 [ %39, %37 ], [ %24, %30 ]
  %42 = icmp eq i32 %31, 0
  br i1 %42, label %44, label %43

43:                                               ; preds = %40
  tail call void @__unlockfile(%struct._IO_FILE* noundef nonnull %23) #3
  br label %44

44:                                               ; preds = %43, %40
  %45 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %23, i64 0, i32 14
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** %45, align 8, !tbaa !3
  %47 = icmp eq %struct._IO_FILE* %46, null
  br i1 %47, label %48, label %22

48:                                               ; preds = %44, %17
  %49 = phi i32 [ %18, %17 ], [ %41, %44 ]
  tail call void @__ofl_unlock() #3
  br label %91

50:                                               ; preds = %1
  %51 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 19
  %52 = load volatile i32, i32* %51, align 4, !tbaa !7
  %53 = icmp sgt i32 %52, -1
  br i1 %53, label %54, label %56

54:                                               ; preds = %50
  %55 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull %0) #3
  br label %56

56:                                               ; preds = %50, %54
  %57 = phi i32 [ %55, %54 ], [ 0, %50 ]
  %58 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 5
  %59 = load i8*, i8** %58, align 8, !tbaa !11
  %60 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 7
  %61 = load i8*, i8** %60, align 8, !tbaa !12
  %62 = icmp eq i8* %59, %61
  br i1 %62, label %72, label %63

63:                                               ; preds = %56
  %64 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 9
  %65 = load i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)** %64, align 8, !tbaa !13
  %66 = tail call i64 %65(%struct._IO_FILE* noundef nonnull %0, i8* noundef null, i64 noundef 0) #3
  %67 = load i8*, i8** %58, align 8, !tbaa !11
  %68 = icmp eq i8* %67, null
  br i1 %68, label %69, label %72

69:                                               ; preds = %63
  %70 = icmp eq i32 %57, 0
  br i1 %70, label %91, label %71

71:                                               ; preds = %69
  tail call void @__unlockfile(%struct._IO_FILE* noundef nonnull %0) #3
  br label %91

72:                                               ; preds = %63, %56
  %73 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  %74 = load i8*, i8** %73, align 8, !tbaa !14
  %75 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 2
  %76 = load i8*, i8** %75, align 8, !tbaa !15
  %77 = icmp eq i8* %74, %76
  br i1 %77, label %85, label %78

78:                                               ; preds = %72
  %79 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 10
  %80 = load i64 (%struct._IO_FILE*, i64, i32)*, i64 (%struct._IO_FILE*, i64, i32)** %79, align 8, !tbaa !16
  %81 = ptrtoint i8* %74 to i64
  %82 = ptrtoint i8* %76 to i64
  %83 = sub i64 %81, %82
  %84 = tail call i64 %80(%struct._IO_FILE* noundef nonnull %0, i64 noundef %83, i32 noundef 1) #3
  br label %85

85:                                               ; preds = %78, %72
  %86 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 4
  store i8* null, i8** %60, align 8, !tbaa !12
  %87 = bitcast i8** %86 to <2 x i8*>*
  store <2 x i8*> zeroinitializer, <2 x i8*>* %87, align 8, !tbaa !3
  %88 = bitcast i8** %73 to <2 x i8*>*
  store <2 x i8*> zeroinitializer, <2 x i8*>* %88, align 8, !tbaa !3
  %89 = icmp eq i32 %57, 0
  br i1 %89, label %91, label %90

90:                                               ; preds = %85
  tail call void @__unlockfile(%struct._IO_FILE* noundef nonnull %0) #3
  br label %91

91:                                               ; preds = %71, %69, %90, %85, %48
  %92 = phi i32 [ %49, %48 ], [ -1, %71 ], [ -1, %69 ], [ 0, %90 ], [ 0, %85 ]
  ret i32 %92
}

; Function Attrs: optsize
declare hidden %struct._IO_FILE** @__ofl_lock() local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__unlockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__ofl_unlock() local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin optsize strictfp "no-builtins" }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !9, i64 140}
!8 = !{!"_IO_FILE", !9, i64 0, !4, i64 8, !4, i64 16, !4, i64 24, !4, i64 32, !4, i64 40, !4, i64 48, !4, i64 56, !4, i64 64, !4, i64 72, !4, i64 80, !4, i64 88, !10, i64 96, !4, i64 104, !4, i64 112, !9, i64 120, !9, i64 124, !10, i64 128, !9, i64 136, !9, i64 140, !9, i64 144, !4, i64 152, !10, i64 160, !4, i64 168, !4, i64 176, !4, i64 184, !10, i64 192, !10, i64 200, !4, i64 208, !4, i64 216, !4, i64 224}
!9 = !{!"int", !5, i64 0}
!10 = !{!"long", !5, i64 0}
!11 = !{!8, !4, i64 40}
!12 = !{!8, !4, i64 56}
!13 = !{!8, !4, i64 72}
!14 = !{!8, !4, i64 8}
!15 = !{!8, !4, i64 16}
!16 = !{!8, !4, i64 80}
