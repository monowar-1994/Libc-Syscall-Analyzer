; ModuleID = 'src/network/gethostbyaddr_r.c'
source_filename = "src/network/gethostbyaddr_r.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.hostent = type { i8*, i8**, i32, i32, i8** }
%union.anon = type { %struct.sockaddr_in6 }
%struct.sockaddr_in6 = type { i16, i16, i32, %struct.in6_addr, i32 }
%struct.in6_addr = type { %union.anon.0 }
%union.anon.0 = type { [4 x i32] }
%struct.sockaddr = type { i16, [14 x i8] }

; Function Attrs: nounwind optsize strictfp
define i32 @gethostbyaddr_r(i8* noundef %0, i32 noundef %1, i32 noundef %2, %struct.hostent* noundef %3, i8* noundef %4, i64 noundef %5, %struct.hostent** nocapture noundef writeonly %6, i32* nocapture noundef writeonly %7) local_unnamed_addr #0 {
  %9 = alloca %union.anon, align 4
  %10 = bitcast %union.anon* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %10) #5
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(28) %10, i8 0, i64 28, i1 false) #6
  %11 = getelementptr inbounds %union.anon, %union.anon* %9, i64 0, i32 0, i32 0
  %12 = trunc i32 %2 to i16
  store i16 %12, i16* %11, align 4, !tbaa !3
  %13 = icmp eq i32 %2, 10
  %14 = select i1 %13, i32 28, i32 16
  store %struct.hostent* null, %struct.hostent** %6, align 8, !tbaa !10
  %15 = icmp eq i32 %1, 16
  %16 = and i1 %15, %13
  br i1 %16, label %17, label %21

17:                                               ; preds = %8
  %18 = getelementptr inbounds %union.anon, %union.anon* %9, i64 0, i32 0, i32 3
  %19 = bitcast %struct.in6_addr* %18 to i8*
  %20 = call i8* @memcpy(i8* noundef nonnull %19, i8* noundef %0, i64 noundef 16) #7
  br label %30

21:                                               ; preds = %8
  %22 = icmp eq i32 %2, 2
  %23 = icmp eq i32 %1, 4
  %24 = and i1 %23, %22
  br i1 %24, label %25, label %29

25:                                               ; preds = %21
  %26 = getelementptr inbounds %union.anon, %union.anon* %9, i64 0, i32 0, i32 2
  %27 = bitcast i32* %26 to i8*
  %28 = call i8* @memcpy(i8* noundef nonnull %27, i8* noundef %0, i64 noundef 4) #7
  br label %30

29:                                               ; preds = %21
  store i32 3, i32* %7, align 4, !tbaa !12
  br label %74

30:                                               ; preds = %25, %17
  %31 = ptrtoint i8* %4 to i64
  %32 = trunc i64 %31 to i32
  %33 = and i32 %32, 7
  %34 = icmp eq i32 %33, 0
  %35 = select i1 %34, i32 8, i32 %33
  %36 = zext i32 %35 to i64
  %37 = sub nuw nsw i64 40, %36
  %38 = zext i32 %1 to i64
  %39 = add nuw nsw i64 %37, %38
  %40 = icmp ult i64 %39, %5
  br i1 %40, label %41, label %74

