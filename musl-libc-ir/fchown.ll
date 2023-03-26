; ModuleID = 'src/unistd/fchown.c'
source_filename = "src/unistd/fchown.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @fchown(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = alloca [27 x i8], align 16
  %5 = sext i32 %0 to i64
  %6 = zext i32 %1 to i64
  %7 = zext i32 %2 to i64
  %8 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 93, i64 %5, i64 %6, i64 %7) #3, !srcloc !3
  %9 = trunc i64 %8 to i32
  %10 = icmp eq i32 %9, -9
  br i1 %10, label %11, label %14

11:                                               ; preds = %3
  %12 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %5, i64 1) #3, !srcloc !4
  %13 = icmp slt i64 %12, 0
  br i1 %13, label %14, label %18

14:                                               ; preds = %11, %3
  %15 = shl i64 %8, 32
  %16 = ashr exact i64 %15, 32
  %17 = tail call i64 @__syscall_ret(i64 noundef %16) #4
  br label %23

18:                                               ; preds = %11
  %19 = getelementptr inbounds [27 x i8], [27 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 27, i8* nonnull %19) #3
  call void @__procfdname(i8* noundef nonnull %19, i32 noundef %0) #4
  %20 = ptrtoint [27 x i8]* %4 to i64
  %21 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 92, i64 %20, i64 %6, i64 %7) #3, !srcloc !3
  %22 = call i64 @__syscall_ret(i64 noundef %21) #4
  call void @llvm.lifetime.end.p0i8(i64 27, i8* nonnull %19) #3
  br label %23

23:                                               ; preds = %18, %14
  %24 = phi i64 [ %17, %14 ], [ %22, %18 ]
  %25 = trunc i64 %24 to i32
  ret i32 %25
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
!3 = !{i64 92295}
!4 = !{i64 92083}
