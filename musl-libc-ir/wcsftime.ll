; ModuleID = 'src/time/wcsftime.c'
source_filename = "src/time/wcsftime.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }

@wcsftime_l = weak alias i64 (i32*, i64, i32*, %struct.tm*, %struct.__locale_struct*), i64 (i32*, i64, i32*, %struct.tm*, %struct.__locale_struct*)* @__wcsftime_l

; Function Attrs: nounwind optsize strictfp
define i64 @__wcsftime_l(i32* noalias noundef %0, i64 noundef %1, i32* noalias noundef %2, %struct.tm* noalias noundef %3, %struct.__locale_struct* noundef %4) #0 {
  %6 = alloca i64, align 8
  %7 = alloca [100 x i8], align 16
  %8 = alloca [100 x i32], align 16
  %9 = alloca i32*, align 8
  %10 = bitcast i64* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %10) #3
  %11 = getelementptr inbounds [100 x i8], [100 x i8]* %7, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 100, i8* nonnull %11) #3
  %12 = bitcast [100 x i32]* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 400, i8* nonnull %12) #3
  %13 = bitcast i32** %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %13) #3
  %14 = icmp eq i64 %1, 0
  br i1 %14, label %127, label %15

15:                                               ; preds = %5
  %16 = getelementptr inbounds [100 x i32], [100 x i32]* %8, i64 0, i64 0
  %17 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 5
  br label %18

18:                                               ; preds = %15, %112
  %19 = phi i32* [ %2, %15 ], [ %115, %112 ]
  %20 = phi i64 [ 0, %15 ], [ %113, %112 ]
  %21 = load i32, i32* %19, align 4, !tbaa !3
  switch i32 %21, label %22 [
    i32 0, label %123
    i32 37, label %25
  ]

22:                                               ; preds = %18
  %23 = add nuw i64 %20, 1
  %24 = getelementptr inbounds i32, i32* %0, i64 %20
  store i32 %21, i32* %24, align 4, !tbaa !3
  br label %112

25:                                               ; preds = %18
  %26 = getelementptr inbounds i32, i32* %19, i64 1
  %27 = load i32, i32* %26, align 4, !tbaa !3
  switch i32 %27, label %31 [
    i32 45, label %28
    i32 95, label %28
    i32 48, label %28
  ]

28:                                               ; preds = %25, %25, %25
  %29 = getelementptr inbounds i32, i32* %19, i64 2
  %30 = load i32, i32* %29, align 4, !tbaa !3
  br label %31

31:                                               ; preds = %25, %28
  %32 = phi i32 [ %27, %25 ], [ %30, %28 ]
  %33 = phi i64 [ 1, %25 ], [ 2, %28 ]
  %34 = phi i32 [ 0, %25 ], [ %27, %28 ]
  %35 = getelementptr inbounds i32, i32* %19, i64 %33
  %36 = icmp eq i32 %32, 43
  %37 = zext i1 %36 to i64
  %38 = getelementptr i32, i32* %35, i64 %37
  %39 = call i64 @wcstoul(i32* noundef nonnull %38, i32** noundef nonnull %9, i32 noundef 10) #4
  %40 = load i32*, i32** %9, align 8, !tbaa !7
  %41 = load i32, i32* %40, align 4, !tbaa !3
  switch i32 %41, label %47 [
    i32 67, label %42
    i32 70, label %42
    i32 71, label %42
    i32 89, label %42
  ]

42:                                               ; preds = %31, %31, %31, %31
  %43 = icmp eq i64 %39, 0
  br i1 %43, label %44, label %47

44:                                               ; preds = %42
  %45 = icmp ne i32* %40, %38
  %46 = zext i1 %45 to i64
  br label %47

47:                                               ; preds = %44, %31, %42
  %48 = phi i64 [ %39, %42 ], [ %46, %44 ], [ 0, %31 ]
  switch i32 %41, label %52 [
    i32 69, label %49
    i32 79, label %49
  ]

49:                                               ; preds = %47, %47
  %50 = getelementptr inbounds i32, i32* %40, i64 1
  %51 = load i32, i32* %50, align 4, !tbaa !3
  br label %52

