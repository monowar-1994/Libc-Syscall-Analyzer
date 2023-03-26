; ModuleID = 'src/misc/getopt.c'
source_filename = "src/misc/getopt.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }

@optind = local_unnamed_addr global i32 1, align 4
@opterr = local_unnamed_addr global i32 1, align 4
@__optreset = global i32 0, align 4
@__stderr_FILE = external hidden global %struct._IO_FILE, align 8
@__optpos = local_unnamed_addr global i32 0, align 4
@optarg = local_unnamed_addr global i8* null, align 8
@optopt = local_unnamed_addr global i32 0, align 4
@.str = private unnamed_addr constant [24 x i8] c": unrecognized option: \00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c": option requires an argument: \00", align 1

@optreset = weak alias i32, i32* @__optreset
@__posix_getopt = weak alias i32 (i32, i8**, i8*), i32 (i32, i8**, i8*)* @getopt

; Function Attrs: nounwind optsize strictfp
define hidden void @__getopt_msg(i8* noundef %0, i8* noundef %1, i8* noundef %2, i64 noundef %3) local_unnamed_addr #0 {
  %5 = tail call i8* @__lctrans_cur(i8* noundef %1) #3
  %6 = load volatile i32, i32* getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stderr_FILE, i64 0, i32 19), align 4, !tbaa !3
  %7 = icmp sgt i32 %6, -1
  br i1 %7, label %8, label %10

8:                                                ; preds = %4
  %9 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull @__stderr_FILE) #3
  br label %10

10:                                               ; preds = %4, %8
  %11 = phi i32 [ %9, %8 ], [ 0, %4 ]
  %12 = tail call i32 @fputs(i8* noundef %0, %struct._IO_FILE* noundef nonnull @__stderr_FILE) #3
  %13 = icmp sgt i32 %12, -1
  br i1 %13, label %14, label %23

14:                                               ; preds = %10
  %15 = tail call i64 @strlen(i8* noundef %5) #3
  %16 = tail call i64 @fwrite(i8* noundef %5, i64 noundef %15, i64 noundef 1, %struct._IO_FILE* noundef nonnull @__stderr_FILE) #3
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %23, label %18

18:                                               ; preds = %14
  %19 = tail call i64 @fwrite(i8* noundef %2, i64 noundef 1, i64 noundef %3, %struct._IO_FILE* noundef nonnull @__stderr_FILE) #3
  %20 = icmp eq i64 %19, %3
  br i1 %20, label %21, label %23

21:                                               ; preds = %18
  %22 = tail call i32 @putc(i32 noundef 10, %struct._IO_FILE* noundef nonnull @__stderr_FILE) #3
  br label %23

23:                                               ; preds = %21, %18, %14, %10
  %24 = icmp eq i32 %11, 0
  br i1 %24, label %26, label %25

25:                                               ; preds = %23
  tail call void @__unlockfile(%struct._IO_FILE* noundef nonnull @__stderr_FILE) #3
  br label %26

