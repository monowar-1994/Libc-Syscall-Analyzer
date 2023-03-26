; ModuleID = 'src/time/clock.c'
source_filename = "src/time/clock.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timespec = type { i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i64 @clock() local_unnamed_addr #0 {
  %1 = alloca %struct.timespec, align 8
  %2 = bitcast %struct.timespec* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %2) #3
  %3 = call i32 @__clock_gettime(i32 noundef 2, %struct.timespec* noundef nonnull %1) #4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %18

5:                                                ; preds = %0
  %6 = getelementptr inbounds %struct.timespec, %struct.timespec* %1, i64 0, i32 0
  %7 = load i64, i64* %6, align 8, !tbaa !3
  %8 = icmp sgt i64 %7, 9223372036854
  br i1 %8, label %18, label %9

9:                                                ; preds = %5
  %10 = getelementptr inbounds %struct.timespec, %struct.timespec* %1, i64 0, i32 1
  %11 = load i64, i64* %10, align 8, !tbaa !8
  %12 = sdiv i64 %11, 1000
  %13 = mul nsw i64 %7, 1000000
  %14 = sub nsw i64 9223372036854775807, %13
  %15 = icmp sgt i64 %12, %14
  %16 = add nsw i64 %12, %13
  %17 = select i1 %15, i64 -1, i64 %16
  br label %18

18:                                               ; preds = %9, %5, %0
  %19 = phi i64 [ -1, %0 ], [ -1, %5 ], [ %17, %9 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %2) #3
  ret i64 %19
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i32 @__clock_gettime(i32 noundef, %struct.timespec* noundef) local_unnamed_addr #2

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
!8 = !{!4, !5, i64 8}
