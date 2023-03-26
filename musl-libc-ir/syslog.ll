; ModuleID = 'src/misc/syslog.c'
source_filename = "src/misc/syslog.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i16, [9 x i8] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }
%struct.sockaddr = type { i16, [14 x i8] }

@lock = internal global [1 x i32] zeroinitializer, align 4
@__syslog_lockptr = hidden local_unnamed_addr constant i32* getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0), align 8
@log_mask = internal unnamed_addr global i32 255, align 4
@log_fd = internal unnamed_addr global i32 -1, align 4
@log_ident = internal global [32 x i8] zeroinitializer, align 16
@log_opt = internal unnamed_addr global i32 0, align 4
@log_facility = internal unnamed_addr global i32 8, align 4
@log_addr = internal constant %struct.anon { i16 1, [9 x i8] c"/dev/log\00" }, align 2
@.str = private unnamed_addr constant [9 x i8] c"%b %e %T\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"<%d>%s %n%s%s%.0d%s: \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@.str.4 = private unnamed_addr constant [13 x i8] c"/dev/console\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"%.*s\00", align 1

@vsyslog = weak alias void (i32, i8*, %struct.__va_list_tag*), void (i32, i8*, %struct.__va_list_tag*)* @__vsyslog

; Function Attrs: nounwind optsize strictfp
define i32 @setlogmask(i32 noundef %0) local_unnamed_addr #0 {
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #5
  %2 = load i32, i32* @log_mask, align 4, !tbaa !3
  %3 = icmp eq i32 %0, 0
  br i1 %3, label %5, label %4

4:                                                ; preds = %1
  store i32 %0, i32* @log_mask, align 4, !tbaa !3
  br label %5

5:                                                ; preds = %4, %1
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #5
  ret i32 %2
}

; Function Attrs: optsize
declare hidden void @__lock(i32* noundef) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: optsize
declare hidden void @__unlock(i32* noundef) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind optsize strictfp
define void @closelog() local_unnamed_addr #0 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #6
  %3 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %1) #5
  call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #5
  %4 = load i32, i32* @log_fd, align 4, !tbaa !3
  %5 = call i32 @close(i32 noundef %4) #5
  store i32 -1, i32* @log_fd, align 4, !tbaa !3
  call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #5
  %6 = load i32, i32* %1, align 4, !tbaa !3
  %7 = call i32 @pthread_setcancelstate(i32 noundef %6, i32* noundef null) #5
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #6
  ret void
}

; Function Attrs: optsize
declare i32 @pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @close(i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define void @openlog(i8* noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = alloca i32, align 4
  %5 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %5) #6
  %6 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %4) #5
  call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #5
  %7 = icmp eq i8* %0, null
  br i1 %7, label %12, label %8

8:                                                ; preds = %3
  %9 = call i64 @strnlen(i8* noundef nonnull %0, i64 noundef 31) #5
  %10 = call i8* @memcpy(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @log_ident, i64 0, i64 0), i8* noundef nonnull %0, i64 noundef %9) #5
  %11 = getelementptr inbounds [32 x i8], [32 x i8]* @log_ident, i64 0, i64 %9
  store i8 0, i8* %11, align 1, !tbaa !7
  br label %13

12:                                               ; preds = %3
  store i8 0, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @log_ident, i64 0, i64 0), align 16, !tbaa !7
  br label %13

13:                                               ; preds = %12, %8
  store i32 %1, i32* @log_opt, align 4, !tbaa !3
  store i32 %2, i32* @log_facility, align 4, !tbaa !3
  %14 = and i32 %1, 8
  %15 = icmp ne i32 %14, 0
  %16 = load i32, i32* @log_fd, align 4
  %17 = icmp slt i32 %16, 0
  %18 = select i1 %15, i1 %17, i1 false
  br i1 %18, label %19, label %20

19:                                               ; preds = %13
  call fastcc void @__openlog() #7
  br label %20

20:                                               ; preds = %19, %13
  call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #5
  %21 = load i32, i32* %4, align 4, !tbaa !3
  %22 = call i32 @pthread_setcancelstate(i32 noundef %21, i32* noundef null) #5
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %5) #6
  ret void
}

; Function Attrs: optsize
declare i64 @strnlen(i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define void @syslog(i32 noundef %0, i8* noundef %1, ...) local_unnamed_addr #0 {
  %3 = alloca [1 x %struct.__va_list_tag], align 16
  %4 = bitcast [1 x %struct.__va_list_tag]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %4) #6
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0
  call void @llvm.va_start(i8* nonnull %4) #8
  call void @__vsyslog(i32 noundef %0, i8* noundef %1, %struct.__va_list_tag* noundef nonnull %5) #7
  call void @llvm.va_end(i8* nonnull %4) #8
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %4) #6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #3

