; ModuleID = 'src/stdlib/wcstol.c'
source_filename = "src/stdlib/wcstol.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@.str = private unnamed_addr constant [2 x i32] [i32 64, i32 0], align 4

; Function Attrs: nounwind optsize strictfp
define i64 @wcstoull(i32* noalias noundef %0, i32** noalias noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = tail call fastcc i64 @wcstox(i32* noundef %0, i32** noundef %1, i32 noundef %2, i64 noundef -1) #5
  ret i64 %4
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc i64 @wcstox(i32* noundef %0, i32** noundef writeonly %1, i32 noundef %2, i64 noundef %3) unnamed_addr #0 {
  %5 = alloca [64 x i8], align 16
  %6 = alloca %struct._IO_FILE, align 8
  %7 = getelementptr inbounds [64 x i8], [64 x i8]* %5, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %7) #6
  %8 = bitcast %struct._IO_FILE* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 232, i8* nonnull %8) #6
  %9 = getelementptr inbounds [64 x i8], [64 x i8]* %5, i64 0, i64 4
  %10 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %6, i64 0, i32 11
  %11 = bitcast %struct._IO_FILE* %6 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(232) %11, i8 0, i64 232, i1 false)
  store i8* %9, i8** %10, align 8, !tbaa !3
  %12 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %6, i64 0, i32 2
  store i8* %9, i8** %12, align 8, !tbaa !10
  %13 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %6, i64 0, i32 1
  store i8* %9, i8** %13, align 8, !tbaa !11
  %14 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %6, i64 0, i32 12
  store i64 60, i64* %14, align 8, !tbaa !12
  %15 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %6, i64 0, i32 19
  store volatile i32 -1, i32* %15, align 4, !tbaa !13
  %16 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %6, i64 0, i32 8
  store i64 (%struct._IO_FILE*, i8*, i64)* @do_read, i64 (%struct._IO_FILE*, i8*, i64)** %16, align 8, !tbaa !14
  br label %17

17:                                               ; preds = %17, %4
  %18 = phi i32* [ %0, %4 ], [ %22, %17 ]
  %19 = load i32, i32* %18, align 4, !tbaa !15
  %20 = call i32 @iswspace(i32 noundef %19) #7
  %21 = icmp eq i32 %20, 0
  %22 = getelementptr inbounds i32, i32* %18, i64 1
  br i1 %21, label %23, label %17

23:                                               ; preds = %17
  %24 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %6, i64 0, i32 21
  %25 = bitcast i8** %24 to i32**
  store i32* %18, i32** %25, align 8, !tbaa !16
  call void @__shlim(%struct._IO_FILE* noundef nonnull %6, i64 noundef 0) #7
  %26 = call i64 @__intscan(%struct._IO_FILE* noundef nonnull %6, i32 noundef %2, i32 noundef 1, i64 noundef %3) #7
  %27 = icmp eq i32** %1, null
  br i1 %27, label %40, label %28

28:                                               ; preds = %23
  %29 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %6, i64 0, i32 27
  %30 = load i64, i64* %29, align 8, !tbaa !17
  %31 = load i8*, i8** %13, align 8, !tbaa !11
  %32 = load i8*, i8** %10, align 8, !tbaa !3
  %33 = ptrtoint i8* %31 to i64
  %34 = ptrtoint i8* %32 to i64
  %35 = sub i64 %33, %34
  %36 = add nsw i64 %35, %30
  %37 = icmp eq i64 %36, 0
  %38 = getelementptr inbounds i32, i32* %18, i64 %36
  %39 = select i1 %37, i32* %0, i32* %38
  store i32* %39, i32** %1, align 8, !tbaa !18
  br label %40

40:                                               ; preds = %28, %23
  call void @llvm.lifetime.end.p0i8(i64 232, i8* nonnull %8) #6
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %7) #6
  ret i64 %26
}

; Function Attrs: nounwind optsize strictfp
define i64 @wcstoll(i32* noalias noundef %0, i32** noalias noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = tail call fastcc i64 @wcstox(i32* noundef %0, i32** noundef %1, i32 noundef %2, i64 noundef -9223372036854775808) #5
  ret i64 %4
}

; Function Attrs: nounwind optsize strictfp
define i64 @wcstoul(i32* noalias noundef %0, i32** noalias noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = tail call fastcc i64 @wcstox(i32* noundef %0, i32** noundef %1, i32 noundef %2, i64 noundef -1) #5
  ret i64 %4
}

; Function Attrs: nounwind optsize strictfp
define i64 @wcstol(i32* noalias noundef %0, i32** noalias noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = tail call fastcc i64 @wcstox(i32* noundef %0, i32** noundef %1, i32 noundef %2, i64 noundef -9223372036854775808) #5
  ret i64 %4
}

; Function Attrs: nounwind optsize strictfp
define i64 @wcstoimax(i32* noalias noundef %0, i32** noalias noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = tail call fastcc i64 @wcstox(i32* noundef %0, i32** noundef %1, i32 noundef %2, i64 noundef -9223372036854775808) #7
  ret i64 %4
}

; Function Attrs: nounwind optsize strictfp
define i64 @wcstoumax(i32* noalias noundef %0, i32** noalias noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = tail call fastcc i64 @wcstox(i32* noundef %0, i32** noundef %1, i32 noundef %2, i64 noundef -1) #7
  ret i64 %4
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nofree norecurse nosync nounwind optsize strictfp
define internal i64 @do_read(%struct._IO_FILE* nocapture noundef %0, i8* nocapture noundef writeonly %1, i64 noundef %2) #3 {
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
declare i32 @iswspace(i32 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare hidden void @__shlim(%struct._IO_FILE* noundef, i64 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare hidden i64 @__intscan(%struct._IO_FILE* noundef, i32 noundef, i32 noundef, i64 noundef) local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { nofree norecurse nosync nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nobuiltin optsize strictfp "no-builtins" }
attributes #6 = { nounwind strictfp }
attributes #7 = { nobuiltin nounwind optsize strictfp "no-builtins" }

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
