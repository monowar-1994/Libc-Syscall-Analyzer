; ModuleID = 'src/process/fexecve.c'
source_filename = "src/process/fexecve.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: nounwind optsize strictfp
define i32 @fexecve(i32 noundef %0, i8** noundef %1, i8** noundef %2) local_unnamed_addr #0 {
  %4 = alloca [27 x i8], align 16
  %5 = sext i32 %0 to i64
  %6 = ptrtoint i8** %1 to i64
  %7 = ptrtoint i8** %2 to i64
  %8 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},{r8},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 322, i64 %5, i64 ptrtoint ([1 x i8]* @.str to i64), i64 %6, i64 %7, i64 4096) #4, !srcloc !3
  %9 = trunc i64 %8 to i32
  %10 = icmp eq i32 %9, -38
  br i1 %10, label %16, label %11

11:                                               ; preds = %3
  %12 = shl i64 %8, 32
  %13 = ashr exact i64 %12, 32
  %14 = tail call i64 @__syscall_ret(i64 noundef %13) #5
  %15 = trunc i64 %14 to i32
  br label %24

16:                                               ; preds = %3
  %17 = getelementptr inbounds [27 x i8], [27 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 27, i8* nonnull %17) #4
  call void @__procfdname(i8* noundef nonnull %17, i32 noundef %0) #5
  %18 = call i32 @execve(i8* noundef nonnull %17, i8** noundef %1, i8** noundef %2) #5
  %19 = tail call i32* @___errno_location() #6
  %20 = load i32, i32* %19, align 4, !tbaa !4
  %21 = icmp eq i32 %20, 2
  br i1 %21, label %22, label %23

22:                                               ; preds = %16
  store i32 9, i32* %19, align 4, !tbaa !4
  br label %23

23:                                               ; preds = %22, %16
  call void @llvm.lifetime.end.p0i8(i64 27, i8* nonnull %17) #4
  br label %24

24:                                               ; preds = %23, %11
  %25 = phi i32 [ %15, %11 ], [ -1, %23 ]
  ret i32 %25
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__procfdname(i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @execve(i8* noundef, i8** noundef, i8** noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 92848}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
