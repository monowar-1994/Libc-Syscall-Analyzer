; ModuleID = 'src/signal/sigset.c'
source_filename = "src/signal/sigset.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sigaction = type { %union.anon, %struct.__sigset_t, i32, void ()* }
%union.anon = type { void (i32)* }
%struct.__sigset_t = type { [16 x i64] }

; Function Attrs: nounwind optsize strictfp
define void (i32)* @sigset(i32 noundef %0, void (i32)* noundef %1) local_unnamed_addr #0 {
  %3 = alloca %struct.sigaction, align 8
  %4 = alloca %struct.sigaction, align 8
  %5 = alloca %struct.__sigset_t, align 8
  %6 = alloca %struct.__sigset_t, align 8
  %7 = bitcast %struct.sigaction* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 152, i8* nonnull %7) #3
  %8 = bitcast %struct.sigaction* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 152, i8* nonnull %8) #3
  %9 = bitcast %struct.__sigset_t* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %9) #3
  %10 = bitcast %struct.__sigset_t* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %10) #3
  %11 = call i32 @sigemptyset(%struct.__sigset_t* noundef nonnull %5) #4
  %12 = call i32 @sigaddset(%struct.__sigset_t* noundef nonnull %5, i32 noundef %0) #4
  %13 = icmp slt i32 %12, 0
  br i1 %13, label %38, label %14

14:                                               ; preds = %2
  %15 = icmp eq void (i32)* %1, inttoptr (i64 2 to void (i32)*)
  br i1 %15, label %16, label %22

16:                                               ; preds = %14
  %17 = call i32 @sigaction(i32 noundef %0, %struct.sigaction* noundef null, %struct.sigaction* noundef nonnull %4) #4
  %18 = icmp slt i32 %17, 0
  br i1 %18, label %38, label %19

19:                                               ; preds = %16
  %20 = call i32 @sigprocmask(i32 noundef 0, %struct.__sigset_t* noundef nonnull %5, %struct.__sigset_t* noundef nonnull %6) #4
  %21 = icmp slt i32 %20, 0
  br i1 %21, label %38, label %32

22:                                               ; preds = %14
  %23 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %3, i64 0, i32 0, i32 0
  store void (i32)* %1, void (i32)** %23, align 8, !tbaa !3
  %24 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %3, i64 0, i32 2
  store i32 0, i32* %24, align 8, !tbaa !6
  %25 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %3, i64 0, i32 1
  %26 = call i32 @sigemptyset(%struct.__sigset_t* noundef nonnull %25) #4
  %27 = call i32 @sigaction(i32 noundef %0, %struct.sigaction* noundef nonnull %3, %struct.sigaction* noundef nonnull %4) #4
  %28 = icmp slt i32 %27, 0
  br i1 %28, label %38, label %29

29:                                               ; preds = %22
  %30 = call i32 @sigprocmask(i32 noundef 1, %struct.__sigset_t* noundef nonnull %5, %struct.__sigset_t* noundef nonnull %6) #4
  %31 = icmp slt i32 %30, 0
  br i1 %31, label %38, label %32

32:                                               ; preds = %29, %19
  %33 = call i32 @sigismember(%struct.__sigset_t* noundef nonnull %6, i32 noundef %0) #4
  %34 = icmp eq i32 %33, 0
  %35 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %4, i64 0, i32 0, i32 0
  %36 = load void (i32)*, void (i32)** %35, align 8
  %37 = select i1 %34, void (i32)* %36, void (i32)* inttoptr (i64 2 to void (i32)*)
  br label %38

38:                                               ; preds = %29, %22, %19, %16, %2, %32
  %39 = phi void (i32)* [ %37, %32 ], [ inttoptr (i64 -1 to void (i32)*), %2 ], [ inttoptr (i64 -1 to void (i32)*), %16 ], [ inttoptr (i64 -1 to void (i32)*), %19 ], [ inttoptr (i64 -1 to void (i32)*), %22 ], [ inttoptr (i64 -1 to void (i32)*), %29 ]
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %10) #3
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %9) #3
  call void @llvm.lifetime.end.p0i8(i64 152, i8* nonnull %8) #3
  call void @llvm.lifetime.end.p0i8(i64 152, i8* nonnull %7) #3
  ret void (i32)* %39
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @sigemptyset(%struct.__sigset_t* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @sigaddset(%struct.__sigset_t* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @sigaction(i32 noundef, %struct.sigaction* noundef, %struct.sigaction* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @sigprocmask(i32 noundef, %struct.__sigset_t* noundef, %struct.__sigset_t* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @sigismember(%struct.__sigset_t* noundef, i32 noundef) local_unnamed_addr #2

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
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !9, i64 136}
!7 = !{!"sigaction", !4, i64 0, !8, i64 8, !9, i64 136, !10, i64 144}
!8 = !{!"__sigset_t", !4, i64 0}
!9 = !{!"int", !4, i64 0}
!10 = !{!"any pointer", !4, i64 0}
