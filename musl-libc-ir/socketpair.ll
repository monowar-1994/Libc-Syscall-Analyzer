; ModuleID = 'src/network/socketpair.c'
source_filename = "src/network/socketpair.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @socketpair(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32* noundef %3) local_unnamed_addr #0 {
  %5 = sext i32 %0 to i64
  %6 = sext i32 %1 to i64
  %7 = sext i32 %2 to i64
  %8 = ptrtoint i32* %3 to i64
  %9 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},{r8},{r9},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 53, i64 %5, i64 %6, i64 %7, i64 %8, i64 0, i64 0) #3, !srcloc !3
  %10 = tail call i64 @__syscall_ret(i64 noundef %9) #4
  %11 = trunc i64 %10 to i32
  %12 = icmp slt i32 %11, 0
  br i1 %12, label %13, label %48

13:                                               ; preds = %4
  %14 = tail call i32* @___errno_location() #5
  %15 = load i32, i32* %14, align 4, !tbaa !4
  switch i32 %15, label %48 [
    i32 22, label %16
    i32 93, label %16
  ]

16:                                               ; preds = %13, %13
  %17 = and i32 %1, 526336
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %48, label %19

19:                                               ; preds = %16
  %20 = and i32 %1, -526337
  %21 = sext i32 %20 to i64
  %22 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},{r8},{r9},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 53, i64 %5, i64 %21, i64 %7, i64 %8, i64 0, i64 0) #3, !srcloc !3
  %23 = tail call i64 @__syscall_ret(i64 noundef %22) #4
  %24 = trunc i64 %23 to i32
  %25 = icmp slt i32 %24, 0
  br i1 %25, label %48, label %26

26:                                               ; preds = %19
  %27 = and i32 %1, 524288
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %37, label %29

29:                                               ; preds = %26
  %30 = load i32, i32* %3, align 4, !tbaa !4
  %31 = sext i32 %30 to i64
  %32 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %31, i64 2, i64 1) #3, !srcloc !8
  %33 = getelementptr inbounds i32, i32* %3, i64 1
  %34 = load i32, i32* %33, align 4, !tbaa !4
  %35 = sext i32 %34 to i64
  %36 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %35, i64 2, i64 1) #3, !srcloc !8
  br label %37

37:                                               ; preds = %29, %26
  %38 = and i32 %1, 2048
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %48, label %40

40:                                               ; preds = %37
  %41 = load i32, i32* %3, align 4, !tbaa !4
  %42 = sext i32 %41 to i64
  %43 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %42, i64 4, i64 2048) #3, !srcloc !8
  %44 = getelementptr inbounds i32, i32* %3, i64 1
  %45 = load i32, i32* %44, align 4, !tbaa !4
  %46 = sext i32 %45 to i64
  %47 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %46, i64 4, i64 2048) #3, !srcloc !8
  br label %48

48:                                               ; preds = %4, %16, %40, %37, %13, %19
  %49 = phi i32 [ %24, %19 ], [ %24, %40 ], [ %24, %37 ], [ %11, %16 ], [ %11, %4 ], [ %11, %13 ]
  ret i32 %49
}

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 91107}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{i64 90128}
