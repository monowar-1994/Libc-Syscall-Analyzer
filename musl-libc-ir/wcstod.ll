; ModuleID = 'src/stdlib/wcstod.c'
source_filename = "src/stdlib/wcstod.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@.str = private unnamed_addr constant [2 x i32] [i32 64, i32 0], align 4

; Function Attrs: nounwind optsize strictfp
define float @wcstof(i32* noalias noundef %0, i32** noalias noundef %1) local_unnamed_addr #0 {
  %3 = tail call fastcc x86_fp80 @wcstox(i32* noundef %0, i32** noundef %1, i32 noundef 0) #6
  %4 = tail call float @llvm.experimental.constrained.fptrunc.f32.f80(x86_fp80 %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #7
  ret float %4
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc x86_fp80 @wcstox(i32* noundef %0, i32** noundef writeonly %1, i32 noundef %2) unnamed_addr #0 {
  %4 = alloca [64 x i8], align 16
  %5 = alloca %struct._IO_FILE, align 8
  %6 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %6) #8
  %7 = bitcast %struct._IO_FILE* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 232, i8* nonnull %7) #8
  %8 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 4
  %9 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %5, i64 0, i32 11
  %10 = bitcast %struct._IO_FILE* %5 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(232) %10, i8 0, i64 232, i1 false)
  store i8* %8, i8** %9, align 8, !tbaa !3
  %11 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %5, i64 0, i32 2
  store i8* %8, i8** %11, align 8, !tbaa !10
  %12 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %5, i64 0, i32 1
  store i8* %8, i8** %12, align 8, !tbaa !11
  %13 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %5, i64 0, i32 12
  store i64 60, i64* %13, align 8, !tbaa !12
  %14 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %5, i64 0, i32 19
  store volatile i32 -1, i32* %14, align 4, !tbaa !13
  %15 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %5, i64 0, i32 8
  store i64 (%struct._IO_FILE*, i8*, i64)* @do_read, i64 (%struct._IO_FILE*, i8*, i64)** %15, align 8, !tbaa !14
  br label %16

16:                                               ; preds = %16, %3
  %17 = phi i32* [ %0, %3 ], [ %21, %16 ]
  %18 = load i32, i32* %17, align 4, !tbaa !15
  %19 = call i32 @iswspace(i32 noundef %18) #9
  %20 = icmp eq i32 %19, 0
  %21 = getelementptr inbounds i32, i32* %17, i64 1
  br i1 %20, label %22, label %16

22:                                               ; preds = %16
  %23 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %5, i64 0, i32 21
  %24 = bitcast i8** %23 to i32**
  store i32* %17, i32** %24, align 8, !tbaa !16
  call void @__shlim(%struct._IO_FILE* noundef nonnull %5, i64 noundef 0) #9
  %25 = call x86_fp80 @__floatscan(%struct._IO_FILE* noundef nonnull %5, i32 noundef %2, i32 noundef 1) #9
  %26 = icmp eq i32** %1, null
  br i1 %26, label %39, label %27

27:                                               ; preds = %22
  %28 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %5, i64 0, i32 27
  %29 = load i64, i64* %28, align 8, !tbaa !17
  %30 = load i8*, i8** %12, align 8, !tbaa !11
  %31 = load i8*, i8** %9, align 8, !tbaa !3
  %32 = ptrtoint i8* %30 to i64
  %33 = ptrtoint i8* %31 to i64
  %34 = sub i64 %32, %33
  %35 = add nsw i64 %34, %29
  %36 = icmp eq i64 %35, 0
  %37 = getelementptr inbounds i32, i32* %17, i64 %35
  %38 = select i1 %36, i32* %0, i32* %37
  store i32* %38, i32** %1, align 8, !tbaa !18
  br label %39

39:                                               ; preds = %27, %22
  call void @llvm.lifetime.end.p0i8(i64 232, i8* nonnull %7) #8
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %6) #8
  ret x86_fp80 %25
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f80(x86_fp80, metadata, metadata) #1

