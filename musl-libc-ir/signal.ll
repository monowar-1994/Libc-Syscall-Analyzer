; ModuleID = 'src/signal/signal.c'
source_filename = "src/signal/signal.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sigaction = type { %union.anon, %struct.__sigset_t, i32, void ()* }
%union.anon = type { void (i32)* }
%struct.__sigset_t = type { [16 x i64] }

@bsd_signal = weak alias void (i32)* (i32, void (i32)*), void (i32)* (i32, void (i32)*)* @signal
@__sysv_signal = weak alias void (i32)* (i32, void (i32)*), void (i32)* (i32, void (i32)*)* @signal

; Function Attrs: nounwind optsize strictfp
define void (i32)* @signal(i32 noundef %0, void (i32)* noundef %1) #0 {
  %3 = alloca %struct.sigaction, align 8
  %4 = alloca %struct.sigaction, align 8
  %5 = bitcast %struct.sigaction* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 152, i8* nonnull %5) #4
  %6 = bitcast %struct.sigaction* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 152, i8* nonnull %6) #4
  %7 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %4, i64 0, i32 1
  %8 = bitcast %struct.__sigset_t* %7 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(152) %8, i8 0, i64 144, i1 false) #5
  %9 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %4, i64 0, i32 0, i32 0
  store void (i32)* %1, void (i32)** %9, align 8, !tbaa !3
  %10 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %4, i64 0, i32 2
  store i32 268435456, i32* %10, align 8, !tbaa !6
  %11 = call i32 @__sigaction(i32 noundef %0, %struct.sigaction* noundef nonnull %4, %struct.sigaction* noundef nonnull %3) #6
  %12 = icmp slt i32 %11, 0
  %13 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %3, i64 0, i32 0, i32 0
  %14 = load void (i32)*, void (i32)** %13, align 8
  %15 = select i1 %12, void (i32)* inttoptr (i64 -1 to void (i32)*), void (i32)* %14
  call void @llvm.lifetime.end.p0i8(i64 152, i8* nonnull %6) #4
  call void @llvm.lifetime.end.p0i8(i64 152, i8* nonnull %5) #4
  ret void (i32)* %15
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: optsize
declare hidden i32 @__sigaction(i32 noundef, %struct.sigaction* noundef, %struct.sigaction* noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

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
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !9, i64 136}
!7 = !{!"sigaction", !4, i64 0, !8, i64 8, !9, i64 136, !10, i64 144}
!8 = !{!"__sigset_t", !4, i64 0}
!9 = !{!"int", !4, i64 0}
!10 = !{!"any pointer", !4, i64 0}
