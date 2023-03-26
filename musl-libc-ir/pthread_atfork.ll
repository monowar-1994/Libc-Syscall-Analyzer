; ModuleID = 'src/thread/pthread_atfork.c'
source_filename = "src/thread/pthread_atfork.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.atfork_funcs = type { void ()*, void ()*, void ()*, %struct.atfork_funcs*, %struct.atfork_funcs* }

@funcs = internal unnamed_addr global %struct.atfork_funcs* null, align 8
@lock = internal global [1 x i32] zeroinitializer, align 4

; Function Attrs: nounwind optsize strictfp
define hidden void @__fork_handler(i32 noundef %0) local_unnamed_addr #0 {
  %2 = load %struct.atfork_funcs*, %struct.atfork_funcs** @funcs, align 8, !tbaa !3
  %3 = icmp eq %struct.atfork_funcs* %2, null
  br i1 %3, label %38, label %4

4:                                                ; preds = %1
  %5 = icmp slt i32 %0, 0
  br i1 %5, label %8, label %6

6:                                                ; preds = %4
  %7 = icmp eq i32 %0, 0
  br label %21

8:                                                ; preds = %4
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #2
  %9 = load %struct.atfork_funcs*, %struct.atfork_funcs** @funcs, align 8, !tbaa !3
  %10 = icmp eq %struct.atfork_funcs* %9, null
  br i1 %10, label %38, label %11

11:                                               ; preds = %8, %17
  %12 = phi %struct.atfork_funcs* [ %19, %17 ], [ %9, %8 ]
  %13 = getelementptr inbounds %struct.atfork_funcs, %struct.atfork_funcs* %12, i64 0, i32 0
  %14 = load void ()*, void ()** %13, align 8, !tbaa !7
  %15 = icmp eq void ()* %14, null
  br i1 %15, label %17, label %16

16:                                               ; preds = %11
  tail call void %14() #2
  br label %17

17:                                               ; preds = %16, %11
  store %struct.atfork_funcs* %12, %struct.atfork_funcs** @funcs, align 8, !tbaa !3
  %18 = getelementptr inbounds %struct.atfork_funcs, %struct.atfork_funcs* %12, i64 0, i32 4
  %19 = load %struct.atfork_funcs*, %struct.atfork_funcs** %18, align 8, !tbaa !3
  %20 = icmp eq %struct.atfork_funcs* %19, null
  br i1 %20, label %38, label %11

21:                                               ; preds = %6, %33
  %22 = phi %struct.atfork_funcs* [ %35, %33 ], [ %2, %6 ]
  br i1 %7, label %23, label %27

23:                                               ; preds = %21
  %24 = getelementptr inbounds %struct.atfork_funcs, %struct.atfork_funcs* %22, i64 0, i32 1
  %25 = load void ()*, void ()** %24, align 8, !tbaa !9
  %26 = icmp eq void ()* %25, null
  br i1 %26, label %33, label %31

27:                                               ; preds = %21
  %28 = getelementptr inbounds %struct.atfork_funcs, %struct.atfork_funcs* %22, i64 0, i32 2
  %29 = load void ()*, void ()** %28, align 8, !tbaa !10
  %30 = icmp eq void ()* %29, null
  br i1 %30, label %33, label %31

31:                                               ; preds = %27, %23
  %32 = phi void ()* [ %25, %23 ], [ %29, %27 ]
  tail call void %32() #2
  br label %33

33:                                               ; preds = %31, %23, %27
  store %struct.atfork_funcs* %22, %struct.atfork_funcs** @funcs, align 8, !tbaa !3
  %34 = getelementptr inbounds %struct.atfork_funcs, %struct.atfork_funcs* %22, i64 0, i32 3
  %35 = load %struct.atfork_funcs*, %struct.atfork_funcs** %34, align 8, !tbaa !11
  %36 = icmp eq %struct.atfork_funcs* %35, null
  br i1 %36, label %37, label %21

37:                                               ; preds = %33
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #2
  br label %38

38:                                               ; preds = %17, %8, %37, %1
  ret void
}

; Function Attrs: optsize
declare hidden void @__lock(i32* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__unlock(i32* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i32 @pthread_atfork(void ()* noundef %0, void ()* noundef %1, void ()* noundef %2) local_unnamed_addr #0 {
  %4 = tail call i8* @malloc(i64 noundef 40) #2
  %5 = icmp eq i8* %4, null
  br i1 %5, label %23, label %6

6:                                                ; preds = %3
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #2
  %7 = load %struct.atfork_funcs*, %struct.atfork_funcs** @funcs, align 8, !tbaa !3
  %8 = getelementptr inbounds i8, i8* %4, i64 32
  %9 = bitcast i8* %8 to %struct.atfork_funcs**
  store %struct.atfork_funcs* %7, %struct.atfork_funcs** %9, align 8, !tbaa !12
  %10 = getelementptr inbounds i8, i8* %4, i64 24
  %11 = bitcast i8* %10 to %struct.atfork_funcs**
  store %struct.atfork_funcs* null, %struct.atfork_funcs** %11, align 8, !tbaa !11
  %12 = bitcast i8* %4 to void ()**
  store void ()* %0, void ()** %12, align 8, !tbaa !7
  %13 = getelementptr inbounds i8, i8* %4, i64 8
  %14 = bitcast i8* %13 to void ()**
  store void ()* %1, void ()** %14, align 8, !tbaa !9
  %15 = getelementptr inbounds i8, i8* %4, i64 16
  %16 = bitcast i8* %15 to void ()**
  store void ()* %2, void ()** %16, align 8, !tbaa !10
  %17 = load %struct.atfork_funcs*, %struct.atfork_funcs** @funcs, align 8, !tbaa !3
  %18 = icmp eq %struct.atfork_funcs* %17, null
  br i1 %18, label %22, label %19

19:                                               ; preds = %6
  %20 = getelementptr inbounds %struct.atfork_funcs, %struct.atfork_funcs* %17, i64 0, i32 3
  %21 = bitcast %struct.atfork_funcs** %20 to i8**
  store i8* %4, i8** %21, align 8, !tbaa !11
  br label %22

22:                                               ; preds = %19, %6
  store i8* %4, i8** bitcast (%struct.atfork_funcs** @funcs to i8**), align 8, !tbaa !3
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #2
  br label %23

23:                                               ; preds = %3, %22
  %24 = phi i32 [ 0, %22 ], [ -1, %3 ]
  ret i32 %24
}

; Function Attrs: optsize
declare i8* @malloc(i64 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !4, i64 0}
!8 = !{!"atfork_funcs", !4, i64 0, !4, i64 8, !4, i64 16, !4, i64 24, !4, i64 32}
!9 = !{!8, !4, i64 8}
!10 = !{!8, !4, i64 16}
!11 = !{!8, !4, i64 24}
!12 = !{!8, !4, i64 32}
