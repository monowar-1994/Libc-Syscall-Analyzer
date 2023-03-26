; ModuleID = 'src/stdlib/ecvt.c'
source_filename = "src/stdlib/ecvt.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@ecvt.buf = internal global [16 x i8] zeroinitializer, align 16
@.str = private unnamed_addr constant [5 x i8] c"%.*e\00", align 1

; Function Attrs: nounwind optsize strictfp
define i8* @ecvt(double noundef %0, i32 noundef %1, i32* nocapture noundef writeonly %2, i32* nocapture noundef writeonly %3) local_unnamed_addr #0 {
  %5 = alloca [32 x i8], align 16
  %6 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %6) #3
  %7 = add i32 %1, -17
  %8 = icmp ult i32 %7, -16
  %9 = add nsw i32 %1, -1
  %10 = select i1 %8, i32 14, i32 %9
  %11 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef nonnull %6, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i32 noundef %10, double noundef %0) #4
  %12 = load i8, i8* %6, align 16, !tbaa !3
  %13 = icmp eq i8 %12, 45
  %14 = zext i1 %13 to i32
  store i32 %14, i32* %3, align 4, !tbaa !6
  %15 = zext i1 %13 to i64
  %16 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 %15
  %17 = load i8, i8* %16, align 1, !tbaa !3
  %18 = icmp eq i8 %17, 101
  br i1 %18, label %35, label %19

19:                                               ; preds = %4, %19
  %20 = phi i64 [ %25, %19 ], [ %15, %4 ]
  %21 = phi i8 [ %30, %19 ], [ %17, %4 ]
  %22 = phi i32 [ %28, %19 ], [ 0, %4 ]
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds [16 x i8], [16 x i8]* @ecvt.buf, i64 0, i64 %23
  store i8 %21, i8* %24, align 1, !tbaa !3
  %25 = add nuw nsw i64 %20, 1
  %26 = icmp ne i8 %21, 46
  %27 = zext i1 %26 to i32
  %28 = add nuw nsw i32 %22, %27
  %29 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 %25
  %30 = load i8, i8* %29, align 1, !tbaa !3
  %31 = icmp eq i8 %30, 101
  br i1 %31, label %32, label %19

32:                                               ; preds = %19
  %33 = trunc i64 %25 to i32
  %34 = zext i32 %28 to i64
  br label %35

35:                                               ; preds = %32, %4
  %36 = phi i32 [ %14, %4 ], [ %33, %32 ]
  %37 = phi i64 [ 0, %4 ], [ %34, %32 ]
  %38 = zext i32 %36 to i64
  %39 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 %38
  %40 = getelementptr inbounds [16 x i8], [16 x i8]* @ecvt.buf, i64 0, i64 %37
  store i8 0, i8* %40, align 1, !tbaa !3
  %41 = getelementptr inbounds i8, i8* %39, i64 1
  %42 = call i32 @atoi(i8* noundef nonnull %41) #4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %2, align 4, !tbaa !6
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %6) #3
  ret i8* getelementptr inbounds ([16 x i8], [16 x i8]* @ecvt.buf, i64 0, i64 0)
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @sprintf(i8* noundef, i8* noundef, ...) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @atoi(i8* noundef) local_unnamed_addr #2

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
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
