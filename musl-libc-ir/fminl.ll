; ModuleID = 'src/math/fminl.c'
source_filename = "src/math/fminl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define x86_fp80 @fminl(x86_fp80 noundef %0, x86_fp80 noundef %1) local_unnamed_addr #0 {
  %3 = tail call i32 @__fpclassifyl(x86_fp80 noundef %0) #3
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %19, label %5

5:                                                ; preds = %2
  %6 = tail call i32 @__fpclassifyl(x86_fp80 noundef %1) #3
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %19, label %8

8:                                                ; preds = %5
  %9 = tail call i32 @__signbitl(x86_fp80 noundef %0) #3
  %10 = tail call i32 @__signbitl(x86_fp80 noundef %1) #3
  %11 = icmp eq i32 %9, %10
  br i1 %11, label %16, label %12

12:                                               ; preds = %8
  %13 = tail call i32 @__signbitl(x86_fp80 noundef %0) #3
  %14 = icmp eq i32 %13, 0
  %15 = select i1 %14, x86_fp80 %1, x86_fp80 %0
  br label %19

16:                                               ; preds = %8
  %17 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %0, x86_fp80 %1, metadata !"olt", metadata !"fpexcept.ignore") #4
  %18 = select i1 %17, x86_fp80 %0, x86_fp80 %1
  br label %19

19:                                               ; preds = %5, %2, %16, %12
  %20 = phi x86_fp80 [ %15, %12 ], [ %18, %16 ], [ %1, %2 ], [ %0, %5 ]
  ret x86_fp80 %20
}

; Function Attrs: optsize
declare i32 @__fpclassifyl(x86_fp80 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @__signbitl(x86_fp80 noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80, x86_fp80, metadata, metadata) #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
