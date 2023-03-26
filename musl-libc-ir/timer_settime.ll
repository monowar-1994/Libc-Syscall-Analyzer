; ModuleID = 'src/time/timer_settime.c'
source_filename = "src/time/timer_settime.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.itimerspec = type { %struct.timespec, %struct.timespec }
%struct.timespec = type { i64, i64 }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque

; Function Attrs: nounwind optsize strictfp
define i32 @timer_settime(i8* noundef %0, i32 noundef %1, %struct.itimerspec* noalias noundef %2, %struct.itimerspec* noalias noundef %3) local_unnamed_addr #0 {
  %5 = icmp slt i8* %0, null
  br i1 %5, label %6, label %15

6:                                                ; preds = %4
  %7 = ptrtoint i8* %0 to i64
  %8 = shl i64 %7, 1
  %9 = inttoptr i64 %8 to %struct.__pthread*
  %10 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %9, i64 0, i32 23
  %11 = load volatile i32, i32* %10, align 4, !tbaa !3
  %12 = and i32 %11, 2147483647
  %13 = zext i32 %12 to i64
  %14 = inttoptr i64 %13 to i8*
  br label %15

15:                                               ; preds = %6, %4
  %16 = phi i8* [ %14, %6 ], [ %0, %4 ]
  %17 = ptrtoint i8* %16 to i64
  %18 = sext i32 %1 to i64
  %19 = ptrtoint %struct.itimerspec* %2 to i64
  %20 = ptrtoint %struct.itimerspec* %3 to i64
  %21 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 223, i64 %17, i64 %18, i64 %19, i64 %20) #2, !srcloc !11
  %22 = tail call i64 @__syscall_ret(i64 noundef %21) #3
  %23 = trunc i64 %22 to i32
  ret i32 %23
}

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind strictfp }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !9, i64 164}
!4 = !{!"__pthread", !5, i64 0, !5, i64 8, !5, i64 16, !5, i64 24, !8, i64 32, !8, i64 40, !9, i64 48, !9, i64 52, !9, i64 56, !9, i64 60, !6, i64 64, !6, i64 65, !6, i64 66, !6, i64 66, !5, i64 72, !8, i64 80, !5, i64 88, !8, i64 96, !8, i64 104, !5, i64 112, !5, i64 120, !5, i64 128, !10, i64 136, !9, i64 160, !9, i64 164, !5, i64 168, !6, i64 176, !5, i64 184, !5, i64 192}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"long", !6, i64 0}
!9 = !{!"int", !6, i64 0}
!10 = !{!"", !5, i64 0, !8, i64 8, !5, i64 16}
!11 = !{i64 205352}
