; ModuleID = 'src/network/inet_ntop.c'
source_filename = "src/network/inet_ntop.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"%d.%d.%d.%d\00", align 1
@.str.1 = private unnamed_addr constant [13 x i8] c"\00\00\00\00\00\00\00\00\00\00\FF\FF\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"%x:%x:%x:%x:%x:%x:%x:%x\00", align 1
@.str.3 = private unnamed_addr constant [30 x i8] c"%x:%x:%x:%x:%x:%x:%d.%d.%d.%d\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c":0\00", align 1

; Function Attrs: nounwind optsize strictfp
define i8* @inet_ntop(i32 noundef %0, i8* noalias noundef %1, i8* noalias noundef %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = alloca [100 x i8], align 16
  %6 = getelementptr inbounds [100 x i8], [100 x i8]* %5, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 100, i8* nonnull %6) #4
  switch i32 %0, label %150 [
    i32 2, label %7
    i32 10, label %22
  ]

7:                                                ; preds = %4
  %8 = zext i32 %3 to i64
  %9 = load i8, i8* %1, align 1, !tbaa !3
  %10 = zext i8 %9 to i32
  %11 = getelementptr inbounds i8, i8* %1, i64 1
  %12 = load i8, i8* %11, align 1, !tbaa !3
  %13 = zext i8 %12 to i32
  %14 = getelementptr inbounds i8, i8* %1, i64 2
  %15 = load i8, i8* %14, align 1, !tbaa !3
  %16 = zext i8 %15 to i32
  %17 = getelementptr inbounds i8, i8* %1, i64 3
  %18 = load i8, i8* %17, align 1, !tbaa !3
  %19 = zext i8 %18 to i32
  %20 = tail call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef %2, i64 noundef %8, i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), i32 noundef %10, i32 noundef %13, i32 noundef %16, i32 noundef %19) #5
  %21 = icmp ult i32 %20, %3
  br i1 %21, label %154, label %152

22:                                               ; preds = %4
  %23 = tail call i32 @memcmp(i8* noundef %1, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0), i64 noundef 12) #5
  %24 = icmp eq i32 %23, 0
  %25 = load i8, i8* %1, align 1, !tbaa !3
  %26 = zext i8 %25 to i32
  %27 = shl nuw nsw i32 %26, 8
  %28 = getelementptr inbounds i8, i8* %1, i64 1
  %29 = load i8, i8* %28, align 1, !tbaa !3
  %30 = zext i8 %29 to i32
  %31 = or i32 %27, %30
  %32 = getelementptr inbounds i8, i8* %1, i64 2
  %33 = load i8, i8* %32, align 1, !tbaa !3
  %34 = zext i8 %33 to i32
  %35 = shl nuw nsw i32 %34, 8
  %36 = getelementptr inbounds i8, i8* %1, i64 3
  %37 = load i8, i8* %36, align 1, !tbaa !3
  %38 = zext i8 %37 to i32
  %39 = or i32 %35, %38
  %40 = getelementptr inbounds i8, i8* %1, i64 4
  %41 = load i8, i8* %40, align 1, !tbaa !3
  %42 = zext i8 %41 to i32
  %43 = shl nuw nsw i32 %42, 8
  %44 = getelementptr inbounds i8, i8* %1, i64 5
  %45 = load i8, i8* %44, align 1, !tbaa !3
  %46 = zext i8 %45 to i32
  %47 = or i32 %43, %46
  %48 = getelementptr inbounds i8, i8* %1, i64 6
  %49 = load i8, i8* %48, align 1, !tbaa !3
  %50 = zext i8 %49 to i32
  %51 = shl nuw nsw i32 %50, 8
  %52 = getelementptr inbounds i8, i8* %1, i64 7
  %53 = load i8, i8* %52, align 1, !tbaa !3
  %54 = zext i8 %53 to i32
  %55 = or i32 %51, %54
  %56 = getelementptr inbounds i8, i8* %1, i64 8
  %57 = load i8, i8* %56, align 1, !tbaa !3
  %58 = zext i8 %57 to i32
  %59 = shl nuw nsw i32 %58, 8
  %60 = getelementptr inbounds i8, i8* %1, i64 9
  %61 = load i8, i8* %60, align 1, !tbaa !3
  %62 = zext i8 %61 to i32
  %63 = or i32 %59, %62
  %64 = getelementptr inbounds i8, i8* %1, i64 10
  %65 = load i8, i8* %64, align 1, !tbaa !3
  %66 = zext i8 %65 to i32
  %67 = shl nuw nsw i32 %66, 8
  %68 = getelementptr inbounds i8, i8* %1, i64 11
  %69 = load i8, i8* %68, align 1, !tbaa !3
  %70 = zext i8 %69 to i32
  %71 = or i32 %67, %70
  %72 = getelementptr inbounds i8, i8* %1, i64 12
  %73 = load i8, i8* %72, align 1, !tbaa !3
  %74 = zext i8 %73 to i32
  br i1 %24, label %90, label %75

