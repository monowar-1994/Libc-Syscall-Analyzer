; ModuleID = 'src/time/__tm_to_secs.c'
source_filename = "src/time/__tm_to_secs.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }

; Function Attrs: nounwind optsize strictfp
define hidden i64 @__tm_to_secs(%struct.tm* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = alloca i32, align 4
  %3 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #3
  %4 = getelementptr inbounds %struct.tm, %struct.tm* %0, i64 0, i32 5
  %5 = load i32, i32* %4, align 4, !tbaa !3
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds %struct.tm, %struct.tm* %0, i64 0, i32 4
  %8 = load i32, i32* %7, align 8, !tbaa !10
  %9 = icmp ugt i32 %8, 11
  br i1 %9, label %10, label %20

10:                                               ; preds = %1
  %11 = sdiv i32 %8, 12
  %12 = srem i32 %8, 12
  %13 = icmp slt i32 %12, 0
  %14 = add nsw i32 %12, 12
  %15 = select i1 %13, i32 %14, i32 %12
  %16 = ashr i32 %12, 31
  %17 = add nsw i32 %16, %11
  %18 = sext i32 %17 to i64
  %19 = add nsw i64 %18, %6
  br label %20

20:                                               ; preds = %1, %10
  %21 = phi i32 [ %15, %10 ], [ %8, %1 ]
  %22 = phi i64 [ %19, %10 ], [ %6, %1 ]
  %23 = call i64 @__year_to_secs(i64 noundef %22, i32* noundef nonnull %2) #4
  %24 = load i32, i32* %2, align 4, !tbaa !11
  %25 = call i32 @__month_to_secs(i32 noundef %21, i32 noundef %24) #4
  %26 = sext i32 %25 to i64
  %27 = add nsw i64 %23, %26
  %28 = getelementptr inbounds %struct.tm, %struct.tm* %0, i64 0, i32 3
  %29 = load i32, i32* %28, align 4, !tbaa !12
  %30 = add nsw i32 %29, -1
  %31 = sext i32 %30 to i64
  %32 = mul nsw i64 %31, 86400
  %33 = add nsw i64 %27, %32
  %34 = getelementptr inbounds %struct.tm, %struct.tm* %0, i64 0, i32 2
  %35 = load i32, i32* %34, align 8, !tbaa !13
  %36 = sext i32 %35 to i64
  %37 = mul nsw i64 %36, 3600
  %38 = add nsw i64 %33, %37
  %39 = getelementptr inbounds %struct.tm, %struct.tm* %0, i64 0, i32 1
  %40 = load i32, i32* %39, align 4, !tbaa !14
  %41 = sext i32 %40 to i64
  %42 = mul nsw i64 %41, 60
  %43 = add nsw i64 %38, %42
  %44 = getelementptr inbounds %struct.tm, %struct.tm* %0, i64 0, i32 0
  %45 = load i32, i32* %44, align 8, !tbaa !15
  %46 = sext i32 %45 to i64
  %47 = add nsw i64 %43, %46
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #3
  ret i64 %47
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i64 @__year_to_secs(i64 noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__month_to_secs(i32 noundef, i32 noundef) local_unnamed_addr #2

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
!3 = !{!4, !5, i64 20}
!4 = !{!"tm", !5, i64 0, !5, i64 4, !5, i64 8, !5, i64 12, !5, i64 16, !5, i64 20, !5, i64 24, !5, i64 28, !5, i64 32, !8, i64 40, !9, i64 48}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"long", !6, i64 0}
!9 = !{!"any pointer", !6, i64 0}
!10 = !{!4, !5, i64 16}
!11 = !{!5, !5, i64 0}
!12 = !{!4, !5, i64 12}
!13 = !{!4, !5, i64 8}
!14 = !{!4, !5, i64 4}
!15 = !{!4, !5, i64 0}
