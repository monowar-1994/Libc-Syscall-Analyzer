; ModuleID = 'src/unistd/readlink.c'
source_filename = "src/unistd/readlink.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i64 @readlink(i8* noalias noundef %0, i8* noalias noundef %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = alloca [1 x i8], align 1
  %5 = getelementptr inbounds [1 x i8], [1 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %5) #3
  %6 = icmp eq i64 %2, 0
  %7 = select i1 %6, i64 1, i64 %2
  %8 = select i1 %6, i8* %5, i8* %1
  %9 = ptrtoint i8* %0 to i64
  %10 = ptrtoint i8* %8 to i64
  %11 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 89, i64 %9, i64 %10, i64 %7) #3, !srcloc !3
  %12 = trunc i64 %11 to i32
  %13 = icmp eq i8* %8, %5
  %14 = icmp sgt i32 %12, 0
  %15 = select i1 %13, i1 %14, i1 false
  %16 = shl i64 %11, 32
  %17 = ashr exact i64 %16, 32
  %18 = select i1 %15, i64 0, i64 %17
  %19 = call i64 @__syscall_ret(i64 noundef %18) #4
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %5) #3
  ret i64 %19
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #2

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
!3 = !{i64 92270}
