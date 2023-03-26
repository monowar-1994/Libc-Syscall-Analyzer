; ModuleID = 'src/locale/textdomain.c'
source_filename = "src/locale/textdomain.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@current_domain = internal unnamed_addr global i8* null, align 8
@.str = private unnamed_addr constant [9 x i8] c"messages\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn
define i8* @__gettextdomain() local_unnamed_addr #0 {
  %1 = load i8*, i8** @current_domain, align 8, !tbaa !3
  %2 = icmp eq i8* %1, null
  %3 = select i1 %2, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i8* %1
  ret i8* %3
}

; Function Attrs: nounwind optsize strictfp
define i8* @textdomain(i8* noundef %0) local_unnamed_addr #1 {
  %2 = icmp eq i8* %0, null
  br i1 %2, label %3, label %7

3:                                                ; preds = %1
  %4 = load i8*, i8** @current_domain, align 8, !tbaa !3
  %5 = icmp eq i8* %4, null
  %6 = select i1 %5, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i8* %4
  br label %23

7:                                                ; preds = %1
  %8 = tail call i64 @strlen(i8* noundef nonnull %0) #4
  %9 = icmp ugt i64 %8, 255
  br i1 %9, label %10, label %12

10:                                               ; preds = %7
  %11 = tail call i32* @___errno_location() #5
  store i32 22, i32* %11, align 4, !tbaa !7
  br label %23

12:                                               ; preds = %7
  %13 = load i8*, i8** @current_domain, align 8, !tbaa !3
  %14 = icmp eq i8* %13, null
  br i1 %14, label %15, label %18

15:                                               ; preds = %12
  %16 = tail call i8* @malloc(i64 noundef 256) #4
  store i8* %16, i8** @current_domain, align 8, !tbaa !3
  %17 = icmp eq i8* %16, null
  br i1 %17, label %23, label %18

18:                                               ; preds = %15, %12
  %19 = phi i8* [ %16, %15 ], [ %13, %12 ]
  %20 = add nuw nsw i64 %8, 1
  %21 = tail call i8* @memcpy(i8* noundef nonnull %19, i8* noundef nonnull %0, i64 noundef %20) #4
  %22 = load i8*, i8** @current_domain, align 8, !tbaa !3
  br label %23

23:                                               ; preds = %10, %18, %15, %3
  %24 = phi i8* [ %6, %3 ], [ null, %10 ], [ %22, %18 ], [ null, %15 ]
  ret i8* %24
}

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @malloc(i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define i8* @gettext(i8* noundef %0) local_unnamed_addr #1 {
  %2 = tail call i8* @dgettext(i8* noundef null, i8* noundef %0) #4
  ret i8* %2
}

; Function Attrs: optsize
declare i8* @dgettext(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define i8* @ngettext(i8* noundef %0, i8* noundef %1, i64 noundef %2) local_unnamed_addr #1 {
  %4 = tail call i8* @dngettext(i8* noundef null, i8* noundef %0, i8* noundef %1, i64 noundef %2) #4
  ret i8* %4
}

; Function Attrs: optsize
declare i8* @dngettext(i8* noundef, i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
