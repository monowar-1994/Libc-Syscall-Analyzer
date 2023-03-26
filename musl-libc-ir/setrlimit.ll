; ModuleID = 'src/misc/setrlimit.c'
source_filename = "src/misc/setrlimit.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.rlimit = type { i64, i64 }
%struct.ctx = type { [2 x i64], i32, i32 }

@setrlimit64 = weak alias i32 (i32, %struct.rlimit*), i32 (i32, %struct.rlimit*)* @setrlimit

; Function Attrs: nounwind optsize strictfp
define i32 @setrlimit(i32 noundef %0, %struct.rlimit* noundef %1) #0 {
  %3 = alloca %struct.ctx, align 16
  %4 = sext i32 %0 to i64
  %5 = ptrtoint %struct.rlimit* %1 to i64
  %6 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 302, i64 0, i64 %4, i64 %5, i64 0) #4, !srcloc !3
  %7 = trunc i64 %6 to i32
  %8 = icmp eq i32 %7, -38
  br i1 %8, label %14, label %9

9:                                                ; preds = %2
  %10 = shl i64 %6, 32
  %11 = ashr exact i64 %10, 32
  %12 = tail call i64 @__syscall_ret(i64 noundef %11) #5
  %13 = trunc i64 %12 to i32
  br label %29

14:                                               ; preds = %2
  %15 = bitcast %struct.ctx* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %15) #4
  %16 = bitcast %struct.rlimit* %1 to <2 x i64>*
  %17 = load <2 x i64>, <2 x i64>* %16, align 8, !tbaa !4
  %18 = bitcast %struct.ctx* %3 to <2 x i64>*
  store <2 x i64> %17, <2 x i64>* %18, align 16, !tbaa !8
  %19 = getelementptr inbounds %struct.ctx, %struct.ctx* %3, i64 0, i32 1
  store i32 %0, i32* %19, align 16, !tbaa !10
  %20 = getelementptr inbounds %struct.ctx, %struct.ctx* %3, i64 0, i32 2
  store i32 -1, i32* %20, align 4, !tbaa !13
  call void @__synccall(void (i8*)* noundef nonnull @do_setrlimit, i8* noundef nonnull %15) #5
  %21 = load i32, i32* %20, align 4, !tbaa !13
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %27, label %23

23:                                               ; preds = %14
  %24 = icmp sgt i32 %21, 0
  br i1 %24, label %25, label %27

25:                                               ; preds = %23
  %26 = tail call i32* @___errno_location() #6
  store i32 %21, i32* %26, align 4, !tbaa !14
  br label %27

27:                                               ; preds = %14, %23, %25
  %28 = phi i32 [ -1, %25 ], [ -1, %23 ], [ 0, %14 ]
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %15) #4
  br label %29

29:                                               ; preds = %27, %9
  %30 = phi i32 [ %13, %9 ], [ %28, %27 ]
  ret i32 %30
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__synccall(void (i8*)* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal void @do_setrlimit(i8* noundef %0) #0 {
  %2 = getelementptr inbounds i8, i8* %0, i64 20
  %3 = bitcast i8* %2 to i32*
  %4 = load i32, i32* %3, align 4, !tbaa !13
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %15, label %6

6:                                                ; preds = %1
  %7 = getelementptr inbounds i8, i8* %0, i64 16
  %8 = bitcast i8* %7 to i32*
  %9 = load i32, i32* %8, align 8, !tbaa !10
  %10 = sext i32 %9 to i64
  %11 = ptrtoint i8* %0 to i64
  %12 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 160, i64 %10, i64 %11) #4, !srcloc !15
  %13 = trunc i64 %12 to i32
  %14 = sub i32 0, %13
  store i32 %14, i32* %3, align 4, !tbaa !13
  br label %15

15:                                               ; preds = %1, %6
  ret void
}

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
!3 = !{i64 79605}
!4 = !{!5, !5, i64 0}
!5 = !{!"long long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{!11, !12, i64 16}
!11 = !{!"ctx", !6, i64 0, !12, i64 16, !12, i64 20}
!12 = !{!"int", !6, i64 0}
!13 = !{!11, !12, i64 20}
!14 = !{!12, !12, i64 0}
!15 = !{i64 79123}
