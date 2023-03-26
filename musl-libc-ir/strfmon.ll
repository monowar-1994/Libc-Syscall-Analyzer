; ModuleID = 'src/locale/strfmon.c'
source_filename = "src/locale/strfmon.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [6 x i8] c"%*.*f\00", align 1

; Function Attrs: nounwind optsize strictfp
define i64 @strfmon_l(i8* noalias noundef %0, i64 noundef %1, %struct.__locale_struct* nocapture noundef readnone %2, i8* noalias nocapture noundef readonly %3, ...) local_unnamed_addr #0 {
  %5 = alloca [1 x %struct.__va_list_tag], align 16
  %6 = bitcast [1 x %struct.__va_list_tag]* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %6) #5
  %7 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %5, i64 0, i64 0
  call void @llvm.va_start(i8* nonnull %6) #6
  %8 = call fastcc i64 @vstrfmon_l(i8* noundef %0, i64 noundef %1, i8* noundef %3, %struct.__va_list_tag* noundef nonnull %7) #7
  call void @llvm.va_end(i8* nonnull %6) #6
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %6) #5
  ret i64 %8
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc i64 @vstrfmon_l(i8* noundef %0, i64 noundef %1, i8* nocapture noundef readonly %2, %struct.__va_list_tag* nocapture noundef %3) unnamed_addr #0 {
  %5 = icmp eq i64 %1, 0
  br i1 %5, label %131, label %6

6:                                                ; preds = %4
  %7 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %3, i64 0, i32 1
  %8 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %3, i64 0, i32 2
  %9 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %3, i64 0, i32 3
  br label %10

10:                                               ; preds = %6, %19
  %11 = phi i8* [ %0, %6 ], [ %22, %19 ]
  %12 = phi i64 [ %1, %6 ], [ %21, %19 ]
  %13 = phi i8* [ %2, %6 ], [ %23, %19 ]
  %14 = load i8, i8* %13, align 1, !tbaa !3
  switch i8 %14, label %15 [
    i8 0, label %131
    i8 37, label %25
  ]

15:                                               ; preds = %10, %25
  %16 = phi i8* [ %26, %25 ], [ %13, %10 ]
  %17 = getelementptr inbounds i8, i8* %11, i64 1
  store i8 %14, i8* %11, align 1, !tbaa !3
  %18 = add i64 %12, -1
  br label %19

19:                                               ; preds = %15, %128
  %20 = phi i8* [ %16, %15 ], [ %101, %128 ]
  %21 = phi i64 [ %18, %15 ], [ %130, %128 ]
  %22 = phi i8* [ %17, %15 ], [ %129, %128 ]
  %23 = getelementptr inbounds i8, i8* %20, i64 1
  %24 = icmp eq i64 %21, 0
  br i1 %24, label %131, label %10

25:                                               ; preds = %10
  %26 = getelementptr inbounds i8, i8* %13, i64 1
  %27 = load i8, i8* %26, align 1, !tbaa !3
  %28 = icmp eq i8 %27, 37
  br i1 %28, label %15, label %29

29:                                               ; preds = %25, %40
  %30 = phi i8 [ %44, %40 ], [ %27, %25 ]
  %31 = phi i8* [ %43, %40 ], [ %26, %25 ]
  %32 = phi i32 [ %42, %40 ], [ 0, %25 ]
  %33 = sext i8 %30 to i32
  switch i32 %33, label %34 [
    i32 61, label %37
    i32 94, label %40
    i32 40, label %40
    i32 43, label %40
    i32 33, label %40
    i32 45, label %39
  ]

34:                                               ; preds = %29
  %35 = add nsw i32 %33, -48
  %36 = icmp ult i32 %35, 10
  br i1 %36, label %45, label %56

37:                                               ; preds = %29
  %38 = getelementptr inbounds i8, i8* %31, i64 1
  br label %40

39:                                               ; preds = %29
  br label %40

