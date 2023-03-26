; ModuleID = 'src/linux/setgroups.c'
source_filename = "src/linux/setgroups.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ctx = type { i64, i32*, i32 }

; Function Attrs: nounwind optsize strictfp
define i32 @setgroups(i64 noundef %0, i32* noundef %1) local_unnamed_addr #0 {
  %3 = alloca %struct.ctx, align 8
  %4 = bitcast %struct.ctx* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %4) #3
  %5 = getelementptr inbounds %struct.ctx, %struct.ctx* %3, i64 0, i32 0
  store i64 %0, i64* %5, align 8, !tbaa !3
  %6 = getelementptr inbounds %struct.ctx, %struct.ctx* %3, i64 0, i32 1
  store i32* %1, i32** %6, align 8, !tbaa !10
  %7 = getelementptr inbounds %struct.ctx, %struct.ctx* %3, i64 0, i32 2
  store i32 1, i32* %7, align 8, !tbaa !11
  call void @__synccall(void (i8*)* noundef nonnull @do_setgroups, i8* noundef nonnull %4) #4
  %8 = load i32, i32* %7, align 8, !tbaa !11
  %9 = sext i32 %8 to i64
  %10 = call i64 @__syscall_ret(i64 noundef %9) #4
  %11 = trunc i64 %10 to i32
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %4) #3
  ret i32 %11
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden void @__synccall(void (i8*)* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal void @do_setgroups(i8* nocapture noundef %0) #0 {
  %2 = getelementptr inbounds i8, i8* %0, i64 16
  %3 = bitcast i8* %2 to i32*
  %4 = load i32, i32* %3, align 8, !tbaa !11
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %23, label %6

6:                                                ; preds = %1
  %7 = bitcast i8* %0 to i64*
  %8 = load i64, i64* %7, align 8, !tbaa !3
  %9 = getelementptr inbounds i8, i8* %0, i64 8
  %10 = bitcast i8* %9 to i32**
  %11 = load i32*, i32** %10, align 8, !tbaa !10
  %12 = ptrtoint i32* %11 to i64
  %13 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 116, i64 %8, i64 %12) #3, !srcloc !12
  %14 = trunc i64 %13 to i32
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %22, label %16

16:                                               ; preds = %6
  %17 = load i32, i32* %3, align 8, !tbaa !11
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %22

19:                                               ; preds = %16
  tail call void @__block_all_sigs(i8* noundef null) #4
  %20 = tail call i64 asm sideeffect "syscall", "={ax},{ax},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 39) #3, !srcloc !13
  %21 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 62, i64 %20, i64 9) #3, !srcloc !12
  br label %22

22:                                               ; preds = %19, %16, %6
  store i32 %14, i32* %3, align 8, !tbaa !11
  br label %23

23:                                               ; preds = %1, %22
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
!4 = !{!"ctx", !5, i64 0, !8, i64 8, !9, i64 16}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!"int", !6, i64 0}
!10 = !{!4, !8, i64 8}
!11 = !{!4, !9, i64 16}
!12 = !{i64 98601}
!13 = !{i64 98247}
