; ModuleID = 'src/network/accept4.c'
source_filename = "src/network/accept4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr = type { i16, [14 x i8] }

; Function Attrs: nounwind optsize strictfp
define i32 @accept4(i32 noundef %0, %struct.sockaddr* noalias noundef %1, i32* noalias noundef %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = icmp eq i32 %3, 0
  br i1 %5, label %6, label %8

6:                                                ; preds = %4
  %7 = tail call i32 @accept(i32 noundef %0, %struct.sockaddr* noundef %1, i32* noundef %2) #3
  br label %35

8:                                                ; preds = %4
  %9 = sext i32 %0 to i64
  %10 = ptrtoint %struct.sockaddr* %1 to i64
  %11 = ptrtoint i32* %2 to i64
  %12 = sext i32 %3 to i64
  %13 = tail call i64 @__syscall_cp(i64 noundef 288, i64 noundef %9, i64 noundef %10, i64 noundef %11, i64 noundef %12, i64 noundef 0, i64 noundef 0) #3
  %14 = tail call i64 @__syscall_ret(i64 noundef %13) #3
  %15 = trunc i64 %14 to i32
  %16 = icmp sgt i32 %15, -1
  br i1 %16, label %35, label %17

17:                                               ; preds = %8
  %18 = tail call i32* @___errno_location() #4
  %19 = load i32, i32* %18, align 4, !tbaa !3
  switch i32 %19, label %35 [
    i32 38, label %20
    i32 22, label %20
  ]

20:                                               ; preds = %17, %17
  %21 = tail call i32 @accept(i32 noundef %0, %struct.sockaddr* noundef %1, i32* noundef %2) #3
  %22 = icmp slt i32 %21, 0
  br i1 %22, label %35, label %23

23:                                               ; preds = %20
  %24 = and i32 %3, 524288
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %29, label %26

26:                                               ; preds = %23
  %27 = zext i32 %21 to i64
  %28 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %27, i64 2, i64 1) #5, !srcloc !7
  br label %29

29:                                               ; preds = %26, %23
  %30 = and i32 %3, 2048
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %35, label %32

32:                                               ; preds = %29
  %33 = zext i32 %21 to i64
  %34 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %33, i64 4, i64 2048) #5, !srcloc !7
  br label %35

35:                                               ; preds = %17, %8, %20, %32, %29, %6
  %36 = phi i32 [ %7, %6 ], [ %15, %17 ], [ %15, %8 ], [ %21, %20 ], [ %21, %32 ], [ %21, %29 ]
  ret i32 %36
}

; Function Attrs: optsize
declare i32 @accept(i32 noundef, %struct.sockaddr* noundef, i32* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i64 @__syscall_cp(i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #5 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{i64 89971}
