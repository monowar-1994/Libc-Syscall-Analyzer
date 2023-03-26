; ModuleID = 'src/stdlib/fcvt.c'
source_filename = "src/stdlib/fcvt.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%.*f\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"000000000000000\00", align 1

; Function Attrs: nounwind optsize strictfp
define i8* @fcvt(double noundef %0, i32 noundef %1, i32* noundef %2, i32* noundef %3) local_unnamed_addr #0 {
  %5 = alloca [1500 x i8], align 16
  %6 = getelementptr inbounds [1500 x i8], [1500 x i8]* %5, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 1500, i8* nonnull %6) #3
  %7 = icmp ult i32 %1, 1400
  %8 = select i1 %7, i32 %1, i32 1400
  %9 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef nonnull %6, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i32 noundef %8, double noundef %0) #4
  %10 = load i8, i8* %6, align 16, !tbaa !3
  %11 = icmp eq i8 %10, 45
  %12 = zext i1 %11 to i32
  %13 = zext i1 %11 to i64
  %14 = getelementptr inbounds [1500 x i8], [1500 x i8]* %5, i64 0, i64 %13
  %15 = load i8, i8* %14, align 1, !tbaa !3
  %16 = icmp eq i8 %15, 48
  br i1 %16, label %17, label %21

17:                                               ; preds = %4
  %18 = getelementptr inbounds i8, i8* %14, i64 2
  %19 = call i64 @strspn(i8* noundef nonnull %18, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)) #4
  %20 = trunc i64 %19 to i32
  br label %25

21:                                               ; preds = %4
  %22 = call i64 @strcspn(i8* noundef nonnull %14, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)) #4
  %23 = trunc i64 %22 to i32
  %24 = sub nsw i32 0, %23
  br label %25

25:                                               ; preds = %21, %17
  %26 = phi i32 [ %20, %17 ], [ %24, %21 ]
  %27 = icmp sgt i32 %8, %26
  br i1 %27, label %34, label %28

28:                                               ; preds = %25
  store i32 %12, i32* %3, align 4, !tbaa !6
  store i32 1, i32* %2, align 4, !tbaa !6
  %29 = icmp ult i32 %8, 14
  %30 = select i1 %29, i32 %1, i32 14
  %31 = sext i32 %30 to i64
  %32 = sub nsw i64 0, %31
  %33 = getelementptr inbounds i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 14), i64 %32
  br label %37

34:                                               ; preds = %25
  %35 = sub nsw i32 %8, %26
  %36 = call i8* @ecvt(double noundef %0, i32 noundef %35, i32* noundef %2, i32* noundef %3) #4
  br label %37

37:                                               ; preds = %34, %28
  %38 = phi i8* [ %33, %28 ], [ %36, %34 ]
  call void @llvm.lifetime.end.p0i8(i64 1500, i8* nonnull %6) #3
  ret i8* %38
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @sprintf(i8* noundef, i8* noundef, ...) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @strspn(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @strcspn(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @ecvt(double noundef, i32 noundef, i32* noundef, i32* noundef) local_unnamed_addr #2

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
