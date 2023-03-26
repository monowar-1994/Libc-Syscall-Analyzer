; ModuleID = 'src/stdio/fopen.c'
source_filename = "src/stdio/fopen.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@.str = private unnamed_addr constant [4 x i8] c"rwa\00", align 1

@fopen64 = weak alias %struct._IO_FILE* (i8*, i8*), %struct._IO_FILE* (i8*, i8*)* @fopen

; Function Attrs: nounwind optsize strictfp
define %struct._IO_FILE* @fopen(i8* noalias noundef %0, i8* noalias noundef %1) #0 {
  %3 = load i8, i8* %1, align 1, !tbaa !3
  %4 = sext i8 %3 to i32
  %5 = tail call i8* @strchr(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef %4) #3
  %6 = icmp eq i8* %5, null
  br i1 %6, label %7, label %9

7:                                                ; preds = %2
  %8 = tail call i32* @___errno_location() #4
  store i32 22, i32* %8, align 4, !tbaa !6
  br label %32

9:                                                ; preds = %2
  %10 = tail call i32 @__fmodeflags(i8* noundef nonnull %1) #3
  %11 = ptrtoint i8* %0 to i64
  %12 = or i32 %10, 32768
  %13 = sext i32 %12 to i64
  %14 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 2, i64 %11, i64 %13, i64 438) #5, !srcloc !8
  %15 = tail call i64 @__syscall_ret(i64 noundef %14) #3
  %16 = trunc i64 %15 to i32
  %17 = icmp slt i32 %16, 0
  br i1 %17, label %32, label %18

18:                                               ; preds = %9
  %19 = and i32 %10, 524288
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %25, label %21

21:                                               ; preds = %18
  %22 = shl i64 %15, 32
  %23 = ashr exact i64 %22, 32
  %24 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %23, i64 2, i64 1) #5, !srcloc !8
  br label %25

25:                                               ; preds = %21, %18
  %26 = tail call %struct._IO_FILE* @__fdopen(i32 noundef %16, i8* noundef nonnull %1) #3
  %27 = icmp eq %struct._IO_FILE* %26, null
  br i1 %27, label %28, label %32

28:                                               ; preds = %25
  %29 = shl i64 %15, 32
  %30 = ashr exact i64 %29, 32
  %31 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 3, i64 %30) #5, !srcloc !9
  br label %32

32:                                               ; preds = %25, %9, %28, %7
  %33 = phi %struct._IO_FILE* [ null, %28 ], [ null, %7 ], [ null, %9 ], [ %26, %25 ]
  ret %struct._IO_FILE* %33
}

; Function Attrs: optsize
declare i8* @strchr(i8* noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__fmodeflags(i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden %struct._IO_FILE* @__fdopen(i32 noundef, i8* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #5 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
!8 = !{i64 71220}
!9 = !{i64 70822}
