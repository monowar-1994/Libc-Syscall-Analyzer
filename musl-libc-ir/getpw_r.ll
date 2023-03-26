; ModuleID = 'src/passwd/getpw_r.c'
source_filename = "src/passwd/getpw_r.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.passwd = type { i8*, i8*, i32, i32, i8*, i8*, i8* }

; Function Attrs: nounwind optsize strictfp
define i32 @getpwnam_r(i8* noundef %0, %struct.passwd* noundef %1, i8* noundef %2, i64 noundef %3, %struct.passwd** noundef %4) local_unnamed_addr #0 {
  %6 = tail call fastcc i32 @getpw_r(i8* noundef %0, i32 noundef 0, %struct.passwd* noundef %1, i8* noundef %2, i64 noundef %3, %struct.passwd** noundef %4) #4
  ret i32 %6
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @getpw_r(i8* noundef %0, i32 noundef %1, %struct.passwd* noundef %2, i8* noundef %3, i64 noundef %4, %struct.passwd** noundef %5) unnamed_addr #0 {
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = bitcast i8** %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %10) #5
  store i8* null, i8** %7, align 8, !tbaa !3
  %11 = bitcast i64* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %11) #5
  store i64 0, i64* %8, align 8, !tbaa !7
  %12 = bitcast i32* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %12) #5
  %13 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %9) #6
  %14 = call i32 @__getpw_a(i8* noundef %0, i32 noundef %1, %struct.passwd* noundef %2, i8** noundef nonnull %7, i64* noundef nonnull %8, %struct.passwd** noundef %5) #6
  %15 = load %struct.passwd*, %struct.passwd** %5, align 8, !tbaa !3
  %16 = icmp ne %struct.passwd* %15, null
  %17 = load i64, i64* %8, align 8
  %18 = icmp ugt i64 %17, %4
  %19 = select i1 %16, i1 %18, i1 false
  br i1 %19, label %20, label %21

20:                                               ; preds = %6
  store %struct.passwd* null, %struct.passwd** %5, align 8, !tbaa !3
  br label %53

21:                                               ; preds = %6
  %22 = icmp eq %struct.passwd* %15, null
  br i1 %22, label %53, label %23

23:                                               ; preds = %21
  %24 = load i8*, i8** %7, align 8, !tbaa !3
  %25 = call i8* @memcpy(i8* noundef %3, i8* noundef %24, i64 noundef %17) #6
  %26 = getelementptr inbounds %struct.passwd, %struct.passwd* %2, i64 0, i32 0
  %27 = load i8*, i8** %26, align 8, !tbaa !9
  %28 = load i8*, i8** %7, align 8, !tbaa !3
  %29 = ptrtoint i8* %27 to i64
  %30 = ptrtoint i8* %28 to i64
  %31 = sub i64 %29, %30
  %32 = getelementptr inbounds i8, i8* %3, i64 %31
  store i8* %32, i8** %26, align 8, !tbaa !9
  %33 = getelementptr inbounds %struct.passwd, %struct.passwd* %2, i64 0, i32 1
  %34 = load i8*, i8** %33, align 8, !tbaa !12
  %35 = ptrtoint i8* %34 to i64
  %36 = sub i64 %35, %30
  %37 = getelementptr inbounds i8, i8* %3, i64 %36
  store i8* %37, i8** %33, align 8, !tbaa !12
  %38 = getelementptr inbounds %struct.passwd, %struct.passwd* %2, i64 0, i32 4
  %39 = load i8*, i8** %38, align 8, !tbaa !13
  %40 = ptrtoint i8* %39 to i64
  %41 = sub i64 %40, %30
  %42 = getelementptr inbounds i8, i8* %3, i64 %41
  store i8* %42, i8** %38, align 8, !tbaa !13
  %43 = getelementptr inbounds %struct.passwd, %struct.passwd* %2, i64 0, i32 5
  %44 = load i8*, i8** %43, align 8, !tbaa !14
  %45 = ptrtoint i8* %44 to i64
  %46 = sub i64 %45, %30
  %47 = getelementptr inbounds i8, i8* %3, i64 %46
  store i8* %47, i8** %43, align 8, !tbaa !14
  %48 = getelementptr inbounds %struct.passwd, %struct.passwd* %2, i64 0, i32 6
  %49 = load i8*, i8** %48, align 8, !tbaa !15
  %50 = ptrtoint i8* %49 to i64
  %51 = sub i64 %50, %30
  %52 = getelementptr inbounds i8, i8* %3, i64 %51
  store i8* %52, i8** %48, align 8, !tbaa !15
  br label %53

53:                                               ; preds = %20, %23, %21
  %54 = phi i32 [ 34, %20 ], [ %14, %23 ], [ %14, %21 ]
  %55 = load i8*, i8** %7, align 8, !tbaa !3
  call void @free(i8* noundef %55) #6
  %56 = load i32, i32* %9, align 4, !tbaa !16
  %57 = call i32 @pthread_setcancelstate(i32 noundef %56, i32* noundef null) #6
  %58 = icmp eq i32 %54, 0
  br i1 %58, label %61, label %59

59:                                               ; preds = %53
  %60 = tail call i32* @___errno_location() #7
  store i32 %54, i32* %60, align 4, !tbaa !16
  br label %61

61:                                               ; preds = %59, %53
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %12) #5
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %11) #5
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %10) #5
  ret i32 %54
}

; Function Attrs: nounwind optsize strictfp
define i32 @getpwuid_r(i32 noundef %0, %struct.passwd* noundef %1, i8* noundef %2, i64 noundef %3, %struct.passwd** noundef %4) local_unnamed_addr #0 {
  %6 = tail call fastcc i32 @getpw_r(i8* noundef null, i32 noundef %0, %struct.passwd* noundef %1, i8* noundef %2, i64 noundef %3, %struct.passwd** noundef %4) #4
  ret i32 %6
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__getpw_a(i8* noundef, i32 noundef, %struct.passwd* noundef, i8** noundef, i64* noundef, %struct.passwd** noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nobuiltin optsize strictfp "no-builtins" }
attributes #5 = { nounwind strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #7 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"long", !5, i64 0}
!9 = !{!10, !4, i64 0}
!10 = !{!"passwd", !4, i64 0, !4, i64 8, !11, i64 16, !11, i64 20, !4, i64 24, !4, i64 32, !4, i64 40}
!11 = !{!"int", !5, i64 0}
!12 = !{!10, !4, i64 8}
!13 = !{!10, !4, i64 24}
!14 = !{!10, !4, i64 32}
!15 = !{!10, !4, i64 40}
!16 = !{!11, !11, i64 0}
