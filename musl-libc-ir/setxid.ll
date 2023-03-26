; ModuleID = 'src/unistd/setxid.c'
source_filename = "src/unistd/setxid.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ctx = type { i32, i32, i32, i32, i32 }

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__setxid(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = alloca %struct.ctx, align 4
  %6 = bitcast %struct.ctx* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %6) #3
  %7 = getelementptr inbounds %struct.ctx, %struct.ctx* %5, i64 0, i32 0
  store i32 %1, i32* %7, align 4, !tbaa !3
  %8 = getelementptr inbounds %struct.ctx, %struct.ctx* %5, i64 0, i32 1
  store i32 %2, i32* %8, align 4, !tbaa !8
  %9 = getelementptr inbounds %struct.ctx, %struct.ctx* %5, i64 0, i32 2
  store i32 %3, i32* %9, align 4, !tbaa !9
  %10 = getelementptr inbounds %struct.ctx, %struct.ctx* %5, i64 0, i32 3
  store i32 %0, i32* %10, align 4, !tbaa !10
  %11 = getelementptr inbounds %struct.ctx, %struct.ctx* %5, i64 0, i32 4
  store i32 1, i32* %11, align 4, !tbaa !11
  call void @__synccall(void (i8*)* noundef nonnull @do_setxid, i8* noundef nonnull %6) #4
  %12 = load i32, i32* %11, align 4, !tbaa !11
  %13 = sext i32 %12 to i64
  %14 = call i64 @__syscall_ret(i64 noundef %13) #4
  %15 = trunc i64 %14 to i32
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %6) #3
  ret i32 %15
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden void @__synccall(void (i8*)* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal void @do_setxid(i8* nocapture noundef %0) #0 {
  %2 = getelementptr inbounds i8, i8* %0, i64 16
  %3 = bitcast i8* %2 to i32*
  %4 = load i32, i32* %3, align 4, !tbaa !11
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %32, label %6

6:                                                ; preds = %1
  %7 = getelementptr inbounds i8, i8* %0, i64 12
  %8 = bitcast i8* %7 to i32*
  %9 = load i32, i32* %8, align 4, !tbaa !10
  %10 = sext i32 %9 to i64
  %11 = bitcast i8* %0 to i32*
  %12 = load i32, i32* %11, align 4, !tbaa !3
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i8, i8* %0, i64 4
  %15 = bitcast i8* %14 to i32*
  %16 = load i32, i32* %15, align 4, !tbaa !8
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i8, i8* %0, i64 8
  %19 = bitcast i8* %18 to i32*
  %20 = load i32, i32* %19, align 4, !tbaa !9
  %21 = sext i32 %20 to i64
  %22 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 %10, i64 %13, i64 %17, i64 %21) #3, !srcloc !12
  %23 = trunc i64 %22 to i32
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %31, label %25

25:                                               ; preds = %6
  %26 = load i32, i32* %3, align 4, !tbaa !11
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %31

28:                                               ; preds = %25
  tail call void @__block_all_sigs(i8* noundef null) #4
  %29 = tail call i64 asm sideeffect "syscall", "={ax},{ax},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 39) #3, !srcloc !13
  %30 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 62, i64 %29, i64 9) #3, !srcloc !14
  br label %31

31:                                               ; preds = %28, %25, %6
  store i32 %23, i32* %3, align 4, !tbaa !11
  br label %32

32:                                               ; preds = %1, %31
  ret void
}

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden void @__block_all_sigs(i8* noundef) local_unnamed_addr #2

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
!3 = !{!4, !5, i64 0}
!4 = !{!"ctx", !5, i64 0, !5, i64 4, !5, i64 8, !5, i64 12, !5, i64 16}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!4, !5, i64 4}
!9 = !{!4, !5, i64 8}
!10 = !{!4, !5, i64 12}
!11 = !{!4, !5, i64 16}
!12 = !{i64 98763}
!13 = !{i64 98197}
!14 = !{i64 98551}
