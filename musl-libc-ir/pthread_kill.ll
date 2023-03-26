; ModuleID = 'src/thread/pthread_kill.c'
source_filename = "src/thread/pthread_kill.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.__sigset_t = type { [16 x i64] }

; Function Attrs: nounwind optsize strictfp
define i32 @pthread_kill(%struct.__pthread* noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = alloca %struct.__sigset_t, align 8
  %4 = bitcast %struct.__sigset_t* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %4) #3
  call void @__block_all_sigs(i8* noundef nonnull %4) #4
  %5 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %0, i64 0, i32 25, i64 0
  call void @__lock(i32* noundef nonnull %5) #4
  %6 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %0, i64 0, i32 6
  %7 = load i32, i32* %6, align 8, !tbaa !3
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %14, label %9

9:                                                ; preds = %2
  %10 = sext i32 %7 to i64
  %11 = sext i32 %1 to i64
  %12 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 200, i64 %10, i64 %11) #3, !srcloc !11
  %13 = sub nsw i64 0, %12
  br label %17

14:                                               ; preds = %2
  %15 = icmp ugt i32 %1, 64
  %16 = select i1 %15, i64 22, i64 0
  br label %17

17:                                               ; preds = %14, %9
  %18 = phi i64 [ %13, %9 ], [ %16, %14 ]
  %19 = trunc i64 %18 to i32
  call void @__unlock(i32* noundef nonnull %5) #4
  call void @__restore_sigs(i8* noundef nonnull %4) #4
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %4) #3
  ret i32 %19
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden void @__block_all_sigs(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__lock(i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__unlock(i32* noundef) local_unnamed_addr #2

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
!3 = !{!4, !9, i64 48}
!4 = !{!"__pthread", !5, i64 0, !5, i64 8, !5, i64 16, !5, i64 24, !8, i64 32, !8, i64 40, !9, i64 48, !9, i64 52, !9, i64 56, !9, i64 60, !6, i64 64, !6, i64 65, !6, i64 66, !6, i64 66, !5, i64 72, !8, i64 80, !5, i64 88, !8, i64 96, !8, i64 104, !5, i64 112, !5, i64 120, !5, i64 128, !10, i64 136, !9, i64 160, !9, i64 164, !5, i64 168, !6, i64 176, !5, i64 184, !5, i64 192}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"long", !6, i64 0}
!9 = !{!"int", !6, i64 0}
!10 = !{!"", !5, i64 0, !8, i64 8, !5, i64 16}
!11 = !{i64 204076}
