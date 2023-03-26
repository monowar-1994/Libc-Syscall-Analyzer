; ModuleID = 'src/process/posix_spawn_file_actions_addclose.c'
source_filename = "src/process/posix_spawn_file_actions_addclose.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.posix_spawn_file_actions_t = type { [2 x i32], i8*, [16 x i32] }
%struct.fdop = type { %struct.fdop*, %struct.fdop*, i32, i32, i32, i32, i32, [0 x i8] }

; Function Attrs: nounwind optsize strictfp
define i32 @posix_spawn_file_actions_addclose(%struct.posix_spawn_file_actions_t* nocapture noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp slt i32 %1, 0
  br i1 %3, label %23, label %4

4:                                                ; preds = %2
  %5 = tail call i8* @__libc_malloc(i64 noundef 40) #2
  %6 = icmp eq i8* %5, null
  br i1 %6, label %23, label %7

7:                                                ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 16
  %9 = bitcast i8* %8 to i32*
  store i32 1, i32* %9, align 8, !tbaa !3
  %10 = getelementptr inbounds i8, i8* %5, i64 20
  %11 = bitcast i8* %10 to i32*
  store i32 %1, i32* %11, align 4, !tbaa !3
  %12 = getelementptr inbounds %struct.posix_spawn_file_actions_t, %struct.posix_spawn_file_actions_t* %0, i64 0, i32 1
  %13 = bitcast i8** %12 to %struct.fdop**
  %14 = load %struct.fdop*, %struct.fdop** %13, align 8, !tbaa !7
  %15 = bitcast i8* %5 to %struct.fdop**
  store %struct.fdop* %14, %struct.fdop** %15, align 8, !tbaa !10
  %16 = icmp eq %struct.fdop* %14, null
  br i1 %16, label %20, label %17

17:                                               ; preds = %7
  %18 = getelementptr inbounds %struct.fdop, %struct.fdop* %14, i64 0, i32 1
  %19 = bitcast %struct.fdop** %18 to i8**
  store i8* %5, i8** %19, align 8, !tbaa !10
  br label %20

20:                                               ; preds = %17, %7
  %21 = getelementptr inbounds i8, i8* %5, i64 8
  %22 = bitcast i8* %21 to %struct.fdop**
  store %struct.fdop* null, %struct.fdop** %22, align 8, !tbaa !10
  store i8* %5, i8** %12, align 8, !tbaa !7
  br label %23

23:                                               ; preds = %20, %4, %2
  %24 = phi i32 [ 9, %2 ], [ 0, %20 ], [ 12, %4 ]
  ret i32 %24
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
