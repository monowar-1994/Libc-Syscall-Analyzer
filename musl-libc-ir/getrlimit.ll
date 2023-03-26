; ModuleID = 'src/misc/getrlimit.c'
source_filename = "src/misc/getrlimit.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.rlimit = type { i64, i64 }

@getrlimit64 = weak alias i32 (i32, %struct.rlimit*), i32 (i32, %struct.rlimit*)* @getrlimit

; Function Attrs: nounwind optsize strictfp
define i32 @getrlimit(i32 noundef %0, %struct.rlimit* noundef %1) #0 {
  %3 = alloca [2 x i64], align 16
  %4 = bitcast [2 x i64]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %4) #4
  %5 = sext i32 %0 to i64
  %6 = ptrtoint %struct.rlimit* %1 to i64
  %7 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 302, i64 0, i64 %5, i64 0, i64 %6) #4, !srcloc !3
  %8 = tail call i64 @__syscall_ret(i64 noundef %7) #5
  %9 = trunc i64 %8 to i32
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %20

11:                                               ; preds = %2
  %12 = getelementptr inbounds %struct.rlimit, %struct.rlimit* %1, i64 0, i32 0
  %13 = load i64, i64* %12, align 8, !tbaa !4
  %14 = icmp eq i64 %13, -1
  br i1 %14, label %15, label %16

15:                                               ; preds = %11
  store i64 -1, i64* %12, align 8, !tbaa !4
  br label %16

16:                                               ; preds = %11, %15
  %17 = getelementptr inbounds %struct.rlimit, %struct.rlimit* %1, i64 0, i32 1
  %18 = load i64, i64* %17, align 8, !tbaa !9
  %19 = icmp eq i64 %18, -1
  br i1 %19, label %40, label %42

20:                                               ; preds = %2
  %21 = tail call i32* @___errno_location() #6
  %22 = load i32, i32* %21, align 4, !tbaa !10
  %23 = icmp eq i32 %22, 38
  br i1 %23, label %24, label %42

24:                                               ; preds = %20
  %25 = ptrtoint [2 x i64]* %3 to i64
  %26 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 97, i64 %5, i64 %25) #4, !srcloc !12
  %27 = call i64 @__syscall_ret(i64 noundef %26) #5
  %28 = icmp slt i64 %27, 0
  br i1 %28, label %42, label %29

29:                                               ; preds = %24
  %30 = getelementptr inbounds [2 x i64], [2 x i64]* %3, i64 0, i64 0
  %31 = load i64, i64* %30, align 16, !tbaa !13
  %32 = getelementptr inbounds %struct.rlimit, %struct.rlimit* %1, i64 0, i32 0
  store i64 %31, i64* %32, align 8, !tbaa !4
  %33 = getelementptr inbounds [2 x i64], [2 x i64]* %3, i64 0, i64 1
  %34 = load i64, i64* %33, align 8, !tbaa !13
  %35 = getelementptr inbounds %struct.rlimit, %struct.rlimit* %1, i64 0, i32 1
  store i64 %34, i64* %35, align 8, !tbaa !9
  %36 = icmp eq i64 %31, -1
  br i1 %36, label %37, label %38

37:                                               ; preds = %29
  store i64 -1, i64* %32, align 8, !tbaa !4
  br label %38

38:                                               ; preds = %29, %37
  %39 = icmp eq i64 %34, -1
  br i1 %39, label %40, label %42

40:                                               ; preds = %38, %16
  %41 = phi i64* [ %17, %16 ], [ %35, %38 ]
  store i64 -1, i64* %41, align 8, !tbaa !9
  br label %42

42:                                               ; preds = %40, %16, %38, %24, %20
  %43 = phi i32 [ %9, %20 ], [ -1, %24 ], [ 0, %38 ], [ 0, %16 ], [ 0, %40 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %4) #4
  ret i32 %43
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #2

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
!3 = !{i64 79247}
!4 = !{!5, !6, i64 0}
!5 = !{!"rlimit", !6, i64 0, !6, i64 8}
!6 = !{!"long long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!5, !6, i64 8}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !7, i64 0}
!12 = !{i64 78765}
!13 = !{!14, !14, i64 0}
!14 = !{!"long", !7, i64 0}
