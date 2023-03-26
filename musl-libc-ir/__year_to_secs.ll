; ModuleID = 'src/time/__year_to_secs.c'
source_filename = "src/time/__year_to_secs.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define i64 @__year_to_secs(i64 noundef %0, i32* noundef %1) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = add i64 %0, -2
  %5 = icmp ult i64 %4, 137
  br i1 %5, label %6, label %27

6:                                                ; preds = %2
  %7 = trunc i64 %0 to i32
  %8 = add nsw i32 %7, -68
  %9 = ashr i32 %8, 2
  %10 = and i32 %7, 3
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %15

12:                                               ; preds = %6
  %13 = add nsw i32 %9, -1
  %14 = icmp eq i32* %1, null
  br i1 %14, label %20, label %17

15:                                               ; preds = %6
  %16 = icmp eq i32* %1, null
  br i1 %16, label %20, label %17

17:                                               ; preds = %15, %12
  %18 = phi i32 [ 1, %12 ], [ 0, %15 ]
  %19 = phi i32 [ %13, %12 ], [ %9, %15 ]
  store i32 %18, i32* %1, align 4, !tbaa !3
  br label %20

20:                                               ; preds = %17, %15, %12
  %21 = phi i32 [ %9, %15 ], [ %13, %12 ], [ %19, %17 ]
  %22 = mul i32 %7, 31536000
  %23 = add i32 %22, 2087447296
  %24 = mul nsw i32 %21, 86400
  %25 = add nsw i32 %23, %24
  %26 = sext i32 %25 to i64
  br label %79

27:                                               ; preds = %2
  %28 = icmp eq i32* %1, null
  br i1 %28, label %29, label %30

29:                                               ; preds = %27
  store i32 0, i32* %3, align 4, !tbaa !3
  br label %30

30:                                               ; preds = %29, %27
  %31 = phi i32* [ %1, %27 ], [ %3, %29 ]
  %32 = add nsw i64 %0, -100
  %33 = sdiv i64 %32, 400
  %34 = trunc i64 %33 to i32
  %35 = srem i64 %32, 400
  %36 = trunc i64 %35 to i32
  %37 = icmp slt i32 %36, 0
  %38 = add nsw i32 %36, 400
  %39 = ashr i32 %36, 31
  %40 = add nsw i32 %39, %34
  %41 = select i1 %37, i32 %38, i32 %36
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %65, label %43

43:                                               ; preds = %30
  %44 = icmp ugt i32 %41, 199
  br i1 %44, label %45, label %51

45:                                               ; preds = %43
  %46 = icmp ugt i32 %41, 299
  br i1 %46, label %47, label %49

47:                                               ; preds = %45
  %48 = add nsw i32 %41, -300
  br label %54

49:                                               ; preds = %45
  %50 = add nsw i32 %41, -200
  br label %54

51:                                               ; preds = %43
  %52 = icmp ugt i32 %41, 99
  %53 = add nsw i32 %41, -100
  br i1 %52, label %54, label %58

54:                                               ; preds = %51, %47, %49
  %55 = phi i32 [ 3, %47 ], [ 2, %49 ], [ 1, %51 ]
  %56 = phi i32 [ %48, %47 ], [ %50, %49 ], [ %53, %51 ]
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %65, label %58

58:                                               ; preds = %51, %54
  %59 = phi i32 [ %56, %54 ], [ %41, %51 ]
  %60 = phi i32 [ %55, %54 ], [ 0, %51 ]
  %61 = lshr i32 %59, 2
  %62 = and i32 %59, 3
  %63 = icmp eq i32 %62, 0
  %64 = zext i1 %63 to i32
  br label %65

65:                                               ; preds = %54, %30, %58
  %66 = phi i32 [ %64, %58 ], [ 1, %30 ], [ 0, %54 ]
  %67 = phi i32 [ %60, %58 ], [ 0, %30 ], [ %55, %54 ]
  %68 = phi i32 [ %61, %58 ], [ 0, %30 ], [ 0, %54 ]
  store i32 %66, i32* %31, align 4, !tbaa !3
  %69 = mul nsw i32 %40, 97
  %70 = mul nuw nsw i32 %67, 24
  %71 = add nsw i32 %70, %69
  %72 = add i32 %71, %68
  %73 = sub i32 %72, %66
  %74 = mul nsw i64 %32, 31536000
  %75 = sext i32 %73 to i64
  %76 = mul nsw i64 %75, 86400
  %77 = add i64 %74, 946771200
  %78 = add i64 %77, %76
  br label %79

79:                                               ; preds = %65, %20
  %80 = phi i64 [ %26, %20 ], [ %78, %65 ]
  ret i64 %80
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