; Function Attrs: nounwind optsize strictfp
define internal void @__vsyslog(i32 noundef %0, i8* noundef %1, %struct.__va_list_tag* noundef %2) #0 {
  %4 = alloca [16 x i8], align 16
  %5 = alloca i64, align 8
  %6 = alloca %struct.tm, align 8
  %7 = alloca [1024 x i8], align 16
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = bitcast i32* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %10) #6
  %11 = load i32, i32* @log_mask, align 4, !tbaa !3
  %12 = and i32 %0, 7
  %13 = shl nuw nsw i32 1, %12
  %14 = and i32 %11, %13
  %15 = icmp ne i32 %14, 0
  %16 = icmp ult i32 %0, 1024
  %17 = and i1 %16, %15
  br i1 %17, label %18, label %113

18:                                               ; preds = %3
  %19 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %9) #5
  call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #5
  %20 = getelementptr inbounds [16 x i8], [16 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %20) #6
  %21 = bitcast i64* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %21) #6
  %22 = bitcast %struct.tm* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %22) #6
  %23 = getelementptr inbounds [1024 x i8], [1024 x i8]* %7, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 1024, i8* nonnull %23) #6
  %24 = tail call i32* @___errno_location() #9
  %25 = load i32, i32* %24, align 4, !tbaa !3
  %26 = bitcast i32* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %26) #6
  %27 = load i32, i32* @log_fd, align 4, !tbaa !3
  %28 = icmp slt i32 %27, 0
  br i1 %28, label %29, label %30

29:                                               ; preds = %18
  call fastcc void @__openlog() #5
  br label %30

30:                                               ; preds = %29, %18
  %31 = and i32 %0, 1016
  %32 = icmp eq i32 %31, 0
  %33 = load i32, i32* @log_facility, align 4
  %34 = select i1 %32, i32 %33, i32 0
  %35 = or i32 %34, %0
  %36 = call i64 @time(i64* noundef null) #5
  store i64 %36, i64* %5, align 8, !tbaa !8
  %37 = call %struct.tm* @gmtime_r(i64* noundef nonnull %5, %struct.tm* noundef nonnull %6) #5
  %38 = call i64 @strftime(i8* noundef nonnull %20, i64 noundef 16, i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), %struct.tm* noundef nonnull %6) #5
  %39 = load i32, i32* @log_opt, align 4, !tbaa !3
  %40 = and i32 %39, 1
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %44, label %42

42:                                               ; preds = %30
  %43 = call i32 @getpid() #5
  br label %44

44:                                               ; preds = %42, %30
  %45 = phi i32 [ %43, %42 ], [ 0, %30 ]
  %46 = icmp eq i32 %45, 0
  %47 = zext i1 %46 to i64
  %48 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.2, i64 0, i64 %47
  %49 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.3, i64 0, i64 %47
  %50 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef nonnull %23, i64 noundef 1024, i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0), i32 noundef %35, i8* noundef nonnull %20, i32* noundef nonnull %8, i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @log_ident, i64 0, i64 0), i8* noundef nonnull %48, i32 noundef %45, i8* noundef nonnull %49) #5
  store i32 %25, i32* %24, align 4, !tbaa !3
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [1024 x i8], [1024 x i8]* %7, i64 0, i64 %51
  %53 = sub nsw i64 1024, %51
  %54 = call i32 @vsnprintf(i8* noundef nonnull %52, i64 noundef %53, i8* noundef %1, %struct.__va_list_tag* noundef %2) #5
  %55 = icmp sgt i32 %54, -1
  br i1 %55, label %56, label %110

56:                                               ; preds = %44
  %57 = zext i32 %54 to i64
  %58 = icmp ugt i64 %53, %57
  %59 = add nsw i32 %54, %50
  %60 = select i1 %58, i32 %59, i32 1023
  %61 = add nsw i32 %60, -1
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [1024 x i8], [1024 x i8]* %7, i64 0, i64 %62
  %64 = load i8, i8* %63, align 1, !tbaa !7
  %65 = icmp eq i8 %64, 10
  br i1 %65, label %70, label %66

66:                                               ; preds = %56
  %67 = add nsw i32 %60, 1
  %68 = sext i32 %60 to i64
  %69 = getelementptr inbounds [1024 x i8], [1024 x i8]* %7, i64 0, i64 %68
  store i8 10, i8* %69, align 1, !tbaa !7
  br label %70

70:                                               ; preds = %66, %56
  %71 = phi i32 [ %67, %66 ], [ %60, %56 ]
  %72 = load i32, i32* @log_fd, align 4, !tbaa !3
  %73 = sext i32 %71 to i64
  %74 = call i64 @send(i32 noundef %72, i8* noundef nonnull %23, i64 noundef %73, i32 noundef 0) #5
  %75 = icmp slt i64 %74, 0
  br i1 %75, label %76, label %100

