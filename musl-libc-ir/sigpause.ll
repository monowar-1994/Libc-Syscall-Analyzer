; ModuleID = 'src/signal/sigpause.c'
source_filename = "src/signal/sigpause.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__sigset_t = type { [16 x i64] }

; Function Attrs: nounwind optsize strictfp
define i32 @sigpause(i32 noundef %0) local_unnamed_addr #0 {
  %2 = alloca %struct.__sigset_t, align 8
  %3 = bitcast %struct.__sigset_t* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %3) #3
  %4 = call i32 @sigprocmask(i32 noundef 0, %struct.__sigset_t* noundef null, %struct.__sigset_t* noundef nonnull %2) #4
  %5 = call i32 @sigdelset(%struct.__sigset_t* noundef nonnull %2, i32 noundef %0) #4
  %6 = call i32 @sigsuspend(%struct.__sigset_t* noundef nonnull %2) #4
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %3) #3
  ret i32 %6
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @sigprocmask(i32 noundef, %struct.__sigset_t* noundef, %struct.__sigset_t* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @sigdelset(%struct.__sigset_t* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @sigsuspend(%struct.__sigset_t* noundef) local_unnamed_addr #2

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
