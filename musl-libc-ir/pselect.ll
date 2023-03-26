; ModuleID = 'src/select/pselect.c'
source_filename = "src/select/pselect.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.fd_set = type { [16 x i64] }
%struct.timespec = type { i64, i64 }
%struct.__sigset_t = type { [16 x i64] }

; Function Attrs: nounwind optsize strictfp
define i32 @pselect(i32 noundef %0, %struct.fd_set* noalias noundef %1, %struct.fd_set* noalias noundef %2, %struct.fd_set* noalias noundef %3, %struct.timespec* noalias noundef readonly %4, %struct.__sigset_t* noalias noundef %5) local_unnamed_addr #0 {
  %7 = alloca [2 x i64], align 16
  %8 = alloca <2 x i64>, align 16
  %9 = bitcast [2 x i64]* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %9) #3
  %10 = getelementptr inbounds [2 x i64], [2 x i64]* %7, i64 0, i64 0
  %11 = ptrtoint %struct.__sigset_t* %5 to i64
  store i64 %11, i64* %10, align 16, !tbaa !3
  %12 = getelementptr inbounds [2 x i64], [2 x i64]* %7, i64 0, i64 1
  store i64 8, i64* %12, align 8, !tbaa !3
  %13 = icmp eq %struct.timespec* %4, null
  br i1 %13, label %18, label %14

14:                                               ; preds = %6
  %15 = bitcast %struct.timespec* %4 to <2 x i64>*
  %16 = load <2 x i64>, <2 x i64>* %15, align 8, !tbaa !3
  store <2 x i64> %16, <2 x i64>* %8, align 16, !tbaa !3
  %17 = ptrtoint <2 x i64>* %8 to i64
  br label %18

18:                                               ; preds = %6, %14
  %19 = phi i64 [ %17, %14 ], [ 0, %6 ]
  %20 = ptrtoint %struct.fd_set* %3 to i64
  %21 = ptrtoint %struct.fd_set* %2 to i64
  %22 = ptrtoint %struct.fd_set* %1 to i64
  %23 = sext i32 %0 to i64
  %24 = ptrtoint [2 x i64]* %7 to i64
  %25 = call i64 @__syscall_cp(i64 noundef 270, i64 noundef %23, i64 noundef %22, i64 noundef %21, i64 noundef %20, i64 noundef %19, i64 noundef %24) #4
  %26 = call i64 @__syscall_ret(i64 noundef %25) #4
  %27 = trunc i64 %26 to i32
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %9) #3
  ret i32 %27
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i64 @__syscall_cp(i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"long", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
