; ModuleID = 'src/thread/pthread_join.c'
source_filename = "src/thread/pthread_join.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.timespec = type { i64, i64 }

@__tl_sync = weak hidden alias void (%struct.__pthread*), void (%struct.__pthread*)* @dummy1
@pthread_tryjoin_np = weak alias i32 (%struct.__pthread*, i8**), i32 (%struct.__pthread*, i8**)* @__pthread_tryjoin_np
@pthread_timedjoin_np = weak alias i32 (%struct.__pthread*, i8**, %struct.timespec*), i32 (%struct.__pthread*, i8**, %struct.timespec*)* @__pthread_timedjoin_np
@pthread_join = weak alias i32 (%struct.__pthread*, i8**), i32 (%struct.__pthread*, i8**)* @__pthread_join

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal void @dummy1(%struct.__pthread* nocapture noundef %0) #0 {
  ret void
}

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__pthread_join(%struct.__pthread* noundef %0, i8** noundef %1) #1 {
  %3 = tail call i32 @__pthread_timedjoin_np(%struct.__pthread* noundef %0, i8** noundef %1, %struct.timespec* noundef null) #4
  ret i32 %3
}

; Function Attrs: nounwind optsize strictfp
define internal i32 @__pthread_timedjoin_np(%struct.__pthread* noundef %0, i8** noundef writeonly %1, %struct.timespec* noundef %2) #1 {
  %4 = alloca i32, align 4
  %5 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %5) #5
  tail call void @__pthread_testcancel() #6
  %6 = call i32 @__pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %4) #6
  %7 = load i32, i32* %4, align 4, !tbaa !3
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %11

9:                                                ; preds = %3
  %10 = call i32 @__pthread_setcancelstate(i32 noundef 0, i32* noundef null) #6
  br label %11

11:                                               ; preds = %9, %3
  %12 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %0, i64 0, i32 8
  %13 = load volatile i32, i32* %12, align 8, !tbaa !7
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %18

15:                                               ; preds = %11
  %16 = load i32, i32* %4, align 4, !tbaa !3
  %17 = call i32 @__pthread_setcancelstate(i32 noundef %16, i32* noundef null) #6
  br label %33

18:                                               ; preds = %11, %22
  %19 = phi i32 [ %24, %22 ], [ %13, %11 ]
  %20 = icmp sgt i32 %19, 2
  br i1 %20, label %21, label %22

21:                                               ; preds = %18
  call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #5, !srcloc !12
  br label %22

22:                                               ; preds = %21, %18
  %23 = call i32 @__timedwait_cp(i32* noundef nonnull %12, i32 noundef %19, i32 noundef 0, %struct.timespec* noundef %2, i32 noundef 1) #6
  %24 = load volatile i32, i32* %12, align 8, !tbaa !7
  %25 = icmp ne i32 %24, 0
  %26 = icmp ne i32 %23, 110
  %27 = select i1 %25, i1 %26, i1 false
  %28 = icmp ne i32 %23, 22
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %18, label %30

30:                                               ; preds = %22
  %31 = load i32, i32* %4, align 4, !tbaa !3
  %32 = call i32 @__pthread_setcancelstate(i32 noundef %31, i32* noundef null) #6
  switch i32 %23, label %33 [
    i32 110, label %46
    i32 22, label %46
  ]

33:                                               ; preds = %15, %30
  call void @__tl_sync(%struct.__pthread* noundef nonnull %0) #6
  %34 = icmp eq i8** %1, null
  br i1 %34, label %38, label %35

35:                                               ; preds = %33
  %36 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %0, i64 0, i32 18
  %37 = load i8*, i8** %36, align 8, !tbaa !13
  store i8* %37, i8** %1, align 8, !tbaa !14
  br label %38

38:                                               ; preds = %35, %33
  %39 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %0, i64 0, i32 13
  %40 = load i8*, i8** %39, align 8, !tbaa !15
  %41 = icmp eq i8* %40, null
  br i1 %41, label %46, label %42

42:                                               ; preds = %38
  %43 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %0, i64 0, i32 14
  %44 = load i64, i64* %43, align 8, !tbaa !16
  %45 = call i32 @__munmap(i8* noundef nonnull %40, i64 noundef %44) #6
  br label %46

46:                                               ; preds = %38, %42, %30, %30
  %47 = phi i32 [ %23, %30 ], [ %23, %30 ], [ 0, %42 ], [ 0, %38 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %5) #5
  ret i32 %47
}

; Function Attrs: nounwind optsize strictfp
define internal i32 @__pthread_tryjoin_np(%struct.__pthread* noundef %0, i8** noundef %1) #1 {
  %3 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %0, i64 0, i32 8
  %4 = load volatile i32, i32* %3, align 8, !tbaa !7
  %5 = icmp eq i32 %4, 2
  br i1 %5, label %8, label %6

6:                                                ; preds = %2
  %7 = tail call i32 @__pthread_timedjoin_np(%struct.__pthread* noundef nonnull %0, i8** noundef %1, %struct.timespec* noundef null) #6
  br label %8

8:                                                ; preds = %2, %6
  %9 = phi i32 [ %7, %6 ], [ 16, %2 ]
  ret i32 %9
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: optsize
declare hidden void @__pthread_testcancel() local_unnamed_addr #3

; Function Attrs: optsize
declare hidden i32 @__pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden i32 @__timedwait_cp(i32* noundef, i32 noundef, i32 noundef, %struct.timespec* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden i32 @__munmap(i8* noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nobuiltin optsize strictfp "no-builtins" }
attributes #5 = { nounwind strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !4, i64 56}
!8 = !{!"__pthread", !9, i64 0, !9, i64 8, !9, i64 16, !9, i64 24, !10, i64 32, !10, i64 40, !4, i64 48, !4, i64 52, !4, i64 56, !4, i64 60, !5, i64 64, !5, i64 65, !5, i64 66, !5, i64 66, !9, i64 72, !10, i64 80, !9, i64 88, !10, i64 96, !10, i64 104, !9, i64 112, !9, i64 120, !9, i64 128, !11, i64 136, !4, i64 160, !4, i64 164, !9, i64 168, !5, i64 176, !9, i64 184, !9, i64 192}
!9 = !{!"any pointer", !5, i64 0}
!10 = !{!"long", !5, i64 0}
!11 = !{!"", !9, i64 0, !10, i64 8, !9, i64 16}
!12 = !{i64 246921}
!13 = !{!8, !9, i64 112}
!14 = !{!9, !9, i64 0}
!15 = !{!8, !9, i64 72}
!16 = !{!8, !10, i64 80}
