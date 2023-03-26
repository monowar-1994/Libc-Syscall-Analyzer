; ModuleID = 'src/stdio/vswprintf.c'
source_filename = "src/stdio/vswprintf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.cookie = type { i32*, i64 }
%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

; Function Attrs: nounwind optsize strictfp
define i32 @vswprintf(i32* noalias noundef %0, i64 noundef %1, i32* noalias noundef %2, %struct.__va_list_tag* noundef %3) local_unnamed_addr #0 {
  %5 = alloca [256 x i8], align 16
  %6 = alloca %struct.cookie, align 8
  %7 = alloca %struct._IO_FILE, align 8
  %8 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %8) #5
  %9 = bitcast %struct.cookie* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %9) #5
  %10 = getelementptr inbounds %struct.cookie, %struct.cookie* %6, i64 0, i32 0
  store i32* %0, i32** %10, align 8, !tbaa !3
  %11 = getelementptr inbounds %struct.cookie, %struct.cookie* %6, i64 0, i32 1
  %12 = add i64 %1, -1
  store i64 %12, i64* %11, align 8, !tbaa !9
  %13 = bitcast %struct._IO_FILE* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 232, i8* nonnull %13) #5
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(232) %13, i8 0, i64 232, i1 false) #6
  %14 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %7, i64 0, i32 9
  store i64 (%struct._IO_FILE*, i8*, i64)* @sw_write, i64 (%struct._IO_FILE*, i8*, i64)** %14, align 8, !tbaa !10
  %15 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %7, i64 0, i32 11
  store i8* %8, i8** %15, align 8, !tbaa !13
  %16 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %7, i64 0, i32 12
  store i64 256, i64* %16, align 8, !tbaa !14
  %17 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %7, i64 0, i32 19
  store volatile i32 -1, i32* %17, align 4, !tbaa !15
  %18 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %7, i64 0, i32 20
  store i32 -1, i32* %18, align 8, !tbaa !16
  %19 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %7, i64 0, i32 21
  %20 = bitcast i8** %19 to %struct.cookie**
  store %struct.cookie* %6, %struct.cookie** %20, align 8, !tbaa !17
  %21 = icmp eq i64 %1, 0
  br i1 %21, label %32, label %22

22:                                               ; preds = %4
  %23 = icmp ugt i64 %1, 2147483647
  br i1 %23, label %24, label %26

24:                                               ; preds = %22
  %25 = tail call i32* @___errno_location() #7
  store i32 75, i32* %25, align 4, !tbaa !18
  br label %32

26:                                               ; preds = %22
  %27 = call i32 @vfwprintf(%struct._IO_FILE* noundef nonnull %7, i32* noundef %2, %struct.__va_list_tag* noundef %3) #8
  %28 = call i64 @sw_write(%struct._IO_FILE* noundef nonnull %7, i8* noundef null, i64 noundef 0) #9
  %29 = sext i32 %27 to i64
  %30 = icmp ult i64 %29, %1
  %31 = select i1 %30, i32 %27, i32 -1
  br label %32

32:                                               ; preds = %4, %26, %24
  %33 = phi i32 [ -1, %24 ], [ %31, %26 ], [ -1, %4 ]
  call void @llvm.lifetime.end.p0i8(i64 232, i8* nonnull %13) #5
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %9) #5
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %8) #5
  ret i32 %33
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind optsize strictfp
define internal i64 @sw_write(%struct._IO_FILE* nocapture noundef %0, i8* noundef %1, i64 noundef %2) #0 {
  %4 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 21
  %5 = bitcast i8** %4 to %struct.cookie**
  %6 = load %struct.cookie*, %struct.cookie** %5, align 8, !tbaa !17
  %7 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 7
  %8 = load i8*, i8** %7, align 8, !tbaa !19
  %9 = icmp eq i8* %8, %1
  br i1 %9, label %18, label %10

10:                                               ; preds = %3
  %11 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 5
  %12 = load i8*, i8** %11, align 8, !tbaa !20
  %13 = ptrtoint i8* %12 to i64
  %14 = ptrtoint i8* %8 to i64
  %15 = sub i64 %13, %14
  %16 = tail call i64 @sw_write(%struct._IO_FILE* noundef nonnull %0, i8* noundef %8, i64 noundef %15) #9
  %17 = icmp eq i64 %16, -1
  br i1 %17, label %60, label %18

18:                                               ; preds = %10, %3
  %19 = getelementptr inbounds %struct.cookie, %struct.cookie* %6, i64 0, i32 1
  %20 = load i64, i64* %19, align 8, !tbaa !9
  %21 = icmp ne i64 %20, 0
  %22 = icmp ne i64 %2, 0
  %23 = and i1 %21, %22
  %24 = getelementptr inbounds %struct.cookie, %struct.cookie* %6, i64 0, i32 0
  %25 = load i32*, i32** %24, align 8, !tbaa !3
  br i1 %23, label %26, label %51

