; ModuleID = 'src/time/getdate.c'
source_filename = "src/time/getdate.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }
%struct._IO_FILE = type opaque

@getdate.tmbuf = internal global %struct.tm zeroinitializer, align 8
@.str = private unnamed_addr constant [8 x i8] c"DATEMSK\00", align 1
@getdate_err = local_unnamed_addr global i32 0, align 4
@.str.1 = private unnamed_addr constant [4 x i8] c"rbe\00", align 1

; Function Attrs: nounwind optsize strictfp
define %struct.tm* @getdate(i8* noundef %0) local_unnamed_addr #0 {
  %2 = alloca [100 x i8], align 16
  %3 = alloca i32, align 4
  %4 = tail call i8* @getenv(i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)) #4
  %5 = getelementptr inbounds [100 x i8], [100 x i8]* %2, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 100, i8* nonnull %5) #5
  %6 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %6) #5
  %7 = call i32 @pthread_setcancelstate(i32 noundef 0, i32* noundef nonnull %3) #4
  %8 = icmp eq i8* %4, null
  br i1 %8, label %9, label %10

9:                                                ; preds = %1
  store i32 1, i32* @getdate_err, align 4, !tbaa !3
  br label %38

10:                                               ; preds = %1
  %11 = call %struct._IO_FILE* @fopen(i8* noundef nonnull %4, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)) #4
  %12 = icmp eq %struct._IO_FILE* %11, null
  br i1 %12, label %16, label %13

13:                                               ; preds = %10
  %14 = call i8* @fgets(i8* noundef nonnull %5, i32 noundef 100, %struct._IO_FILE* noundef nonnull %11) #4
  %15 = icmp eq i8* %14, null
  br i1 %15, label %31, label %22

16:                                               ; preds = %10
  %17 = tail call i32* @___errno_location() #6
  %18 = load i32, i32* %17, align 4, !tbaa !3
  %19 = icmp eq i32 %18, 12
  br i1 %19, label %20, label %21

20:                                               ; preds = %16
  store i32 6, i32* @getdate_err, align 4, !tbaa !3
  br label %38

21:                                               ; preds = %16
  store i32 2, i32* @getdate_err, align 4, !tbaa !3
  br label %38

22:                                               ; preds = %13, %28
  %23 = call i8* @strptime(i8* noundef %0, i8* noundef nonnull %5, %struct.tm* noundef nonnull @getdate.tmbuf) #4
  %24 = icmp eq i8* %23, null
  br i1 %24, label %28, label %25

25:                                               ; preds = %22
  %26 = load i8, i8* %23, align 1, !tbaa !7
  %27 = icmp eq i8 %26, 0
  br i1 %27, label %35, label %28

28:                                               ; preds = %25, %22
  %29 = call i8* @fgets(i8* noundef nonnull %5, i32 noundef 100, %struct._IO_FILE* noundef nonnull %11) #4
  %30 = icmp eq i8* %29, null
  br i1 %30, label %31, label %22

31:                                               ; preds = %28, %13
  %32 = call i32 @ferror(%struct._IO_FILE* noundef nonnull %11) #4
  %33 = icmp eq i32 %32, 0
  %34 = select i1 %33, i32 7, i32 5
  store i32 %34, i32* @getdate_err, align 4, !tbaa !3
  br label %35

35:                                               ; preds = %25, %31
  %36 = phi %struct.tm* [ null, %31 ], [ @getdate.tmbuf, %25 ]
  %37 = call i32 @fclose(%struct._IO_FILE* noundef nonnull %11) #4
  br label %38

38:                                               ; preds = %9, %21, %20, %35
  %39 = phi %struct.tm* [ %36, %35 ], [ null, %20 ], [ null, %21 ], [ null, %9 ]
  %40 = load i32, i32* %3, align 4, !tbaa !3
  %41 = call i32 @pthread_setcancelstate(i32 noundef %40, i32* noundef null) #4
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %6) #5
  call void @llvm.lifetime.end.p0i8(i64 100, i8* nonnull %5) #5
  ret %struct.tm* %39
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i8* @getenv(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare %struct._IO_FILE* @fopen(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @fgets(i8* noundef, i32 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @strptime(i8* noundef, i8* noundef, %struct.tm* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @ferror(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @fclose(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nounwind strictfp }
attributes #6 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

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
