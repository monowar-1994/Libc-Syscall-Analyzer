; ModuleID = 'src/locale/__mo_lookup.c'
source_filename = "src/locale/__mo_lookup.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i8* @__mo_lookup(i8* noundef %0, i64 noundef %1, i8* noundef %2) local_unnamed_addr #0 {
  %4 = bitcast i8* %0 to i32*
  %5 = load i32, i32* %4, align 4, !tbaa !3
  %6 = getelementptr inbounds i8, i8* %0, i64 8
  %7 = bitcast i8* %6 to i32*
  %8 = load i32, i32* %7, align 4, !tbaa !3
  %9 = icmp eq i32 %5, -1794895138
  %10 = tail call i32 @llvm.bswap.i32(i32 %8) #3
  %11 = select i1 %9, i32 %8, i32 %10
  %12 = getelementptr inbounds i8, i8* %0, i64 12
  %13 = bitcast i8* %12 to i32*
  %14 = load i32, i32* %13, align 4, !tbaa !3
  %15 = tail call i32 @llvm.bswap.i32(i32 %14) #3
  %16 = select i1 %9, i32 %14, i32 %15
  %17 = getelementptr inbounds i8, i8* %0, i64 16
  %18 = bitcast i8* %17 to i32*
  %19 = load i32, i32* %18, align 4, !tbaa !3
  %20 = tail call i32 @llvm.bswap.i32(i32 %19) #3
  %21 = select i1 %9, i32 %19, i32 %20
  %22 = zext i32 %11 to i64
  %23 = lshr i64 %1, 2
  %24 = icmp ugt i64 %23, %22
  br i1 %24, label %25, label %134

25:                                               ; preds = %3
  %26 = zext i32 %16 to i64
  %27 = shl i32 %11, 2
  %28 = zext i32 %27 to i64
  %29 = sub i64 %1, %28
  %30 = icmp ugt i64 %29, %26
  %31 = zext i32 %21 to i64
  %32 = icmp ugt i64 %29, %31
  %33 = select i1 %30, i1 %32, i1 false
  br i1 %33, label %34, label %134

34:                                               ; preds = %25
  %35 = or i32 %21, %16
  %36 = and i32 %35, 3
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %134

38:                                               ; preds = %34
  %39 = lshr i32 %16, 2
  %40 = lshr i32 %21, 2
  %41 = lshr i32 %11, 1
  %42 = and i32 %11, -2
  %43 = add i32 %42, %39
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32* %4, i64 %44
  %46 = load i32, i32* %45, align 4, !tbaa !3
  %47 = tail call i32 @llvm.bswap.i32(i32 %46) #3
  %48 = select i1 %9, i32 %46, i32 %47
  %49 = add i32 %43, 1
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32* %4, i64 %50
  %52 = load i32, i32* %51, align 4, !tbaa !3
  %53 = tail call i32 @llvm.bswap.i32(i32 %52) #3
  %54 = select i1 %9, i32 %52, i32 %53
  %55 = zext i32 %54 to i64
  %56 = icmp ult i64 %55, %1
  %57 = zext i32 %48 to i64
  %58 = sub i64 %1, %55
  %59 = icmp ugt i64 %58, %57
  %60 = select i1 %56, i1 %59, i1 false
  br i1 %60, label %61, label %134

61:                                               ; preds = %38, %108
  %62 = phi i64 [ %128, %108 ], [ %55, %38 ]
  %63 = phi i32 [ %127, %108 ], [ %54, %38 ]
  %64 = phi i32 [ %121, %108 ], [ %48, %38 ]
  %65 = phi i32 [ %115, %108 ], [ %42, %38 ]
  %66 = phi i32 [ %114, %108 ], [ %41, %38 ]
  %67 = phi i32 [ %113, %108 ], [ %41, %38 ]
  %68 = phi i32 [ %112, %108 ], [ 0, %38 ]
  %69 = phi i32 [ %111, %108 ], [ %11, %38 ]
  %70 = add i32 %63, %64
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds i8, i8* %0, i64 %71
  %73 = load i8, i8* %72, align 1, !tbaa !7
  %74 = icmp eq i8 %73, 0
  br i1 %74, label %75, label %134

