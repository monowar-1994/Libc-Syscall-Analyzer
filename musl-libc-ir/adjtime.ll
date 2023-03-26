; ModuleID = 'src/linux/adjtime.c'
source_filename = "src/linux/adjtime.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timeval = type { i64, i64 }
%struct.timex = type { i32, i64, i64, i64, i64, i32, i64, i64, i64, %struct.timeval, i64, i64, i64, i32, i64, i64, i64, i64, i64, i32, [11 x i32] }

; Function Attrs: nounwind optsize strictfp
define i32 @adjtime(%struct.timeval* noundef readonly %0, %struct.timeval* noundef %1) local_unnamed_addr #0 {
  %3 = alloca %struct.timex, align 8
  %4 = bitcast %struct.timex* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 208, i8* nonnull %4) #5
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(208) %4, i8 0, i64 208, i1 false) #6
  %5 = icmp eq %struct.timeval* %0, null
  br i1 %5, label %21, label %6

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.timeval, %struct.timeval* %0, i64 0, i32 0
  %8 = load i64, i64* %7, align 8, !tbaa !3
  %9 = icmp sgt i64 %8, 1000
  br i1 %9, label %14, label %10

10:                                               ; preds = %6
  %11 = getelementptr inbounds %struct.timeval, %struct.timeval* %0, i64 0, i32 1
  %12 = load i64, i64* %11, align 8, !tbaa !8
  %13 = icmp sgt i64 %12, 1000000000
  br i1 %13, label %14, label %16

14:                                               ; preds = %10, %6
  %15 = tail call i32* @___errno_location() #7
  store i32 22, i32* %15, align 4, !tbaa !9
  br label %37

16:                                               ; preds = %10
  %17 = mul nsw i64 %8, 1000000
  %18 = add nsw i64 %12, %17
  %19 = getelementptr inbounds %struct.timex, %struct.timex* %3, i64 0, i32 1
  store i64 %18, i64* %19, align 8, !tbaa !11
  %20 = getelementptr inbounds %struct.timex, %struct.timex* %3, i64 0, i32 0
  store i32 32769, i32* %20, align 8, !tbaa !13
  br label %21

21:                                               ; preds = %16, %2
  %22 = call i32 @adjtimex(%struct.timex* noundef nonnull %3) #8
  %23 = icmp slt i32 %22, 0
  br i1 %23, label %37, label %24

24:                                               ; preds = %21
  %25 = icmp eq %struct.timeval* %1, null
  br i1 %25, label %37, label %26

26:                                               ; preds = %24
  %27 = getelementptr inbounds %struct.timex, %struct.timex* %3, i64 0, i32 1
  %28 = load i64, i64* %27, align 8, !tbaa !11
  %29 = sdiv i64 %28, 1000000
  %30 = getelementptr inbounds %struct.timeval, %struct.timeval* %1, i64 0, i32 0
  store i64 %29, i64* %30, align 8, !tbaa !3
  %31 = srem i64 %28, 1000000
  %32 = getelementptr inbounds %struct.timeval, %struct.timeval* %1, i64 0, i32 1
  store i64 %31, i64* %32, align 8, !tbaa !8
  %33 = icmp slt i64 %31, 0
  br i1 %33, label %34, label %37

34:                                               ; preds = %26
  %35 = add nsw i64 %29, -1
  store i64 %35, i64* %30, align 8, !tbaa !3
  %36 = add nsw i64 %31, 1000000
  store i64 %36, i64* %32, align 8, !tbaa !8
  br label %37

37:                                               ; preds = %24, %34, %26, %21, %14
  %38 = phi i32 [ -1, %14 ], [ -1, %21 ], [ 0, %26 ], [ 0, %34 ], [ 0, %24 ]
  call void @llvm.lifetime.end.p0i8(i64 208, i8* nonnull %4) #5
  ret i32 %38
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @adjtimex(%struct.timex* noundef) local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind strictfp }
attributes #6 = { strictfp }
attributes #7 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #8 = { nobuiltin nounwind optsize strictfp "no-builtins" }

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
!8 = !{!4, !5, i64 8}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !6, i64 0}
!11 = !{!12, !5, i64 8}
!12 = !{!"timex", !10, i64 0, !5, i64 8, !5, i64 16, !5, i64 24, !5, i64 32, !10, i64 40, !5, i64 48, !5, i64 56, !5, i64 64, !4, i64 72, !5, i64 88, !5, i64 96, !5, i64 104, !10, i64 112, !5, i64 120, !5, i64 128, !5, i64 136, !5, i64 144, !5, i64 152, !10, i64 160, !6, i64 164}
!13 = !{!12, !10, i64 0}
