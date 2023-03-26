; ModuleID = 'src/network/recvmsg.c'
source_filename = "src/network/recvmsg.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.msghdr = type { i8*, i32, %struct.iovec*, i32, i32, i8*, i32, i32, i32 }
%struct.iovec = type { i8*, i64 }

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define hidden void @__convert_scm_timestamps(%struct.msghdr* nocapture %0, i32 %1) local_unnamed_addr #0 {
  ret void
}

; Function Attrs: nounwind optsize strictfp
define i64 @recvmsg(i32 noundef %0, %struct.msghdr* noundef %1, i32 noundef %2) local_unnamed_addr #1 {
  %4 = alloca %struct.msghdr, align 8
  %5 = bitcast %struct.msghdr* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %5) #5
  %6 = icmp eq %struct.msghdr* %1, null
  br i1 %6, label %12, label %7

7:                                                ; preds = %3
  %8 = bitcast %struct.msghdr* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(56) %5, i8* noundef nonnull align 8 dereferenceable(56) %8, i64 56, i1 false) #6, !tbaa.struct !3
  %9 = getelementptr inbounds %struct.msghdr, %struct.msghdr* %4, i64 0, i32 7
  store i32 0, i32* %9, align 4, !tbaa !10
  %10 = getelementptr inbounds %struct.msghdr, %struct.msghdr* %4, i64 0, i32 4
  store i32 0, i32* %10, align 4, !tbaa !12
  %11 = ptrtoint %struct.msghdr* %4 to i64
  br label %12

12:                                               ; preds = %7, %3
  %13 = phi i64 [ %11, %7 ], [ 0, %3 ]
  %14 = sext i32 %0 to i64
  %15 = sext i32 %2 to i64
  %16 = call i64 @__syscall_cp(i64 noundef 47, i64 noundef %14, i64 noundef %13, i64 noundef %15, i64 noundef 0, i64 noundef 0, i64 noundef 0) #7
  %17 = call i64 @__syscall_ret(i64 noundef %16) #7
  br i1 %6, label %20, label %18

18:                                               ; preds = %12
  %19 = bitcast %struct.msghdr* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(56) %19, i8* noundef nonnull align 8 dereferenceable(56) %5, i64 56, i1 false) #6, !tbaa.struct !3
  br label %20

20:                                               ; preds = %18, %12
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %5) #5
  ret i64 %17
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: optsize
declare hidden i64 @__syscall_cp(i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef) local_unnamed_addr #4

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #4 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind strictfp }
attributes #6 = { strictfp }
attributes #7 = { nobuiltin nounwind optsize strictfp "no-builtins" }

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
