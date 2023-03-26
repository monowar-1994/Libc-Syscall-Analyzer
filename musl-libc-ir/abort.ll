; ModuleID = 'src/exit/abort.c'
source_filename = "src/exit/abort.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.k_sigaction = type { void (i32)*, i64, void ()*, [2 x i32] }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque

@__abort_lock = external hidden global [1 x i32], align 4

; Function Attrs: noreturn nounwind optsize strictfp
define void @abort() local_unnamed_addr #0 {
  %1 = alloca %struct.k_sigaction, align 8
  %2 = alloca [1 x i64], align 8
  %3 = tail call i32 @raise(i32 noundef 6) #4
  tail call void @__block_all_sigs(i8* noundef null) #4
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @__abort_lock, i64 0, i64 0)) #4
  %4 = bitcast %struct.k_sigaction* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %4, i8 0, i64 32, i1 false) #5
  %5 = ptrtoint %struct.k_sigaction* %1 to i64
  %6 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 13, i64 6, i64 %5, i64 0, i64 8) #6, !srcloc !3
  %7 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #7, !srcloc !4
  %8 = inttoptr i64 %7 to %struct.__pthread*
  %9 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %8, i64 0, i32 6
  %10 = load i32, i32* %9, align 8, !tbaa !5
  %11 = sext i32 %10 to i64
  %12 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 200, i64 %11, i64 6) #6, !srcloc !13
  %13 = getelementptr inbounds [1 x i64], [1 x i64]* %2, i64 0, i64 0
  store i64 32, i64* %13, align 8, !tbaa !14
  %14 = ptrtoint [1 x i64]* %2 to i64
  %15 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 14, i64 1, i64 %14, i64 0, i64 8) #6, !srcloc !3
  call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !15
  %16 = call i32 @raise(i32 noundef 9) #4
  call void @_Exit(i32 noundef 127) #8
  unreachable
}

; Function Attrs: optsize
declare i32 @raise(i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__block_all_sigs(i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__lock(i32* noundef) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noreturn optsize
declare void @_Exit(i32 noundef) local_unnamed_addr #3

attributes #0 = { noreturn nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { noreturn optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { strictfp }
attributes #6 = { nounwind strictfp }
attributes #7 = { nounwind readnone strictfp }
attributes #8 = { nobuiltin noreturn nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 91214}
!4 = !{i64 234870}
!5 = !{!6, !11, i64 48}
!6 = !{!"__pthread", !7, i64 0, !7, i64 8, !7, i64 16, !7, i64 24, !10, i64 32, !10, i64 40, !11, i64 48, !11, i64 52, !11, i64 56, !11, i64 60, !8, i64 64, !8, i64 65, !8, i64 66, !8, i64 66, !7, i64 72, !10, i64 80, !7, i64 88, !10, i64 96, !10, i64 104, !7, i64 112, !7, i64 120, !7, i64 128, !12, i64 136, !11, i64 160, !11, i64 164, !7, i64 168, !8, i64 176, !7, i64 184, !7, i64 192}
!7 = !{!"any pointer", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"long", !8, i64 0}
!11 = !{!"int", !8, i64 0}
!12 = !{!"", !7, i64 0, !10, i64 8, !7, i64 16}
!13 = !{i64 90732}
!14 = !{!10, !10, i64 0}
!15 = !{i64 233922}
