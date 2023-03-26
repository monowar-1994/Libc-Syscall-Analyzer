; ModuleID = 'src/stdio/popen.c'
source_filename = "src/stdio/popen.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque
%struct.posix_spawn_file_actions_t = type { [2 x i32], i8*, [16 x i32] }
%struct.posix_spawnattr_t = type { i32, i32, %struct.__sigset_t, %struct.__sigset_t, i32, i32, i8*, [56 x i8] }
%struct.__sigset_t = type { [16 x i64] }

@.str = private unnamed_addr constant [8 x i8] c"/bin/sh\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"sh\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"-c\00", align 1
@__environ = external local_unnamed_addr global i8**, align 8

; Function Attrs: nounwind optsize strictfp
define %struct._IO_FILE* @popen(i8* noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = alloca [2 x i32], align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.posix_spawn_file_actions_t, align 8
  %6 = alloca [4 x i8*], align 8
  %7 = bitcast [2 x i32]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %7) #4
  %8 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %8) #4
  %9 = bitcast %struct.posix_spawn_file_actions_t* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 80, i8* nonnull %9) #4
  %10 = load i8, i8* %1, align 1, !tbaa !3
  switch i8 %10, label %12 [
    i8 114, label %14
    i8 119, label %11
  ]

11:                                               ; preds = %2
  br label %14

12:                                               ; preds = %2
  %13 = tail call i32* @___errno_location() #5
  store i32 22, i32* %13, align 4, !tbaa !6
  br label %95

14:                                               ; preds = %2, %11
  %15 = phi i32 [ 1, %11 ], [ 0, %2 ]
  %16 = getelementptr inbounds [2 x i32], [2 x i32]* %3, i64 0, i64 0
  %17 = call i32 @pipe2(i32* noundef nonnull %16, i32 noundef 524288) #6
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %95

19:                                               ; preds = %14
  %20 = zext i32 %15 to i64
  %21 = getelementptr inbounds [2 x i32], [2 x i32]* %3, i64 0, i64 %20
  %22 = load i32, i32* %21, align 4, !tbaa !6
  %23 = call %struct._IO_FILE* @fdopen(i32 noundef %22, i8* noundef nonnull %1) #6
  %24 = icmp eq %struct._IO_FILE* %23, null
  br i1 %24, label %25, label %33

25:                                               ; preds = %19
  %26 = load i32, i32* %16, align 4, !tbaa !6
  %27 = sext i32 %26 to i64
  %28 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 3, i64 %27) #4, !srcloc !8
  %29 = getelementptr inbounds [2 x i32], [2 x i32]* %3, i64 0, i64 1
  %30 = load i32, i32* %29, align 4, !tbaa !6
  %31 = sext i32 %30 to i64
  %32 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 3, i64 %31) #4, !srcloc !8
  br label %95

33:                                               ; preds = %19
  %34 = call i32 @posix_spawn_file_actions_init(%struct.posix_spawn_file_actions_t* noundef nonnull %5) #6
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %85

36:                                               ; preds = %33
  %37 = call %struct._IO_FILE** @__ofl_lock() #6
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** %37, align 8, !tbaa !9
  %39 = icmp eq %struct._IO_FILE* %38, null
  br i1 %39, label %54, label %40

40:                                               ; preds = %36, %50
  %41 = phi %struct._IO_FILE* [ %52, %50 ], [ %38, %36 ]
  %42 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %41, i64 0, i32 16
  %43 = load i32, i32* %42, align 4, !tbaa !11
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %50, label %45

45:                                               ; preds = %40
  %46 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %41, i64 0, i32 15
  %47 = load i32, i32* %46, align 8, !tbaa !14
  %48 = call i32 @posix_spawn_file_actions_addclose(%struct.posix_spawn_file_actions_t* noundef nonnull %5, i32 noundef %47) #6
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %50, label %82

50:                                               ; preds = %40, %45
  %51 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %41, i64 0, i32 14
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** %51, align 8, !tbaa !9
  %53 = icmp eq %struct._IO_FILE* %52, null
  br i1 %53, label %54, label %40

54:                                               ; preds = %50, %36
  %55 = xor i32 %15, 1
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds [2 x i32], [2 x i32]* %3, i64 0, i64 %56
  %58 = load i32, i32* %57, align 4, !tbaa !6
  %59 = call i32 @posix_spawn_file_actions_adddup2(%struct.posix_spawn_file_actions_t* noundef nonnull %5, i32 noundef %58, i32 noundef %55) #6
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %82