41:                                               ; preds = %30
  %42 = sub nuw nsw i64 8, %36
  %43 = getelementptr inbounds i8, i8* %4, i64 %42
  %44 = sub i64 %5, %39
  %45 = getelementptr inbounds %struct.hostent, %struct.hostent* %3, i64 0, i32 4
  %46 = bitcast i8*** %45 to i8**
  store i8* %43, i8** %46, align 8, !tbaa !13
  %47 = getelementptr inbounds i8, i8* %43, i64 16
  %48 = getelementptr inbounds %struct.hostent, %struct.hostent* %3, i64 0, i32 1
  %49 = bitcast i8*** %48 to i8**
  store i8* %47, i8** %49, align 8, !tbaa !15
  %50 = getelementptr inbounds i8, i8* %47, i64 16
  %51 = bitcast i8* %43 to i8**
  store i8* %50, i8** %51, align 8, !tbaa !10
  %52 = load i8**, i8*** %45, align 8, !tbaa !13
  %53 = load i8*, i8** %52, align 8, !tbaa !10
  %54 = call i8* @memcpy(i8* noundef %53, i8* noundef %0, i64 noundef %38) #7
  %55 = getelementptr inbounds i8, i8* %50, i64 %38
  %56 = load i8**, i8*** %45, align 8, !tbaa !13
  %57 = getelementptr inbounds i8*, i8** %56, i64 1
  store i8* null, i8** %57, align 8, !tbaa !10
  %58 = load i8**, i8*** %48, align 8, !tbaa !15
  store i8* %55, i8** %58, align 8, !tbaa !10
  %59 = load i8**, i8*** %48, align 8, !tbaa !15
  %60 = getelementptr inbounds i8*, i8** %59, i64 1
  store i8* null, i8** %60, align 8, !tbaa !10
  %61 = bitcast %union.anon* %9 to %struct.sockaddr*
  %62 = trunc i64 %44 to i32
  %63 = call i32 @getnameinfo(%struct.sockaddr* noundef nonnull %61, i32 noundef %14, i8* noundef nonnull %55, i32 noundef %62, i8* noundef null, i32 noundef 0, i32 noundef 0) #7
  switch i32 %63, label %65 [
    i32 -3, label %64
    i32 -12, label %74
    i32 0, label %68
  ]

64:                                               ; preds = %41
  store i32 2, i32* %7, align 4, !tbaa !12
  br label %74

65:                                               ; preds = %41
  store i32 3, i32* %7, align 4, !tbaa !12
  %66 = tail call i32* @___errno_location() #8
  %67 = load i32, i32* %66, align 4, !tbaa !12
  br label %74

68:                                               ; preds = %41
  %69 = getelementptr inbounds %struct.hostent, %struct.hostent* %3, i64 0, i32 2
  store i32 %2, i32* %69, align 8, !tbaa !16
  %70 = getelementptr inbounds %struct.hostent, %struct.hostent* %3, i64 0, i32 3
  store i32 %1, i32* %70, align 4, !tbaa !17
  %71 = load i8**, i8*** %48, align 8, !tbaa !15
  %72 = load i8*, i8** %71, align 8, !tbaa !10
  %73 = getelementptr inbounds %struct.hostent, %struct.hostent* %3, i64 0, i32 0
  store i8* %72, i8** %73, align 8, !tbaa !18
  store %struct.hostent* %3, %struct.hostent** %6, align 8, !tbaa !10
  br label %74

74:                                               ; preds = %41, %30, %68, %65, %64, %29
  %75 = phi i32 [ %67, %65 ], [ 0, %68 ], [ 11, %64 ], [ 22, %29 ], [ 34, %30 ], [ 34, %41 ]
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %10) #5
  ret i32 %75
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @getnameinfo(%struct.sockaddr* noundef, i32 noundef, i8* noundef, i32 noundef, i8* noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind strictfp }
attributes #6 = { strictfp }
attributes #7 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #8 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"sockaddr_in", !5, i64 0, !5, i64 2, !8, i64 4, !6, i64 8}
!5 = !{!"short", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"in_addr", !9, i64 0}
!9 = !{!"int", !6, i64 0}
!10 = !{!11, !11, i64 0}
!11 = !{!"any pointer", !6, i64 0}
!12 = !{!9, !9, i64 0}
!13 = !{!14, !11, i64 24}
!14 = !{!"hostent", !11, i64 0, !11, i64 8, !9, i64 16, !9, i64 20, !11, i64 24}
!15 = !{!14, !11, i64 8}
!16 = !{!14, !9, i64 16}
!17 = !{!14, !9, i64 20}
!18 = !{!14, !11, i64 0}
