; ModuleID = 'src/string/strcspn.c'
source_filename = "src/string/strcspn.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind strictfp
define i64 @strcspn(i8* noundef %0, i8* nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = alloca [4 x i64], align 16
  %4 = bitcast [4 x i64]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %4) #3
  %5 = load i8, i8* %1, align 1, !tbaa !3
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %11, label %7

7:                                                ; preds = %2
  %8 = getelementptr inbounds i8, i8* %1, i64 1
  %9 = load i8, i8* %8, align 1, !tbaa !3
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %11, label %14

11:                                               ; preds = %7, %2
  %12 = sext i8 %5 to i32
  %13 = tail call i8* @__strchrnul(i8* noundef %0, i32 noundef %12) #4
  br label %49

14:                                               ; preds = %7
  %15 = call i8* @memset(i8* noundef nonnull %4, i32 noundef 0, i64 noundef 32) #4
  %16 = load i8, i8* %1, align 1, !tbaa !3
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %18, label %21

18:                                               ; preds = %21, %14
  %19 = load i8, i8* %0, align 1, !tbaa !3
  %20 = icmp eq i8 %19, 0
  br i1 %20, label %49, label %34

21:                                               ; preds = %14, %21
  %22 = phi i8 [ %32, %21 ], [ %16, %14 ]
  %23 = phi i8* [ %31, %21 ], [ %1, %14 ]
  %24 = zext i8 %22 to i64
  %25 = and i64 %24, 63
  %26 = shl nuw i64 1, %25
  %27 = lshr i64 %24, 6
  %28 = getelementptr inbounds [4 x i64], [4 x i64]* %3, i64 0, i64 %27
  %29 = load i64, i64* %28, align 8, !tbaa !6
  %30 = or i64 %29, %26
  store i64 %30, i64* %28, align 8, !tbaa !6
  %31 = getelementptr inbounds i8, i8* %23, i64 1
  %32 = load i8, i8* %31, align 1, !tbaa !3
  %33 = icmp eq i8 %32, 0
  br i1 %33, label %18, label %21

34:                                               ; preds = %18, %45
  %35 = phi i8 [ %47, %45 ], [ %19, %18 ]
  %36 = phi i8* [ %46, %45 ], [ %0, %18 ]
  %37 = zext i8 %35 to i64
  %38 = lshr i64 %37, 6
  %39 = getelementptr inbounds [4 x i64], [4 x i64]* %3, i64 0, i64 %38
  %40 = load i64, i64* %39, align 8, !tbaa !6
  %41 = and i64 %37, 63
  %42 = shl nuw i64 1, %41
  %43 = and i64 %40, %42
  %44 = icmp eq i64 %43, 0
  br i1 %44, label %45, label %49

45:                                               ; preds = %34
  %46 = getelementptr inbounds i8, i8* %36, i64 1
  %47 = load i8, i8* %46, align 1, !tbaa !3
  %48 = icmp eq i8 %47, 0
  br i1 %48, label %49, label %34

49:                                               ; preds = %45, %34, %18, %11
  %50 = phi i8* [ %13, %11 ], [ %0, %18 ], [ %46, %45 ], [ %36, %34 ]
  %51 = ptrtoint i8* %50 to i64
  %52 = ptrtoint i8* %0 to i64
  %53 = sub i64 %51, %52
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %4) #3
  ret i64 %53
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

declare hidden i8* @__strchrnul(i8* noundef, i32 noundef) local_unnamed_addr #2

declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin nounwind strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"long", !4, i64 0}
