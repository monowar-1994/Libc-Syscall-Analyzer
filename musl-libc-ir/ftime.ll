; ModuleID = 'src/time/ftime.c'
source_filename = "src/time/ftime.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timeb = type { i64, i16, i16, i16 }
%struct.timespec = type { i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @ftime(%struct.timeb* nocapture noundef writeonly %0) local_unnamed_addr #0 {
  %2 = alloca %struct.timespec, align 8
  %3 = bitcast %struct.timespec* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3) #3
  %4 = call i32 @clock_gettime(i32 noundef 0, %struct.timespec* noundef nonnull %2) #4
  %5 = getelementptr inbounds %struct.timespec, %struct.timespec* %2, i64 0, i32 0
  %6 = load i64, i64* %5, align 8, !tbaa !3
  %7 = getelementptr inbounds %struct.timeb, %struct.timeb* %0, i64 0, i32 0
  store i64 %6, i64* %7, align 8, !tbaa !8
  %8 = getelementptr inbounds %struct.timespec, %struct.timespec* %2, i64 0, i32 1
  %9 = load i64, i64* %8, align 8, !tbaa !11
  %10 = sdiv i64 %9, 1000000
  %11 = trunc i64 %10 to i16
  %12 = getelementptr inbounds %struct.timeb, %struct.timeb* %0, i64 0, i32 1
  store i16 %11, i16* %12, align 8, !tbaa !12
  %13 = getelementptr inbounds %struct.timeb, %struct.timeb* %0, i64 0, i32 3
  store i16 0, i16* %13, align 4, !tbaa !13
  %14 = getelementptr inbounds %struct.timeb, %struct.timeb* %0, i64 0, i32 2
  store i16 0, i16* %14, align 2, !tbaa !14
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #3
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
!9 = !{!"timeb", !5, i64 0, !10, i64 8, !10, i64 10, !10, i64 12}
!10 = !{!"short", !6, i64 0}
!11 = !{!4, !5, i64 8}
!12 = !{!9, !10, i64 8}
!13 = !{!9, !10, i64 12}
!14 = !{!9, !10, i64 10}
