; ModuleID = 'src/sched/sched_getcpu.c'
source_filename = "src/sched/sched_getcpu.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@vdso_func = internal global i8* bitcast (i64 (i32*, i32*, i8*)* @getcpu_init to i8*), align 8
@.str = private unnamed_addr constant [10 x i8] c"LINUX_2.6\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"__vdso_getcpu\00", align 1

; Function Attrs: nounwind optsize strictfp
define i32 @sched_getcpu() local_unnamed_addr #0 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #3
  %3 = load volatile i8*, i8** @vdso_func, align 8, !tbaa !3
  %4 = icmp eq i8* %3, null
  br i1 %4, label %16, label %5

5:                                                ; preds = %0
  %6 = bitcast i8* %3 to i64 (i32*, i32*, i8*)*
  %7 = call i64 %6(i32* noundef nonnull %1, i32* noundef null, i8* noundef null) #4
  %8 = trunc i64 %7 to i32
  switch i32 %8, label %11 [
    i32 0, label %9
    i32 -38, label %16
  ]

9:                                                ; preds = %5
  %10 = load i32, i32* %1, align 4, !tbaa !7
  br label %28

11:                                               ; preds = %5
  %12 = shl i64 %7, 32
  %13 = ashr exact i64 %12, 32
  %14 = call i64 @__syscall_ret(i64 noundef %13) #4
  %15 = trunc i64 %14 to i32
  br label %28

16:                                               ; preds = %5, %0
  %17 = ptrtoint i32* %1 to i64
  %18 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 309, i64 %17, i64 0, i64 0) #3, !srcloc !9
  %19 = trunc i64 %18 to i32
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %23

21:                                               ; preds = %16
  %22 = load i32, i32* %1, align 4, !tbaa !7
  br label %28

23:                                               ; preds = %16
  %24 = shl i64 %18, 32
  %25 = ashr exact i64 %24, 32
  %26 = call i64 @__syscall_ret(i64 noundef %25) #4
  %27 = trunc i64 %26 to i32
  br label %28

28:                                               ; preds = %23, %21, %11, %9
  %29 = phi i32 [ %15, %11 ], [ %27, %23 ], [ %22, %21 ], [ %10, %9 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #3
  ret i32 %29
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define internal i64 @getcpu_init(i32* noundef %0, i32* noundef %1, i8* noundef %2) #0 {
  %4 = tail call i8* @__vdsosym(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0)) #4
  %5 = tail call i8* asm "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i8** nonnull elementtype(i8*) @vdso_func, i8* bitcast (i64 (i32*, i32*, i8*)* @getcpu_init to i8*), i8* %4) #3, !srcloc !10
  %6 = icmp eq i8* %4, null
  br i1 %6, label %10, label %7

7:                                                ; preds = %3
  %8 = bitcast i8* %4 to i64 (i32*, i32*, i8*)*
  %9 = tail call i64 %8(i32* noundef %0, i32* noundef %1, i8* noundef %2) #4
  br label %10

10:                                               ; preds = %3, %7
  %11 = phi i64 [ %9, %7 ], [ -38, %3 ]
  ret i64 %11
}

; Function Attrs: optsize
declare hidden i8* @__vdsosym(i8* noundef, i8* noundef) local_unnamed_addr #2

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
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
!9 = !{i64 70997}
!10 = !{i64 94220}