40:                                               ; preds = %29, %29, %29, %29, %39, %37
  %41 = phi i8* [ %31, %39 ], [ %31, %29 ], [ %38, %37 ], [ %31, %29 ], [ %31, %29 ], [ %31, %29 ]
  %42 = phi i32 [ 1, %39 ], [ %32, %29 ], [ %32, %37 ], [ %32, %29 ], [ %32, %29 ], [ %32, %29 ]
  %43 = getelementptr inbounds i8, i8* %41, i64 1
  %44 = load i8, i8* %43, align 1, !tbaa !3
  br label %29

45:                                               ; preds = %34, %45
  %46 = phi i32 [ %54, %45 ], [ %35, %34 ]
  %47 = phi i32 [ %50, %45 ], [ 0, %34 ]
  %48 = phi i8* [ %51, %45 ], [ %31, %34 ]
  %49 = mul nsw i32 %47, 10
  %50 = add nsw i32 %49, %46
  %51 = getelementptr inbounds i8, i8* %48, i64 1
  %52 = load i8, i8* %51, align 1, !tbaa !3
  %53 = sext i8 %52 to i32
  %54 = add nsw i32 %53, -48
  %55 = icmp ult i32 %54, 10
  br i1 %55, label %45, label %56

56:                                               ; preds = %45, %34
  %57 = phi i8 [ %30, %34 ], [ %52, %45 ]
  %58 = phi i8* [ %31, %34 ], [ %51, %45 ]
  %59 = phi i32 [ 0, %34 ], [ %50, %45 ]
  %60 = icmp eq i8 %57, 35
  br i1 %60, label %61, label %78

61:                                               ; preds = %56
  %62 = getelementptr inbounds i8, i8* %58, i64 1
  %63 = load i8, i8* %62, align 1, !tbaa !3
  %64 = sext i8 %63 to i32
  %65 = add nsw i32 %64, -48
  %66 = icmp ult i32 %65, 10
  br i1 %66, label %67, label %78

67:                                               ; preds = %61, %67
  %68 = phi i32 [ %76, %67 ], [ %65, %61 ]
  %69 = phi i8* [ %73, %67 ], [ %62, %61 ]
  %70 = phi i32 [ %72, %67 ], [ 0, %61 ]
  %71 = mul nsw i32 %70, 10
  %72 = add nsw i32 %68, %71
  %73 = getelementptr inbounds i8, i8* %69, i64 1
  %74 = load i8, i8* %73, align 1, !tbaa !3
  %75 = sext i8 %74 to i32
  %76 = add nsw i32 %75, -48
  %77 = icmp ult i32 %76, 10
  br i1 %77, label %67, label %78

78:                                               ; preds = %67, %56, %61
  %79 = phi i8 [ %63, %61 ], [ %57, %56 ], [ %74, %67 ]
  %80 = phi i8* [ %62, %61 ], [ %58, %56 ], [ %73, %67 ]
  %81 = phi i32 [ 0, %61 ], [ 0, %56 ], [ %72, %67 ]
  %82 = icmp eq i8 %79, 46
  br i1 %82, label %83, label %100

83:                                               ; preds = %78
  %84 = getelementptr inbounds i8, i8* %80, i64 1
  %85 = load i8, i8* %84, align 1, !tbaa !3
  %86 = sext i8 %85 to i32
  %87 = add nsw i32 %86, -48
  %88 = icmp ult i32 %87, 10
  br i1 %88, label %89, label %100

89:                                               ; preds = %83, %89
  %90 = phi i32 [ %98, %89 ], [ %87, %83 ]
  %91 = phi i8* [ %95, %89 ], [ %84, %83 ]
  %92 = phi i32 [ %94, %89 ], [ 0, %83 ]
  %93 = mul nsw i32 %92, 10
  %94 = add nsw i32 %90, %93
  %95 = getelementptr inbounds i8, i8* %91, i64 1
  %96 = load i8, i8* %95, align 1, !tbaa !3
  %97 = sext i8 %96 to i32
  %98 = add nsw i32 %97, -48
  %99 = icmp ult i32 %98, 10
  br i1 %99, label %89, label %100

