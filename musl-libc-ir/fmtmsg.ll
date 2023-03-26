; ModuleID = 'src/misc/fmtmsg.c'
source_filename = "src/misc/fmtmsg.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"MSGVERB\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"label\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"severity\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"text\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"action\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"tag\00", align 1
@.str.6 = private unnamed_addr constant [7 x i8] c"HALT: \00", align 1
@.str.7 = private unnamed_addr constant [8 x i8] c"ERROR: \00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c"WARNING: \00", align 1
@.str.9 = private unnamed_addr constant [7 x i8] c"INFO: \00", align 1
@.str.10 = private unnamed_addr constant [13 x i8] c"/dev/console\00", align 1
@.str.11 = private unnamed_addr constant [18 x i8] c"%s%s%s%s%s%s%s%s\0A\00", align 1
@.str.12 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.13 = private unnamed_addr constant [3 x i8] c": \00", align 1
@.str.14 = private unnamed_addr constant [10 x i8] c"\0ATO FIX: \00", align 1
@.str.15 = private unnamed_addr constant [2 x i8] c" \00", align 1
@reltable.fmtmsg = private unnamed_addr constant [4 x i32] [i32 trunc (i64 sub (i64 ptrtoint ([7 x i8]* @.str.6 to i64), i64 ptrtoint ([4 x i32]* @reltable.fmtmsg to i64)) to i32), i32 trunc (i64 sub (i64 ptrtoint ([8 x i8]* @.str.7 to i64), i64 ptrtoint ([4 x i32]* @reltable.fmtmsg to i64)) to i32), i32 trunc (i64 sub (i64 ptrtoint ([10 x i8]* @.str.8 to i64), i64 ptrtoint ([4 x i32]* @reltable.fmtmsg to i64)) to i32), i32 trunc (i64 sub (i64 ptrtoint ([7 x i8]* @.str.9 to i64), i64 ptrtoint ([4 x i32]* @reltable.fmtmsg to i64)) to i32)], align 4

; Function Attrs: nounwind optsize strictfp
define i32 @fmtmsg(i64 noundef %0, i8* noundef %1, i32 noundef %2, i8* noundef %3, i8* noundef %4, i8* noundef %5) local_unnamed_addr #0 {
  %7 = alloca [6 x i8*], align 16
  %8 = alloca i32, align 4
  %9 = tail call i8* @getenv(i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)) #5
  %10 = bitcast [6 x i8*]* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %10) #6
  %11 = getelementptr inbounds [6 x i8*], [6 x i8*]* %7, i64 0, i64 4
  %12 = bitcast i8** %11 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(48) %12, i8 0, i64 16, i1 false) #7
  %13 = getelementptr inbounds [6 x i8*], [6 x i8*]* %7, i64 0, i64 0
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i8** %13, align 16
  %14 = getelementptr inbounds [6 x i8*], [6 x i8*]* %7, i64 0, i64 1
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0), i8** %14, align 8
  %15 = getelementptr inbounds [6 x i8*], [6 x i8*]* %7, i64 0, i64 2
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i8** %15, align 16
  %16 = getelementptr inbounds [6 x i8*], [6 x i8*]* %7, i64 0, i64 3
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0), i8** %16, align 8
  %17 = getelementptr inbounds [6 x i8*], [6 x i8*]* %7, i64 0, i64 4
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i8** %17, align 16
  %18 = bitcast i32* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %18) #6
  %19 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %8) #5
  %20 = add i32 %2, -1
  %21 = icmp ult i32 %20, 4
  br i1 %21, label %22, label %26

22:                                               ; preds = %6
  %23 = sext i32 %20 to i64
  %24 = shl i64 %23, 2
  %25 = call i8* @llvm.load.relative.i64(i8* bitcast ([4 x i32]* @reltable.fmtmsg to i8*), i64 %24)
  br label %26

26:                                               ; preds = %6, %22
  %27 = phi i8* [ %25, %22 ], [ null, %6 ]
  %28 = and i64 %0, 512
  %29 = icmp eq i64 %28, 0
  br i1 %29, label %51, label %30