61:                                               ; preds = %54
  %62 = getelementptr inbounds [4 x i8*], [4 x i8*]* %6, i64 0, i64 0
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i8** %62, align 8, !tbaa !9
  %63 = getelementptr inbounds [4 x i8*], [4 x i8*]* %6, i64 0, i64 1
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i8** %63, align 8, !tbaa !9
  %64 = getelementptr inbounds [4 x i8*], [4 x i8*]* %6, i64 0, i64 2
  store i8* %0, i8** %64, align 8, !tbaa !9
  %65 = getelementptr inbounds [4 x i8*], [4 x i8*]* %6, i64 0, i64 3
  store i8* null, i8** %65, align 8, !tbaa !9
  %66 = load i8**, i8*** @__environ, align 8, !tbaa !9
  %67 = call i32 @posix_spawn(i32* noundef nonnull %4, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), %struct.posix_spawn_file_actions_t* noundef nonnull %5, %struct.posix_spawnattr_t* noundef null, i8** noundef nonnull %62, i8** noundef %66) #6
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %82

69:                                               ; preds = %61
  %70 = call i32 @posix_spawn_file_actions_destroy(%struct.posix_spawn_file_actions_t* noundef nonnull %5) #6
  %71 = load i32, i32* %4, align 4, !tbaa !6
  %72 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %23, i64 0, i32 16
  store i32 %71, i32* %72, align 4, !tbaa !11
  %73 = call i8* @strchr(i8* noundef nonnull %1, i32 noundef 101) #6
  %74 = icmp eq i8* %73, null
  br i1 %74, label %75, label %78

75:                                               ; preds = %69
  %76 = load i32, i32* %21, align 4, !tbaa !6
  %77 = call i32 (i32, i32, ...) @fcntl(i32 noundef %76, i32 noundef 2, i32 noundef 0) #6
  br label %78

78:                                               ; preds = %75, %69
  %79 = load i32, i32* %57, align 4, !tbaa !6
  %80 = sext i32 %79 to i64
  %81 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 3, i64 %80) #4, !srcloc !8
  call void @__ofl_unlock() #6
  br label %95

82:                                               ; preds = %45, %54, %61
  %83 = phi i32 [ 12, %54 ], [ %67, %61 ], [ 12, %45 ]
  call void @__ofl_unlock() #6
  %84 = call i32 @posix_spawn_file_actions_destroy(%struct.posix_spawn_file_actions_t* noundef nonnull %5) #6
  br label %85

85:                                               ; preds = %82, %33
  %86 = phi i32 [ 12, %33 ], [ %83, %82 ]
  %87 = call i32 @fclose(%struct._IO_FILE* noundef nonnull %23) #6
  %88 = xor i32 %15, 1
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds [2 x i32], [2 x i32]* %3, i64 0, i64 %89
  %91 = load i32, i32* %90, align 4, !tbaa !6
  %92 = sext i32 %91 to i64
  %93 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 3, i64 %92) #4, !srcloc !8
  %94 = tail call i32* @___errno_location() #5
  store i32 %86, i32* %94, align 4, !tbaa !6
  br label %95

95:                                               ; preds = %14, %85, %78, %25, %12
  %96 = phi %struct._IO_FILE* [ null, %85 ], [ %23, %78 ], [ null, %25 ], [ null, %12 ], [ null, %14 ]
  call void @llvm.lifetime.end.p0i8(i64 80, i8* nonnull %9) #4
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %8) #4
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %7) #4
  ret %struct._IO_FILE* %96
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @pipe2(i32* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare %struct._IO_FILE* @fdopen(i32 noundef, i8* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @posix_spawn_file_actions_init(%struct.posix_spawn_file_actions_t* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden %struct._IO_FILE** @__ofl_lock() local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @posix_spawn_file_actions_addclose(%struct.posix_spawn_file_actions_t* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @posix_spawn_file_actions_adddup2(%struct.posix_spawn_file_actions_t* noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @posix_spawn(i32* noundef, i8* noundef, %struct.posix_spawn_file_actions_t* noundef, %struct.posix_spawnattr_t* noundef, i8** noundef, i8** noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @posix_spawn_file_actions_destroy(%struct.posix_spawn_file_actions_t* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @strchr(i8* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @fcntl(i32 noundef, i32 noundef, ...) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden void @__ofl_unlock() local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @fclose(%struct._IO_FILE* noundef) local_unnamed_addr #3

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
!8 = !{i64 143880}
!9 = !{!10, !10, i64 0}
!10 = !{!"any pointer", !4, i64 0}
!11 = !{!12, !7, i64 124}
!12 = !{!"_IO_FILE", !7, i64 0, !10, i64 8, !10, i64 16, !10, i64 24, !10, i64 32, !10, i64 40, !10, i64 48, !10, i64 56, !10, i64 64, !10, i64 72, !10, i64 80, !10, i64 88, !13, i64 96, !10, i64 104, !10, i64 112, !7, i64 120, !7, i64 124, !13, i64 128, !7, i64 136, !7, i64 140, !7, i64 144, !10, i64 152, !13, i64 160, !10, i64 168, !10, i64 176, !10, i64 184, !13, i64 192, !13, i64 200, !10, i64 208, !10, i64 216, !10, i64 224}
!13 = !{!"long", !4, i64 0}
!14 = !{!12, !7, i64 120}
