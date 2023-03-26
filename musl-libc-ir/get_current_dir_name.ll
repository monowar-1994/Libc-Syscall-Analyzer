; ModuleID = 'src/misc/get_current_dir_name.c'
source_filename = "src/misc/get_current_dir_name.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

@.str = private unnamed_addr constant [4 x i8] c"PWD\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c".\00", align 1

; Function Attrs: nounwind optsize strictfp
define i8* @get_current_dir_name() local_unnamed_addr #0 {
  %1 = alloca %struct.stat, align 8
  %2 = alloca %struct.stat, align 8
  %3 = bitcast %struct.stat* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %3) #3
  %4 = bitcast %struct.stat* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %4) #3
  %5 = tail call i8* @getenv(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)) #4
  %6 = icmp eq i8* %5, null
  br i1 %6, label %30, label %7

7:                                                ; preds = %0
  %8 = load i8, i8* %5, align 1, !tbaa !3
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %30, label %10

10:                                               ; preds = %7
  %11 = call i32 @stat(i8* noundef nonnull %5, %struct.stat* noundef nonnull %1) #4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %30

13:                                               ; preds = %10
  %14 = call i32 @stat(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0), %struct.stat* noundef nonnull %2) #4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %30

16:                                               ; preds = %13
  %17 = getelementptr inbounds %struct.stat, %struct.stat* %1, i64 0, i32 0
  %18 = load i64, i64* %17, align 8, !tbaa !6
  %19 = getelementptr inbounds %struct.stat, %struct.stat* %2, i64 0, i32 0
  %20 = load i64, i64* %19, align 8, !tbaa !6
  %21 = icmp eq i64 %18, %20
  br i1 %21, label %22, label %30

22:                                               ; preds = %16
  %23 = getelementptr inbounds %struct.stat, %struct.stat* %1, i64 0, i32 1
  %24 = load i64, i64* %23, align 8, !tbaa !11
  %25 = getelementptr inbounds %struct.stat, %struct.stat* %2, i64 0, i32 1
  %26 = load i64, i64* %25, align 8, !tbaa !11
  %27 = icmp eq i64 %24, %26
  br i1 %27, label %28, label %30

28:                                               ; preds = %22
  %29 = call i8* @strdup(i8* noundef nonnull %5) #4
  br label %32

30:                                               ; preds = %22, %16, %13, %10, %7, %0
  %31 = call i8* @getcwd(i8* noundef null, i64 noundef 0) #4
  br label %32

32:                                               ; preds = %30, %28
  %33 = phi i8* [ %31, %30 ], [ %29, %28 ]
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %4) #3
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %3) #3
  ret i8* %33
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i8* @getenv(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @stat(i8* noundef, %struct.stat* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @strdup(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @getcwd(i8* noundef, i64 noundef) local_unnamed_addr #2

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
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !8, i64 0}
!7 = !{!"stat", !8, i64 0, !8, i64 8, !8, i64 16, !9, i64 24, !9, i64 28, !9, i64 32, !9, i64 36, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !10, i64 72, !10, i64 88, !10, i64 104, !4, i64 120}
!8 = !{!"long", !4, i64 0}
!9 = !{!"int", !4, i64 0}
!10 = !{!"timespec", !8, i64 0, !8, i64 8}
!11 = !{!7, !8, i64 8}
