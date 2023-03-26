; ModuleID = 'src/dirent/scandir.c'
source_filename = "src/dirent/scandir.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.dirent = type { i64, i64, i16, i8, [256 x i8] }
%struct.__dirstream = type opaque

@scandir64 = weak alias i32 (i8*, %struct.dirent***, i32 (%struct.dirent*)*, i32 (%struct.dirent**, %struct.dirent**)*), i32 (i8*, %struct.dirent***, i32 (%struct.dirent*)*, i32 (%struct.dirent**, %struct.dirent**)*)* @scandir

; Function Attrs: nounwind optsize strictfp
define i32 @scandir(i8* noundef %0, %struct.dirent*** nocapture noundef writeonly %1, i32 (%struct.dirent*)* noundef readonly %2, i32 (%struct.dirent**, %struct.dirent**)* noundef %3) #0 {
  %5 = tail call %struct.__dirstream* @opendir(i8* noundef %0) #3
  %6 = tail call i32* @___errno_location() #4
  %7 = load i32, i32* %6, align 4, !tbaa !3
  %8 = icmp eq %struct.__dirstream* %5, null
  br i1 %8, label %76, label %9

9:                                                ; preds = %4
  %10 = icmp eq i32 (%struct.dirent*)* %2, null
  br label %11

11:                                               ; preds = %9, %45
  %12 = phi %struct.dirent** [ null, %9 ], [ %36, %45 ]
  %13 = phi i64 [ 0, %9 ], [ %46, %45 ]
  %14 = phi i64 [ 0, %9 ], [ %37, %45 ]
  br label %15

15:                                               ; preds = %11, %19
  store i32 0, i32* %6, align 4, !tbaa !3
  %16 = tail call %struct.dirent* @readdir(%struct.__dirstream* noundef nonnull %5) #3
  %17 = icmp eq %struct.dirent* %16, null
  br i1 %17, label %51, label %18

18:                                               ; preds = %15
  br i1 %10, label %22, label %19

19:                                               ; preds = %18
  %20 = tail call i32 %2(%struct.dirent* noundef nonnull %16) #3
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %15, label %22

22:                                               ; preds = %19, %18
  %23 = icmp ult i64 %13, %14
  br i1 %23, label %35, label %24

24:                                               ; preds = %22
  %25 = shl i64 %14, 1
  %26 = or i64 %25, 1
  %27 = icmp ugt i64 %26, 2305843009213693951
  br i1 %27, label %51, label %28

28:                                               ; preds = %24
  %29 = bitcast %struct.dirent** %12 to i8*
  %30 = shl nuw i64 %26, 3
  %31 = tail call i8* @realloc(i8* noundef %29, i64 noundef %30) #3
  %32 = icmp eq i8* %31, null
  br i1 %32, label %51, label %33

33:                                               ; preds = %28
  %34 = bitcast i8* %31 to %struct.dirent**
  br label %35

35:                                               ; preds = %33, %22
  %36 = phi %struct.dirent** [ %34, %33 ], [ %12, %22 ]
  %37 = phi i64 [ %26, %33 ], [ %14, %22 ]
  %38 = getelementptr inbounds %struct.dirent, %struct.dirent* %16, i64 0, i32 2
  %39 = load i16, i16* %38, align 8, !tbaa !7
  %40 = zext i16 %39 to i64
  %41 = tail call i8* @malloc(i64 noundef %40) #3
  %42 = getelementptr inbounds %struct.dirent*, %struct.dirent** %36, i64 %13
  %43 = bitcast %struct.dirent** %42 to i8**
  store i8* %41, i8** %43, align 8, !tbaa !11
  %44 = icmp eq i8* %41, null
  br i1 %44, label %51, label %45

45:                                               ; preds = %35
  %46 = add i64 %13, 1
  %47 = bitcast %struct.dirent* %16 to i8*
  %48 = load i16, i16* %38, align 8, !tbaa !7
  %49 = zext i16 %48 to i64
  %50 = tail call i8* @memcpy(i8* noundef nonnull %41, i8* noundef nonnull %47, i64 noundef %49) #3
  br label %11

51:                                               ; preds = %35, %28, %24, %15
  %52 = phi %struct.dirent** [ %12, %15 ], [ %12, %28 ], [ %36, %35 ], [ %12, %24 ]
  %53 = tail call i32 @closedir(%struct.__dirstream* noundef nonnull %5) #3
  %54 = load i32, i32* %6, align 4, !tbaa !3
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %69, label %56

56:                                               ; preds = %51
  %57 = icmp eq %struct.dirent** %52, null
  %58 = icmp eq i64 %13, 0
  %59 = select i1 %57, i1 true, i1 %58
  br i1 %59, label %67, label %60

60:                                               ; preds = %56, %60
  %61 = phi i64 [ %62, %60 ], [ %13, %56 ]
  %62 = add i64 %61, -1
  %63 = getelementptr inbounds %struct.dirent*, %struct.dirent** %52, i64 %62
  %64 = bitcast %struct.dirent** %63 to i8**
  %65 = load i8*, i8** %64, align 8, !tbaa !11
  tail call void @free(i8* noundef %65) #3
  %66 = icmp eq i64 %62, 0
  br i1 %66, label %67, label %60

67:                                               ; preds = %60, %56
  %68 = bitcast %struct.dirent** %52 to i8*
  tail call void @free(i8* noundef %68) #3
  br label %76

69:                                               ; preds = %51
  store i32 %7, i32* %6, align 4, !tbaa !3
  %70 = icmp eq i32 (%struct.dirent**, %struct.dirent**)* %3, null
  br i1 %70, label %74, label %71

71:                                               ; preds = %69
  %72 = bitcast %struct.dirent** %52 to i8*
  %73 = bitcast i32 (%struct.dirent**, %struct.dirent**)* %3 to i32 (i8*, i8*)*
  tail call void @qsort(i8* noundef %72, i64 noundef %13, i64 noundef 8, i32 (i8*, i8*)* noundef nonnull %73) #3
  br label %74

74:                                               ; preds = %71, %69
  store %struct.dirent** %52, %struct.dirent*** %1, align 8, !tbaa !11
  %75 = trunc i64 %13 to i32
  br label %76

76:                                               ; preds = %4, %74, %67
  %77 = phi i32 [ -1, %67 ], [ %75, %74 ], [ -1, %4 ]
  ret i32 %77
}

; Function Attrs: optsize
declare %struct.__dirstream* @opendir(i8* noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

; Function Attrs: optsize
declare %struct.dirent* @readdir(%struct.__dirstream* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @realloc(i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @malloc(i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @closedir(%struct.__dirstream* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare void @qsort(i8* noundef, i64 noundef, i64 noundef, i32 (i8*, i8*)* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !10, i64 16}
!8 = !{!"dirent", !9, i64 0, !9, i64 8, !10, i64 16, !5, i64 18, !5, i64 19}
!9 = !{!"long", !5, i64 0}
!10 = !{!"short", !5, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"any pointer", !5, i64 0}
