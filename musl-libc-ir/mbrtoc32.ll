; ModuleID = 'src/multibyte/mbrtoc32.c'
source_filename = "src/multibyte/mbrtoc32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__mbstate_t = type { i32, i32 }

@mbrtoc32.internal_state = internal global i32 0, align 4
@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: nounwind optsize strictfp
define i64 @mbrtoc32(i32* noalias noundef writeonly %0, i8* noalias noundef %1, i64 noundef %2, %struct.__mbstate_t* noalias noundef %3) local_unnamed_addr #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = icmp eq %struct.__mbstate_t* %3, null
  %8 = select i1 %7, %struct.__mbstate_t* bitcast (i32* @mbrtoc32.internal_state to %struct.__mbstate_t*), %struct.__mbstate_t* %3
  %9 = icmp eq i8* %1, null
  br i1 %9, label %10, label %13

10:                                               ; preds = %4
  %11 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %11) #3, !noalias !3
  %12 = call i64 @mbrtowc(i32* noundef nonnull %5, i8* noundef nonnull getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i64 0, i64 0), i64 noundef 1, %struct.__mbstate_t* noundef %8) #4, !noalias !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %11) #3, !noalias !3
  br label %22

13:                                               ; preds = %4
  %14 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %14) #3
  %15 = call i64 @mbrtowc(i32* noundef nonnull %6, i8* noundef nonnull %1, i64 noundef %2, %struct.__mbstate_t* noundef %8) #4
  %16 = icmp ult i64 %15, 5
  %17 = icmp ne i32* %0, null
  %18 = and i1 %17, %16
  br i1 %18, label %19, label %21

19:                                               ; preds = %13
  %20 = load i32, i32* %6, align 4, !tbaa !9
  store i32 %20, i32* %0, align 4, !tbaa !9
  br label %21

21:                                               ; preds = %19, %13
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %14) #3
  br label %22

22:                                               ; preds = %21, %10
  %23 = phi i64 [ %15, %21 ], [ %12, %10 ]
  ret i64 %23
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i64 @mbrtowc(i32* noundef, i8* noundef, i64 noundef, %struct.__mbstate_t* noundef) local_unnamed_addr #2

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
!3 = !{!4, !6, !7}
!4 = distinct !{!4, !5, !"mbrtoc32: argument 0"}
!5 = distinct !{!5, !"mbrtoc32"}
!6 = distinct !{!6, !5, !"mbrtoc32: argument 1"}
!7 = distinct !{!7, !5, !"mbrtoc32: argument 2"}
!8 = !{!4}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C/C++ TBAA"}
