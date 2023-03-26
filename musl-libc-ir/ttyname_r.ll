; ModuleID = 'src/unistd/ttyname_r.c'
source_filename = "src/unistd/ttyname_r.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @ttyname_r(i32 noundef %0, i8* noundef %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = alloca %struct.stat, align 8
  %5 = alloca %struct.stat, align 8
  %6 = alloca [29 x i8], align 16
  %7 = bitcast %struct.stat* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %7) #4
  %8 = bitcast %struct.stat* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %8) #4
  %9 = getelementptr inbounds [29 x i8], [29 x i8]* %6, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 29, i8* nonnull %9) #4
  %10 = tail call i32 @isatty(i32 noundef %0) #5
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %15

12:                                               ; preds = %3
  %13 = tail call i32* @___errno_location() #6
  %14 = load i32, i32* %13, align 4, !tbaa !3
  br label %46

15:                                               ; preds = %3
  call void @__procfdname(i8* noundef nonnull %9, i32 noundef %0) #5
  %16 = call i64 @readlink(i8* noundef nonnull %9, i8* noundef %1, i64 noundef %2) #5
  %17 = icmp slt i64 %16, 0
  br i1 %17, label %18, label %21

18:                                               ; preds = %15
  %19 = tail call i32* @___errno_location() #6
  %20 = load i32, i32* %19, align 4, !tbaa !3
  br label %46

21:                                               ; preds = %15
  %22 = icmp eq i64 %16, %2
  br i1 %22, label %46, label %23

23:                                               ; preds = %21
  %24 = getelementptr inbounds i8, i8* %1, i64 %16
  store i8 0, i8* %24, align 1, !tbaa !7
  %25 = call i32 @stat(i8* noundef %1, %struct.stat* noundef nonnull %4) #5
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %30

27:                                               ; preds = %23
  %28 = call i32 @fstat(i32 noundef %0, %struct.stat* noundef nonnull %5) #5
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %33, label %30

30:                                               ; preds = %27, %23
  %31 = tail call i32* @___errno_location() #6
  %32 = load i32, i32* %31, align 4, !tbaa !3
  br label %46

33:                                               ; preds = %27
  %34 = getelementptr inbounds %struct.stat, %struct.stat* %4, i64 0, i32 0
  %35 = load i64, i64* %34, align 8, !tbaa !8
  %36 = getelementptr inbounds %struct.stat, %struct.stat* %5, i64 0, i32 0
  %37 = load i64, i64* %36, align 8, !tbaa !8
  %38 = icmp eq i64 %35, %37
  br i1 %38, label %39, label %46

39:                                               ; preds = %33
  %40 = getelementptr inbounds %struct.stat, %struct.stat* %4, i64 0, i32 1
  %41 = load i64, i64* %40, align 8, !tbaa !12
  %42 = getelementptr inbounds %struct.stat, %struct.stat* %5, i64 0, i32 1
  %43 = load i64, i64* %42, align 8, !tbaa !12
  %44 = icmp eq i64 %41, %43
  %45 = select i1 %44, i32 0, i32 19
  br label %46

46:                                               ; preds = %39, %33, %21, %30, %18, %12
  %47 = phi i32 [ %20, %18 ], [ %32, %30 ], [ %14, %12 ], [ 34, %21 ], [ 19, %33 ], [ %45, %39 ]
  call void @llvm.lifetime.end.p0i8(i64 29, i8* nonnull %9) #4
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %8) #4
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %7) #4
  ret i32 %47
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @isatty(i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare hidden void @__procfdname(i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @readlink(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @stat(i8* noundef, %struct.stat* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @fstat(i32 noundef, %struct.stat* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!5, !5, i64 0}
!8 = !{!9, !10, i64 0}
!9 = !{!"stat", !10, i64 0, !10, i64 8, !10, i64 16, !4, i64 24, !4, i64 28, !4, i64 32, !4, i64 36, !10, i64 40, !10, i64 48, !10, i64 56, !10, i64 64, !11, i64 72, !11, i64 88, !11, i64 104, !5, i64 120}
!10 = !{!"long", !5, i64 0}
!11 = !{!"timespec", !10, i64 0, !10, i64 8}
!12 = !{!9, !10, i64 8}
