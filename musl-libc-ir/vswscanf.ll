; ModuleID = 'src/stdio/vswscanf.c'
source_filename = "src/stdio/vswscanf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque
%struct.__mbstate_t = type { i32, i32 }

@__isoc99_vswscanf = weak alias i32 (i32*, i32*, %struct.__va_list_tag*), i32 (i32*, i32*, %struct.__va_list_tag*)* @vswscanf

; Function Attrs: nounwind optsize strictfp
define i32 @vswscanf(i32* noalias noundef %0, i32* noalias noundef %1, %struct.__va_list_tag* noundef %2) #0 {
  %4 = alloca [256 x i8], align 16
  %5 = alloca %struct._IO_FILE, align 8
  %6 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %6) #4
  %7 = bitcast %struct._IO_FILE* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 232, i8* nonnull %7) #4
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(232) %7, i8 0, i64 232, i1 false) #5
  %8 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %5, i64 0, i32 8
  store i64 (%struct._IO_FILE*, i8*, i64)* @wstring_read, i64 (%struct._IO_FILE*, i8*, i64)** %8, align 8, !tbaa !3
  %9 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %5, i64 0, i32 11
  store i8* %6, i8** %9, align 8, !tbaa !10
  %10 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %5, i64 0, i32 12
  store i64 256, i64* %10, align 8, !tbaa !11
  %11 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %5, i64 0, i32 19
  store volatile i32 -1, i32* %11, align 4, !tbaa !12
  %12 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %5, i64 0, i32 21
  %13 = bitcast i8** %12 to i32**
  store i32* %0, i32** %13, align 8, !tbaa !13
  %14 = call i32 @vfwscanf(%struct._IO_FILE* noundef nonnull %5, i32* noundef %1, %struct.__va_list_tag* noundef %2) #6
  call void @llvm.lifetime.end.p0i8(i64 232, i8* nonnull %7) #4
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %6) #4
  ret i32 %14
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind optsize strictfp
define internal i64 @wstring_read(%struct._IO_FILE* nocapture noundef %0, i8* nocapture noundef writeonly %1, i64 noundef %2) #0 {
  %4 = alloca i32*, align 8
  %5 = bitcast i32** %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %5) #4
  %6 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 21
  %7 = bitcast i8** %6 to i32**
  %8 = load i32*, i32** %7, align 8, !tbaa !13
  store i32* %8, i32** %4, align 8, !tbaa !14
  %9 = icmp eq i32* %8, null
  br i1 %9, label %33, label %10

10:                                               ; preds = %3
  %11 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 11
  %12 = load i8*, i8** %11, align 8, !tbaa !10
  %13 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 12
  %14 = load i64, i64* %13, align 8, !tbaa !11
  %15 = call i64 @wcsrtombs(i8* noundef %12, i32** noundef nonnull %4, i64 noundef %14, %struct.__mbstate_t* noundef null) #6
  %16 = icmp eq i64 %15, -1
  br i1 %16, label %17, label %20

17:                                               ; preds = %10
  %18 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  %19 = bitcast i8** %18 to <2 x i8*>*
  store <2 x i8*> zeroinitializer, <2 x i8*>* %19, align 8, !tbaa !14
  br label %33

20:                                               ; preds = %10
  %21 = load i8*, i8** %11, align 8, !tbaa !10
  %22 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  store i8* %21, i8** %22, align 8, !tbaa !15
  %23 = getelementptr inbounds i8, i8* %21, i64 %15
  %24 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 2
  store i8* %23, i8** %24, align 8, !tbaa !16
  %25 = bitcast i32** %4 to i8**
  %26 = load i8*, i8** %25, align 8, !tbaa !14
  store i8* %26, i8** %6, align 8, !tbaa !13
  %27 = icmp ne i64 %2, 0
  %28 = icmp ne i64 %15, 0
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %33

30:                                               ; preds = %20
  %31 = getelementptr inbounds i8, i8* %21, i64 1
  store i8* %31, i8** %22, align 8, !tbaa !15
  %32 = load i8, i8* %21, align 1, !tbaa !17
  store i8 %32, i8* %1, align 1, !tbaa !17
  br label %33

33:                                               ; preds = %20, %3, %30, %17
  %34 = phi i64 [ 0, %17 ], [ 1, %30 ], [ 0, %3 ], [ 0, %20 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %5) #4
  ret i64 %34
}

; Function Attrs: optsize
declare i32 @vfwscanf(%struct._IO_FILE* noundef, i32* noundef, %struct.__va_list_tag* noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i64 @wcsrtombs(i8* noundef, i32** noundef, i64 noundef, %struct.__mbstate_t* noundef) local_unnamed_addr #3

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !8, i64 64}
!4 = !{!"_IO_FILE", !5, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !9, i64 96, !8, i64 104, !8, i64 112, !5, i64 120, !5, i64 124, !9, i64 128, !5, i64 136, !5, i64 140, !5, i64 144, !8, i64 152, !9, i64 160, !8, i64 168, !8, i64 176, !8, i64 184, !9, i64 192, !9, i64 200, !8, i64 208, !8, i64 216, !8, i64 224}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{!4, !8, i64 88}
!11 = !{!4, !9, i64 96}
!12 = !{!4, !5, i64 140}
!13 = !{!4, !8, i64 152}
!14 = !{!8, !8, i64 0}
!15 = !{!4, !8, i64 8}
!16 = !{!4, !8, i64 16}
!17 = !{!6, !6, i64 0}
