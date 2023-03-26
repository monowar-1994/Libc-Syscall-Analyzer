; ModuleID = 'src/exit/atexit.c'
source_filename = "src/exit/atexit.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.fl = type { %struct.fl*, [32 x void (i8*)*], [32 x i8*] }

@lock = internal global [1 x i32] zeroinitializer, align 4
@__atexit_lockptr = hidden local_unnamed_addr constant i32* getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0), align 8
@head = internal unnamed_addr global %struct.fl* null, align 8
@slot = internal unnamed_addr global i32 0, align 4
@builtin = internal global %struct.fl zeroinitializer, align 8

; Function Attrs: nounwind optsize strictfp
define hidden void @__funcs_on_exit() local_unnamed_addr #0 {
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #3
  %1 = load %struct.fl*, %struct.fl** @head, align 8, !tbaa !3
  %2 = icmp eq %struct.fl* %1, null
  br i1 %2, label %27, label %3

3:                                                ; preds = %0
  %4 = load i32, i32* @slot, align 4, !tbaa !7
  br label %5

5:                                                ; preds = %3, %22
  %6 = phi %struct.fl* [ %1, %3 ], [ %25, %22 ]
  %7 = phi i32 [ %4, %3 ], [ 32, %22 ]
  %8 = add nsw i32 %7, -1
  store i32 %8, i32* @slot, align 4, !tbaa !7
  %9 = icmp sgt i32 %7, 0
  br i1 %9, label %10, label %22

10:                                               ; preds = %5, %10
  %11 = phi %struct.fl* [ %21, %10 ], [ %6, %5 ]
  %12 = phi i32 [ %19, %10 ], [ %8, %5 ]
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds %struct.fl, %struct.fl* %11, i64 0, i32 1, i64 %13
  %15 = load void (i8*)*, void (i8*)** %14, align 8, !tbaa !3
  %16 = getelementptr inbounds %struct.fl, %struct.fl* %11, i64 0, i32 2, i64 %13
  %17 = load i8*, i8** %16, align 8, !tbaa !3
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #3
  tail call void %15(i8* noundef %17) #3
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #3
  %18 = load i32, i32* @slot, align 4, !tbaa !7
  %19 = add nsw i32 %18, -1
  store i32 %19, i32* @slot, align 4, !tbaa !7
  %20 = icmp sgt i32 %18, 0
  %21 = load %struct.fl*, %struct.fl** @head, align 8, !tbaa !3
  br i1 %20, label %10, label %22

22:                                               ; preds = %10, %5
  %23 = phi %struct.fl* [ %6, %5 ], [ %21, %10 ]
  %24 = getelementptr inbounds %struct.fl, %struct.fl* %23, i64 0, i32 0
  %25 = load %struct.fl*, %struct.fl** %24, align 8, !tbaa !9
  store %struct.fl* %25, %struct.fl** @head, align 8, !tbaa !3
  store i32 32, i32* @slot, align 4, !tbaa !7
  %26 = icmp eq %struct.fl* %25, null
  br i1 %26, label %27, label %5

27:                                               ; preds = %22, %0
  ret void
}

; Function Attrs: optsize
declare hidden void @__lock(i32* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__unlock(i32* noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define void @__cxa_finalize(i8* nocapture noundef %0) local_unnamed_addr #2 {
  ret void
}

; Function Attrs: nounwind optsize strictfp
define i32 @__cxa_atexit(void (i8*)* noundef %0, i8* noundef %1, i8* nocapture readnone %2) local_unnamed_addr #0 {
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #3
  %4 = load %struct.fl*, %struct.fl** @head, align 8, !tbaa !3
  %5 = icmp eq %struct.fl* %4, null
  br i1 %5, label %6, label %7

6:                                                ; preds = %3
  store %struct.fl* @builtin, %struct.fl** @head, align 8, !tbaa !3
  br label %7

7:                                                ; preds = %6, %3
  %8 = phi %struct.fl* [ @builtin, %6 ], [ %4, %3 ]
  %9 = load i32, i32* @slot, align 4, !tbaa !7
  %10 = icmp eq i32 %9, 32
  br i1 %10, label %11, label %18

11:                                               ; preds = %7
  %12 = tail call i8* @__libc_calloc(i64 noundef 520, i64 noundef 1) #3
  %13 = icmp eq i8* %12, null
  br i1 %13, label %25, label %14

14:                                               ; preds = %11
  %15 = load %struct.fl*, %struct.fl** @head, align 8, !tbaa !3
  %16 = bitcast i8* %12 to %struct.fl**
  store %struct.fl* %15, %struct.fl** %16, align 8, !tbaa !9
  store i8* %12, i8** bitcast (%struct.fl** @head to i8**), align 8, !tbaa !3
  %17 = bitcast i8* %12 to %struct.fl*
  br label %18

18:                                               ; preds = %14, %7
  %19 = phi i32 [ 0, %14 ], [ %9, %7 ]
  %20 = phi %struct.fl* [ %17, %14 ], [ %8, %7 ]
  %21 = sext i32 %19 to i64
  %22 = getelementptr inbounds %struct.fl, %struct.fl* %20, i64 0, i32 1, i64 %21
  store void (i8*)* %0, void (i8*)** %22, align 8, !tbaa !3
  %23 = getelementptr inbounds %struct.fl, %struct.fl* %20, i64 0, i32 2, i64 %21
  store i8* %1, i8** %23, align 8, !tbaa !3
  %24 = add nsw i32 %19, 1
  store i32 %24, i32* @slot, align 4, !tbaa !7
  br label %25

25:                                               ; preds = %11, %18
  %26 = phi i32 [ 0, %18 ], [ -1, %11 ]
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #3
  ret i32 %26
}

; Function Attrs: optsize
declare hidden i8* @__libc_calloc(i64 noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i32 @atexit(void ()* noundef %0) local_unnamed_addr #0 {
  %2 = bitcast void ()* %0 to i8*
  %3 = tail call i32 @__cxa_atexit(void (i8*)* noundef nonnull @call, i8* noundef %2, i8* undef) #4
  ret i32 %3
}

; Function Attrs: nounwind optsize strictfp
define internal void @call(i8* nocapture noundef readonly %0) #0 {
  %2 = bitcast i8* %0 to void ()*
  tail call void %2() #3
  ret void
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
!9 = !{!10, !4, i64 0}
!10 = !{!"fl", !4, i64 0, !5, i64 8, !5, i64 264}
