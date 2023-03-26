; ModuleID = 'src/process/posix_spawn_file_actions_addopen.c'
source_filename = "src/process/posix_spawn_file_actions_addopen.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.posix_spawn_file_actions_t = type { [2 x i32], i8*, [16 x i32] }
%struct.fdop = type { %struct.fdop*, %struct.fdop*, i32, i32, i32, i32, i32, [0 x i8] }

; Function Attrs: nounwind optsize strictfp
define i32 @posix_spawn_file_actions_addopen(%struct.posix_spawn_file_actions_t* noalias nocapture noundef %0, i32 noundef %1, i8* noalias noundef %2, i32 noundef %3, i32 noundef %4) local_unnamed_addr #0 {
  %6 = icmp slt i32 %1, 0
  br i1 %6, label %34, label %7

7:                                                ; preds = %5
  %8 = tail call i64 @strlen(i8* noundef %2) #2
  %9 = add i64 %8, 41
  %10 = tail call i8* @__libc_malloc(i64 noundef %9) #2
  %11 = icmp eq i8* %10, null
  br i1 %11, label %34, label %12

12:                                               ; preds = %7
  %13 = getelementptr inbounds i8, i8* %10, i64 16
  %14 = bitcast i8* %13 to i32*
  store i32 3, i32* %14, align 8, !tbaa !3
  %15 = getelementptr inbounds i8, i8* %10, i64 20
  %16 = bitcast i8* %15 to i32*
  store i32 %1, i32* %16, align 4, !tbaa !3
  %17 = getelementptr inbounds i8, i8* %10, i64 28
  %18 = bitcast i8* %17 to i32*
  store i32 %3, i32* %18, align 4, !tbaa !3
  %19 = getelementptr inbounds i8, i8* %10, i64 32
  %20 = bitcast i8* %19 to i32*
  store i32 %4, i32* %20, align 8, !tbaa !3
  %21 = getelementptr inbounds i8, i8* %10, i64 36
  %22 = tail call i8* @strcpy(i8* noundef nonnull %21, i8* noundef %2) #2
  %23 = getelementptr inbounds %struct.posix_spawn_file_actions_t, %struct.posix_spawn_file_actions_t* %0, i64 0, i32 1
  %24 = bitcast i8** %23 to %struct.fdop**
  %25 = load %struct.fdop*, %struct.fdop** %24, align 8, !tbaa !7
  %26 = bitcast i8* %10 to %struct.fdop**
  store %struct.fdop* %25, %struct.fdop** %26, align 8, !tbaa !10
  %27 = icmp eq %struct.fdop* %25, null
  br i1 %27, label %31, label %28

28:                                               ; preds = %12
  %29 = getelementptr inbounds %struct.fdop, %struct.fdop* %25, i64 0, i32 1
  %30 = bitcast %struct.fdop** %29 to i8**
  store i8* %10, i8** %30, align 8, !tbaa !10
  br label %31

31:                                               ; preds = %28, %12
  %32 = getelementptr inbounds i8, i8* %10, i64 8
  %33 = bitcast i8* %32 to %struct.fdop**
  store %struct.fdop* null, %struct.fdop** %33, align 8, !tbaa !10
  store i8* %10, i8** %23, align 8, !tbaa !7
  br label %34

34:                                               ; preds = %31, %7, %5
  %35 = phi i32 [ 9, %5 ], [ 0, %31 ], [ 12, %7 ]
  ret i32 %35
}

; Function Attrs: optsize
declare hidden i8* @__libc_malloc(i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @strcpy(i8* noundef, i8* noundef) local_unnamed_addr #1

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
