; ModuleID = 'src/multibyte/mbrtoc16.c'
source_filename = "src/multibyte/mbrtoc16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__mbstate_t = type { i32, i32 }

@mbrtoc16.internal_state = internal global i32 0, align 4
@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: nounwind optsize strictfp
define i64 @mbrtoc16(i16* noalias noundef writeonly %0, i8* noalias noundef %1, i64 noundef %2, %struct.__mbstate_t* noalias noundef %3) local_unnamed_addr #0 {
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %6, %4
  %7 = phi i16* [ %0, %4 ], [ null, %6 ]
  %8 = phi i8* [ %1, %4 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i64 0, i64 0), %6 ]
  %9 = phi i64 [ %2, %4 ], [ 1, %6 ]
  %10 = phi %struct.__mbstate_t* [ %3, %4 ], [ %12, %6 ]
  %11 = icmp eq %struct.__mbstate_t* %10, null
  %12 = select i1 %11, %struct.__mbstate_t* bitcast (i32* @mbrtoc16.internal_state to %struct.__mbstate_t*), %struct.__mbstate_t* %10
  %13 = icmp eq i8* %8, null
  br i1 %13, label %6, label %14

14:                                               ; preds = %6
  %15 = getelementptr %struct.__mbstate_t, %struct.__mbstate_t* %12, i64 0, i32 0
  %16 = load i32, i32* %15, align 4, !tbaa !3
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %18, label %23

18:                                               ; preds = %14
  %19 = icmp eq i16* %7, null
  br i1 %19, label %22, label %20

20:                                               ; preds = %18
  %21 = trunc i32 %16 to i16
  store i16 %21, i16* %7, align 2, !tbaa !7
  br label %22

22:                                               ; preds = %20, %18
  store i32 0, i32* %15, align 4, !tbaa !3
  br label %41

23:                                               ; preds = %14
  %24 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %24) #3
  %25 = call i64 @mbrtowc(i32* noundef nonnull %5, i8* noundef nonnull %8, i64 noundef %9, %struct.__mbstate_t* noundef nonnull %12) #4
  %26 = icmp ult i64 %25, 5
  br i1 %26, label %27, label %40

27:                                               ; preds = %23
  %28 = load i32, i32* %5, align 4, !tbaa !3
  %29 = icmp sgt i32 %28, 65535
  br i1 %29, label %30, label %35

30:                                               ; preds = %27
  %31 = and i32 %28, 1023
  %32 = or i32 %31, 56320
  store i32 %32, i32* %15, align 4, !tbaa !3
  %33 = lshr i32 %28, 10
  %34 = add nuw nsw i32 %33, 55232
  br label %35

35:                                               ; preds = %30, %27
  %36 = phi i32 [ %34, %30 ], [ %28, %27 ]
  %37 = icmp eq i16* %7, null
  br i1 %37, label %40, label %38

38:                                               ; preds = %35
  %39 = trunc i32 %36 to i16
  store i16 %39, i16* %7, align 2, !tbaa !7
  br label %40

40:                                               ; preds = %35, %38, %23
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %24) #3
  br label %41

41:                                               ; preds = %40, %22
  %42 = phi i64 [ -3, %22 ], [ %25, %40 ]
  ret i64 %42
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
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"short", !5, i64 0}