30:                                               ; preds = %26
  %31 = call i32 (i8*, i32, ...) @open(i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.10, i64 0, i64 0), i32 noundef 1) #5
  %32 = icmp slt i32 %31, 0
  br i1 %32, label %51, label %33

33:                                               ; preds = %30
  %34 = icmp eq i8* %1, null
  %35 = select i1 %34, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i64 0, i64 0), i8* %1
  %36 = select i1 %34, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13, i64 0, i64 0)
  %37 = icmp eq i32 %2, 0
  %38 = select i1 %37, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i64 0, i64 0), i8* %27
  %39 = icmp eq i8* %3, null
  %40 = select i1 %39, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i64 0, i64 0), i8* %3
  %41 = icmp eq i8* %4, null
  %42 = select i1 %41, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.14, i64 0, i64 0)
  %43 = select i1 %41, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i64 0, i64 0), i8* %4
  %44 = select i1 %41, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.15, i64 0, i64 0)
  %45 = icmp eq i8* %5, null
  %46 = select i1 %45, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i64 0, i64 0), i8* %5
  %47 = call i32 (i32, i8*, ...) @dprintf(i32 noundef %31, i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.11, i64 0, i64 0), i8* noundef %35, i8* noundef %36, i8* noundef %38, i8* noundef %40, i8* noundef %42, i8* noundef %43, i8* noundef %44, i8* noundef %46) #5
  %48 = icmp sgt i32 %47, 0
  %49 = select i1 %48, i32 0, i32 4
  %50 = call i32 @close(i32 noundef %31) #5
  br label %51

51:                                               ; preds = %30, %33, %26
  %52 = phi i32 [ %49, %33 ], [ 0, %26 ], [ 4, %30 ]
  %53 = and i64 %0, 256
  %54 = icmp eq i64 %53, 0
  br i1 %54, label %133, label %55

55:                                               ; preds = %51
  %56 = icmp eq i8* %9, null
  br i1 %56, label %98, label %57

57:                                               ; preds = %55, %89
  %58 = phi i8* [ %95, %89 ], [ %9, %55 ]
  %59 = phi i32 [ %92, %89 ], [ 0, %55 ]
  %60 = load i8, i8* %58, align 1, !tbaa !3
  %61 = icmp eq i8 %60, 0
  br i1 %61, label %96, label %62

62:                                               ; preds = %57, %84
  %63 = phi i64 [ %85, %84 ], [ 0, %57 ]
  %64 = phi i8* [ %87, %84 ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), %57 ]
  %65 = load i8, i8* %64, align 1, !tbaa !3
  %66 = icmp eq i8 %65, 0
  br i1 %66, label %80, label %67

67:                                               ; preds = %62, %75
  %68 = phi i8 [ %78, %75 ], [ %65, %62 ]
  %69 = phi i64 [ %76, %75 ], [ 0, %62 ]
  %70 = getelementptr inbounds i8, i8* %58, i64 %69
  %71 = load i8, i8* %70, align 1, !tbaa !3
  %72 = icmp ne i8 %71, 0
  %73 = icmp eq i8 %71, %68
  %74 = select i1 %72, i1 %73, i1 false
  br i1 %74, label %75, label %84

75:                                               ; preds = %67
  %76 = add i64 %69, 1
  %77 = getelementptr inbounds i8, i8* %64, i64 %76
  %78 = load i8, i8* %77, align 1, !tbaa !3
  %79 = icmp eq i8 %78, 0
  br i1 %79, label %80, label %67

80:                                               ; preds = %75, %62
  %81 = phi i64 [ 0, %62 ], [ %76, %75 ]
  %82 = getelementptr inbounds i8, i8* %58, i64 %81
  %83 = load i8, i8* %82, align 1, !tbaa !3
  switch i8 %83, label %84 [
    i8 58, label %89
    i8 0, label %89
  ]

