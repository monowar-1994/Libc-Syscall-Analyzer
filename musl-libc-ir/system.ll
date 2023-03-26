; ModuleID = 'src/process/system.c'
source_filename = "src/process/system.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__sigset_t = type { [16 x i64] }
%struct.sigaction = type { %union.anon, %struct.__sigset_t, i32, void ()* }
%union.anon = type { void (i32)* }
%struct.posix_spawnattr_t = type { i32, i32, %struct.__sigset_t, %struct.__sigset_t, i32, i32, i8*, [56 x i8] }
%struct.posix_spawn_file_actions_t = type { [2 x i32], i8*, [16 x i32] }

@.str = private unnamed_addr constant [8 x i8] c"/bin/sh\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"sh\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"-c\00", align 1
@__environ = external local_unnamed_addr global i8**, align 8

; Function Attrs: nounwind optsize strictfp
define i32 @system(i8* noundef %0) local_unnamed_addr #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.__sigset_t, align 8
  %4 = alloca %struct.__sigset_t, align 8
  %5 = alloca %struct.sigaction, align 8
  %6 = alloca %struct.sigaction, align 8
  %7 = alloca %struct.sigaction, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.posix_spawnattr_t, align 8
  %10 = alloca [4 x i8*], align 8
  %11 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %11) #5
  %12 = bitcast %struct.__sigset_t* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %12) #5
  %13 = bitcast %struct.__sigset_t* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %13) #5
  %14 = bitcast %struct.sigaction* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 152, i8* nonnull %14) #5
  %15 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %5, i64 0, i32 1
  %16 = bitcast %struct.__sigset_t* %15 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(152) %16, i8 0, i64 144, i1 false) #6
  %17 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %5, i64 0, i32 0, i32 0
  store void (i32)* inttoptr (i64 1 to void (i32)*), void (i32)** %17, align 8
  %18 = bitcast %struct.sigaction* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 152, i8* nonnull %18) #5
  %19 = bitcast %struct.sigaction* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 152, i8* nonnull %19) #5
  %20 = bitcast i32* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %20) #5
  store i32 -1, i32* %8, align 4, !tbaa !3
  %21 = bitcast %struct.posix_spawnattr_t* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 336, i8* nonnull %21) #5
  tail call void @pthread_testcancel() #7
  %22 = icmp eq i8* %0, null
  br i1 %22, label %73, label %23

23:                                               ; preds = %1
  %24 = call i32 @sigaction(i32 noundef 2, %struct.sigaction* noundef nonnull %5, %struct.sigaction* noundef nonnull %6) #7
  %25 = call i32 @sigaction(i32 noundef 3, %struct.sigaction* noundef nonnull %5, %struct.sigaction* noundef nonnull %7) #7
  %26 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %5, i64 0, i32 1
  %27 = call i32 @sigaddset(%struct.__sigset_t* noundef nonnull %26, i32 noundef 17) #7
  %28 = call i32 @sigprocmask(i32 noundef 0, %struct.__sigset_t* noundef nonnull %26, %struct.__sigset_t* noundef nonnull %3) #7
  %29 = call i32 @sigemptyset(%struct.__sigset_t* noundef nonnull %4) #7
  %30 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %6, i64 0, i32 0, i32 0
  %31 = load void (i32)*, void (i32)** %30, align 8, !tbaa !7
  %32 = icmp eq void (i32)* %31, inttoptr (i64 1 to void (i32)*)
  br i1 %32, label %35, label %33

33:                                               ; preds = %23
  %34 = call i32 @sigaddset(%struct.__sigset_t* noundef nonnull %4, i32 noundef 2) #7
  br label %35

35:                                               ; preds = %33, %23
  %36 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %7, i64 0, i32 0, i32 0
  %37 = load void (i32)*, void (i32)** %36, align 8, !tbaa !7
  %38 = icmp eq void (i32)* %37, inttoptr (i64 1 to void (i32)*)
  br i1 %38, label %41, label %39

39:                                               ; preds = %35
  %40 = call i32 @sigaddset(%struct.__sigset_t* noundef nonnull %4, i32 noundef 3) #7
  br label %41

