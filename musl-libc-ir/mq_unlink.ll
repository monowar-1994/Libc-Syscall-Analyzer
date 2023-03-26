; ModuleID = 'src/mq/mq_unlink.c'
source_filename = "src/mq/mq_unlink.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @mq_unlink(i8* noundef %0) local_unnamed_addr #0 {
  %2 = load i8, i8* %0, align 1, !tbaa !3
  %3 = icmp eq i8 %2, 47
  %4 = zext i1 %3 to i64
  %5 = getelementptr i8, i8* %0, i64 %4
  %6 = ptrtoint i8* %5 to i64
  %7 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 241, i64 %6) #2, !srcloc !6
  %8 = trunc i64 %7 to i32
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %10, label %15

10:                                               ; preds = %1
  %11 = icmp eq i32 %8, -1
  %12 = select i1 %11, i32 -13, i32 %8
  %13 = sub nsw i32 0, %12
  %14 = tail call i32* @___errno_location() #3
  store i32 %13, i32* %14, align 4, !tbaa !7
  br label %15

15:                                               ; preds = %1, %10
  %16 = phi i32 [ -1, %10 ], [ %8, %1 ]
  ret i32 %16
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind strictfp }
attributes #3 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{i64 61720}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !4, i64 0}
