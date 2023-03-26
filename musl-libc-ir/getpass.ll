; ModuleID = 'src/legacy/getpass.c'
source_filename = "src/legacy/getpass.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.termios = type { i32, i32, i32, i32, i8, [32 x i8], i32, i32 }

@getpass.password = internal global [128 x i8] zeroinitializer, align 16
@.str = private unnamed_addr constant [9 x i8] c"/dev/tty\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind optsize strictfp
define i8* @getpass(i8* noundef %0) local_unnamed_addr #0 {
  %2 = alloca %struct.termios, align 4
  %3 = alloca %struct.termios, align 4
  %4 = bitcast %struct.termios* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 60, i8* nonnull %4) #4
  %5 = bitcast %struct.termios* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 60, i8* nonnull %5) #4
  %6 = tail call i32 (i8*, i32, ...) @open(i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i32 noundef 524546) #5
  %7 = icmp slt i32 %6, 0
  br i1 %7, label %43, label %8

8:                                                ; preds = %1
  %9 = call i32 @tcgetattr(i32 noundef %6, %struct.termios* noundef nonnull %3) #5
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(60) %4, i8* noundef nonnull align 4 dereferenceable(60) %5, i64 60, i1 false) #6, !tbaa.struct !3
  %10 = getelementptr inbounds %struct.termios, %struct.termios* %3, i64 0, i32 3
  %11 = load i32, i32* %10, align 4, !tbaa !9
  %12 = and i32 %11, -12
  %13 = or i32 %12, 2
  store i32 %13, i32* %10, align 4, !tbaa !9
  %14 = getelementptr inbounds %struct.termios, %struct.termios* %3, i64 0, i32 0
  %15 = load i32, i32* %14, align 4, !tbaa !11
  %16 = and i32 %15, -449
  %17 = or i32 %16, 256
  store i32 %17, i32* %14, align 4, !tbaa !11
  %18 = call i32 @tcsetattr(i32 noundef %6, i32 noundef 2, %struct.termios* noundef nonnull %3) #5
  %19 = call i32 @tcdrain(i32 noundef %6) #5
  %20 = call i32 (i32, i8*, ...) @dprintf(i32 noundef %6, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i8* noundef %0) #5
  %21 = call i64 @read(i32 noundef %6, i8* noundef getelementptr inbounds ([128 x i8], [128 x i8]* @getpass.password, i64 0, i64 0), i64 noundef 128) #5
  %22 = icmp sgt i64 %21, -1
  br i1 %22, label %23, label %36

23:                                               ; preds = %8
  %24 = icmp eq i64 %21, 0
  br i1 %24, label %33, label %25

25:                                               ; preds = %23
  %26 = add nsw i64 %21, -1
  %27 = getelementptr inbounds [128 x i8], [128 x i8]* @getpass.password, i64 0, i64 %26
  %28 = load i8, i8* %27, align 1, !tbaa !8
  %29 = icmp eq i8 %28, 10
  %30 = icmp eq i64 %21, 128
  %31 = select i1 %29, i1 true, i1 %30
  %32 = select i1 %31, i64 %26, i64 %21
  br label %33

33:                                               ; preds = %25, %23
  %34 = phi i64 [ 0, %23 ], [ %32, %25 ]
  %35 = getelementptr inbounds [128 x i8], [128 x i8]* @getpass.password, i64 0, i64 %34
  store i8 0, i8* %35, align 1, !tbaa !8
  br label %36

36:                                               ; preds = %33, %8
  %37 = phi i64 [ %34, %33 ], [ %21, %8 ]
  %38 = call i32 @tcsetattr(i32 noundef %6, i32 noundef 2, %struct.termios* noundef nonnull %2) #5
  %39 = call i32 (i32, i8*, ...) @dprintf(i32 noundef %6, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)) #5
  %40 = call i32 @close(i32 noundef %6) #5
  %41 = icmp slt i64 %37, 0
  %42 = select i1 %41, i8* null, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @getpass.password, i64 0, i64 0)
  br label %43

43:                                               ; preds = %1, %36
  %44 = phi i8* [ %42, %36 ], [ null, %1 ]
  call void @llvm.lifetime.end.p0i8(i64 60, i8* nonnull %5) #4
  call void @llvm.lifetime.end.p0i8(i64 60, i8* nonnull %4) #4
  ret i8* %44
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @open(i8* noundef, i32 noundef, ...) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @tcgetattr(i32 noundef, %struct.termios* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: optsize
declare i32 @tcsetattr(i32 noundef, i32 noundef, %struct.termios* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @tcdrain(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @dprintf(i32 noundef, i8* noundef, ...) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @read(i32 noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @close(i32 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 0, i64 4, !4, i64 4, i64 4, !4, i64 8, i64 4, !4, i64 12, i64 4, !4, i64 16, i64 1, !8, i64 17, i64 32, !8, i64 52, i64 4, !4, i64 56, i64 4, !4}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!6, !6, i64 0}
!9 = !{!10, !5, i64 12}
!10 = !{!"termios", !5, i64 0, !5, i64 4, !5, i64 8, !5, i64 12, !6, i64 16, !6, i64 17, !5, i64 52, !5, i64 56}
!11 = !{!10, !5, i64 0}
