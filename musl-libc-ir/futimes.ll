; ModuleID = 'src/legacy/futimes.c'
source_filename = "src/legacy/futimes.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timeval = type { i64, i64 }
%struct.timespec = type { i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @futimes(i32 noundef %0, %struct.timeval* noundef readonly %1) local_unnamed_addr #0 {
  %3 = alloca [2 x %struct.timespec], align 16
  %4 = bitcast [2 x %struct.timespec]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %4) #3
  %5 = icmp eq %struct.timeval* %1, null
  br i1 %5, label %6, label %8

6:                                                ; preds = %2
  %7 = tail call i32 @futimens(i32 noundef %0, %struct.timespec* noundef null) #4
  br label %25

8:                                                ; preds = %2
  %9 = getelementptr inbounds %struct.timeval, %struct.timeval* %1, i64 0, i32 0
  %10 = load i64, i64* %9, align 8, !tbaa !3
  %11 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %3, i64 0, i64 0
  %12 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %3, i64 0, i64 0, i32 0
  store i64 %10, i64* %12, align 16, !tbaa !8
  %13 = getelementptr inbounds %struct.timeval, %struct.timeval* %1, i64 0, i32 1
  %14 = load i64, i64* %13, align 8, !tbaa !10
  %15 = mul nsw i64 %14, 1000
  %16 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %3, i64 0, i64 0, i32 1
  store i64 %15, i64* %16, align 8, !tbaa !11
  %17 = getelementptr inbounds %struct.timeval, %struct.timeval* %1, i64 1, i32 0
  %18 = load i64, i64* %17, align 8, !tbaa !3
  %19 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %3, i64 0, i64 1, i32 0
  store i64 %18, i64* %19, align 16, !tbaa !8
  %20 = getelementptr inbounds %struct.timeval, %struct.timeval* %1, i64 1, i32 1
  %21 = load i64, i64* %20, align 8, !tbaa !10
  %22 = mul nsw i64 %21, 1000
  %23 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %3, i64 0, i64 1, i32 1
  store i64 %22, i64* %23, align 8, !tbaa !11
  %24 = call i32 @futimens(i32 noundef %0, %struct.timespec* noundef nonnull %11) #4
  br label %25

25:                                               ; preds = %8, %6
  %26 = phi i32 [ %24, %8 ], [ %7, %6 ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %4) #3
  ret i32 %26
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @futimens(i32 noundef, %struct.timespec* noundef) local_unnamed_addr #2

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
!4 = !{!"timeval", !5, i64 0, !5, i64 8}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9, !5, i64 0}
!9 = !{!"timespec", !5, i64 0, !5, i64 8}
!10 = !{!4, !5, i64 8}
!11 = !{!9, !5, i64 8}
