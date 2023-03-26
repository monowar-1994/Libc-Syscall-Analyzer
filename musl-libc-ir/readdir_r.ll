; ModuleID = 'src/dirent/readdir_r.c'
source_filename = "src/dirent/readdir_r.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__dirstream = type { i64, i32, i32, i32, [1 x i32], [2048 x i8] }
%struct.dirent = type { i64, i64, i16, i8, [256 x i8] }

@readdir64_r = weak alias i32 (%struct.__dirstream*, %struct.dirent*, %struct.dirent**), i32 (%struct.__dirstream*, %struct.dirent*, %struct.dirent**)* @readdir_r

; Function Attrs: nounwind optsize strictfp
define i32 @readdir_r(%struct.__dirstream* noalias noundef %0, %struct.dirent* noalias noundef %1, %struct.dirent** noalias nocapture noundef writeonly %2) #0 {
  %4 = tail call i32* @___errno_location() #3
  %5 = load i32, i32* %4, align 4, !tbaa !3
  %6 = getelementptr inbounds %struct.__dirstream, %struct.__dirstream* %0, i64 0, i32 4, i64 0
  tail call void @__lock(i32* noundef nonnull %6) #4
  store i32 0, i32* %4, align 4, !tbaa !3
  %7 = tail call %struct.dirent* @readdir(%struct.__dirstream* noundef %0) #4
  %8 = load i32, i32* %4, align 4, !tbaa !3
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %11, label %10

10:                                               ; preds = %3
  tail call void @__unlock(i32* noundef nonnull %6) #4
  br label %22

11:                                               ; preds = %3
  store i32 %5, i32* %4, align 4, !tbaa !3
  %12 = icmp eq %struct.dirent* %7, null
  br i1 %12, label %20, label %13

13:                                               ; preds = %11
  %14 = bitcast %struct.dirent* %1 to i8*
  %15 = bitcast %struct.dirent* %7 to i8*
  %16 = getelementptr inbounds %struct.dirent, %struct.dirent* %7, i64 0, i32 2
  %17 = load i16, i16* %16, align 8, !tbaa !7
  %18 = zext i16 %17 to i64
  %19 = tail call i8* @memcpy(i8* noundef %14, i8* noundef nonnull %15, i64 noundef %18) #4
  br label %20

20:                                               ; preds = %11, %13
  %21 = phi %struct.dirent* [ %1, %13 ], [ null, %11 ]
  tail call void @__unlock(i32* noundef nonnull %6) #4
  store %struct.dirent* %21, %struct.dirent** %2, align 8, !tbaa !11
  br label %22

22:                                               ; preds = %20, %10
  ret i32 %8
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__lock(i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare %struct.dirent* @readdir(%struct.__dirstream* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__unlock(i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !10, i64 16}
!8 = !{!"dirent", !9, i64 0, !9, i64 8, !10, i64 16, !5, i64 18, !5, i64 19}
!9 = !{!"long", !5, i64 0}
!10 = !{!"short", !5, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"any pointer", !5, i64 0}
