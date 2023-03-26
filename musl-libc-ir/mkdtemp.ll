; ModuleID = 'src/temp/mkdtemp.c'
source_filename = "src/temp/mkdtemp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"XXXXXX\00", align 1

; Function Attrs: nounwind optsize strictfp
define i8* @mkdtemp(i8* noundef %0) local_unnamed_addr #0 {
  %2 = tail call i64 @strlen(i8* noundef %0) #3
  %3 = icmp ult i64 %2, 6
  br i1 %3, label %9, label %4

4:                                                ; preds = %1
  %5 = getelementptr inbounds i8, i8* %0, i64 %2
  %6 = getelementptr inbounds i8, i8* %5, i64 -6
  %7 = tail call i32 @memcmp(i8* noundef nonnull %6, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i64 noundef 6) #3
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %11, label %9

9:                                                ; preds = %4, %1
  %10 = tail call i32* @___errno_location() #4
  store i32 22, i32* %10, align 4, !tbaa !3
  br label %25

11:                                               ; preds = %4, %19
  %12 = phi i32 [ %17, %19 ], [ 100, %4 ]
  %13 = tail call i8* @__randname(i8* noundef nonnull %6) #3
  %14 = tail call i32 @mkdir(i8* noundef %0, i32 noundef 448) #3
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %25, label %16

16:                                               ; preds = %11
  %17 = add nsw i32 %12, -1
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %23, label %19

19:                                               ; preds = %16
  %20 = tail call i32* @___errno_location() #4
  %21 = load i32, i32* %20, align 4, !tbaa !3
  %22 = icmp eq i32 %21, 17
  br i1 %22, label %11, label %23

23:                                               ; preds = %16, %19
  %24 = tail call i8* @memcpy(i8* noundef nonnull %6, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i64 noundef 6) #3
  br label %25

25:                                               ; preds = %11, %23, %9
  %26 = phi i8* [ null, %9 ], [ null, %23 ], [ %0, %11 ]
  ret i8* %26
}

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @memcmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i8* @__randname(i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @mkdir(i8* noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

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
