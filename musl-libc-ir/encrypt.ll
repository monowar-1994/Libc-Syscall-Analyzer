; ModuleID = 'src/crypt/encrypt.c'
source_filename = "src/crypt/encrypt.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.expanded_key = type { [16 x i32], [16 x i32] }

@__encrypt_key = internal global %struct.expanded_key zeroinitializer, align 4

; Function Attrs: nounwind optsize strictfp
define void @setkey(i8* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = alloca [8 x i8], align 1
  %3 = getelementptr inbounds [8 x i8], [8 x i8]* %2, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %3) #3
  br label %4

4:                                                ; preds = %1, %21
  %5 = phi i64 [ 0, %1 ], [ %22, %21 ]
  %6 = phi i8* [ %0, %1 ], [ %19, %21 ]
  %7 = getelementptr inbounds [8 x i8], [8 x i8]* %2, i64 0, i64 %5
  store i8 0, i8* %7, align 1, !tbaa !3
  br label %8

8:                                                ; preds = %4, %8
  %9 = phi i8 [ 0, %4 ], [ %17, %8 ]
  %10 = phi i32 [ 7, %4 ], [ %18, %8 ]
  %11 = phi i8* [ %6, %4 ], [ %19, %8 ]
  %12 = load i8, i8* %11, align 1, !tbaa !3
  %13 = and i8 %12, 1
  %14 = zext i8 %13 to i32
  %15 = shl nuw i32 %14, %10
  %16 = trunc i32 %15 to i8
  %17 = or i8 %9, %16
  store i8 %17, i8* %7, align 1, !tbaa !3
  %18 = add nsw i32 %10, -1
  %19 = getelementptr inbounds i8, i8* %11, i64 1
  %20 = icmp eq i32 %10, 0
  br i1 %20, label %21, label %8

21:                                               ; preds = %8
  %22 = add nuw nsw i64 %5, 1
  %23 = icmp eq i64 %22, 8
  br i1 %23, label %24, label %4

24:                                               ; preds = %21
  call void @__des_setkey(i8* noundef nonnull %3, %struct.expanded_key* noundef nonnull @__encrypt_key) #4
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %3) #3
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden void @__des_setkey(i8* noundef, %struct.expanded_key* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define void @encrypt(i8* nocapture noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = alloca %struct.expanded_key, align 4
  %4 = alloca [2 x i32], align 4
  %5 = bitcast %struct.expanded_key* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %5) #3
  %6 = bitcast [2 x i32]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %6) #3
  br label %7

7:                                                ; preds = %2, %24
  %8 = phi i1 [ true, %2 ], [ false, %24 ]
  %9 = phi i64 [ 0, %2 ], [ 1, %24 ]
  %10 = phi i8* [ %0, %2 ], [ %22, %24 ]
  %11 = getelementptr inbounds [2 x i32], [2 x i32]* %4, i64 0, i64 %9
  store i32 0, i32* %11, align 4, !tbaa !6
  br label %12

12:                                               ; preds = %7, %12
  %13 = phi i32 [ 0, %7 ], [ %20, %12 ]
  %14 = phi i8* [ %10, %7 ], [ %22, %12 ]
  %15 = phi i32 [ 31, %7 ], [ %21, %12 ]
  %16 = load i8, i8* %14, align 1, !tbaa !3
  %17 = and i8 %16, 1
  %18 = zext i8 %17 to i32
  %19 = shl nuw i32 %18, %15
  %20 = or i32 %19, %13
  store i32 %20, i32* %11, align 4, !tbaa !6
  %21 = add nsw i32 %15, -1
  %22 = getelementptr inbounds i8, i8* %14, i64 1
  %23 = icmp eq i32 %15, 0
  br i1 %23, label %24, label %12

24:                                               ; preds = %12
  br i1 %8, label %7, label %25

25:                                               ; preds = %24
  %26 = icmp eq i32 %1, 0
  br i1 %26, label %46, label %27

