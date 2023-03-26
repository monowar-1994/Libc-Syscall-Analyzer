; ModuleID = 'src/misc/mntent.c'
source_filename = "src/misc/mntent.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.mntent = type { i8*, i8*, i8*, i8*, i32, i32 }
%struct._IO_FILE = type opaque

@internal_buf = internal global i8* null, align 8
@internal_bufsize = internal global i64 0, align 8
@.str = private unnamed_addr constant [12 x i8] c"%*[^\0A]%*[\0A]\00", align 1
@.str.1 = private unnamed_addr constant [39 x i8] c" %n%*s%n %n%*s%n %n%*s%n %n%*s%n %d %d\00", align 1
@getmntent.mnt = internal global %struct.mntent zeroinitializer, align 8
@.str.2 = private unnamed_addr constant [19 x i8] c"%s\09%s\09%s\09%s\09%d\09%d\0A\00", align 1

; Function Attrs: nounwind optsize strictfp
define %struct._IO_FILE* @setmntent(i8* noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = tail call %struct._IO_FILE* @fopen(i8* noundef %0, i8* noundef %1) #4
  ret %struct._IO_FILE* %3
}

; Function Attrs: optsize
declare %struct._IO_FILE* @fopen(i8* noundef, i8* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i32 @endmntent(%struct._IO_FILE* noundef %0) local_unnamed_addr #0 {
  %2 = icmp eq %struct._IO_FILE* %0, null
  br i1 %2, label %5, label %3

3:                                                ; preds = %1
  %4 = tail call i32 @fclose(%struct._IO_FILE* noundef nonnull %0) #4
  br label %5

5:                                                ; preds = %3, %1
  ret i32 1
}

; Function Attrs: optsize
declare i32 @fclose(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define %struct.mntent* @getmntent_r(%struct._IO_FILE* noundef %0, %struct.mntent* noundef %1, i8* noundef %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = alloca [8 x i32], align 16
  %6 = bitcast [8 x i32]* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %6) #5
  %7 = icmp eq i8* %2, bitcast (i8** @internal_buf to i8*)
  %8 = getelementptr inbounds %struct.mntent, %struct.mntent* %1, i64 0, i32 4
  store i32 0, i32* %8, align 8, !tbaa !3
  %9 = getelementptr inbounds %struct.mntent, %struct.mntent* %1, i64 0, i32 5
  store i32 0, i32* %9, align 4, !tbaa !9
  %10 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 0
  %11 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 1
  %12 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 2
  %13 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 3
  %14 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 4
  %15 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 5
  %16 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 6
  %17 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 7
  br label %18

18:                                               ; preds = %47, %4
  %19 = phi i8* [ %2, %4 ], [ %26, %47 ]
  br i1 %7, label %20, label %23

20:                                               ; preds = %18
  %21 = call i64 @getline(i8** noundef nonnull @internal_buf, i64* noundef nonnull @internal_bufsize, %struct._IO_FILE* noundef %0) #4
  %22 = load i8*, i8** @internal_buf, align 8, !tbaa !10
  br label %25

23:                                               ; preds = %18
  %24 = call i8* @fgets(i8* noundef %19, i32 noundef %3, %struct._IO_FILE* noundef %0) #4
  br label %25

25:                                               ; preds = %23, %20
  %26 = phi i8* [ %22, %20 ], [ %19, %23 ]
  %27 = call i32 @feof(%struct._IO_FILE* noundef %0) #4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %77

29:                                               ; preds = %25
  %30 = call i32 @ferror(%struct._IO_FILE* noundef %0) #4
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %77

32:                                               ; preds = %29
  %33 = call i8* @strchr(i8* noundef %26, i32 noundef 10) #4
  %34 = icmp eq i8* %33, null
  br i1 %34, label %35, label %38

35:                                               ; preds = %32
  %36 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* noundef %0, i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0)) #4
  %37 = tail call i32* @___errno_location() #6
  store i32 34, i32* %37, align 4, !tbaa !11
  br label %77

38:                                               ; preds = %32
  %39 = call i32 (i8*, i8*, ...) @sscanf(i8* noundef %26, i8* noundef getelementptr inbounds ([39 x i8], [39 x i8]* @.str.1, i64 0, i64 0), i32* noundef nonnull %10, i32* noundef nonnull %11, i32* noundef nonnull %12, i32* noundef nonnull %13, i32* noundef nonnull %14, i32* noundef nonnull %15, i32* noundef nonnull %16, i32* noundef nonnull %17, i32* noundef nonnull %8, i32* noundef nonnull %9) #4
  %40 = icmp slt i32 %39, 2
  br i1 %40, label %47, label %41

41:                                               ; preds = %38
  %42 = load i32, i32* %10, align 16, !tbaa !11
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i8, i8* %26, i64 %43
  %45 = load i8, i8* %44, align 1, !tbaa !12
  %46 = icmp eq i8 %45, 35
  br i1 %46, label %47, label %48

47:                                               ; preds = %41, %38
  br label %18

