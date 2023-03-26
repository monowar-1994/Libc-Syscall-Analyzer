; ModuleID = 'src/stdio/vsnprintf.c'
source_filename = "src/stdio/vsnprintf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.cookie = type { i8*, i64 }
%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

; Function Attrs: nounwind optsize strictfp
define i32 @vsnprintf(i8* noalias noundef %0, i64 noundef %1, i8* noalias noundef %2, %struct.__va_list_tag* noundef %3) local_unnamed_addr #0 {
  %5 = alloca [1 x i8], align 1
  %6 = alloca [1 x i8], align 1
  %7 = alloca %struct.cookie, align 8
  %8 = alloca %struct._IO_FILE, align 8
  %9 = getelementptr inbounds [1 x i8], [1 x i8]* %5, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %9) #5
  %10 = getelementptr inbounds [1 x i8], [1 x i8]* %6, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %10) #5
  %11 = bitcast %struct.cookie* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %11) #5
  %12 = getelementptr inbounds %struct.cookie, %struct.cookie* %7, i64 0, i32 0
  %13 = icmp eq i64 %1, 0
  %14 = select i1 %13, i8* %10, i8* %0
  store i8* %14, i8** %12, align 8, !tbaa !3
  %15 = getelementptr inbounds %struct.cookie, %struct.cookie* %7, i64 0, i32 1
  %16 = add i64 %1, -1
  %17 = select i1 %13, i64 0, i64 %16
  store i64 %17, i64* %15, align 8, !tbaa !9
  %18 = bitcast %struct._IO_FILE* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 232, i8* nonnull %18) #5
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(232) %18, i8 0, i64 232, i1 false) #6
  %19 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %8, i64 0, i32 9
  store i64 (%struct._IO_FILE*, i8*, i64)* @sn_write, i64 (%struct._IO_FILE*, i8*, i64)** %19, align 8, !tbaa !10
  %20 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %8, i64 0, i32 11
  store i8* %9, i8** %20, align 8, !tbaa !13
  %21 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %8, i64 0, i32 19
  store volatile i32 -1, i32* %21, align 4, !tbaa !14
  %22 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %8, i64 0, i32 20
  store i32 -1, i32* %22, align 8, !tbaa !15
  %23 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %8, i64 0, i32 21
  %24 = bitcast i8** %23 to %struct.cookie**
  store %struct.cookie* %7, %struct.cookie** %24, align 8, !tbaa !16
  %25 = icmp ugt i64 %1, 2147483647
  br i1 %25, label %26, label %28

26:                                               ; preds = %4
  %27 = tail call i32* @___errno_location() #7
  store i32 75, i32* %27, align 4, !tbaa !17
  br label %30

28:                                               ; preds = %4
  store i8 0, i8* %14, align 1, !tbaa !18
  %29 = call i32 @vfprintf(%struct._IO_FILE* noundef nonnull %8, i8* noundef %2, %struct.__va_list_tag* noundef %3) #8
  br label %30

30:                                               ; preds = %28, %26
  %31 = phi i32 [ -1, %26 ], [ %29, %28 ]
  call void @llvm.lifetime.end.p0i8(i64 232, i8* nonnull %18) #5
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %11) #5
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %10) #5
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %9) #5
  ret i32 %31
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind optsize strictfp
define internal i64 @sn_write(%struct._IO_FILE* nocapture noundef %0, i8* noundef %1, i64 noundef returned %2) #0 {
  %4 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 21
  %5 = bitcast i8** %4 to %struct.cookie**
  %6 = load %struct.cookie*, %struct.cookie** %5, align 8, !tbaa !16
  %7 = getelementptr inbounds %struct.cookie, %struct.cookie* %6, i64 0, i32 1
  %8 = load i64, i64* %7, align 8, !tbaa !9
  %9 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 5
  %10 = load i8*, i8** %9, align 8, !tbaa !19
  %11 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 7
  %12 = load i8*, i8** %11, align 8, !tbaa !20
  %13 = ptrtoint i8* %10 to i64
  %14 = ptrtoint i8* %12 to i64
  %15 = sub i64 %13, %14
  %16 = icmp ult i64 %8, %15
  %17 = select i1 %16, i64 %8, i64 %15
  %18 = icmp eq i64 %17, 0
  br i1 %18, label %27, label %19

19:                                               ; preds = %3
  %20 = getelementptr inbounds %struct.cookie, %struct.cookie* %6, i64 0, i32 0
  %21 = load i8*, i8** %20, align 8, !tbaa !3
  %22 = tail call i8* @memcpy(i8* noundef %21, i8* noundef %12, i64 noundef %17) #8
  %23 = load i8*, i8** %20, align 8, !tbaa !3
  %24 = getelementptr inbounds i8, i8* %23, i64 %17
  store i8* %24, i8** %20, align 8, !tbaa !3
  %25 = load i64, i64* %7, align 8, !tbaa !9
  %26 = sub i64 %25, %17
  store i64 %26, i64* %7, align 8, !tbaa !9
  br label %27

27:                                               ; preds = %19, %3
  %28 = phi i64 [ %26, %19 ], [ %8, %3 ]
  %29 = icmp ult i64 %28, %2
  %30 = select i1 %29, i64 %28, i64 %2
  %31 = icmp eq i64 %30, 0
  %32 = getelementptr inbounds %struct.cookie, %struct.cookie* %6, i64 0, i32 0
  %33 = load i8*, i8** %32, align 8, !tbaa !3
  br i1 %31, label %40, label %34

34:                                               ; preds = %27
  %35 = tail call i8* @memcpy(i8* noundef %33, i8* noundef %1, i64 noundef %30) #8
  %36 = load i8*, i8** %32, align 8, !tbaa !3
  %37 = getelementptr inbounds i8, i8* %36, i64 %30
  store i8* %37, i8** %32, align 8, !tbaa !3
  %38 = load i64, i64* %7, align 8, !tbaa !9
  %39 = sub i64 %38, %30
  store i64 %39, i64* %7, align 8, !tbaa !9
  br label %40

40:                                               ; preds = %27, %34
  %41 = phi i8* [ %37, %34 ], [ %33, %27 ]
  store i8 0, i8* %41, align 1, !tbaa !18
  %42 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 11
  %43 = load i8*, i8** %42, align 8, !tbaa !13
  store i8* %43, i8** %11, align 8, !tbaa !20
  store i8* %43, i8** %9, align 8, !tbaa !19
  ret i64 %2
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @vfprintf(%struct._IO_FILE* noundef, i8* noundef, %struct.__va_list_tag* noundef) local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #4

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind strictfp }
attributes #6 = { strictfp }
attributes #7 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #8 = { nobuiltin nounwind optsize strictfp "no-builtins" }

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
!14 = !{!11, !12, i64 140}
!15 = !{!11, !12, i64 144}
!16 = !{!11, !5, i64 152}
!17 = !{!12, !12, i64 0}
!18 = !{!6, !6, i64 0}
!19 = !{!11, !5, i64 40}
!20 = !{!11, !5, i64 56}
