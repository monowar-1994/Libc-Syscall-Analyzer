; ModuleID = 'src/temp/__randname.c'
source_filename = "src/temp/__randname.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timespec = type { i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i8* @__randname(i8* noundef returned %0) local_unnamed_addr #0 {
  %2 = alloca %struct.timespec, align 8
  %3 = bitcast %struct.timespec* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3) #3
  %4 = call i32 @__clock_gettime(i32 noundef 0, %struct.timespec* noundef nonnull %2) #4
  %5 = getelementptr inbounds %struct.timespec, %struct.timespec* %2, i64 0, i32 1
  %6 = load i64, i64* %5, align 8, !tbaa !3
  %7 = mul nsw i64 %6, 65537
  %8 = ptrtoint %struct.timespec* %2 to i64
  %9 = lshr i64 %8, 4
  %10 = ptrtoint i8* %0 to i64
  %11 = add i64 %9, %10
  %12 = xor i64 %7, %11
  br label %13

13:                                               ; preds = %1, %13
  %14 = phi i64 [ 0, %1 ], [ %23, %13 ]
  %15 = phi i64 [ %12, %1 ], [ %24, %13 ]
  %16 = and i64 %15, 15
  %17 = add nuw nsw i64 %16, 65
  %18 = shl i64 %15, 1
  %19 = and i64 %18, 32
  %20 = or i64 %17, %19
  %21 = trunc i64 %20 to i8
  %22 = getelementptr inbounds i8, i8* %0, i64 %14
  store i8 %21, i8* %22, align 1, !tbaa !8
  %23 = add nuw nsw i64 %14, 1
  %24 = lshr i64 %15, 5
  %25 = icmp eq i64 %23, 6
  br i1 %25, label %26, label %13

26:                                               ; preds = %13
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #3
  ret i8* %0
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
!3 = !{!4, !5, i64 8}
!4 = !{!"timespec", !5, i64 0, !5, i64 8}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!6, !6, i64 0}
