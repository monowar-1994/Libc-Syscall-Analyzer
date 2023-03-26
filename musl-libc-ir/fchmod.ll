; ModuleID = 'src/stat/fchmod.c'
source_filename = "src/stat/fchmod.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @fchmod(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = alloca [27 x i8], align 16
  %4 = sext i32 %0 to i64
  %5 = zext i32 %1 to i64
  %6 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 91, i64 %4, i64 %5) #3, !srcloc !3
  %7 = trunc i64 %6 to i32
  %8 = icmp eq i32 %7, -9
  br i1 %8, label %9, label %12

9:                                                ; preds = %2
  %10 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %4, i64 1) #3, !srcloc !3
  %11 = icmp slt i64 %10, 0
  br i1 %11, label %12, label %16

12:                                               ; preds = %9, %2
  %13 = shl i64 %6, 32
  %14 = ashr exact i64 %13, 32
  %15 = tail call i64 @__syscall_ret(i64 noundef %14) #4
  br label %21

16:                                               ; preds = %9
  %17 = getelementptr inbounds [27 x i8], [27 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 27, i8* nonnull %17) #3
  call void @__procfdname(i8* noundef nonnull %17, i32 noundef %0) #4
  %18 = ptrtoint [27 x i8]* %3 to i64
  %19 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 90, i64 %18, i64 %5) #3, !srcloc !3
  %20 = call i64 @__syscall_ret(i64 noundef %19) #4
  call void @llvm.lifetime.end.p0i8(i64 27, i8* nonnull %17) #3
  br label %21

21:                                               ; preds = %16, %12
  %22 = phi i64 [ %15, %12 ], [ %20, %16 ]
  %23 = trunc i64 %22 to i32
  ret i32 %23
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
!3 = !{i64 81582}
