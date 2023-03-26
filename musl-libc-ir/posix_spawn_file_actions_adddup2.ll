; ModuleID = 'src/process/posix_spawn_file_actions_adddup2.c'
source_filename = "src/process/posix_spawn_file_actions_adddup2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.posix_spawn_file_actions_t = type { [2 x i32], i8*, [16 x i32] }
%struct.fdop = type { %struct.fdop*, %struct.fdop*, i32, i32, i32, i32, i32, [0 x i8] }

; Function Attrs: nounwind optsize strictfp
define i32 @posix_spawn_file_actions_adddup2(%struct.posix_spawn_file_actions_t* nocapture noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = or i32 %2, %1
  %5 = icmp sgt i32 %4, -1
  br i1 %5, label %6, label %27

6:                                                ; preds = %3
  %7 = tail call i8* @__libc_malloc(i64 noundef 40) #2
  %8 = icmp eq i8* %7, null
  br i1 %8, label %27, label %9

9:                                                ; preds = %6
  %10 = getelementptr inbounds i8, i8* %7, i64 16
  %11 = bitcast i8* %10 to i32*
  store i32 2, i32* %11, align 8, !tbaa !3
  %12 = getelementptr inbounds i8, i8* %7, i64 24
  %13 = bitcast i8* %12 to i32*
  store i32 %1, i32* %13, align 8, !tbaa !3
  %14 = getelementptr inbounds i8, i8* %7, i64 20
  %15 = bitcast i8* %14 to i32*
  store i32 %2, i32* %15, align 4, !tbaa !3
  %16 = getelementptr inbounds %struct.posix_spawn_file_actions_t, %struct.posix_spawn_file_actions_t* %0, i64 0, i32 1
  %17 = bitcast i8** %16 to %struct.fdop**
  %18 = load %struct.fdop*, %struct.fdop** %17, align 8, !tbaa !7
  %19 = bitcast i8* %7 to %struct.fdop**
  store %struct.fdop* %18, %struct.fdop** %19, align 8, !tbaa !10
  %20 = icmp eq %struct.fdop* %18, null
  br i1 %20, label %24, label %21

21:                                               ; preds = %9
  %22 = getelementptr inbounds %struct.fdop, %struct.fdop* %18, i64 0, i32 1
  %23 = bitcast %struct.fdop** %22 to i8**
  store i8* %7, i8** %23, align 8, !tbaa !10
  br label %24

24:                                               ; preds = %21, %9
  %25 = getelementptr inbounds i8, i8* %7, i64 8
  %26 = bitcast i8* %25 to %struct.fdop**
  store %struct.fdop* null, %struct.fdop** %26, align 8, !tbaa !10
  store i8* %7, i8** %16, align 8, !tbaa !7
  br label %27

27:                                               ; preds = %24, %6, %3
  %28 = phi i32 [ 9, %3 ], [ 0, %24 ], [ 12, %6 ]
  ret i32 %28
}

; Function Attrs: optsize
declare hidden i8* @__libc_malloc(i64 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !9, i64 8}
!8 = !{!"", !5, i64 0, !9, i64 8, !5, i64 16}
!9 = !{!"any pointer", !5, i64 0}
!10 = !{!9, !9, i64 0}
