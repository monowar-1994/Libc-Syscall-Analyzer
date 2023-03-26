; ModuleID = 'src/process/posix_spawn_file_actions_addchdir.c'
source_filename = "src/process/posix_spawn_file_actions_addchdir.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.posix_spawn_file_actions_t = type { [2 x i32], i8*, [16 x i32] }
%struct.fdop = type { %struct.fdop*, %struct.fdop*, i32, i32, i32, i32, i32, [0 x i8] }

; Function Attrs: nounwind optsize strictfp
define i32 @posix_spawn_file_actions_addchdir_np(%struct.posix_spawn_file_actions_t* noalias nocapture noundef %0, i8* noalias noundef %1) local_unnamed_addr #0 {
  %3 = tail call i64 @strlen(i8* noundef %1) #2
  %4 = add i64 %3, 41
  %5 = tail call i8* @__libc_malloc(i64 noundef %4) #2
  %6 = icmp eq i8* %5, null
  br i1 %6, label %25, label %7

7:                                                ; preds = %2
  %8 = getelementptr inbounds i8, i8* %5, i64 16
  %9 = bitcast i8* %8 to i32*
  store i32 4, i32* %9, align 8, !tbaa !3
  %10 = getelementptr inbounds i8, i8* %5, i64 20
  %11 = bitcast i8* %10 to i32*
  store i32 -1, i32* %11, align 4, !tbaa !3
  %12 = getelementptr inbounds i8, i8* %5, i64 36
  %13 = tail call i8* @strcpy(i8* noundef nonnull %12, i8* noundef %1) #2
  %14 = getelementptr inbounds %struct.posix_spawn_file_actions_t, %struct.posix_spawn_file_actions_t* %0, i64 0, i32 1
  %15 = bitcast i8** %14 to %struct.fdop**
  %16 = load %struct.fdop*, %struct.fdop** %15, align 8, !tbaa !7
  %17 = bitcast i8* %5 to %struct.fdop**
  store %struct.fdop* %16, %struct.fdop** %17, align 8, !tbaa !10
  %18 = icmp eq %struct.fdop* %16, null
  br i1 %18, label %22, label %19

19:                                               ; preds = %7
  %20 = getelementptr inbounds %struct.fdop, %struct.fdop* %16, i64 0, i32 1
  %21 = bitcast %struct.fdop** %20 to i8**
  store i8* %5, i8** %21, align 8, !tbaa !10
  br label %22

22:                                               ; preds = %19, %7
  %23 = getelementptr inbounds i8, i8* %5, i64 8
  %24 = bitcast i8* %23 to %struct.fdop**
  store %struct.fdop* null, %struct.fdop** %24, align 8, !tbaa !10
  store i8* %5, i8** %14, align 8, !tbaa !7
  br label %25

25:                                               ; preds = %2, %22
  %26 = phi i32 [ 0, %22 ], [ 12, %2 ]
  ret i32 %26
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
