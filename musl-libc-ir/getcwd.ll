; ModuleID = 'src/unistd/getcwd.c'
source_filename = "src/unistd/getcwd.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i8* @getcwd(i8* noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = icmp eq i8* %0, null
  %4 = select i1 %3, i64 4096, i64 1
  %5 = alloca i8, i64 %4, align 16
  br i1 %3, label %10, label %6

6:                                                ; preds = %2
  %7 = icmp eq i64 %1, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %6
  %9 = tail call i32* @___errno_location() #3
  store i32 22, i32* %9, align 4, !tbaa !3
  br label %28

10:                                               ; preds = %2, %6
  %11 = phi i64 [ %1, %6 ], [ 4096, %2 ]
  %12 = phi i8* [ %0, %6 ], [ %5, %2 ]
  %13 = ptrtoint i8* %12 to i64
  %14 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 79, i64 %13, i64 %11) #4, !srcloc !7
  %15 = call i64 @__syscall_ret(i64 noundef %14) #5
  %16 = icmp slt i64 %15, 0
  br i1 %16, label %28, label %17

17:                                               ; preds = %10
  %18 = icmp eq i64 %15, 0
  br i1 %18, label %22, label %19

19:                                               ; preds = %17
  %20 = load i8, i8* %12, align 1, !tbaa !8
  %21 = icmp eq i8 %20, 47
  br i1 %21, label %24, label %22

22:                                               ; preds = %19, %17
  %23 = tail call i32* @___errno_location() #3
  store i32 2, i32* %23, align 4, !tbaa !3
  br label %28

24:                                               ; preds = %19
  %25 = icmp eq i8* %12, %5
  br i1 %25, label %26, label %28

26:                                               ; preds = %24
  %27 = call i8* @strdup(i8* noundef nonnull %5) #5
  br label %28

28:                                               ; preds = %22, %10, %24, %26, %8
  %29 = phi i8* [ null, %8 ], [ null, %22 ], [ null, %10 ], [ %27, %26 ], [ %12, %24 ]
  ret i8* %29
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @strdup(i8* noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{i64 105882}
!8 = !{!5, !5, i64 0}
