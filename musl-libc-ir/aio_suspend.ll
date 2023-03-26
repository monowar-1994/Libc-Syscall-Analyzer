; ModuleID = 'src/aio/aio_suspend.c'
source_filename = "src/aio/aio_suspend.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.aiocb = type { i32, i32, i32, i8*, i64, %struct.sigevent, i8*, [2 x i32], i32, i64, i64, i8*, i8*, [16 x i8] }
%struct.sigevent = type { %union.sigval, i32, i32, %union.anon }
%union.sigval = type { i8* }
%union.anon = type { %struct.anon, [32 x i8] }
%struct.anon = type { void (i8*)*, %struct.pthread_attr_t* }
%struct.pthread_attr_t = type { %union.anon.0 }
%union.anon.0 = type { [7 x i64] }
%struct.timespec = type { i64, i64 }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon.1, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon.1 = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque

@__aio_fut = external hidden global i32, align 4

@aio_suspend64 = weak alias i32 (%struct.aiocb**, i32, %struct.timespec*), i32 (%struct.aiocb**, i32, %struct.timespec*)* @aio_suspend

; Function Attrs: nounwind optsize strictfp
define i32 @aio_suspend(%struct.aiocb** nocapture noundef readonly %0, i32 noundef %1, %struct.timespec* noundef readonly %2) #0 {
  %4 = alloca <2 x i64>, align 16
  %5 = bitcast <2 x i64>* %4 to %struct.timespec*
  %6 = alloca i32, align 4
  %7 = bitcast <2 x i64>* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %7) #4
  %8 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %8) #4
  tail call void @pthread_testcancel() #5
  %9 = icmp slt i32 %1, 0
  br i1 %9, label %98, label %10

10:                                               ; preds = %3
  %11 = icmp eq i32 %1, 0
  br i1 %11, label %32, label %12

12:                                               ; preds = %10
  %13 = zext i32 %1 to i64
  br label %14

14:                                               ; preds = %12, %27
  %15 = phi i64 [ 0, %12 ], [ %30, %27 ]
  %16 = phi %struct.aiocb* [ null, %12 ], [ %29, %27 ]
  %17 = phi i32 [ 0, %12 ], [ %28, %27 ]
  %18 = getelementptr inbounds %struct.aiocb*, %struct.aiocb** %0, i64 %15
  %19 = load %struct.aiocb*, %struct.aiocb** %18, align 8, !tbaa !3
  %20 = icmp eq %struct.aiocb* %19, null
  br i1 %20, label %27, label %21

21:                                               ; preds = %14
  %22 = tail call i32 @aio_error(%struct.aiocb* noundef nonnull %19) #5
  %23 = icmp eq i32 %22, 115
  br i1 %23, label %24, label %101

24:                                               ; preds = %21
  %25 = add nsw i32 %17, 1
  %26 = load %struct.aiocb*, %struct.aiocb** %18, align 8, !tbaa !3
  br label %27

27:                                               ; preds = %14, %24
  %28 = phi i32 [ %25, %24 ], [ %17, %14 ]
  %29 = phi %struct.aiocb* [ %26, %24 ], [ %16, %14 ]
  %30 = add nuw nsw i64 %15, 1
  %31 = icmp eq i64 %30, %13
  br i1 %31, label %32, label %14

32:                                               ; preds = %27, %10
  %33 = phi i32 [ 0, %10 ], [ %28, %27 ]
  %34 = phi %struct.aiocb* [ null, %10 ], [ %29, %27 ]
  %35 = icmp eq %struct.timespec* %2, null
  br i1 %35, label %46, label %36

36:                                               ; preds = %32
  %37 = call i32 @clock_gettime(i32 noundef 1, %struct.timespec* noundef nonnull %5) #5
  %38 = bitcast %struct.timespec* %2 to <2 x i64>*
  %39 = load <2 x i64>, <2 x i64>* %38, align 8, !tbaa !7
  %40 = load <2 x i64>, <2 x i64>* %4, align 16, !tbaa !7
  %41 = add nsw <2 x i64> %40, %39
  store <2 x i64> %41, <2 x i64>* %4, align 16, !tbaa !7
  %42 = extractelement <2 x i64> %41, i64 1
  %43 = icmp sgt i64 %42, 999999999
  br i1 %43, label %44, label %46

44:                                               ; preds = %36
  %45 = add nsw <2 x i64> %41, <i64 1, i64 -1000000000>
  store <2 x i64> %45, <2 x i64>* %4, align 16, !tbaa !7
  br label %46

46:                                               ; preds = %36, %44, %32
  %47 = phi %struct.timespec* [ %5, %36 ], [ %5, %44 ], [ null, %32 ]
  %48 = icmp sgt i32 %1, 0
  %49 = getelementptr inbounds %struct.aiocb, %struct.aiocb* %34, i64 0, i32 8
  %50 = zext i32 %1 to i64
  %51 = zext i32 %1 to i64
  br label %52

52:                                               ; preds = %92, %46
  %53 = phi i32 [ 0, %46 ], [ %93, %92 ]
  %54 = phi i32 [ 0, %46 ], [ %94, %92 ]
  br i1 %48, label %55, label %66