26:                                               ; preds = %25, %23
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i8* @__lctrans_cur(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @fputs(i8* noundef, %struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @fwrite(i8* noundef, i64 noundef, i64 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @putc(i32 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__unlockfile(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define i32 @getopt(i32 noundef %0, i8** nocapture noundef readonly %1, i8* noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %6) #4
  %7 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %7) #4
  %8 = load i32, i32* @optind, align 4, !tbaa !10
  %9 = icmp eq i32 %8, 0
  %10 = load i32, i32* @__optreset, align 4
  %11 = icmp ne i32 %10, 0
  %12 = select i1 %9, i1 true, i1 %11
  br i1 %12, label %13, label %14

13:                                               ; preds = %3
  store i32 0, i32* @__optreset, align 4, !tbaa !10
  store i32 0, i32* @__optpos, align 4, !tbaa !10
  store i32 1, i32* @optind, align 4, !tbaa !10
  br label %14

14:                                               ; preds = %3, %13
  %15 = phi i32 [ %8, %3 ], [ 1, %13 ]
  %16 = icmp slt i32 %15, %0
  br i1 %16, label %17, label %131

17:                                               ; preds = %14
  %18 = sext i32 %15 to i64
  %19 = getelementptr inbounds i8*, i8** %1, i64 %18
  %20 = load i8*, i8** %19, align 8, !tbaa !11
  %21 = icmp eq i8* %20, null
  br i1 %21, label %131, label %22

22:                                               ; preds = %17
  %23 = load i8, i8* %20, align 1, !tbaa !12
  %24 = icmp eq i8 %23, 45
  br i1 %24, label %30, label %25

25:                                               ; preds = %22
  %26 = load i8, i8* %2, align 1, !tbaa !12
  %27 = icmp eq i8 %26, 45
  br i1 %27, label %28, label %131

28:                                               ; preds = %25
  %29 = add nsw i32 %15, 1
  store i32 %29, i32* @optind, align 4, !tbaa !10
  store i8* %20, i8** @optarg, align 8, !tbaa !11
  br label %131

30:                                               ; preds = %22
  %31 = getelementptr inbounds i8, i8* %20, i64 1
  %32 = load i8, i8* %31, align 1, !tbaa !12
  switch i8 %32, label %39 [
    i8 0, label %131
    i8 45, label %33
  ]

33:                                               ; preds = %30
  %34 = getelementptr inbounds i8, i8* %20, i64 2
  %35 = load i8, i8* %34, align 1, !tbaa !12
  %36 = icmp eq i8 %35, 0
  br i1 %36, label %37, label %39

37:                                               ; preds = %33
  %38 = add nsw i32 %15, 1
  store i32 %38, i32* @optind, align 4, !tbaa !10
  br label %131

39:                                               ; preds = %30, %33
  %40 = load i32, i32* @__optpos, align 4, !tbaa !10
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %43

42:                                               ; preds = %39
  store i32 1, i32* @__optpos, align 4, !tbaa !10
  br label %43

43:                                               ; preds = %42, %39
  %44 = phi i32 [ 1, %42 ], [ %40, %39 ]
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i8, i8* %20, i64 %45
  %47 = call i32 @mbtowc(i32* noundef nonnull %4, i8* noundef nonnull %46, i64 noundef 4) #3
  %48 = icmp slt i32 %47, 0
  br i1 %48, label %49, label %50

49:                                               ; preds = %43
  store i32 65533, i32* %4, align 4, !tbaa !10
  br label %50

50:                                               ; preds = %49, %43
  %51 = phi i32 [ 1, %49 ], [ %47, %43 ]
  %52 = load i32, i32* @optind, align 4, !tbaa !10
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8*, i8** %1, i64 %53
  %55 = load i8*, i8** %54, align 8, !tbaa !11
  %56 = load i32, i32* @__optpos, align 4, !tbaa !10
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i8, i8* %55, i64 %57
  %59 = add nsw i32 %56, %51
  store i32 %59, i32* @__optpos, align 4, !tbaa !10
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i8, i8* %55, i64 %60
  %62 = load i8, i8* %61, align 1, !tbaa !12
  %63 = icmp eq i8 %62, 0
  br i1 %63, label %64, label %66

64:                                               ; preds = %50
  %65 = add nsw i32 %52, 1
  store i32 %65, i32* @optind, align 4, !tbaa !10
  store i32 0, i32* @__optpos, align 4, !tbaa !10
  br label %66

66:                                               ; preds = %64, %50
  %67 = load i8, i8* %2, align 1, !tbaa !12
  switch i8 %67, label %70 [
    i8 45, label %68
    i8 43, label %68
  ]

68:                                               ; preds = %66, %66
  %69 = getelementptr inbounds i8, i8* %2, i64 1
  br label %70

70:                                               ; preds = %66, %68
  %71 = phi i8* [ %69, %68 ], [ %2, %66 ]
  store i32 0, i32* %5, align 4, !tbaa !10
  br label %72

72:                                               ; preds = %72, %70
  %73 = phi i32 [ 0, %70 ], [ %79, %72 ]
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds i8, i8* %71, i64 %74
  %76 = call i32 @mbtowc(i32* noundef nonnull %5, i8* noundef nonnull %75, i64 noundef 4) #3
  %77 = icmp sgt i32 %76, 1
  %78 = select i1 %77, i32 %76, i32 1
  %79 = add nuw nsw i32 %78, %73
  %80 = icmp ne i32 %76, 0
  %81 = load i32, i32* %5, align 4
  %82 = load i32, i32* %4, align 4
  %83 = icmp ne i32 %81, %82
  %84 = select i1 %80, i1 %83, i1 false
  br i1 %84, label %72, label %85

85:                                               ; preds = %72
  %86 = icmp eq i32 %82, 58
  %87 = or i1 %83, %86
  br i1 %87, label %88, label %97

88:                                               ; preds = %85
  store i32 %82, i32* @optopt, align 4, !tbaa !10
  %89 = load i8, i8* %71, align 1, !tbaa !12
  %90 = icmp ne i8 %89, 58
  %91 = load i32, i32* @opterr, align 4
  %92 = icmp ne i32 %91, 0
  %93 = select i1 %90, i1 %92, i1 false
  br i1 %93, label %94, label %131

94:                                               ; preds = %88
  %95 = load i8*, i8** %1, align 8, !tbaa !11
  %96 = sext i32 %51 to i64
  call void @__getopt_msg(i8* noundef %95, i8* noundef getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i64 0, i64 0), i8* noundef %58, i64 noundef %96) #5
  br label %131

97:                                               ; preds = %85
  %98 = zext i32 %79 to i64
  %99 = getelementptr inbounds i8, i8* %71, i64 %98
  %100 = load i8, i8* %99, align 1, !tbaa !12
  %101 = icmp eq i8 %100, 58
  br i1 %101, label %102, label %131

102:                                              ; preds = %97
  store i8* null, i8** @optarg, align 8, !tbaa !11
  %103 = add nuw nsw i32 %79, 1
  %104 = zext i32 %103 to i64
  %105 = getelementptr inbounds i8, i8* %71, i64 %104
  %106 = load i8, i8* %105, align 1, !tbaa !12
  %107 = icmp ne i8 %106, 58
  %108 = load i32, i32* @__optpos, align 4
  %109 = icmp ne i32 %108, 0
  %110 = select i1 %107, i1 true, i1 %109
  %111 = load i32, i32* @optind, align 4, !tbaa !10
  br i1 %110, label %112, label %119

112:                                              ; preds = %102
  %113 = add nsw i32 %111, 1
  store i32 %113, i32* @optind, align 4, !tbaa !10
  %114 = sext i32 %111 to i64
  %115 = getelementptr inbounds i8*, i8** %1, i64 %114
  %116 = load i8*, i8** %115, align 8, !tbaa !11
  %117 = sext i32 %108 to i64
  %118 = getelementptr inbounds i8, i8* %116, i64 %117
  store i8* %118, i8** @optarg, align 8, !tbaa !11
  store i32 0, i32* @__optpos, align 4, !tbaa !10
  br label %119

119:                                              ; preds = %102, %112
  %120 = phi i32 [ %113, %112 ], [ %111, %102 ]
  %121 = icmp sgt i32 %120, %0
  br i1 %121, label %122, label %131

122:                                              ; preds = %119
  store i32 %81, i32* @optopt, align 4, !tbaa !10
  %123 = load i8, i8* %71, align 1, !tbaa !12
  %124 = icmp eq i8 %123, 58
  br i1 %124, label %131, label %125

125:                                              ; preds = %122
  %126 = load i32, i32* @opterr, align 4, !tbaa !10
  %127 = icmp eq i32 %126, 0
  br i1 %127, label %131, label %128

128:                                              ; preds = %125
  %129 = load i8*, i8** %1, align 8, !tbaa !11
  %130 = sext i32 %51 to i64
  call void @__getopt_msg(i8* noundef %129, i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0), i8* noundef %58, i64 noundef %130) #5
  br label %131

131:                                              ; preds = %97, %119, %125, %128, %122, %88, %94, %30, %25, %14, %17, %37, %28
  %132 = phi i32 [ 1, %28 ], [ -1, %37 ], [ -1, %17 ], [ -1, %14 ], [ -1, %25 ], [ -1, %30 ], [ 63, %94 ], [ 63, %88 ], [ 58, %122 ], [ 63, %128 ], [ 63, %125 ], [ %81, %119 ], [ %81, %97 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %7) #4
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %6) #4
  ret i32 %132
}

; Function Attrs: optsize
declare i32 @mbtowc(i32* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 140}
!4 = !{!"_IO_FILE", !5, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !9, i64 96, !8, i64 104, !8, i64 112, !5, i64 120, !5, i64 124, !9, i64 128, !5, i64 136, !5, i64 140, !5, i64 144, !8, i64 152, !9, i64 160, !8, i64 168, !8, i64 176, !8, i64 184, !9, i64 192, !9, i64 200, !8, i64 208, !8, i64 216, !8, i64 224}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{!5, !5, i64 0}
!11 = !{!8, !8, i64 0}
!12 = !{!6, !6, i64 0}
