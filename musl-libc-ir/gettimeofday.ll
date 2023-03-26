; ModuleID = 'src/time/gettimeofday.c'
source_filename = "src/time/gettimeofday.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timeval = type { i64, i64 }
%struct.timespec = type { i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @gettimeofday(%struct.timeval* noalias noundef writeonly %0, i8* noalias nocapture noundef readnone %1) local_unnamed_addr #0 {
  %3 = alloca %struct.timespec, align 8
  %4 = bitcast %struct.timespec* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %4) #3
  %5 = icmp eq %struct.timeval* %0, null
  br i1 %5, label %17, label %6

6:                                                ; preds = %2
  %7 = call i32 @clock_gettime(i32 noundef 0, %struct.timespec* noundef nonnull %3) #4
  %8 = getelementptr inbounds %struct.timespec, %struct.timespec* %3, i64 0, i32 0
  %9 = load i64, i64* %8, align 8, !tbaa !3
  %10 = getelementptr inbounds %struct.timeval, %struct.timeval* %0, i64 0, i32 0
  store i64 %9, i64* %10, align 8, !tbaa !8
  %11 = getelementptr inbounds %struct.timespec, %struct.timespec* %3, i64 0, i32 1
  %12 = load i64, i64* %11, align 8, !tbaa !10
  %13 = trunc i64 %12 to i32
  %14 = sdiv i32 %13, 1000
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds %struct.timeval, %struct.timeval* %0, i64 0, i32 1
  store i64 %15, i64* %16, align 8, !tbaa !11
  br label %17

17:                                               ; preds = %2, %6
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %4) #3
  ret i32 0
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @clock_gettime(i32 noundef, %struct.timespec* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"timespec", !5, i64 0, !5, i64 8}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9, !5, i64 0}
!9 = !{!"timeval", !5, i64 0, !5, i64 8}
!10 = !{!4, !5, i64 8}
!11 = !{!9, !5, i64 8}
