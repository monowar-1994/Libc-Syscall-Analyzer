; ModuleID = 'src/signal/sigqueue.c'
source_filename = "src/signal/sigqueue.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.siginfo_t = type { i32, i32, i32, %union.anon }
%union.anon = type { %struct.anon, [80 x i8] }
%struct.anon = type { %union.anon.0, %union.anon.3 }
%union.anon.0 = type { %struct.anon.1 }
%struct.anon.1 = type { i32, i32 }
%union.anon.3 = type { %struct.anon.4 }
%struct.anon.4 = type { i32, i64, i64 }
%struct.__sigset_t = type { [16 x i64] }

; Function Attrs: nounwind optsize strictfp
define i32 @sigqueue(i32 noundef %0, i32 noundef %1, i8* %2) local_unnamed_addr #0 {
  %4 = alloca %struct.siginfo_t, align 8
  %5 = alloca %struct.__sigset_t, align 8
  %6 = bitcast %struct.siginfo_t* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %6) #3
  %7 = bitcast %struct.__sigset_t* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %7) #3
  %8 = call i8* @memset(i8* noundef nonnull %6, i32 noundef 0, i64 noundef 128) #4
  %9 = getelementptr inbounds %struct.siginfo_t, %struct.siginfo_t* %4, i64 0, i32 0
  store i32 %1, i32* %9, align 8, !tbaa !3
  %10 = getelementptr inbounds %struct.siginfo_t, %struct.siginfo_t* %4, i64 0, i32 2
  store i32 -1, i32* %10, align 8, !tbaa !8
  %11 = getelementptr inbounds %struct.siginfo_t, %struct.siginfo_t* %4, i64 0, i32 3, i32 0, i32 1
  %12 = bitcast %union.anon.3* %11 to i8**
  store i8* %2, i8** %12, align 8, !tbaa.struct !9
  %13 = call i32 @getuid() #4
  %14 = getelementptr inbounds %struct.siginfo_t, %struct.siginfo_t* %4, i64 0, i32 3, i32 0, i32 0, i32 0, i32 1
  store i32 %13, i32* %14, align 4, !tbaa !13
  call void @__block_app_sigs(i8* noundef nonnull %7) #4
  %15 = call i32 @getpid() #4
  %16 = getelementptr inbounds %struct.siginfo_t, %struct.siginfo_t* %4, i64 0, i32 3, i32 0, i32 0, i32 0, i32 0
  store i32 %15, i32* %16, align 8, !tbaa !13
  %17 = sext i32 %0 to i64
  %18 = sext i32 %1 to i64
  %19 = ptrtoint %struct.siginfo_t* %4 to i64
  %20 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 129, i64 %17, i64 %18, i64 %19) #3, !srcloc !14
  %21 = call i64 @__syscall_ret(i64 noundef %20) #4
  %22 = trunc i64 %21 to i32
  call void @__restore_sigs(i8* noundef nonnull %7) #4
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %7) #3
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %6) #3
  ret i32 %22
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @getuid() local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__block_app_sigs(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @getpid() local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__restore_sigs(i8* noundef) local_unnamed_addr #2

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
!3 = !{!4, !5, i64 0}
!4 = !{!"", !5, i64 0, !5, i64 4, !5, i64 8, !6, i64 16}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!4, !5, i64 8}
!9 = !{i64 0, i64 4, !10, i64 0, i64 8, !11}
!10 = !{!5, !5, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"any pointer", !6, i64 0}
!13 = !{!6, !6, i64 0}
!14 = !{i64 113495}
