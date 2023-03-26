; ModuleID = 'src/termios/cfsetospeed.c'
source_filename = "src/termios/cfsetospeed.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.termios = type { i32, i32, i32, i32, i8, [32 x i8], i32, i32 }

@cfsetspeed = weak alias i32 (%struct.termios*, i32), i32 (%struct.termios*, i32)* @cfsetospeed

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define i32 @cfsetospeed(%struct.termios* nocapture noundef %0, i32 noundef %1) #0 {
  %3 = and i32 %1, -4112
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %7, label %5

5:                                                ; preds = %2
  %6 = tail call i32* @___errno_location() #2
  store i32 22, i32* %6, align 4, !tbaa !3
  br label %12

7:                                                ; preds = %2
  %8 = getelementptr inbounds %struct.termios, %struct.termios* %0, i64 0, i32 2
  %9 = load i32, i32* %8, align 4, !tbaa !7
  %10 = and i32 %9, -4112
  %11 = or i32 %10, %1
  store i32 %11, i32* %8, align 4, !tbaa !7
  br label %12

12:                                               ; preds = %7, %5
  %13 = phi i32 [ -1, %5 ], [ 0, %7 ]
  ret i32 %13
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define i32 @cfsetispeed(%struct.termios* nocapture noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp eq i32 %1, 0
  br i1 %3, label %14, label %4

4:                                                ; preds = %2
  %5 = and i32 %1, -4112
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %9, label %7

7:                                                ; preds = %4
  %8 = tail call i32* @___errno_location() #2
  store i32 22, i32* %8, align 4, !tbaa !3
  br label %14

9:                                                ; preds = %4
  %10 = getelementptr inbounds %struct.termios, %struct.termios* %0, i64 0, i32 2
  %11 = load i32, i32* %10, align 4, !tbaa !7
  %12 = and i32 %11, -4112
  %13 = or i32 %12, %1
  store i32 %13, i32* %10, align 4, !tbaa !7
  br label %14

14:                                               ; preds = %9, %7, %2
  %15 = phi i32 [ 0, %2 ], [ -1, %7 ], [ 0, %9 ]
  ret i32 %15
}

attributes #0 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!7 = !{!8, !4, i64 8}
!8 = !{!"termios", !4, i64 0, !4, i64 4, !4, i64 8, !4, i64 12, !5, i64 16, !5, i64 17, !4, i64 52, !4, i64 56}
