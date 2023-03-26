; ModuleID = 'src/unistd/fchdir.c'
source_filename = "src/unistd/fchdir.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @fchdir(i32 noundef %0) local_unnamed_addr #0 {
  %2 = alloca [27 x i8], align 16
  %3 = sext i32 %0 to i64
  %4 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 81, i64 %3) #3, !srcloc !3
  %5 = trunc i64 %4 to i32
  %6 = icmp eq i32 %5, -9
  br i1 %6, label %7, label %10

7:                                                ; preds = %1
  %8 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %3, i64 1) #3, !srcloc !4
  %9 = icmp slt i64 %8, 0
  br i1 %9, label %10, label %14

10:                                               ; preds = %7, %1
  %11 = shl i64 %4, 32
  %12 = ashr exact i64 %11, 32
  %13 = tail call i64 @__syscall_ret(i64 noundef %12) #4
  br label %19

14:                                               ; preds = %7
  %15 = getelementptr inbounds [27 x i8], [27 x i8]* %2, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 27, i8* nonnull %15) #3
  call void @__procfdname(i8* noundef nonnull %15, i32 noundef %0) #4
  %16 = ptrtoint [27 x i8]* %2 to i64
  %17 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 80, i64 %16) #3, !srcloc !3
  %18 = call i64 @__syscall_ret(i64 noundef %17) #4
  call void @llvm.lifetime.end.p0i8(i64 27, i8* nonnull %15) #3
  br label %19

19:                                               ; preds = %14, %10
  %20 = phi i64 [ %13, %10 ], [ %18, %14 ]
  %21 = trunc i64 %20 to i32
  ret i32 %21
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__procfdname(i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 91765}
!4 = !{i64 91951}
