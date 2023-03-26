; ModuleID = 'src/time/mktime.c'
source_filename = "src/time/mktime.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }

; Function Attrs: nounwind optsize strictfp
define i64 @mktime(%struct.tm* noundef %0) local_unnamed_addr #0 {
  %2 = alloca %struct.tm, align 8
  %3 = alloca i64, align 8
  %4 = bitcast %struct.tm* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %4) #5
  %5 = bitcast i64* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %5) #5
  %6 = tail call i64 @__tm_to_secs(%struct.tm* noundef %0) #6
  %7 = getelementptr inbounds %struct.tm, %struct.tm* %2, i64 0, i32 8
  %8 = getelementptr inbounds %struct.tm, %struct.tm* %2, i64 0, i32 9
  %9 = getelementptr inbounds %struct.tm, %struct.tm* %2, i64 0, i32 10
  call void @__secs_to_zone(i64 noundef %6, i32 noundef 1, i32* noundef nonnull %7, i64* noundef nonnull %8, i64* noundef nonnull %3, i8** noundef nonnull %9) #6
  %10 = getelementptr inbounds %struct.tm, %struct.tm* %0, i64 0, i32 8
  %11 = load i32, i32* %10, align 8, !tbaa !3
  %12 = icmp slt i32 %11, 0
  %13 = load i32, i32* %7, align 8
  %14 = icmp eq i32 %13, %11
  %15 = select i1 %12, i1 true, i1 %14
  %16 = load i64, i64* %3, align 8
  %17 = load i64, i64* %8, align 8
  %18 = sub i64 %17, %16
  %19 = select i1 %15, i64 0, i64 %18
  %20 = sub i64 %6, %17
  %21 = add i64 %20, %19
  call void @__secs_to_zone(i64 noundef %21, i32 noundef 0, i32* noundef nonnull %7, i64* noundef nonnull %8, i64* noundef nonnull %3, i8** noundef nonnull %9) #6
  %22 = load i64, i64* %8, align 8, !tbaa !10
  %23 = add nsw i64 %21, %22
  %24 = call i32 @__secs_to_tm(i64 noundef %23, %struct.tm* noundef nonnull %2) #6
  %25 = icmp slt i32 %24, 0
  br i1 %25, label %28, label %26

26:                                               ; preds = %1
  %27 = bitcast %struct.tm* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(56) %27, i8* noundef nonnull align 8 dereferenceable(56) %4, i64 56, i1 false) #7, !tbaa.struct !11
  br label %30

28:                                               ; preds = %1
  %29 = tail call i32* @___errno_location() #8
  store i32 75, i32* %29, align 4, !tbaa !12
  br label %30

30:                                               ; preds = %28, %26
  %31 = phi i64 [ -1, %28 ], [ %21, %26 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %5) #5
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %4) #5
  ret i64 %31
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i64 @__tm_to_secs(%struct.tm* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__secs_to_zone(i64 noundef, i32 noundef, i32* noundef, i64* noundef, i64* noundef, i8** noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__secs_to_tm(i64 noundef, %struct.tm* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #4 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #7 = { strictfp }
attributes #8 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 32}
!4 = !{!"tm", !5, i64 0, !5, i64 4, !5, i64 8, !5, i64 12, !5, i64 16, !5, i64 20, !5, i64 24, !5, i64 28, !5, i64 32, !8, i64 40, !9, i64 48}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"long", !6, i64 0}
!9 = !{!"any pointer", !6, i64 0}
!10 = !{!4, !8, i64 40}
!11 = !{i64 0, i64 4, !12, i64 4, i64 4, !12, i64 8, i64 4, !12, i64 12, i64 4, !12, i64 16, i64 4, !12, i64 20, i64 4, !12, i64 24, i64 4, !12, i64 28, i64 4, !12, i64 32, i64 4, !12, i64 40, i64 8, !13, i64 48, i64 8, !14}
!12 = !{!5, !5, i64 0}
!13 = !{!8, !8, i64 0}
!14 = !{!9, !9, i64 0}
