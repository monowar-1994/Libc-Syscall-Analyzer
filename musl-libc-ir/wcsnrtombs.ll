; ModuleID = 'src/multibyte/wcsnrtombs.c'
source_filename = "src/multibyte/wcsnrtombs.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__mbstate_t = type { i32, i32 }

; Function Attrs: nounwind optsize strictfp
define i64 @wcsnrtombs(i8* noalias noundef %0, i32** noalias nocapture noundef %1, i64 noundef %2, i64 noundef %3, %struct.__mbstate_t* noalias nocapture noundef readnone %4) local_unnamed_addr #0 {
  %6 = alloca [4 x i8], align 1
  %7 = load i32*, i32** %1, align 8, !tbaa !3
  %8 = icmp ne i32* %7, null
  %9 = icmp ne i64 %2, 0
  %10 = and i1 %8, %9
  br i1 %10, label %11, label %50

11:                                               ; preds = %5
  %12 = icmp eq i8* %0, null
  %13 = select i1 %12, i64 0, i64 %3
  %14 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 0
  br label %15

15:                                               ; preds = %11, %45
  %16 = phi i8* [ %0, %11 ], [ %38, %45 ]
  %17 = phi i64 [ 0, %11 ], [ %48, %45 ]
  %18 = phi i32* [ %7, %11 ], [ %46, %45 ]
  %19 = phi i64 [ %2, %11 ], [ %47, %45 ]
  %20 = phi i64 [ %13, %11 ], [ %37, %45 ]
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %14) #3
  %21 = icmp ult i64 %20, 4
  %22 = select i1 %21, i8* %14, i8* %16
  %23 = load i32, i32* %18, align 4, !tbaa !7
  %24 = call i64 @wcrtomb(i8* noundef %22, i32 noundef %23, %struct.__mbstate_t* noundef null) #4
  %25 = icmp eq i64 %24, -1
  br i1 %25, label %41, label %26

26:                                               ; preds = %15
  %27 = icmp eq i8* %16, null
  br i1 %27, label %36, label %28

28:                                               ; preds = %26
  br i1 %21, label %29, label %33

29:                                               ; preds = %28
  %30 = icmp ult i64 %20, %24
  br i1 %30, label %41, label %31

31:                                               ; preds = %29
  %32 = call i8* @memcpy(i8* noundef nonnull %16, i8* noundef nonnull %14, i64 noundef %24) #4
  br label %33

33:                                               ; preds = %31, %28
  %34 = getelementptr inbounds i8, i8* %16, i64 %24
  %35 = sub i64 %20, %24
  br label %36

36:                                               ; preds = %33, %26
  %37 = phi i64 [ %35, %33 ], [ %20, %26 ]
  %38 = phi i8* [ %34, %33 ], [ null, %26 ]
  %39 = load i32, i32* %18, align 4, !tbaa !7
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %45

41:                                               ; preds = %15, %29, %36
  %42 = phi i32* [ null, %36 ], [ %18, %29 ], [ %18, %15 ]
  %43 = phi i64 [ %17, %36 ], [ %17, %29 ], [ -1, %15 ]
  %44 = phi i8* [ %38, %36 ], [ %16, %29 ], [ %16, %15 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %14) #3
  br label %50

45:                                               ; preds = %36
  %46 = getelementptr inbounds i32, i32* %18, i64 1
  %47 = add i64 %19, -1
  %48 = add i64 %24, %17
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %14) #3
  %49 = icmp eq i64 %47, 0
  br i1 %49, label %50, label %15

50:                                               ; preds = %45, %5, %41
  %51 = phi i32* [ %42, %41 ], [ %7, %5 ], [ %46, %45 ]
  %52 = phi i64 [ %43, %41 ], [ 0, %5 ], [ %48, %45 ]
  %53 = phi i8* [ %44, %41 ], [ %0, %5 ], [ %38, %45 ]
  %54 = icmp eq i8* %53, null
  br i1 %54, label %56, label %55

55:                                               ; preds = %50
  store i32* %51, i32** %1, align 8, !tbaa !3
  br label %56

56:                                               ; preds = %55, %50
  ret i64 %52
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i64 @wcrtomb(i8* noundef, i32 noundef, %struct.__mbstate_t* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

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
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
