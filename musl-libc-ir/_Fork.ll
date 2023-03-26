; ModuleID = 'src/process/_Fork.c'
source_filename = "src/process/_Fork.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.__sigset_t = type { [16 x i64] }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }

@__abort_lock = external hidden global [1 x i32], align 4
@__thread_list_lock = external hidden global i32, align 4
@__libc = external hidden global %struct.__libc, align 8

@__aio_atfork = weak hidden alias void (i32), void (i32)* @dummy

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal void @dummy(i32 noundef %0) #0 {
  ret void
}

; Function Attrs: nounwind optsize strictfp
define i32 @_Fork() local_unnamed_addr #1 {
  %1 = alloca %struct.__sigset_t, align 8
  %2 = bitcast %struct.__sigset_t* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %2) #4
  call void @__block_all_sigs(i8* noundef nonnull %2) #5
  call void @__aio_atfork(i32 noundef -1) #5
  call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @__abort_lock, i64 0, i64 0)) #5
  %3 = call i64 asm sideeffect "syscall", "={ax},{ax},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 57) #4, !srcloc !3
  %4 = trunc i64 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %19

6:                                                ; preds = %0
  %7 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !4
  %8 = inttoptr i64 %7 to %struct.__pthread*
  %9 = call i64 asm sideeffect "syscall", "={ax},{ax},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 186) #4, !srcloc !3
  %10 = trunc i64 %9 to i32
  %11 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %8, i64 0, i32 6
  store i32 %10, i32* %11, align 8, !tbaa !5
  %12 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %8, i64 0, i32 21, i32 1
  store i64 0, i64* %12, align 8, !tbaa !13
  %13 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %8, i64 0, i32 21, i32 2
  store volatile i8* null, i8** %13, align 8, !tbaa !14
  %14 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %8, i64 0, i32 2
  store %struct.__pthread* %8, %struct.__pthread** %14, align 8, !tbaa !15
  %15 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %8, i64 0, i32 3
  store %struct.__pthread* %8, %struct.__pthread** %15, align 8, !tbaa !16
  store volatile i32 0, i32* @__thread_list_lock, align 4, !tbaa !17
  store i32 0, i32* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 4), align 4, !tbaa !18
  %16 = load volatile i8, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 3), align 1, !tbaa !21
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %19, label %18

18:                                               ; preds = %6
  store volatile i8 -1, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 3), align 1, !tbaa !21
  br label %19

19:                                               ; preds = %6, %18, %0
  call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @__abort_lock, i64 0, i64 0)) #5
  %20 = zext i1 %5 to i32
  call void @__aio_atfork(i32 noundef %20) #5
  call void @__restore_sigs(i8* noundef nonnull %2) #5
  %21 = shl i64 %3, 32
  %22 = ashr exact i64 %21, 32
  %23 = call i64 @__syscall_ret(i64 noundef %22) #5
  %24 = trunc i64 %23 to i32
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %2) #4
  ret i32 %24
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: optsize
declare hidden void @__block_all_sigs(i8* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden void @__lock(i32* noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: optsize
declare hidden void @__unlock(i32* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden void @__restore_sigs(i8* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nounwind readnone strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 98097}
!4 = !{i64 260543}
!5 = !{!6, !11, i64 48}
!6 = !{!"__pthread", !7, i64 0, !7, i64 8, !7, i64 16, !7, i64 24, !10, i64 32, !10, i64 40, !11, i64 48, !11, i64 52, !11, i64 56, !11, i64 60, !8, i64 64, !8, i64 65, !8, i64 66, !8, i64 66, !7, i64 72, !10, i64 80, !7, i64 88, !10, i64 96, !10, i64 104, !7, i64 112, !7, i64 120, !7, i64 128, !12, i64 136, !11, i64 160, !11, i64 164, !7, i64 168, !8, i64 176, !7, i64 184, !7, i64 192}
!7 = !{!"any pointer", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"long", !8, i64 0}
!11 = !{!"int", !8, i64 0}
!12 = !{!"", !7, i64 0, !10, i64 8, !7, i64 16}
!13 = !{!6, !10, i64 144}
!14 = !{!6, !7, i64 152}
!15 = !{!6, !7, i64 16}
!16 = !{!6, !7, i64 24}
!17 = !{!11, !11, i64 0}
!18 = !{!19, !11, i64 4}
!19 = !{!"__libc", !8, i64 0, !8, i64 1, !8, i64 2, !8, i64 3, !11, i64 4, !7, i64 8, !7, i64 16, !10, i64 24, !10, i64 32, !10, i64 40, !10, i64 48, !20, i64 56}
!20 = !{!"__locale_struct", !8, i64 0}
!21 = !{!19, !8, i64 3}
