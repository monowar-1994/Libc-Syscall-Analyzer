; ModuleID = 'src/thread/pthread_setcanceltype.c'
source_filename = "src/thread/pthread_setcanceltype.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque

; Function Attrs: nounwind optsize strictfp
define i32 @pthread_setcanceltype(i32 noundef %0, i32* noundef writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #2, !srcloc !3
  %4 = inttoptr i64 %3 to %struct.__pthread*
  %5 = icmp ugt i32 %0, 1
  br i1 %5, label %17, label %6

6:                                                ; preds = %2
  %7 = icmp eq i32* %1, null
  br i1 %7, label %12, label %8

8:                                                ; preds = %6
  %9 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %4, i64 0, i32 11
  %10 = load volatile i8, i8* %9, align 1, !tbaa !4
  %11 = zext i8 %10 to i32
  store i32 %11, i32* %1, align 4, !tbaa !12
  br label %12

12:                                               ; preds = %8, %6
  %13 = trunc i32 %0 to i8
  %14 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %4, i64 0, i32 11
  store volatile i8 %13, i8* %14, align 1, !tbaa !4
  %15 = icmp eq i32 %0, 0
  br i1 %15, label %17, label %16

16:                                               ; preds = %12
  tail call void @pthread_testcancel() #3
  br label %17

17:                                               ; preds = %12, %16, %2
  %18 = phi i32 [ 22, %2 ], [ 0, %16 ], [ 0, %12 ]
  ret i32 %18
}

; Function Attrs: optsize
declare void @pthread_testcancel() local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind readnone strictfp }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 234206}
!4 = !{!5, !7, i64 65}
!5 = !{!"__pthread", !6, i64 0, !6, i64 8, !6, i64 16, !6, i64 24, !9, i64 32, !9, i64 40, !10, i64 48, !10, i64 52, !10, i64 56, !10, i64 60, !7, i64 64, !7, i64 65, !7, i64 66, !7, i64 66, !6, i64 72, !9, i64 80, !6, i64 88, !9, i64 96, !9, i64 104, !6, i64 112, !6, i64 120, !6, i64 128, !11, i64 136, !10, i64 160, !10, i64 164, !6, i64 168, !7, i64 176, !6, i64 184, !6, i64 192}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"long", !7, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = !{!"", !6, i64 0, !9, i64 8, !6, i64 16}
!12 = !{!10, !10, i64 0}
