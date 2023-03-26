; ModuleID = 'src/temp/mkostemps.c'
source_filename = "src/temp/mkostemps.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"XXXXXX\00", align 1

@mkostemps = weak alias i32 (i8*, i32, i32), i32 (i8*, i32, i32)* @__mkostemps
@mkostemps64 = weak alias i32 (i8*, i32, i32), i32 (i8*, i32, i32)* @__mkostemps

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__mkostemps(i8* noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = tail call i64 @strlen(i8* noundef %0) #3
  %5 = icmp ult i64 %4, 6
  br i1 %5, label %17, label %6

6:                                                ; preds = %3
  %7 = sext i32 %1 to i64
  %8 = add i64 %4, -6
  %9 = icmp ult i64 %8, %7
  br i1 %9, label %17, label %10

10:                                               ; preds = %6
  %11 = getelementptr inbounds i8, i8* %0, i64 %4
  %12 = sub nsw i64 0, %7
  %13 = getelementptr inbounds i8, i8* %11, i64 %12
  %14 = getelementptr inbounds i8, i8* %13, i64 -6
  %15 = tail call i32 @memcmp(i8* noundef nonnull %14, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i64 noundef 6) #3
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %19, label %17

17:                                               ; preds = %10, %6, %3
  %18 = tail call i32* @___errno_location() #4
  store i32 22, i32* %18, align 4, !tbaa !3
  br label %36

19:                                               ; preds = %10
  %20 = and i32 %2, -2097348
  %21 = or i32 %20, 194
  br label %22

22:                                               ; preds = %30, %19
  %23 = phi i32 [ 100, %19 ], [ %28, %30 ]
  %24 = tail call i8* @__randname(i8* noundef nonnull %14) #3
  %25 = tail call i32 (i8*, i32, ...) @open(i8* noundef %0, i32 noundef %21, i32 noundef 384) #3
  %26 = icmp sgt i32 %25, -1
  br i1 %26, label %36, label %27

27:                                               ; preds = %22
  %28 = add nsw i32 %23, -1
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %34, label %30

30:                                               ; preds = %27
  %31 = tail call i32* @___errno_location() #4
  %32 = load i32, i32* %31, align 4, !tbaa !3
  %33 = icmp eq i32 %32, 17
  br i1 %33, label %22, label %34

34:                                               ; preds = %27, %30
  %35 = tail call i8* @memcpy(i8* noundef nonnull %14, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i64 noundef 6) #3
  br label %36

36:                                               ; preds = %22, %34, %17
  %37 = phi i32 [ -1, %17 ], [ -1, %34 ], [ %25, %22 ]
  ret i32 %37
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
declare i32 @open(i8* noundef, i32 noundef, ...) local_unnamed_addr #1

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
