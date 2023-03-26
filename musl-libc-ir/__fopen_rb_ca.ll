; ModuleID = 'src/stdio/__fopen_rb_ca.c'
source_filename = "src/stdio/__fopen_rb_ca.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

; Function Attrs: nounwind optsize strictfp
define hidden %struct._IO_FILE* @__fopen_rb_ca(i8* noundef %0, %struct._IO_FILE* noundef %1, i8* noundef %2, i64 noundef %3) local_unnamed_addr #0 {
  %5 = bitcast %struct._IO_FILE* %1 to i8*
  %6 = tail call i8* @memset(i8* noundef %5, i32 noundef 0, i64 noundef 232) #2
  %7 = ptrtoint i8* %0 to i64
  %8 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 2, i64 %7, i64 557056) #3, !srcloc !3
  %9 = tail call i64 @__syscall_ret(i64 noundef %8) #2
  %10 = trunc i64 %9 to i32
  %11 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 15
  store i32 %10, i32* %11, align 8, !tbaa !4
  %12 = icmp slt i32 %10, 0
  br i1 %12, label %26, label %13

13:                                               ; preds = %4
  %14 = shl i64 %9, 32
  %15 = ashr exact i64 %14, 32
  %16 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %15, i64 2, i64 1) #3, !srcloc !11
  %17 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 0
  store i32 9, i32* %17, align 8, !tbaa !12
  %18 = getelementptr inbounds i8, i8* %2, i64 8
  %19 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 11
  store i8* %18, i8** %19, align 8, !tbaa !13
  %20 = add i64 %3, -8
  %21 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 12
  store i64 %20, i64* %21, align 8, !tbaa !14
  %22 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 8
  store i64 (%struct._IO_FILE*, i8*, i64)* @__stdio_read, i64 (%struct._IO_FILE*, i8*, i64)** %22, align 8, !tbaa !15
  %23 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 10
  store i64 (%struct._IO_FILE*, i64, i32)* @__stdio_seek, i64 (%struct._IO_FILE*, i64, i32)** %23, align 8, !tbaa !16
  %24 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 3
  store i32 (%struct._IO_FILE*)* @__stdio_close, i32 (%struct._IO_FILE*)** %24, align 8, !tbaa !17
  %25 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 19
  store volatile i32 -1, i32* %25, align 4, !tbaa !18
  br label %26

26:                                               ; preds = %4, %13
  %27 = phi %struct._IO_FILE* [ %1, %13 ], [ null, %4 ]
  ret %struct._IO_FILE* %27
}

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i64 @__stdio_read(%struct._IO_FILE* noundef, i8* noundef, i64 noundef) #1

; Function Attrs: optsize
declare hidden i64 @__stdio_seek(%struct._IO_FILE* noundef, i64 noundef, i32 noundef) #1

; Function Attrs: optsize
declare hidden i32 @__stdio_close(%struct._IO_FILE* noundef) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #3 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 70878}
!4 = !{!5, !6, i64 120}
!5 = !{!"_IO_FILE", !6, i64 0, !9, i64 8, !9, i64 16, !9, i64 24, !9, i64 32, !9, i64 40, !9, i64 48, !9, i64 56, !9, i64 64, !9, i64 72, !9, i64 80, !9, i64 88, !10, i64 96, !9, i64 104, !9, i64 112, !6, i64 120, !6, i64 124, !10, i64 128, !6, i64 136, !6, i64 140, !6, i64 144, !9, i64 152, !10, i64 160, !9, i64 168, !9, i64 176, !9, i64 184, !10, i64 192, !10, i64 200, !9, i64 208, !9, i64 216, !9, i64 224}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"any pointer", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{i64 71090}
!12 = !{!5, !6, i64 0}
!13 = !{!5, !9, i64 88}
!14 = !{!5, !10, i64 96}
!15 = !{!5, !9, i64 64}
!16 = !{!5, !9, i64 80}
!17 = !{!5, !9, i64 24}
!18 = !{!5, !6, i64 140}
