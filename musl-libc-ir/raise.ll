; ModuleID = 'src/signal/raise.c'
source_filename = "src/signal/raise.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__sigset_t = type { [16 x i64] }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque

; Function Attrs: nounwind optsize strictfp
define i32 @raise(i32 noundef %0) local_unnamed_addr #0 {
  %2 = alloca %struct.__sigset_t, align 8
  %3 = bitcast %struct.__sigset_t* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %3) #3
  call void @__block_app_sigs(i8* noundef nonnull %3) #4
  %4 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #5, !srcloc !3
  %5 = inttoptr i64 %4 to %struct.__pthread*
  %6 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %5, i64 0, i32 6
  %7 = load i32, i32* %6, align 8, !tbaa !4
  %8 = sext i32 %7 to i64
  %9 = sext i32 %0 to i64
  %10 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 200, i64 %8, i64 %9) #3, !srcloc !12
  %11 = call i64 @__syscall_ret(i64 noundef %10) #4
  %12 = trunc i64 %11 to i32
  call void @__restore_sigs(i8* noundef nonnull %3) #4
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %3) #3
  ret i32 %12
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden void @__block_app_sigs(i8* noundef) local_unnamed_addr #2

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
attributes #5 = { nounwind readnone strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 234199}
!4 = !{!5, !10, i64 48}
!5 = !{!"__pthread", !6, i64 0, !6, i64 8, !6, i64 16, !6, i64 24, !9, i64 32, !9, i64 40, !10, i64 48, !10, i64 52, !10, i64 56, !10, i64 60, !7, i64 64, !7, i64 65, !7, i64 66, !7, i64 66, !6, i64 72, !9, i64 80, !6, i64 88, !9, i64 96, !9, i64 104, !6, i64 112, !6, i64 120, !6, i64 128, !11, i64 136, !10, i64 160, !10, i64 164, !6, i64 168, !7, i64 176, !6, i64 184, !6, i64 192}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"long", !7, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = !{!"", !6, i64 0, !9, i64 8, !6, i64 16}
!12 = !{i64 87000}
