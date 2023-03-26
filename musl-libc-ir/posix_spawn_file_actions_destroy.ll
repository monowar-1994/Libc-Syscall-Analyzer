; ModuleID = 'src/process/posix_spawn_file_actions_destroy.c'
source_filename = "src/process/posix_spawn_file_actions_destroy.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.posix_spawn_file_actions_t = type { [2 x i32], i8*, [16 x i32] }
%struct.fdop = type { %struct.fdop*, %struct.fdop*, i32, i32, i32, i32, i32, [0 x i8] }

; Function Attrs: nounwind optsize strictfp
define i32 @posix_spawn_file_actions_destroy(%struct.posix_spawn_file_actions_t* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.posix_spawn_file_actions_t, %struct.posix_spawn_file_actions_t* %0, i64 0, i32 1
  %3 = bitcast i8** %2 to %struct.fdop**
  %4 = load %struct.fdop*, %struct.fdop** %3, align 8, !tbaa !3
  %5 = icmp eq %struct.fdop* %4, null
  br i1 %5, label %12, label %6

6:                                                ; preds = %1, %6
  %7 = phi %struct.fdop* [ %9, %6 ], [ %4, %1 ]
  %8 = getelementptr inbounds %struct.fdop, %struct.fdop* %7, i64 0, i32 0
  %9 = load %struct.fdop*, %struct.fdop** %8, align 8, !tbaa !8
  %10 = bitcast %struct.fdop* %7 to i8*
  tail call void @__libc_free(i8* noundef nonnull %10) #2
  %11 = icmp eq %struct.fdop* %9, null
  br i1 %11, label %12, label %6

12:                                               ; preds = %6, %1
  ret i32 0
}

; Function Attrs: optsize
declare hidden void @__libc_free(i8* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !7, i64 8}
!4 = !{!"", !5, i64 0, !7, i64 8, !5, i64 16}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!"any pointer", !5, i64 0}
!8 = !{!7, !7, i64 0}
