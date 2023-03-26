; ModuleID = 'src/ctype/iswctype.c'
source_filename = "src/ctype/iswctype.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__locale_struct = type opaque

@wctype.names = internal constant [73 x i8] c"alnum\00alpha\00blank\00cntrl\00digit\00graph\00lower\00print\00punct\00space\00upper\00xdigit\00", align 16

@iswctype_l = weak alias i32 (i32, i64, %struct.__locale_struct*), i32 (i32, i64, %struct.__locale_struct*)* @__iswctype_l
@wctype_l = weak alias i64 (i8*, %struct.__locale_struct*), i64 (i8*, %struct.__locale_struct*)* @__wctype_l

; Function Attrs: nounwind optsize strictfp
define i32 @iswctype(i32 noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  switch i64 %1, label %29 [
    i64 1, label %3
    i64 2, label %5
    i64 3, label %7
    i64 4, label %9
    i64 5, label %11
    i64 6, label %15
    i64 7, label %17
    i64 8, label %19
    i64 9, label %21
    i64 10, label %23
    i64 11, label %25
    i64 12, label %27
  ]

3:                                                ; preds = %2
  %4 = tail call i32 @iswalnum(i32 noundef %0) #2
  br label %29

5:                                                ; preds = %2
  %6 = tail call i32 @iswalpha(i32 noundef %0) #2
  br label %29

7:                                                ; preds = %2
  %8 = tail call i32 @iswblank(i32 noundef %0) #2
  br label %29

9:                                                ; preds = %2
  %10 = tail call i32 @iswcntrl(i32 noundef %0) #2
  br label %29

11:                                               ; preds = %2
  %12 = add i32 %0, -48
  %13 = icmp ult i32 %12, 10
  %14 = zext i1 %13 to i32
  br label %29

15:                                               ; preds = %2
  %16 = tail call i32 @iswgraph(i32 noundef %0) #2
  br label %29

17:                                               ; preds = %2
  %18 = tail call i32 @iswlower(i32 noundef %0) #2
  br label %29

19:                                               ; preds = %2
  %20 = tail call i32 @iswprint(i32 noundef %0) #2
  br label %29

21:                                               ; preds = %2
  %22 = tail call i32 @iswpunct(i32 noundef %0) #2
  br label %29

23:                                               ; preds = %2
  %24 = tail call i32 @iswspace(i32 noundef %0) #2
  br label %29

25:                                               ; preds = %2
  %26 = tail call i32 @iswupper(i32 noundef %0) #2
  br label %29

27:                                               ; preds = %2
  %28 = tail call i32 @iswxdigit(i32 noundef %0) #2
  br label %29

29:                                               ; preds = %2, %27, %25, %23, %21, %19, %17, %15, %11, %9, %7, %5, %3
  %30 = phi i32 [ %28, %27 ], [ %26, %25 ], [ %24, %23 ], [ %22, %21 ], [ %20, %19 ], [ %18, %17 ], [ %16, %15 ], [ %14, %11 ], [ %10, %9 ], [ %8, %7 ], [ %6, %5 ], [ %4, %3 ], [ 0, %2 ]
  ret i32 %30
}

; Function Attrs: optsize
declare i32 @iswalnum(i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @iswalpha(i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @iswblank(i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @iswcntrl(i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @iswgraph(i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @iswlower(i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @iswprint(i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @iswpunct(i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @iswspace(i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @iswupper(i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @iswxdigit(i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i64 @wctype(i8* noundef %0) local_unnamed_addr #0 {
  br label %2

2:                                                ; preds = %1, %13
  %3 = phi i8 [ 97, %1 ], [ %16, %13 ]
  %4 = phi i8* [ getelementptr inbounds ([73 x i8], [73 x i8]* @wctype.names, i64 0, i64 0), %1 ], [ %15, %13 ]
  %5 = phi i32 [ 1, %1 ], [ %14, %13 ]
  %6 = load i8, i8* %0, align 1, !tbaa !3
  %7 = icmp eq i8 %6, %3
  br i1 %7, label %8, label %13

8:                                                ; preds = %2
  %9 = tail call i32 @strcmp(i8* noundef nonnull %0, i8* noundef nonnull %4) #2
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

11:                                               ; preds = %8
  %12 = zext i32 %5 to i64
  br label %18

13:                                               ; preds = %2, %8
  %14 = add nuw nsw i32 %5, 1
  %15 = getelementptr inbounds i8, i8* %4, i64 6
  %16 = load i8, i8* %15, align 1, !tbaa !3
  %17 = icmp eq i32 %14, 13
  br i1 %17, label %18, label %2

18:                                               ; preds = %13, %11
  %19 = phi i64 [ %12, %11 ], [ 0, %13 ]
  ret i64 %19
}

; Function Attrs: optsize
declare i32 @strcmp(i8* noundef, i8* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i32 @__iswctype_l(i32 noundef %0, i64 noundef %1, %struct.__locale_struct* nocapture readnone %2) #0 {
  %4 = tail call i32 @iswctype(i32 noundef %0, i64 noundef %1) #3
  ret i32 %4
}

; Function Attrs: nounwind optsize strictfp
define i64 @__wctype_l(i8* noundef %0, %struct.__locale_struct* nocapture readnone %1) #0 {
  %3 = tail call i64 @wctype(i8* noundef %0) #3
  ret i64 %3
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #3 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
