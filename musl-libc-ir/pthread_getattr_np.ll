; ModuleID = 'src/thread/pthread_getattr_np.c'
source_filename = "src/thread/pthread_getattr_np.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.pthread_attr_t = type { %union.anon }
%union.anon = type { [7 x i64] }

@__libc = external hidden local_unnamed_addr global %struct.__libc, align 8

; Function Attrs: nounwind optsize strictfp
define i32 @pthread_getattr_np(%struct.__pthread* noundef %0, %struct.pthread_attr_t* noundef writeonly %1) local_unnamed_addr #0 {
  %3 = alloca [7 x i64], align 8
  %4 = bitcast [7 x i64]* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(56) %4, i8 0, i64 56, i1 false)
  %5 = bitcast %struct.pthread_attr_t* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %5, i8* nonnull align 8 %4, i64 56, i1 true), !tbaa.struct !3
  %6 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %0, i64 0, i32 8
  %7 = load volatile i32, i32* %6, align 8, !tbaa !7
  %8 = icmp sgt i32 %7, 2
  %9 = zext i1 %8 to i32
  %10 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %1, i64 0, i32 0, i32 0, i64 3
  %11 = bitcast i64* %10 to i32*
  store i32 %9, i32* %11, align 8, !tbaa !4
  %12 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %0, i64 0, i32 17
  %13 = load i64, i64* %12, align 8, !tbaa !13
  %14 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %1, i64 0, i32 0, i32 0, i64 1
  store i64 %13, i64* %14, align 8, !tbaa !4
  %15 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %0, i64 0, i32 15
  %16 = load i8*, i8** %15, align 8, !tbaa !14
  %17 = icmp eq i8* %16, null
  br i1 %17, label %23, label %18

18:                                               ; preds = %2
  %19 = ptrtoint i8* %16 to i64
  %20 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %1, i64 0, i32 0, i32 0, i64 2
  store i64 %19, i64* %20, align 8, !tbaa !4
  %21 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %0, i64 0, i32 16
  %22 = load i64, i64* %21, align 8, !tbaa !15
  br label %48

23:                                               ; preds = %2
  %24 = load i8*, i8** bitcast (i64** getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 5) to i8**), align 8, !tbaa !16
  %25 = ptrtoint i8* %24 to i64
  %26 = sub i64 0, %25
  %27 = and i64 %26, 4095
  %28 = getelementptr inbounds i8, i8* %24, i64 %27
  %29 = ptrtoint i8* %28 to i64
  %30 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %1, i64 0, i32 0, i32 0, i64 2
  store i64 %29, i64* %30, align 8, !tbaa !4
  %31 = getelementptr inbounds i8, i8* %28, i64 -4096
  %32 = getelementptr inbounds i8, i8* %31, i64 -4096
  %33 = tail call i8* (i8*, i64, i64, i32, ...) @mremap(i8* noundef nonnull %32, i64 noundef 4096, i64 noundef 8192, i32 noundef 0) #5
  %34 = icmp eq i8* %33, inttoptr (i64 -1 to i8*)
  br i1 %34, label %35, label %48

35:                                               ; preds = %23
  %36 = tail call i32* @___errno_location() #6
  %37 = getelementptr inbounds i8, i8* %28, i64 -4096
  br label %38

38:                                               ; preds = %35, %42
  %39 = phi i64 [ 4096, %35 ], [ %43, %42 ]
  %40 = load i32, i32* %36, align 4, !tbaa !19
  %41 = icmp eq i32 %40, 12
  br i1 %41, label %42, label %48

42:                                               ; preds = %38
  %43 = add i64 %39, 4096
  %44 = sub nuw nsw i64 -4096, %39
  %45 = getelementptr inbounds i8, i8* %37, i64 %44
  %46 = tail call i8* (i8*, i64, i64, i32, ...) @mremap(i8* noundef nonnull %45, i64 noundef 4096, i64 noundef 8192, i32 noundef 0) #5
  %47 = icmp eq i8* %46, inttoptr (i64 -1 to i8*)
  br i1 %47, label %38, label %48

48:                                               ; preds = %42, %38, %23, %18
  %49 = phi i64 [ %22, %18 ], [ 4096, %23 ], [ %43, %42 ], [ %39, %38 ]
  %50 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %1, i64 0, i32 0, i32 0, i64 0
  store i64 %49, i64* %50, align 8, !tbaa !4
  ret i32 0
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: optsize
declare i8* @mremap(i8* noundef, i64 noundef, i64 noundef, i32 noundef, ...) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #4

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 0, i64 56, !4, i64 0, i64 56, !4, i64 0, i64 56, !4}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !11, i64 56}
!8 = !{!"__pthread", !9, i64 0, !9, i64 8, !9, i64 16, !9, i64 24, !10, i64 32, !10, i64 40, !11, i64 48, !11, i64 52, !11, i64 56, !11, i64 60, !5, i64 64, !5, i64 65, !5, i64 66, !5, i64 66, !9, i64 72, !10, i64 80, !9, i64 88, !10, i64 96, !10, i64 104, !9, i64 112, !9, i64 120, !9, i64 128, !12, i64 136, !11, i64 160, !11, i64 164, !9, i64 168, !5, i64 176, !9, i64 184, !9, i64 192}
!9 = !{!"any pointer", !5, i64 0}
!10 = !{!"long", !5, i64 0}
!11 = !{!"int", !5, i64 0}
!12 = !{!"", !9, i64 0, !10, i64 8, !9, i64 16}
!13 = !{!8, !10, i64 104}
!14 = !{!8, !9, i64 88}
!15 = !{!8, !10, i64 96}
!16 = !{!17, !9, i64 8}
!17 = !{!"__libc", !5, i64 0, !5, i64 1, !5, i64 2, !5, i64 3, !11, i64 4, !9, i64 8, !9, i64 16, !10, i64 24, !10, i64 32, !10, i64 40, !10, i64 48, !18, i64 56}
!18 = !{!"__locale_struct", !5, i64 0}
!19 = !{!11, !11, i64 0}
