; ModuleID = 'src/misc/getentropy.c'
source_filename = "src/misc/getentropy.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @getentropy(i8* noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #4
  %5 = icmp ugt i64 %1, 256
  br i1 %5, label %6, label %8

6:                                                ; preds = %2
  %7 = tail call i32* @___errno_location() #5
  store i32 5, i32* %7, align 4, !tbaa !3
  br label %34

8:                                                ; preds = %2
  %9 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %3) #6
  %10 = icmp eq i64 %1, 0
  br i1 %10, label %30, label %11

11:                                               ; preds = %8, %22
  %12 = phi i8* [ %25, %22 ], [ %0, %8 ]
  %13 = phi i64 [ %26, %22 ], [ %1, %8 ]
  br label %14

14:                                               ; preds = %11, %18
  %15 = call i64 @getrandom(i8* noundef %12, i64 noundef %13, i32 noundef 0) #6
  %16 = and i64 %15, 2147483648
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %22, label %18

18:                                               ; preds = %14
  %19 = tail call i32* @___errno_location() #5
  %20 = load i32, i32* %19, align 4, !tbaa !3
  %21 = icmp eq i32 %20, 4
  br i1 %21, label %14, label %28

22:                                               ; preds = %14
  %23 = shl i64 %15, 32
  %24 = ashr exact i64 %23, 32
  %25 = getelementptr inbounds i8, i8* %12, i64 %24
  %26 = sub i64 %13, %24
  %27 = icmp eq i64 %26, 0
  br i1 %27, label %30, label %11

28:                                               ; preds = %18
  %29 = trunc i64 %15 to i32
  br label %30

30:                                               ; preds = %22, %8, %28
  %31 = phi i32 [ %29, %28 ], [ 0, %8 ], [ 0, %22 ]
  %32 = load i32, i32* %3, align 4, !tbaa !3
  %33 = call i32 @pthread_setcancelstate(i32 noundef %32, i32* noundef null) #6
  br label %34

34:                                               ; preds = %30, %6
  %35 = phi i32 [ -1, %6 ], [ %31, %30 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #4
  ret i32 %35
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i64 @getrandom(i8* noundef, i64 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