48:                                               ; preds = %41
  %49 = load i32, i32* %11, align 4, !tbaa !11
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8, i8* %26, i64 %50
  store i8 0, i8* %51, align 1, !tbaa !12
  %52 = load i32, i32* %13, align 4, !tbaa !11
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8* %26, i64 %53
  store i8 0, i8* %54, align 1, !tbaa !12
  %55 = load i32, i32* %15, align 4, !tbaa !11
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i8, i8* %26, i64 %56
  store i8 0, i8* %57, align 1, !tbaa !12
  %58 = load i32, i32* %17, align 4, !tbaa !11
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i8, i8* %26, i64 %59
  store i8 0, i8* %60, align 1, !tbaa !12
  %61 = load i32, i32* %10, align 16, !tbaa !11
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8, i8* %26, i64 %62
  %64 = getelementptr inbounds %struct.mntent, %struct.mntent* %1, i64 0, i32 0
  store i8* %63, i8** %64, align 8, !tbaa !13
  %65 = load i32, i32* %12, align 8, !tbaa !11
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8* %26, i64 %66
  %68 = getelementptr inbounds %struct.mntent, %struct.mntent* %1, i64 0, i32 1
  store i8* %67, i8** %68, align 8, !tbaa !14
  %69 = load i32, i32* %14, align 16, !tbaa !11
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i8, i8* %26, i64 %70
  %72 = getelementptr inbounds %struct.mntent, %struct.mntent* %1, i64 0, i32 2
  store i8* %71, i8** %72, align 8, !tbaa !15
  %73 = load i32, i32* %16, align 8, !tbaa !11
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i8, i8* %26, i64 %74
  %76 = getelementptr inbounds %struct.mntent, %struct.mntent* %1, i64 0, i32 3
  store i8* %75, i8** %76, align 8, !tbaa !16
  br label %77

77:                                               ; preds = %25, %29, %48, %35
  %78 = phi %struct.mntent* [ %1, %48 ], [ null, %35 ], [ null, %29 ], [ null, %25 ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %6) #5
  ret %struct.mntent* %78
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: optsize
declare i64 @getline(i8** noundef, i64* noundef, %struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @fgets(i8* noundef, i32 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @feof(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @ferror(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @strchr(i8* noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @fscanf(%struct._IO_FILE* noundef, i8* noundef, ...) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @sscanf(i8* noundef, i8* noundef, ...) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind optsize strictfp
define %struct.mntent* @getmntent(%struct._IO_FILE* noundef %0) local_unnamed_addr #0 {
  %2 = tail call %struct.mntent* @getmntent_r(%struct._IO_FILE* noundef %0, %struct.mntent* noundef nonnull @getmntent.mnt, i8* noundef bitcast (i8** @internal_buf to i8*), i32 noundef 0) #7
  ret %struct.mntent* %2
}

; Function Attrs: nounwind optsize strictfp
define i32 @addmntent(%struct._IO_FILE* noundef %0, %struct.mntent* nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @fseek(%struct._IO_FILE* noundef %0, i64 noundef 0, i32 noundef 2) #4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %20

5:                                                ; preds = %2
  %6 = getelementptr inbounds %struct.mntent, %struct.mntent* %1, i64 0, i32 0
  %7 = load i8*, i8** %6, align 8, !tbaa !13
  %8 = getelementptr inbounds %struct.mntent, %struct.mntent* %1, i64 0, i32 1
  %9 = load i8*, i8** %8, align 8, !tbaa !14
  %10 = getelementptr inbounds %struct.mntent, %struct.mntent* %1, i64 0, i32 2
  %11 = load i8*, i8** %10, align 8, !tbaa !15
  %12 = getelementptr inbounds %struct.mntent, %struct.mntent* %1, i64 0, i32 3
  %13 = load i8*, i8** %12, align 8, !tbaa !16
  %14 = getelementptr inbounds %struct.mntent, %struct.mntent* %1, i64 0, i32 4
  %15 = load i32, i32* %14, align 8, !tbaa !3
  %16 = getelementptr inbounds %struct.mntent, %struct.mntent* %1, i64 0, i32 5
  %17 = load i32, i32* %16, align 4, !tbaa !9
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %0, i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.2, i64 0, i64 0), i8* noundef %7, i8* noundef %9, i8* noundef %11, i8* noundef %13, i32 noundef %15, i32 noundef %17) #4
  %19 = lshr i32 %18, 31
  br label %20

20:                                               ; preds = %2, %5
  %21 = phi i32 [ %19, %5 ], [ 1, %2 ]
  ret i32 %21
}

; Function Attrs: optsize
declare i32 @fseek(%struct._IO_FILE* noundef, i64 noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @fprintf(%struct._IO_FILE* noundef, i8* noundef, ...) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i8* @hasmntopt(%struct.mntent* nocapture noundef readonly %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.mntent, %struct.mntent* %0, i64 0, i32 3
  %4 = load i8*, i8** %3, align 8, !tbaa !16
  %5 = tail call i8* @strstr(i8* noundef %4, i8* noundef %1) #4
  ret i8* %5
}

; Function Attrs: optsize
declare i8* @strstr(i8* noundef, i8* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nounwind strictfp }
attributes #6 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #7 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !8, i64 32}
!4 = !{!"mntent", !5, i64 0, !5, i64 8, !5, i64 16, !5, i64 24, !8, i64 32, !8, i64 36}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"int", !6, i64 0}
!9 = !{!4, !8, i64 36}
!10 = !{!5, !5, i64 0}
!11 = !{!8, !8, i64 0}
!12 = !{!6, !6, i64 0}
!13 = !{!4, !5, i64 0}
!14 = !{!4, !5, i64 8}
!15 = !{!4, !5, i64 16}
!16 = !{!4, !5, i64 24}
