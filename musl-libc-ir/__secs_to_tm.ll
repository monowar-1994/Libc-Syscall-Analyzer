; ModuleID = 'src/time/__secs_to_tm.c'
source_filename = "src/time/__secs_to_tm.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }

@__secs_to_tm.days_in_month = internal unnamed_addr constant [12 x i8] c"\1F\1E\1F\1E\1F\1F\1E\1F\1E\1F\1F\1D", align 1

; Function Attrs: nofree norecurse nosync nounwind optsize strictfp writeonly
define hidden i32 @__secs_to_tm(i64 noundef %0, %struct.tm* nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = add i64 %0, -67908586878892801
  %4 = icmp ult i64 %3, -135817173789408001
  br i1 %4, label %106, label %5

5:                                                ; preds = %2
  %6 = add nsw i64 %0, -951868800
  %7 = sdiv i64 %6, 86400
  %8 = srem i64 %6, 86400
  %9 = trunc i64 %8 to i32
  %10 = icmp slt i32 %9, 0
  %11 = add nsw i32 %9, 86400
  %12 = ashr i64 %8, 31
  %13 = add nsw i64 %12, %7
  %14 = select i1 %10, i32 %11, i32 %9
  %15 = add nsw i64 %13, 3
  %16 = srem i64 %15, 7
  %17 = trunc i64 %16 to i32
  %18 = icmp slt i32 %17, 0
  %19 = add nsw i32 %17, 7
  %20 = select i1 %18, i32 %19, i32 %17
  %21 = sdiv i64 %13, 146097
  %22 = srem i64 %13, 146097
  %23 = trunc i64 %22 to i32
  %24 = icmp slt i32 %23, 0
  %25 = add nsw i32 %23, 146097
  %26 = select i1 %24, i32 %25, i32 %23
  %27 = ashr i64 %22, 31
  %28 = add nsw i64 %27, %21
  %29 = udiv i32 %26, 36524
  %30 = add nsw i32 %26, -146096
  %31 = icmp ult i32 %30, 36524
  %32 = select i1 %31, i32 3, i32 %29
  %33 = mul nsw i32 %32, -36524
  %34 = add nsw i32 %33, %26
  %35 = sdiv i32 %34, 1461
  %36 = add nsw i32 %34, -36525
  %37 = icmp ult i32 %36, 1461
  %38 = select i1 %37, i32 24, i32 %35
  %39 = mul nsw i32 %38, -1461
  %40 = add nsw i32 %39, %34
  %41 = sdiv i32 %40, 365
  %42 = add nsw i32 %40, -1460
  %43 = icmp ult i32 %42, 365
  %44 = select i1 %43, i32 3, i32 %41
  %45 = mul nsw i32 %44, -365
  %46 = add nsw i32 %45, %40
  %47 = icmp eq i32 %44, 0
  %48 = icmp ne i32 %38, 0
  %49 = icmp eq i32 %32, 0
  %50 = select i1 %48, i1 true, i1 %49
  %51 = select i1 %47, i1 %50, i1 false
  %52 = zext i1 %51 to i32
  %53 = add nsw i32 %46, 59
  %54 = add nsw i32 %53, %52
  %55 = icmp slt i32 %46, 306
  %56 = select i1 %51, i32 -366, i32 -365
  %57 = select i1 %55, i32 0, i32 %56
  %58 = add nsw i32 %54, %57
  %59 = shl nsw i32 %38, 2
  %60 = mul nuw nsw i32 %32, 100
  %61 = add nsw i32 %59, %60
  %62 = add nsw i32 %61, %44
  %63 = sext i32 %62 to i64
  %64 = mul nsw i64 %28, 400
  %65 = add nsw i64 %64, %63
  %66 = icmp slt i32 %46, 31
  br i1 %66, label %79, label %67

67:                                               ; preds = %5, %67
  %68 = phi i64 [ %72, %67 ], [ 0, %5 ]
  %69 = phi i32 [ %75, %67 ], [ 31, %5 ]
  %70 = phi i32 [ %71, %67 ], [ %46, %5 ]
  %71 = sub nsw i32 %70, %69
  %72 = add nuw nsw i64 %68, 1
  %73 = getelementptr inbounds [12 x i8], [12 x i8]* @__secs_to_tm.days_in_month, i64 0, i64 %72
  %74 = load i8, i8* %73, align 1, !tbaa !3
  %75 = sext i8 %74 to i32
  %76 = icmp slt i32 %71, %75
  br i1 %76, label %77, label %67

77:                                               ; preds = %67
  %78 = trunc i64 %72 to i32
  br label %79

79:                                               ; preds = %77, %5
  %80 = phi i32 [ %46, %5 ], [ %71, %77 ]
  %81 = phi i32 [ 0, %5 ], [ %78, %77 ]
  %82 = icmp ugt i32 %81, 9
  %83 = zext i1 %82 to i64
  %84 = add nsw i64 %65, %83
  %85 = add nsw i64 %84, -2147483548
  %86 = icmp ult i64 %85, -4294967296
  br i1 %86, label %106, label %87

87:                                               ; preds = %79
  %88 = add nsw i32 %81, -12
  %89 = select i1 %82, i32 %88, i32 %81
  %90 = trunc i64 %84 to i32
  %91 = add i32 %90, 100
  %92 = getelementptr inbounds %struct.tm, %struct.tm* %1, i64 0, i32 5
  store i32 %91, i32* %92, align 4, !tbaa !6
  %93 = add nsw i32 %89, 2
  %94 = getelementptr inbounds %struct.tm, %struct.tm* %1, i64 0, i32 4
  store i32 %93, i32* %94, align 8, !tbaa !11
  %95 = add nsw i32 %80, 1
  %96 = getelementptr inbounds %struct.tm, %struct.tm* %1, i64 0, i32 3
  store i32 %95, i32* %96, align 4, !tbaa !12
  %97 = getelementptr inbounds %struct.tm, %struct.tm* %1, i64 0, i32 6
  store i32 %20, i32* %97, align 8, !tbaa !13
  %98 = getelementptr inbounds %struct.tm, %struct.tm* %1, i64 0, i32 7
  store i32 %58, i32* %98, align 4, !tbaa !14
  %99 = sdiv i32 %14, 3600
  %100 = getelementptr inbounds %struct.tm, %struct.tm* %1, i64 0, i32 2
  store i32 %99, i32* %100, align 8, !tbaa !15
  %101 = sdiv i32 %14, 60
  %102 = srem i32 %101, 60
  %103 = getelementptr inbounds %struct.tm, %struct.tm* %1, i64 0, i32 1
  store i32 %102, i32* %103, align 4, !tbaa !16
  %104 = srem i32 %14, 60
  %105 = getelementptr inbounds %struct.tm, %struct.tm* %1, i64 0, i32 0
  store i32 %104, i32* %105, align 8, !tbaa !17
  br label %106

106:                                              ; preds = %79, %2, %87
  %107 = phi i32 [ 0, %87 ], [ -1, %2 ], [ -1, %79 ]
  ret i32 %107
}

attributes #0 = { nofree norecurse nosync nounwind optsize strictfp writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !8, i64 20}
!7 = !{!"tm", !8, i64 0, !8, i64 4, !8, i64 8, !8, i64 12, !8, i64 16, !8, i64 20, !8, i64 24, !8, i64 28, !8, i64 32, !9, i64 40, !10, i64 48}
!8 = !{!"int", !4, i64 0}
!9 = !{!"long", !4, i64 0}
!10 = !{!"any pointer", !4, i64 0}
!11 = !{!7, !8, i64 16}
!12 = !{!7, !8, i64 12}
!13 = !{!7, !8, i64 24}
!14 = !{!7, !8, i64 28}
!15 = !{!7, !8, i64 8}
!16 = !{!7, !8, i64 4}
!17 = !{!7, !8, i64 0}
