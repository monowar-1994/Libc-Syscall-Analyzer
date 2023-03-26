; ModuleID = 'src/time/timer_getoverrun.c'
source_filename = "src/time/timer_getoverrun.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque

; Function Attrs: nounwind optsize strictfp
define i32 @timer_getoverrun(i8* noundef %0) local_unnamed_addr #0 {
  %2 = icmp slt i8* %0, null
  br i1 %2, label %3, label %12

3:                                                ; preds = %1
  %4 = ptrtoint i8* %0 to i64
  %5 = shl i64 %4, 1
  %6 = inttoptr i64 %5 to %struct.__pthread*
  %7 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %6, i64 0, i32 23
  %8 = load volatile i32, i32* %7, align 4, !tbaa !3
  %9 = and i32 %8, 2147483647
  %10 = zext i32 %9 to i64
  %11 = inttoptr i64 %10 to i8*
  br label %12

12:                                               ; preds = %3, %1
  %13 = phi i8* [ %11, %3 ], [ %0, %1 ]
  %14 = ptrtoint i8* %13 to i64
  %15 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 225, i64 %14) #2, !srcloc !11
  %16 = tail call i64 @__syscall_ret(i64 noundef %15) #3
  %17 = trunc i64 %16 to i32
  ret i32 %17
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
!11 = !{i64 203705}