100:                                              ; preds = %89, %83, %78
  %101 = phi i8* [ %80, %78 ], [ %84, %83 ], [ %95, %89 ]
  %102 = phi i32 [ 2, %78 ], [ 0, %83 ], [ %94, %89 ]
  %103 = add nsw i32 %81, 1
  %104 = add nsw i32 %103, %102
  %105 = icmp eq i32 %32, 0
  %106 = icmp sgt i32 %59, %104
  %107 = select i1 %105, i1 %106, i1 false
  %108 = select i1 %107, i32 %59, i32 %104
  %109 = load i32, i32* %7, align 4
  %110 = icmp ult i32 %109, 161
  br i1 %110, label %111, label %116

111:                                              ; preds = %100
  %112 = load i8*, i8** %9, align 8
  %113 = zext i32 %109 to i64
  %114 = getelementptr i8, i8* %112, i64 %113
  %115 = add nuw nsw i32 %109, 16
  store i32 %115, i32* %7, align 4
  br label %119

116:                                              ; preds = %100
  %117 = load i8*, i8** %8, align 8
  %118 = getelementptr i8, i8* %117, i64 8
  store i8* %118, i8** %8, align 8
  br label %119

119:                                              ; preds = %116, %111
  %120 = phi i8* [ %114, %111 ], [ %117, %116 ]
  %121 = bitcast i8* %120 to double*
  %122 = load double, double* %121, align 8
  %123 = tail call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef %11, i64 noundef %12, i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i32 noundef %108, i32 noundef %102, double noundef %122) #8
  %124 = sext i32 %123 to i64
  %125 = icmp ugt i64 %12, %124
  br i1 %125, label %128, label %126

126:                                              ; preds = %119
  %127 = tail call i32* @___errno_location() #9
  store i32 7, i32* %127, align 4, !tbaa !6
  br label %136

128:                                              ; preds = %119
  %129 = getelementptr inbounds i8, i8* %11, i64 %124
  %130 = sub i64 %12, %124
  br label %19

131:                                              ; preds = %19, %10, %4
  %132 = phi i8* [ %0, %4 ], [ %11, %10 ], [ %22, %19 ]
  %133 = ptrtoint i8* %132 to i64
  %134 = ptrtoint i8* %0 to i64
  %135 = sub i64 %133, %134
  br label %136

136:                                              ; preds = %131, %126
  %137 = phi i64 [ -1, %126 ], [ %135, %131 ]
  ret i64 %137
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define i64 @strfmon(i8* noalias noundef %0, i64 noundef %1, i8* noalias nocapture noundef readonly %2, ...) local_unnamed_addr #0 {
  %4 = alloca [1 x %struct.__va_list_tag], align 16
  %5 = bitcast [1 x %struct.__va_list_tag]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %5) #5
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %4, i64 0, i64 0
  call void @llvm.va_start(i8* nonnull %5) #6
  %7 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #10, !srcloc !8
  %8 = call fastcc i64 @vstrfmon_l(i8* noundef %0, i64 noundef %1, i8* noundef %2, %struct.__va_list_tag* noundef nonnull %6) #7
  call void @llvm.va_end(i8* nonnull %5) #6
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %5) #5
  ret i64 %8
}

; Function Attrs: optsize
declare i32 @snprintf(i8* noundef, i64 noundef, i8* noundef, ...) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #4

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind strictfp }
attributes #6 = { strictfp }
attributes #7 = { nobuiltin optsize strictfp "no-builtins" }
attributes #8 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #9 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #10 = { nounwind readnone strictfp }

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
!8 = !{i64 287110}
