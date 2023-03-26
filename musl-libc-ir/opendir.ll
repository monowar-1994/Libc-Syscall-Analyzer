; ModuleID = 'src/dirent/opendir.c'
source_filename = "src/dirent/opendir.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__dirstream = type { i64, i32, i32, i32, [1 x i32], [2048 x i8] }

; Function Attrs: nounwind optsize strictfp
define %struct.__dirstream* @opendir(i8* noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 (i8*, i32, ...) @open(i8* noundef %0, i32 noundef 589824) #2
  %3 = icmp slt i32 %2, 0
  br i1 %3, label %14, label %4

4:                                                ; preds = %1
  %5 = tail call i8* @calloc(i64 noundef 1, i64 noundef 2072) #2
  %6 = icmp eq i8* %5, null
  br i1 %6, label %7, label %10

7:                                                ; preds = %4
  %8 = zext i32 %2 to i64
  %9 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 3, i64 %8) #3, !srcloc !3
  br label %14

10:                                               ; preds = %4
  %11 = bitcast i8* %5 to %struct.__dirstream*
  %12 = getelementptr inbounds i8, i8* %5, i64 8
  %13 = bitcast i8* %12 to i32*
  store i32 %2, i32* %13, align 8, !tbaa !4
  br label %14

14:                                               ; preds = %1, %10, %7
  %15 = phi %struct.__dirstream* [ %11, %10 ], [ null, %7 ], [ null, %1 ]
  ret %struct.__dirstream* %15
}

; Function Attrs: optsize
declare i32 @open(i8* noundef, i32 noundef, ...) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #3 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 109359}
!4 = !{!5, !9, i64 8}
!5 = !{!"__dirstream", !6, i64 0, !9, i64 8, !9, i64 12, !9, i64 16, !7, i64 20, !7, i64 24}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