75:                                               ; preds = %22
  %76 = shl nuw nsw i32 %74, 8
  %77 = getelementptr inbounds i8, i8* %1, i64 13
  %78 = load i8, i8* %77, align 1, !tbaa !3
  %79 = zext i8 %78 to i32
  %80 = or i32 %76, %79
  %81 = getelementptr inbounds i8, i8* %1, i64 14
  %82 = load i8, i8* %81, align 1, !tbaa !3
  %83 = zext i8 %82 to i32
  %84 = shl nuw nsw i32 %83, 8
  %85 = getelementptr inbounds i8, i8* %1, i64 15
  %86 = load i8, i8* %85, align 1, !tbaa !3
  %87 = zext i8 %86 to i32
  %88 = or i32 %84, %87
  %89 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef nonnull %6, i64 noundef 100, i8* noundef getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i64 0, i64 0), i32 noundef %31, i32 noundef %39, i32 noundef %47, i32 noundef %55, i32 noundef %63, i32 noundef %71, i32 noundef %80, i32 noundef %88) #5
  br label %101

90:                                               ; preds = %22
  %91 = getelementptr inbounds i8, i8* %1, i64 13
  %92 = load i8, i8* %91, align 1, !tbaa !3
  %93 = zext i8 %92 to i32
  %94 = getelementptr inbounds i8, i8* %1, i64 14
  %95 = load i8, i8* %94, align 1, !tbaa !3
  %96 = zext i8 %95 to i32
  %97 = getelementptr inbounds i8, i8* %1, i64 15
  %98 = load i8, i8* %97, align 1, !tbaa !3
  %99 = zext i8 %98 to i32
  %100 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef nonnull %6, i64 noundef 100, i8* noundef getelementptr inbounds ([30 x i8], [30 x i8]* @.str.3, i64 0, i64 0), i32 noundef %31, i32 noundef %39, i32 noundef %47, i32 noundef %55, i32 noundef %63, i32 noundef %71, i32 noundef %74, i32 noundef %93, i32 noundef %96, i32 noundef %99) #5
  br label %101

101:                                              ; preds = %90, %75
  %102 = load i8, i8* %6, align 16, !tbaa !3
  %103 = icmp eq i8 %102, 0
  br i1 %103, label %144, label %104

104:                                              ; preds = %101, %120
  %105 = phi i64 [ %123, %120 ], [ 0, %101 ]
  %106 = phi i8 [ %125, %120 ], [ %102, %101 ]
  %107 = phi i8* [ %124, %120 ], [ %6, %101 ]
  %108 = phi i32 [ %122, %120 ], [ 0, %101 ]
  %109 = phi i32 [ %121, %120 ], [ 2, %101 ]
  %110 = icmp eq i64 %105, 0
  %111 = icmp eq i8 %106, 58
  %112 = select i1 %110, i1 true, i1 %111
  br i1 %112, label %113, label %120

113:                                              ; preds = %104
  %114 = call i64 @strspn(i8* noundef nonnull %107, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0)) #5
  %115 = trunc i64 %114 to i32
  %116 = icmp slt i32 %109, %115
  %117 = select i1 %116, i32 %115, i32 %109
  %118 = trunc i64 %105 to i32
  %119 = select i1 %116, i32 %118, i32 %108
  br label %120

120:                                              ; preds = %113, %104
  %121 = phi i32 [ %109, %104 ], [ %117, %113 ]
  %122 = phi i32 [ %108, %104 ], [ %119, %113 ]
  %123 = add nuw i64 %105, 1
  %124 = getelementptr inbounds [100 x i8], [100 x i8]* %5, i64 0, i64 %123
  %125 = load i8, i8* %124, align 1, !tbaa !3
  %126 = icmp eq i8 %125, 0
  br i1 %126, label %127, label %104

127:                                              ; preds = %120
  %128 = icmp sgt i32 %121, 3
  br i1 %128, label %129, label %144

129:                                              ; preds = %127
  %130 = trunc i64 %123 to i32
  %131 = add i32 %130, 1
  %132 = add nsw i32 %122, 1
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [100 x i8], [100 x i8]* %5, i64 0, i64 %133
  store i8 58, i8* %134, align 1, !tbaa !3
  %135 = sext i32 %122 to i64
  %136 = getelementptr inbounds [100 x i8], [100 x i8]* %5, i64 0, i64 %135
  store i8 58, i8* %136, align 1, !tbaa !3
  %137 = getelementptr inbounds i8, i8* %136, i64 2
  %138 = zext i32 %121 to i64
  %139 = getelementptr inbounds i8, i8* %136, i64 %138
  %140 = add i32 %121, %122
  %141 = sub i32 %131, %140
  %142 = sext i32 %141 to i64
  %143 = call i8* @memmove(i8* noundef nonnull %137, i8* noundef nonnull %139, i64 noundef %142) #5
  br label %144

144:                                              ; preds = %101, %129, %127
  %145 = call i64 @strlen(i8* noundef nonnull %6) #5
  %146 = zext i32 %3 to i64
  %147 = icmp ult i64 %145, %146
  br i1 %147, label %148, label %152

148:                                              ; preds = %144
  %149 = call i8* @strcpy(i8* noundef %2, i8* noundef nonnull %6) #5
  br label %154

150:                                              ; preds = %4
  %151 = tail call i32* @___errno_location() #6
  store i32 97, i32* %151, align 4, !tbaa !6
  br label %154

152:                                              ; preds = %144, %7
  %153 = tail call i32* @___errno_location() #6
  store i32 28, i32* %153, align 4, !tbaa !6
  br label %154

154:                                              ; preds = %7, %152, %150, %148
  %155 = phi i8* [ null, %150 ], [ %2, %148 ], [ null, %152 ], [ %2, %7 ]
  call void @llvm.lifetime.end.p0i8(i64 100, i8* nonnull %6) #4
  ret i8* %155
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @snprintf(i8* noundef, i64 noundef, i8* noundef, ...) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @memcmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @strspn(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memmove(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @strcpy(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

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
