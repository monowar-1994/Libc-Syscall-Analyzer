; ModuleID = 'src/unistd/readlinkat.c'
source_filename = "src/unistd/readlinkat.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i64 @readlinkat(i32 noundef %0, i8* noalias noundef %1, i8* noalias noundef %2, i64 noundef %3) local_unnamed_addr #0 {
  %5 = alloca [1 x i8], align 1
  %6 = getelementptr inbounds [1 x i8], [1 x i8]* %5, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %6) #3
  %7 = icmp eq i64 %3, 0
  %8 = select i1 %7, i64 1, i64 %3
  %9 = select i1 %7, i8* %6, i8* %2
  %10 = sext i32 %0 to i64
  %11 = ptrtoint i8* %1 to i64
  %12 = ptrtoint i8* %9 to i64
  %13 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 267, i64 %10, i64 %11, i64 %12, i64 %8) #3, !srcloc !3
  %14 = trunc i64 %13 to i32
  %15 = icmp eq i8* %9, %6
  %16 = icmp sgt i32 %14, 0
  %17 = select i1 %15, i1 %16, i1 false
  %18 = shl i64 %13, 32
  %19 = ashr exact i64 %18, 32
  %20 = select i1 %17, i64 0, i64 %19
  %21 = call i64 @__syscall_ret(i64 noundef %20) #4
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %6) #3
  ret i64 %21
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
!3 = !{i64 75374}