41:                                               ; preds = %39, %35
  %42 = call i32 @posix_spawnattr_init(%struct.posix_spawnattr_t* noundef nonnull %9) #7
  %43 = call i32 @posix_spawnattr_setsigmask(%struct.posix_spawnattr_t* noundef nonnull %9, %struct.__sigset_t* noundef nonnull %3) #7
  %44 = call i32 @posix_spawnattr_setsigdefault(%struct.posix_spawnattr_t* noundef nonnull %9, %struct.__sigset_t* noundef nonnull %4) #7
  %45 = call i32 @posix_spawnattr_setflags(%struct.posix_spawnattr_t* noundef nonnull %9, i16 noundef signext 12) #7
  %46 = getelementptr inbounds [4 x i8*], [4 x i8*]* %10, i64 0, i64 0
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i8** %46, align 8, !tbaa !8
  %47 = getelementptr inbounds [4 x i8*], [4 x i8*]* %10, i64 0, i64 1
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i8** %47, align 8, !tbaa !8
  %48 = getelementptr inbounds [4 x i8*], [4 x i8*]* %10, i64 0, i64 2
  store i8* %0, i8** %48, align 8, !tbaa !8
  %49 = getelementptr inbounds [4 x i8*], [4 x i8*]* %10, i64 0, i64 3
  store i8* null, i8** %49, align 8, !tbaa !8
  %50 = load i8**, i8*** @__environ, align 8, !tbaa !8
  %51 = call i32 @posix_spawn(i32* noundef nonnull %2, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), %struct.posix_spawn_file_actions_t* noundef null, %struct.posix_spawnattr_t* noundef nonnull %9, i8** noundef nonnull %46, i8** noundef %50) #7
  %52 = call i32 @posix_spawnattr_destroy(%struct.posix_spawnattr_t* noundef nonnull %9) #7
  %53 = icmp eq i32 %51, 0
  br i1 %53, label %54, label %66

54:                                               ; preds = %41, %58
  %55 = load i32, i32* %2, align 4, !tbaa !3
  %56 = call i32 @waitpid(i32 noundef %55, i32* noundef nonnull %8, i32 noundef 0) #7
  %57 = icmp slt i32 %56, 0
  br i1 %57, label %58, label %62

58:                                               ; preds = %54
  %59 = tail call i32* @___errno_location() #8
  %60 = load i32, i32* %59, align 4, !tbaa !3
  %61 = icmp eq i32 %60, 4
  br i1 %61, label %54, label %62

62:                                               ; preds = %58, %54
  %63 = call i32 @sigaction(i32 noundef 2, %struct.sigaction* noundef nonnull %6, %struct.sigaction* noundef null) #7
  %64 = call i32 @sigaction(i32 noundef 3, %struct.sigaction* noundef nonnull %7, %struct.sigaction* noundef null) #7
  %65 = call i32 @sigprocmask(i32 noundef 2, %struct.__sigset_t* noundef nonnull %3, %struct.__sigset_t* noundef null) #7
  br label %71

66:                                               ; preds = %41
  %67 = call i32 @sigaction(i32 noundef 2, %struct.sigaction* noundef nonnull %6, %struct.sigaction* noundef null) #7
  %68 = call i32 @sigaction(i32 noundef 3, %struct.sigaction* noundef nonnull %7, %struct.sigaction* noundef null) #7
  %69 = call i32 @sigprocmask(i32 noundef 2, %struct.__sigset_t* noundef nonnull %3, %struct.__sigset_t* noundef null) #7
  %70 = tail call i32* @___errno_location() #8
  store i32 %51, i32* %70, align 4, !tbaa !3
  br label %71

71:                                               ; preds = %62, %66
  %72 = load i32, i32* %8, align 4, !tbaa !3
  br label %73

73:                                               ; preds = %1, %71
  %74 = phi i32 [ %72, %71 ], [ 1, %1 ]
  call void @llvm.lifetime.end.p0i8(i64 336, i8* nonnull %21) #5
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %20) #5
  call void @llvm.lifetime.end.p0i8(i64 152, i8* nonnull %19) #5
  call void @llvm.lifetime.end.p0i8(i64 152, i8* nonnull %18) #5
  call void @llvm.lifetime.end.p0i8(i64 152, i8* nonnull %14) #5
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %13) #5
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %12) #5
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %11) #5
  ret i32 %74
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: optsize
declare void @pthread_testcancel() local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @sigaction(i32 noundef, %struct.sigaction* noundef, %struct.sigaction* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @sigaddset(%struct.__sigset_t* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @sigprocmask(i32 noundef, %struct.__sigset_t* noundef, %struct.__sigset_t* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @sigemptyset(%struct.__sigset_t* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @posix_spawnattr_init(%struct.posix_spawnattr_t* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @posix_spawnattr_setsigmask(%struct.posix_spawnattr_t* noundef, %struct.__sigset_t* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @posix_spawnattr_setsigdefault(%struct.posix_spawnattr_t* noundef, %struct.__sigset_t* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @posix_spawnattr_setflags(%struct.posix_spawnattr_t* noundef, i16 noundef signext) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @posix_spawn(i32* noundef, i8* noundef, %struct.posix_spawn_file_actions_t* noundef, %struct.posix_spawnattr_t* noundef, i8** noundef, i8** noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @posix_spawnattr_destroy(%struct.posix_spawnattr_t* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @waitpid(i32 noundef, i32* noundef, i32 noundef) local_unnamed_addr #3

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
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!5, !5, i64 0}
!8 = !{!9, !9, i64 0}
!9 = !{!"any pointer", !5, i64 0}
