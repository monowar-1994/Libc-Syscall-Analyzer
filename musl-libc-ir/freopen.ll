; ModuleID = 'src/stdio/freopen.c'
source_filename = "src/stdio/freopen.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@freopen64 = weak alias %struct._IO_FILE* (i8*, i8*, %struct._IO_FILE*), %struct._IO_FILE* (i8*, i8*, %struct._IO_FILE*)* @freopen

; Function Attrs: nounwind optsize strictfp
define %struct._IO_FILE* @freopen(i8* noalias noundef %0, i8* noalias noundef %1, %struct._IO_FILE* noalias noundef %2) #0 {
  %4 = tail call i32 @__fmodeflags(i8* noundef %1) #2
  %5 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %2, i64 0, i32 19
  %6 = load volatile i32, i32* %5, align 4, !tbaa !3
  %7 = icmp sgt i32 %6, -1
  br i1 %7, label %8, label %10

8:                                                ; preds = %3
  %9 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull %2) #2
  br label %10

10:                                               ; preds = %3, %8
  %11 = phi i32 [ %9, %8 ], [ 0, %3 ]
  %12 = tail call i32 @fflush(%struct._IO_FILE* noundef nonnull %2) #2
  %13 = icmp eq i8* %0, null
  br i1 %13, label %14, label %31

14:                                               ; preds = %10
  %15 = and i32 %4, 524288
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %22, label %17

17:                                               ; preds = %14
  %18 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %2, i64 0, i32 15
  %19 = load i32, i32* %18, align 8, !tbaa !10
  %20 = sext i32 %19 to i64
  %21 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %20, i64 2, i64 1) #3, !srcloc !11
  br label %22

22:                                               ; preds = %17, %14
  %23 = and i32 %4, -524481
  %24 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %2, i64 0, i32 15
  %25 = load i32, i32* %24, align 8, !tbaa !10
  %26 = sext i32 %25 to i64
  %27 = sext i32 %23 to i64
  %28 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %26, i64 4, i64 %27) #3, !srcloc !11
  %29 = tail call i64 @__syscall_ret(i64 noundef %28) #2
  %30 = icmp slt i64 %29, 0
  br i1 %30, label %69, label %64

31:                                               ; preds = %10
  %32 = tail call %struct._IO_FILE* @fopen(i8* noundef nonnull %0, i8* noundef %1) #2
  %33 = icmp eq %struct._IO_FILE* %32, null
  br i1 %33, label %69, label %34

34:                                               ; preds = %31
  %35 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %32, i64 0, i32 15
  %36 = load i32, i32* %35, align 8, !tbaa !10
  %37 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %2, i64 0, i32 15
  %38 = load i32, i32* %37, align 8, !tbaa !10
  %39 = icmp eq i32 %36, %38
  br i1 %39, label %40, label %41

40:                                               ; preds = %34
  store i32 -1, i32* %35, align 8, !tbaa !10
  br label %45

41:                                               ; preds = %34
  %42 = and i32 %4, 524288
  %43 = tail call i32 @__dup3(i32 noundef %36, i32 noundef %38, i32 noundef %42) #2
  %44 = icmp slt i32 %43, 0
  br i1 %44, label %67, label %45

45:                                               ; preds = %41, %40
  %46 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %2, i64 0, i32 0
  %47 = load i32, i32* %46, align 8, !tbaa !12
  %48 = and i32 %47, 1
  %49 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %32, i64 0, i32 0
  %50 = load i32, i32* %49, align 8, !tbaa !12
  %51 = or i32 %48, %50
  store i32 %51, i32* %46, align 8, !tbaa !12
  %52 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %32, i64 0, i32 8
  %53 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %2, i64 0, i32 8
  %54 = bitcast i64 (%struct._IO_FILE*, i8*, i64)** %52 to <2 x i64 (%struct._IO_FILE*, i8*, i64)*>*
  %55 = load <2 x i64 (%struct._IO_FILE*, i8*, i64)*>, <2 x i64 (%struct._IO_FILE*, i8*, i64)*>* %54, align 8, !tbaa !13
  %56 = bitcast i64 (%struct._IO_FILE*, i8*, i64)** %53 to <2 x i64 (%struct._IO_FILE*, i8*, i64)*>*
  store <2 x i64 (%struct._IO_FILE*, i8*, i64)*> %55, <2 x i64 (%struct._IO_FILE*, i8*, i64)*>* %56, align 8, !tbaa !13
  %57 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %32, i64 0, i32 10
  %58 = load i64 (%struct._IO_FILE*, i64, i32)*, i64 (%struct._IO_FILE*, i64, i32)** %57, align 8, !tbaa !14
  %59 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %2, i64 0, i32 10
  store i64 (%struct._IO_FILE*, i64, i32)* %58, i64 (%struct._IO_FILE*, i64, i32)** %59, align 8, !tbaa !14
  %60 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %32, i64 0, i32 3
  %61 = load i32 (%struct._IO_FILE*)*, i32 (%struct._IO_FILE*)** %60, align 8, !tbaa !15
  %62 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %2, i64 0, i32 3
  store i32 (%struct._IO_FILE*)* %61, i32 (%struct._IO_FILE*)** %62, align 8, !tbaa !15
  %63 = tail call i32 @fclose(%struct._IO_FILE* noundef nonnull %32) #2
  br label %64

64:                                               ; preds = %45, %22
  %65 = icmp eq i32 %11, 0
  br i1 %65, label %71, label %66

66:                                               ; preds = %64
  tail call void @__unlockfile(%struct._IO_FILE* noundef nonnull %2) #2
  br label %71

67:                                               ; preds = %41
  %68 = tail call i32 @fclose(%struct._IO_FILE* noundef nonnull %32) #2
  br label %69

69:                                               ; preds = %31, %22, %67
  %70 = tail call i32 @fclose(%struct._IO_FILE* noundef nonnull %2) #2
  br label %71

71:                                               ; preds = %64, %66, %69
  %72 = phi %struct._IO_FILE* [ null, %69 ], [ %2, %66 ], [ %2, %64 ]
  ret %struct._IO_FILE* %72
}

; Function Attrs: optsize
declare hidden i32 @__fmodeflags(i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @fflush(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare %struct._IO_FILE* @fopen(i8* noundef, i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i32 @__dup3(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @fclose(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__unlockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #3 = { nounwind strictfp }

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
!10 = !{!4, !5, i64 120}
!11 = !{i64 71836}
!12 = !{!4, !5, i64 0}
!13 = !{!8, !8, i64 0}
!14 = !{!4, !8, i64 80}
!15 = !{!4, !8, i64 24}
