; ModuleID = 'src/env/clearenv.c'
source_filename = "src/env/clearenv.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__environ = external local_unnamed_addr global i8**, align 8

@__env_rm_add = weak hidden alias void (i8*, i8*), void (i8*, i8*)* @dummy

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal void @dummy(i8* nocapture noundef %0, i8* nocapture noundef %1) #0 {
  ret void
}

; Function Attrs: nounwind optsize strictfp
define i32 @clearenv() local_unnamed_addr #1 {
  %1 = load i8**, i8*** @__environ, align 8, !tbaa !3
  store i8** null, i8*** @__environ, align 8, !tbaa !3
  %2 = icmp eq i8** %1, null
  br i1 %2, label %12, label %3

3:                                                ; preds = %0
  %4 = load i8*, i8** %1, align 8, !tbaa !3
  %5 = icmp eq i8* %4, null
  br i1 %5, label %12, label %6

6:                                                ; preds = %3, %6
  %7 = phi i8* [ %10, %6 ], [ %4, %3 ]
  %8 = phi i8** [ %9, %6 ], [ %1, %3 ]
  %9 = getelementptr inbounds i8*, i8** %8, i64 1
  tail call void @__env_rm_add(i8* noundef nonnull %7, i8* noundef null) #2
  %10 = load i8*, i8** %9, align 8, !tbaa !3
  %11 = icmp eq i8* %10, null
  br i1 %11, label %12, label %6

12:                                               ; preds = %6, %3, %0
  ret i32 0
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
