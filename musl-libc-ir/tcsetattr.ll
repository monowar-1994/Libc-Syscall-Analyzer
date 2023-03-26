; ModuleID = 'src/termios/tcsetattr.c'
source_filename = "src/termios/tcsetattr.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.termios = type { i32, i32, i32, i32, i8, [32 x i8], i32, i32 }

; Function Attrs: nounwind optsize strictfp
define i32 @tcsetattr(i32 noundef %0, i32 noundef %1, %struct.termios* noundef %2) local_unnamed_addr #0 {
  %4 = icmp ugt i32 %1, 2
  br i1 %4, label %5, label %7

5:                                                ; preds = %3
  %6 = tail call i32* @___errno_location() #3
  store i32 22, i32* %6, align 4, !tbaa !3
  br label %10

7:                                                ; preds = %3
  %8 = add nuw nsw i32 %1, 21506
  %9 = tail call i32 (i32, i32, ...) @ioctl(i32 noundef %0, i32 noundef %8, %struct.termios* noundef %2) #4
  br label %10

10:                                               ; preds = %7, %5
  %11 = phi i32 [ -1, %5 ], [ %9, %7 ]
  ret i32 %11
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @ioctl(i32 noundef, i32 noundef, ...) local_unnamed_addr #2

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