52:                                               ; preds = %47, %49
  %53 = phi i32 [ %51, %49 ], [ %41, %47 ]
  %54 = phi i32* [ %50, %49 ], [ %40, %47 ]
  %55 = call i8* @__strftime_fmt_1([100 x i8]* noundef nonnull %7, i64* noundef nonnull %6, i32 noundef %53, %struct.tm* noundef %3, %struct.__locale_struct* noundef %4, i32 noundef %34) #4
  %56 = icmp eq i8* %55, null
  br i1 %56, label %118, label %57

57:                                               ; preds = %52
  %58 = call i64 @mbstowcs(i32* noundef nonnull %16, i8* noundef nonnull %55, i64 noundef 100) #4
  store i64 %58, i64* %6, align 8, !tbaa !9
  %59 = icmp eq i64 %58, -1
  br i1 %59, label %127, label %60

60:                                               ; preds = %57
  %61 = icmp eq i64 %48, 0
  br i1 %61, label %99, label %62

62:                                               ; preds = %60, %70
  %63 = phi i64 [ %72, %70 ], [ %58, %60 ]
  %64 = phi i32* [ %71, %70 ], [ %16, %60 ]
  %65 = load i32, i32* %64, align 4, !tbaa !3
  switch i32 %65, label %73 [
    i32 43, label %70
    i32 45, label %70
    i32 48, label %66
  ]

66:                                               ; preds = %62
  %67 = getelementptr inbounds i32, i32* %64, i64 1
  %68 = load i32, i32* %67, align 4, !tbaa !3
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %73, label %70

70:                                               ; preds = %62, %62, %66
  %71 = getelementptr inbounds i32, i32* %64, i64 1
  %72 = add i64 %63, -1
  store i64 %72, i64* %6, align 8, !tbaa !9
  br label %62

73:                                               ; preds = %62, %66
  %74 = add i64 %48, -1
  %75 = load i32, i32* %17, align 4, !tbaa !11
  %76 = icmp sgt i32 %75, 8099
  %77 = select i1 %36, i1 %76, i1 false
  br i1 %77, label %80, label %78

78:                                               ; preds = %73
  %79 = icmp slt i32 %75, -1900
  br i1 %79, label %80, label %84

80:                                               ; preds = %78, %73
  %81 = phi i32 [ 43, %73 ], [ 45, %78 ]
  %82 = add i64 %20, 1
  %83 = getelementptr inbounds i32, i32* %0, i64 %20
  store i32 %81, i32* %83, align 4, !tbaa !3
  br label %84

84:                                               ; preds = %80, %78
  %85 = phi i64 [ %20, %78 ], [ %82, %80 ]
  %86 = phi i64 [ %48, %78 ], [ %74, %80 ]
  %87 = icmp ugt i64 %86, %63
  %88 = icmp ult i64 %85, %1
  %89 = select i1 %87, i1 %88, i1 false
  br i1 %89, label %90, label %99

90:                                               ; preds = %84, %90
  %91 = phi i64 [ %95, %90 ], [ %86, %84 ]
  %92 = phi i64 [ %93, %90 ], [ %85, %84 ]
  %93 = add nuw i64 %92, 1
  %94 = getelementptr inbounds i32, i32* %0, i64 %92
  store i32 48, i32* %94, align 4, !tbaa !3
  %95 = add i64 %91, -1
  %96 = icmp ugt i64 %95, %63
  %97 = icmp ult i64 %93, %1
  %98 = select i1 %96, i1 %97, i1 false
  br i1 %98, label %90, label %99

99:                                               ; preds = %90, %84, %60
  %100 = phi i64 [ %58, %60 ], [ %63, %84 ], [ %63, %90 ]
  %101 = phi i64 [ %20, %60 ], [ %85, %84 ], [ %93, %90 ]
  %102 = phi i32* [ %16, %60 ], [ %64, %84 ], [ %64, %90 ]
  %103 = sub i64 %1, %101
  %104 = icmp ult i64 %100, %103
  br i1 %104, label %106, label %105

105:                                              ; preds = %99
  store i64 %103, i64* %6, align 8, !tbaa !9
  br label %106

