; ModuleID = 'src/network/sendmsg.c'
source_filename = "src/network/sendmsg.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.msghdr = type { i8*, i32, %struct.iovec*, i32, i32, i8*, i32, i32, i32 }
%struct.iovec = type { i8*, i64 }
%struct.cmsghdr = type { i32, i32, i32, i32 }

; Function Attrs: nounwind optsize strictfp
define i64 @sendmsg(i32 noundef %0, %struct.msghdr* noundef readonly %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = alloca %struct.msghdr, align 8
  %5 = alloca [65 x %struct.cmsghdr], align 16
  %6 = bitcast %struct.msghdr* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %6) #5
  %7 = bitcast [65 x %struct.cmsghdr]* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 1040, i8* nonnull %7) #5
  %8 = icmp eq %struct.msghdr* %1, null
  br i1 %8, label %50, label %9

9:                                                ; preds = %3
  %10 = bitcast %struct.msghdr* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(56) %6, i8* noundef nonnull align 8 dereferenceable(56) %10, i64 56, i1 false) #6, !tbaa.struct !3
  %11 = getelementptr inbounds %struct.msghdr, %struct.msghdr* %4, i64 0, i32 7
  store i32 0, i32* %11, align 4, !tbaa !10
  %12 = getelementptr inbounds %struct.msghdr, %struct.msghdr* %4, i64 0, i32 4
  store i32 0, i32* %12, align 4, !tbaa !12
  %13 = getelementptr inbounds %struct.msghdr, %struct.msghdr* %4, i64 0, i32 6
  %14 = load i32, i32* %13, align 8, !tbaa !13
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %50, label %16

16:                                               ; preds = %9
  %17 = icmp ugt i32 %14, 1024
  br i1 %17, label %18, label %20

18:                                               ; preds = %16
  %19 = tail call i32* @___errno_location() #7
  store i32 12, i32* %19, align 4, !tbaa !8
  br label %57

20:                                               ; preds = %16
  %21 = getelementptr inbounds %struct.msghdr, %struct.msghdr* %4, i64 0, i32 5
  %22 = load i8*, i8** %21, align 8, !tbaa !14
  %23 = zext i32 %14 to i64
  %24 = call i8* @memcpy(i8* noundef nonnull %7, i8* noundef %22, i64 noundef %23) #8
  %25 = bitcast i8** %21 to [65 x %struct.cmsghdr]**
  store [65 x %struct.cmsghdr]* %5, [65 x %struct.cmsghdr]** %25, align 8, !tbaa !14
  %26 = icmp ugt i32 %14, 15
  br i1 %26, label %27, label %50

27:                                               ; preds = %20
  %28 = getelementptr inbounds [65 x %struct.cmsghdr], [65 x %struct.cmsghdr]* %5, i64 0, i64 0
  %29 = getelementptr inbounds i8, i8* %7, i64 %23
  %30 = ptrtoint i8* %29 to i64
  br label %31

31:                                               ; preds = %37, %27
  %32 = phi %struct.cmsghdr* [ %28, %27 ], [ %47, %37 ]
  %33 = getelementptr inbounds %struct.cmsghdr, %struct.cmsghdr* %32, i64 0, i32 1
  store i32 0, i32* %33, align 4, !tbaa !15
  %34 = getelementptr inbounds %struct.cmsghdr, %struct.cmsghdr* %32, i64 0, i32 0
  %35 = load i32, i32* %34, align 4, !tbaa !17
  %36 = icmp ult i32 %35, 16
  br i1 %36, label %50, label %37

37:                                               ; preds = %31
  %38 = zext i32 %35 to i64
  %39 = add nuw nsw i64 %38, 7
  %40 = and i64 %39, 8589934584
  %41 = add nuw nsw i64 %40, 16
  %42 = ptrtoint %struct.cmsghdr* %32 to i64
  %43 = sub i64 %30, %42
  %44 = icmp uge i64 %41, %43
  %45 = bitcast %struct.cmsghdr* %32 to i8*
  %46 = getelementptr inbounds i8, i8* %45, i64 %40
  %47 = bitcast i8* %46 to %struct.cmsghdr*
  %48 = icmp eq %struct.cmsghdr* %32, null
  %49 = select i1 %44, i1 true, i1 %48
  br i1 %49, label %50, label %31

50:                                               ; preds = %31, %37, %20, %9, %3
  %51 = phi %struct.msghdr* [ %4, %9 ], [ null, %3 ], [ %4, %20 ], [ %4, %37 ], [ %4, %31 ]
  %52 = sext i32 %0 to i64
  %53 = ptrtoint %struct.msghdr* %51 to i64
  %54 = sext i32 %2 to i64
  %55 = call i64 @__syscall_cp(i64 noundef 46, i64 noundef %52, i64 noundef %53, i64 noundef %54, i64 noundef 0, i64 noundef 0, i64 noundef 0) #8
  %56 = call i64 @__syscall_ret(i64 noundef %55) #8
  br label %57

57:                                               ; preds = %50, %18
  %58 = phi i64 [ -1, %18 ], [ %56, %50 ]
  call void @llvm.lifetime.end.p0i8(i64 1040, i8* nonnull %7) #5
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %6) #5
  ret i64 %58
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i64 @__syscall_cp(i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef) local_unnamed_addr #4

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn }
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
!3 = !{i64 0, i64 8, !4, i64 8, i64 4, !8, i64 16, i64 8, !4, i64 24, i64 4, !8, i64 28, i64 4, !8, i64 32, i64 8, !4, i64 40, i64 4, !8, i64 44, i64 4, !8, i64 48, i64 4, !8}
!4 = !{!5, !5, i64 0}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !6, i64 0}
!10 = !{!11, !9, i64 44}
!11 = !{!"msghdr", !5, i64 0, !9, i64 8, !5, i64 16, !9, i64 24, !9, i64 28, !5, i64 32, !9, i64 40, !9, i64 44, !9, i64 48}
!12 = !{!11, !9, i64 28}
!13 = !{!11, !9, i64 40}
!14 = !{!11, !5, i64 32}
!15 = !{!16, !9, i64 4}
!16 = !{!"cmsghdr", !9, i64 0, !9, i64 4, !9, i64 8, !9, i64 12}
!17 = !{!16, !9, i64 0}
