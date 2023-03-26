; ModuleID = 'src/stat/futimesat.c'
source_filename = "src/stat/futimesat.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timeval = type { i64, i64 }
%struct.timespec = type { i64, i64 }

@futimesat = weak alias i32 (i32, i8*, %struct.timeval*), i32 (i32, i8*, %struct.timeval*)* @__futimesat

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__futimesat(i32 noundef %0, i8* noundef %1, %struct.timeval* noundef readonly %2) #0 {
  %4 = alloca [2 x %struct.timespec], align 16
  %5 = bitcast [2 x %struct.timespec]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %5) #3
  %6 = icmp eq %struct.timeval* %2, null
  br i1 %6, label %22, label %7

7:                                                ; preds = %3, %16
  %8 = phi i1 [ false, %16 ], [ true, %3 ]
  %9 = phi i64 [ 1, %16 ], [ 0, %3 ]
  %10 = getelementptr inbounds %struct.timeval, %struct.timeval* %2, i64 %9, i32 1
  %11 = load i64, i64* %10, align 8, !tbaa !3
  %12 = icmp ugt i64 %11, 999999
  br i1 %12, label %13, label %16

13:                                               ; preds = %7
  %14 = tail call i64 @__syscall_ret(i64 noundef -22) #4
  %15 = trunc i64 %14 to i32
  br label %26

16:                                               ; preds = %7
  %17 = getelementptr inbounds %struct.timeval, %struct.timeval* %2, i64 %9, i32 0
  %18 = load i64, i64* %17, align 8, !tbaa !8
  %19 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %4, i64 0, i64 %9, i32 0
  store i64 %18, i64* %19, align 16, !tbaa !9
  %20 = mul nuw nsw i64 %11, 1000
  %21 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %4, i64 0, i64 %9, i32 1
  store i64 %20, i64* %21, align 8, !tbaa !11
  br i1 %8, label %7, label %22

22:                                               ; preds = %16, %3
  %23 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %4, i64 0, i64 0
  %24 = select i1 %6, %struct.timespec* null, %struct.timespec* %23
  %25 = call i32 @utimensat(i32 noundef %0, i8* noundef %1, %struct.timespec* noundef %24, i32 noundef 0) #4
  br label %26

26:                                               ; preds = %13, %22
  %27 = phi i32 [ %25, %22 ], [ %15, %13 ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %5) #3
  ret i32 %27
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @utimensat(i32 noundef, i8* noundef, %struct.timespec* noundef, i32 noundef) local_unnamed_addr #2

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
!4 = !{!"timeval", !5, i64 0, !5, i64 8}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!4, !5, i64 0}
!9 = !{!10, !5, i64 0}
!10 = !{!"timespec", !5, i64 0, !5, i64 8}
!11 = !{!10, !5, i64 8}
