; ModuleID = 'src/string/strsignal.c'
source_filename = "src/string/strsignal.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@strings = internal constant [671 x i8] c"Unknown signal\00Hangup\00Interrupt\00Quit\00Illegal instruction\00Trace/breakpoint trap\00Aborted\00Bus error\00Arithmetic exception\00Killed\00User defined signal 1\00Segmentation fault\00User defined signal 2\00Broken pipe\00Alarm clock\00Terminated\00Stack fault\00Child process status\00Continued\00Stopped (signal)\00Stopped\00Stopped (tty input)\00Stopped (tty output)\00Urgent I/O condition\00CPU time limit exceeded\00File size limit exceeded\00Virtual timer expired\00Profiling timer expired\00Window changed\00I/O possible\00Power failure\00Bad system call\00RT32\00RT33\00RT34\00RT35\00RT36\00RT37\00RT38\00RT39\00RT40\00RT41\00RT42\00RT43\00RT44\00RT45\00RT46\00RT47\00RT48\00RT49\00RT50\00RT51\00RT52\00RT53\00RT54\00RT55\00RT56\00RT57\00RT58\00RT59\00RT60\00RT61\00RT62\00RT63\00RT64\00", align 16

; Function Attrs: nounwind strictfp
define i8* @strsignal(i32 noundef %0) local_unnamed_addr #0 {
  %2 = add i32 %0, -65
  %3 = icmp ult i32 %2, -64
  br i1 %3, label %52, label %4

4:                                                ; preds = %1
  %5 = add i32 %0, -1
  %6 = and i32 %0, 3
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %21, label %8

8:                                                ; preds = %4, %17
  %9 = phi i32 [ %18, %17 ], [ %0, %4 ]
  %10 = phi i8* [ %16, %17 ], [ getelementptr inbounds ([671 x i8], [671 x i8]* @strings, i64 0, i64 0), %4 ]
  %11 = phi i32 [ %19, %17 ], [ 0, %4 ]
  br label %12

12:                                               ; preds = %12, %8
  %13 = phi i8* [ %16, %12 ], [ %10, %8 ]
  %14 = load i8, i8* %13, align 1, !tbaa !3
  %15 = icmp eq i8 %14, 0
  %16 = getelementptr inbounds i8, i8* %13, i64 1
  br i1 %15, label %17, label %12

17:                                               ; preds = %12
  %18 = add nsw i32 %9, -1
  %19 = add i32 %11, 1
  %20 = icmp eq i32 %19, %6
  br i1 %20, label %21, label %8, !llvm.loop !6

21:                                               ; preds = %17, %4
  %22 = phi i8* [ undef, %4 ], [ %16, %17 ]
  %23 = phi i32 [ %0, %4 ], [ %18, %17 ]
  %24 = phi i8* [ getelementptr inbounds ([671 x i8], [671 x i8]* @strings, i64 0, i64 0), %4 ], [ %16, %17 ]
  %25 = icmp ult i32 %5, 3
  br i1 %25, label %52, label %26

26:                                               ; preds = %21, %49
  %27 = phi i32 [ %50, %49 ], [ %23, %21 ]
  %28 = phi i8* [ %48, %49 ], [ %24, %21 ]
  br label %29

29:                                               ; preds = %29, %26
  %30 = phi i8* [ %33, %29 ], [ %28, %26 ]
  %31 = load i8, i8* %30, align 1, !tbaa !3
  %32 = icmp eq i8 %31, 0
  %33 = getelementptr inbounds i8, i8* %30, i64 1
  br i1 %32, label %34, label %29

34:                                               ; preds = %29, %34
  %35 = phi i8* [ %38, %34 ], [ %33, %29 ]
  %36 = load i8, i8* %35, align 1, !tbaa !3
  %37 = icmp eq i8 %36, 0
  %38 = getelementptr inbounds i8, i8* %35, i64 1
  br i1 %37, label %39, label %34

39:                                               ; preds = %34, %39
  %40 = phi i8* [ %43, %39 ], [ %38, %34 ]
  %41 = load i8, i8* %40, align 1, !tbaa !3
  %42 = icmp eq i8 %41, 0
  %43 = getelementptr inbounds i8, i8* %40, i64 1
  br i1 %42, label %44, label %39

44:                                               ; preds = %39, %44
  %45 = phi i8* [ %48, %44 ], [ %43, %39 ]
  %46 = load i8, i8* %45, align 1, !tbaa !3
  %47 = icmp eq i8 %46, 0
  %48 = getelementptr inbounds i8, i8* %45, i64 1
  br i1 %47, label %49, label %44

49:                                               ; preds = %44
  %50 = add nsw i32 %27, -4
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %26

52:                                               ; preds = %21, %49, %1
  %53 = phi i8* [ getelementptr inbounds ([671 x i8], [671 x i8]* @strings, i64 0, i64 0), %1 ], [ %22, %21 ], [ %48, %49 ]
  %54 = tail call i8* @__lctrans_cur(i8* noundef nonnull %53) #2
  ret i8* %54
}

declare hidden i8* @__lctrans_cur(i8* noundef) local_unnamed_addr #1

attributes #0 = { nounwind strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.unroll.disable"}