55:                                               ; preds = %52, %63
  %56 = phi i64 [ %64, %63 ], [ 0, %52 ]
  %57 = getelementptr inbounds %struct.aiocb*, %struct.aiocb** %0, i64 %56
  %58 = load %struct.aiocb*, %struct.aiocb** %57, align 8, !tbaa !3
  %59 = icmp eq %struct.aiocb* %58, null
  br i1 %59, label %63, label %60

60:                                               ; preds = %55
  %61 = call i32 @aio_error(%struct.aiocb* noundef nonnull %58) #5
  %62 = icmp eq i32 %61, 115
  br i1 %62, label %63, label %101

63:                                               ; preds = %55, %60
  %64 = add nuw nsw i64 %56, 1
  %65 = icmp eq i64 %64, %50
  br i1 %65, label %66, label %55

66:                                               ; preds = %63, %52
  switch i32 %33, label %69 [
    i32 0, label %92
    i32 1, label %67
  ]

67:                                               ; preds = %66
  %68 = call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %49, i32 115, i32 -2147483533) #4, !srcloc !9
  br label %92

69:                                               ; preds = %66
  %70 = icmp eq i32 %53, 0
  br i1 %70, label %71, label %76

71:                                               ; preds = %69
  %72 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !10
  %73 = inttoptr i64 %72 to %struct.__pthread*
  %74 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %73, i64 0, i32 6
  %75 = load i32, i32* %74, align 8, !tbaa !11
  br label %76

76:                                               ; preds = %71, %69
  %77 = phi i32 [ %53, %69 ], [ %75, %71 ]
  %78 = call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) @__aio_fut, i32 0, i32 %77) #4, !srcloc !9
  %79 = icmp eq i32 %78, 0
  %80 = select i1 %79, i32 %77, i32 %78
  br i1 %48, label %81, label %92

81:                                               ; preds = %76, %89
  %82 = phi i64 [ %90, %89 ], [ 0, %76 ]
  %83 = getelementptr inbounds %struct.aiocb*, %struct.aiocb** %0, i64 %82
  %84 = load %struct.aiocb*, %struct.aiocb** %83, align 8, !tbaa !3
  %85 = icmp eq %struct.aiocb* %84, null
  br i1 %85, label %89, label %86

86:                                               ; preds = %81
  %87 = call i32 @aio_error(%struct.aiocb* noundef nonnull %84) #5
  %88 = icmp eq i32 %87, 115
  br i1 %88, label %89, label %101

89:                                               ; preds = %81, %86
  %90 = add nuw nsw i64 %82, 1
  %91 = icmp eq i64 %90, %51
  br i1 %91, label %92, label %81

92:                                               ; preds = %89, %76, %66, %67
  %93 = phi i32 [ %53, %67 ], [ %53, %66 ], [ %77, %76 ], [ %77, %89 ]
  %94 = phi i32 [ -2147483533, %67 ], [ %54, %66 ], [ %80, %76 ], [ %80, %89 ]
  %95 = phi i32* [ %49, %67 ], [ %6, %66 ], [ @__aio_fut, %76 ], [ @__aio_fut, %89 ]
  %96 = call i32 @__timedwait_cp(i32* noundef nonnull %95, i32 noundef %94, i32 noundef 1, %struct.timespec* noundef %47, i32 noundef 1) #5
  switch i32 %96, label %52 [
    i32 110, label %98
    i32 125, label %97
    i32 4, label %97
  ]

97:                                               ; preds = %92, %92
  br label %98

98:                                               ; preds = %92, %97, %3
  %99 = phi i32 [ 22, %3 ], [ %96, %97 ], [ 11, %92 ]
  %100 = tail call i32* @___errno_location() #7
  store i32 %99, i32* %100, align 4, !tbaa !15
  br label %101

101:                                              ; preds = %21, %60, %86, %98
  %102 = phi i32 [ -1, %98 ], [ 0, %86 ], [ 0, %60 ], [ 0, %21 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %8) #4
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %7) #4
  ret i32 %102
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare void @pthread_testcancel() local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @aio_error(%struct.aiocb* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @clock_gettime(i32 noundef, %struct.timespec* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__timedwait_cp(i32* noundef, i32 noundef, i32 noundef, %struct.timespec* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nounwind readnone strictfp }
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
!9 = !{i64 92278}
!10 = !{i64 248502}
!11 = !{!12, !13, i64 48}
!12 = !{!"__pthread", !4, i64 0, !4, i64 8, !4, i64 16, !4, i64 24, !8, i64 32, !8, i64 40, !13, i64 48, !13, i64 52, !13, i64 56, !13, i64 60, !5, i64 64, !5, i64 65, !5, i64 66, !5, i64 66, !4, i64 72, !8, i64 80, !4, i64 88, !8, i64 96, !8, i64 104, !4, i64 112, !4, i64 120, !4, i64 128, !14, i64 136, !13, i64 160, !13, i64 164, !4, i64 168, !5, i64 176, !4, i64 184, !4, i64 192}
!13 = !{!"int", !5, i64 0}
!14 = !{!"", !4, i64 0, !8, i64 8, !4, i64 16}
!15 = !{!13, !13, i64 0}
