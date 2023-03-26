; ModuleID = 'src/time/timegm.c'
source_filename = "src/time/timegm.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }

@__utc = external hidden constant [0 x i8], align 1

; Function Attrs: nounwind optsize strictfp
define i64 @timegm(%struct.tm* noundef %0) local_unnamed_addr #0 {
  %2 = alloca %struct.tm, align 8
  %3 = bitcast %struct.tm* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %3) #5
  %4 = tail call i64 @__tm_to_secs(%struct.tm* noundef %0) #6
  %5 = call i32 @__secs_to_tm(i64 noundef %4, %struct.tm* noundef nonnull %2) #6
  %6 = icmp slt i32 %5, 0
  br i1 %6, label %7, label %9

7:                                                ; preds = %1
  %8 = tail call i32* @___errno_location() #7
  store i32 75, i32* %8, align 4, !tbaa !3
  br label %14

9:                                                ; preds = %1
  %10 = bitcast %struct.tm* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(56) %10, i8* noundef nonnull align 8 dereferenceable(56) %3, i64 40, i1 false) #8, !tbaa.struct !7
  %11 = getelementptr inbounds %struct.tm, %struct.tm* %0, i64 0, i32 8
  store i32 0, i32* %11, align 8, !tbaa !12
  %12 = getelementptr inbounds %struct.tm, %struct.tm* %0, i64 0, i32 9
  store i64 0, i64* %12, align 8, !tbaa !14
  %13 = getelementptr inbounds %struct.tm, %struct.tm* %0, i64 0, i32 10
  store i8* getelementptr inbounds ([0 x i8], [0 x i8]* @__utc, i64 0, i64 0), i8** %13, align 8, !tbaa !15
  br label %14

14:                                               ; preds = %9, %7
  %15 = phi i64 [ -1, %7 ], [ %4, %9 ]
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %3) #5
  ret i64 %15
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i64 @__tm_to_secs(%struct.tm* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__secs_to_tm(i64 noundef, %struct.tm* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #5 = { nounwind strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #7 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #8 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{i64 0, i64 4, !3, i64 4, i64 4, !3, i64 8, i64 4, !3, i64 12, i64 4, !3, i64 16, i64 4, !3, i64 20, i64 4, !3, i64 24, i64 4, !3, i64 28, i64 4, !3, i64 32, i64 4, !3, i64 40, i64 8, !8, i64 48, i64 8, !10}
!8 = !{!9, !9, i64 0}
!9 = !{!"long", !5, i64 0}
!10 = !{!11, !11, i64 0}
!11 = !{!"any pointer", !5, i64 0}
!12 = !{!13, !4, i64 32}
!13 = !{!"tm", !4, i64 0, !4, i64 4, !4, i64 8, !4, i64 12, !4, i64 16, !4, i64 20, !4, i64 24, !4, i64 28, !4, i64 32, !9, i64 40, !11, i64 48}
!14 = !{!13, !9, i64 40}
!15 = !{!13, !11, i64 48}
