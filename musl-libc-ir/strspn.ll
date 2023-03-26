; ModuleID = 'src/string/strspn.c'
source_filename = "src/string/strspn.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nosync nounwind readonly strictfp
define i64 @strspn(i8* noundef %0, i8* nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = alloca [4 x i64], align 16
  %4 = bitcast [4 x i64]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %4) #3
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(32) %4, i8 0, i64 32, i1 false) #4
  %5 = load i8, i8* %1, align 1, !tbaa !3
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %65, label %7

7:                                                ; preds = %2
  %8 = getelementptr inbounds i8, i8* %1, i64 1
  %9 = load i8, i8* %8, align 1, !tbaa !3
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %19, label %11

11:                                               ; preds = %7
  %12 = zext i8 %5 to i64
  %13 = and i64 %12, 63
  %14 = shl nuw i64 1, %13
  %15 = lshr i64 %12, 6
  %16 = getelementptr inbounds [4 x i64], [4 x i64]* %3, i64 0, i64 %15
  %17 = load i64, i64* %16, align 8, !tbaa !6
  %18 = or i64 %17, %14
  store i64 %18, i64* %16, align 8, !tbaa !6
  br label %31

19:                                               ; preds = %7, %19
  %20 = phi i8* [ %23, %19 ], [ %0, %7 ]
  %21 = load i8, i8* %20, align 1, !tbaa !3
  %22 = icmp eq i8 %21, %5
  %23 = getelementptr inbounds i8, i8* %20, i64 1
  br i1 %22, label %19, label %24

24:                                               ; preds = %19
  %25 = ptrtoint i8* %20 to i64
  %26 = ptrtoint i8* %0 to i64
  %27 = sub i64 %25, %26
  br label %65

28:                                               ; preds = %31
  %29 = load i8, i8* %0, align 1, !tbaa !3
  %30 = icmp eq i8 %29, 0
  br i1 %30, label %60, label %45

31:                                               ; preds = %11, %31
  %32 = phi i8* [ %1, %11 ], [ %34, %31 ]
  %33 = phi i8 [ %9, %11 ], [ %36, %31 ]
  %34 = getelementptr inbounds i8, i8* %32, i64 1
  %35 = getelementptr inbounds i8, i8* %32, i64 2
  %36 = load i8, i8* %35, align 1, !tbaa !3
  %37 = zext i8 %33 to i64
  %38 = and i64 %37, 63
  %39 = shl nuw i64 1, %38
  %40 = lshr i64 %37, 6
  %41 = getelementptr inbounds [4 x i64], [4 x i64]* %3, i64 0, i64 %40
  %42 = load i64, i64* %41, align 8, !tbaa !6
  %43 = or i64 %42, %39
  store i64 %43, i64* %41, align 8, !tbaa !6
  %44 = icmp eq i8 %36, 0
  br i1 %44, label %28, label %31

45:                                               ; preds = %28, %56
  %46 = phi i8 [ %58, %56 ], [ %29, %28 ]
  %47 = phi i8* [ %57, %56 ], [ %0, %28 ]
  %48 = zext i8 %46 to i64
  %49 = lshr i64 %48, 6
  %50 = getelementptr inbounds [4 x i64], [4 x i64]* %3, i64 0, i64 %49
  %51 = load i64, i64* %50, align 8, !tbaa !6
  %52 = and i64 %48, 63
  %53 = shl nuw i64 1, %52
  %54 = and i64 %51, %53
  %55 = icmp eq i64 %54, 0
  br i1 %55, label %60, label %56

56:                                               ; preds = %45
  %57 = getelementptr inbounds i8, i8* %47, i64 1
  %58 = load i8, i8* %57, align 1, !tbaa !3
  %59 = icmp eq i8 %58, 0
  br i1 %59, label %60, label %45

60:                                               ; preds = %45, %56, %28
  %61 = phi i8* [ %0, %28 ], [ %57, %56 ], [ %47, %45 ]
  %62 = ptrtoint i8* %61 to i64
  %63 = ptrtoint i8* %0 to i64
  %64 = sub i64 %62, %63
  br label %65

65:                                               ; preds = %2, %60, %24
  %66 = phi i64 [ %64, %60 ], [ %27, %24 ], [ 0, %2 ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %4) #3
  ret i64 %66
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nofree nosync nounwind readonly strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { nounwind strictfp }
attributes #4 = { strictfp }

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
