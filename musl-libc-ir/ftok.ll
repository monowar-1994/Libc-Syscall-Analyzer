; ModuleID = 'src/ipc/ftok.c'
source_filename = "src/ipc/ftok.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @ftok(i8* noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = alloca %struct.stat, align 8
  %4 = bitcast %struct.stat* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %4) #3
  %5 = call i32 @stat(i8* noundef %0, %struct.stat* noundef nonnull %3) #4
  %6 = icmp slt i32 %5, 0
  br i1 %6, label %19, label %7

7:                                                ; preds = %2
  %8 = getelementptr inbounds %struct.stat, %struct.stat* %3, i64 0, i32 1
  %9 = load i64, i64* %8, align 8, !tbaa !3
  %10 = and i64 %9, 65535
  %11 = getelementptr inbounds %struct.stat, %struct.stat* %3, i64 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !10
  %13 = shl i64 %12, 16
  %14 = and i64 %13, 16711680
  %15 = or i64 %14, %10
  %16 = shl i32 %1, 24
  %17 = trunc i64 %15 to i32
  %18 = or i32 %16, %17
  br label %19

19:                                               ; preds = %2, %7
  %20 = phi i32 [ %18, %7 ], [ -1, %2 ]
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %4) #3
  ret i32 %20
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @stat(i8* noundef, %struct.stat* noundef) local_unnamed_addr #2

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
!3 = !{!4, !5, i64 8}
!4 = !{!"stat", !5, i64 0, !5, i64 8, !5, i64 16, !8, i64 24, !8, i64 28, !8, i64 32, !8, i64 36, !5, i64 40, !5, i64 48, !5, i64 56, !5, i64 64, !9, i64 72, !9, i64 88, !9, i64 104, !6, i64 120}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"int", !6, i64 0}
!9 = !{!"timespec", !5, i64 0, !5, i64 8}
!10 = !{!4, !5, i64 0}