76:                                               ; preds = %70
  %77 = load i32, i32* %24, align 4, !tbaa !3
  switch i32 %77, label %86 [
    i32 111, label %78
    i32 107, label %78
    i32 104, label %78
    i32 32, label %78
  ]

78:                                               ; preds = %76, %76, %76, %76
  %79 = load i32, i32* @log_fd, align 4, !tbaa !3
  %80 = call i32 @connect(i32 noundef %79, %struct.sockaddr* noundef bitcast (%struct.anon* @log_addr to %struct.sockaddr*), i32 noundef 12) #5
  %81 = icmp slt i32 %80, 0
  br i1 %81, label %86, label %82

82:                                               ; preds = %78
  %83 = load i32, i32* @log_fd, align 4, !tbaa !3
  %84 = call i64 @send(i32 noundef %83, i8* noundef nonnull %23, i64 noundef %73, i32 noundef 0) #5
  %85 = icmp slt i64 %84, 0
  br i1 %85, label %86, label %100

86:                                               ; preds = %82, %78, %76
  %87 = load i32, i32* @log_opt, align 4, !tbaa !3
  %88 = and i32 %87, 2
  %89 = icmp eq i32 %88, 0
  br i1 %89, label %100, label %90

90:                                               ; preds = %86
  %91 = call i32 (i8*, i32, ...) @open(i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4, i64 0, i64 0), i32 noundef 524545) #5
  %92 = icmp sgt i32 %91, -1
  br i1 %92, label %93, label %100

93:                                               ; preds = %90
  %94 = load i32, i32* %8, align 4, !tbaa !3
  %95 = sub nsw i32 %71, %94
  %96 = sext i32 %94 to i64
  %97 = getelementptr inbounds [1024 x i8], [1024 x i8]* %7, i64 0, i64 %96
  %98 = call i32 (i32, i8*, ...) @dprintf(i32 noundef %91, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0), i32 noundef %95, i8* noundef nonnull %97) #5
  %99 = call i32 @close(i32 noundef %91) #5
  br label %100

100:                                              ; preds = %93, %90, %86, %82, %70
  %101 = load i32, i32* @log_opt, align 4, !tbaa !3
  %102 = and i32 %101, 32
  %103 = icmp eq i32 %102, 0
  br i1 %103, label %110, label %104

104:                                              ; preds = %100
  %105 = load i32, i32* %8, align 4, !tbaa !3
  %106 = sub nsw i32 %71, %105
  %107 = sext i32 %105 to i64
  %108 = getelementptr inbounds [1024 x i8], [1024 x i8]* %7, i64 0, i64 %107
  %109 = call i32 (i32, i8*, ...) @dprintf(i32 noundef 2, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0), i32 noundef %106, i8* noundef nonnull %108) #5
  br label %110

110:                                              ; preds = %44, %100, %104
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %26) #6
  call void @llvm.lifetime.end.p0i8(i64 1024, i8* nonnull %23) #6
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %22) #6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %21) #6
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %20) #6
  call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #5
  %111 = load i32, i32* %9, align 4, !tbaa !3
  %112 = call i32 @pthread_setcancelstate(i32 noundef %111, i32* noundef null) #5
  br label %113

113:                                              ; preds = %3, %110
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %10) #6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #3

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @__openlog() unnamed_addr #0 {
  %1 = tail call i32 @socket(i32 noundef 1, i32 noundef 524290, i32 noundef 0) #5
  store i32 %1, i32* @log_fd, align 4, !tbaa !3
  %2 = icmp sgt i32 %1, -1
  br i1 %2, label %3, label %5

3:                                                ; preds = %0
  %4 = tail call i32 @connect(i32 noundef %1, %struct.sockaddr* noundef bitcast (%struct.anon* @log_addr to %struct.sockaddr*), i32 noundef 12) #5
  br label %5

5:                                                ; preds = %3, %0
  ret void
}

; Function Attrs: optsize
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @connect(i32 noundef, %struct.sockaddr* noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #4

; Function Attrs: optsize
declare i64 @time(i64* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare %struct.tm* @gmtime_r(i64* noundef, %struct.tm* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i64 @strftime(i8* noundef, i64 noundef, i8* noundef, %struct.tm* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @getpid() local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @snprintf(i8* noundef, i64 noundef, i8* noundef, ...) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @vsnprintf(i8* noundef, i64 noundef, i8* noundef, %struct.__va_list_tag* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i64 @send(i32 noundef, i8* noundef, i64 noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @open(i8* noundef, i32 noundef, ...) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @dprintf(i32 noundef, i8* noundef, ...) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind willreturn }
attributes #4 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nounwind strictfp }
attributes #7 = { nobuiltin optsize strictfp "no-builtins" }
attributes #8 = { strictfp }
attributes #9 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

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
!9 = !{!"long", !5, i64 0}
