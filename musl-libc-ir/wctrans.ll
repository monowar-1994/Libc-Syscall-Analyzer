; ModuleID = 'src/ctype/wctrans.c'
source_filename = "src/ctype/wctrans.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__locale_struct = type opaque

@.str = private unnamed_addr constant [8 x i8] c"toupper\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"tolower\00", align 1

@wctrans_l = weak alias i32* (i8*, %struct.__locale_struct*), i32* (i8*, %struct.__locale_struct*)* @__wctrans_l
@towctrans_l = weak alias i32 (i32, i32*, %struct.__locale_struct*), i32 (i32, i32*, %struct.__locale_struct*)* @__towctrans_l

; Function Attrs: nounwind optsize strictfp
define i32* @wctrans(i8* noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @strcmp(i8* noundef %0, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)) #2
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %8, label %4

4:                                                ; preds = %1
  %5 = tail call i32 @strcmp(i8* noundef %0, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0)) #2
  %6 = icmp eq i32 %5, 0
  %7 = select i1 %6, i32* inttoptr (i64 2 to i32*), i32* null
  br label %8

8:                                                ; preds = %4, %1
  %9 = phi i32* [ inttoptr (i64 1 to i32*), %1 ], [ %7, %4 ]
  ret i32* %9
}

; Function Attrs: optsize
declare i32 @strcmp(i8* noundef, i8* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i32 @towctrans(i32 noundef %0, i32* noundef %1) local_unnamed_addr #0 {
  %3 = ptrtoint i32* %1 to i64
  switch i64 %3, label %8 [
    i64 1, label %4
    i64 2, label %6
  ]

4:                                                ; preds = %2
  %5 = tail call i32 @towupper(i32 noundef %0) #2
  br label %8

6:                                                ; preds = %2
  %7 = tail call i32 @towlower(i32 noundef %0) #2
  br label %8

8:                                                ; preds = %2, %6, %4
  %9 = phi i32 [ %5, %4 ], [ %7, %6 ], [ %0, %2 ]
  ret i32 %9
}

; Function Attrs: optsize
declare i32 @towupper(i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @towlower(i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i32* @__wctrans_l(i8* noundef %0, %struct.__locale_struct* nocapture readnone %1) #0 {
  %3 = tail call i32* @wctrans(i8* noundef %0) #3
  ret i32* %3
}

; Function Attrs: nounwind optsize strictfp
define i32 @__towctrans_l(i32 noundef %0, i32* noundef %1, %struct.__locale_struct* nocapture readnone %2) #0 {
  %4 = tail call i32 @towctrans(i32 noundef %0, i32* noundef %1) #3
  ret i32 %4
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