26:                                               ; preds = %18, %32
  %27 = phi i32* [ %39, %32 ], [ %25, %18 ]
  %28 = phi i8* [ %34, %32 ], [ %1, %18 ]
  %29 = phi i64 [ %35, %32 ], [ %2, %18 ]
  %30 = tail call i32 @mbtowc(i32* noundef %27, i8* noundef %28, i64 noundef %29) #8
  %31 = icmp sgt i32 %30, -1
  br i1 %31, label %32, label %43

32:                                               ; preds = %26
  %33 = zext i32 %30 to i64
  %34 = getelementptr inbounds i8, i8* %28, i64 %33
  %35 = sub i64 %29, %33
  %36 = load i64, i64* %19, align 8, !tbaa !9
  %37 = add i64 %36, -1
  store i64 %37, i64* %19, align 8, !tbaa !9
  %38 = load i32*, i32** %24, align 8, !tbaa !3
  %39 = getelementptr inbounds i32, i32* %38, i64 1
  store i32* %39, i32** %24, align 8, !tbaa !3
  %40 = icmp ne i64 %37, 0
  %41 = icmp ne i64 %35, 0
  %42 = select i1 %40, i1 %41, i1 false
  br i1 %42, label %26, label %51

43:                                               ; preds = %26
  %44 = load i32*, i32** %24, align 8, !tbaa !3
  store i32 0, i32* %44, align 4, !tbaa !18
  %45 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 4
  store i8* null, i8** %7, align 8, !tbaa !19
  %46 = bitcast i8** %45 to <2 x i8*>*
  store <2 x i8*> zeroinitializer, <2 x i8*>* %46, align 8, !tbaa !21
  %47 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  %48 = load i32, i32* %47, align 8, !tbaa !22
  %49 = or i32 %48, 32
  store i32 %49, i32* %47, align 8, !tbaa !22
  %50 = sext i32 %30 to i64
  br label %60

51:                                               ; preds = %32, %18
  %52 = phi i32* [ %25, %18 ], [ %39, %32 ]
  store i32 0, i32* %52, align 4, !tbaa !18
  %53 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 11
  %54 = load i8*, i8** %53, align 8, !tbaa !13
  %55 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 12
  %56 = load i64, i64* %55, align 8, !tbaa !14
  %57 = getelementptr inbounds i8, i8* %54, i64 %56
  %58 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 4
  store i8* %57, i8** %58, align 8, !tbaa !23
  store i8* %54, i8** %7, align 8, !tbaa !19
  %59 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 5
  store i8* %54, i8** %59, align 8, !tbaa !20
  br label %60

60:                                               ; preds = %10, %51, %43
  %61 = phi i64 [ %50, %43 ], [ %2, %51 ], [ -1, %10 ]
  ret i64 %61
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @vfwprintf(%struct._IO_FILE* noundef, i32* noundef, %struct.__va_list_tag* noundef) local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @mbtowc(i32* noundef, i8* noundef, i64 noundef) local_unnamed_addr #4

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind strictfp }
attributes #6 = { strictfp }
attributes #7 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #8 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #9 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"cookie", !5, i64 0, !8, i64 8}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"long", !6, i64 0}
!9 = !{!4, !8, i64 8}
!10 = !{!11, !5, i64 72}
!11 = !{!"_IO_FILE", !12, i64 0, !5, i64 8, !5, i64 16, !5, i64 24, !5, i64 32, !5, i64 40, !5, i64 48, !5, i64 56, !5, i64 64, !5, i64 72, !5, i64 80, !5, i64 88, !8, i64 96, !5, i64 104, !5, i64 112, !12, i64 120, !12, i64 124, !8, i64 128, !12, i64 136, !12, i64 140, !12, i64 144, !5, i64 152, !8, i64 160, !5, i64 168, !5, i64 176, !5, i64 184, !8, i64 192, !8, i64 200, !5, i64 208, !5, i64 216, !5, i64 224}
!12 = !{!"int", !6, i64 0}
!13 = !{!11, !5, i64 88}
!14 = !{!11, !8, i64 96}
!15 = !{!11, !12, i64 140}
!16 = !{!11, !12, i64 144}
!17 = !{!11, !5, i64 152}
!18 = !{!12, !12, i64 0}
!19 = !{!11, !5, i64 56}
!20 = !{!11, !5, i64 40}
!21 = !{!5, !5, i64 0}
!22 = !{!11, !12, i64 0}
!23 = !{!11, !5, i64 32}