106:                                              ; preds = %105, %99
  %107 = phi i64 [ %103, %105 ], [ %100, %99 ]
  %108 = getelementptr inbounds i32, i32* %0, i64 %101
  %109 = call i32* @wmemcpy(i32* noundef %108, i32* noundef %102, i64 noundef %107) #4
  %110 = load i64, i64* %6, align 8, !tbaa !9
  %111 = add i64 %110, %101
  br label %112

112:                                              ; preds = %106, %22
  %113 = phi i64 [ %23, %22 ], [ %111, %106 ]
  %114 = phi i32* [ %19, %22 ], [ %54, %106 ]
  %115 = getelementptr inbounds i32, i32* %114, i64 1
  %116 = icmp ult i64 %113, %1
  br i1 %116, label %18, label %117

117:                                              ; preds = %112
  br i1 %14, label %127, label %118

118:                                              ; preds = %52, %117
  %119 = phi i64 [ %113, %117 ], [ %20, %52 ]
  %120 = icmp eq i64 %119, %1
  %121 = add i64 %1, -1
  %122 = select i1 %120, i64 %121, i64 %119
  br label %123

123:                                              ; preds = %18, %118
  %124 = phi i64 [ %122, %118 ], [ %20, %18 ]
  %125 = phi i64 [ 0, %118 ], [ %20, %18 ]
  %126 = getelementptr inbounds i32, i32* %0, i64 %124
  store i32 0, i32* %126, align 4, !tbaa !3
  br label %127

127:                                              ; preds = %57, %123, %5, %117
  %128 = phi i64 [ 0, %117 ], [ 0, %5 ], [ %125, %123 ], [ 0, %57 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %13) #3
  call void @llvm.lifetime.end.p0i8(i64 400, i8* nonnull %12) #3
  call void @llvm.lifetime.end.p0i8(i64 100, i8* nonnull %11) #3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %10) #3
  ret i64 %128
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i64 @wcstoul(i32* noundef, i32** noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i8* @__strftime_fmt_1([100 x i8]* noundef, i64* noundef, i32 noundef, %struct.tm* noundef, %struct.__locale_struct* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @mbstowcs(i32* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32* @wmemcpy(i32* noundef, i32* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define i64 @wcsftime(i32* noalias noundef %0, i64 noundef %1, i32* noalias noundef %2, %struct.tm* noalias noundef %3) local_unnamed_addr #0 {
  %5 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #5, !srcloc !13
  %6 = inttoptr i64 %5 to %struct.__pthread*
  %7 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %6, i64 0, i32 24
  %8 = load %struct.__locale_struct*, %struct.__locale_struct** %7, align 8, !tbaa !14
  %9 = tail call i64 @__wcsftime_l(i32* noundef %0, i64 noundef %1, i32* noundef %2, %struct.tm* noundef %3, %struct.__locale_struct* noundef %8) #6
  ret i64 %9
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nounwind readnone strictfp }
attributes #6 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"any pointer", !5, i64 0}
!9 = !{!10, !10, i64 0}
!10 = !{!"long", !5, i64 0}
!11 = !{!12, !4, i64 20}
!12 = !{!"tm", !4, i64 0, !4, i64 4, !4, i64 8, !4, i64 12, !4, i64 16, !4, i64 20, !4, i64 24, !4, i64 28, !4, i64 32, !10, i64 40, !8, i64 48}
!13 = !{i64 269229}
!14 = !{!15, !8, i64 168}
!15 = !{!"__pthread", !8, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !10, i64 32, !10, i64 40, !4, i64 48, !4, i64 52, !4, i64 56, !4, i64 60, !5, i64 64, !5, i64 65, !5, i64 66, !5, i64 66, !8, i64 72, !10, i64 80, !8, i64 88, !10, i64 96, !10, i64 104, !8, i64 112, !8, i64 120, !8, i64 128, !16, i64 136, !4, i64 160, !4, i64 164, !8, i64 168, !5, i64 176, !8, i64 184, !8, i64 192}
!16 = !{!"", !8, i64 0, !10, i64 8, !8, i64 16}
