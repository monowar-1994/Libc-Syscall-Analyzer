; ModuleID = 'src/thread/pthread_mutex_consistent.c'
source_filename = "src/thread/pthread_mutex_consistent.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_mutex_t = type { %union.anon }
%union.anon = type { [5 x i8*] }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque

; Function Attrs: nounwind optsize strictfp
define i32 @pthread_mutex_consistent(%struct.pthread_mutex_t* noundef %0) local_unnamed_addr #0 {
  %2 = bitcast %struct.pthread_mutex_t* %0 to [10 x i32]*
  %3 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %4 = load volatile i32, i32* %3, align 4, !tbaa !3
  %5 = and i32 %4, 1073741823
  %6 = bitcast %struct.pthread_mutex_t* %0 to i32*
  %7 = load i32, i32* %6, align 8, !tbaa !3
  %8 = and i32 %7, 4
  %9 = icmp eq i32 %8, 0
  %10 = icmp eq i32 %5, 0
  %11 = select i1 %9, i1 true, i1 %10
  %12 = and i32 %4, 1073741824
  %13 = icmp eq i32 %12, 0
  %14 = select i1 %11, i1 true, i1 %13
  br i1 %14, label %22, label %15

15:                                               ; preds = %1
  %16 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !6
  %17 = inttoptr i64 %16 to %struct.__pthread*
  %18 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %17, i64 0, i32 6
  %19 = load i32, i32* %18, align 8, !tbaa !7
  %20 = icmp eq i32 %5, %19
  br i1 %20, label %21, label %22

21:                                               ; preds = %15
  tail call void asm sideeffect "lock ; and $1, $0", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %3, i32 -1073741825) #2, !srcloc !13
  br label %22

22:                                               ; preds = %15, %1, %21
  %23 = phi i32 [ 0, %21 ], [ 22, %1 ], [ 1, %15 ]
  ret i32 %23
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind readnone strictfp }
attributes #2 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{i64 234273}
!7 = !{!8, !11, i64 48}
!8 = !{!"__pthread", !9, i64 0, !9, i64 8, !9, i64 16, !9, i64 24, !10, i64 32, !10, i64 40, !11, i64 48, !11, i64 52, !11, i64 56, !11, i64 60, !4, i64 64, !4, i64 65, !4, i64 66, !4, i64 66, !9, i64 72, !10, i64 80, !9, i64 88, !10, i64 96, !10, i64 104, !9, i64 112, !9, i64 120, !9, i64 128, !12, i64 136, !11, i64 160, !11, i64 164, !9, i64 168, !4, i64 176, !9, i64 184, !9, i64 192}
!9 = !{!"any pointer", !4, i64 0}
!10 = !{!"long", !4, i64 0}
!11 = !{!"int", !4, i64 0}
!12 = !{!"", !9, i64 0, !10, i64 8, !9, i64 16}
!13 = !{i64 232011}