75:                                               ; preds = %61
  %76 = getelementptr inbounds i8, i8* %0, i64 %62
  %77 = tail call i32 @strcmp(i8* noundef %2, i8* noundef %76) #4
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %79, label %106

79:                                               ; preds = %75
  %80 = add i32 %65, %40
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32* %4, i64 %81
  %83 = load i32, i32* %82, align 4, !tbaa !3
  %84 = tail call i32 @llvm.bswap.i32(i32 %83) #3
  %85 = select i1 %9, i32 %83, i32 %84
  %86 = add i32 %80, 1
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32* %4, i64 %87
  %89 = load i32, i32* %88, align 4, !tbaa !3
  %90 = tail call i32 @llvm.bswap.i32(i32 %89) #3
  %91 = select i1 %9, i32 %89, i32 %90
  %92 = zext i32 %91 to i64
  %93 = icmp ult i64 %92, %1
  %94 = zext i32 %85 to i64
  %95 = sub i64 %1, %92
  %96 = icmp ugt i64 %95, %94
  %97 = select i1 %93, i1 %96, i1 false
  br i1 %97, label %98, label %134

98:                                               ; preds = %79
  %99 = add i32 %91, %85
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds i8, i8* %0, i64 %100
  %102 = load i8, i8* %101, align 1, !tbaa !7
  %103 = icmp eq i8 %102, 0
  %104 = getelementptr inbounds i8, i8* %0, i64 %92
  %105 = select i1 %103, i8* %104, i8* null
  br label %134

106:                                              ; preds = %75
  %107 = icmp eq i32 %69, 1
  br i1 %107, label %134, label %108

108:                                              ; preds = %106
  %109 = icmp slt i32 %77, 0
  %110 = sub i32 %69, %67
  %111 = select i1 %109, i32 %67, i32 %110
  %112 = select i1 %109, i32 %68, i32 %66
  %113 = lshr i32 %111, 1
  %114 = add i32 %112, %113
  %115 = shl i32 %114, 1
  %116 = add i32 %115, %39
  %117 = zext i32 %116 to i64
  %118 = getelementptr inbounds i32, i32* %4, i64 %117
  %119 = load i32, i32* %118, align 4, !tbaa !3
  %120 = tail call i32 @llvm.bswap.i32(i32 %119) #3
  %121 = select i1 %9, i32 %119, i32 %120
  %122 = add i32 %116, 1
  %123 = zext i32 %122 to i64
  %124 = getelementptr inbounds i32, i32* %4, i64 %123
  %125 = load i32, i32* %124, align 4, !tbaa !3
  %126 = tail call i32 @llvm.bswap.i32(i32 %125) #3
  %127 = select i1 %9, i32 %125, i32 %126
  %128 = zext i32 %127 to i64
  %129 = icmp ult i64 %128, %1
  %130 = zext i32 %121 to i64
  %131 = sub i64 %1, %128
  %132 = icmp ugt i64 %131, %130
  %133 = select i1 %129, i1 %132, i1 false
  br i1 %133, label %61, label %134

134:                                              ; preds = %61, %108, %106, %38, %98, %79, %3, %25, %34
  %135 = phi i8* [ null, %34 ], [ null, %25 ], [ null, %3 ], [ %105, %98 ], [ null, %79 ], [ null, %38 ], [ null, %106 ], [ null, %108 ], [ null, %61 ]
  ret i8* %135
}

; Function Attrs: optsize
declare i32 @strcmp(i8* noundef, i8* noundef) local_unnamed_addr #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.bswap.i32(i32) #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind }
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
!7 = !{!5, !5, i64 0}
