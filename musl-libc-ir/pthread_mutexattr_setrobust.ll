; ModuleID = 'src/thread/pthread_mutexattr_setrobust.c'
source_filename = "src/thread/pthread_mutexattr_setrobust.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_mutexattr_t = type { i32 }

@check_robust_result = internal global i32 -1, align 4

; Function Attrs: nounwind optsize strictfp
define i32 @pthread_mutexattr_setrobust(%struct.pthread_mutexattr_t* nocapture noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = icmp ugt i32 %1, 1
  br i1 %5, label %30, label %6

6:                                                ; preds = %2
  %7 = icmp eq i32 %1, 0
  br i1 %7, label %26, label %8

8:                                                ; preds = %6
  %9 = load volatile i32, i32* @check_robust_result, align 4, !tbaa !3
  %10 = icmp slt i32 %9, 0
  br i1 %10, label %11, label %19

11:                                               ; preds = %8
  %12 = bitcast i8** %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %12) #2
  %13 = bitcast i64* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %13) #2
  %14 = ptrtoint i8** %3 to i64
  %15 = ptrtoint i64* %4 to i64
  %16 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 274, i64 0, i64 %14, i64 %15) #2, !srcloc !7
  %17 = trunc i64 %16 to i32
  %18 = sub i32 0, %17
  call void asm sideeffect "mov $1, $0 ; lock ; orl $$0,(%rsp)", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) @check_robust_result, i32 %18) #2, !srcloc !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %13) #2
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %12) #2
  br label %19

19:                                               ; preds = %11, %8
  %20 = phi i32 [ %18, %11 ], [ %9, %8 ]
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %30

22:                                               ; preds = %19
  %23 = getelementptr inbounds %struct.pthread_mutexattr_t, %struct.pthread_mutexattr_t* %0, i64 0, i32 0
  %24 = load i32, i32* %23, align 4, !tbaa !9
  %25 = or i32 %24, 4
  store i32 %25, i32* %23, align 4, !tbaa !9
  br label %30

26:                                               ; preds = %6
  %27 = getelementptr inbounds %struct.pthread_mutexattr_t, %struct.pthread_mutexattr_t* %0, i64 0, i32 0
  %28 = load i32, i32* %27, align 4, !tbaa !9
  %29 = and i32 %28, -5
  store i32 %29, i32* %27, align 4, !tbaa !9
  br label %30

30:                                               ; preds = %22, %19, %2, %26
  %31 = phi i32 [ 0, %26 ], [ 22, %2 ], [ 0, %22 ], [ %20, %19 ]
  ret i32 %31
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{i64 204295}
!8 = !{i64 233098}
!9 = !{!10, !4, i64 0}
!10 = !{!"", !4, i64 0}