84:                                               ; preds = %67, %80
  %85 = add nuw i64 %63, 1
  %86 = getelementptr inbounds [6 x i8*], [6 x i8*]* %7, i64 0, i64 %85
  %87 = load i8*, i8** %86, align 8, !tbaa !6
  %88 = icmp eq i8* %87, null
  br i1 %88, label %99, label %62

89:                                               ; preds = %80, %80
  %90 = trunc i64 %63 to i32
  %91 = shl nuw i32 1, %90
  %92 = or i32 %91, %59
  %93 = call i8* @strchr(i8* noundef nonnull %58, i32 noundef 58) #5
  %94 = icmp eq i8* %93, null
  %95 = getelementptr inbounds i8, i8* %93, i64 1
  br i1 %94, label %99, label %57

96:                                               ; preds = %57
  %97 = icmp eq i32 %59, 0
  br i1 %97, label %98, label %99

98:                                               ; preds = %55, %96
  br label %99

99:                                               ; preds = %89, %84, %98, %96
  %100 = phi i32 [ 255, %98 ], [ %59, %96 ], [ 255, %84 ], [ %92, %89 ]
  %101 = and i32 %100, 1
  %102 = icmp ne i32 %101, 0
  %103 = icmp ne i8* %1, null
  %104 = and i1 %103, %102
  %105 = select i1 %104, i8* %1, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i64 0, i64 0)
  %106 = select i1 %104, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i64 0, i64 0)
  %107 = and i32 %100, 2
  %108 = icmp ne i32 %107, 0
  %109 = icmp ne i32 %2, 0
  %110 = and i1 %109, %108
  %111 = select i1 %110, i8* %27, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i64 0, i64 0)
  %112 = and i32 %100, 4
  %113 = icmp ne i32 %112, 0
  %114 = icmp ne i8* %3, null
  %115 = and i1 %114, %113
  %116 = select i1 %115, i8* %3, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i64 0, i64 0)
  %117 = and i32 %100, 8
  %118 = icmp ne i32 %117, 0
  %119 = icmp ne i8* %4, null
  %120 = and i1 %119, %118
  %121 = select i1 %120, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.14, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i64 0, i64 0)
  %122 = select i1 %120, i8* %4, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i64 0, i64 0)
  %123 = select i1 %120, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.15, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i64 0, i64 0)
  %124 = and i32 %100, 16
  %125 = icmp ne i32 %124, 0
  %126 = icmp ne i8* %5, null
  %127 = and i1 %126, %125
  %128 = select i1 %127, i8* %5, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i64 0, i64 0)
  %129 = call i32 (i32, i8*, ...) @dprintf(i32 noundef 2, i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.11, i64 0, i64 0), i8* noundef %105, i8* noundef %106, i8* noundef %111, i8* noundef %116, i8* noundef %121, i8* noundef %122, i8* noundef %123, i8* noundef %128) #5
  %130 = icmp slt i32 %129, 1
  %131 = zext i1 %130 to i32
  %132 = or i32 %52, %131
  br label %133

133:                                              ; preds = %99, %51
  %134 = phi i32 [ %52, %51 ], [ %132, %99 ]
  %135 = and i32 %134, 5
  %136 = icmp eq i32 %135, 5
  %137 = select i1 %136, i32 -1, i32 %134
  %138 = load i32, i32* %8, align 4, !tbaa !8
  %139 = call i32 @pthread_setcancelstate(i32 noundef %138, i32* noundef null) #5
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %18) #6
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %10) #6
  ret i32 %137
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i8* @getenv(i8* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: optsize
declare i32 @pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @open(i8* noundef, i32 noundef, ...) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @dprintf(i32 noundef, i8* noundef, ...) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @close(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @strchr(i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nofree nosync nounwind readonly willreturn
declare i8* @llvm.load.relative.i64(i8*, i64) #4

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #4 = { argmemonly nofree nosync nounwind readonly willreturn }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nounwind strictfp }
attributes #7 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !4, i64 0}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !4, i64 0}
