; ModuleID = 'src/multibyte/c16rtomb.c'
source_filename = "src/multibyte/c16rtomb.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__mbstate_t = type { i32, i32 }

@c16rtomb.internal_state = internal unnamed_addr global i32 0, align 4

; Function Attrs: nounwind optsize strictfp
define i64 @c16rtomb(i8* noalias noundef %0, i16 noundef zeroext %1, %struct.__mbstate_t* noalias noundef %2) local_unnamed_addr #0 {
  %4 = icmp eq %struct.__mbstate_t* %2, null
  %5 = select i1 %4, %struct.__mbstate_t* bitcast (i32* @c16rtomb.internal_state to %struct.__mbstate_t*), %struct.__mbstate_t* %2
  %6 = getelementptr %struct.__mbstate_t, %struct.__mbstate_t* %5, i64 0, i32 0
  %7 = icmp eq i8* %0, null
  %8 = load i32, i32* %6, align 4, !tbaa !3
  %9 = icmp eq i32 %8, 0
  br i1 %7, label %10, label %11

10:                                               ; preds = %3
  br i1 %9, label %29, label %27

11:                                               ; preds = %3
  %12 = zext i16 %1 to i32
  %13 = and i32 %12, 64512
  br i1 %9, label %14, label %19

14:                                               ; preds = %11
  %15 = icmp eq i32 %13, 55296
  br i1 %15, label %16, label %24

16:                                               ; preds = %14
  %17 = shl nuw nsw i32 %12, 10
  %18 = add nsw i32 %17, -56557568
  store i32 %18, i32* %6, align 4, !tbaa !3
  br label %29

19:                                               ; preds = %11
  %20 = icmp eq i32 %13, 56320
  br i1 %20, label %21, label %27

21:                                               ; preds = %19
  %22 = add nsw i32 %12, -56320
  %23 = add i32 %22, %8
  store i32 0, i32* %6, align 4, !tbaa !3
  br label %24

24:                                               ; preds = %14, %21
  %25 = phi i32 [ %23, %21 ], [ %12, %14 ]
  %26 = tail call i64 @wcrtomb(i8* noundef nonnull %0, i32 noundef %25, %struct.__mbstate_t* noundef null) #3
  br label %29

27:                                               ; preds = %19, %10
  store i32 0, i32* %6, align 4, !tbaa !3
  %28 = tail call i32* @___errno_location() #4
  store i32 84, i32* %28, align 4, !tbaa !3
  br label %29

29:                                               ; preds = %10, %27, %24, %16
  %30 = phi i64 [ -1, %27 ], [ %26, %24 ], [ 0, %16 ], [ 1, %10 ]
  ret i64 %30
}

; Function Attrs: optsize
declare i64 @wcrtomb(i8* noundef, i32 noundef, %struct.__mbstate_t* noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

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
