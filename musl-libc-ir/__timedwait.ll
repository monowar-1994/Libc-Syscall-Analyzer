; ModuleID = 'src/thread/__timedwait.c'
source_filename = "src/thread/__timedwait.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timespec = type { i64, i64 }

@dummy = internal global i32 0, align 4

@__eintr_valid_flag = weak hidden alias i32, i32* @dummy

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__timedwait_cp(i32* noundef %0, i32 noundef %1, i32 noundef %2, %struct.timespec* noundef readonly %3, i32 noundef %4) local_unnamed_addr #0 {
  %6 = alloca <2 x i64>, align 16
  %7 = bitcast <2 x i64>* %6 to %struct.timespec*
  %8 = bitcast <2 x i64>* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %8) #3
  %9 = icmp eq i32 %4, 0
  %10 = select i1 %9, i64 0, i64 128
  %11 = icmp eq %struct.timespec* %3, null
  br i1 %11, label %33, label %12

12:                                               ; preds = %5
  %13 = getelementptr inbounds %struct.timespec, %struct.timespec* %3, i64 0, i32 1
  %14 = load i64, i64* %13, align 8, !tbaa !3
  %15 = icmp ugt i64 %14, 999999999
  br i1 %15, label %58, label %16

16:                                               ; preds = %12
  %17 = call i32 @__clock_gettime(i32 noundef %2, %struct.timespec* noundef nonnull %7) #4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %58

19:                                               ; preds = %16
  %20 = bitcast %struct.timespec* %3 to <2 x i64>*
  %21 = load <2 x i64>, <2 x i64>* %20, align 8, !tbaa !8
  %22 = load <2 x i64>, <2 x i64>* %6, align 16, !tbaa !8
  %23 = sub nsw <2 x i64> %21, %22
  store <2 x i64> %23, <2 x i64>* %6, align 16, !tbaa !8
  %24 = extractelement <2 x i64> %23, i64 1
  %25 = icmp slt i64 %24, 0
  %26 = extractelement <2 x i64> %23, i64 0
  br i1 %25, label %27, label %30

27:                                               ; preds = %19
  %28 = add nsw <2 x i64> %23, <i64 -1, i64 1000000000>
  store <2 x i64> %28, <2 x i64>* %6, align 16, !tbaa !8
  %29 = extractelement <2 x i64> %28, i64 0
  br label %30

30:                                               ; preds = %19, %27
  %31 = phi i64 [ %29, %27 ], [ %26, %19 ]
  %32 = icmp slt i64 %31, 0
  br i1 %32, label %58, label %33

33:                                               ; preds = %30, %5
  %34 = phi %struct.timespec* [ null, %5 ], [ %7, %30 ]
  %35 = ptrtoint i32* %0 to i64
  %36 = sext i32 %1 to i64
  %37 = ptrtoint %struct.timespec* %34 to i64
  %38 = call i64 @__syscall_cp(i64 noundef 202, i64 noundef %35, i64 noundef %10, i64 noundef %36, i64 noundef %37, i64 noundef 0, i64 noundef 0) #4
  %39 = trunc i64 %38 to i32
  %40 = icmp eq i32 %39, -38
  br i1 %40, label %41, label %44

41:                                               ; preds = %33
  %42 = call i64 @__syscall_cp(i64 noundef 202, i64 noundef %35, i64 noundef 0, i64 noundef %36, i64 noundef %37, i64 noundef 0, i64 noundef 0) #4
  %43 = trunc i64 %42 to i32
  br label %44

44:                                               ; preds = %33, %41
  %45 = phi i32 [ %43, %41 ], [ %39, %33 ]
  %46 = sub nsw i32 0, %45
  %47 = icmp ne i32 %45, -4
  %48 = icmp ne i32 %45, -110
  %49 = and i1 %47, %48
  %50 = icmp ne i32 %45, -125
  %51 = and i1 %50, %49
  %52 = select i1 %51, i32 0, i32 %46
  %53 = icmp eq i32 %52, 4
  br i1 %53, label %54, label %58

54:                                               ; preds = %44
  %55 = load volatile i32, i32* @__eintr_valid_flag, align 4, !tbaa !9
  %56 = icmp eq i32 %55, 0
  %57 = select i1 %56, i32 0, i32 4
  br label %58

58:                                               ; preds = %54, %44, %30, %16, %12
  %59 = phi i32 [ 22, %12 ], [ 22, %16 ], [ 110, %30 ], [ %52, %44 ], [ %57, %54 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %8) #3
  ret i32 %59
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i32 @__clock_gettime(i32 noundef, %struct.timespec* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__timedwait(i32* noundef %0, i32 noundef %1, i32 noundef %2, %struct.timespec* noundef %3, i32 noundef %4) local_unnamed_addr #0 {
  %6 = alloca i32, align 4
  %7 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %7) #3
  %8 = call i32 @__pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %6) #4
  %9 = call i32 @__timedwait_cp(i32* noundef %0, i32 noundef %1, i32 noundef %2, %struct.timespec* noundef %3, i32 noundef %4) #5
  %10 = load i32, i32* %6, align 4, !tbaa !9
  %11 = call i32 @__pthread_setcancelstate(i32 noundef %10, i32* noundef null) #4
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %7) #3
  ret i32 %9
}

; Function Attrs: optsize
declare hidden i32 @__pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i64 @__syscall_cp(i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 8}
!4 = !{!"timespec", !5, i64 0, !5, i64 8}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!5, !5, i64 0}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !6, i64 0}