; Function Attrs: nounwind optsize strictfp
define double @wcstod(i32* noalias noundef %0, i32** noalias noundef %1) local_unnamed_addr #0 {
  %3 = tail call fastcc x86_fp80 @wcstox(i32* noundef %0, i32** noundef %1, i32 noundef 1) #6
  %4 = tail call double @llvm.experimental.constrained.fptrunc.f64.f80(x86_fp80 %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #7
  ret double %4
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fptrunc.f64.f80(x86_fp80, metadata, metadata) #1

; Function Attrs: nounwind optsize strictfp
define x86_fp80 @wcstold(i32* noalias noundef %0, i32** noalias noundef %1) local_unnamed_addr #0 {
  %3 = tail call fastcc x86_fp80 @wcstox(i32* noundef %0, i32** noundef %1, i32 noundef 2) #6
  ret x86_fp80 %3
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nofree norecurse nosync nounwind optsize strictfp
define internal i64 @do_read(%struct._IO_FILE* nocapture noundef %0, i8* nocapture noundef writeonly %1, i64 noundef %2) #4 {
  %4 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 21
  %5 = bitcast i8** %4 to i32**
  %6 = load i32*, i32** %5, align 8, !tbaa !16
  %7 = load i32, i32* %6, align 4, !tbaa !15
  %8 = icmp eq i32 %7, 0
  %9 = select i1 %8, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @.str, i64 0, i64 0), i32* %6
  %10 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 12
  %11 = load i64, i64* %10, align 8, !tbaa !12
  %12 = icmp eq i64 %11, 0
  br i1 %12, label %29, label %13

13:                                               ; preds = %3
  %14 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 11
  br label %15

15:                                               ; preds = %13, %20
  %16 = phi i64 [ 0, %13 ], [ %26, %20 ]
  %17 = getelementptr inbounds i32, i32* %9, i64 %16
  %18 = load i32, i32* %17, align 4, !tbaa !15
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %29, label %20

20:                                               ; preds = %15
  %21 = icmp slt i32 %18, 128
  %22 = trunc i32 %18 to i8
  %23 = select i1 %21, i8 %22, i8 64
  %24 = load i8*, i8** %14, align 8, !tbaa !3
  %25 = getelementptr inbounds i8, i8* %24, i64 %16
  store i8 %23, i8* %25, align 1, !tbaa !19
  %26 = add nuw i64 %16, 1
  %27 = load i64, i64* %10, align 8, !tbaa !12
  %28 = icmp ult i64 %26, %27
  br i1 %28, label %15, label %29

29:                                               ; preds = %15, %20, %3
  %30 = phi i64 [ 0, %3 ], [ %26, %20 ], [ %16, %15 ]
  %31 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 11
  %32 = load i8*, i8** %31, align 8, !tbaa !3
  %33 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  store i8* %32, i8** %33, align 8, !tbaa !11
  %34 = getelementptr inbounds i8, i8* %32, i64 %30
  %35 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 2
  store i8* %34, i8** %35, align 8, !tbaa !10
  %36 = getelementptr inbounds i32, i32* %9, i64 %30
  store i32* %36, i32** %5, align 8, !tbaa !16
  %37 = icmp ne i64 %30, 0
  %38 = icmp ne i64 %2, 0
  %39 = and i1 %38, %37
  br i1 %39, label %40, label %43

40:                                               ; preds = %29
  %41 = getelementptr inbounds i8, i8* %32, i64 1
  store i8* %41, i8** %33, align 8, !tbaa !11
  %42 = load i8, i8* %32, align 1, !tbaa !19
  store i8 %42, i8* %1, align 1, !tbaa !19
  br label %43

43:                                               ; preds = %29, %40
  %44 = phi i64 [ 1, %40 ], [ 0, %29 ]
  ret i64 %44
}

; Function Attrs: optsize
declare i32 @iswspace(i32 noundef) local_unnamed_addr #5

; Function Attrs: optsize
declare hidden void @__shlim(%struct._IO_FILE* noundef, i64 noundef) local_unnamed_addr #5

; Function Attrs: optsize
declare hidden x86_fp80 @__floatscan(%struct._IO_FILE* noundef, i32 noundef, i32 noundef) local_unnamed_addr #5

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #4 = { nofree norecurse nosync nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nobuiltin optsize strictfp "no-builtins" }
attributes #7 = { strictfp }
attributes #8 = { nounwind strictfp }
attributes #9 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !8, i64 88}
!4 = !{!"_IO_FILE", !5, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !9, i64 96, !8, i64 104, !8, i64 112, !5, i64 120, !5, i64 124, !9, i64 128, !5, i64 136, !5, i64 140, !5, i64 144, !8, i64 152, !9, i64 160, !8, i64 168, !8, i64 176, !8, i64 184, !9, i64 192, !9, i64 200, !8, i64 208, !8, i64 216, !8, i64 224}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{!4, !8, i64 16}
!11 = !{!4, !8, i64 8}
!12 = !{!4, !9, i64 96}
!13 = !{!4, !5, i64 140}
!14 = !{!4, !8, i64 64}
!15 = !{!5, !5, i64 0}
!16 = !{!4, !8, i64 152}
!17 = !{!4, !9, i64 200}
!18 = !{!8, !8, i64 0}
!19 = !{!6, !6, i64 0}
