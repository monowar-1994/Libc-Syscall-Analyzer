; ModuleID = 'src/conf/confstr.c'
source_filename = "src/conf/confstr.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"/bin:/usr/bin\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

; Function Attrs: nounwind optsize strictfp
define i64 @confstr(i32 noundef %0, i8* noundef %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = icmp eq i32 %0, 0
  br i1 %4, label %13, label %5

5:                                                ; preds = %3
  %6 = and i32 %0, -5
  %7 = icmp ne i32 %6, 1
  %8 = add i32 %0, -1150
  %9 = icmp ult i32 %8, -34
  %10 = and i1 %7, %9
  br i1 %10, label %11, label %13

11:                                               ; preds = %5
  %12 = tail call i32* @___errno_location() #3
  store i32 22, i32* %12, align 4, !tbaa !3
  br label %18

13:                                               ; preds = %3, %5
  %14 = phi i8* [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i64 0, i64 0), %5 ], [ getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), %3 ]
  %15 = tail call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef %1, i64 noundef %2, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i8* noundef nonnull %14) #4
  %16 = add nsw i32 %15, 1
  %17 = sext i32 %16 to i64
  br label %18

18:                                               ; preds = %13, %11
  %19 = phi i64 [ 0, %11 ], [ %17, %13 ]
  ret i64 %19
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @snprintf(i8* noundef, i64 noundef, i8* noundef, ...) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