27:                                               ; preds = %25, %27
  %28 = phi i64 [ %44, %27 ], [ 0, %25 ]
  %29 = sub nuw nsw i64 15, %28
  %30 = getelementptr inbounds %struct.expanded_key, %struct.expanded_key* @__encrypt_key, i64 0, i32 0, i64 %29
  %31 = getelementptr inbounds i32, i32* %30, i64 -3
  %32 = bitcast i32* %31 to <4 x i32>*
  %33 = load <4 x i32>, <4 x i32>* %32, align 4, !tbaa !6
  %34 = shufflevector <4 x i32> %33, <4 x i32> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %35 = getelementptr inbounds %struct.expanded_key, %struct.expanded_key* %3, i64 0, i32 0, i64 %28
  %36 = bitcast i32* %35 to <4 x i32>*
  store <4 x i32> %34, <4 x i32>* %36, align 4, !tbaa !6
  %37 = getelementptr inbounds %struct.expanded_key, %struct.expanded_key* @__encrypt_key, i64 0, i32 1, i64 %29
  %38 = getelementptr inbounds i32, i32* %37, i64 -3
  %39 = bitcast i32* %38 to <4 x i32>*
  %40 = load <4 x i32>, <4 x i32>* %39, align 4, !tbaa !6
  %41 = shufflevector <4 x i32> %40, <4 x i32> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %42 = getelementptr inbounds %struct.expanded_key, %struct.expanded_key* %3, i64 0, i32 1, i64 %28
  %43 = bitcast i32* %42 to <4 x i32>*
  store <4 x i32> %41, <4 x i32>* %43, align 4, !tbaa !6
  %44 = add nuw i64 %28, 4
  %45 = icmp eq i64 %44, 16
  br i1 %45, label %46, label %27, !llvm.loop !8

46:                                               ; preds = %27, %25
  %47 = phi %struct.expanded_key* [ @__encrypt_key, %25 ], [ %3, %27 ]
  %48 = getelementptr inbounds [2 x i32], [2 x i32]* %4, i64 0, i64 0
  %49 = load i32, i32* %48, align 4, !tbaa !6
  %50 = getelementptr inbounds [2 x i32], [2 x i32]* %4, i64 0, i64 1
  %51 = load i32, i32* %50, align 4, !tbaa !6
  call void @__do_des(i32 noundef %49, i32 noundef %51, i32* noundef nonnull %48, i32* noundef nonnull %50, i32 noundef 1, i32 noundef 0, %struct.expanded_key* noundef nonnull %47) #4
  br label %52

52:                                               ; preds = %46, %67
  %53 = phi i1 [ true, %46 ], [ false, %67 ]
  %54 = phi i64 [ 0, %46 ], [ 1, %67 ]
  %55 = phi i8* [ %0, %46 ], [ %64, %67 ]
  %56 = getelementptr inbounds [2 x i32], [2 x i32]* %4, i64 0, i64 %54
  br label %57

57:                                               ; preds = %52, %57
  %58 = phi i8* [ %55, %52 ], [ %64, %57 ]
  %59 = phi i32 [ 31, %52 ], [ %65, %57 ]
  %60 = load i32, i32* %56, align 4, !tbaa !6
  %61 = lshr i32 %60, %59
  %62 = trunc i32 %61 to i8
  %63 = and i8 %62, 1
  %64 = getelementptr inbounds i8, i8* %58, i64 1
  store i8 %63, i8* %58, align 1, !tbaa !3
  %65 = add nsw i32 %59, -1
  %66 = icmp eq i32 %59, 0
  br i1 %66, label %67, label %57

67:                                               ; preds = %57
  br i1 %53, label %52, label %68

68:                                               ; preds = %67
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %6) #3
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %5) #3
  ret void
}

; Function Attrs: optsize
declare hidden void @__do_des(i32 noundef, i32 noundef, i32* noundef, i32* noundef, i32 noundef, i32 noundef, %struct.expanded_key* noundef) local_unnamed_addr #2

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
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.isvectorized", i32 1}
