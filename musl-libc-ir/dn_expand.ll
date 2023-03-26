; ModuleID = 'src/network/dn_expand.c'
source_filename = "src/network/dn_expand.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@dn_expand = weak alias i32 (i8*, i8*, i8*, i8*, i32), i32 (i8*, i8*, i8*, i8*, i32)* @__dn_expand

; Function Attrs: nofree norecurse nosync nounwind optsize strictfp
define hidden i32 @__dn_expand(i8* noundef %0, i8* noundef %1, i8* noundef %2, i8* noundef %3, i32 noundef %4) #0 {
  %6 = icmp eq i8* %2, %1
  %7 = icmp slt i32 %4, 1
  %8 = or i1 %6, %7
  br i1 %8, label %94, label %9

9:                                                ; preds = %5
  %10 = ptrtoint i8* %1 to i64
  %11 = ptrtoint i8* %0 to i64
  %12 = sub i64 %10, %11
  %13 = icmp sgt i64 %12, 0
  br i1 %13, label %14, label %94

14:                                               ; preds = %9
  %15 = icmp ult i32 %4, 254
  %16 = select i1 %15, i32 %4, i32 254
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds i8, i8* %3, i64 %17
  %19 = ptrtoint i8* %2 to i64
  %20 = ptrtoint i8* %18 to i64
  br label %21

21:                                               ; preds = %14, %88
  %22 = phi i64 [ 0, %14 ], [ %92, %88 ]
  %23 = phi i32 [ -1, %14 ], [ %91, %88 ]
  %24 = phi i8* [ %3, %14 ], [ %90, %88 ]
  %25 = phi i8* [ %2, %14 ], [ %89, %88 ]
  %26 = load i8, i8* %25, align 1, !tbaa !3
  %27 = zext i8 %26 to i32
  %28 = and i32 %27, 192
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %49, label %30

30:                                               ; preds = %21
  %31 = getelementptr inbounds i8, i8* %25, i64 1
  %32 = icmp eq i8* %31, %1
  br i1 %32, label %94, label %33

33:                                               ; preds = %30
  %34 = shl nuw nsw i32 %27, 8
  %35 = and i32 %34, 16128
  %36 = load i8, i8* %31, align 1, !tbaa !3
  %37 = zext i8 %36 to i32
  %38 = or i32 %35, %37
  %39 = zext i32 %38 to i64
  %40 = icmp sgt i64 %12, %39
  br i1 %40, label %41, label %94

41:                                               ; preds = %33
  %42 = icmp slt i32 %23, 0
  %43 = getelementptr inbounds i8, i8* %25, i64 2
  %44 = ptrtoint i8* %43 to i64
  %45 = sub i64 %44, %19
  %46 = trunc i64 %45 to i32
  %47 = select i1 %42, i32 %46, i32 %23
  %48 = getelementptr inbounds i8, i8* %0, i64 %39
  br label %88

49:                                               ; preds = %21
  %50 = icmp eq i8 %26, 0
  br i1 %50, label %81, label %51

51:                                               ; preds = %49
  %52 = icmp eq i8* %24, %3
  br i1 %52, label %56, label %53

53:                                               ; preds = %51
  %54 = getelementptr inbounds i8, i8* %24, i64 1
  store i8 46, i8* %24, align 1, !tbaa !3
  %55 = load i8, i8* %25, align 1, !tbaa !3
  br label %56

56:                                               ; preds = %53, %51
  %57 = phi i8 [ %55, %53 ], [ %26, %51 ]
  %58 = phi i8* [ %54, %53 ], [ %3, %51 ]
  %59 = getelementptr inbounds i8, i8* %25, i64 1
  %60 = zext i8 %57 to i64
  %61 = ptrtoint i8* %59 to i64
  %62 = sub i64 %10, %61
  %63 = icmp sgt i64 %62, %60
  %64 = ptrtoint i8* %58 to i64
  %65 = sub i64 %20, %64
  %66 = icmp sgt i64 %65, %60
  %67 = select i1 %63, i1 %66, i1 false
  br i1 %67, label %68, label %94

68:                                               ; preds = %56
  %69 = icmp eq i8 %57, 0
  br i1 %69, label %88, label %70

70:                                               ; preds = %68
  %71 = zext i8 %57 to i32
  br label %72

72:                                               ; preds = %70, %72
  %73 = phi i32 [ %76, %72 ], [ %71, %70 ]
  %74 = phi i8* [ %79, %72 ], [ %58, %70 ]
  %75 = phi i8* [ %77, %72 ], [ %59, %70 ]
  %76 = add nsw i32 %73, -1
  %77 = getelementptr inbounds i8, i8* %75, i64 1
  %78 = load i8, i8* %75, align 1, !tbaa !3
  %79 = getelementptr inbounds i8, i8* %74, i64 1
  store i8 %78, i8* %74, align 1, !tbaa !3
  %80 = icmp eq i32 %76, 0
  br i1 %80, label %88, label %72

81:                                               ; preds = %49
  store i8 0, i8* %24, align 1, !tbaa !3
  %82 = icmp slt i32 %23, 0
  %83 = getelementptr inbounds i8, i8* %25, i64 1
  %84 = ptrtoint i8* %83 to i64
  %85 = sub i64 %84, %19
  %86 = trunc i64 %85 to i32
  %87 = select i1 %82, i32 %86, i32 %23
  br label %94

88:                                               ; preds = %72, %68, %41
  %89 = phi i8* [ %48, %41 ], [ %59, %68 ], [ %77, %72 ]
  %90 = phi i8* [ %24, %41 ], [ %58, %68 ], [ %79, %72 ]
  %91 = phi i32 [ %47, %41 ], [ %23, %68 ], [ %23, %72 ]
  %92 = add nuw i64 %22, 2
  %93 = icmp sgt i64 %12, %92
  br i1 %93, label %21, label %94

94:                                               ; preds = %30, %33, %56, %88, %9, %5, %81
  %95 = phi i32 [ %87, %81 ], [ -1, %5 ], [ -1, %9 ], [ -1, %88 ], [ -1, %56 ], [ -1, %33 ], [ -1, %30 ]
  ret i32 %95
}

attributes #0 = { nofree norecurse nosync nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
