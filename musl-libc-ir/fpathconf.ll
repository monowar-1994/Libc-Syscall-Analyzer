; ModuleID = 'src/conf/fpathconf.c'
source_filename = "src/conf/fpathconf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@fpathconf.values = internal unnamed_addr constant [21 x i16] [i16 8, i16 255, i16 255, i16 255, i16 4096, i16 4096, i16 1, i16 1, i16 0, i16 1, i16 -1, i16 -1, i16 -1, i16 64, i16 4096, i16 4096, i16 4096, i16 4096, i16 4096, i16 -1, i16 1], align 16

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn writeonly
define i64 @fpathconf(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp ugt i32 %1, 20
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  %5 = tail call i32* @___errno_location() #2
  store i32 22, i32* %5, align 4, !tbaa !3
  br label %11

6:                                                ; preds = %2
  %7 = zext i32 %1 to i64
  %8 = getelementptr inbounds [21 x i16], [21 x i16]* @fpathconf.values, i64 0, i64 %7
  %9 = load i16, i16* %8, align 2, !tbaa !7
  %10 = sext i16 %9 to i64
  br label %11

11:                                               ; preds = %6, %4
  %12 = phi i64 [ -1, %4 ], [ %10, %6 ]
  ret i64 %12
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #1

attributes #0 = { mustprogress nofree nosync nounwind optsize strictfp willreturn writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"short", !5, i64 0}
